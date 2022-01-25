function my_ctld:OnAfterCratesBuild(From,Event,To,Group,Unit,Vehicle)
  local vname = Vehicle:GetName()
  local vunit = Vehicle:GetUnit(1)
  local zone = ZONE_UNIT:New(vname,vunit,100)
  my_ctld:AddCTLDZone(vname,CTLD.CargoZoneType.LOAD,SMOKECOLOR.Blue,true,true)
end