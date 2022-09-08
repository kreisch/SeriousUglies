-- Load all needed scripts from here

local baseDir = "H:\\My Drive\\Coding\\KreischGit\\SeriousUglies\\My_Missions\\Syria\\OperationElefant\\"

-- BASE:TraceOn()
-- BASE:TraceClass("CTLD")

assert(loadfile(baseDir .. "ElefantCSAR.lua"))()
assert(loadfile(baseDir .. "ElefantCTLD.lua"))()
assert(loadfile(baseDir .. "Elefant_Airboss.lua"))()
assert(loadfile(baseDir .. "ElefantTankerRespawnConfig.lua"))()
-- Factory must be loaded before control zone handling. Zone handling needs to register groups at the factory.
assert(loadfile(baseDir .. "RespawnFactory.lua"))()
assert(loadfile(baseDir .. "ElefantTestAI.lua"))()

trigger.action.outText("All scripts dynamically loaded!", 10, false)



