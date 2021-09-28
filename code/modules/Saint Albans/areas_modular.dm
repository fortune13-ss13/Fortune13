//Pebbles St. Albans areas file.


//Outdoor areas

/area/outdoors
	icon = 'icons/fallout/module_rivermap/turfs/areas_modular.dmi'
	name = "Wasteland"
	icon_state = "wasteland"
	has_gravity = 1
	ambientsounds = list('sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg', \
	'sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/rattlesnake_2.ogg','sound/f13ambience/rattlesnake_3.ogg','sound/f13ambience/bird_1.ogg','sound/f13ambience/bird_2.ogg','sound/f13ambience/bird_3.ogg','sound/f13ambience/bird_4.ogg')
	outdoors = 1
	open_space = 1
	blob_allowed = 0
	environment = 19
	grow_chance = 15

/area/outdoors/manhole
	name = "Manhole Surface"
	icon_state = "manhole"


//Indoor areas

/area/indoors
	icon = 'icons/fallout/module_rivermap/turfs/areas_modular.dmi'
	name = "Building"
	icon_state = "building"
	ambientsounds = list('sound/f13ambience/ambigen_3.ogg','sound/f13ambience/ambigen_4.ogg','sound/f13ambience/ambigen_5.ogg', \
	'sound/f13ambience/ambigen_6.ogg','sound/f13ambience/ambigen_7.ogg','sound/f13ambience/ambigen_8.ogg')
	has_gravity = 1
	grow_chance = 1

/area/indoors/farmhouse
	name = "Farmhouse"
	icon_state = "farmhouse"
	grow_chance = 4
	ambientsounds = list('sound/f13effects/thunder_distant_1.ogg','sound/f13effects/thunder_distant_2.ogg','sound/ambience/seag3.ogg', \
	'sound/ambience/seag2.ogg','sound/f13ambience/bird_1.ogg','sound/f13ambience/bird_2.ogg', \
	'sound/f13ambience/bird_3.ogg', 'sound/ambience/shore.ogg','sound/weather/ashstorm/outside/weak_start.ogg')

/area/indoors/ruins
	name = "Ruins"
	icon_state = "ruins"
	ambientsounds = list('sound/f13ambience/ambigen_3.ogg','sound/f13ambience/ambigen_4.ogg','sound/f13ambience/ambigen_5.ogg', \
	'sound/f13ambience/ambigen_6.ogg','sound/f13ambience/ambigen_7.ogg','sound/f13ambience/ambigen_8.ogg','sound/f13ambience/ambigen_15.ogg','sound/f13ambience/ambigen_16.ogg')

/area/indoors/manhole
	name = "Manhole Underground"
	icon_state = "manhole"

/area/indoors/arcade
	name = "Arcade"
	icon_state = "arcade"
	ambientsounds = list('sound/f13ambience/ambigen_3.ogg','sound/f13ambience/ambigen_4.ogg','sound/f13ambience/ambigen_5.ogg', \
	'sound/f13ambience/ambigen_6.ogg','sound/f13ambience/ambigen_7.ogg','sound/lavaland/cursed_slot_machine_jackpot.ogg')

/area/indoors/sewer
	name = "Sewer"
	icon_state = "sewer"
	ambientsounds = list('sound/f13ambience/ambigen_9.ogg','sound/f13effects/steam_short.ogg','sound/f13effects/steam_long.ogg', 'sound/hallucinations/veryfar_noise.ogg')
	grow_chance = 20

/area/indoors/caves
	name = "Caves"
	icon_state = "caves"
	ambientsounds = list('sound/f13ambience/ambigen_15.ogg','sound/f13ambience/ambigen_16.ogg','sound/f13ambience/ambigen_17.ogg','sound/f13ambience/ambigen_18.ogg','sound/f13ambience/ambigen_19.ogg')
	grow_chance = 25

//Hostile Areas

/area/indoors/bunker
	name = "Bunker"
	icon_state = "bunker"
	ambientsounds = list('sound/f13ambience/ambigen_1.ogg','sound/f13ambience/ambigen_2.ogg','sound/f13ambience/ambigen_9.ogg','sound/f13ambience/ambigen_10.ogg','sound/f13ambience/ambigen_11.ogg', \
	'sound/f13ambience/ambigen_12.ogg','sound/f13ambience/ambigen_13.ogg')

/area/indoors/tribals
	name = "Tribals"
	icon_state = "tribals"
	ambientsounds = list('sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/bird_1.ogg','sound/f13ambience/bird_2.ogg','sound/f13ambience/bird_3.ogg','sound/f13ambience/bird_4.ogg','sound/f13ambience/bird_5.ogg','sound/f13ambience/bird_6.ogg','sound/f13ambience/bird_7.ogg','sound/f13ambience/bird_8.ogg')
	grow_chance = 5

/area/indoors/animals
	name = "Animals"
	icon_state = "animals"
	ambientsounds = list('sound/f13ambience/bird_1.ogg','sound/f13ambience/bird_2.ogg','sound/f13ambience/bird_3.ogg','sound/f13ambience/bird_4.ogg','sound/f13ambience/bird_5.ogg', \
	'sound/f13ambience/bird_6.ogg','sound/f13ambience/bird_7.ogg','sound/f13ambience/bird_8.ogg', \
	'sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg',)

/area/indoors/bandits
	name = "Bandits"
	icon_state = "bandits"
	ambientsounds = list('sound/f13ambience/ambigen_1.ogg','sound/f13ambience/ambigen_2.ogg','sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')
	grow_chance = 2

/area/indoors/radiation
	name = "Radiation"
	icon_state = "radiation"
	ambientsounds = list('sound/f13ambience/rattlesnake_1.ogg','sound/f13ambience/wasteland.ogg','sound/f13ambience/drops.ogg', 'sound/hallucinations/wail.ogg')


//Factions
/area/indoors/enclave
	name = "Enclave"
	icon_state = "enclave"
	ambientsounds = list('sound/f13ambience/ambigen_10.ogg','sound/f13ambience/ambigen_11.ogg','sound/f13ambience/ambigen_12.ogg', \
	'sound/f13ambience/ambigen_13.ogg','sound/f13ambience/ambigen_14.ogg','sound/ambience/signal.ogg','sound/f13ambience/enclave_vault.ogg')

/area/indoors/enclave/hq
	name = "Enclave Command Centre"
	icon_state = "enclavehq"
	ambientsounds = list('sound/ambience/ambitech.ogg','sound/ambience/ambitech2.ogg','sound/f13ambience/ambigen_12.ogg', 'sound/f13ambience/enclave_vault.ogg', \
	'sound/ambience/ambitech3.ogg','sound/f13ambience/ambigen_14.ogg','sound/ambience/signal.ogg','sound/f13/broadcast.ogg')

/area/indoors/raiders
	name = "Raiders"
	icon_state = "raiders"
	ambientsounds = list('sound/f13ambience/ambigen_1.ogg','sound/f13ambience/ambigen_2.ogg','sound/f13ambience/dog_distant_1.ogg','sound/f13ambience/dog_distant_2.ogg','sound/f13ambience/dog_distant_3.ogg', \
	'sound/f13ambience/battle_1.ogg','sound/f13ambience/battle_2.ogg','sound/f13ambience/battle_3.ogg')

/area/indoors/town
	name = "Riverton"
	icon_state = "town"
	ambientsounds = list('sound/f13ambience/ambigen_1.ogg','sound/f13ambience/ambigen_2.ogg','sound/f13ambience/ambigen_3.ogg','sound/f13ambience/ambigen_4.ogg', \
	'sound/f13ambience/ambigen_5.ogg','sound/f13ambience/ambigen_6.ogg','sound/f13ambience/ambigen_7.ogg','sound/f13ambience/ambigen_8.ogg','sound/f13ambience/ambigen_9.ogg','sound/f13ambience/ambigen_17.ogg','sound/f13ambience/ambigen_18.ogg','sound/f13ambience/ambigen_19.ogg')

/area/indoors/town/clinic
	name = "Riverton clinic"
	icon_state = "townclinic"

/area/indoors/town/bar
	name = "Riverton Bar"
	icon_state = "townbar"

/area/indoors/town/chapel
	name = "Chapel"
	icon_state = "townchapel"
	ambientsounds = list('sound/ambience/ambicha1.ogg','sound/ambience/ambicha2.ogg','sound/ambience/ambicha3.ogg','sound/ambience/ambicha4.ogg')

/area/indoors/mercenaries
	name = "Mercenaries"
	icon_state = "mercs"

/area/shuttle/riverbarge
	name = "Riverbarge"
	icon_state = "town"
