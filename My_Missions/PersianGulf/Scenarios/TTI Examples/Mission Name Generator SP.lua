HardMissionName = ""
EasyMissionName = ""
EasyBMissionName = ""
NormMissionName = ""
NormBMissionName = ""
HeloMissionName = ""
InfMissionName = ""
InvMissionName = ""
DeepStrikeMissionName = ""
ShipMissionName = ""

EasyAdj = {
"Simple",
"Quick",
"Fried",
"Boiled",
"Baked",
"Prized",
"Hilarious",
"Violet",
"Yellow",
"Illegal",
"Over-Powered",
"Flaming",
"Burning",
"Glass",
"Illegitimate",
"Unwanted",
"Obnoxious",
"Needless",
"Discarded",
"Disowned",
"Obtuse",
"Useless",
"Purple",
"Hungry",
"Moist",
"Happy",
"Spiteful",
"Sacred",
"Shiny",
"Shining",
"Stinky",
"Tropical",
"Miscalculated",
"Misguided",
"Frozen",
"Baby",
"Easy",
"Terminal",
"Contaminated",
"Cinnamon",
"Furry",
"Angry",
"Upset",
}

EasyNoun = {
"Capture",
"Underworld",
"Attack",
"Offensive",
"Escape",
"Infiltration",
"Juice",
"Ember",
"Sunshine",
"Diaper",
"Watermelon",
"Illness",
"Strawberry",
"Baby",
"Fruit",
"Cocktail",
"Fairy",
"Machine",
"Fuel",
"Steam",
"Milk",
"Pineapple",
"Dookie",
"Gun",
"Pillow",
"Laser",
"Squirrel",
"Toilet",
"Pigeon",
"Cake",
"Cinnamon Roll",
"Executioner",
"Frying Pan",
"Spatula",
"Duck",
"Dog",
"Excrement",
"Freedom",
"Potato",
"Lizard",
}

function EasyMissionNameGen()
EasyMissionName = "Operation " .. EasyAdj[math.random(1,#EasyAdj)] .. " " .. EasyNoun[math.random(1,#EasyNoun)] .. ""
env.info('Easy mission name generated '.. EasyMissionName ..'')
end

function EasyBMissionNameGen()
EasyBMissionName = "Operation " .. EasyAdj[math.random(1,#EasyAdj)] .. " " .. EasyNoun[math.random(1,#EasyNoun)] .. ""
env.info('Easy mission name generated '.. EasyBMissionName ..'')
end

HardAdj = {
"Quick",
"Ruthless",
"Raging",
"Violent",
"Hot",
"Raging",
"Dying",
"Dark",
"Evading",
"Rolling",
"Sinister",
"Furious",
"Angry",
"Colossal",
"Blazing",
"Wrecked",
"Thrashed",
"Booming",
"Flaming",
"Impossible",
"Scattered",
"Heavy",
}

HardNoun = {
"Shadow",
"Destruction",
"Strike",
"Thunder",
"Steed",
"Evasion",
"Darkness",
"Fury",
"Plague",
"Virus",
"Samurai",
"Chaos",
"Emblem",
"Mamouth",
"Edge",
"Fate",
"Fire",
"Infection",
"Inferno",
"Fog",
"Lightning",
"Graveyard",
"Infnity",
"Impact",
"Sword",
"Zero",
"Revolution",
"Excalibur",
"Hound",
"Lizard",
}

function HardMissionNameGen()
HardMissionName = "Operation " .. HardAdj[math.random(1,#HardAdj)] .. " " .. HardNoun[math.random(1,#HardNoun)] .. ""
env.info('Hard mission name generated '.. HardMissionName ..'')
end

NormAdj = {
"Simple",
"Quick",
"Fried",
"Boiled",
"Baked",
"Prized",
"Hilarious",
"Violet",
"Yellow",
"Illegal",
"Over-Powered",
"Flaming",
"Burning",
"Glass",
"Illegitimate",
"Unwanted",
"Obnoxious",
"Needless",
"Discarded",
"Disowned",
"Obtuse",
"Useless",
"Purple",
"Hungry",
"Moist",
"Happy",
"Quick",
"Ruthless",
"Raging",
"Violent",
"Hot",
"Raging",
"Dying",
"Dark",
"Evading",
"Rolling",
"Sinister",
"Furious",
"Angry",
"Colossal",
"Blazing",
"Wrecked",
"Thrashed",
"Booming",
"Flaming",
"Impossible",
"Scattered",
"Heavy",
}

NormNoun = {
"Capture",
"Underworld",
"Attack",
"Offensive",
"Escape",
"Infiltration",
"Juice",
"Ember",
"Sunshine",
"Diaper",
"Watermelon",
"Illness",
"Strawberry",
"Shadow",
"Destruction",
"Strike",
"Thunder",
"Steed",
"Evasion",
"Darkness",
"Fury",
"Plague",
"Virus",
"Samurai",
"Chaos",
"Emblem",
"Mamouth",
"Edge",
"Fate",
"Baby",
"Fruit",
"Cocktail",
"Fairy",
"Machine",
"Fuel",
"Steam",
"Milk",
"Pineapple",
"Dookie",
"Gun",
"Pillow",
"Laser",
"Squirrel",
"Toilet",
"Pigeon",
"Cake",
"Cinnamon Roll",
"Executioner",
"Frying Pan",
"Spatula",
"Duck",
"Dog",
"Excrement",
"Freedom",
"Potato",
"Lizard",
}

function NormMissionNameGen()
NormMissionName = "Operation " .. NormAdj[math.random(1,#NormAdj)] .. " " .. NormNoun[math.random(1,#NormNoun)] .. ""
env.info('Norm mission name generated '.. NormMissionName ..'')
end

function NormBMissionNameGen()
NormBMissionName = "Operation " .. NormAdj[math.random(1,#NormAdj)] .. " " .. NormNoun[math.random(1,#NormNoun)] .. ""
env.info('Norm B mission name generated '.. NormBMissionName ..'')
end

HeloAdj = {
"Simple",
"Quick",
"Unwavering",
"Devoured",
"Devoted",
"Spiral",
"Dying",
"Sharp",
"Cunning",
"Spinning",
"Blind",
"Circular",
"Angry",
"Zipping",
"Whirly",
}

HeloNoun = {
"Wasp",
"Cyclone",
"Rat",
"Steel",
"Dead",
"Tornado",
"Birds",
"Magma",
"Cricket",
"Cicada",
"Flame",
"Skies",
"Hideout",
"Ground Dweller",
"Mole Rat",
"Mole",
"Turtle",
"Bounty",
"Trench",
"Jupiter",
"Foxhole",
"Hive",
"Gunner",
}

function HeloMissionNameGen()
HeloMissionName = "Operation " .. HeloAdj[math.random(1,#HeloAdj)] .. " " .. HeloNoun[math.random(1,#HeloNoun)] .. ""
env.info('Helo mission name generated '.. HeloMissionName ..'')
end

InfAdj = {
"Careless",
"Instant",
"Unfortunate",
"Swift",
"The Final",
"Crimson",
"Final",
"Red",
"Green",
"Orange",
"Malnourished",
"Dishonorable",
"Disgraceful",
"Wrongful",
"Unethical",
"Painful",
"Lead",
"Vengeful",
"Expendable",
"Bloody",
"Unforgiving",
"Unnecessary",
"Insufferable",
"Burned",
"Unrelenting",
"Brutal",
"Vicious",
"Furious",
}

InfNoun = {
"Crimes",
"Wounds",
"Beaver",
"Trooper",
"Epidemic",
"Terror",
"Rain",
"Sparrow",
"Soil",
"Grinder",
"Execution",
"Encamptment",
"Camp",
"Mist",
"Countdown",
"Chamber",
"Woodpecker",
"Wrath",
"Panda",
"Light",
"Punishment",
"Solution",
"Forest",
"Playground",
"Suburb",
"Slaughter",
}

function InfMissionNameGen()
InfMissionName = "Operation " .. InfAdj[math.random(1,#InfAdj)] .. " " .. InfNoun[math.random(1,#InfNoun)] .. ""
env.info('Inf mission name generated '.. InfMissionName ..'')
end

ShipAdj = {
"Windy",
"Hungering",
"Relentless",
"Angry",
"Scurvy",
"Furious",
"Hunting",
"Silent",
"Hidden",
"Stealth",
"Sandy",
"Deep",
"Red",
"Mysterious",
"Fearful",
"Blue",
"Dry",
"Misty",
"Beyond The",
"Wet",
"Crimson",
"Shallow",
"Stormy",
"Chinese",
}

ShipNoun = {
"Tide",
"Tides",
"Tide Pods",
"Tide Pod",
"Blunder",
"Wetness",
"October",
"Wave",
"Surf",
"Crest",
"Sea",
"Hunt",
"Ocean",
"Squid",
"Puddle",
"Neptune",
"Oil",
"Kraken",
"Depths",
"Echo",
"Serpent",
"Sonar",
"Whirlpool",
"Tsunami",
"Depth",
"Depths",
"Clams",
"Clam",
"Seashell",
"Seagull",
"Guppy",
"Tuna",
"Fish",
"Shark",
"Current",
"Wake",
"Smoke",
"Destroyer",
"Dishonor",
"Great Wall",
"Mongolia",
"Artificial Island",
"Child Labor iPhone Factory",
}

function ShipMissionNameGen()
ShipMissionName = "Operation " .. ShipAdj[math.random(1,#ShipAdj)] .. " " .. ShipNoun[math.random(1,#ShipNoun)] .. ""
env.info('Ship mission name generated '.. ShipMissionName ..'')
end

DeepStrikeAdj = {
"Quiet",
"Loud",
"Infinite",
"Intense",
"Extreme",
"The Final",
"Unchained",
"Thrusting",
"Final",
"Vengeful",
"Cleansed",
"High Impact",
}

DeepStrikeNoun = {
"Dogma",
"Demon",
"Revengeance",
"Infinity",
"Oblivion",
"Revenge",
"Armaggedon",
"Apocalypse",
"Beast",
"Manticore",
"Leviathan",
"Dragon",
"Disaster",
"Anahilation",
"Expansion",
"Fort",
"Emancipation",
"Fear",
}

function DeepStrikeMissionNameGen()
DeepStrikeMissionName = "Operation " .. DeepStrikeAdj[math.random(1,#DeepStrikeAdj)] .. " " .. DeepStrikeNoun[math.random(1,#DeepStrikeNoun)] .. ""
env.info('DeepStrike mission name generated '.. DeepStrikeMissionName ..'')
end

InvAdj = {
"Helpless",
"Fearful",
"Defiant",
"Resiliant",
"Precious",
"Sacred",
"Helpful",
"Treasured",
}

InvNoun = {
"Castle",
"Shield",
"Home",
"Island",
"Complex",
"Tower",
"Treasure",
"Future",
"Cathedral",
"Struggle",
"Salvation",
}

function InvMissionNameGen()
InvMissionName = "Operation " .. InvAdj[math.random(1,#InvAdj)] .. " " .. InvNoun[math.random(1,#InvNoun)] .. ""
env.info('Inv mission name generated '.. InvMissionName ..'')
end

env.info('TTI: Mission Name Generator loaded!')
--trigger.action.outText("Mission Name Generator LUA file loaded...", 10)