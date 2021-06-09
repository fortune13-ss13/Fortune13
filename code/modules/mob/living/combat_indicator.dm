/mob/living
	var/enabled_combat_indicator = 0
	var/nextcombatpopup = 0
	var/static/mutable_appearance/combat_indicator
	var/static/mutable_appearance/combat_indicator_two


/obj/effect/overlay/combat_indicator
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'icons/mob/talk.dmi'
	icon_state = "combat"
	appearance_flags = RESET_COLOR | TILE_BOUND | PIXEL_SCALE
	layer = FLY_LAYER

/mob/living/proc/set_combat_indicator(state)
	if(enabled_combat_indicator == state)
		return

	if(!combat_indicator && state==1)
		combat_indicator = mutable_appearance('icons/mob/talk.dmi', "combat", FLY_LAYER)

	if(!combat_indicator_two && state==2)
		combat_indicator_two = mutable_appearance('icons/mob/talk.dmi', "combat2", FLY_LAYER)

	if(stat < 1)
		if(state==1)
			enabled_combat_indicator = 1
			add_overlay(combat_indicator)

			return

		if(state==2)
			enabled_combat_indicator = 2
			cut_overlay(combat_indicator)
			add_overlay(combat_indicator_two)

			return

		cut_overlay(combat_indicator_two)
		enabled_combat_indicator = 0
	else
		if(enabled_combat_indicator==1)
			cut_overlay(combat_indicator)
		if(enabled_combat_indicator==2)
			cut_overlay(combat_indicator_two)
		enabled_combat_indicator = 0

/mob/living/proc/change_combat_indicator(state)
	if(world.time >= combatmessagecooldown) //If combat mode didn't make a message
		if(state==0)
			visible_message("<span class='warning'>[src] gets ready for combat!</span>")
		if(state==1)
			visible_message("<span class='warning'>[src] begins combat!</span>")
		combatmessagecooldown = world.time + 5 SECONDS
		nextcombatpopup = world.time + 5 SECONDS
		playsound(src, 'sound/machines/chime.ogg', 10)
	set_combat_indicator(state)

mob/living/proc/toggle_combat_mode(silent = TRUE, was_forced = FALSE, visible = FALSE, update_icon = TRUE)
	if(stat>0)
		log_attack("[src] has toggled off the combat indicator (death)")
		change_combat_indicator(0)
		return

	if (enabled_combat_indicator==0)


		log_attack("[src] has toggled on the combat indicator")
		change_combat_indicator(1)
		return

	if (enabled_combat_indicator==1)


		log_attack("[src] has toggled on the second combat indicator")
		change_combat_indicator(2)
		return


	log_attack("[src] has toggled off the combat indicator")
	change_combat_indicator(0)
