env.info('Arty: Loading')
-- Creat a new ARTY object from a Paladin group.
Paladin1=ARTY:New(GROUP:FindByName("US_Arty_Paladin1"))

-- Set the max firing range. A Paladin unit has a range of 20 km.
Paladin1:SetMaxFiringRange(20)
Paladin1:SetMarkAssignmentsOn()
-- Start ARTY process.
Paladin1:Start()

env.info('Arty: Loaded')