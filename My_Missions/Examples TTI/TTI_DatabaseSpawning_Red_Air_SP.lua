env.info("TTI - Database Red Air Spawner Initializing...")

--local jtac_type = "MQ-9 Reaper"
--local jtac_type = "RQ-1A Predator"

--newunits paid
--red_ar_m8_greyhound
--red_ar_daimler
--red_ar_centaur
--red_ar_churchhill
--red_ar_cromwell
--red_ar_tiger2
--red_ar_tiger1
--red_ar_sherman_ff
--red_ar_jagdpanther
--red_ar_jagpz
--red_ar_pzvpanther
--red_ar_stug
--red_ar_elefant
--red_ar_m10gmc
--red_ar_sturmpziv

--red_aa_aaa_flakscheinwerfer
--red_aa_aaa_qf37
--red_aa_aaa_m45quad
--red_aa_aaa_flak30
--red_aa_aaa_flak38
--red_aa_aaa_m137
--red_aa_aaa_flak41
--red_aa_aaa_flak37
--red_aa_aaa_flak36

--red_arty_m12_gmc

--red_ua_cckw
--red_ua_m4tractor
--red_ar_kubelwagen
--red_ua_kfz2
--red_ua_horch
--red_ua_kfz7
--red_ua_m30cc
--red_ua_willysmb

--red_inf_soldier_wwii_br
--red_inf_soldier_wwii_gr
--red_inf_soldier_wwii_us

--red_ship_ww2_uss_samuel_chase
--red_ship_ww2_lstmk2
--red_ship_ww2_uboatviic
--red_ship_ww2_schnellboot
--red_ship_ww2_higgins

--red_bombing_ww2_ju88a4
--red_cap_ju88a4
--red_bombing_b17g
--red_cap_b17g


--new units free
--"red_bombing_h6j"
--"red_bombing_mosquito"
--"red_cap_mosquito"
--"red_cap_p47"

--"red_arty_smerch_he"
--"red_arty_plz05"
--"red_arty_t155_firtina"
--"red_arty_sau2"

--"red_aa_sam_sa5"
--"red_aa_sam_nasams"

--"red_ship_seawise_giant"

if mission_era == "ww2" then
	jtac_type = "P-51D-30-NA"
	elseif mission_era == "korean_war" then
	jtac_type = "F-86F Sabre"
	elseif mission_era == "modern" then
	jtac_type = "RQ-1A Predator"
end

if mission_era == "ww2" then
RedAirRouteAltitude = 2000 --default altitude for all fixed wing aircraft red or blue
else
RedAirRouteAltitude = 8000 --default altitude for all fixed wing aircraft red or blue
end

local HeloRouteAltitude = 8000 -- default alittude for all rotary aircraft red or blue

local RedTempUsaAir = {}
local RedTempTrainerAir = {}
local RedTempInternationalAir = {}
local RedTempKoreanWar = {}
local RedTempWw2Air = {}
local RedTempWw2PaidAir = {}
local RedTempAntiShipAir = {}
local RedTempBomberAir = {}
local RedTempHeloAir = {}

local BlueTempJtacsInitAir = {}
local BlueTempHeloTransportAir = {}

local RedTempUsaInd = 0
local RedTempTrainerInd = 0
local RedTempInternationalInd = 0
local RedTempKoreanWarInd = 0
local RedTempWw2Ind = 0
local RedTempWw2PaidInd = 0
local RedTempAntiShipInd = 0
local RedTempBomberInd = 0
local RedTempHeloInd = 0

local BlueTempJtacsInitInd = 0
local BlueTempHeloTransportInd = 0

--Liveries RED

--[[
FA_18C_hornet_livery_id = ""
F_4E_livery_id = ""
F_14A_135_GR_livery_id = ""
F_15C_livery_id = ""
F_16C_50_livery_id = ""
F_14B_livery_id = ""
F_5E_3_livery_id = ""
L_39ZA_livery_id = ""
C_101CC_livery_id = ""

Su_27_livery_id = ""
Su_30_livery_id = ""
Su_33_livery_id = ""

J_11A_livery_id = ""
JF_17_livery_id = ""

MiG_25PD_livery_id = ""
MiG_29S_livery_id = ""
MiG_23MLD_livery_id = ""
M_2000C_livery_id = ""
Mirage 2000_5_livery_id = ""
MiG_29A_livery_id = ""
MiG_31_livery_id = ""
MiG_21Bis_livery_id = ""

MiG_15bis_livery_id = ""
MiG_19P_livery_id = ""
F_86F Sabre_livery_id = ""

SpitfireLFMkIX_livery_id = ""
P_51D_30_NA_livery_id = ""
P_47D_30_livery_id = ""
Bf_109K_4_livery_id = ""
FW_190D9_livery_id = ""
I_16_livery_id = ""

Tu_22M3_livery_id = ""
Tu_142_livery_id = ""
B_52H_livery_id = ""
B_1B_livery_id = ""
Tornado IDS_livery_id = ""
A_20G_livery_id = ""

Mi_28N_livery_id = ""
Ka_50_livery_id = ""
AH_64D_livery_id = ""
AH_64A_livery_id = ""
AH_1W_livery_id = ""
SA342Mistral_livery_id = ""
CH_47D_livery_id = ""
CH_53E_livery_id = ""
Ka_27_livery_id = ""
Mi_24V_livery_id = ""
Mi_26_livery_id = ""
Mi_8MT_livery_id = ""
OH_58D_livery_id = ""
SA342M_livery_id = ""
SA342L_livery_id = ""
SH_60B_livery_id = ""
UH_1H_livery_id = ""
UH_60A_livery_id = ""

]]


local SpawnTempsUsaRedAir = {
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FA-18C_hornet",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f18",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FA-18C_hornet",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f18",
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
                ["name"] = "red_cap_f18",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-4E",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f4",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-4E",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f4",
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
                ["name"] = "red_cap_f4",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14A-135-GR",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f14a",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14A-135-GR",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f14a",
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
                ["name"] = "red_cap_f14a",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-15C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f15",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-15C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f15",
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
                ["name"] = "red_cap_f15",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-16C_50",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f16",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-16C_50",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f16",
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
                ["name"] = "red_cap_f16",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f14b",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-14B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f14b",
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
                ["name"] = "red_cap_f14b",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f5",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f5",
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
                ["name"] = "red_cap_f5",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  

}

local SpawnTempsTrainerRedAir = {
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "L-39ZA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "L-39ZA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                ["name"] = "red_cap_l39",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "C-101CC",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_c101",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "C-101CC",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_c101",
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
                ["name"] = "red_cap_c101",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

local SpawnTempsInternationalRedAir = {
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su27",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su27",
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
                ["name"] = "red_cap_su27",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su30",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su30",
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
                ["name"] = "red_cap_su30",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-33",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su33",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Su-33",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_su33",
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
                ["name"] = "red_cap_su33",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "J-11A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_j11",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "J-11A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_j11",
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
                ["name"] = "red_cap_j11",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "JF-17",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "JF-17",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_jf17",
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
                ["name"] = "red_cap_jf17",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-25PD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig25",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-25PD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig25",
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
                ["name"] = "red_cap_mig25",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29S",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig29s",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29S",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig29s",
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
                ["name"] = "red_cap_mig29s",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-23MLD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig23",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-23MLD",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig23",
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
                ["name"] = "red_cap_mig23",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "M-2000C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_m2000",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "M-2000C",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_m2000",
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
                ["name"] = "red_cap_m2000",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Mirage 2000-5",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_m20005",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Mirage 2000-5",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_m20005",
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
                ["name"] = "red_cap_m20005",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig29a",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-29A",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig29a",
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
                ["name"] = "red_cap_mig29a",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-31",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig31",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-31",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig31",
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
                ["name"] = "red_cap_mig31",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-21Bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig21",
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
                            
                         [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-21Bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig21",
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
                ["name"] = "red_cap_mig21",
                ["communication"] = true,
                ["lateActivation"] = true,
               },

 
}

local SpawnTempsKoreanWarRedAir = {

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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-15bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig15",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-15bis",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig15",
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
                ["name"] = "red_cap_mig15",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-19P",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig19",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "MiG-19P",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_mig19",
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
                ["name"] = "red_cap_mig19",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-86F Sabre",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f86",
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
                            
                    [2] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-86F Sabre",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_f86",
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
                ["name"] = "red_cap_f86",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}

local SpawnTempsWw2RedAir = { 

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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "SpitfireLFMkIX",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_spitfire",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "SpitfireLFMkIX",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_spitfire",
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
                ["name"] = "red_cap_spitfire",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-51D-30-NA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_p51",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-51D-30-NA",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_p51",
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
                ["name"] = "red_cap_p51",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-47D-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_p47",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "P-47D-30",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_p47",
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
                ["name"] = "red_cap_p47",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Bf-109K-4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_bf109",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Bf-109K-4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_bf109",
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
                ["name"] = "red_cap_bf109",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FW-190D9",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_fw190",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "FW-190D9",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_fw190",
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
                ["name"] = "red_cap_fw190",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "I-16",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_i16",
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
                            
                    [2] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "I-16",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_i16",
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
                ["name"] = "red_cap_i16",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
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
                ["name"] = "red_cap_mosquito",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  
		
}

local SpawnTempsWw2PaidRedAir = {
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Ju-88A4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                ["name"] = "red_bombing_ju88a4",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-17G",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_bombing_b1b",
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
                ["name"] = "red_bombing_b17g",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Ju-88A4",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                ["name"] = "red_cap_ju88a4",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-17G",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_bombing_b1b",
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
                ["name"] = "red_cap_b17g",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
}


local SpawnTempsAntiShipRedAir = {
    [1] = {
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
                                            ["name"] = "red_antiship_tu22m3",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "af standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 251.80555555556,
                                        ["type"] = "Tu-22M3",
                                        ["psi"] = 0,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "red_antiship_tu22m3",
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
                                ["name"] = "red_antiship_tu22m3",
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
                                            ["name"] = "red_antiship_tu42",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["livery_id"] = "af standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 205.55555555556,
                                        ["type"] = "Tu-142",
                                        ["psi"] = 0,
                                        ["y"] = 588937.60843905,
                                        ["x"] = 54904.28570972,
                                        ["name"] = "red_antiship_tu42",
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
                                ["name"] = "red_antiship_tu42",
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
                                            ["name"] = "red_antiship_b52",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 9753.6,
                                        ["hardpoint_racks"] = true,
                                        ["alt_type"] = "BARO",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 226.11111111111,
                                        ["type"] = "B-52H",
                                        ["psi"] = 0,
                                        ["y"] = 589038.2903275,
                                        ["x"] = 54747.669438811,
                                        ["name"] = "red_antiship_b52",
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
                                ["name"] = "red_antiship_b52",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 251,
                            }, -- end of [65]
}


local SpawnTempsBomberRedAir = {
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Tu-22M3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "red_bombing_tu22m3",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-1B",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_bombing_b1b",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "red_bombing_b1b",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
      [3] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "B-52H",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_bombing_b52",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "red_bombing_b52",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
	[4] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "Tornado IDS",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_bombing_tornado",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "red_bombing_tornado",
                ["communication"] = true,
                ["lateActivation"] = true,
              },
			  
 
  [5] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
                ["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "A-20G",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                                            ["gun"] = 100 },
                            ["heading"] = 0,
                            ["callsign"] = { [1] = 2,
                                             [2] = 2,
                                             [3] = 1,
                                             ["name"] = "Springfield21" },
                            ["onboard_num"] = "021" },                    
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "red_bombing_a20g",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "A2A_Spawn_Init_Bombing_Escort",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "A2A_Spawn_Init_Bombing_Escort",
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
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "F-5E-3",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "A2A_Spawn_Init_ANTISHIP_Escort",
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
                },
                ["y"] = 0,
                ["x"] = 0,
                ["name"] = "A2A_Spawn_Init_ANTISHIP_Escort",
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
                    [1] = { ["alt"] = RedWW2AirRouteAltitude,
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
                ["name"] = "red_bombing_mosquito",
                ["communication"] = true,
                ["lateActivation"] = true,
              
              }, 

       [9] = {
                ["modulation"] = 0,
                ["tasks"] = {},
                ["radioSet"] = false,
				["task"] = "Ground Attack",
                ["uncontrolled"] = false,
                ["taskSelected"] = true,
                ["hidden"] = false,
                ["units"] = 
                {
                    [1] = { ["alt"] = RedAirRouteAltitude,
                            ["hardpoint_racks"] = true,
                            ["alt_type"] = "BARO",
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 300,
                            ["type"] = "H-6J",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_cap_l39",
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
                ["name"] = "red_bombing_h6j",
                ["communication"] = true,
                ["lateActivation"] = true,
          
              },

}

local SpawnTempsHeloRedAir = { 
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_mi28n",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ka50",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ah64d",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ah64a",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ah1w",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_sa342mis",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ch74d",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_ch53e",
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
                            ["skill"] = red_ai_aircraft_skill,
                            ["speed"] = 50,
                            ["type"] = "Ka-27",
                            ["psi"] = 0,
                            ["y"] = 0,
                            ["x"] = 0,
                            ["name"] = "red_helo_ka27",
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
                ["name"] = "red_helo_ka27",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_mi24v",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_mi26",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_mi8",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_oh58d",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_sa342m",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_sa342l",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_sh60b",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_uh1h",
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
                            ["skill"] = red_ai_aircraft_skill,
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
                ["name"] = "red_helo_uh60",
                ["communication"] = true,
                ["lateActivation"] = true,
              },

}
--[[ -- full jtac template from mission is broken
local SpawnTempsJtacsInitBlueAir = {

		[1] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

		[2] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ-A2GSAM",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ-A2GSAM",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ-A2GSAM",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

		[3] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ-A2GHARD",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ-A2GHARD",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ-A2GHARD",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

		[4] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ-ZEUS",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ-ZEUS",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ-ZEUS",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

		[5] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ-A2GHELO",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ-A2GHELO",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ-A2GHELO",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

		[6] =	{
                                ["lateActivation"] = true,
                                ["tasks"] = 
                                {
                                }, -- end of ["tasks"]
                                ["radioSet"] = false,
                                ["task"] = "Reconnaissance",
                                ["uncontrolled"] = false,
                                ["taskSelected"] = true,
                                ["route"] = 
                                {
                                    ["routeRelativeTOT"] = true,
                                    ["points"] = 
                                    {
                                        [1] = 
                                        {
                                            ["alt"] = 1200,
                                            ["action"] = "Turning Point",
                                            ["alt_type"] = "RADIO",
                                            ["properties"] = 
                                            {
                                                ["addopt"] = 
                                                {
                                                }, -- end of ["addopt"]
                                            }, -- end of ["properties"]
                                            ["speed"] = 61.111111111111,
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
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [1]
                                                        [2] = 
                                                        {
                                                            ["enabled"] = true,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["number"] = 2,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetInvisible",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [2]
                                                        [3] = 
                                                        {
                                                            ["number"] = 3,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "SetImmortal",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [3]
                                                        [4] = 
                                                        {
                                                            ["number"] = 4,
                                                            ["auto"] = false,
                                                            ["id"] = "WrappedAction",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["action"] = 
                                                                {
                                                                    ["id"] = "Option",
                                                                    ["params"] = 
                                                                    {
                                                                        ["value"] = true,
                                                                        ["name"] = 7,
                                                                    }, -- end of ["params"]
                                                                }, -- end of ["action"]
                                                            }, -- end of ["params"]
                                                        }, -- end of [4]
                                                        [5] = 
                                                        {
                                                            ["number"] = 5,
                                                            ["auto"] = false,
                                                            ["id"] = "Orbit",
                                                            ["enabled"] = true,
                                                            ["params"] = 
                                                            {
                                                                ["altitude"] = 10000,
                                                                ["pattern"] = "Circle",
                                                                ["speed"] = 30.555555555556,
                                                                ["altitudeEdited"] = true,
                                                            }, -- end of ["params"]
                                                        }, -- end of [5]
                                                    }, -- end of ["tasks"]
                                                }, -- end of ["params"]
                                            }, -- end of ["task"]
                                            ["type"] = "Turning Point",
                                            ["ETA"] = 0,
                                            ["ETA_locked"] = true,
                                            ["y"] = 0,
                                            ["x"] = 0,
                                            ["name"] = "JTAC-MQ-A2GEASY",
                                            ["formation_template"] = "",
                                            ["speed_locked"] = true,
                                        }, -- end of [1]
                                    }, -- end of ["points"]
                                }, -- end of ["route"]
                                ["hidden"] = false,
                                ["units"] = 
                                {
                                    [1] = 
                                    {
                                        ["alt"] = 1200,
                                        ["alt_type"] = "RADIO",
                                        ["livery_id"] = "USAF Standard",
                                        ["skill"] = red_ai_aircraft_skill,
                                        ["speed"] = 61.111111111111,
                                        ["type"] = "RQ-1A Predator",
                                        ["psi"] = -1.5231421315686,
                                        ["y"] = 0,
                                        ["x"] = 0,
                                        ["name"] = "JTAC-MQ-A2GEASY",
                                        ["payload"] = 
                                        {
                                            ["pylons"] = 
                                            {
                                            }, -- end of ["pylons"]
                                            ["fuel"] = "200",
                                            ["flare"] = 0,
                                            ["chaff"] = 0,
                                            ["gun"] = 100,
                                        }, -- end of ["payload"]
                                        ["heading"] = 1.5231421315686,
                                        ["callsign"] = 
                                        {
                                            [1] = 2,
                                            [2] = 4,
                                            [3] = 1,
                                            ["name"] = "Springfield41",
                                        }, -- end of ["callsign"]
                                        ["onboard_num"] = "555669",
                                    }, -- end of [1]
                                }, -- end of ["units"]
                                ["y"] = 0,
                                ["x"] = 0,
                                ["name"] = "JTAC-MQ-A2GEASY",
                                ["communication"] = true,
                                ["start_time"] = 0,
                                ["modulation"] = 0,
                                ["frequency"] = 127.5,
                            },

							
}
]]

local SpawnTempsJtacsInitBlueAir = {

    [1] = { --JTAC-MQ-ZEUS-LSR1685
    ["visible"] = false,
    ["tasks"] = {},
    ["uncontrollable"] = false,
    ["task"] = "Reconnaisance",
    ["hidden"] = false,
    ["units"] = {
        [1] = {
            ["type"] = jtac_type,
            ["transportable"] = { ["randomTransportable"] = false},
            ["skill"] = red_ai_aircraft_skill,
            ["y"] = 0,
            ["x"] = 0,
            ["name"] = "JTAC-MQ",
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["alt_type"] = "BARO",
            ["alt"] = 3000,
            ["speed"] = 220,
            ["payload"] = {
                    ["pylons"] = {
                --[[ [1] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [1]
                    [2] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [2]
                    [3] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [3]
                    [4] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [4]
            },--]]
                },
                    ["fuel"] = 1300,
                    ["flare"] = 192,
                    ["chaff"] = 192,
                    ["gun"] = 100
            },
            ["callsign"] = {
                [1] = 8,
                [2] = 9,
                [3] = 1,
                ["name"] = "Pontiac91"
            },
            ["onboard_num"] = 022,
        },
    },
    ["y"] = 0,
    ["x"] = 0,
    ["name"] = "JTAC-MQ",
    ["lateActivation"] = true 
    },

    [2] = { --JTAC-MQ-ZEUS-LSR1685
    ["visible"] = false,
    ["tasks"] = {},
    ["uncontrollable"] = false,
    ["task"] = "Reconnaisance",
    ["hidden"] = false,
    ["units"] = {
        [1] = {
            ["type"] = jtac_type,
            ["transportable"] = { ["randomTransportable"] = false},
            ["skill"] = red_ai_aircraft_skill,
            ["y"] = 0,
            ["x"] = 0,
            ["name"] = "JTAC-MQ",
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["alt_type"] = "BARO",
            ["alt"] = 3000,
            ["speed"] = 220,
            ["payload"] = {
                    ["pylons"] = {
                --[[ [1] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [1]
                    [2] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [2]
                    [3] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [3]
                    [4] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [4]
            },--]]
                },
                    ["fuel"] = 1300,
                    ["flare"] = 192,
                    ["chaff"] = 192,
                    ["gun"] = 100
            },
            ["callsign"] = {
                [1] = 8,
                [2] = 9,
                [3] = 1,
                ["name"] = "Pontiac91"
            },
            ["onboard_num"] = 022,
        },
    },
    ["y"] = 0,
    ["x"] = 0,
    ["name"] = "JTAC-MQ-A2GEASY",
    ["lateActivation"] = true 
    },

    [3] = { --JTAC-MQ-ZEUS-LSR1685
    ["visible"] = false,
    ["tasks"] = {},
    ["uncontrollable"] = false,
    ["task"] = "Reconnaisance",
    ["hidden"] = false,
    ["units"] = {
        [1] = {
            ["type"] = jtac_type,
            ["transportable"] = { ["randomTransportable"] = false},
            ["skill"] = red_ai_aircraft_skill,
            ["y"] = 0,
            ["x"] = 0,
            ["name"] = "JTAC-MQ",
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["alt_type"] = "BARO",
            ["alt"] = 3000,
            ["speed"] = 220,
            ["payload"] = {
                    ["pylons"] = {
                --[[ [1] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [1]
                    [2] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [2]
                    [3] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [3]
                    [4] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [4]
            },--]]
                },
                    ["fuel"] = 1300,
                    ["flare"] = 192,
                    ["chaff"] = 192,
                    ["gun"] = 100
            },
            ["callsign"] = {
                [1] = 8,
                [2] = 9,
                [3] = 1,
                ["name"] = "Pontiac91"
            },
            ["onboard_num"] = 022,
        },
    },
    ["y"] = 0,
    ["x"] = 0,
    ["name"] = "JTAC-MQ-A2GHELO",
    ["lateActivation"] = true 
    },

    [4] = { --JTAC-MQ-ZEUS-LSR1685
	
		["visible"] = false,
		["tasks"] = {},
		["uncontrollable"] = false,
		["task"] = "Reconnaisance",
		["hidden"] = false,
		["units"] = {
			[1] = {
				["type"] = jtac_type,
				["transportable"] = { ["randomTransportable"] = false},
				["skill"] = red_ai_aircraft_skill,
				["y"] = 0,
				["x"] = 0,
				["name"] = "JTAC-MQ",
				["heading"] = 0,
				["playerCanDrive"] = true,
				["alt_type"] = "BARO",
				["alt"] = 3000,
				["speed"] = 220,
				["payload"] = {
						["pylons"] = {
					--[[ [1] = {
							["CLSID"] = "AGM114x2_OH_58",
						}, -- end of [1]
						[2] = {
							["CLSID"] = "AGM114x2_OH_58",
						}, -- end of [2]
						[3] = {
							["CLSID"] = "AGM114x2_OH_58",
						}, -- end of [3]
						[4] = {
							["CLSID"] = "AGM114x2_OH_58",
						}, -- end of [4]
				},--]]
					},
						["fuel"] = 1300,
						["flare"] = 192,
						["chaff"] = 192,
						["gun"] = 100
				},
				["callsign"] = {
					[1] = 8,
					[2] = 9,
					[3] = 1,
					["name"] = "Pontiac91"
				},
				["onboard_num"] = 022,
			},
		},
		["y"] = 0,
		["x"] = 0,
        ["name"] = "JTAC-MQ-A2GHARD",
        ["lateActivation"] = true 
    },

    [5] = { --JTAC-MQ-ZEUS-LSR1685
    ["visible"] = false,
    ["tasks"] = {},
    ["uncontrollable"] = false,
    ["task"] = "Reconnaisance",
    ["hidden"] = false,
    ["units"] = {
        [1] = {
            ["type"] = jtac_type,
            ["transportable"] = { ["randomTransportable"] = false},
            ["skill"] = red_ai_aircraft_skill,
            ["y"] = 0,
            ["x"] = 0,
            ["name"] = "JTAC-MQ",
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["alt_type"] = "BARO",
            ["alt"] = 3000,
            ["speed"] = 220,
            ["payload"] = {
                    ["pylons"] = {
                --[[ [1] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [1]
                    [2] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [2]
                    [3] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [3]
                    [4] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [4]
            },--]]
                },
                    ["fuel"] = 1300,
                    ["flare"] = 192,
                    ["chaff"] = 192,
                    ["gun"] = 100
            },
            ["callsign"] = {
                [1] = 8,
                [2] = 9,
                [3] = 1,
                ["name"] = "Pontiac91"
            },
            ["onboard_num"] = 022,
        },
    },
    ["y"] = 0,
    ["x"] = 0,
    ["name"] = "JTAC-MQ-A2GSAM",
    ["lateActivation"] = true 
    },

    [6] = { --JTAC-MQ-ZEUS-LSR1685
    ["visible"] = false,
    ["tasks"] = {},
    ["uncontrollable"] = false,
    ["task"] = "Reconnaisance",
    ["hidden"] = false,
    ["units"] = {
        [1] = {
            ["type"] = jtac_type,
            ["transportable"] = { ["randomTransportable"] = false},
            ["skill"] = red_ai_aircraft_skill,
            ["y"] = 0,
            ["x"] = 0,
            ["name"] = "JTAC-MQ",
            ["heading"] = 0,
            ["playerCanDrive"] = true,
            ["alt_type"] = "BARO",
            ["alt"] = 3000,
            ["speed"] = 220,
            ["payload"] = {
                    ["pylons"] = {
                --[[ [1] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [1]
                    [2] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [2]
                    [3] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [3]
                    [4] = {
                        ["CLSID"] = "AGM114x2_OH_58",
                    }, -- end of [4]
            },--]]
                },
                    ["fuel"] = 1300,
                    ["flare"] = 192,
                    ["chaff"] = 192,
                    ["gun"] = 100
            },
            ["callsign"] = {
                [1] = 8,
                [2] = 9,
                [3] = 1,
                ["name"] = "Pontiac91"
            },
            ["onboard_num"] = 022,
        },
    },
    ["y"] = 0,
    ["x"] = 0,
    ["name"] = "JTAC-MQ-ZEUS",
    ["lateActivation"] = true 
    },		
}

local SpawnTempsHeloTransportBlueAir = {
		[1] = { --cmd Transport_Helo_Zeus
				["modulation"] = 0,
				["tasks"] = {},
				["radioSet"] = false,
				["task"] = "Transport",
				["uncontrolled"] = false,
				["taskSelected"] = true,
				["hidden"] = false,
				["units"] = 
				{
					[1] = { ["alt"] = HeloRouteAltitude,
							["hardpoint_racks"] = true,
							["alt_type"] = "BARO",
							["skill"] = red_ai_aircraft_skill,
							["speed"] = 50,
							["type"] = "CH-53E",
							["psi"] = 0,
							["y"] = 0,
							["x"] = 0,
							["name"] = "Transport_Helo_Zeus",
							["payload"] = { ["pylons"] = {},
											["fuel"] = 1908,
											["flare"] = 60,
											["chaff"] = 60,
											["gun"] = 100 },
							["heading"] = 0,
							["callsign"] = { [1] = 7,
											 [2] = 1,
											 [3] = 1,
											 ["name"] = "Chevy11" },
							["onboard_num"] = "011" },
				},
				["y"] = 0,
				["x"] = 0,
				["name"] = "Transport_Helo_Zeus",
				["communication"] = true,
				["lateActivation"] = true,
			},
		[2] = { --cmd Transport_Helo_Zeus_2
				["modulation"] = 0,
				["tasks"] = {},
				["radioSet"] = false,
				["task"] = "Transport",
				["uncontrolled"] = false,
				["taskSelected"] = true,
				["hidden"] = false,
				["units"] = 
				{
					[1] = { ["alt"] = HeloRouteAltitude,
							["hardpoint_racks"] = true,
							["alt_type"] = "BARO",
							["skill"] = red_ai_aircraft_skill,
							["speed"] = 50,
							["type"] = "CH-53E",
							["psi"] = 0,
							["y"] = 0,
							["x"] = 0,
							["name"] = "Transport_Helo_Zeus",
							["payload"] = { ["pylons"] = {},
											["fuel"] = 1908,
											["flare"] = 60,
											["chaff"] = 60,
											["gun"] = 100 },
							["heading"] = 0,
							["callsign"] = { [1] = 7,
											 [2] = 1,
											 [3] = 2,
											 ["name"] = "Chevy12" },
							["onboard_num"] = "011" },
				},
				["y"] = 0,
				["x"] = 0,
				["name"] = "Transport_Helo_Zeus_2",
				["communication"] = true,
				["lateActivation"] = true,
			},
		[3] = { --cmd Transport_Helo_1
				["modulation"] = 0,
				["tasks"] = {},
				["radioSet"] = false,
				["task"] = "Transport",
				["uncontrolled"] = false,
				["taskSelected"] = true,
				["hidden"] = false,
				["units"] = 
				{
					[1] = { ["alt"] = HeloRouteAltitude,
							["hardpoint_racks"] = true,
							["alt_type"] = "BARO",
							["skill"] = red_ai_aircraft_skill,
							["speed"] = 50,
							["type"] = "CH-47D",
							["psi"] = 0,
							["y"] = 0,
							["x"] = 0,
							["name"] = "Transport_Helo_1",
							["payload"] = { ["pylons"] = {},
											["fuel"] = 1100,
											["flare"] = 30,
											["chaff"] = 30,
											["gun"] = 100 },
							["heading"] = 0,
							["callsign"] = { [1] = 1,
											 [2] = 1,
											 [3] = 1,
											 ["name"] = "Enfield11" },
							["onboard_num"] = "011" },
				},
				["y"] = 0,
				["x"] = 0,
				["name"] = "Transport_Helo_1",
				["communication"] = true,
				["lateActivation"] = true,
			},

		[4] = { --cmd Transport_Helo_2
				["modulation"] = 0,
				["tasks"] = {},
				["radioSet"] = false,
				["task"] = "Transport",
				["uncontrolled"] = false,
				["taskSelected"] = true,
				["hidden"] = false,
				["units"] = 
				{
					[1] = { ["alt"] = HeloRouteAltitude,
							["hardpoint_racks"] = true,
							["alt_type"] = "BARO",
							["skill"] = red_ai_aircraft_skill,
							["speed"] = 50,
							["type"] = "CH-47D",
							["psi"] = 0,
							["y"] = 0,
							["x"] = 0,
							["name"] = "Transport_Helo_1",
							["payload"] = { ["pylons"] = {},
											["fuel"] = 1100,
											["flare"] = 30,
											["chaff"] = 30,
											["gun"] = 100 },
							["heading"] = 0,
							["callsign"] = { [1] = 1,
											 [2] = 1,
											 [3] = 2,
											 ["name"] = "Enfield12" },
							["onboard_num"] = "011" },
				},
				["y"] = 0,
				["x"] = 0,
				["name"] = "Transport_Helo_2",
				["communication"] = true,
				["lateActivation"] = true,
			},
        

}


for i, Template in pairs(SpawnTempsUsaRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempUsaInd = RedTempUsaInd + 1
        RedTempUsaAir[RedTempUsaInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red usa aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsTrainerRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempTrainerInd = RedTempTrainerInd + 1
        RedTempTrainerAir[RedTempTrainerInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red trainer aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsInternationalRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempInternationalInd = RedTempInternationalInd + 1
        RedTempInternationalAir[RedTempInternationalInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red international aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsKoreanWarRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempKoreanWarInd = RedTempKoreanWarInd + 1
        RedTempKoreanWar[RedTempKoreanWarInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red korean war aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsWw2RedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempWw2Ind = RedTempWw2Ind + 1
        RedTempWw2Air[RedTempWw2Ind] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red ww2 aircraft " .. Template.name .. " template to the database." )
end

if ww2_asset_pack_enable == true then
	for i, Template in pairs(SpawnTempsWw2PaidRedAir)
	do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
			RedTempWw2PaidInd = RedTempWw2PaidInd + 1
			RedTempWw2PaidAir[RedTempWw2PaidInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
			env.info("TTI - Adding red ww2 aircraft " .. Template.name .. " template to the database." )
	end
end

for i, Template in pairs(SpawnTempsAntiShipRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempAntiShipInd = RedTempAntiShipInd + 1
        RedTempAntiShipAir[RedTempAntiShipInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red anti ship aircraft " .. Template.name .. " template to the database." )
end

for i, Template in pairs(SpawnTempsBomberRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.AIRPLANE, Template)
        RedTempBomberInd = RedTempBomberInd + 1
        RedTempBomberAir[RedTempBomberInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.AIRPLANE, country.id.CJTF_RED)
        env.info("TTI - Adding red bomber aircraft " .. Template.name .. " template to the database." )
end


for i, Template in pairs(SpawnTempsHeloRedAir)
  do coalition.addGroup(country.id.CJTF_RED, Group.Category.HELICOPTER, Template)
        RedTempHeloInd = RedTempHeloInd + 1
        RedTempHeloAir[RedTempHeloInd] = GROUP:NewTemplate(Template, coalition.side.RED, Group.Category.HELICOPTER, country.id.CJTF_RED)
        env.info("TTI - Adding red helo aircraft " .. Template.name .. " template to the database." )
end


for i, Template in pairs(SpawnTempsJtacsInitBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.AIRPLANE, Template)
        BlueTempJtacsInitInd = BlueTempJtacsInitInd + 1
        BlueTempJtacsInitAir[BlueTempJtacsInitInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.AIRPLANE, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue jtac aircraft " .. Template.name .. " template to the database." )
end


for i, Template in pairs(SpawnTempsHeloTransportBlueAir)
  do coalition.addGroup(country.id.CJTF_BLUE, Group.Category.HELICOPTER, Template)
        BlueTempHeloTransportInd = BlueTempHeloTransportInd + 1
        BlueTempHeloTransportAir[BlueTempHeloTransportInd] = GROUP:NewTemplate(Template, coalition.side.BLUE, Group.Category.HELICOPTER, country.id.CJTF_BLUE)
        env.info("TTI - Adding blue helo transport aircraft " .. Template.name .. " template to the database." )
end

env.info("TTI - Database Red Air Spawner Initialized!")