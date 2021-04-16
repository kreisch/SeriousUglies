local ExportGroups = SET_GROUP:New():FilterCoalitions( "red" ):FilterCategoryGround():FilterPrefixes("SUP"):FilterActive(true):FilterStart()
  ExportGroups:ForEachGroupAlive(function (grp)
    
    
    end
  )
  
  local ExportGroups = SET_UNIT:FilterCoalitions("red"):FilterCategories("ground"):FilterPrefixes("SUP")