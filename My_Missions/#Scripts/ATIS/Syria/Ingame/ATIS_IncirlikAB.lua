atisShirazAb=ATIS:New("Incirlik", 250.40)
atisShirazAb:SetRadioRelayUnitName("ATIS_Incirlik")
atisShirazAb:SetImperialUnits()
atisShirazAb:SetTACAN(21)
atisShirazAb:SetTowerFrequencies({250.350})
atisShirazAb:AddILS(109.30,"5")
atisShirazAb:AddILS(111.70,"23")
atisShirazAb:Start()