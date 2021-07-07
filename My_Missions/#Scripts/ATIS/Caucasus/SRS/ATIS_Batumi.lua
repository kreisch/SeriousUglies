atis_Incirlik=ATIS:New("Batumi", 245.65, radio.modulation.AM)
atis_Incirlik:SetSRS("C:\\DCS_DATA\\SRS\\", "male", "en-US")
atis_Incirlik:SetQueueUpdateTime(45)
atis_Incirlik:Start()