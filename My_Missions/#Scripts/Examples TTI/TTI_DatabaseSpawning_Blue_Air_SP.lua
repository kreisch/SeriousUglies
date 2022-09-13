env.info("TTI - Database Blue Air Spawner Initializing...")

if mission_era == "ww2" then
BlueAirRouteAltitude = 2000 --default altitude for all fixed wing aircraft red or blue
else
BlueAirRouteAltitude = 8000 --default altitude for all fixed wing aircraft red or blue
end
local HeloRouteAltitude = 2000 -- default alittude for all rotary aircraft red or blue

local BlueTempUsaAir = {}
local BlueTempTrainerAir = {}
local BlueTempInternationalAir = {}
local BlueTempKoreanWar = {}
local BlueTempWw2Air = {}
local BlueTempWw2PaidAir = {}
local BlueTempAntiShipAir = {}
local BlueTempBomberAir = {}
local BlueTempHeloAir = {}

local BlueTempRatAir = {}
local BlueTempRatHeloAir = {}
local BlueTempAirbossAir = {}
local BlueTempAirbossHeloAir = {}

local BlueTempUsaInd = 0
local BlueTempTrainerInd = 0
local BlueTempInternationalInd = 0
local BlueTempKoreanWarInd = 0
local BlueTempWw2Ind = 0
local BlueTempWw2PaidInd = 0
local BlueTempAntiShipInd = 0
local BlueTempBomberInd = 0
local BlueTempHeloInd = 0

local BlueTempRatInd = 0
local BlueTempRatHeloInd = 0
local BlueTempAirbossInd = 0
local BlueTempAirbossHeloInd = 0


local SpawnTempsUsaBlueAir = {
       [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FA-18C_hornet",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f18",
                            ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-115 - AIM-7M}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{LAU-115 - AIM-7M}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FA-18C_hornet",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f18",
                            ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-115 - AIM-7M}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{LAU-115 - AIM-7M}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f18",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-4E",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f4",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
                                                }, -- end of [2]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-4E",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f4",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
                                                }, -- end of [2]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{773675AB-7C29-422f-AFD8-32844A7B7F17}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f4",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14A-135-GR",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f14a",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-7 - AIM-9L}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{BELLY AIM-7F}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14A-135-GR",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f14a",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-7 - AIM-9L}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{BELLY AIM-7F}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f14a",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-15C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f15",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{AIM-7F}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM-7F}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                                                }, -- end of [8]
                                                [11] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [11]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-15C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f15",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{AIM-7F}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM-7F}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{C8E06185-7CD6-4C90-959F-044679E90751}",
                                                }, -- end of [8]
                                                [11] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [11]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f15",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [5] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-16C_50",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f16",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-16C_50",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f16",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{8A0BE8AE-58D4-4572-9263-3144C0D06364}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{5CE2FF2A-645A-4197-B48D-8720AC69394F}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{40EF17B7-F508-45de-8566-6FFECC0C1AB8}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f16",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [6] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f14b",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-7 - AIM-9M}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{BELLY AIM-7M}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f14b",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{LAU-7 - AIM-9M}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{BELLY AIM-7M}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM_54A_Mk47}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{F14-300gal}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{LAU-138 wtip - AIM-9L}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f14b",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  
       [7] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f5",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{AIM-9B}",
                                                }, -- end of [1]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM-9B}",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f5",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{AIM-9B}",
                                                }, -- end of [1]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{PTB-150GAL}",
                                                }, -- end of [5]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{AIM-9B}",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
											
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
              },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f5",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  

}

local SpawnTempsTrainerBlueAir = {
       [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "L-39ZA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [1]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [5]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "L-39ZA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [1]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [5]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_l39",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  
       [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "C-101CC",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_c101",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [7]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{C-101-DEFA553}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "C-101CC",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_c101",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [1]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [7]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{C-101-DEFA553}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_c101",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

local SpawnTempsInternationalBlueAir = {
		[1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su27",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [4]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [10]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su27",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [4]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [10]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_su27",
                ["communication"] = true,
                ["lateActivation"] = true,
             
        },
		[2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su30",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su30",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [8]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [10]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_su30",
                ["communication"] = true,
                ["lateActivation"] = true,
              
  },
		[3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-33",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su33",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [4]
                                                [11] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [11]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                                                }, -- end of [10]
                                                [12] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [12]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-33",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_su33",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82F}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [4]
                                                [11] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [11]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{B79C379A-9E87-4E50-A1EE-7F7E29C2E87A}",
                                                }, -- end of [10]
                                                [12] = 
                                                {
                                                    ["CLSID"] = "{44EE8698-89F9-48EE-AF36-5FD31896A82A}",
                                                }, -- end of [12]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [9]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_su33",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

		[4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "J-11A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_j11",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [3]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "J-11A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_j11",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [3]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [9]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{E8069896-8435-4B90-95C0-01A03AE6E400}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_j11",
                ["communication"] = true,
                ["lateActivation"] = true,
               },
     
		[5] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "JF-17",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "DIS_PL-5EII",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "DIS_SD-10",
                                                }, -- end of [2]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "DIS_TANK800",
                                                }, -- end of [4]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "DIS_SD-10",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "DIS_PL-5EII",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "JF-17",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_jf17",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "DIS_PL-5EII",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "DIS_SD-10",
                                                }, -- end of [2]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "DIS_TANK800",
                                                }, -- end of [4]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "DIS_SD-10",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "DIS_PL-5EII",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_jf17",
                ["communication"] = true,
                ["lateActivation"] = true,
              
       },
		[6] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-25PD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig25",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-25PD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig25",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{5F26DBC2-FB43-4153-92DE-6BBCE26CB0FF}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig25",
                ["communication"] = true,
                ["lateActivation"] = true,
              
      },
		[7] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29S",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig29s",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29S",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig29s",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [3]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{B4C01D60-A8A3-4237-BD72-CA7655BC0FE9}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{FBC29BFE-3D24-4C64-B81D-941239D12249}",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig29s",
                ["communication"] = true,
                ["lateActivation"] = true,
              
       },
		[8] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-23MLD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig23",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-23MLD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig23",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{A5BAEAB7-6FAF-4236-AF72-0FD900F493F9}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{CCF898C9-5BC7-49A4-9D1E-C3ED3D5166A1}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig23",
                ["communication"] = true,
                ["lateActivation"] = true,
              
       },
		[9] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "M-2000C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_m2000",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{Matra_S530D}",
                                                }, -- end of [8]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{Matra_S530D}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{MMagicII}",
                                                }, -- end of [9]
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{MMagicII}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "M-2000C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_m2000",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{Matra_S530D}",
                                                }, -- end of [8]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{Matra_S530D}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{MMagicII}",
                                                }, -- end of [9]
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{MMagicII}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_m2000",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

		[10] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Mirage 2000-5",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_m20005",
                                       ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{FC23864E-3B80-48E3-9C03-4DA8B1D7497B}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FD21B13E-57F3-4C2A-9F78-C522D0B5BCE1}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FC23864E-3B80-48E3-9C03-4DA8B1D7497B}",
                                                }, -- end of [9]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{FD21B13E-57F3-4C2A-9F78-C522D0B5BCE1}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Mirage 2000-5",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_m20005",
                                       ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{FC23864E-3B80-48E3-9C03-4DA8B1D7497B}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FD21B13E-57F3-4C2A-9F78-C522D0B5BCE1}",
                                                }, -- end of [2]
                                                [9] = 
                                                {
                                                    ["CLSID"] = "{FC23864E-3B80-48E3-9C03-4DA8B1D7497B}",
                                                }, -- end of [9]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{FD21B13E-57F3-4C2A-9F78-C522D0B5BCE1}",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_m20005",
                ["communication"] = true,
                ["lateActivation"] = true,
               },
       
		[11] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig29a",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig29a",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{2BEC576B-CDF5-4B7F-961F-B0FA4312B841}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{9B25D316-0434-4954-868F-D51DB1A38DF0}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{682A481F-0CB5-4693-A382-D00DD4A156D7}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "<CLEAN>",
                                                }, -- end of [7]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig29a",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

		[12] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-31",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig31",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
                                                }, -- end of [2]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-31",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig31",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
                                                }, -- end of [2]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{F1243568-8EF0-49D4-9CB5-4DA90D92BC1D}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{4EDBA993-2E34-444C-95FB-549300BF7CAF}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig31",
                ["communication"] = true,
                ["lateActivation"] = true,
              
        },
		[13] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-21Bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig21",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{PTB_490_MIG21}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{R-3R}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{SPS-141-100}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{PTB_490_MIG21}",
                                                }, -- end of [5]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                         [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-21Bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig21",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{PTB_490_MIG21}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{R-3R}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{SPS-141-100}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{R-3S}",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{PTB_490_MIG21}",
                                                }, -- end of [5]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig21",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

 
}

local SpawnTempsKoreanWarBlueAir = {

       [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-15bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig15",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-15bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig15",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig15",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-19P",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig19",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{K-13A}",
                                                }, -- end of [1]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{K-13A}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-19P",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_mig19",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{K-13A}",
                                                }, -- end of [1]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{K-13A}",
                                                }, -- end of [6]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mig19",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-86F Sabre",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f86",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-86F Sabre",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_f86",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_f86",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

local SpawnTempsWw2BlueAir = {

       [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "SpitfireLFMkIX",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_spitfire",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "SpitfireLFMkIX",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_spitfire",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_spitfire",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-51D-30-NA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_p51",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-51D-30-NA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_p51",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_p51",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-47D-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_p47",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-47D-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_p47",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_p47",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Bf-109K-4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_bf109",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Bf-109K-4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_bf109",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_bf109",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [5] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FW-190D9",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_fw190",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FW-190D9",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_fw190",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_fw190",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

       [6] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "I-16",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_i16",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },
                            
                    [2] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "I-16",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_i16",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 2,
                                             ["name"] = "Springfield22" },
                            ["onboard_num"] = "022" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_i16",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
 [7] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
							["AddPropAircraft"] = 
                            {
                                ["ResinLights"] = 0.15,
                                ["SoloFlight"] = false,
                            }, -- end of ["AddPropAircraft"]
                            ["type"] = "MosquitoFBMkVI",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_mosquito",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

local SpawnTempsWw2PaidBlueAir = {
       [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
				["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Ju-88A4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "SC_501_SC500",
                                                }, -- end of [1]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "SC_501_SC500",
                                                }, -- end of [3]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 2120,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_bombing_ju88a4",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
       [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-17G",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_bombing_b1b",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{12xM64}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 7600,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_bombing_b17g",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
       [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
				["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Ju-88A4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 2120,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_ju88a4",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
       [4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAP",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-17G",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_bombing_b1b",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 7600,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_cap_b17g",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
}

local SpawnTempsAntiShipBlueAir = {

[1] =  {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Antiship Strike",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 251.80555555556,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["number"] = 1,
                                                            ["key"] = "AntiShip",
                                                            ["id"] = "EngageTargets",
                                                            ["enabled"] = true,
                                                            ["auto"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "Ships",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "blue_antiship_tu22m3",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 664,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "af standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 251.80555555556,
                                        ["type"] = "Tu-22M3",
                                        ["unitId"] = 1326,
                                        ["psi"] = 0,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "blue_antiship_tu22m3",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
                                                }, -- end of [1]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
                                                }, -- end of [5]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{12429ECF-03F0-4DF6-BCBD-5D38B6343DE1}",
                                                }, -- end of [3]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "50000",
                                            ["flare"] = 48,
                                            ["chaff"] = 48,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Colt11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "blue_antiship_tu22m3",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [67]

[2] = {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Antiship Strike",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 205.55555555556,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["number"] = 1,
                                                            ["key"] = "AntiShip",
                                                            ["id"] = "EngageTargets",
                                                            ["enabled"] = true,
                                                            ["auto"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "Ships",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 588937.60843905,
                                            ["x"] = 54904.28570972,
                                            ["name"] = "blue_antiship_tu42",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 671,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "af standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 205.55555555556,
                                        ["type"] = "Tu-142",
                                        ["unitId"] = 1333,
                                        ["psi"] = 0,
                                        ["y"] = 588937.60843905,
                                        ["x"] = 54904.28570972,
                                        ["name"] = "blue_antiship_tu42",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{C42EE4C3-355C-4B83-8B22-B39430B8F4AE}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "87000",
                                            ["flare"] = 48,
                                            ["chaff"] = 48,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Colt11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 588937.60843905,
                                ["x"] = 54904.28570972,
                                ["name"] = "blue_antiship_tu42",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [66]							

[3] = {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Antiship Strike",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 226.11111111111,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["number"] = 1,
                                                            ["key"] = "AntiShip",
                                                            ["id"] = "EngageTargets",
                                                            ["enabled"] = true,
                                                            ["auto"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "Ships",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["number"] = 2,
                                                            ["auto"] = true,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "EPLRS",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["groupId"] = 27,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 589038.2903275,
                                            ["x"] = 54747.669438811,
                                            ["name"] = "blue_antiship_b52",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 672,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 226.11111111111,
                                        ["type"] = "B-52H",
                                        ["unitId"] = 1334,
                                        ["psi"] = 0,
                                        ["y"] = 589038.2903275,
                                        ["x"] = 54747.669438811,
                                        ["name"] = "blue_antiship_b52",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{46ACDCF8-5451-4E26-BDDB-E78D5830E93C}",
                                                }, -- end of [2]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "141135",
                                            ["flare"] = 192,
                                            ["chaff"] = 1125,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Colt11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 589038.2903275,
                                ["x"] = 54747.669438811,
                                ["name"] = "blue_antiship_b52",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [65]
}

local SpawnTempsBomberBlueAir = {

		[1] = {
			["lateActivation"] = true,
			["tasks"] = 
			{
			}, -- end of ["tasks"]
			["radioSet"] = false,
			["task"] = "Ground Attack",
			["uncontrolled"] = false,
			["taskSelected"] = true,
			["route"] = 
			{
				["routeRelativeTOT"] = true,
				["points"] = 
				{
					[1] = 
					{
						["alt"] = 9753.6,
						["action"] = "Turning Point",
						["alt_type"] = "BARO",
						["properties"] = 
						{
							["addopt"] = 
							{
							}, -- end of ["addopt"]
						}, -- end of ["properties"]
						["speed"] = 251.80555555556,
						["task"] = 
						{
							["id"] = "ComboTask",
							["params"] = 
							{
								["tasks"] = 
								{
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["type"] = "Turning Point",
						["ETA"] = 0,
						["ETA_locked"] = true,
						["y"] = 584619.47411255,
						["x"] = 55105.649486604,
						["name"] = "blue_bombing_tu22m3",
						["formation_template"] = "",
						["speed_locked"] = true,
					}, -- end of [1]
				}, -- end of ["points"]
			}, -- end of ["route"]
			["groupId"] = 665,
			["hidden"] = false,
			["units"] = 
			{
				[1] = 
				{
					["alt"] = 9753.6,
					["hardpoint_racks"] = true,
					["alt_type"] = "BARO",
					["livery_id"] = "af standard",
					["skill"] = blue_ai_aircraft_skill,
					["speed"] = 251.80555555556,
					["type"] = "Tu-22M3",
					["unitId"] = 1327,
					["psi"] = 0,
					["y"] = 584619.47411255,
					["x"] = 55105.649486604,
					["name"] = "blue_bombing_tu22m3",
					["payload"] = 
					{
						["pylons"] = 
						{
							[1] = 
							{
								["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
							}, -- end of [1]
							[2] = 
							{
								["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
							}, -- end of [2]
							[3] = 
							{
								["CLSID"] = "{BDAD04AA-4D4A-4E51-B958-180A89F963CF}",
							}, -- end of [3]
							[4] = 
							{
								["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
							}, -- end of [4]
							[5] = 
							{
								["CLSID"] = "{E1AAE713-5FC3-4CAA-9FF5-3FDCFB899E33}",
							}, -- end of [5]
						}, -- end of ["pylons"]
						["fuel"] = "50000",
						["flare"] = 48,
						["chaff"] = 48,
						["gun"] = 100,
					}, -- end of ["payload"]
					["heading"] = 1.3379825136882,
					["callsign"] = 
					{
						[1] = 3,
						[2] = 1,
						[3] = 1,
						["name"] = "Uzi11",
					}, -- end of ["callsign"]
					["onboard_num"] = "555685",
				}, -- end of [1]
			}, -- end of ["units"]
			["y"] = 584619.47411255,
			["x"] = 55105.649486604,
			["name"] = "blue_bombing_tu22m3",
			["communication"] = true,
			["start_time"] = 0,
			["modulation"] = 0,
			["frequency"] = 251,
		}, -- end of [71]
		
		[2] =	{
			["lateActivation"] = true,
			["tasks"] = 
			{
			}, -- end of ["tasks"]
			["radioSet"] = false,
			["task"] = "Ground Attack",
			["uncontrolled"] = false,
			["taskSelected"] = true,
			["route"] = 
			{
				["routeRelativeTOT"] = true,
				["points"] = 
				{
					[1] = 
					{
						["alt"] = 9753.6,
						["action"] = "Turning Point",
						["alt_type"] = "BARO",
						["properties"] = 
						{
							["addopt"] = 
							{
							}, -- end of ["addopt"]
						}, -- end of ["properties"]
						["speed"] = 215.83333333333,
						["task"] = 
						{
							["id"] = "ComboTask",
							["params"] = 
							{
								["tasks"] = 
								{
									[1] = 
									{
										["number"] = 1,
										["auto"] = true,
										["id"] = "WrappedAction",
										["enabled"] = true,
										["params"] = 
										{
											["action"] = 
											{
												["id"] = "EPLRS",
												["params"] = 
												{
													["value"] = true,
													["groupId"] = 24,
												}, -- end of ["params"]
											}, -- end of ["action"]
										}, -- end of ["params"]
									}, -- end of [1]
								}, -- end of ["tasks"]
							}, -- end of ["params"]
						}, -- end of ["task"]
						["type"] = "Turning Point",
						["ETA"] = 0,
						["ETA_locked"] = true,
						["y"] = 584630.66098904,
						["x"] = 54960.220092188,
						["name"] = "blue_bombing_b1b",
						["formation_template"] = "",
						["speed_locked"] = true,
					}, -- end of [1]
				}, -- end of ["points"]
			}, -- end of ["route"]
			["groupId"] = 666,
			["hidden"] = false,
			["units"] = 
			{
				[1] = 
				{
					["alt"] = 9753.6,
					["hardpoint_racks"] = true,
					["alt_type"] = "BARO",
					["skill"] = blue_ai_aircraft_skill,
					["speed"] = 215.83333333333,
					["type"] = "B-1B",
					["unitId"] = 1328,
					["psi"] = 0,
					["y"] = 584630.66098904,
					["x"] = 54960.220092188,
					["name"] = "blue_bombing_b1b",
					["payload"] = 
					{
						["pylons"] = 
						{
							[1] = 
							{
								["CLSID"] = "MK_82*28",
							}, -- end of [1]
							[2] = 
							{
								["CLSID"] = "MK_82*28",
							}, -- end of [2]
							[3] = 
							{
								["CLSID"] = "MK_82*28",
							}, -- end of [3]
						}, -- end of ["pylons"]
						["fuel"] = "88450",
						["flare"] = 30,
						["chaff"] = 60,
						["gun"] = 100,
					}, -- end of ["payload"]
					["heading"] = 1.3379825136882,
					["callsign"] = 
					{
						[1] = 3,
						[2] = 1,
						[3] = 1,
						["name"] = "Uzi11",
					}, -- end of ["callsign"]
					["onboard_num"] = "555685",
				}, -- end of [1]
			}, -- end of ["units"]
			["y"] = 584630.66098904,
			["x"] = 54960.220092188,
			["name"] = "blue_bombing_b1b",
			["communication"] = true,
			["start_time"] = 0,
			["modulation"] = 0,
			["frequency"] = 251,
		}, -- end of [70]
		
		
		[3] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 226.11111111111,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["number"] = 1,
                                                            ["auto"] = true,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "EPLRS",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["groupId"] = 25,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 584711.60234677,
                                            ["x"] = 54771.715683238,
                                            ["name"] = "blue_bombing_b52",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 667,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 226.11111111111,
                                        ["type"] = "B-52H",
                                        ["unitId"] = 1329,
                                        ["psi"] = 0,
                                        ["y"] = 584711.60234677,
                                        ["x"] = 54771.715683238,
                                        ["name"] = "blue_bombing_b52",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{585D626E-7F42-4073-AB70-41E728C333E2}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{6C47D097-83FF-4FB2-9496-EAB36DDF0B05}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{585D626E-7F42-4073-AB70-41E728C333E2}",
                                                }, -- end of [3]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "141135",
                                            ["flare"] = 192,
                                            ["chaff"] = 1125,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 3,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Uzi11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 584711.60234677,
                                ["x"] = 54771.715683238,
                                ["name"] = "blue_bombing_b52",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [69]							

		[4] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 118.19444444444,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["number"] = 1,
                                                            ["auto"] = true,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "EPLRS",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["groupId"] = 26,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 584720.15600099,
                                            ["x"] = 54613.426920888,
                                            ["name"] = "blue_bombing_tornado",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 668,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "ITA Tornado (Sesto Stormo Diavoli Rossi)",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 118.19444444444,
                                        ["type"] = "Tornado IDS",
                                        ["unitId"] = 1330,
                                        ["psi"] = 0,
                                        ["y"] = 584720.15600099,
                                        ["x"] = 54613.426920888,
                                        ["name"] = "blue_bombing_tornado",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{8C3F26A1-FA0F-11d5-9190-00A0249B6F00}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [3]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "{BCE4E030-38E9-423E-98ED-24BE3DA87C32}",
                                                }, -- end of [8]
                                                [10] = 
                                                {
                                                    ["CLSID"] = "{6CEB49FC-DED8-4DED-B053-E1F033FF72D3}",
                                                }, -- end of [10]
                                                [11] = 
                                                {
                                                    ["CLSID"] = "{EF124821-F9BB-4314-A153-E0E2FE1162C4}",
                                                }, -- end of [11]
                                                [12] = 
                                                {
                                                    ["CLSID"] = "{8C3F26A1-FA0F-11d5-9190-00A0249B6F00}",
                                                }, -- end of [12]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "4663",
                                            ["flare"] = 45,
                                            ["chaff"] = 90,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 3,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Uzi11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 584720.15600099,
                                ["x"] = 54613.426920888,
                                ["name"] = "blue_bombing_tornado",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [64]
	
		[5] = {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 9753.6,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 584809.65101294,
                                            ["x"] = 54400.876267511,
                                            ["name"] = "blue_bombing_a20g",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 669,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["speed"] = 123.33333333333,
                                        ["AddPropAircraft"] = 
                                        {
                                        }, -- end of ["AddPropAircraft"]
                                        ["type"] = "A-20G",
                                        ["unitId"] = 1331,
                                        ["psi"] = 0,
                                        ["y"] = 584809.65101294,
                                        ["x"] = 54400.876267511,
                                        ["name"] = "blue_bombing_a20g",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 1500,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.3379825136882,
                                        ["callsign"] = 
                                        {
                                            [1] = 3,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Uzi11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555685",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 584809.65101294,
                                ["x"] = 54400.876267511,
                                ["name"] = "blue_bombing_a20g",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [68]	
							
 [7] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
							["AddPropAircraft"] = 
                            {
                                ["ResinLights"] = 0.15,
                                ["SoloFlight"] = false,
                            }, -- end of ["AddPropAircraft"]
                            ["type"] = "MosquitoFBMkVI",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_bombing_mosquito",
                ["communication"] = true,
                ["lateActivation"] = true,
              
              }, 

       [8] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
				["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = BlueAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "H-6J",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_cap_l39",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "DIS_MER6_250_3_N6",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "DIS_DF4A_KD20",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "DIS_MER6_250_3_N6",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "DIS_MER6_250_3_N6",
                                                }, -- end of [4]
                                                [5] = 
                                                {
                                                    ["CLSID"] = "DIS_MER6_250_3_N6",
                                                }, -- end of [5]
                                                [6] = 
                                                {
                                                    ["CLSID"] = "DIS_DF4A_KD20",
                                                }, -- end of [6]
                                                [7] = 
                                                {
                                                    ["CLSID"] = "DIS_AKG_DLPOD",
                                                }, -- end of [7]
                                                [8] = 
                                                {
                                                    ["CLSID"] = "DIS_H6_250_2_N12",
                                                }, -- end of [8]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 25000,
                                            ["flare"] = 120,
                                            ["chaff"] = 120,
                                            ["gun"] = 100, },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_bombing_h6j",
                ["communication"] = true,
                ["lateActivation"] = true,
          
              },
}

local SpawnTempsHeloBlueAir = { 
        [1] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAS",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 65,
                            ["type"] = "Mi-28N",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "mi28n11",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{57232979-8B0F-4db7-8D9A-55197E06B0F5}" },
                                                           [2] = { ["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}" }, 
                                                           [3] = { ["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}" },
                                                           [4] = { ["CLSID"] = "{57232979-8B0F-4db7-8D9A-55197E06B0F5}" } },
                                            ["fuel"] = 1500,
                                            ["flare"] = 128,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 8,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Pontiac11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_mi28n",
                ["communication"] = true,
                ["lateActivation"] = true,

                },
        
        [2] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAS",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 65,
                            ["type"] = "Ka-50",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "ka5011",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}" },
                                                           [2] = { ["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}" }, 
                                                           [3] = { ["CLSID"] = "{6A4B9E69-64FE-439a-9163-3A87FB6A4D81}" }, 
                                                           [4] = { ["CLSID"] = "{A6FD14D3-6D30-4C85-88A7-8D17BEE120E2}" } },
                                            ["fuel"] = 1450,
                                            ["flare"] = 128,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Ford21" },
                            ["onboard_num"] = "021" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ka50",
                ["communication"] = true,
                ["lateActivation"] = true,
                },

        [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAS",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 65,
                            ["type"] = "AH-64D",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "ah64d",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" },
                                                           [2] = { ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, 
                                                           [3] = { ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, 
                                                           [4] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" } },
                                            ["fuel"] = 1157,
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 5,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Dodge11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ah64d",
                ["communication"] = false,
                ["lateActivation"] = true,
                },

        [4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAS",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 65,
                            ["type"] = "AH-64A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "ah64a11",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" },
                                                           [2] = { ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, 
                                                           [3] = { ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}" }, 
                                                           [4] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" } },
                                            ["fuel"] = 1157,
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 4,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Colt11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ah64a",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

        [5] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "CAS",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 65,
                            ["type"] = "AH-1W",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "ah1w11",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" },
                                                           [2] = { ["CLSID"] = "M260_HYDRA" }, 
                                                           [3] = { ["CLSID"] = "M260_HYDRA" }, 
                                                           [4] = { ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}" } },
                                            ["fuel"] = 1250,
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 3,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Uzi11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ah1w",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [6] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "SA342Mistral",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "sa342mistral11",
                            ["payload"] = { ["pylons"] = { [1] = { ["CLSID"] = "{MBDA_MistralD}" },
                                                           [2] = { ["CLSID"] = "{MBDA_MistralG}" },
                                                           [3] = { ["CLSID"] = "{MBDA_MistralD}" },
                                                           [4] = { ["CLSID"] = "{MBDA_MistralG}" },
                                                           [6] = { ["CLSID"] = "{IR_Deflector}" } },
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_sa342mis",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [7] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "CH-47D",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "CH-47D",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ch74d",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [8] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "CH-53E",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "CH-53E",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]},
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ch53e",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [9] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "Ka-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "blue_helo_ka27",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_ka27",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [10] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "Mi-24V",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "Mi-24V",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_mi24v",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [11] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "Mi-26",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "Mi-26",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_mi26",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [12] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "Mi-8MT",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "Mi-8MT",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_mi8",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [13] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "OH-58D",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "OH-58D",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_oh58d",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [14] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "SA342M",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "SA342M",
							["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_sa342m",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [15] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "SA342L",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "SA342L",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_sa342l",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [16] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "SH-60B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "SH-60B",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]} },
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_sh60b",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [17] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "UH-1H",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "UH-1H",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_uh1h",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

        [18] = { 
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Escort",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = HeloRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = blue_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "UH-60A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "UH-60A",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 415,
                                            ["flare"] = 32,
                                            ["chaff"] = 0,
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 6,
                                             [2] = 1,
                                             [3] = 1,
                                             ["name"] = "Ford11" },
                            ["onboard_num"] = "011" },
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "blue_helo_uh60",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

--[[
local SpawnTempsRatBlueAir = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_WW2",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 400,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_1_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [2] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 401,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_2_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [3] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_WW2",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 402,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_3_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [4] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 403,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_4_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [5] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 404,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "SpitfireLFMkIX",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_1_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [6] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 405,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "P-51D-30-NA",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_2_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [7] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 406,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "P-51D-30-NA",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_3_WW2",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [8] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_WW2",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 407,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_1_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [9] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 408,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_2_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [10] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_WW2",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 409,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_3_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [11] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 410,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_4_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [12] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["livery_id"] = "US Air Force (Green)",
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 412,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [13] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 413,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["livery_id"] = "US Air Force ex-USAF F-86A Sabre",
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_2_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
 [14] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_TEST",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 414,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        --["livery_id"] = "104th FS Maryland ANG, Baltimore (MD)",
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_3_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}
]]

--[[
local SpawnTempsRatHeloBlueAir = {

                            [1] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Ground Attack",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 500,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 46.25,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 564068.95708047,
                                            ["x"] = 8958.3220093871,
                                            ["name"] = "DictKey_WptName_2341",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 365,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 500,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["ropeLength"] = 15,
                                        ["speed"] = 46.25,
                                        ["type"] = "OH-58D",
                                        ["unitId"] = 669,
                                        ["psi"] = 0,
                                        ["y"] = 564068.95708047,
                                        ["x"] = 8958.3220093871,
                                        ["name"] = "DictKey_UnitName_2340",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "oh-58-brauning",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "AGM114x2_OH_58",
                                                }, -- end of [2]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "454",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 2,
                                            [3] = 1,
                                            ["name"] = "Colt21",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555729",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 564068.95708047,
                                ["x"] = 8958.3220093871,
                                ["name"] = "RAT_OH58D",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            }, -- end of [12]
                            [2] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Transport",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 500,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 46.25,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 564050.16083701,
                                            ["x"] = 8563.6008967374,
                                            ["name"] = "DictKey_WptName_2338",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 364,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 500,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["ropeLength"] = 15,
                                        ["speed"] = 46.25,
                                        ["type"] = "CH-47D",
                                        ["unitId"] = 668,
                                        ["psi"] = 0,
                                        ["y"] = 564050.16083701,
                                        ["x"] = 8563.6008967374,
                                        ["name"] = "DictKey_UnitName_2337",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "3600",
                                            ["flare"] = 120,
                                            ["chaff"] = 120,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 2,
                                            [3] = 1,
                                            ["name"] = "Colt21",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555729",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 564050.16083701,
                                ["x"] = 8563.6008967374,
                                ["name"] = "RAT_CH47",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            }, -- end of [11]
							
                            [3] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "CAS",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 500,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 46.25,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["key"] = "CAS",
                                                            ["id"] = "EngageTargets",
                                                            ["number"] = 1,
                                                            ["auto"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "Helicopters",
                                                                    [2] = "Ground Units",
                                                                    [3] = "Light armed ships",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 564312.89623275,
                                            ["x"] = 22759.677581811,
                                            ["name"] = "DictKey_WptName_2332",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 362,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 500,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["ropeLength"] = 15,
                                        ["speed"] = 46.25,
                                        ["type"] = "AH-64D",
                                        ["unitId"] = 666,
                                        ["psi"] = 0,
                                        ["y"] = 564312.89623275,
                                        ["x"] = 22759.677581811,
                                        ["name"] = "DictKey_UnitName_2331",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{FD90A1DC-9147-49FA-BF56-CB83EF0BD32B}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{88D18A5E-99C8-4B04-B40B-1C02F2018B6E}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "1157",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 2,
                                            [3] = 1,
                                            ["name"] = "Colt21",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555729",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 564312.89623275,
                                ["x"] = 22759.677581811,
                                ["name"] = "RAT_AH64D",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            }, -- end of [9]
							 [4] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Transport",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 500,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 46.25,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 564697.96609248,
                                            ["x"] = 21549.458022652,
                                            ["name"] = "DictKey_WptName_2335",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 363,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 500,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["ropeLength"] = 15,
                                        ["speed"] = 46.25,
                                        ["type"] = "UH-60A",
                                        ["unitId"] = 667,
                                        ["psi"] = 0,
                                        ["y"] = 564697.96609248,
                                        ["x"] = 21549.458022652,
                                        ["name"] = "DictKey_UnitName_2334",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "1100",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 4,
                                            [2] = 2,
                                            [3] = 1,
                                            ["name"] = "Colt21",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555729",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 564697.96609248,
                                ["x"] = 21549.458022652,
                                ["name"] = "RAT_UH60",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            }, -- end of [10]
}

local SpawnTempsAirbossBlueAir = {
                            [1] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = true,
                                ["task"] = "Refueling",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 0,
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 138.88888888889,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = true,
                                                            ["id"] = "Tanker",
                                                            ["number"] = 1,
                                                            ["params"] = 
                                                            {
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "TakeOffParking",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 298390.25,
                                            ["x"] = -50104.984375,
                                            ["name"] = "CVNTanker",
                                            ["formation_template"] = "",
                                            ["airdromeId"] = 17,
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 325,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 0,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "usaf standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["parking"] = "10",
                                        ["speed"] = 138.88888888889,
                                        ["type"] = "S-3B Tanker",
                                        ["unitId"] = 610,
                                        ["psi"] = 0,
                                        ["parking_id"] = "11",
                                        ["x"] = -50104.984375,
                                        ["name"] = "CVNTanker",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "7813",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["y"] = 298390.25,
                                        ["heading"] = 81.681408993339,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Arco11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555727",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 298390.25,
                                ["x"] = -50104.984375,
                                ["name"] = "CVNTanker",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 253,
                            }, -- end of [26]
}

local SpawnTempsAirbossHeloBlueAir = {
                            [1] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Transport",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 13,
                                            ["action"] = "From Parking Area",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 41.666666666667,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "TakeOffParking",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 278570.15625,
                                            ["x"] = -41416.58984375,
                                            ["name"] = "CVNRescue",
                                            ["formation_template"] = "",
                                            ["airdromeId"] = 14,
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 326,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 13,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "standard",
                                        ["skill"] = blue_ai_aircraft_skill,
                                        ["parking"] = "10",
                                        ["ropeLength"] = 15,
                                        ["speed"] = 41.666666666667,
                                        ["type"] = "SH-60B",
                                        ["unitId"] = 611,
                                        ["psi"] = 0,
                                        ["parking_id"] = "01",
                                        ["x"] = -41416.58984375,
                                        ["name"] = "CVNRescue",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "1100",
                                            ["flare"] = 30,
                                            ["chaff"] = 30,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["y"] = 278570.15625,
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 3,
                                            [2] = 2,
                                            [3] = 1,
                                            ["name"] = "Uzi21",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555728",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 278570.15625,
                                ["x"] = -41416.58984375,
                                ["name"] = "CVNRescue",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            }, -- end of [8]
}
]]

--[[
local SpawnTempsRatBlueAir8 = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_1_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 407,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 500,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_1_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_1_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}

local SpawnTempsRatBlueAir9 = {
[1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_2_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 408,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 502,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_2_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_2_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}

local SpawnTempsRatBlueAir10 = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_3_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 409,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "A-20G",
                                        ["unitId"] = 503,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_3_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{4xAN-M64_on_InvCountedAttachmentPoints}",
                                                }, -- end of [1]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },-- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_3_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}

local SpawnTempsRatBlueAir11 = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_LARGE_4_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 410,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "MosquitoFBMkVI",
                                        ["unitId"] = 504,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_LARGE_4_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                                [1] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [1]
                                                [2] = 
                                                {
                                                    ["CLSID"] = "{British_GP_500LB_Bomb_Mk5}",
                                                }, -- end of [2]
                                                [3] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [3]
                                                [4] = 
                                                {
                                                    ["CLSID"] = "{British_MC_500LB_Bomb_Mk1_Short_on_Handley_Page_Type_B_Cut_Bar}",
                                                }, -- end of [4]
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 996.6432,
                                            ["flare"] = 0,
                                            ["ammo_type"] = 1,
                                            ["chaff"] = 0,
                                            ["gun"] = 100, 
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_LARGE_4_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}


local SpawnTempsRatBlueAir12 = {

 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                          --  ["livery_id"] = "US Air Force (Green)",
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 412,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 505,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]


 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "CAP",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 236.38888888889,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                        [1] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["key"] = "CAP",
                                                            ["id"] = "EngageTargets",
                                                            ["number"] = 1,
                                                            ["auto"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["targetTypes"] = 
                                                                {
                                                                    [1] = "Air",
                                                                }, -- end of ["targetTypes"]
                                                                ["priority"] = 0,
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.8626251,
                                            ["x"] = -224556.37061208,
                                            ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 412,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "51stFW 16th FIS Default by Reflected",
                                        ["skill"] = "High",
                                        ["speed"] = 236.38888888889,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 1,
                                        ["psi"] = 0,
                                        ["y"] = 540600.8626251,
                                        ["x"] = -224556.37061208,
                                        ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 1282,
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.8626251,
                                ["x"] = -224556.37061208,
                                ["name"] = "RAT_FIGHTER_1_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 225,
                            }, -- end of [1]

}

local SpawnTempsRatBlueAir13 = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_FIGHTER_2_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 413,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                       -- ["livery_id"] = "US Air Force ex-USAF F-86A Sabre",
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 506,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_FIGHTER_2_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_2_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}


local SpawnTempsRatBlueAir14 = {
 [1] = 
                            {
                                ["lateActivation"] = true,
                                ["task"] = "Nothing",
                                ["uncontrolled"] = false,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                                                       ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 2000,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "BARO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 123.33333333333,
                                            ["task"] = 
                                            {
                                                ["id"] = "ComboTask",
                                                ["params"] = 
                                                {
                                                    ["tasks"] = 
                                                    {
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 540600.86262511,
                                            ["x"] = -207766.99237253,
                                            ["name"] = "RAT_FIGHTER_3_KOREAN_WAR",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["groupId"] = 414,
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 2000,
                                        -- ["livery_id"] = "US Air Force ex-USAF F-86A Sabre",
                                        ["alt_type"] = "BARO",
                                        ["skill"] = "High",
                                        ["speed"] = 123.33333333333,
                                        ["type"] = "F-86F Sabre",
                                        ["unitId"] = 507,
                                        ["psi"] = 0,
                                        ["y"] = 540600.86262511,
                                        ["x"] = -207766.99237253,
                                        ["name"] = "RAT_FIGHTER_3_KOREAN_WAR",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = 3249,
                                            ["flare"] = 60,
                                            ["ammo_type"] = 5,
                                            ["chaff"] = 60,
                                            ["gun"] = 100 },
                                        ["heading"] = 0,
                                        ["callsign"] = 
                                        {
                                            [1] = 1,
                                            [2] = 1,
                                            [3] = 1,
                                            ["name"] = "Enfield11",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "010",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 540600.86262511,
                                ["x"] = -207766.99237253,
                                ["name"] = "RAT_FIGHTER_3_KOREAN_WAR",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 124,
                            }, -- end of [1]
}
]]

if allow_blue_zeus_units == true then

for i, Template in pairs(SpawnTempsUsaBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempUsaInd = BlueTempUsaInd + 1
        BlueTempUsaAir[BlueTempUsaInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue usa aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsTrainerBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempTrainerInd = BlueTempTrainerInd + 1
        BlueTempTrainerAir[BlueTempTrainerInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue trainer aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsInternationalBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempInternationalInd = BlueTempInternationalInd + 1
        BlueTempInternationalAir[BlueTempInternationalInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue international aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsKoreanWarBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempKoreanWarInd = BlueTempKoreanWarInd + 1
        BlueTempKoreanWar[BlueTempKoreanWarInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue korean war aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsWw2BlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempWw2Ind = BlueTempWw2Ind + 1
        BlueTempWw2Air[BlueTempWw2Ind] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue ww2 aircraft " .. Template.name .. " template to the database." )
end

if ww2_asset_pack_enable == true then
	for i, Template in pairs(SpawnTempsWw2PaidBlueAir)
	do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
			BlueTempWw2PaidInd = BlueTempWw2PaidInd + 1
			BlueTempWw2PaidAir[BlueTempWw2PaidInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
			env.info("TTI - Adding blue ww2 aircraft " .. Template.name .. " template to the database." )
	end
end

for i, Template in pairs(SpawnTempsAntiShipBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempAntiShipInd = BlueTempAntiShipInd + 1
        BlueTempAntiShipAir[BlueTempAntiShipInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue anti ship aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsBomberBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempBomberInd = BlueTempBomberInd + 1
        BlueTempBomberAir[BlueTempBomberInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue bomber aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsHeloBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.HELICOPTER, Template)
        BlueTempHeloInd = BlueTempHeloInd + 1
        BlueTempHeloAir[BlueTempHeloInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.HELICOPTER, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue helo aircraft " .. Template.name .. " template to the database." )
end

end
--[[
local BlueTempRatAir1 = {}
local BlueTempRatInd1 = 0
local BlueTempRatAir2 = {}
local BlueTempRatInd2 = 0
local BlueTempRatAir3 = {}
local BlueTempRatInd3 = 0
local BlueTempRatAir4 = {}
local BlueTempRatInd4 = 0
local BlueTempRatAir5 = {}
local BlueTempRatInd5 = 0
local BlueTempRatAir6 = {}
local BlueTempRatInd6 = 0
local BlueTempRatAir7 = {}
local BlueTempRatInd7 = 0

local BlueTempRatAir8 = {}
local BlueTempRatInd8 = 0
local BlueTempRatAir9 = {}
local BlueTempRatInd9 = 0
local BlueTempRatAir10 = {}
local BlueTempRatInd10 = 0
local BlueTempRatAir11 = {}
local BlueTempRatInd11 = 0
local BlueTempRatAir12 = {}
local BlueTempRatInd12 = 0
local BlueTempRatAir13 = {}
local BlueTempRatInd13 = 0
local BlueTempRatAir14 = {}
local BlueTempRatInd14 = 0
]]
--[[
if mission_era ~= "modern" then
	for i, Template in pairs(SpawnTempsRatBlueAir)
	do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
			BlueTempRatInd = BlueTempRatInd + 1
			BlueTempRatAir[BlueTempRatInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
			env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
	end
end 
]]

--[[
for i, Template in pairs(SpawnTempsRatBlueAir8)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd8 = BlueTempRatInd8 + 1
		BlueTempRatAir8[BlueTempRatInd8] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir9)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd9 = BlueTempRatInd9 + 1
		BlueTempRatAir9[BlueTempRatInd9] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir10)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd10 = BlueTempRatInd10 + 1
		BlueTempRatAir10[BlueTempRatInd10] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir11)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd11 = BlueTempRatInd11 + 1
		BlueTempRatAir11[BlueTempRatInd11] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir12)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd12 = BlueTempRatInd12 + 1
		BlueTempRatAir12[BlueTempRatInd12] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir13)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd13 = BlueTempRatInd13 + 1
		BlueTempRatAir13[BlueTempRatInd13] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatBlueAir14)
do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
		BlueTempRatInd14 = BlueTempRatInd14 + 1
		BlueTempRatAir14[BlueTempRatInd14] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
		env.info("TTI - Adding blue rat aircraft " .. Template.name .. " template to the database." )
end
]]


--[[
for i, Template in pairs(SpawnTempsAirbossBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempAirbossInd = BlueTempAirbossInd + 1
        BlueTempAirbossAir[BlueTempAirbossInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue airboss aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsRatHeloBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.HELICOPTER, Template)
        BlueTempRatHeloInd = BlueTempRatHeloInd + 1
        BlueTempRatHeloAir[BlueTempRatHeloInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.HELICOPTER, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue rat helo aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsAirbossHeloBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.HELICOPTER, Template)
        BlueTempAirbossHeloInd = BlueTempAirbossHeloInd + 1
        BlueTempAirbossHeloAir[BlueTempAirbossHeloInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.HELICOPTER, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue airboss helo aircraft " .. Template.name .. " template to the database." )
end
]]
env.info("TTI - Database Blue Air Spawner Initialized!")