/obj/effect/turf_decal/sand
	icon_state = "sandyfloor"

/obj/effect/turf_decal/sand/plating
	icon_state = "sandyplating"


/obj/effect/turf_decal/cliff
	layer = ABOVE_NORMAL_TURF_LAYER
	icon = 'icons/fallout/decals/turf_mergeoverlays.dmi'
	icon_state = "dirt_side"

/obj/effect/turf_decal/cliff/corner
	icon_state = "dirt_corner"

// Makeshift way to get cliff face to show up outside overhang, sunlight still problematic.
/obj/effect/overlay/cliff
	icon = 'icons/fallout/decals/turf_mergeoverlays.dmi'
	icon_state = "dirt_side"
/obj/effect/overlay/cliff/corner
	icon_state = "dirt_corner"
