env.info('Initiating Custom GROUND MOOSE for TTI ok')

search_agl_time = 30
--[[
--ADJUST GROUND UNIT SPAWN POOL SETTINGS HERE

--READ THE MISSION SETTINGS --README FILE FOR MORE DETAILS

-- Simply add two dashes -- before the name of the unit you want to remove from the spawning pool.
-- You can alternatively REMOVE two dashes before a unit to add it to the spawning pool.

--EXAMPLE, to ensure the SA-10 doesn't spawn the line with "sam_s10" will look like this
 --"sam_s10"

-- DO NOT DO ANYTHING HERE EXCEPT ADD/REMOVE DASHES TO THE UNITS YOU WANT ADDED/REMOVED FROM THE SPAWNING POOL.

TemplateTable_GROUND = { 
----red armor
--"red_ar_aav7",
--"red_ar_btr80",
"red_ar_btr82a",
--"red_ar_apc_cobra",
--"red_ar_hmv_armed",
--"red_ar_stryker",
"red_ar_m113",
"red_ar_bdrm2",
"red_ar_btrrd",
"red_ar_mtlb",
--"red_ar_hmv_tow",
--"red_ar_stryker_tow",
--"red_ar_fddm_grad",
"red_ar_bmd1",
"red_ar_bmp1",
"red_ar_bmp2",
--"red_ar_bmp3",
"red_ar_lav25",
"red_ar_bradley",
"red_ar_marder",
"red_ar_mcv80",
--"red_ar_stryker_mgs",
"red_ar_fuchs",
"red_ar_zbd04a",

----red tanks
--"red_ar_mbt_challenger2",
"red_ar_mbt_leclerc",
--"red_ar_mbt_leopard1a3",
"red_ar_mbt_leopard2",
"red_ar_mbt_abrams",
--"red_ar_mbt_patton",
"red_ar_mbt_merkava",
--"red_ar_mbt_t72b",
"red_ar_mbt_t72b3",
"red_ar_mbt_t80u",
"red_ar_mbt_t90",
"red_ar_mbt_t55",
"red_ar_mbt_ztz96b",

----red arty
--"red_arty_mortar",
--"red_arty_smerch_he",
--"red_arty_uraganbm27",
--"red_arty_bm21_grad",
--"red_arty_fddm",
--"red_arty_m270",
--"red_arty_gvozdika",
--"red_arty_msta",
--"red_arty_akatsia",
"red_arty_paladin",
"red_arty_dana",
"red_arty_smerch",
"red_arty_plz05",
"red_arty_t155_firtina",
"red_arty_sau2",

----red unarmed
--"red_ua_hmv",
"red_ua_apc_tiger",
--"red_ua_cp_predator",
--"red_ua_cp_predator_trojan",
--"red_ua_cp_skp11",
--"red_ua_ural_pbu",
"red_ua_fuel_atmz5",
"red_ua_fuel_atz10",
--"red_ua_apa_ural",
--"red_ua_apa_zil",
--"red_ua_hemtt_tfft",
--"red_ua_tanker_hemtt",
--"red_ua_fireengine_ural",
--"red_ua_gaz3307",
--"red_ua_gaz3308",
"red_ua_gaz66",
--"red_ua_ikarus280",
"red_ua_kmaz43101",
--"red_ua_kraz6322",
--"red_ua_laz695",
--"red_ua_m818",
--"red_ua_maz6303",
--"red_ua_uaz469",
"red_ua_ural375",
"red_ua_ural4320",
"red_ua_ural4320t",
--"red_ua_vaz2109",
--"red_ua_zil131_kung",
--"red_ua_zil4331",
--"red_ua_ziu9",

------red ww2 free armor 
--"red_ar_m2a1",
--"red_ar_kfz251",

------red ww2 free tanks
--"red_ar_mbt_sherman",
--"red_ar_mbt_pz_iv",

------red ww2 free unarmed
--"red_ua_bedford_mwd",
--"red_ua_blitz6700",
--"red_ua_land_rover_101",
--"red_ua_land_rover_109",
}
 
TemplateTable_HELO_GROUND = { 
----red armor
--"red_ar_aav7",
--"red_ar_btr80",
"red_ar_btr82a",
--"red_ar_apc_cobra",
--"red_ar_hmv_armed",
--"red_ar_stryker",
"red_ar_m113",
"red_ar_bdrm2",
"red_ar_btrrd",
"red_ar_mtlb",
--"red_ar_hmv_tow",
--"red_ar_stryker_tow",
--"red_ar_fddm_grad",
"red_ar_bmd1",
"red_ar_bmp1",
"red_ar_bmp2",
--"red_ar_bmp3",
"red_ar_lav25",
"red_ar_bradley",
"red_ar_marder",
"red_ar_mcv80",
--"red_ar_stryker_mgs",
"red_ar_fuchs",
"red_ar_zbd04a",

----red tanks
--"red_ar_mbt_challenger2",
"red_ar_mbt_leclerc",
--"red_ar_mbt_leopard1a3",
"red_ar_mbt_leopard2",
"red_ar_mbt_abrams",
--"red_ar_mbt_patton",
"red_ar_mbt_merkava",
--"red_ar_mbt_t72b",
"red_ar_mbt_t72b3",
"red_ar_mbt_t80u",
"red_ar_mbt_t90",
"red_ar_mbt_t55",
"red_ar_mbt_ztz96b",

----red arty
--"red_arty_mortar",
--"red_arty_smerch_he",
--"red_arty_uraganbm27",
--"red_arty_bm21_grad",
--"red_arty_fddm",
--"red_arty_m270",
--"red_arty_gvozdika",
--"red_arty_msta",
--"red_arty_akatsia",
"red_arty_paladin",
"red_arty_dana",
"red_arty_smerch",
"red_arty_plz05",
"red_arty_t155_firtina",
"red_arty_sau2",

----red unarmed
--"red_ua_hmv",
"red_ua_apc_tiger",
--"red_ua_cp_predator",
--"red_ua_cp_predator_trojan",
--"red_ua_cp_skp11",
--"red_ua_ural_pbu",
"red_ua_fuel_atmz5",
"red_ua_fuel_atz10",
--"red_ua_apa_ural",
--"red_ua_apa_zil",
--"red_ua_hemtt_tfft",
--"red_ua_tanker_hemtt",
--"red_ua_fireengine_ural",
--"red_ua_gaz3307",
--"red_ua_gaz3308",
"red_ua_gaz66",
--"red_ua_ikarus280",
"red_ua_kmaz43101",
--"red_ua_kraz6322",
--"red_ua_laz695",
--"red_ua_m818",
--"red_ua_maz6303",
--"red_ua_uaz469",
"red_ua_ural375",
"red_ua_ural4320",
"red_ua_ural4320t",
--"red_ua_vaz2109",
--"red_ua_zil131_kung",
--"red_ua_zil4331",
--"red_ua_ziu9",

------red ww2 free armor 
--"red_ar_m2a1",
--"red_ar_kfz251",

------red ww2 free tanks
--"red_ar_mbt_sherman",
--"red_ar_mbt_pz_iv",

------red ww2 free unarmed
--"red_ua_bedford_mwd",
--"red_ua_blitz6700",
--"red_ua_land_rover_101",
--"red_ua_land_rover_109",
}

TemplateTable_EASY_GROUND = { 
----red armor
--"red_ar_aav7",
--"red_ar_btr80",
"red_ar_btr82a",
--"red_ar_apc_cobra",
--"red_ar_hmv_armed",
--"red_ar_stryker",
"red_ar_m113",
"red_ar_bdrm2",
"red_ar_btrrd",
"red_ar_mtlb",
--"red_ar_hmv_tow",
--"red_ar_stryker_tow",
--"red_ar_fddm_grad",
"red_ar_bmd1",
"red_ar_bmp1",
"red_ar_bmp2",
--"red_ar_bmp3",
"red_ar_lav25",
"red_ar_bradley",
"red_ar_marder",
"red_ar_mcv80",
--"red_ar_stryker_mgs",
"red_ar_fuchs",
"red_ar_zbd04a",

----red tanks
--"red_ar_mbt_challenger2",
"red_ar_mbt_leclerc",
--"red_ar_mbt_leopard1a3",
"red_ar_mbt_leopard2",
"red_ar_mbt_abrams",
--"red_ar_mbt_patton",
"red_ar_mbt_merkava",
--"red_ar_mbt_t72b",
"red_ar_mbt_t72b3",
"red_ar_mbt_t80u",
"red_ar_mbt_t90",
"red_ar_mbt_t55",
"red_ar_mbt_ztz96b",

----red arty
--"red_arty_mortar",
--"red_arty_smerch_he",
--"red_arty_uraganbm27",
--"red_arty_bm21_grad",
--"red_arty_fddm",
--"red_arty_m270",
--"red_arty_gvozdika",
--"red_arty_msta",
--"red_arty_akatsia",
"red_arty_paladin",
"red_arty_dana",
"red_arty_smerch",
"red_arty_plz05",
"red_arty_t155_firtina",
"red_arty_sau2",

----red unarmed
--"red_ua_hmv",
"red_ua_apc_tiger",
--"red_ua_cp_predator",
--"red_ua_cp_predator_trojan",
--"red_ua_cp_skp11",
--"red_ua_ural_pbu",
"red_ua_fuel_atmz5",
"red_ua_fuel_atz10",
--"red_ua_apa_ural",
--"red_ua_apa_zil",
--"red_ua_hemtt_tfft",
--"red_ua_tanker_hemtt",
--"red_ua_fireengine_ural",
--"red_ua_gaz3307",
--"red_ua_gaz3308",
"red_ua_gaz66",
--"red_ua_ikarus280",
"red_ua_kmaz43101",
--"red_ua_kraz6322",
--"red_ua_laz695",
--"red_ua_m818",
--"red_ua_maz6303",
--"red_ua_uaz469",
"red_ua_ural375",
"red_ua_ural4320",
"red_ua_ural4320t",
--"red_ua_vaz2109",
--"red_ua_zil131_kung",
--"red_ua_zil4331",
--"red_ua_ziu9",

------red ww2 free armor 
--"red_ar_m2a1",
--"red_ar_kfz251",

------red ww2 free tanks
--"red_ar_mbt_sherman",
--"red_ar_mbt_pz_iv",

------red ww2 free unarmed
--"red_ua_bedford_mwd",
--"red_ua_blitz6700",
--"red_ua_land_rover_101",
--"red_ua_land_rover_109",
} 
 
TemplateTable_SAM = { 
----red sam sites with multiple units
"red_aa_sam_hq7",
--"red_aa_sam_rapier",
--"red_aa_sam_hawk",
--"red_aa_sam_patriot",
--"red_aa_sam_roland",
--"red_aa_sam_nasams",
"red_aa_sam_sa10",
"red_aa_sam_sa11",
"red_aa_sam_sa6",
"red_aa_sam_sa5",
"red_aa_sam_sa3",
"red_aa_sam_sa2",

----red infantry with AA launchers
--"red_aa_sam_stinger_manpads",
--"red_aa_sam_igla_manpads",

----red aa sam tac (single unit SAM)
--"red_aa_sam_tac_linebacker",
"red_aa_sam_tac_sa8",
--"red_aa_sam_tac_sa13",
--"red_aa_sam_tac_sa19",
--"red_aa_sam_tac_sa9",
--"red_aa_sam_tac_sa15",
--"red_aa_sam_tac_manpads",
--"red_aa_sam_tac_avenger",
--"red_aa_sam_tac_chaparral",


----red aa aaa
--"red_aa_aaa_vulcanm163",
--"red_aa_aaa_zsu572",
--"red_aa_aaa_zu23_closed",
--"red_aa_aaa_zu23_emplacement",
--"red_aa_aaa_zu23_insurgent",
--"red_aa_aaa_zu23_insurgent_closed",
--"red_aa_aaa_zu23_insurgent_ural",
--"red_aa_aaa_zu23_ural",
--"red_aa_aaa_shilka",
--"red_aa_aaa_gepard",

------red ww2 free aa
--"red_aa_aaa_flak18",
--"red_aa_aaa_bofors40",
} 
 
TemplateTable_AA = { 
----red aa aaa
"red_aa_aaa_vulcanm163",
"red_aa_aaa_zsu572",
"red_aa_aaa_zu23_closed",
--"red_aa_aaa_zu23_emplacement",
--"red_aa_aaa_zu23_insurgent",
--"red_aa_aaa_zu23_insurgent_closed",
--"red_aa_aaa_zu23_insurgent_ural",
"red_aa_aaa_zu23_ural",
"red_aa_aaa_shilka",
"red_aa_aaa_gepard",

------red ww2 free aa
"red_aa_aaa_flak18",
"red_aa_aaa_bofors40",
} 

 
TemplateTable_INF_MISC = { 
----red armor
--"red_ar_aav7",
--"red_ar_btr80",
"red_ar_btr82a",
--"red_ar_apc_cobra",
--"red_ar_hmv_armed",
--"red_ar_stryker",
"red_ar_m113",
"red_ar_bdrm2",
"red_ar_btrrd",
"red_ar_mtlb",
--"red_ar_hmv_tow",
--"red_ar_stryker_tow",
--"red_ar_fddm_grad",
"red_ar_bmd1",
"red_ar_bmp1",
"red_ar_bmp2",
--"red_ar_bmp3",
"red_ar_lav25",
"red_ar_bradley",
"red_ar_marder",
"red_ar_mcv80",
--"red_ar_stryker_mgs",
"red_ar_fuchs",
"red_ar_zbd04a",

----red tanks
--"red_ar_mbt_challenger2",
"red_ar_mbt_leclerc",
--"red_ar_mbt_leopard1a3",
"red_ar_mbt_leopard2",
"red_ar_mbt_abrams",
--"red_ar_mbt_patton",
"red_ar_mbt_merkava",
--"red_ar_mbt_t72b",
"red_ar_mbt_t72b3",
"red_ar_mbt_t80u",
"red_ar_mbt_t90",
"red_ar_mbt_t55",
"red_ar_mbt_ztz96b",

----red arty
--"red_arty_mortar",
--"red_arty_smerch_he",
--"red_arty_uraganbm27",
--"red_arty_bm21_grad",
--"red_arty_fddm",
--"red_arty_m270",
--"red_arty_gvozdika",
--"red_arty_msta",
--"red_arty_akatsia",
"red_arty_paladin",
"red_arty_dana",
"red_arty_smerch",
"red_arty_plz05",
"red_arty_t155_firtina",
"red_arty_sau2",

----red unarmed
--"red_ua_hmv",
"red_ua_apc_tiger",
--"red_ua_cp_predator",
--"red_ua_cp_predator_trojan",
--"red_ua_cp_skp11",
--"red_ua_ural_pbu",
"red_ua_fuel_atmz5",
"red_ua_fuel_atz10",
--"red_ua_apa_ural",
--"red_ua_apa_zil",
--"red_ua_hemtt_tfft",
--"red_ua_tanker_hemtt",
--"red_ua_fireengine_ural",
--"red_ua_gaz3307",
--"red_ua_gaz3308",
"red_ua_gaz66",
--"red_ua_ikarus280",
"red_ua_kmaz43101",
--"red_ua_kraz6322",
--"red_ua_laz695",
--"red_ua_m818",
--"red_ua_maz6303",
--"red_ua_uaz469",
"red_ua_ural375",
"red_ua_ural4320",
"red_ua_ural4320t",
--"red_ua_vaz2109",
--"red_ua_zil131_kung",
--"red_ua_zil4331",
--"red_ua_ziu9",

------red ww2 free armor 
--"red_ar_m2a1",
--"red_ar_kfz251",

------red ww2 free tanks
--"red_ar_mbt_sherman",
--"red_ar_mbt_pz_iv",

------red ww2 free unarmed
--"red_ua_bedford_mwd",
--"red_ua_blitz6700",
--"red_ua_land_rover_101",
--"red_ua_land_rover_109",
} 
 
 
TemplateTable_SEA = { 
----Russia
"red_ship_speedboat",
"red_ship_moskva",
"red_ship_pyotor",
"red_ship_grisha",
"red_ship_neustrashimy",
"red_ship_molniya",
"red_ship_rezky",
----USA
--"red_ship_perry",
--"red_ship_ticonderoga",
--"red_ship_burke",
----China Military
"red_ship_destroyer_052b",
"red_ship_destroyer_052c",
"red_ship_amp_071",
"red_ship_frigate_054a",

----Submarines
--"red_sub_ssk_641b",
--"red_sub_ssk_877",
--"red_sub_093",
----Civilian
--"red_ship_civil_zvezdny",
"red_ship_cargo_yak",
"red_ship_cargo_ivanov",
"red_ship_tanker_elnya",
"red_ship_handywind",
"red_ship_seawise_giant",
}

]]
----

function clearTemplate(templateToClear)
    for k in pairs(templateToClear) do
        templateToClear[k] = nil
    end
end


if mission_era == "modern" then
	TemplateTable_INF_GROUND = { 
	"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	"red_inf_paratrooper_aks",
	"red_inf_paratrooper_rpg",
	}
end

if mission_era == "ww2" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	}
end
	
if mission_era == "ww2" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
end

if mission_era == "korean_war" and ww2_asset_pack_enable == false then
	TemplateTable_INF_GROUND = { 
	--"red_inf_georgia_m4",
	--"red_inf_m4",
	"red_inf_ak",
	--"red_inf_m249",
	--"red_inf_insurgent_sol",
	--"red_inf_rus_sol",
	--"red_inf_paratrooper_aks",
	--"red_inf_paratrooper_rpg",
	} 
end

if mission_era == "korean_war" and ww2_asset_pack_enable == true then
	TemplateTable_INF_GROUND = { 
	"red_inf_soldier_wwii_br",
	"red_inf_soldier_wwii_gr",
	"red_inf_soldier_wwii_us",
	} 
end

--INSERT Paid WW2 Units
if mission_era ~= "modern" and ww2_asset_pack_enable == true then
table.insert(TemplateTable_GROUND, "red_ar_m8_greyhound")
table.insert(TemplateTable_GROUND, "red_ar_daimler")
table.insert(TemplateTable_GROUND, "red_ar_mbt_centaur")
table.insert(TemplateTable_GROUND, "red_ar_mbt_churchhill")
table.insert(TemplateTable_GROUND, "red_ar_mbt_cromwell")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger2")
table.insert(TemplateTable_GROUND, "red_ar_mbt_tiger1")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sherman_ff")
table.insert(TemplateTable_GROUND, "red_ar_puma")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagdpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_jagpz")
table.insert(TemplateTable_GROUND, "red_ar_mbt_pzvpanther")
table.insert(TemplateTable_GROUND, "red_ar_mbt_stug")
table.insert(TemplateTable_GROUND, "red_ar_mbt_elefant")
table.insert(TemplateTable_GROUND, "red_ar_mbt_m10gmc")
table.insert(TemplateTable_GROUND, "red_ar_mbt_sturmpziv")
table.insert(TemplateTable_GROUND, "red_ar_tetrarch")

table.insert(TemplateTable_GROUND, "red_arty_m12_gmc")

table.insert(TemplateTable_GROUND, "red_ua_cckw")
table.insert(TemplateTable_GROUND, "red_ua_m4tractor")
table.insert(TemplateTable_GROUND, "red_ua_kubelwagen")
table.insert(TemplateTable_GROUND, "red_ua_kfz2")
table.insert(TemplateTable_GROUND, "red_ua_horch")
table.insert(TemplateTable_GROUND, "red_ua_kfz7")
table.insert(TemplateTable_GROUND, "red_ua_m30cc")
table.insert(TemplateTable_GROUND, "red_ua_willysmb")
--[[
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_br")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_gr")
table.insert(TemplateTable_INF_GROUND, "red_inf_soldier_wwii_us")
--]]
table.insert(TemplateTable_AA, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_AA, "red_aa_aaa_qf37")
table.insert(TemplateTable_AA, "red_aa_aaa_m45quad")
table.insert(TemplateTable_AA, "red_aa_aaa_flak30")
table.insert(TemplateTable_AA, "red_aa_aaa_flak38")
table.insert(TemplateTable_AA, "red_aa_aaa_m137")
table.insert(TemplateTable_AA, "red_aa_aaa_flak41")
table.insert(TemplateTable_AA, "red_aa_aaa_flak37")
table.insert(TemplateTable_AA, "red_aa_aaa_flak36")

table.insert(TemplateTable_SAM, "red_aa_aaa_flakscheinwerfer")
table.insert(TemplateTable_SAM, "red_aa_aaa_qf37")
table.insert(TemplateTable_SAM, "red_aa_aaa_m45quad")
table.insert(TemplateTable_SAM, "red_aa_aaa_flak30")
table.insert(TemplateTable_SAM, "red_aa_aaa_flak38")
table.insert(TemplateTable_SAM, "red_aa_aaa_m137")
table.insert(TemplateTable_SAM, "red_aa_aaa_flak41")
table.insert(TemplateTable_SAM, "red_aa_aaa_flak37")
table.insert(TemplateTable_SAM, "red_aa_aaa_flak36")

table.insert(TemplateTable_SEA, "red_ship_ww2_uss_samuel_chase")
table.insert(TemplateTable_SEA, "red_ship_ww2_lstmk2")
table.insert(TemplateTable_SEA, "red_ship_ww2_uboatviic")
table.insert(TemplateTable_SEA, "red_ship_ww2_schnellboot")
table.insert(TemplateTable_SEA, "red_ship_ww2_higgins")
end

AG1 				= 		ZONE:New( "AG1" ) 
AG2 				= 		ZONE:New( "AG2" ) 
AG3 				= 		ZONE:New( "AG3" ) 
AG4 				= 		ZONE:New( "AG4" ) 
AG5 				= 		ZONE:New( "AG5" ) 
AG6 				= 		ZONE:New( "AG6" ) 
AG7 				= 		ZONE:New( "AG7" ) 
AG8 				= 		ZONE:New( "AG8" ) 
AG9 				= 		ZONE:New( "AG9" ) 
AG10 				= 		ZONE:New( "AG10" ) 
AAA_ZONE 			= 		ZONE:New( "AAA_ZONE" ) 
klsv 				= 		ZONE:New( "klsv" )

AG1_vec = AG1:GetVec3()
AG2_vec = AG2:GetVec3()
AG3_vec = AG3:GetVec3()
AG4_vec = AG4:GetVec3()
AG5_vec = AG5:GetVec3()
AG6_vec = AG6:GetVec3()
AG7_vec = AG7:GetVec3()
AG8_vec = AG8:GetVec3()
AG9_vec = AG9:GetVec3()
AG10_vec = AG10:GetVec3()

MR1 				= 		ZONE:New( "MR1" ) 
MR2 				= 		ZONE:New( "MR2" ) 
MR3 				= 		ZONE:New( "MR3" ) 
MR4 				= 		ZONE:New( "MR4" ) 
MR5 				= 		ZONE:New( "MR5" )
MR6 				= 		ZONE:New( "MR6" ) 
MR7 				= 		ZONE:New( "MR7" ) 
MR8 				= 		ZONE:New( "MR8" ) 
MR9 				= 		ZONE:New( "MR9" ) 
MR10 				= 		ZONE:New( "MR10" ) 

MR1_vec = MR1:GetVec3()
MR2_vec = MR2:GetVec3()
MR3_vec = MR3:GetVec3()
MR4_vec = MR4:GetVec3()
MR5_vec = MR5:GetVec3()
MR6_vec = MR6:GetVec3()
MR7_vec = MR7:GetVec3()
MR8_vec = MR8:GetVec3()
MR9_vec = MR9:GetVec3()
MR10_vec = MR10:GetVec3()

MR1_vec2 = MR1:GetVec2()
MR2_vec2 = MR2:GetVec2()
MR3_vec2 = MR3:GetVec2()
MR4_vec2 = MR4:GetVec2()
MR5_vec2 = MR5:GetVec2()
MR6_vec2 = MR6:GetVec2()
MR7_vec2 = MR7:GetVec2()
MR8_vec2 = MR8:GetVec2()
MR9_vec2 = MR9:GetVec2()
MR10_vec2 = MR10:GetVec2()

AGH1 				= 		ZONE:New( "AGH1" ) 
AGH2 				= 		ZONE:New( "AGH2" ) 
AGH3 				= 		ZONE:New( "AGH3" ) 
AGH4 				= 		ZONE:New( "AGH4" ) 
AGH5 				= 		ZONE:New( "AGH5" ) 

AGH6 				= 		ZONE:New( "AGH6" ) 
AGH7 				= 		ZONE:New( "AGH7" ) 
AGH8 				= 		ZONE:New( "AGH8" ) 
AGH9 				= 		ZONE:New( "AGH9" ) 
AGH10 				= 		ZONE:New( "AGH10" ) 

AGH1_vec = AGH1:GetVec3()
AGH2_vec = AGH2:GetVec3()
AGH3_vec = AGH3:GetVec3()
AGH4_vec = AGH4:GetVec3()
AGH5_vec = AGH5:GetVec3()
AGH6_vec = AGH6:GetVec3()
AGH7_vec = AGH7:GetVec3()
AGH8_vec = AGH8:GetVec3()
AGH9_vec = AGH9:GetVec3()
AGH10_vec = AGH10:GetVec3()

if env.mission.theatre ~= "Nevada" then
ASS1 				= 		ZONE:New( "ASS1" ) 
ASS2 				= 		ZONE:New( "ASS2" ) 
ASS3				= 		ZONE:New( "ASS3" ) 
ASS4				= 		ZONE:New( "ASS4" ) 
ASS5 				= 		ZONE:New( "ASS5" ) 

ASS1_vec = ASS1:GetVec3()
ASS2_vec = ASS2:GetVec3()
ASS3_vec = ASS3:GetVec3()
ASS4_vec = ASS4:GetVec3()
ASS5_vec = ASS5:GetVec3()
end

SAM1 				= 		ZONE:New( "SAM1" ) 
SAM2 				= 		ZONE:New( "SAM2" ) 
SAM3 				= 		ZONE:New( "SAM3" ) 


poly_MR1 = ZONE_POLYGON:NewFromGroupName("poly_MR1", "poly_MR1")
poly_MR2 = ZONE_POLYGON:NewFromGroupName("poly_MR2", "poly_MR2")
poly_MR3 = ZONE_POLYGON:NewFromGroupName("poly_MR3", "poly_MR3")
poly_MR4 = ZONE_POLYGON:NewFromGroupName("poly_MR4", "poly_MR4")
poly_MR5 = ZONE_POLYGON:NewFromGroupName("poly_MR5", "poly_MR5")
poly_MR6 = ZONE_POLYGON:NewFromGroupName("poly_MR6", "poly_MR6")
poly_MR7 = ZONE_POLYGON:NewFromGroupName("poly_MR7", "poly_MR7")
poly_MR8 = ZONE_POLYGON:NewFromGroupName("poly_MR8", "poly_MR8")
poly_MR9 = ZONE_POLYGON:NewFromGroupName("poly_MR9", "poly_MR9")
poly_MR10 = ZONE_POLYGON:NewFromGroupName("poly_MR10", "poly_MR10")

poly_AG1 = ZONE_POLYGON:NewFromGroupName("poly_AG1", "poly_AG1")
poly_AG2 = ZONE_POLYGON:NewFromGroupName("poly_AG2", "poly_AG2")
poly_AG3 = ZONE_POLYGON:NewFromGroupName("poly_AG3", "poly_AG3")
poly_AG4 = ZONE_POLYGON:NewFromGroupName("poly_AG4", "poly_AG4")
poly_AG5 = ZONE_POLYGON:NewFromGroupName("poly_AG5", "poly_AG5")
poly_AG6 = ZONE_POLYGON:NewFromGroupName("poly_AG6", "poly_AG6")
poly_AG7 = ZONE_POLYGON:NewFromGroupName("poly_AG7", "poly_AG7")
poly_AG8 = ZONE_POLYGON:NewFromGroupName("poly_AG8", "poly_AG8")
poly_AG9 = ZONE_POLYGON:NewFromGroupName("poly_AG9", "poly_AG9")
poly_AG10 = ZONE_POLYGON:NewFromGroupName("poly_AG10", "poly_AG10")

poly_AGH1 = ZONE_POLYGON:NewFromGroupName("poly_AGH1", "poly_AGH1")
poly_AGH2 = ZONE_POLYGON:NewFromGroupName("poly_AGH2", "poly_AGH2")
poly_AGH3 = ZONE_POLYGON:NewFromGroupName("poly_AGH3", "poly_AGH3")
poly_AGH4 = ZONE_POLYGON:NewFromGroupName("poly_AGH4", "poly_AGH4")
poly_AGH5 = ZONE_POLYGON:NewFromGroupName("poly_AGH5", "poly_AGH5")
poly_AGH6 = ZONE_POLYGON:NewFromGroupName("poly_AGH6", "poly_AGH6")
poly_AGH7 = ZONE_POLYGON:NewFromGroupName("poly_AGH7", "poly_AGH7")
poly_AGH8 = ZONE_POLYGON:NewFromGroupName("poly_AGH8", "poly_AGH8")
poly_AGH9 = ZONE_POLYGON:NewFromGroupName("poly_AGH9", "poly_AGH9")
poly_AGH10 = ZONE_POLYGON:NewFromGroupName("poly_AGH10", "poly_AGH10")

env.info('Zone ground init ok')

--NORMAL
A2GJ = SPAWN:New( "A2G_Init" )
	--:InitRandomizeTemplate( TemplateTable_HARD_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)

A2GAS = SPAWN:New( "A2GAS_Init" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)
	
A2GAS_Disabled = SPAWN:New( "A2GAS_Init_Disabled" )
	:InitRandomizeTemplate( TemplateTable_SEA )
	:InitHeading(0, 360)

A2GMR = SPAWN:New( "A2GMR_Init" )
	--:InitRandomizeTemplate( TemplateTable_EASY_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GH = SPAWN:New( "A2GH_Init" )
	--:InitRandomizeTemplate( TemplateTable_HELO_GROUND )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2GIA = SPAWN:New( "A2GIA_Init" )
	:InitRandomizeTemplate( TemplateTable_INF_GROUND )
	:InitHeading(0, 360)

A2GIAM = SPAWN:New( "A2GIAMISC_Init" )
	--:InitRandomizeTemplate( TemplateTable_INF_MISC )
	:InitRandomizeTemplate( TemplateTable_GROUND )
	:InitHeading(0, 360)
	
A2G_AA = SPAWN:New( "AA_Init" )
	:InitRandomizeTemplate( TemplateTable_AA )
	:InitHeading(0, 360)
	
A2G_SAM = SPAWN:New( "SAM_Init" )
	:InitRandomizeTemplate( TemplateTable_SAM )
	:InitHeading(0, 360)
	
env.info('spawn objects ground init co ok')

--SAM ADD
function a2g_sam_start()
	local switch = math.random(1, 3)
	
	if switch == 1 then
		a2gsam1_start()
	elseif switch == 2 then
		a2gsam2_start()
	elseif switch == 3 then
		a2gsam3_start()
	end
	
	trigger.action.outText( ">> An enemy SAM site has been detected in the area.<< \nRequesting SEAD aircraft to locate and destroy the SAM Site.", 10)
	trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )

	
end
--SAM ADD
function a2gsam1_start() --1 per group
	for i = 1, 1 do
		A2G_SAM:SpawnInZone(SAM1, true)
	end
if enable_jtac_drones == true and sam_site_jtacs_enable == true then 
activate_SAM1_jtac()
end
end

function a2gsam2_start() --1 per group
	for i = 1, 1 do
		A2G_SAM:SpawnInZone(SAM2, true)
	end
if enable_jtac_drones == true and sam_site_jtacs_enable == true then 
activate_SAM2_jtac()
end
end

function a2gsam3_start() --1 per group
	for i = 1, 1 do
		A2G_SAM:SpawnInZone(SAM3, true)
	end
if enable_jtac_drones == true and sam_site_jtacs_enable == true then 
activate_SAM3_jtac()
end
end


function a2gj_start()
unitThresholdAG = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
allow_ag_agl_search = true
--allow_agh_agl_search = true
--allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = true
	allow_ag_agl_search = false
	--allow_agh_agl_search = true
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )


HardMissionNameGen()
trigger.action.setUserFlag('AG-STARTING', true)
	--local switch = math.random (1,10) 

local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastA2GJ;
lastA2GJ = switch;

if switch == 1 then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj1_start()

elseif switch ==2 then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj2_start()

elseif switch ==3  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj3_start()

elseif switch ==4  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj4_start()

elseif switch ==5  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj5_start()

elseif switch == 6  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj6_start()

elseif switch == 7  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj7_start()

elseif switch == 8  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj8_start()

elseif switch == 9  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj9_start()

elseif switch == 10  then
env.info('TTI: Spawning A2G Mission ' .. switch)
a2gj10_start()
end
arrayZoneAG[switch][4] = true

	if ai_troops_transport_location == "a2g hard" then
		timer.scheduleFunction(function() 
			helo_transport("ag")
		end, nil, timer.getTime() + 5  )
	end

end

--[[
	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj1_start()
	end, nil, timer.getTime() + 20  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj2_start()
	end, nil, timer.getTime() + 25  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj3_start()
	end, nil, timer.getTime() + 30  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj4_start()
	end, nil, timer.getTime() + 35  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj5_start()
	end, nil, timer.getTime() + 40  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj6_start()
	end, nil, timer.getTime() + 45  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj7_start()
	end, nil, timer.getTime() + 50  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj8_start()
	end, nil, timer.getTime() + 55  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj9_start()
	end, nil, timer.getTime() + 60  )

	timer.scheduleFunction(function() 
	env.info('TTI: Spawning A2G Mission 1')
	a2gj10_start()
	end, nil, timer.getTime() + 65  )
]]

function a2gmr_start()
unitThresholdMR = false
-- To allow searching for units above AGL to despawn them.
allow_mr_agl_search = true
--allow_ag_agl_search = true
--allow_agh_agl_search = true
--allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	allow_mr_agl_search = false
	--allow_ag_agl_search = false
	--allow_agh_agl_search = true
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )

EasyMissionNameGen()
trigger.action.setUserFlag('MR-STARTING', true)
	--local switch = math.random (1,10) 

local switch;
repeat
	switch = math.random (1,10)
until switch ~= lastMR;
lastMR = switch;

if switch == 1 then
a2gmr1_start()

elseif switch ==2 then
a2gmr2_start()

elseif switch ==3  then
a2gmr3_start()

elseif switch ==4  then
a2gmr4_start()

elseif switch ==5  then
a2gmr5_start()

elseif switch ==6  then
a2gmr6_start()

elseif switch ==7  then
a2gmr7_start()

elseif switch ==8  then
a2gmr8_start()

elseif switch ==9  then
a2gmr9_start()

elseif switch ==10  then
a2gmr10_start()


	end
	arrayZoneMR[switch][4] = true
	
	if ai_troops_transport_location == "a2g easy" then
		timer.scheduleFunction(function() 
			helo_transport("mr")
		end, nil, timer.getTime() + 5  )
	end

end

function a2gas_start()
ShipMissionNameGen()
trigger.action.setUserFlag('AS-STARTING', true)
	--local switch = math.random (1,5) 
	
local switch;
repeat
	switch = math.random (1,5)
until switch ~= lastA2GAS;
lastA2GAS = switch;

if switch == 1 then
a2gas1_start()

elseif switch ==2 then
a2gas2_start()

elseif switch ==3  then
a2gas3_start()

elseif switch ==4  then
a2gas4_start()

elseif switch ==5  then
a2gas5_start()
	end
	arrayZoneASS[switch][4] = true
end

function a2gh_start()
unitThresholdAGH = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
--allow_ag_agl_search = true
allow_agh_agl_search = true
--allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = false
	--allow_ag_agl_search = false
	allow_agh_agl_search = false
	--allow_inf_agl_search = true
end, nil, timer.getTime() + search_agl_time )

HeloMissionNameGen()
trigger.action.setUserFlag('AGH-STARTING', true)
local switch;
repeat
	switch = math.random (1,5)
until switch ~= lastA2Ghelo;
lastA2Ghelo = switch;
	
	if switch == 1 then
		a2gh1_start()
	elseif switch == 2 then
		a2gh2_start()
	elseif switch == 3 then
		a2gh3_start()
	elseif switch == 4 then
		a2gh4_start()
	elseif switch == 5 then
		a2gh5_start()
	elseif switch == 6 then
		a2gh6_start()
	elseif switch == 7 then
		a2gh7_start()
	elseif switch == 8 then
		a2gh8_start()
	elseif switch == 9 then
		a2gh9_start()
	elseif switch == 10 then
		a2gh10_start()		

	end
	arrayZoneAGH[switch][4] = true
	
	if ai_troops_transport_location == "a2g helo" then
		timer.scheduleFunction(function() 
			helo_transport("agh")
		end, nil, timer.getTime() + 5  )
	end
end


function a2gia_start()
unitThresholdAGHIA = false
-- To allow searching for units above AGL to despawn them.
--allow_mr_agl_search = true
--allow_ag_agl_search = true
--allow_agh_agl_search = true
allow_inf_agl_search = true


timer.scheduleFunction(function() --Stop searching for above AGL spawned units
	--allow_mr_agl_search = false
	--allow_ag_agl_search = false
	--allow_agh_agl_search = false
	allow_inf_agl_search = false
end, nil, timer.getTime() + search_agl_time )

InfMissionNameGen()
trigger.action.setUserFlag('AGHIA-STARTING', true)
	--local switch = math.random(6, 10)
	
local switch;
repeat
	switch = math.random (6,10)
until switch ~= lastA2GIA;
lastA2GIA = switch;
	
	if switch == 1 then
		a2gia1_start()
	elseif switch == 2 then
		a2gia2_start()
	elseif switch == 3 then
		a2gia3_start()
	elseif switch == 4 then
		a2gia4_start()
	elseif switch == 5 then
		a2gia5_start()
	elseif switch == 6 then
		env.info('TTI: Spawning infantry assault mission 6')
		a2gia6_start()
	elseif switch == 7 then
		env.info('TTI: Spawning infantry assault mission 7')
		a2gia7_start()
	elseif switch == 8 then
		env.info('TTI: Spawning infantry assault mission 8')
		a2gia8_start()
	elseif switch == 9 then
		env.info('TTI: Spawning infantry assault mission 9')
		a2gia9_start()
	elseif switch == 10 then
		env.info('TTI: Spawning infantry assault mission 10')
		a2gia10_start()
	end
	arrayZoneINFAS[switch-5][4] = true
	
	if ai_troops_transport_location == "a2g infantry assault" then
		timer.scheduleFunction(function() 
			helo_transport("ia")
		end, nil, timer.getTime() + 5  )
	end
	
end


function a2gj1_start()  --1 per group
for i=1, a2g_hard_misc  do
	A2GJ:SpawnInZone( poly_AG1, true )
	--A2GJ_Vehicle = A2GJ:SpawnInZone( poly_AG1, true )
	--A2GJ_Vehicle_Type = A2GJ_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2GJ unit type ' .. A2GJ_Vehicle_Type)
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG1, true )
	--A2G_AA_Vehicle = A2G_AA:SpawnInZone( poly_AG1, true )
	--A2G_AA_Vehicle_Type = A2G_AA_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2G AA unit type ' .. A2G_AA_Vehicle_Type)
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG1, true )
	--A2G_SAM_Vehicle = A2G_SAM:SpawnInZone( poly_AG1, true )
	--A2G_SAM_Vehicle_Type = A2G_SAM_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2G SAM unit type ' .. A2G_SAM_Vehicle_Type)
end

if enable_jtac_drones == true then 
	activate_A2G1_jtac()
end
	create_ag_1_marker()
end

function a2gj2_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG2, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG2, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG2, true )
end
if enable_jtac_drones == true then 
activate_A2G2_jtac()
end
create_ag_2_marker()
end

function a2gj3_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG3, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG3, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG3, true )
end
if enable_jtac_drones == true then 
activate_A2G3_jtac()
end
create_ag_3_marker()
end

function a2gj4_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG4, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG4, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG4, true )
end
if enable_jtac_drones == true then 
activate_A2G4_jtac()
end
create_ag_4_marker()
end

function a2gj5_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG5, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG5, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG5, true )
end
if enable_jtac_drones == true then 
activate_A2G5_jtac()
end
create_ag_5_marker()
end

function a2gj6_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG6, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG6, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG6, true )
end
if enable_jtac_drones == true then 
activate_A2G6_jtac()
end
create_ag_6_marker()
end

function a2gj7_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG7, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG7, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG7, true )
end
if enable_jtac_drones == true then 
activate_A2G7_jtac()
end
create_ag_7_marker()
end

function a2gj8_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG8, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG8, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG8, true )
end
if enable_jtac_drones == true then 
activate_A2G8_jtac()
end
create_ag_8_marker()
end

function a2gj9_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG9, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG9, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG9, true )
end
if enable_jtac_drones == true then 
activate_A2G9_jtac()
end
create_ag_9_marker()
end

function a2gj10_start()  --1 per group
for i=1, a2g_hard_misc do
	A2GJ:SpawnInZone( poly_AG10, true )
end
for i=1, a2g_hard_aa do
	A2G_AA:SpawnInZone( poly_AG10, true )
end
for i=1, a2g_hard_sam do
	A2G_SAM:SpawnInZone( poly_AG10, true )
end
if enable_jtac_drones == true then 
activate_A2G10_jtac()
end
create_ag_10_marker()
end

function a2gmr1_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR1, true )
	--A2GMR_Vehicle = A2GMR:SpawnInZone( poly_MR1, true )
	--A2GMR_Vehicle_Type = A2GMR_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2GJ unit type ' .. A2GMR_Vehicle_Type)
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR1, true )
	--A2G_AA_Vehicle = A2G_AA:SpawnInZone( poly_MR1, true )
	--A2G_AA_Vehicle_Type = A2G_AA_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2G AA unit type ' .. A2G_AA_Vehicle_Type)
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR1, true )
	--A2G_SAM_Vehicle = A2G_SAM:SpawnInZone( poly_MR1, true )
	--A2G_SAM_Vehicle_Type = A2G_SAM_Vehicle:GetTypeName()
	--env.info('TTI - Spawning A2G SAM unit type ' .. A2G_SAM_Vehicle_Type)
end
if enable_jtac_drones == true then 
activate_MR1_jtac()
end
create_mr_1_marker()
end

function a2gmr2_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR2, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR2, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR2, true )
end
if enable_jtac_drones == true then 
activate_MR2_jtac()
end
create_mr_2_marker()
end

function a2gmr3_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR3, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR3, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR3, true )
end
if enable_jtac_drones == true then 
activate_MR3_jtac()
end
create_mr_3_marker()
end

function a2gmr4_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR4, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR4, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR4, true )
end
if enable_jtac_drones == true then 
activate_MR4_jtac()
end
create_mr_4_marker()
end

function a2gmr5_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR5, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR5, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR5, true )
end
if enable_jtac_drones == true then 
activate_MR5_jtac()
end
create_mr_5_marker()
end

function a2gmr6_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR6, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR6, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR6, true )
end
if enable_jtac_drones == true then 
activate_MR6_jtac()
end
create_mr_6_marker()
end

function a2gmr7_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR7, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR7, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR7, true )
end
if enable_jtac_drones == true then 
activate_MR7_jtac()
end
create_mr_7_marker()
end

function a2gmr8_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR8, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR8, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR8, true )
end
if enable_jtac_drones == true then 
activate_MR8_jtac()
end
create_mr_8_marker()
end

function a2gmr9_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR9, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR9, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR9, true )
end
if enable_jtac_drones == true then 
activate_MR9_jtac()
end
create_mr_9_marker()
end

function a2gmr10_start()  --1 per group
for i=1, a2g_easy_misc do
	A2GMR:SpawnInZone( poly_MR10, true )
end
for i=1, a2g_easy_aa do
	A2G_AA:SpawnInZone( poly_MR10, true )
end
for i=1, a2g_easy_sam do
	A2G_SAM:SpawnInZone( poly_MR10, true )
end
if enable_jtac_drones == true then 
activate_MR10_jtac()
end
create_mr_10_marker()
end

function a2gas1_start()  --1 per group
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS1, true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS1, true )
	end
end
create_as_1_marker()
end

function a2gas2_start()  --1 per group
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS2, true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS2, true )
	end
end
create_as_2_marker()
end

function a2gas3_start()  --1 per group
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS3, true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS3, true )
	end
end
create_as_3_marker()
end

function a2gas4_start()  --4 per group
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS4, true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS4, true )
	end
end
create_as_4_marker()
end

function a2gas5_start()  --5 per group
if enemy_ship_ai == true then
	for i=1, a2g_antiship do
		A2GAS:SpawnInZone( ASS5, true )
	end
elseif enemy_ship_ai == false then
	for i=1, a2g_antiship do
		A2GAS_Disabled:SpawnInZone( ASS5, true )
	end
end
create_as_5_marker()
end

function a2gh1_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH1, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH1, true )
end
if enable_jtac_drones == true then 
activate_AGH1_jtac()
end
create_agh_1_marker()
end

function a2gh2_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH2, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH2, true )
end
if enable_jtac_drones == true then 
activate_AGH2_jtac()
end
create_agh_2_marker()
end

function a2gh3_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH3, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH3, true )
end
if enable_jtac_drones == true then 
activate_AGH3_jtac()
end
create_agh_3_marker()
end

function a2gh4_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH4, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH4, true )
end
if enable_jtac_drones == true then 
activate_AGH4_jtac()
end
create_agh_4_marker()
end

function a2gh5_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH5, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH5, true )
end
if enable_jtac_drones == true then 
activate_AGH5_jtac()
end
create_agh_5_marker()
end


function a2gh6_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH6, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH6, true )
end
if enable_jtac_drones == true then 
activate_AGH6_jtac()
end
create_agh_5_marker()
end

function a2gh7_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH7, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH7, true )
end
if enable_jtac_drones == true then 
activate_AGH7_jtac()
end
create_agh_7_marker()
end

function a2gh8_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH8, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH8, true )
end
if enable_jtac_drones == true then 
activate_AGH8_jtac()
end
create_agh_8_marker()
end

function a2gh9_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH9, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH9, true )
end
if enable_jtac_drones == true then 
activate_AGH9_jtac()
end
create_agh_9_marker()
end

function a2gh10_start()  --1 per group
for i=1, a2g_helo_misc do
	A2GH:SpawnInZone( poly_AGH10, true )
end
for i=1, a2g_helo_aa do
	A2G_AA:SpawnInZone( poly_AGH10, true )
end
if enable_jtac_drones == true then 
activate_AGH10_jtac()
end
create_agh_10_marker()
end

function a2gia1_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH1, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH1, true )
end
if enable_jtac_drones == true then 
activate_AGH1_jtac()
end
create_infas_1_marker()
end

function a2gia2_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH2, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH2, true )
end
if enable_jtac_drones == true then 
activate_AGH2_jtac()
end
create_infas_2_marker()
end

function a2gia3_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH3, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH3, true )
end
if enable_jtac_drones == true then 
activate_AGH3_jtac()
end
create_infas_3_marker()
end

function a2gia4_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH4, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH4, true )
end
if enable_jtac_drones == true then 
activate_AGH4_jtac()
end
create_infas_4_marker()
end

function a2gia5_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH5, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH5, true )
end
if enable_jtac_drones == true then 
activate_AGH5_jtac()
end
create_infas_5_marker()
end

function a2gia6_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH6, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH6, true )
end
if enable_jtac_drones == true then 
activate_AGH6_jtac()
end
create_infas_6_marker()
end

function a2gia7_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH7, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH7, true )
end
if enable_jtac_drones == true then 
activate_AGH7_jtac()
end
create_infas_7_marker()
end

function a2gia8_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH8, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH8, true )
end
if enable_jtac_drones == true then 
activate_AGH8_jtac()
end
create_infas_8_marker()
end

function a2gia9_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH9, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH9, true )
end
if enable_jtac_drones == true then 
activate_AGH9_jtac()
end
create_infas_9_marker()
end

function a2gia10_start()  --1 per group
for i=1, a2g_inf_troops do
	A2GIA:SpawnInZone( poly_AGH10, true )
end
for i=1, a2g_inf_misc do
	A2GIAM:SpawnInZone( poly_AGH10, true ) 
end
if enable_jtac_drones == true then 
activate_AGH10_jtac()
end
create_infas_10_marker()
end

enable_convoy_missions = true
--convoy_map_markers = true

cnv_mission_min = 1
cnv_mission_max = 3 --default 3


TemplateTable_CONVOY_GROUND_MODERN = {
	"convoy_template_modern",
}

TemplateTable_CONVOY_GROUND_WW2 = {
	"convoy_template_ww2",
}

TemplateTable_CONVOY_GROUND_KOREAN_WAR = {
	"convoy_template_korean_war",
}

if mission_era == "modern" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_MODERN)
end

if mission_era == "ww2" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_WW2)
end

if mission_era == "korean_war" then
Convoy1 = SPAWN:New("Convoy1")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)

Convoy2 = SPAWN:New("Convoy2")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)

Convoy3 = SPAWN:New("Convoy3")
:InitRandomizeTemplate(TemplateTable_CONVOY_GROUND_KOREAN_WAR)
end


Convoy1_alive = false
Convoy2_alive = false
Convoy3_alive = false

function random_convoy_start()
	timer.scheduleFunction(function()
		if enable_convoy_missions == true then
			local switch;
			repeat
				switch = math.random(cnv_mission_min,cnv_mission_max)
			until switch ~= lastConvoy;
			lastConvoy = switch;
				
			ConvoyMissionNameGen()
			trigger.action.outText( "<< Convoy Hunt Mission ".. switch .." started: \""..ConvoyMissionName.."\" >>", 20)
			env.info( "TTI: Convoy Hunt Mission ".. switch ..": \""..ConvoyMissionName.."\" started.")
			trigger.action.outSound("TTI Soundfiles/Ui beep.ogg" )
			
			if switch == 1 then
				Convoy1_start()
			elseif switch == 2 then
				Convoy2_start()
			elseif switch == 3 then
				Convoy3_start()
			end
		end
	end, nil, timer.getTime() + 3 )
end

function Convoy1_start()
	Convoy1_alive = true
	Convoy1spawn = Convoy1:OnSpawnGroup(
		function( SpawnGroup )
			Convoy1GroupName = Convoy1spawn:GetName()
			Convoy1Zone = ZONE_GROUP:New("Convoy1Zone", Convoy1spawn, 20)
		end)
	:Spawn()

	function Convoy1spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy1GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy1GroupName .." status:")

		timer.scheduleFunction(function() 
			if Convoy1spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy1GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy1GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				trigger.action.removeMark(cnv_id[1])
				Convoy1_alive = false
				if convoy_missions_autostart == true then
					random_convoy_start()
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy1_marker()
Convoy1spawn:HandleEvent( EVENTS.Dead )
end

function convoy1_alive_check()
	env.info("TTI: " .. Convoy1GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[1])
	Convoy1_alive = false
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end

function Convoy2_start()
	Convoy2_alive = true
	Convoy2spawn = Convoy2:OnSpawnGroup(
		function( SpawnGroup )
			Convoy2GroupName = Convoy2spawn:GetName()
			Convoy2Zone = ZONE_GROUP:New("Convoy2Zone", Convoy2spawn, 20)
		end)
	:Spawn()

	function Convoy2spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy2GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy2GroupName .." status:")
		timer.scheduleFunction(function() 
			if Convoy2spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy2GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy2GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				trigger.action.removeMark(cnv_id[2])
				Convoy2_alive = false
				if convoy_missions_autostart == true then
					random_convoy_start()
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy2_marker()
Convoy2spawn:HandleEvent( EVENTS.Dead )
end

function convoy2_alive_check()
	env.info("TTI: " .. Convoy2GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[2])
	Convoy2_alive = false
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end

function Convoy3_start()
	Convoy3_alive = true
	
	Convoy3spawn = Convoy3:OnSpawnGroup(
		function( SpawnGroup )
			Convoy3GroupName = Convoy3spawn:GetName()
			Convoy3Zone = ZONE_GROUP:New("Convoy3Zone", Convoy3spawn, 20)
		end)
	:Spawn()
	
	function Convoy3spawn:OnEventDead(EventData)
		env.info("TTI: " .. Convoy3GroupName .. " unit destroyed!")
		env.info("TTI: ... Checking for " .. Convoy3GroupName .." status:")
		
		timer.scheduleFunction(function() 
			if Convoy3spawn:IsAlive() == true then
				env.info("TTI: " .. Convoy3GroupName .." group is alive!")
				else
				env.info("TTI: " .. Convoy3GroupName .." group is destroyed!")
				trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
				trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
				trigger.action.removeMark(cnv_id[3])
				Convoy3_alive = false
				if convoy_missions_autostart == true then
					random_convoy_start()
				end
			end
		end, nil, timer.getTime() + 2 )
	end
create_convoy3_marker()
Convoy3spawn:HandleEvent( EVENTS.Dead )
end

function convoy3_alive_check()
	env.info("TTI: " .. Convoy3GroupName .." group is destroyed!")
	trigger.action.outText( "<< Convoy Hunt Mission: \""..ConvoyMissionName.."\" complete! >>", 10)
	trigger.action.outSound("TTI Soundfiles/Ace Combat Mission Accomplished.ogg" )
	trigger.action.removeMark(cnv_id[3])
	Convoy3_alive = false
	if convoy_missions_autostart == true then
		random_convoy_start()
	end
end

cnv_id = {}

function create_convoy1_marker()
	if convoy_map_markers == true and Convoy1_alive == true then
		Convoy1Zone_vec = Convoy1spawn:GetVec3()
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if cnv_id[1] ~= nil then
				trigger.action.removeMark(cnv_id[1])	
			end
		cnv_id[1] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[1],"Convoy Hunt Mission 1: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy1Zone_vec,true)
	end
end

function create_convoy2_marker()
	if convoy_map_markers == true and Convoy2_alive == true then
		Convoy2Zone_vec = Convoy2spawn:GetVec3()
		--Convoy1Zone_vec = Convoy1Zone:GetVec3()
			if cnv_id[2] ~= nil then
				trigger.action.removeMark(cnv_id[2])	
			end
		cnv_id[2] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[2],"Convoy Hunt Mission 2: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy2Zone_vec,true)
	end
end

function create_convoy3_marker()
	if convoy_map_markers == true and Convoy3_alive == true then
		Convoy3Zone_vec = Convoy3spawn:GetVec3()
			if cnv_id[3] ~= nil then
				trigger.action.removeMark(cnv_id[3])	
			end
		cnv_id[3] = UTILS.GetMarkID()
		trigger.action.markToAll(cnv_id[3],"Convoy Hunt Mission 3: \n\""..ConvoyMissionName.."\"\n>> Convoy's last known position <<",Convoy3Zone_vec,true)
	end
end

timer.scheduleFunction(function() 
	if convoy_missions_autostart == true then
		random_convoy_start()
		env.info( "TTI: A2G Convoy Started" )
	end
end, nil, timer.getTime() + 120  )

env.info('functions ground init ok')

trigger.action.outText("Ground LUA File Loaded...", 10)
env.info('Deadly GROUND scripting complete')