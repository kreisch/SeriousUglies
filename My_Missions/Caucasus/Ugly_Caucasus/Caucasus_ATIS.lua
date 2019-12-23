atisBatumi=ATIS:New(AIRBASE.Caucasus.Batumi, 260.15)
atisBatumi:SetRadioRelayUnitName("ATIS Batumi")
atisBatumi:SetTowerFrequencies({260.100, 131.100})
atisBatumi:SetImperialUnits()
atisBatumi:SetTACAN(16)
atisBatumi:Start()

atisKutaisi=ATIS:New(AIRBASE.Caucasus.Kutaisi, 264.15)
atisKutaisi:SetRadioRelayUnitName("ATIS Kutaisi")
atisKutaisi:SetTowerFrequencies({264.100, 134.100})
atisKutaisi:SetImperialUnits()
atisKutaisi:SetTACAN(44)
atisKutaisi:Start()

atisKobuleti=ATIS:New(AIRBASE.Caucasus.Kobuleti, 263.15)
atisKobuleti:SetRadioRelayUnitName("ATIS Kobuleti")
atisKobuleti:SetTowerFrequencies({263.100, 133.100})
atisKobuleti:SetImperialUnits()
atisKobuleti:SetTACAN(67)
atisKobuleti:Start()

atisNalchik=ATIS:New(AIRBASE.Caucasus.Nalchik, 265.15)
atisNalchik:SetRadioRelayUnitName("ATIS Nalchik")
atisNalchik:SetTowerFrequencies({265.100, 165.100})
atisNalchik:SetImperialUnits()
atisNalchik:Start()

atisSenakiKolkhi=ATIS:New(AIRBASE.Caucasus.Senaki_Kolkhi, 261.15)
atisSenakiKolkhi:SetRadioRelayUnitName("ATIS SenakiKolkhi")
atisSenakiKolkhi:SetTowerFrequencies({261.100, 132.100})
atisSenakiKolkhi:SetImperialUnits()
atisSenakiKolkhi:SetTACAN(31)
atisSenakiKolkhi:Start()

atisSukhumiBabu=ATIS:New(AIRBASE.Caucasus.Sukhumi_Babushara, 258.25)
atisSukhumiBabu:SetRadioRelayUnitName("ATIS SukhumiBabu")
atisSukhumiBabu:SetTowerFrequencies({258.200, 129.200})
atisSukhumiBabu:SetImperialUnits()
atisSukhumiBabu:Start()

local airbases=AIRBASE.GetAllAirbases()
for _,_airbase in pairs(airbases) do
  local airbase=_airbase --Wrapper.Airbase#AIRBASE
  airbase:GetRunwayData(nil, true)
end
