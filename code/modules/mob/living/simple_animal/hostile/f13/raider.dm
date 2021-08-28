/mob/living/simple_animal/hostile/raider
	name = "Raider"
	desc = "Another murderer churned out by the wastes."
	icon = 'icons/fallout/mobs/npc/raiders.dmi'
	icon_state = "raidermelee"
	icon_living = "raidermelee"
	icon_dead = "raidermelee_dead"
	icon_gib = "syndicate_gib"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	response_help_simple = "pokes"
	response_disarm_simple = "shoves"
	response_harm_simple = "hits"
	speed = 1
	maxHealth = 140
	health = 140
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 50
	attack_verb_simple = "punches"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	a_intent = INTENT_HARM
	loot = list(/obj/effect/mob_spawn/human/corpse/raidermelee, /obj/item/melee/onehanded/knife/survival)
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 15
	faction = list("raider")
	check_friendly_fire = 1
	status_flags = CANPUSH
	del_on_death = 1

/mob/living/simple_animal/hostile/raider/thief

/mob/living/simple_animal/hostile/raider/thief/movement_delay()
	return -2

/mob/living/simple_animal/hostile/raider/thief/AttackingTarget()
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		var/back_target = H.back
		if(back_target)
			H.dropItemToGround(back_target, TRUE)
			src.transferItemToLoc(back_target, src, TRUE)
		var/belt_target = H.belt
		if(belt_target)
			H.dropItemToGround(belt_target, TRUE)
			src.transferItemToLoc(belt_target, src, TRUE)
		var/shoe_target = H.shoes
		if(shoe_target)
			H.dropItemToGround(shoe_target, TRUE)
			src.transferItemToLoc(shoe_target, src, TRUE)
	retreat_distance = 50
	addtimer(CALLBACK(src, .proc/undo_retreat), 5 MINUTES)

/mob/living/simple_animal/hostile/raider/thief/proc/undo_retreat()
	retreat_distance = null

/mob/living/simple_animal/hostile/raider/thief/death(gibbed)
	for(var/obj/I in contents)
		src.dropItemToGround(I)
	. = ..()

/mob/living/simple_animal/hostile/raider/ranged
	icon_state = "raiderranged"
	icon_living = "raiderranged"
	loot = list(/obj/effect/mob_spawn/human/corpse/raiderranged, /obj/effect/spawner/lootdrop/f13/npc_raider)
	ranged = 1
	maxHealth = 115
	health = 115
	retreat_distance = 4
	minimum_distance = 6
	projectiletype = /obj/item/projectile/bullet/c9mm/op
	projectilesound = 'sound/f13weapons/ninemil.ogg'

/mob/living/simple_animal/hostile/raider/legendary
	loot = list(/obj/effect/mob_spawn/human/corpse/raiderranged, /obj/item/melee/onehanded/knife/survival, /obj/item/reagent_containers/food/snacks/kebab/human)
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes - this one seems a bit faster than the average..."
	color = "#FFFF00"
	maxHealth = 450
	health = 450
	speed = 1.2
	obj_damage = 300
	aggro_vision_range = 15

/mob/living/simple_animal/hostile/raider/ranged/legendary
	name = "Legendary Raider"
	desc = "Another murderer churned out by the wastes, wielding a decent pistol and looking very strong"
	color = "#FFFF00"
	icon_state = "raiderranged"
	icon_living = "raiderranged"
	loot = list(/obj/effect/mob_spawn/human/corpse/raiderranged, /obj/item/gun/ballistic/revolver/m29)
	ranged = 1
	maxHealth = 600
	health = 600
	retreat_distance = 1
	minimum_distance = 2
	projectiletype = /obj/item/projectile/bullet/m44
	projectilesound = 'sound/f13weapons/44mag.ogg'
	extra_projectiles = 1
	aggro_vision_range = 15
	obj_damage = 300

/mob/living/simple_animal/hostile/raider/ranged/sulphiteranged
	icon_state = "metal_raider"
	icon_living = "metal_raider"
	loot = list(/obj/effect/mob_spawn/human/corpse/raiderrangedsulphite, /obj/item/gun/ballistic/automatic/pistol/m1911/custom)
	ranged = 1
	maxHealth = 180
	health = 180
	projectiletype = /obj/item/projectile/bullet/c45/op
	projectilesound = 'sound/weapons/gunshot.ogg'

/mob/living/simple_animal/hostile/raider/ranged/boss
	name = "Raider Boss"
	icon_state = "raiderboss"
	icon_living = "raiderboss"
	maxHealth = 170
	health = 170
	extra_projectiles = 3
	projectiletype = /obj/item/projectile/bullet/c45/op
	loot = list(/obj/effect/mob_spawn/human/corpse/raiderboss, /obj/item/gun/ballistic/automatic/smg/greasegun)

/mob/living/simple_animal/hostile/raider/ranged/boss/Aggro()
	..()
	summon_backup(15)
	say("KILL 'EM, FELLAS!")

// Skulls
/mob/living/simple_animal/hostile/raider/skull
	name = "Skulls hangaround"
	desc = "Want to join the gang but haven't killed enough people yet, sniffs glue in their spare time. You might be their ticket in."
	icon_state = "skulls"
	icon_living = "skulls"
	loot = list(/obj/effect/mob_spawn/human/corpse/skulls, /obj/item/melee/onehanded/knife/hunting, /obj/item/crafting/wonderglue)

/mob/living/simple_animal/hostile/raider/ranged/skull
	name = "Skulls member"
	desc = "Full member of the gang called the Skulls. Permanent state of aggression due to glue sniffing and head trauma."
	icon_state = "skullsmember"
	icon_living = "skullsmember"
	loot = list(/obj/effect/mob_spawn/human/corpse/skullsmember, /obj/item/gun/ballistic/revolver/colt6520, /obj/item/ammo_box/c10mm/improvised)
	projectiletype = /obj/item/projectile/bullet/c10mm/ap
	projectilesound = 'sound/f13weapons/10mm_fire_02.ogg'

/mob/living/simple_animal/hostile/raider/ranged/boss/skull
	name = "Esteban the Killer"
	desc = "Leader of the independent gang called the Skulls. Got a macho image and low impulse control."
	icon_state = "skullsboss"
	icon_living = "skullsboss"
	loot = list(/obj/effect/mob_spawn/human/corpse/skullsboss, /obj/item/gun/ballistic/automatic/smg/greasegun, /obj/item/clothing/mask/cigarette/cigar/havana)

