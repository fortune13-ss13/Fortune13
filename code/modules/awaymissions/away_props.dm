/obj/item/paper/journal/page1
	name = "5th National Guard Engineer Battallion: Final log"
	info = "This is the last entry I will make, when finished I will take the single dose of experimental 'Behemoth' serum we have. When our food stores ran low we opened the Vault-Tec crisis package and started distributing the special serum that causes controlled mutations, in order to make the soldiers able to survive. Sadly, it turned out the serum caused massive loss of mental ability in most subjects, but we literally have no choice, we lack the gear to survive in the radioactive dust and have no food. We have intercepted what appears to be chinese radio traffic, if I can retain my mind after taking the serum I will lead my troops as they were, to destroy the enemies of liberty. God bless America! - signed Major Jackson"

/obj/effect/oneway
	name = "one way effect"
	desc = "Only lets things in from its dir."
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = "field_dir"
	invisibility = INVISIBILITY_MAXIMUM
	anchored = TRUE

/obj/effect/oneway/CanPass(atom/movable/mover, border_dir)
	var/turf/T = get_turf(src)
	var/turf/MT = get_turf(mover)
	return ..() && (T == MT || border_dir == dir)


/obj/effect/wind
	name = "wind effect"
	desc = "Creates pressure effect in its direction. Use sparingly."
	icon = 'icons/effects/mapping_helpers.dmi'
	icon_state = "field_dir"
	invisibility = INVISIBILITY_MAXIMUM
	var/strength = 30

/obj/effect/wind/Initialize()
	. = ..()
	START_PROCESSING(SSobj,src)

/obj/effect/wind/process()
	var/turf/open/T = get_turf(src)
	if(istype(T))
		T.consider_pressure_difference(get_step(T,dir),strength)
