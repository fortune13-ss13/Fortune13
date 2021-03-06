/mob/living/simple_animal/hostile/ghoul
	name = "feral ghoul"
	desc = "A ghoul that has lost its mind and become aggressive."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "feralghoul"
	icon_living = "feralghoul"
	icon_dead = "feralghoul_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 80
	health = 80
	speed = 2.5
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_simple = "claw"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("ghoul")
	decompose = TRUE
	sharpness = SHARP_EDGED //They need to cut their finger nails
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 2,
							/obj/item/stack/sheet/animalhide/human = 1,
							/obj/item/stack/sheet/bone = 1)

//	loot = list(/obj/effect/gibspawner/human, /obj/item/stack/f13Cash/random/low)   // not quite ready for cap drops on ghouls

	emote_taunt_sound = list('sound/f13npc/ghoul/taunt.ogg')
	emote_taunt = list("gurgles", "stares")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg')
	death_sound = 'sound/f13npc/ghoul/ghoul_death.ogg'

/mob/living/simple_animal/hostile/ghoul/reaver
	name = "feral ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "ghoulreaver"
	icon_living = "ghoulreaver"
	icon_dead = "ghoulreaver_dead"
	speed = 2
	maxHealth = 150
	health = 150
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25

/mob/living/simple_animal/hostile/ghoul/reaver/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/ghoul/reaver/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/coldferal
	name = "cold ghoul feral"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "cold_feral"
	icon_living = "cold_feral"
	icon_dead = "cold_feral_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/ghoul/frozenreaver
	name = "frozen ghoul reaver"
	desc = "A ghoul that has lost its mind and become aggressive. This one is strapped with metal armor, and appears far stronger."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "frozen_reaver"
	icon_living = "frozen_reaver"
	icon_dead = "frozen_reaver_dead"
	speed = 1.5
	maxHealth = 200
	health = 200
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15

/mob/living/simple_animal/hostile/ghoul/legendary
	name = "legendary ghoul"
	desc = "A ghoul that has lost its mind and become aggressive. This one has exceptionally large, bulging muscles. It looks quite strong."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	color = "#FFFF00"
	maxHealth = 600
	health = 600
	speed = 2.5
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 35
	mob_size = 5
	wound_bonus = 0
	bare_wound_bonus = 0

/mob/living/simple_animal/hostile/ghoul/glowing
	name = "glowing feral ghoul"
	desc = "A feral ghoul that has absorbed massive amounts of radiation, causing them to glow in the dark and radiate constantly."
	icon_state = "glowinghoul"
	icon_living = "glowinghoul"
	icon_dead = "glowinghoul_dead"
	maxHealth = 160
	health = 160
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 25
	melee_damage_upper = 25
	light_system = MOVABLE_LIGHT
	light_range = 2

/mob/living/simple_animal/hostile/ghoul/glowing/Initialize(mapload)
	. = ..()
	// we only heal BRUTELOSS because each type directly heals a simplemob's health
	// therefore setting it to BRUTELOSS | FIRELOSS | TOXLOSS | OXYLOSS would mean healing 4x as much
	// aka 40% of max life every tick, which is basically unkillable
	// TODO: refactor this if simple_animals ever get damage types
	AddComponent(/datum/component/glow_heal, chosen_targets = /mob/living/simple_animal/hostile/ghoul, allow_revival = FALSE, restrict_faction = null, type_healing = BRUTELOSS)

/mob/living/simple_animal/hostile/ghoul/glowing/Aggro()
	..()
	summon_backup(10)

/mob/living/simple_animal/hostile/ghoul/glowing/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.apply_effect(20, EFFECT_IRRADIATE, 0)

/mob/living/simple_animal/hostile/ghoul/glowing/strong // FEV mutation
	maxHealth = 320
	health = 320
	speed = 1.4 // Nyooom
	melee_damage_lower = 35
	melee_damage_upper = 35
	armour_penetration = 0.1

/mob/living/simple_animal/hostile/ghoul/soldier
	name = "ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul"
	icon_living = "soldier_ghoul"
	icon_dead = "soldier_ghoul_d"
	icon_gib = "syndicate_gib"
	maxHealth = 90
	health = 90

/mob/living/simple_animal/hostile/ghoul/soldier/armored
	name = "armored ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "soldier_ghoul_a"
	icon_living = "soldier_ghoul_a"
	icon_dead = "soldier_ghoul_a_d"
	icon_gib = "syndicate_gib"
	maxHealth = 100
	health = 100

/mob/living/simple_animal/hostile/ghoul/scorched
	name = "scorched ghoul soldier"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_m"
	icon_living = "scorched_m"
	icon_dead = "scorched_m_d"
	icon_gib = "syndicate_gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help_simple = "hugs"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "growl"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	faction = list("scorched", "hostile")
	death_sound = null
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attack_verb_simple = "punches"
	attack_sound = "punch"


/mob/living/simple_animal/hostile/ghoul/scorched/ranged
	name = "Ranged Ghoul Solder"
	desc = "Have you ever seen a living ghoul before?<br>Ghouls are necrotic post-humans - decrepit, rotting, zombie-like mutants."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "scorched_r"
	icon_living = "scorched_r"
	icon_dead = "scorched_r_d"
	icon_gib = "syndicate_gib"
	speak_chance = 1
	turns_per_move = 5
	environment_smash = 0
	response_help_simple = "hugs"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "ow"
	move_to_delay = 4
	maxHealth = 80
	health = 80
	ranged = 1
	ranged_cooldown_time = 200
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectilesound = 'sound/f13weapons/hunting_rifle.ogg'
	faction = list("scorched", "hostile")
	melee_damage_lower = 15
	melee_damage_upper = 20
	aggro_vision_range = 10
	attack_verb_simple = "shoots"
	attack_sound = "punch"

/mob/living/simple_animal/hostile/ghoul/wyomingghost
	name = "ghost soldier"
	desc = "A figure clad in armor that stands silent except for the slight wheezing coming from them, a dark orange and black liquid pumps through a clear tube into the gas mask. The armor they wear seems to be sealed to their skin."
	icon = 'icons/mob/wastemobs.dmi'
	icon_state = "wyomingghost"
	icon_living = "wyomingghost"
	icon_dead = "wyomingghost_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("wheezes")
	emote_see = list("stares")
	a_intent = INTENT_HARM
	maxHealth = 150
	health = 150
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	attack_verb_simple = "attacks"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("supermutant","ghoul")
	decompose = FALSE
	sharpness = SHARP_EDGED //They need to cut their finger nails

// Mamas Boys - bootleg Rotgut makers and purveyors of ghetto fight rings. Love a good fistfight, and usually wear galoshes to not get the feet melted off in the toxic sludge where they live.
// Pretty good stats but no guns, and vulnerable to unarmed combat, live by the fist, uh, die by the fist?

/mob/living/simple_animal/hostile/ghoul/mamasboys
	name = "worker ghoul"
	desc = "A sentient ghoul, but involved in shady dealings and not very friendly."
	icon = 'icons/fallout/mobs/npc/mobnpc.dmi'
	icon_state = "ghoul_worker"
	icon_living = "ghoul_worker"
	icon_dead = "ghoul_worker_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	dextrous = TRUE
	robust_searching = 0
	turns_per_move = 5
	emote_see = list("spits on the ground")
	speak = list("Nothin' personal kid.","You'll regret this.","Crap...","Thought you could steal stuff while I wasn't looking?","Tough luck pinkskin.");
	speak_chance = 10;
	speak_emote = list("wheezes");
	a_intent = INTENT_HARM
	maxHealth = 130
	health = 130
	speed = 0.2
	obj_damage = 100
	harm_intent_damage = 35 // live by the fist, die by the fist
	melee_damage_lower = 20
	melee_damage_upper = 35
	del_on_death = 0
	attack_verb_simple = "punches hard"
	attack_sound = 'sound/weapons/cqchit1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	faction = list("raider")
	decompose = FALSE
	sharpness = SHARP_NONE
	death_sound = 'sound/voice/scream/scream_m1.ogg'

/mob/living/simple_animal/hostile/ghoul/mamasboys/bruiser
	name = "bruiser ghoul"
	desc = "Experienced pit fighter, this ghoul is massive and got scraggly beard, and sappers on his hands."
	icon_state = "ghoul_bruiser"
	icon_living = "ghoul_bruiser"
	icon_dead = "ghoul_bruiser_dead"
	loot = list(/obj/item/melee/unarmed/sappers)
	maxHealth = 250
	health = 250
	speed = 0.3
	obj_damage = 200
	melee_damage_lower = 40
	melee_damage_upper = 50
	attack_verb_simple = "uppercuts"
	attack_sound = 'sound/weapons/cqchit2.ogg'

/mob/living/simple_animal/hostile/ghoul/mamasboys/mama
	name = "Mama Mulligan"
	desc = "Female ghoul with a nice wig and some impressive kicking skills."
	icon_state = "mama_mulligan"
	icon_living = "mama_mulligan"
	icon_dead = "mama_mulligan_dead"
	maxHealth = 350
	health = 350
	speed = 0.25
	obj_damage = 200
	melee_damage_lower = 40
	melee_damage_upper = 50
	dodging = TRUE
	approaching_target = TRUE
	in_melee = TRUE
	dodge_prob = 30
	sidestep_per_cycle = 2
	rapid_melee = 2
	speak = list("Nothin' personal darling.","I'll use your hair for my next wig, I think.","Fight me with your fists if you dare.");
	attack_verb_simple = "kicks"
	death_sound = 'sound/voice/scream/scream_f3.ogg'
	loot = list(/obj/item/book/granter/martial/krav_maga)

/mob/living/simple_animal/hostile/ghoul/mamasboys/mama/bullet_act(obj/item/projectile/Proj)
	if(!Proj)
		return
	if(prob(50))
		return ..()
	else
		visible_message("<span class='danger'>[src] dodges [Proj]!</span>")
		return 0
