env.info('Arty: Loading')
-- Creat a new ARTY object from a Paladin group.
BlueArtySet=SET_GROUP:New():FilterCoalitions("blue"):FilterCategoryGround():FilterPrefixes({"US_Arty"}):FilterStart()      
BlueArtySet:ForEachGroup(
  --- @param Wrapper.Group#GROUP MooseGroup
  function( MooseGroup ) 
    local artyGroup = MooseGroup
    artyGroup=ARTY:New(GROUP:FindByName(artyGroup:GetName()))
    -- Set the max firing range. A Paladin unit has a range of 20 km.
    artyGroup:SetMaxFiringRange(20)
    artyGroup:SetMarkAssignmentsOn()
    -- Start ARTY process.
    artyGroup:Start()
  end 
)
env.info('Arty: Loaded')