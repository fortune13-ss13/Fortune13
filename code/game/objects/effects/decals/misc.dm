/obj/effect/temp_visual/point
	name = "pointer"
	icon = 'icons/mob/screen_gen.dmi'
	icon_state = "arrow"
	layer = POINT_LAYER
	duration = 25

/obj/effect/temp_visual/point/Initialize(mapload, set_invis = 0)
	. = ..()
	var/atom/old_loc = loc
	loc = get_turf(src) // We don't want to actualy trigger anything when it moves
	pixel_x = old_loc.pixel_x
	pixel_y = old_loc.pixel_y
	invisibility = set_invis

//Used by spraybottles.
/obj/effect/decal/chempuff
	name = "chemicals"
	icon = 'icons/obj/chempuff.dmi'
	pass_flags = PASSTABLE | PASSGRILLE
	layer = FLY_LAYER

/obj/effect/decal/chempuff/blob_act(obj/structure/blob/B)
	return

/obj/effect/decal/fakelattice
	name = "lattice"
	desc = "A lightweight support lattice."
	icon = 'icons/obj/smooth_structures/lattice.dmi'
	icon_state = "lattice"
	density = FALSE


//Some pipe crap to put on the floor
/obj/effect/decal/oldpipes
	name = "old pipes"
	desc = "Rusty old pipes."
	icon = 'icons/fallout/decals/turf_decoration.dmi'
	icon_state = "rustpipe"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_OPAQUE

/obj/effect/decal/oldpipes/manifold
	icon_state = "rustpipe-manifold"

/obj/effect/decal/oldpipes/manifold/fourway
	icon_state = "rustpipe-fourway"

/obj/effect/decal/oldpipes/end
	icon_state = "rustpipe-end"

/obj/effect/decal/oldpipes/vent
	icon_state = "rustpipe-vent"

/obj/effect/decal/oldpipes/valve
	icon_state = "rustpipe-valve"

/obj/effect/decal/oldpipes/meter
	icon_state = "meter"
