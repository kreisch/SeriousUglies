atis_Andersen=ATIS:New("Andersen AFB", 250.2, radio.modulation.AM)
atis_Andersen:SetSRS("C:\\DCS_DATA\\SRS\\", "male", "en-US")
atis_Andersen:SetQueueUpdateTime(45)
atis_Andersen:Start()