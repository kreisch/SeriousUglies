env.info('Arty: Loading')
-- Creat a new ARTY object from a Paladin group.
TomahawkBurke=ARTY:New(GROUP:FindByName("US_BurkeTomahawk"))

-- Set the max firing range. A Paladin unit has a range of 20 km.
TomahawkBurke:SetMaxFiringRange(1300)

TomahawkBurke:SetMarkAssignmentsOn()


-- Start ARTY process.
TomahawkBurke:Start()

env.info('Arty: Loaded')