//Pebbles St. Albans turf file.

//dark road thats dirtmerged
/turf/open/indestructible/ground/outside/roaddirt
	name = "road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphaltdirt.dmi'
//	step_sounds = list("human" = "erikafootsteps"

/turf/open/indestructible/ground/outside/roaddirt/hole
	icon_state = "hole"


//Cliffedge turf
/turf/open/indestructible/ground/outside/dirt/cliff
	icon_state = "dirtcliff"

/turf/open/indestructible/ground/outside/dirt/cliff/angle
	icon_state = "dirtcliff_angle"

/turf/open/indestructible/ground/outside/dirt/cliffcorner
	icon_state = "dirtcliff_corner"


// ----------------- WOODEN FLOORS ------------------

//Baseturf
/turf/open/indestructible/woodenbase
	icon = 'icons/fallout/turfs/floor_wood.dmi'
	icon_state = "woodenbase"
	baseturfs = /turf/open/indestructible/woodenbase

// Dark Oak
/turf/open/floor/wooden
	icon = 'icons/fallout/turfs/floor_wood.dmi'
	icon_state = "darkoak1"
	baseturfs = /turf/open/indestructible/woodenbase

	New()
		..()
		if(icon_state == "darkoak1")
			icon_state = "darkoak[rand(1,4)]"

/turf/open/floor/wooden/broken
	icon = 'icons/fallout/turfs/floor_wood.dmi'
	icon_state = "darkoakbroken1"

	New()
		..()
		if(icon_state == "darkoakbroken1")
			icon_state = "darkoakbroken[rand(1,4)]"

/turf/open/floor/wooden/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE

// Oak
/turf/open/floor/wooden/oak
	icon_state = "oak1"

	New()
		..()
		if(icon_state == "oak1")
			icon_state = "oak[rand(1,4)]"

/turf/open/floor/wooden/oak/broken
	icon_state = "oakbroken1"

	New()
		..()
		if(icon_state == "oakbroken1")
			icon_state = "oakbroken[rand(1,4)]"

/turf/open/floor/wooden/oak/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/oak/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE

// Maple
/turf/open/floor/wooden/maple
	icon_state = "maple1"

	New()
		..()
		if(icon_state == "maple1")
			icon_state = "maple[rand(1,4)]"

// Chestnut
/turf/open/floor/wooden/chestnut
	icon_state = "chestnut1"

	New()
		..()
		if(icon_state == "chestnut1")
			icon_state = "chestnut[rand(1,4)]"

/turf/open/floor/wooden/chestnut/broken
	icon_state = "chestnutbroken1"

	New()
		..()
		if(icon_state == "chestnutbroken1")
			icon_state = "chestnutbroken[rand(1,4)]"

/turf/open/floor/wooden/chestnut/outdoors
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/floor/wooden/chestnut/broken/outdoors
	sunlight_state = SUNLIGHT_SOURCE


// Oak stage
/turf/open/floor/wooden/chestnut
	icon_state = "chestnut1"

	New()
		..()
		if(icon_state == "chestnut1")
			icon_state = "chestnut[rand(1,4)]"

/turf/open/floor/wooden/chestnut/outdoors
	sunlight_state = SUNLIGHT_SOURCE


// Laminate
/turf/open/floor/wooden/laminate
	icon_state = "laminateA"

/turf/open/floor/wooden/laminate/broken
	icon_state = "laminateAbroken1"

	New()
		..()
		if(icon_state == "laminateAbroken1")
			icon_state = "laminateAbroken[rand(1,3)]"

/turf/open/floor/wooden/laminatebig
	icon_state = "laminateB"

/turf/open/floor/wooden/laminatebig/broken
	icon_state = "laminateBbroken1"

	New()
		..()
		if(icon_state == "laminateBbroken1")
			icon_state = "laminateBbroken[rand(1,3)]"


/turf/open/floor/wooden/laminatediagonal
	icon_state = "laminateC"

/turf/open/floor/wooden/laminatediagonal/broken
	icon_state = "laminateCbroken1"

	New()
		..()
		if(icon_state == "laminateCbroken1")
			icon_state = "laminateCbroken[rand(1,3)]"
