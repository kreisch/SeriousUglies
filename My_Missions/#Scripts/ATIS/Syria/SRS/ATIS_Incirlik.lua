atis_Incirlik=ATIS:New("Incirlik", 250.4, radio.modulation.AM)
atis_Incirlik:SetSRS("C:\\DCS_DATA\\SRS\\", "male", "en-US")
atis_Incirlik:SetQueueUpdateTime(45)
atis_Incirlik:Start()