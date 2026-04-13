--- This functionality provides Artillerysupport using Moose.


-- Steps
-- Step1: Initialize available units, check for "#ARTY-TAG" and maybe "#SUPPLY-TAG" in their name and add them to list "ARTY_UNITS"
-- Step2: Use "Event-Spawn" to initialize units which are being created during runtime, add them to list "ARTY_UNITS"
-- Step3: After Step1 and after Step2 check the type of the unit being added and get its RANGE
