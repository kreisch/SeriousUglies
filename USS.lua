--- Ugly-Scoring System, USS
-- Heavily stolen of the "Foothold" campaign and modified to suit our squadron needs.


  -- defaultReward - base pay, rewards = {airplane=0, helicopter=0, ground=0, ship=0, structure=0, infantry=0, sam=0, crate=0, rescue=0} - overrides
  function USS:startRewardPlayerContribution(defaultReward, rewards)
    self.playerRewardsOn = true
    self.rewards = rewards
    self.defaultReward = defaultReward
    
    local ev = {}
    ev.context = self
    ev.rewards = rewards
    ev.default = defaultReward
    function ev:onEvent(event)
      local unit = event.initiator
      if unit and unit:getCategory() == Object.Category.UNIT and (unit:getDesc().category == Unit.Category.AIRPLANE or unit:getDesc().category == Unit.Category.HELICOPTER)then
        local side = unit:getCoalition()
        local groupid = unit:getGroup():getID()
        local pname = unit:getPlayerName()
        if pname then
          if (event.id==6) then --pilot ejected
            if self.context.playerContributions[side][pname] ~= nil and self.context.playerContributions[side][pname]>0 then
              local tenp = math.floor(self.context.playerContributions[side][pname]*0.25)
              self.context:addFunds(side, tenp)
              trigger.action.outTextForCoalition(side, '['..pname..'] ejected. +'..tenp..' credits (25% of earnings). Kill statistics lost.', 5)
              self.context:addStat(pname, 'Points', tenp)
              self.context.playerContributions[side][pname] = 0
            end
          end
          
          if (event.id==15) then  -- spawned
            self.context.playerContributions[side][pname] = 0
            self.context:resetTempStats(pname)
          end
          
          if (event.id==28) then --killed unit
            if event.target.getCoalition and side ~= event.target:getCoalition() then
              if self.context.playerContributions[side][pname] ~= nil then
                local earning,message,stat = self.context:objectToRewardPoints2(event.target)
                if earning and message then
                  trigger.action.outTextForGroup(groupid,'['..pname..'] '..message, 5)
                  self.context.playerContributions[side][pname] = self.context.playerContributions[side][pname] + earning
                end
                
                if stat then
                  self.context:addTempStat(pname,stat,1)
                end
              end
            end
          end
          
          if (event.id==4) then --landed
            if self.context.playerContributions[side][pname] and self.context.playerContributions[side][pname] > 0 then
              for i,v in ipairs(self.context:getZones()) do
                if side==v.side and Utils.isInZone(unit, v.zone) then
                  trigger.action.outTextForGroup(groupid, '['..pname..'] landed at '..v.zone..'.\nWait 10 seconds to claim credits...', 5)
                  
                  local claimfunc = function(context, zone, player, unitname)
                    local un = Unit.getByName(unitname)
                    if un and Utils.isInZone(un,zone.zone) and Utils.isLanded(un, true) and un:getPlayerName()==player then
                      if un:getLife() > 0 then
                        context:addFunds(zone.side, context.playerContributions[zone.side][player])
                        trigger.action.outTextForCoalition(zone.side, '['..player..'] redeemed '..context.playerContributions[zone.side][player]..' credits', 5)
                        context:printTempStats(zone.side,player)
                        context:addTempStat(player, 'Points', context.playerContributions[zone.side][player])
                        context:commitTempStats(player)
                        context.playerContributions[zone.side][player] = 0
                        
                        context:saveToDisk() -- save persistance data to enable ending mission after cashing money
                      end
                    end
                  end
                  
                  mist.scheduleFunction(claimfunc, {self.context, v, pname, unit:getName() }, timer.getTime()+10)
                  break
                end
              end
            end
          end
        end
      end
    end
    
    trigger.action.outText("AddingEventHandler for Scoring.", 120)
    world.addEventHandler(ev)
    
    local resetPoints = function(context, side)
      local plys =  coalition.getPlayers(side)
      
      local players = {}
      for i,v in pairs(plys) do
        local nm = v:getPlayerName()
        if nm then
          players[nm] = true
        end
      end

      for i,v in pairs(context.playerContributions[side]) do
        if not players[i] then
          context.playerContributions[side][i] = 0
        end
      end
    end
    
    mist.scheduleFunction(resetPoints, {self, 1}, timer.getTime() + 1, 60)
    mist.scheduleFunction(resetPoints, {self, 2}, timer.getTime() + 1, 60)
  end
  
  
  function USS:objectToRewardPoints2(object) -- returns points,message
    local earning = self.defaultReward
    local message = 'Unit kill +'..earning..' credits'
    local statname = 'Veh'
    
    if object:hasAttribute('Planes') and self.rewards.airplane then
      earning = self.rewards.airplane
      message = 'Aircraft kill +'..earning..' credits'
      statname = 'Air'
    elseif object:hasAttribute('Helicopters') and self.rewards.helicopter then
      earning = self.rewards.helicopter
      message = 'Helicopter kill +'..earning..' credits'
      statname = 'Helo'
    elseif object:hasAttribute('Infantry') and self.rewards.infantry then
      earning = self.rewards.infantry
      message = 'Infantry kill +'..earning..' credits'
      statname = 'Inf'
    elseif (object:hasAttribute('SAM SR') or object:hasAttribute('SAM TR') or object:hasAttribute('IR Guided SAM')) and self.rewards.sam then
      earning = self.rewards.sam
      message = 'SAM kill +'..earning..' credits'
      statname = 'SAM'
    elseif object:hasAttribute('Ships') and self.rewards.ship then
      earning = self.rewards.ship
      message = 'Ship kill +'..earning..' credits'
      statname = 'Ship'
    elseif object:hasAttribute('Ground Units') then
      earning = self.rewards.ground
      message = 'Vehicle kill +'..earning..' credits'
      statname = 'Veh'
    elseif object:hasAttribute('Buildings') and self.rewards.structure then
      earning = self.rewards.structure
      message = 'Structure kill +'..earning..' credits'
      statname = 'Struct'
    else
      return -- object does not have any of the attributes
    end
    
    return earning,message,statname
  end
  
  
  startRewardPlayerContribution(15,{infantry = 10, ground = 20, sam = 40, airplane = 50, ship = 250, helicopter=50, crate=200, rescue = 100})
  
  