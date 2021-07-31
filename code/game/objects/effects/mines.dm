//Code improvements from https://github.com/vlggms/fortune13/pull/5

/obj/item/deployable_mine
	name = "deployable mine"
	desc = "An unarmed landmine. It can be planted to arm it."
	icon_state = "uglymine"
	var/mine_type = /obj/effect/mine
	var/arming_time = 3 SECONDS

/obj/item/deployablemine/stun
	desc = "An unarmed stun mine. It can be planted to arm it."
	mine_type = /obj/effect/mine/stun

/obj/item/deployable_mine/smart_stun
	name = "deployable smart mine"
	desc = "An unarmed smart stun mine. It can be planted to arm it."
	mine_type = /obj/effect/mine/stun/smart

/obj/item/deployablemine/rapid
	name = "deployable rapid smart mine"
	desc = "An unarmed smart stun mine designed to be rapidly placeable."
	mine_type = /obj/effect/mine/stun/smart/adv
	arming_time = 1 SECONDS
	w_class = WEIGHT_CLASS_SMALL

/obj/item/deployablemine/heavy
	name = "deployable sledgehammer smart mine"
	desc = "An unarmed smart heavy stun mine designed to be hard to disarm."
	mine_type = /obj/effect/mine/stun/smart/heavy
	arming_time = 5 SECONDS

/obj/item/deployablemine/shrapnel
	name = "deployable shrapnel mine"
	desc = "An unarmed shrapnel mine designed to spray lead everywhere and be hard to disarm."
	mine_type = /obj/effect/mine/shrapnel
	arming_time = 5 SECONDS

/obj/item/deployablemine/explosive
	mine_type = /obj/effect/mine/explosive


/obj/item/deployablemine/gas
	name = "oxygen gas mine"
	desc = "An unarmed mine that releases oxygen into the air when triggered. Pretty pointless huh."
	mine_type = /obj/effect/mine/gas

/obj/item/deployablemine/plasma
	name = "incendiary mine"
	desc = "An unarmed mine that releases plasma into the air when triggered, then ignites it."
	mine_type = /obj/effect/mine/gas/plasma

/obj/item/deployablemine/sleepy
	name = "knockout mine"
	desc = "An unarmed mine that releases N2O into the air when triggered. Nighty Night!"
	mine_type = /obj/effect/mine/gas/n2o

/obj/item/deployablemine/afterattack(atom/plant_spot, mob/user, proximity)
	. = ..()
	if(!proximity || !mine_type)
		return
	if(!isturf(plant_spot))
		return
	var/turf/plant_turf = plant_spot
	if(!plant_turf.can_plant_mine)
		to_chat(user, "<span class='warning'>You can't plant the mine here!</span>")
		return
	to_chat(user, "<span class='notice'>You start arming the [src]...</span>")
	if(!do_after(user, arming_time, target = plant_turf))
		return
	new mine_type(plant_turf)
	to_chat(user, "<span class='notice'>You plant and arm the [src].</span>")
	log_combat(user, src, "planted and armed")
	qdel(src)

/obj/effect/mine
	name = "dummy mine"
	desc = "Better stay away from that thing."
	density = FALSE
	anchored = TRUE
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "uglymine"
	/// We manually check to see if we've been triggered in case multiple atoms cross us in the time between the mine being triggered and it actually deleting, to avoid a race condition with multiple detonations
	var/triggered = FALSE
	var/smart_mine = FALSE
	var/disarm_time = 20 SECONDS
	var/disarm_product = /obj/item/deployablemine // The item dropped on disarm.

/obj/effect/mine/attackby(obj/I, mob/user, params)
	if(istype(I, /obj/item/multitool))
		to_chat(user, "<span class='notice'>You begin to disarm the [src]...</span>")
		if(do_after(user, disarm_time, target = src))
			to_chat(user, "<span class='notice'>You disarm the [src].</span>")
			new disarm_product(src.loc)
			qdel(src)
			return
	return ..()

/obj/effect/mine/proc/mineEffect(mob/victim)
	to_chat(victim, "<span class='danger'>*click*</span>")

/obj/effect/mine/Crossed(atom/movable/AM)
	if(!isturf(loc) || AM.throwing || (AM.movement_type & (FLYING | FLOATING)) || !AM.has_gravity())
		return
	. = ..()

	if(ismob(AM))
		checksmartmine(AM)
	else
		triggermine(AM)

/obj/effect/mine/proc/checksmartmine(mob/target)
	if(target)
		if(smart_mine) // Smart mine
			if(!HAS_TRAIT(target, TRAIT_MINDSHIELD)) // Target doesn't have a mindshield
				triggermine(target)
			else if(istype(target.get_item_by_slot(ITEM_SLOT_HEAD), /obj/item/clothing/head/foilhat)) // Has mindshield AND tinfoil hat
				triggermine(target)
		else // Dumb mine
			triggermine(target)

/obj/effect/mine/proc/triggermine(mob/victim)
	if(triggered)
		return
	visible_message("<span class='danger'>[victim] sets off [icon2html(src, viewers(src))] [src]!</span>")
	var/datum/effect_system/spark_spread/s = new /datum/effect_system/spark_spread
	s.set_up(3, 1, src)
	s.start()
	mineEffect(victim)
	triggered = TRUE
	SEND_SIGNAL(src, COMSIG_MINE_TRIGGERED, victim)
	qdel(src)

/obj/effect/mine/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir)
	. = ..()
	triggermine()

/* Explosive Mines */
/obj/effect/mine/explosive
	name = "explosive mine"
	disarm_product = /obj/item/deployablemine/explosive
	disarm_time = 30
	var/range_devastation = 0
	var/range_heavy = 1
	var/range_light = 2
	var/range_flash = 3

/obj/effect/mine/explosive/mineEffect(mob/victim)
	explosion(loc, range_devastation, range_heavy, range_light, range_flash)

/* Stun Mines */
/obj/effect/mine/stun
	name = "stun mine"
	disarm_product = /obj/item/deployablemine/stun
	var/stun_time = 150
	var/damage = 0

/obj/effect/mine/stun/mineEffect(mob/living/victim)
	if(isliving(victim))
		victim.adjustStaminaLoss(stun_time)
		victim.adjustBruteLoss(damage)

/obj/effect/mine/stun/smart
	name = "smart stun mine"
	desc = "An advanced mine with IFF features, capable of ignoring people with mindshield implants."
	smart_mine = TRUE
	disarm_time = 250
	disarm_product = /obj/item/deployablemine/smartstun

/obj/effect/mine/stun/smart/adv
	name = "rapid smart mine"
	disarm_time = 120
	disarm_product = /obj/item/deployablemine/rapid

/obj/effect/mine/stun/smart/heavy
	name = "sledgehammer smart mine"
	disarm_time = 350
	stun_time = 230
	damage = 40
	disarm_product = /obj/item/deployablemine/heavy

/* Shrapnel Mines */
/obj/effect/mine/shrapnel
	name = "shrapnel mine"
	disarm_time = 30
	disarm_product = /obj/item/deployablemine/shrapnel
	var/shrapnel_type = /obj/item/projectile/bullet/shrapnel
	var/shrapnel_magnitude = 3
	var/explosive = TRUE

/obj/effect/mine/shrapnel/mineEffect(mob/victim)
	AddComponent(/datum/component/pellet_cloud, projectile_type=shrapnel_type, magnitude=shrapnel_magnitude)
	if(explosive)
		explosion(loc, 0, 0, 2, 2)

/obj/effect/mine/shrapnel/sting
	name = "stinger mine"
	shrapnel_type = /obj/item/projectile/bullet/pellet/stingball

/* Meme mine */
/obj/effect/mine/kickmine
	name = "kick mine"

/obj/effect/mine/kickmine/mineEffect(mob/victim)
	if(isliving(victim) && victim.client)
		to_chat(victim, "<span class='userdanger'>You have been kicked FOR NO REISIN!</span>")
		qdel(victim.client)

/* Gas Mines */
/obj/effect/mine/gas
	name = "oxygen mine"
	disarm_product = /obj/item/deployablemine/gas
	var/gas_amount = 360
	var/gas_type = "o2"

/obj/effect/mine/gas/mineEffect(mob/victim)
	atmos_spawn_air("[gas_type]=[gas_amount]")

/obj/effect/mine/gas/plasma
	name = "incendiary mine"
	gas_type = "plasma"
	disarm_product = /obj/item/deployablemine/plasma

/obj/effect/mine/gas/n2o
	name = "\improper N2O mine"
	gas_type = "n2o"
	disarm_product = /obj/item/deployablemine/sleepy

/* Sound mines */
/obj/effect/mine/sound
	name = "interesting mine"
	var/sound = 'sound/effects/snap.ogg'

/obj/effect/mine/sound/mineEffect(mob/victim)
	playsound(loc, sound, 100, 1)

/* Pickups */
/obj/effect/mine/pickup
	name = "pickup"
	desc = "pick me up"
	icon = 'icons/effects/effects.dmi'
	icon_state = "electricity2"
	density = FALSE
	var/duration = 0

/obj/effect/mine/pickup/Initialize()
	. = ..()
	animate(src, pixel_y = 4, time = 20, loop = -1)

/obj/effect/mine/pickup/triggermine(mob/victim)
	if(triggered)
		return
	triggered = TRUE
	invisibility = INVISIBILITY_ABSTRACT
	mineEffect(victim)
	qdel(src)


/obj/effect/mine/pickup/bloodbath
	name = "Red Orb"
	desc = "You feel angry just looking at it."
	duration = 1200 //2min
	color = "#FF0000"

/obj/effect/mine/pickup/bloodbath/mineEffect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	to_chat(victim, "<span class='reallybig redtext'>RIP AND TEAR</span>")
	var/old_color = victim.client.color
	var/static/list/red_splash = list(1,0,0,0.8,0.2,0, 0.8,0,0.2,0.1,0,0)
	var/static/list/pure_red = list(0,0,0,0,0,0,0,0,0,1,0,0)

	spawn(0)
		new /datum/hallucination/delusion(victim, TRUE, "demon",duration,0)

	var/obj/item/twohanded/chainsaw = new(victim.loc)
	victim.log_message("entered a blood frenzy", LOG_ATTACK)

	ADD_TRAIT(chainsaw, TRAIT_NODROP, CHAINSAW_FRENZY_TRAIT)
	victim.drop_all_held_items()
	victim.put_in_hands(chainsaw, forced = TRUE)
	chainsaw.attack_self(victim)
	victim.reagents.add_reagent(/datum/reagent/medicine/adminordrazine,25)
	to_chat(victim, "<span class='warning'>KILL, KILL, KILL! YOU HAVE NO ALLIES ANYMORE, KILL THEM ALL!</span>")

	victim.client.color = pure_red
	animate(victim.client,color = red_splash, time = 10, easing = SINE_EASING|EASE_OUT)
	sleep(10)
	animate(victim.client,color = old_color, time = duration)//, easing = SINE_EASING|EASE_OUT)
	sleep(duration)
	to_chat(victim, "<span class='notice'>Your bloodlust seeps back into the bog of your subconscious and you regain self control.</span>")
	qdel(chainsaw)
	victim.log_message("exited a blood frenzy", LOG_ATTACK)
	qdel(src)

/obj/effect/mine/pickup/healing
	name = "Blue Orb"
	desc = "You feel better just looking at it."
	color = "#0000FF"

/obj/effect/mine/pickup/healing/mineEffect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	to_chat(victim, "<span class='notice'>You feel great!</span>")
	victim.revive(full_heal = 1, admin_revive = 1)

/obj/effect/mine/pickup/speed
	name = "Yellow Orb"
	desc = "You feel faster just looking at it."
	color = "#FFFF00"
	duration = 300

/obj/effect/mine/pickup/speed/mineEffect(mob/living/carbon/victim)
	if(!victim.client || !istype(victim))
		return
	to_chat(victim, "<span class='notice'>You feel fast!</span>")
	victim.add_movespeed_modifier(/datum/movespeed_modifier/yellow_orb)
	sleep(duration)
	victim.remove_movespeed_modifier(/datum/movespeed_modifier/yellow_orb)
	to_chat(victim, "<span class='notice'>You slow down.</span>")
