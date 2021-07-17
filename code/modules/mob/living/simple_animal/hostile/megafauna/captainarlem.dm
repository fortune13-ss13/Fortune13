/mob/living/simple_animal/hostile/megafauna/captainarlem
	name = "Captain Arlem"
	desc = "A grotesque, Enclave-manufactured and Enclave-loyal prime super mutant given cybernetic augmentations, an arm-mounted plasma repeater, and a hyper-advanced suit of hardened power armor sporting numerous upgrades and additions atop it's standard operational frame. Your ride ends here, mutie. Time to die."
	health = 3000
	maxHealth = 3000
	icon_state = "arlem"
	icon_living = "arlem"
	icon_dead = "arlem"
	icon = 'icons/fallout/mobs/bigmob.dmi'
	faction = list("enclave", "wastebot")
	social_faction = list("enclave")
	gender = "male"
	friendly_verb_continuous = "mutters 'Up for lunch later?'"
	friendly_verb_simple = "mutters 'Up for lunch later?'"
	attack_verb_continuous = "eviscerates"
	attack_verb_simple = "eviscerate"
	attack_sound = 'sound/magic/demon_attack1.ogg'
	weather_immunities = list("snow")
	speak_emote = list("shouts")
	armour_penetration = 0.5
	melee_damage_lower = 40
	melee_damage_upper = 40
	vision_range = 30
	aggro_vision_range = 30
	speed = 2
	move_to_delay = 8
	ranged_cooldown_time = 10
	minimum_distance = 1
	rapid_melee = 2
	melee_queue_distance = 20 // as far as possible really, need this because of charging
	ranged = 1
	pixel_x = 0
	wander = FALSE
	movement_type = GROUND
	var/charging = 0
	blood_volume = BLOOD_VOLUME_NORMAL
	deathmessage = "chokes on his own blood, falling over as he activates his suit's self destruct!"
	deathsound = 'sound/effects/gravhit.ogg'
	del_on_death = FALSE
	loot = list(/obj/item/keycard/library, /obj/effect/gibspawner/human, /obj/effect/temp_visual/gib_animation)
	attack_action_types = list(/datum/action/innate/megafauna_attack/charge,
							   /datum/action/innate/megafauna_attack/triple_charge,
							   /datum/action/innate/megafauna_attack/blast,
							   /datum/action/innate/megafauna_attack/eyebots)
	var/list/spans_list = list("danger", "big")
/* Cooldowns for abilities */
	var/charge_cooldown = 0
	var/blast_cooldown = 0
	var/eyebots_cooldown = 0
/*  Actual cooldown times  */
	var/charge_cooldown_time = 4 SECONDS
	var/blast_cooldown_time = 15 SECONDS
	var/eyebots_cooldown_time = 30 SECONDS

/datum/action/innate/megafauna_attack/charge
	name = "Charge"
	icon_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "icebeam0"
	chosen_message = "<span class='colossus'>You will now dash to your target.</span>"
	chosen_attack_num = 1

/datum/action/innate/megafauna_attack/triple_charge
	name = "Triple Charge"
	icon_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "icebeam0"
	chosen_message = "<span class='colossus'>You will now dash to your target in 3 consecutive moves.</span>"
	chosen_attack_num = 2

/datum/action/innate/megafauna_attack/blast
	name = "Blast"
	icon_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "arcane_barrage"
	chosen_message = "<span class='colossus'>You will now shoot at your target.</span>"
	chosen_attack_num = 3

/datum/action/innate/megafauna_attack/eyebots
	name = "Activate Eyebots"
	icon_icon = 'icons/mob/actions/actions_spells.dmi'
	button_icon_state = "emp"
	chosen_message = "<span class='colossus'>You will now activate the eyebots around you.</span>"
	chosen_attack_num = 4

/mob/living/simple_animal/hostile/megafauna/captainarlem/BiologicalLife(seconds, times_fired)
	if(!(. = ..()))
		return
	move_to_delay = clamp(round((health/maxHealth) * 10), 3, 10)

/mob/living/simple_animal/hostile/megafauna/captainarlem/OpenFire()
	anger_modifier = clamp(((maxHealth - health)/50),0,20)
	if(charging)
		return
	ranged_cooldown = world.time + ranged_cooldown_time
	if(client) // If player is controlling it.
		switch(chosen_attack)
			if(1)
				charge(target, TRUE, 3)
			if(2)
				triple_charge(target)
			if(3)
				blast()
			if(4)
				eyebots()
		return


	if(get_dist(src, target) >= 2 && get_dist(src, target) < 8 && charge_cooldown <= world.time)
		if(health > maxHealth/2)
			charge(target, TRUE)
		else
			triple_charge(target)
	if(get_dist(src, target) >= 3 && blast_cooldown <= world.time)
		blast()
	else if(get_dist(src, target) <= 5 && eyebots_cooldown <= world.time)
		eyebots()

/mob/living/simple_animal/hostile/megafauna/captainarlem/Initialize()
	. = ..()
	for(var/mob/living/simple_animal/hostile/megafauna/captainarlem/B in GLOB.mob_list)
		if(B != src)
			return INITIALIZE_HINT_QDEL //There can be only one

mob/living/simple_animal/hostile/megafauna/captainarlem/do_attack_animation(atom/A, visual_effect_icon, obj/item/used_item, no_effect)
	if(!charging)
		return ..()

/mob/living/simple_animal/hostile/megafauna/captainarlem/AttackingTarget()
	if(!charging)
		return ..()

/mob/living/simple_animal/hostile/megafauna/captainarlem/Goto(target, delay, minimum_distance)
	if(!charging)
		return ..()

/mob/living/simple_animal/hostile/megafauna/captainarlem/Move()
	if(!stat)
		playsound(src.loc, 'sound/effects/meteorimpact.ogg', 200, 1, 2, 1)
	if(charging)
		new/obj/effect/temp_visual/decoy/fading(loc,src)
		DestroySurroundings()
	. = ..()

/mob/living/simple_animal/hostile/megafauna/captainarlem/Bump(atom/A)
	if(charging)
		DestroySurroundings()
		if(isturf(A) || isobj(A) && A.density)
			A.ex_act(EXPLODE_HEAVY)
		else if(isliving(A))
			var/mob/living/L = A
			L.visible_message("<span class='danger'>[src] laughs maniacally as he rends[L]!</span>", "<span class='userdanger'>[src] slams into you, laughing maniacally!</span>")
			L.apply_damage(50, BRUTE)
			playsound(get_turf(L), 'sound/effects/meteorimpact.ogg', 100, 1)
			shake_camera(L, 4, 3)
			var/throwtarget = get_edge_target_turf(src, get_dir(src, get_step_away(L, src)))
			L.throw_at(throwtarget, 3)
	..()

/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/triple_charge(target)
	if(charge_cooldown >= world.time)
		return
	say("For the Enclave!", spans = spans_list, sanitize = FALSE)
	charge(target, FALSE, 2)
	charge(target, FALSE, 4)
	charge(target, FALSE, 6)
	charge_cooldown = world.time + charge_cooldown_time

/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/charge(atom/chargeat = target, singular=TRUE, delay = 3)
	if(charge_cooldown >= world.time)
		return
	if(!chargeat)
		return
	if(singular)
		say("C'mere!", spans = spans_list, sanitize = FALSE)
		charge_cooldown = world.time + charge_cooldown_time
	var/chargeturf = get_turf(chargeat)
	if(!chargeturf)
		return
	var/dir = get_dir(src, chargeturf)
	var/turf/T = get_ranged_target_turf(chargeturf, dir)
	if(!T)
		return
	new /obj/effect/temp_visual/dragon_swoop(T)
	charging = TRUE
	DestroySurroundings()
	walk(src, 0)
	setDir(get_dir(src, T))
	var/obj/effect/temp_visual/decoy/D = new /obj/effect/temp_visual/decoy(loc,src)
	animate(D, alpha = 0, color = "#11d839", transform = matrix()*2, time = 5)
	SLEEP_CHECK_DEATH(delay)
	dash_to(T)

/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/dash_to(T)
	charging = TRUE
	var/movespeed = 0.7
	walk_towards(src, T, movespeed)
	SLEEP_CHECK_DEATH(get_dist(src, T) * movespeed)
	walk(src, 0) // cancel the movement
	charging = FALSE

/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/shoot_projectile(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/item/projectile/P = new /obj/item/projectile/f13plasma/plasmacaster/arlem(startloc)
	P.preparePixelProjectile(marker, startloc)
	P.firer = src
	if(target)
		P.original = target
	P.fire(set_angle)

/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/blast(set_angle)
	if(blast_cooldown >= world.time)
		return
	say("Burn in hell!", spans = spans_list, sanitize = FALSE)
	blast_cooldown = world.time + blast_cooldown_time
	var/turf/target_turf = get_turf(target)
	playsound(src, 'sound/weapons/lasercannonfire.ogg', 200, 1, 2)
	newtonian_move(get_dir(target_turf, src))
	var/angle_to_target = Get_Angle(src, target_turf)
	if(isnum(set_angle))
		angle_to_target = set_angle
	var/static/list/colossus_shotgun_shot_angles = list(15, 7.5, 0, -7.5, -15)
	for(var/i in colossus_shotgun_shot_angles)
		shoot_projectile(target_turf, angle_to_target + i)


/mob/living/simple_animal/hostile/megafauna/captainarlem/proc/eyebots()
	if(eyebots_cooldown >= world.time)
		return
	say("Need some aid!", spans = spans_list, sanitize = FALSE)
	eyebots_cooldown = world.time + eyebots_cooldown_time
	visible_message("<span class='danger'>[src] presses a button on their wrist, activating some of the eyebots!</span>")
	for(var/mob/living/simple_animal/hostile/eyebot/botty in range(src, 7))
		if(prob(50))
			new /mob/living/simple_animal/hostile/eyebot(botty.loc)
			qdel(botty)
	for(var/obj/effect/decal/remains/deadeyebot/H in range(src, 8))
		if(prob(50))
			new /mob/living/simple_animal/hostile/eyebot(H.loc)
			qdel(H)

/mob/living/simple_animal/hostile/megafauna/captainarlem/death()
	do_sparks(3, TRUE, src)
	playsound(src, 'sound/weapons/armbomb.ogg', 75, 1, -3)
	..()
	sleep(40) // Totally intended to be sleep and not a callback.
	explosion(src,3,5,7,7)
	qdel(src)
