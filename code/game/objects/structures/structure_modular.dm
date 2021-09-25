/obj/structure/wasteoutlet
	name = "waste outlet pipe"
	desc = "A pipe."
	icon = 'icons/fallout/furniture/stationary.dmi'
	icon_state = "wasteoutlet"
	density = 0
	anchored = 1


//Start St. Albans modular

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


//End St. Albans
