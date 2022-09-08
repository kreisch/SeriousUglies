-- Load all needed scripts from here

local baseDir = "H:\\My Drive\\Coding\\KreischGit\\SeriousUglies\\My_Missions\\Syria\\OperationElefant\\"

-- BASE:TraceOn()
-- BASE:TraceClass("CTLD")

assert(loadfile(baseDir .. "ElefantCSAR.lua"))()
assert(loadfile(baseDir .. "ElefantCTLD.lua"))()
assert(loadfile(baseDir .. "Elefant_Airboss.lua"))()
assert(loadfile(baseDir .. "ElefantTankerRespawnConfig.lua"))()
assert(loadfile(baseDir .. "ElefantTestAI.lua"))()
assert(loadfile(baseDir .. "RespawnFactory.lua"))()

trigger.action.outText("All scripts dynamically loaded!", 10, false)


