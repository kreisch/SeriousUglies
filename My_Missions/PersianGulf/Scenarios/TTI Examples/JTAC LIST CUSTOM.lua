env.info('JTAC Custom List initializing ...')

JTAC_DRONE = SPAWN:New( "JTAC-MQ" )

JTAC_DRONE_A2GE = SPAWN:New( "JTAC-MQ-A2GEASY" )

JTAC_DRONE_HELO = SPAWN:New( "JTAC-MQ-A2GHELO" )

JTAC_DRONE_HARD = SPAWN:New( "JTAC-MQ-A2GHARD" )

JTAC_DRONE_SAM = SPAWN:New( "JTAC-MQ-A2GSAM" )

jtac_laser_code = 1688

------------------SAM JTACS--------------------------
sam1_spawned = false
sam2_spawned = false
sam3_spawned = false

--SAM1---
function activate_SAM1_jtac()
if sam_site_jtacs_enable == true then
if sam1_spawned == false then
JTAC_DRONE_SAM1 = JTAC_DRONE_SAM:SpawnInZone( SAM1, true )  
JTAC_DRONE_SAM1_NAME = JTAC_DRONE_SAM1:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_SAM1_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_SAM1_NAME, jtac_laser_code, false, "all")
end
env.info("JTAC:  ".. JTAC_DRONE_SAM1_NAME .."  spawned!")
end
sam1_spawned = true
end
end

function destroy_SAM1_jtac()
Group.getByName(JTAC_DRONE_SAM1_NAME):destroy()
env.info("JTAC: " .. JTAC_DRONE_SAM1_NAME .. " destroyed!")
end

--SAM2---
function activate_SAM2_jtac()
if sam_site_jtacs_enable == true then
if sam2_spawned == false then
JTAC_DRONE_SAM2 = JTAC_DRONE_SAM:SpawnInZone( SAM2, true )  
JTAC_DRONE_SAM2_NAME = JTAC_DRONE_SAM2:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_SAM2_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_SAM2_NAME, jtac_laser_code, false, "all")
end
env.info("JTAC:  ".. JTAC_DRONE_SAM2_NAME .."  spawned!")
end
sam2_spawned = true
end
end

function destroy_SAM2_jtac()
Group.getByName(JTAC_DRONE_SAM2_NAME):destroy()
env.info("JTAC: " .. JTAC_DRONE_SAM2_NAME .. " destroyed!")
end

--SAM3---
function activate_SAM3_jtac()
if sam_site_jtacs_enable == true then
if sam3_spawned == false then
JTAC_DRONE_SAM3 = JTAC_DRONE_SAM:SpawnInZone( SAM3, true )  
JTAC_DRONE_SAM3_NAME = JTAC_DRONE_SAM3:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_SAM3_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_SAM3_NAME, jtac_laser_code, false, "all")
end
env.info("JTAC:  ".. JTAC_DRONE_SAM3_NAME .."  spawned!")
end
sam3_spawned = true
end
end

function destroy_SAM3_jtac()
Group.getByName(JTAC_DRONE_SAM3_NAME):destroy()
env.info("JTAC: " .. JTAC_DRONE_SAM3_NAME .. " destroyed!")
end

------------------A2G JTACS---------------------------]
--A2G1---
function activate_A2G1_jtac()
JTAC_DRONE_A2G1 = JTAC_DRONE_HARD:SpawnInZone( AG1, true )  
JTAC_DRONE_A2G1_NAME = JTAC_DRONE_A2G1:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G1_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G1_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G1_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G1_NAME .."  spawned!")
end

function destroy_A2G1_jtac()
Group.getByName(JTAC_DRONE_A2G1_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!")
end
--A2G2---
function activate_A2G2_jtac()
JTAC_DRONE_A2G2 = JTAC_DRONE_HARD:SpawnInZone( AG2, true )  
JTAC_DRONE_A2G2_NAME = JTAC_DRONE_A2G2:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G2_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G2_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G2_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G2_NAME .."  spawned!")
end

function destroy_A2G2_jtac()
Group.getByName(JTAC_DRONE_A2G2_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G2_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G2_NAME .. " destroyed!")
end
--A2G3---
function activate_A2G3_jtac()
JTAC_DRONE_A2G3 = JTAC_DRONE_HARD:SpawnInZone( AG3, true )  
JTAC_DRONE_A2G3_NAME = JTAC_DRONE_A2G3:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G3_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G3_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G3_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G3_NAME .."  spawned!")
end

function destroy_A2G3_jtac()
Group.getByName(JTAC_DRONE_A2G3_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G3_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G3_NAME .. " destroyed!")
end
--A2G4---
function activate_A2G4_jtac()
JTAC_DRONE_A2G4 = JTAC_DRONE_HARD:SpawnInZone( AG4, true )  
JTAC_DRONE_A2G4_NAME = JTAC_DRONE_A2G4:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G4_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G4_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G4_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G4_NAME .."  spawned!")
end

function destroy_A2G4_jtac()
Group.getByName(JTAC_DRONE_A2G4_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G4_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G4_NAME .. " destroyed!")
end
--A2G5---
function activate_A2G5_jtac()
JTAC_DRONE_A2G5 = JTAC_DRONE_HARD:SpawnInZone( AG5, true )  
JTAC_DRONE_A2G5_NAME = JTAC_DRONE_A2G5:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G5_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G5_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G5_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G5_NAME .."  spawned!")
end

function destroy_A2G5_jtac()
Group.getByName(JTAC_DRONE_A2G5_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G5_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G5_NAME .. " destroyed!")
end
--A2G6---
function activate_A2G6_jtac()
JTAC_DRONE_A2G6 = JTAC_DRONE_HARD:SpawnInZone( AG6, true )  
JTAC_DRONE_A2G6_NAME = JTAC_DRONE_A2G6:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G6_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G6_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G6_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G6_NAME .."  spawned!")
end

function destroy_A2G6_jtac()
Group.getByName(JTAC_DRONE_A2G6_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G6_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G6_NAME .. " destroyed!")
end
--A2G7---
function activate_A2G7_jtac()
JTAC_DRONE_A2G7 = JTAC_DRONE_HARD:SpawnInZone( AG7, true )  
JTAC_DRONE_A2G7_NAME = JTAC_DRONE_A2G7:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G7_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G7_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G7_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G7_NAME .."  spawned!")
end

function destroy_A2G7_jtac()
Group.getByName(JTAC_DRONE_A2G7_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G7_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G7_NAME .. " destroyed!")
end
--A2G8---
function activate_A2G8_jtac()
JTAC_DRONE_A2G8 = JTAC_DRONE_HARD:SpawnInZone( AG8, true )  
JTAC_DRONE_A2G8_NAME = JTAC_DRONE_A2G8:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G8_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G8_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G8_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G8_NAME .."  spawned!")
end

function destroy_A2G8_jtac()
Group.getByName(JTAC_DRONE_A2G8_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G8_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G8_NAME .. " destroyed!")
end
--A2G9---
function activate_A2G9_jtac()
JTAC_DRONE_A2G9 = JTAC_DRONE_HARD:SpawnInZone( AG9, true )  
JTAC_DRONE_A2G9_NAME = JTAC_DRONE_A2G9:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G9_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G9_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G9_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G9_NAME .."  spawned!")
end

function destroy_A2G9_jtac()
Group.getByName(JTAC_DRONE_A2G9_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G9_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G9_NAME .. " destroyed!")
end
--A2G10---
function activate_A2G10_jtac()
JTAC_DRONE_A2G10 = JTAC_DRONE_HARD:SpawnInZone( AG10, true )  
JTAC_DRONE_A2G10_NAME = JTAC_DRONE_A2G10:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_A2G10_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_A2G10_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_A2G10_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_A2G10_NAME .."  spawned!")
end

function destroy_A2G10_jtac()
Group.getByName(JTAC_DRONE_A2G10_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G10_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_A2G10_NAME .. " destroyed!")
end

function destroy_A2G_jtacs()
    if trigger.misc.getUserFlag('AG1-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G1_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG2-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G2_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G2_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG3-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G3_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G3_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG4-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G4_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G4_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG5-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G5_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G5_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG6-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G6_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G6_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG7-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G7_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G7_NAME .. " destroyed!")
	end
	    if trigger.misc.getUserFlag('AG8-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G8_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G8_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG9-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G9_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G9_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AG10-Inside') == 1 then
        Group.getByName(JTAC_DRONE_A2G10_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_A2G1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_A2G10_NAME .. " destroyed!")
	end
end

------------------MR JTACS---------------------------]
--MR1---
function activate_MR1_jtac()
JTAC_DRONE_MR1 = JTAC_DRONE_A2GE:SpawnInZone( MR1, true )  
JTAC_DRONE_MR1_NAME = JTAC_DRONE_MR1:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR1_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR1_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR1_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR1_NAME .."  spawned!")
end

function destroy_MR1_jtac()
Group.getByName(JTAC_DRONE_MR1_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!")
end
--MR2---
function activate_MR2_jtac()
JTAC_DRONE_MR2 = JTAC_DRONE_A2GE:SpawnInZone( MR2, true )  
JTAC_DRONE_MR2_NAME = JTAC_DRONE_MR2:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR2_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR2_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR2_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR2_NAME .."  spawned!")
end

function destroy_MR2_jtac()
Group.getByName(JTAC_DRONE_MR2_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR2_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR2_NAME .. " destroyed!")
end
--MR3---
function activate_MR3_jtac()
JTAC_DRONE_MR3 = JTAC_DRONE_A2GE:SpawnInZone( MR3, true )  
JTAC_DRONE_MR3_NAME = JTAC_DRONE_MR3:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR3_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR3_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR3_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR3_NAME .."  spawned!")
end

function destroy_MR3_jtac()
Group.getByName(JTAC_DRONE_MR3_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR3_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR3_NAME .. " destroyed!")
end
--MR4---
function activate_MR4_jtac()
JTAC_DRONE_MR4 = JTAC_DRONE_A2GE:SpawnInZone( MR4, true )  
JTAC_DRONE_MR4_NAME = JTAC_DRONE_MR4:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR4_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR4_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR4_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR4_NAME .."  spawned!")
end

function destroy_MR4_jtac()
Group.getByName(JTAC_DRONE_MR4_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR4_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR4_NAME .. " destroyed!")
end
--MR5---
function activate_MR5_jtac()
JTAC_DRONE_MR5 = JTAC_DRONE_A2GE:SpawnInZone( MR5, true )  
JTAC_DRONE_MR5_NAME = JTAC_DRONE_MR5:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR5_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR5_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR5_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR5_NAME .."  spawned!")
end

function destroy_MR5_jtac()
Group.getByName(JTAC_DRONE_MR5_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR5_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR5_NAME .. " destroyed!")
end
--MR6---
function activate_MR6_jtac()
JTAC_DRONE_MR6 = JTAC_DRONE_A2GE:SpawnInZone( MR6, true )  
JTAC_DRONE_MR6_NAME = JTAC_DRONE_MR6:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR6_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR6_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR6_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR6_NAME .."  spawned!")
end

function destroy_MR6_jtac()
Group.getByName(JTAC_DRONE_MR6_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR6_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR6_NAME .. " destroyed!")
end
--MR7---
function activate_MR7_jtac()
JTAC_DRONE_MR7 = JTAC_DRONE_A2GE:SpawnInZone( MR7, true )  
JTAC_DRONE_MR7_NAME = JTAC_DRONE_MR7:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR7_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR7_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR7_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR7_NAME .."  spawned!")
end

function destroy_MR7_jtac()
Group.getByName(JTAC_DRONE_MR7_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR7_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR7_NAME .. " destroyed!")
end
--MR8---
function activate_MR8_jtac()
JTAC_DRONE_MR8 = JTAC_DRONE_A2GE:SpawnInZone( MR8, true )  
JTAC_DRONE_MR8_NAME = JTAC_DRONE_MR8:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR8_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR8_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR8_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR8_NAME .."  spawned!")
end

function destroy_MR8_jtac()
Group.getByName(JTAC_DRONE_MR8_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR8_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR8_NAME .. " destroyed!")
end
--MR9---
function activate_MR9_jtac()
JTAC_DRONE_MR9 = JTAC_DRONE_A2GE:SpawnInZone( MR9, true )  
JTAC_DRONE_MR9_NAME = JTAC_DRONE_MR9:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR9_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR9_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR9_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR9_NAME .."  spawned!")
end

function destroy_MR9_jtac()
Group.getByName(JTAC_DRONE_MR9_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR9_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR9_NAME .. " destroyed!")
end
--MR10---
function activate_MR10_jtac()
JTAC_DRONE_MR10 = JTAC_DRONE_A2GE:SpawnInZone( MR10, true )  
JTAC_DRONE_MR10_NAME = JTAC_DRONE_MR10:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_MR10_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_MR10_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_MR10_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_MR10_NAME .."  spawned!")
end

function destroy_MR10_jtac()
Group.getByName(JTAC_DRONE_MR10_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR10_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_MR10_NAME .. " destroyed!")
end

function destroy_MR_jtacs()
    if trigger.misc.getUserFlag('MR1-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR1_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR2-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR2_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR2_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR3-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR3_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR3_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR4-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR4_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR4_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR5-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR5_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR5_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR6-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR6_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR6_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR7-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR7_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR7_NAME .. " destroyed!")
	end
	    if trigger.misc.getUserFlag('MR8-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR8_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR8_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR9-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR9_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR9_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('MR10-Inside') == 1 then
        Group.getByName(JTAC_DRONE_MR10_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_MR1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_MR10_NAME .. " destroyed!")
	end
end

------------------AGH JTACS---------------------------]
--AGH1---
function activate_AGH1_jtac()
JTAC_DRONE_AGH1 = JTAC_DRONE_HELO:SpawnInZone( AGH1, true )  
JTAC_DRONE_AGH1_NAME = JTAC_DRONE_AGH1:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH1_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH1_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH1_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH1_NAME .."  spawned!")
end

function destroy_AGH1_jtac()
Group.getByName(JTAC_DRONE_AGH1_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!")
end
--AGH2---
function activate_AGH2_jtac()
JTAC_DRONE_AGH2 = JTAC_DRONE_HELO:SpawnInZone( AGH2, true )  
JTAC_DRONE_AGH2_NAME = JTAC_DRONE_AGH2:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH2_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH2_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH2_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH2_NAME .."  spawned!")
end

function destroy_AGH2_jtac()
Group.getByName(JTAC_DRONE_AGH2_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH2_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH2_NAME .. " destroyed!")
end
--AGH3---
function activate_AGH3_jtac()
JTAC_DRONE_AGH3 = JTAC_DRONE_HELO:SpawnInZone( AGH3, true )  
JTAC_DRONE_AGH3_NAME = JTAC_DRONE_AGH3:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH3_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH3_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH3_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH3_NAME .."  spawned!")
end

function destroy_AGH3_jtac()
Group.getByName(JTAC_DRONE_AGH3_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH3_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH3_NAME .. " destroyed!")
end
--AGH4---
function activate_AGH4_jtac()
JTAC_DRONE_AGH4 = JTAC_DRONE_HELO:SpawnInZone( AGH4, true )  
JTAC_DRONE_AGH4_NAME = JTAC_DRONE_AGH4:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH4_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH4_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH4_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH4_NAME .."  spawned!")
end

function destroy_AGH4_jtac()
Group.getByName(JTAC_DRONE_AGH4_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH4_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH4_NAME .. " destroyed!")
end
--AGH5---
function activate_AGH5_jtac()
JTAC_DRONE_AGH5 = JTAC_DRONE_HELO:SpawnInZone( AGH5, true )  
JTAC_DRONE_AGH5_NAME = JTAC_DRONE_AGH5:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH5_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH5_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH5_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH5_NAME .."  spawned!")
end

function destroy_AGH5_jtac()
Group.getByName(JTAC_DRONE_AGH5_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH5_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH5_NAME .. " destroyed!")
end

function destroy_A2GH_jtacs()
    if trigger.misc.getUserFlag('AGH1-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH1_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH2-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH2_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH2_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH3-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH3_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH3_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH4-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH4_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH4_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH5-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH5_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH5_NAME .. " destroyed!")
	end
end

--INF JTACS
--AGH6---
function activate_AGH6_jtac()
JTAC_DRONE_AGH6 = JTAC_DRONE_HELO:SpawnInZone( AGH6, true )  
JTAC_DRONE_AGH6_NAME = JTAC_DRONE_AGH6:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH6_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH6_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH6_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH6_NAME .."  spawned!")
end

function destroy_AGH6_jtac()
Group.getByName(JTAC_DRONE_AGH6_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH6_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH6_NAME .. " destroyed!")
end
--AGH7---
function activate_AGH7_jtac()
JTAC_DRONE_AGH7 = JTAC_DRONE_HELO:SpawnInZone( AGH7, true )  
JTAC_DRONE_AGH7_NAME = JTAC_DRONE_AGH7:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH7_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH7_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH7_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH7_NAME .."  spawned!")
end

function destroy_AGH7_jtac()
Group.getByName(JTAC_DRONE_AGH7_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH7_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH7_NAME .. " destroyed!")
end
--AGH8---
function activate_AGH8_jtac()
JTAC_DRONE_AGH8 = JTAC_DRONE_HELO:SpawnInZone( AGH8, true )  
JTAC_DRONE_AGH8_NAME = JTAC_DRONE_AGH8:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH8_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH8_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH8_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH8_NAME .."  spawned!")
end

function destroy_AGH8_jtac()
Group.getByName(JTAC_DRONE_AGH8_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH8_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH8_NAME .. " destroyed!")
end
--AGH9---
function activate_AGH9_jtac()
JTAC_DRONE_AGH9 = JTAC_DRONE_HELO:SpawnInZone( AGH9, true )  
JTAC_DRONE_AGH9_NAME = JTAC_DRONE_AGH9:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH9_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH9_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH9_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH9_NAME .."  spawned!")
end

function destroy_AGH9_jtac()
Group.getByName(JTAC_DRONE_AGH9_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH9_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH9_NAME .. " destroyed!")
end
--AGH10---
function activate_AGH10_jtac()
JTAC_DRONE_AGH10 = JTAC_DRONE_HELO:SpawnInZone( AGH10, true )  
JTAC_DRONE_AGH10_NAME = JTAC_DRONE_AGH10:GetName()

if jtac_smoke_targets == true then
JTACAutoLase(JTAC_DRONE_AGH10_NAME, jtac_laser_code, true, "all")
end

if jtac_smoke_targets == false then
JTACAutoLase(JTAC_DRONE_AGH10_NAME, jtac_laser_code, false, "all")
end
--trigger.action.outText( "JTAC:  ".. JTAC_DRONE_AGH10_NAME .."  spawned!", 100)
env.info("JTAC:  ".. JTAC_DRONE_AGH10_NAME .."  spawned!")
end

function destroy_AGH10_jtac()
Group.getByName(JTAC_DRONE_AGH10_NAME):destroy()
--trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH10_NAME .. " destroyed!", 100)
env.info("JTAC: " .. JTAC_DRONE_AGH10_NAME .. " destroyed!")
end

function destroy_A2GHIA_jtacs()
    if trigger.misc.getUserFlag('AGH6-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH6_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH6_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH7-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH7_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH7_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH8-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH8_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH8_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH9-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH9_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH9_NAME .. " destroyed!")
	end
    if trigger.misc.getUserFlag('AGH10-Inside') == 1 then
        Group.getByName(JTAC_DRONE_AGH10_NAME):destroy()
        --trigger.action.outText( "JTAC: " .. JTAC_DRONE_AGH1_NAME .. " destroyed!", 100)
        env.info("JTAC: " .. JTAC_DRONE_AGH10_NAME .. " destroyed!")
	end
end

if enable_jtac_drones == true then

if jtac_smoke_targets == true then
trigger.action.outText("JTACs are set to SMOKE LASED TARGETS\n\nThese settings are configurable in the MISSION EDITOR. Check out the settings config tutorial text file that came with the mission for more details!", 10)
end

if jtac_smoke_targets == false then
trigger.action.outText("JTACs are set to NOT SMOKE LASED TARGETS\n\nThese settings are configurable in the MISSION EDITOR. Check out the settings config tutorial text file that came with the mission for more details!", 10)
end
else
trigger.action.outText("JTAC Drones are DISABLED and will not spawn at ground missions!", 10)

end


-- ctld.activatePickupZone("pickzone1")