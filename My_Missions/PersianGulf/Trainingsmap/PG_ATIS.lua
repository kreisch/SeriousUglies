--atisDubai=ATIS:New(AIRBASE.PersianGulf.Dubai_Intl, 131.7)
--atisDubai:SetRadioRelayUnitName("Radio Relay Dubai Intl")
--atisDubai:SetMetricUnits()
--atisDubai:SetActiveRunway("R")
--atisDubai:SetTowerFrequencies({251.05, 118.75})
--atisDubai:Start()
--
--
--atisAbuDhabi=ATIS:New(AIRBASE.PersianGulf.Abu_Dhabi_International_Airport, 125.1)
--atisAbuDhabi:SetRadioRelayUnitName("Radio Relay Abu Dhabi International Airport")
--atisAbuDhabi:SetMetricUnits()
--atisAbuDhabi:SetActiveRunway("L")
--atisAbuDhabi:SetTowerFrequencies({250.5, 119.2})
--atisAbuDhabi:Start()
--
--
--atisJiroft=ATIS:New(AIRBASE.PersianGulf.Jiroft_Airport, 130)
--atisJiroft:SetMetricUnits()
--atisJiroft:SetTowerFrequencies({250.75, 136})
--atisJiroft:Start()

atisAlAinAB=ATIS:New(AIRBASE.PersianGulf.Al_Ain_International_Airport, 250.65)
atisAlAinAB:SetRadioRelayUnitName("ATIS AlAinAB")
atisAlAinAB:SetImperialUnits()
atisAlAinAB:SetTowerFrequencies({250.600, 150.600})
atisAlAinAB:Start()

atisAlDhafraAb=ATIS:New(AIRBASE.PersianGulf.Al_Dhafra_AB, 350.60)
atisAlDhafraAb:SetRadioRelayUnitName("ATIS AlDhafraAB")
atisAlDhafraAb:SetImperialUnits()
atisAlDhafraAb:SetTowerFrequencies({350.550, 126.800})
atisAlDhafraAb:SetTACAN(96)
atisAlDhafraAb:SetActiveRunway("R")
atisAlDhafraAb:Start()

atisBandarAbbasAB=ATIS:New(AIRBASE.PersianGulf.Bandar_Abbas_Intl, 250.85)
atisBandarAbbasAB:SetRadioRelayUnitName("ATIS BandarAbbasAB")
atisBandarAbbasAB:SetImperialUnits()
atisBandarAbbasAB:SetTACAN(78)
atisBandarAbbasAB:SetTowerFrequencies({250.800, 150.800})
atisBandarAbbasAB:Start()

atisDubaiAB=ATIS:New(AIRBASE.PersianGulf.Dubai_Intl, 251.15)
atisDubaiAB:SetRadioRelayUnitName("ATIS AlAinAB")
atisDubaiAB:SetImperialUnits()
atisDubaiAB:SetTowerFrequencies({251.100, 151.100})
atisDubaiAB:Start()

atisKhasabAB=ATIS:New(AIRBASE.PersianGulf.Khasab, 250.15)
atisKhasabAB:SetRadioRelayUnitName("ATIS KhasabAB")
atisKhasabAB:SetImperialUnits()
atisKhasabAB:SetTowerFrequencies({250.100, 150.100})
atisKhasabAB:Start()

atisLiwaAb=ATIS:New(AIRBASE.PersianGulf.Liwa_Airbase, 250.85)
atisLiwaAb:SetRadioRelayUnitName("ATIS LiwaAB")
atisLiwaAb:SetImperialUnits()
atisLiwaAb:SetTowerFrequencies({250.800, 119.325})
atisLiwaAb:Start()

atisShirazAb=ATIS:New(AIRBASE.PersianGulf.Shiraz_International_Airport, 250.45)
atisShirazAb:SetRadioRelayUnitName("ATIS Shiraz")
atisShirazAb:SetImperialUnits()
atisShirazAb:SetTACAN(94)
atisShirazAb:SetTowerFrequencies({250.400, 150.400})
atisShirazAb:Start()

local airbases=AIRBASE.GetAllAirbases()
for _,_airbase in pairs(airbases) do
  local airbase=_airbase --Wrapper.Airbase#AIRBASE
  airbase:GetRunwayData(nil, true)
end