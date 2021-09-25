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
	var/slowdown = 4

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
	anchored = 1
	density = 1
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
