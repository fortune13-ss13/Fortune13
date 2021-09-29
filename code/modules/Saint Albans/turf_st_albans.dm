//Pebbles St. Albans turf file.


/turf/open/indestructible/ground/outside/road/crossing
	name = "road"
	icon_state = "cross1"

/turf/open/indestructible/ground/outside/road/crossing/alt
	icon_state = "cross2"

/turf/open/indestructible/ground/outside/road/crossing/alttwo
	icon_state = "cross3"

//dark road thats dirtmerged
/turf/open/indestructible/ground/outside/roaddirt
	name = "road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphaltdirt.dmi'

/turf/open/indestructible/ground/outside/roaddirt/hole
	icon_state = "hole"


//lighter road, dirtmerged
/turf/open/indestructible/ground/outside/road_dirt
	name = "road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphaltdirt.dmi'

//Turf smoothening
/obj/effect/overlay/turfs
	name = "asphalt overlay"
	icon = 'icons/fallout/module_rivermap/turfs/smoothing.dmi'
	icon_state = "asphalt_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/turfs/sidewalk
	name = "sidewalk overlay"
	icon_state = "sidewalk_side"

/obj/effect/overlay/turfs/cliff
	name = "cliff overlay"
	icon_state = "cliff"

/obj/effect/overlay/turfs/cliff/alt
	icon_state = "cliffalt"

/obj/effect/overlay/turfs/cliff/corner
	icon_state = "cliff_corner"

/obj/effect/overlay/turfs/decoration
	name = "ruined housebase"
	icon = 'icons/fallout/module_rivermap/turfs/turf_decoration.dmi'
	icon_state = "housebase1"

	Initialize()
		..()
		if(icon_state == "housebase1")
			icon_state = "housebase[rand(1,5)]"

/obj/effect/overlay/turfs/decoration/fakecatwalk
	name = "catwalk"
	icon_state = "catwalk"

/obj/effect/overlay/turfs/decoration/manholewelded
	name = "manhole"
	icon_state = "manhole_closed"


//Old pipe overlay
/obj/effect/overlay/turfs/decoration/oldpipes
	name = "old pipes"
	desc = "Rusty old pipes."
	icon_state = "rustpipe"

/obj/effect/overlay/turfs/decoration/oldpipes/manifold
	icon_state = "rustpipe-manifold"

/obj/effect/overlay/turfs/decoration/oldpipes/manifold/fourway
	icon_state = "rustpipe-fourway"

/obj/effect/overlay/turfs/decoration/oldpipes/end
	icon_state = "rustpipe-end"

/obj/effect/overlay/turfs/decoration/oldpipes/vent
	icon_state = "rustpipe-vent"

/obj/effect/overlay/turfs/decoration/oldpipes/valve
	icon_state = "rustpipe-valve"

/obj/effect/overlay/turfs/decoration/oldpipes/meter
	icon_state = "meter"

//Cliffedge turf
/turf/open/indestructible/ground/outside/dirt/cliffcorner
	icon_state = "dirtcliff_corner"


// ----------------- WOODEN FLOORS ------------------

//Baseturf
/turf/open/indestructible/woodenbase
	icon = 'icons/fallout/module_rivermap/turfs/floor_wood.dmi'
	icon_state = "woodenbase"
	baseturfs = /turf/open/indestructible/woodenbase

// Dark Oak
/turf/open/floor/wooden
	icon = 'icons/fallout/module_rivermap/turfs/floor_wood.dmi'
	icon_state = "darkoak1"
	baseturfs = /turf/open/indestructible/woodenbase
/*
	Initialize()
		..()
		if(icon_state == "darkoak1")
			icon_state = "darkoak[rand(1,4)]"
*/
/turf/open/floor/wooden/broken
	icon_state = "darkoakbroken1"
/*
	Initialize()
		..()
		if(icon_state == "darkoakbroken1")
			icon_state = "darkoakbroken[rand(1,4)]"
*/
/turf/open/floor/wooden/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE

// Oak
/turf/open/floor/wooden/oak
	icon_state = "oak1"
/*
	Initialize()
		..()
		if(icon_state == "oak1")
			icon_state = "oak[rand(1,4)]"
*/
/turf/open/floor/wooden/oak/broken
	icon_state = "oakbroken1"
/*
	Initialize()
		..()
		if(icon_state == "oakbroken1")
			icon_state = "oakbroken[rand(1,4)]"
*/
/turf/open/floor/wooden/oak/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oak/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE

// Maple
/turf/open/floor/wooden/maple
	icon_state = "maple1"
/*
	Initialize()
		..()
		if(icon_state == "maple1")
			icon_state = "maple[rand(1,4)]"
*/


// Chestnut
/turf/open/floor/wooden/chestnut
	icon_state = "chestnut1"
/*
	Initialize()
		..()
		if(icon_state == "chestnut1")
			icon_state = "chestnut[rand(1,4)]"
*/
/turf/open/floor/wooden/chestnut/broken
	icon_state = "chestnutbroken1"
/*
	Initialize()
		..()
		if(icon_state == "chestnutbroken1")
			icon_state = "chestnutbroken[rand(1,4)]"
*/
/turf/open/floor/wooden/chestnut/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/chestnut/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE


// Oak stage
/turf/open/floor/wooden/oakstage
	icon_state = "stageoak_bl"

/turf/open/floor/wooden/oakstageb
	icon_state = "stageoak_b"

/turf/open/floor/wooden/oakstagebr
	icon_state = "stageoak_br"

/turf/open/floor/wooden/oakstagetl
	icon_state = "stageoak_tl"

/turf/open/floor/wooden/oakstagetr
	icon_state = "stageoak_tr"

/turf/open/floor/wooden/oakstaget
	icon_state = "stageoak_t"

/turf/open/floor/wooden/oakstager
	icon_state = "stageoak_r"

/turf/open/floor/wooden/oakstagel
	icon_state = "stageoak_l"

/turf/open/floor/wooden/oakstage/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstageb/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstagebr/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstagetl/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstagetr/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstaget/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstager/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oakstagel/outdoors
	sunlight_state = SUNLIGHT_SOURCE

// Laminate
/turf/open/floor/wooden/laminate
	icon_state = "laminateA"

/turf/open/floor/wooden/laminate/broken
	icon_state = "laminateAbroken1"
/*
	Initialize()
		..()
		if(icon_state == "laminateAbroken1")
			icon_state = "laminateAbroken[rand(1,3)]"
*/
/turf/open/floor/wooden/laminatebig
	icon_state = "laminateB"

/turf/open/floor/wooden/laminatebig/broken
	icon_state = "laminateBbroken1"
/*
	Initialize()
		..()
		if(icon_state == "laminateBbroken1")
			icon_state = "laminateBbroken[rand(1,3)]"
*/

/turf/open/floor/wooden/laminatediagonal
	icon_state = "laminateC"

/turf/open/floor/wooden/laminatediagonal/broken
	icon_state = "laminateCbroken1"
/*
	Initialize()
		..()
		if(icon_state == "laminateCbroken1")
			icon_state = "laminateCbroken[rand(1,3)]"
*/
