//Pebbles modular structures.

/obj/structure/wasteoutlet
	name = "waste outlet pipe"
	desc = "A pipe."
	icon = 'icons/fallout/furniture/stationary.dmi'
	icon_state = "wasteoutlet"
	density = 0
	anchored = 1

/obj/structure/memorial/rivertown
	name = "statue of a smug ghoul"
	desc = "A statue of the first Alderman, Jeremiah, the greediest ghoul of his day. He got together the first armed gangs who controlled the bridge, collecting tolls, which evolved into a proper settlement over time."
	icon = 'icons/fallout/objects/structures/statue.dmi'
	icon_state = "statue_rivertown"
	bound_width = 64
	bound_height = 64
	anchored = 1
	density = 1
	layer = ABOVE_MOB_LAYER
	resistance_flags = INDESTRUCTIBLE

/obj/structure/memorial/rivertown/Initialize()
	. = ..()
	AddComponent(/datum/component/largetransparency, x_size = 1, y_size = 2)


//RAILING
/obj/structure/railing
	icon = 'icons/fallout/structures/fences.dmi'

/obj/structure/railing/wood
	name = "wooden fence"
	desc = "Marks property and prevents accidents."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "straight_wood"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/wood/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/wood/corner 
	icon_state = "corner_wood"
	density = FALSE

/obj/structure/railing/wood/corner/underlayer
	layer = BELOW_MOB_LAYER

/obj/structure/railing/wood/corner/post
	icon_state = "post_wood"
	density = FALSE

/obj/structure/railing/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'icons/fallout/structures/fences.dmi'
	icon_state = "handrail_y"
	layer = WALL_OBJ_LAYER

/obj/structure/railing/handrail/end
	icon_state = "handrail_y_end"
	density = FALSE

/obj/structure/railing/handrail/intersect
	icon_state = "handrail_y_intersect"

/obj/structure/railing/handrail/rusty
	name = "handrail"
	desc = "Old, rusted metal handrails. The green paint is chipping off in spots."
	icon_state = "handrail_g"

/obj/structure/railing/handrail/rusty/end
	icon_state = "handrail_g_end"
	density = FALSE


// JUNK
/obj/structure/junk
	icon = 'icons/fallout/furniture/ruined.dmi'
	obj_integrity = 100
	max_integrity = 100
	anchored = 1
	density = 1
	var/buildstacktype = /obj/item/stack/rods
	var/buildstackamount = 1

/obj/structure/junk/deconstruct()
	// If we have materials, and don't have the NOCONSTRUCT flag
	if(!(flags_1 & NODECONSTRUCT_1))
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
		else
			for(var/i in custom_materials)
				var/datum/material/M = i
				new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

/obj/structure/junk/machinery
	name = "rusting machine"
	desc = "Some sort of machine rusted solid."
	icon_state = "junk_machine"
	obj_integrity = 200
	max_integrity = 200
	buildstacktype = /obj/item/stack/crafting/metalparts
	buildstackamount = 2

/obj/structure/junk/locker
	name = "decayed locker"
	desc = "Broken, rusted junk."
	icon_state = "junk_locker"

/obj/structure/junk/disco
	name = "broken disco ball"
	desc = "Remains of something fun."
	icon_state = "junk_disco"

/obj/structure/junk/jukebox
	name = "ruined jukebox"
	desc = "Remains of something fun."
	icon_state = "junk_jukebox"

/obj/structure/junk/cabinet
	name = "old rotting furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_cabinet"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/drawer
	name = "ruined old furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_dresser"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/micro
	name = "rusting kitchenmachine"
	desc = "Rusted solid, useless."
	icon_state = "junk_micro"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1

/obj/structure/junk/small
	density = 0
	slowdown = 4

/obj/structure/junk/small/table
	name = "ruined old furniture"
	desc = "Time and the elements has degraded this furniture beyond repair."
	icon_state = "junk_table"
	buildstacktype = /obj/item/stack/sheet/mineral/wood
	buildstackamount = 1

/obj/structure/junk/small/tv
	name = "pre-war electronic junk"
	desc = "Broken, a useless relic of the past."
	icon_state = "junk_tv"
	buildstacktype = /obj/item/stack/crafting/electronicparts
	buildstackamount = 1

/obj/structure/junk/small/bed
	name = "rotting bed"
	desc = "Rusted and rotting, useless."
	icon_state = "junk_bed1"
	buildstackamount = 2

/obj/structure/junk/small/bed2
	name = "rusty bedframe"
	desc = "Rusted and rotting, useless."
	icon_state = "junk_bed2"
	buildstackamount = 2

/obj/structure/junk/small/bench
	name = "rotting planks"
	desc = "Remains of small furniture"
	icon_state = "junk_bench"
	slowdown = 6

/obj/structure/junk/small/toilet
	name = "non-functional toilet"
	desc = "Busted up toilet"
	icon_state = "toilet_broken"

/obj/structure/junk/small/urinal
	name = "non-functional urinal"
	desc = "Clogged urinal"
	icon_state = "urinal_broken"

/obj/structure/junk/small/shower
	name = "rusted shower"
	desc = "The pipes are filled with air and dust now."
	icon_state = "shower_broken"

/obj/structure/junk/small/mirror
	name = "shattered mirror"
	desc = "Each shard reflects the world around it, under the layers of dust."
	icon_state = "mirror_broken"

/obj/structure/junk/small/curtain
	name = "rotting shower curtain"
	desc = "Covered in mold and grime."
	icon_state = "curtain_broken"

/obj/structure/junk/small/sink
	name = "broken sink"
	desc = "The cracked bowl is filled with dried up indescribable sludge."
	icon_state = "sink_broken"

/obj/structure/junk/small/telescreen
	name = "smashed telescreen"
	desc = "The most modern television set available once. Now smashed and useless."
	icon_state = "telescreen_broken"


// OBSTACLES
/obj/structure/obstacle
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	icon = 'icons/fallout/structures/barricades.dmi'
	anchored = TRUE
	density = TRUE
	obj_integrity = 100
	max_integrity = 100

/obj/structure/obstacle/tanktrap
	name = "tanktrap"
	desc = "Metal bars welded together, blocks movement, but terrible cover."
	icon_state = "iron_barricade"
	anchored = 1
	density = 1
	obj_integrity = 500
	max_integrity = 500
	proj_pass_rate = 95
	pass_flags = LETPASSTHROW
	climbable = TRUE

/obj/structure/obstacle/tanktrap/rust
	obj_integrity = 400
	max_integrity = 400
	icon_state = "iron_barricade_rust"

/obj/structure/obstacle/old_locked_door
	name = "old locked door"
	desc = "Key long lost, lock rusted shut. Apply violence to gain entry."
	icon_state = "locked"
	opacity = TRUE

/obj/structure/obstacle/jammed_door
	name = "jammed secure door"
	desc = "Heavy doors jammed halfway open. Squeeze past or apply plenty of violence."
	icon_state = "jammed"
	obj_integrity = 800
	max_integrity = 800
	climbable = TRUE

// BARBED WIRE
/obj/structure/obstacle/barbedwire
	name = "barbed wire"
	desc = "Don't walk into this."
	icon_state = "barbed"
	density = FALSE
	slowdown = 40

/obj/structure/obstacle/barbedwire/end
	icon_state = "barbed_end"

/obj/structure/obstacle/barbedwire/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/caltrop, 20, 30, 100, CALTROP_BYPASS_SHOES)

// LIGHTING
/obj/structure/destructible/tribal_torch/lanternpost
	name = "Lantern post"
	desc = "Lantern with a wax candle inside a glass and metal housing."
	density = FALSE
	anchored = TRUE
	icon = 'icons/fallout/objects/lights.dmi'
	icon_state = "prospector_lamp-on"
	light_power = 1
	light_range = 5
	break_sound = 'sound/hallucinations/veryfar_noise.ogg'
	debris = list(/obj/item/candle/tribal_torch = 1)
	burning = TRUE

/obj/structure/destructible/tribal_torch/lanternpost/cathouse
	desc = "Lantern with a wax candle inside a pink colored glass and metal housing."
	icon_state = "cathouse_lamp-on"
	light_color = "#dd99a4"


// CLOSETS
/obj/structure/closet/old
	name = "locker"
	desc = "Worn but serviceable."
	icon = 'icons/fallout/furniture/closets.dmi'
	icon_state = "gray"
	anchored = TRUE
	storage_capacity = 30

/obj/structure/closet/old/fridge
	name = "fridge"
	desc = "Old fridge, but in good condition for its age."
	icon_state = "fridger"

// Becomes dense when opened then closed. Key is in the close proc in closet but I don't know how to just make exception for this.
/obj/structure/closet/wallcabinet/medicine
	name = "medicine cabinet"
	icon = 'icons/fallout/furniture/closets.dmi'
	icon_state = "medcab"
	density = FALSE
	storage_capacity = 10
	mob_storage_capacity = 0
	max_mob_size = MOB_SIZE_TINY


// CHAIR
/obj/structure/chair/throne
	name = "throne"
	desc = "You sit in this. Either by will or force."
	icon = 'icons/fallout/furniture/thrones.dmi'
	icon_state = "throne"


//SIGNS
/obj/structure/signs
	icon = 'icons/fallout/decals/signs.dmi'
	icon_state = "memorial"
	desc = "A sign."
	anchored = TRUE
	opacity = 0
	density = FALSE
	plane = ABOVE_WALL_PLANE
	layer = SIGN_LAYER
	max_integrity = 100

//Waterfront Mall Signs
/obj/structure/signs/waterfront
	name = "Waterfront Mall"
	color = "#b7bcf7"

/obj/structure/signs/waterfront/office
	icon_state = "vault_admin"
	name = "Managers office."

/obj/structure/signs/waterfront/restroom
	icon_state = "vault_toilet"
	name = "Restroom"

/obj/structure/signs/waterfront/sportsstore
	icon_state = "vault_store"
	name = "Sports goods"

/obj/structure/signs/waterfront/janitor
	name = "Janitorial"
	icon_state = "vault_maint"

/obj/structure/signs/waterfront/store
	name = "Supermarket"
	icon_state = "vault_store"

/obj/structure/signs/waterfront/store/clothes
	icon_state = "vault_store"
	name = "Clothing store"

/obj/structure/signs/waterfront/store/pet
	name = "Pet shop"
	icon_state = "vault_store"

/obj/structure/signs/waterfront/store/hardware
	name = "Hardware store"
	icon_state = "vault_store"

/obj/structure/signs/waterfront/mallcop
	name = "Mall cop office"
	icon_state = "vault_guard"

/obj/structure/signs/waterfront/arcade
	name = "Arcade"
	icon_state = "vault_arcade"

/obj/structure/signs/waterfront/diner
	name = "Mall diner"
	icon_state = "vault_diner"

//McKinley Junior High signs
/obj/structure/signs/school
	name = "McKinley Junior High"
	icon_state = "memorial"
	color = "#e8dd7d"

/obj/structure/signs/school/teacher
	name = "Teachers room"
	icon_state = "vault_admin"

/obj/structure/signs/school/restroom
	name = "Restrooms"
	icon_state = "vault_toilet"

/obj/structure/signs/school/classroom
	name = "Classroom"
	icon_state = "vault_class"

/obj/structure/signs/school/classroom/lab
	icon_state = "vault_lab"

//National Guard signs
/obj/structure/signs/national
	name = "Fort Kanawha"
	desc = "Home of the 5th National Guard Engineer Batallion";
	color = "#adb794"

/obj/structure/signs/national/depot
	name = "National Guard depot no. 241"
	desc = "restricted area"

//Thermo-Electric Plant signs
/obj/structure/signs/powerplant
	name = "St. Albans thermo-electric power plant"
	color = "#f47373"

/obj/structure/signs/powerplant/lounge
	name = "Lounge"
	icon_state = "vault_lounge"

/obj/structure/signs/powerplant/tech
	name = "Tech"
	icon_state = "vault_tech"

/obj/structure/signs/powerplant/office
	name = "Office"
	icon_state = "vault_office"

/obj/structure/signs/powerplant/toilet
	name = "Toilet"
	icon_state = "vault_toilet"

/obj/structure/signs/powerplant/guard
	name = "Guard"
	icon_state = "vault_guard"

/obj/structure/signs/powerplant/dorms
	name = "Dorms"
	icon_state = "vault_dorm"

/obj/structure/signs/powerplant/dorms
	name = "Dorms"
	icon_state = "vault_dorm"


//DECORATION
/obj/structure/decoration/menu
	icon = 'icons/fallout/decals/walldecoration.dmi'
	icon_state = "menu"
	desc = "Ask for the special of the day. Probably more fish."
