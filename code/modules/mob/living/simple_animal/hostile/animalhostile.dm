/*Common East Coast hostile critters
- Radroach			/mob/living/simple_animal/hostile/radroacheast
	Weak brute force critter, nothing special except it breeds with meat around.
- Ghoul Rotter		/mob/living/simple_animal/hostile/ghoulrotter
	Just trying to make a new ghoul sprite thats less ass
- Bloatfly			/mob/living/simple_animal/hostile/bloatflyeast
	Supposed to be fast and spit weak attacks, more annoyance. NOT cazador 2.0.
- Molerat			/mob/living/simple_animal/hostile/molerat
	Put it here and there.
- Mirelurk			/mob/living/simple_animal/hostile/mirelurk
	Pretty tough and near water
- Mirelurk baby		/mob/living/simple_animal/hostile/mirelurk/baby
- Skolf				/mob/living/simple_animal/hostile/skolf
	Packs, pretty deadly to lightly armored people, dont place in low threat areas. Sort of glass cannons?

Uncommon critters
- Radscorpion		/mob/living/simple_animal/hostile/radscorpioneast
	Dont map any in, keep for events. Very rare east side.
- Giant Ant			/mob/living/simple_animal/hostile/giantanteast
	Pack animals, aggressive. Tougher Skolfs.
- Yao Guai 			/mob/living/simple_animal/hostile/yaoguai
	Really tough beast packing a punch. Must be dangerous to PA people.
- Aradnid			/mob/living/simple_animal/hostile/aradnid
	Injects rads. Only map near toxic sites.
- Centaur			/mob/living/simple_animal/hostile/centaur
	Cause they are cute
- Scolopendra		/mob/living/simple_animal/hostile/scolopendra
	Tunnel critter, very fast, modest brute, high toxin damage, decently tough. Supposed to make narrow tunnels scary.

Stuff not supposed to be in East coast (to differentiate, give flavour. Less is more. Don't listen to Bethesda.)
- Cazador
- Fireants
- Feral dog (Coyotes)
- Geckos
- Nightstalkers

General thoughts: More traits possible to add? Like resists to energy weapons/ballistics? Armor so AP is useful? Ability
to produce smoke or slow down victims? Stuff like that added to a couple would be fun.
*/

/mob/living/simple_animal/hostile/radroach/east
	name = "Radroach"
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	faction = list("gecko")

/mob/living/simple_animal/hostile/ghoulrotter
	name = "rotting ghoul"
	desc = "A ancient bloated ghoul that has lost its mind and become aggressive."
	icon = 'icons/fallout/mobs/hostile_feralghoul.dmi'
	icon_state = "ghoulrotter"
	icon_living = "ghoulrotter"
	icon_dead = "ghoulrotter_dead"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("gurgles")
	a_intent = INTENT_HARM
	maxHealth = 120
	health = 120
	speed = 3
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 20
	attack_verb_simple = "gnaws"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("ghoul")
	decompose = TRUE
	sharpness = SHARP_NONE
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/ghoul = 2,
							/obj/item/stack/sheet/bone = 1)
	emote_taunt_sound = list('sound/f13npc/ghoul/taunt.ogg')
	emote_taunt = list("gurgles", "stares")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/ghoul/aggro1.ogg', 'sound/f13npc/ghoul/aggro2.ogg')
	idlesound = list('sound/f13npc/ghoul/idle.ogg')
	death_sound = 'sound/f13npc/ghoul/ghoul_death.ogg'


/mob/living/simple_animal/hostile/bloatfly/east
	name = "bloatfly"
	desc = "A common pest resembling an oversized blow-fly. Can attack at a distance."
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	faction = list("gecko")
	minimum_distance = 2
	retreat_distance = 2
	obj_damage = 0
	ranged = 1
	ranged_cooldown_time = 30
	projectiletype = /obj/item/projectile/neurotox2
	projectilesound = 'sound/f13npc/centaur/spit.ogg'

/obj/item/projectile/neurotox2
	name = "spit"
	damage = 12
	icon_state = "toxin"


/mob/living/simple_animal/hostile/molerat
	name = "molerat"
	desc = "A large mutated rat-mole hybrid that finds its way everywhere. Common in caves and underground areas."
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	icon_state = "mole_rat"
	icon_living = "mole_rat"
	icon_dead = "mole_rat_dead"
	icon_gib = null
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/molerat = 2, /obj/item/stack/sheet/sinew = 1,/obj/item/stack/sheet/animalhide/molerat = 1, /obj/item/stack/sheet/bone = 1)
	butcher_results = list(/obj/item/stack/sheet/bone = 1)
	butcher_difficulty = 1.5
	response_help_simple = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple = "hits"
	taunt_chance = 30
	speed = -1
	maxHealth = 25
	health = 25
	harm_intent_damage = 8
	obj_damage = 15
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_simple = "bites"
	attack_sound = 'sound/creatures/molerat_attack.ogg'
	speak_emote = list("chitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM
	emote_taunt_sound = list('sound/f13npc/molerat/taunt.ogg')
	emote_taunt = list("hisses")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/molerat/aggro1.ogg', 'sound/f13npc/molerat/aggro2.ogg',)
	idlesound = list('sound/f13npc/molerat/idle.ogg')
	death_sound = 'sound/f13npc/molerat/death.ogg'

/mob/living/simple_animal/hostile/mirelurk
	name = "mirelurk"
	desc = "A giant mutated crustacean with a rock-hard exo-skeleton and a endless hunger."
	icon = 'icons/fallout/mobs/animals/mirelurk.dmi'
	icon_state = "mirelurk"
	icon_living = "mirelurk"
	icon_dead = "mirelurk_d"
	speed = 1
	icon_gib = "gib"
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/mirelurk = 2, /obj/item/stack/sheet/sinew = 1)
	maxHealth = 190
	health = 190
	melee_damage_lower = 18
	melee_damage_upper = 35
	gold_core_spawnable = HOSTILE_SPAWN
	blood_volume = 0

/mob/living/simple_animal/hostile/mirelurk/ancient
	name = "ancient mirelurk"
	desc = "A giant mutated crustacean, this one is scarred and looks ancient, larger than its younger kin."
	icon_state = "mirelurk_ancient"
	icon_living = "mirelurk_ancient"
	speed = 1.2
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/mirelurk = 3, /obj/item/stack/sheet/sinew = 1)
	maxHealth = 280
	health = 280
	melee_damage_lower = 23
	melee_damage_upper = 40
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/mirelurk/baby
	name = "mirelurk baby"
	desc = "A neophyte mirelurk baby, mostly harmless."
	icon_state = "mirelurkbaby"
	icon_living = "mirelurkbaby"
	icon_dead = "mirelurkbaby_d"
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/mirelurk = 1)
	speed = 0.9
	maxHealth = 50
	health = 50
	melee_damage_lower = 5
	melee_damage_upper = 10
	gold_core_spawnable = HOSTILE_SPAWN

/mob/living/simple_animal/hostile/mirelurk/baby/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/mirelurk/baby/Aggro()
	..()
	summon_backup(10)

/obj/structure/mirelurkegg
	name = "mirelurk eggs"
	desc = "A fresh clutch of mirelurk eggs."
	icon = 'icons/mob/wastemobsdrops.dmi'
	icon_state = "mirelurkeggs"
	density = 1
	anchored = 0

/mob/living/simple_animal/hostile/skolf
	name = "skull wolf"
	desc = "Half rotted by radiation, blind, hunting by smell and sound."
	icon = 'icons/fallout/mobs/hostile_east.dmi'
	icon_state = "skolf"
	icon_living = "skolf"
	icon_dead = "skolf_dead"
	icon_gib = "gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	turns_per_move = 1
	response_help_simple = "pets"
	response_disarm_simple = "pushes aside"
	response_harm_simple = "kicks"
	maxHealth = 70
	health = 70
	faction = list("hostile", "wolf")
	environment_smash = 0
	guaranteed_butcher_results = list(/obj/item/stack/sheet/animalhide/wolf = 1, /obj/item/reagent_containers/food/snacks/meat/slab/wolf = 1,/obj/item/stack/sheet/bone = 1)
	melee_damage_lower = 14
	melee_damage_upper = 23
	aggro_vision_range = 12
	attack_verb_simple = "bites"
	attack_sound = 'sound/weapons/bite.ogg'
	move_to_delay = 2
	speed = -1.5
	emote_taunt_sound = list('sound/f13npc/dog/dog_charge1.ogg', 'sound/f13npc/dog/dog_charge2.ogg', 'sound/f13npc/dog/dog_charge3.ogg', 'sound/f13npc/dog/dog_charge4.ogg', 'sound/f13npc/dog/dog_charge5.ogg', 'sound/f13npc/dog/dog_charge6.ogg', 'sound/f13npc/dog/dog_charge7.ogg',)
	emote_taunt = list("growls", "barks", "snarls")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/dog/dog_alert1.ogg', 'sound/f13npc/dog/dog_alert2.ogg', 'sound/f13npc/dog/dog_alert3.ogg')
	idlesound = list('sound/f13npc/dog/dog_bark1.ogg', 'sound/f13npc/dog/dog_bark2.ogg', 'sound/f13npc/dog/dog_bark3.ogg')
	death_sound = 'sound/f13npc/centaur/centaur_death.ogg'


// Uncommon beasts

/mob/living/simple_animal/hostile/radscorpioneast
	name = "Radscorpion"
	desc = "A mutated arthropod with an armored carapace and a powerful sting."
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	icon_state = "radscorpion_blue"
	icon_living = "radscorpion_blue"
	icon_dead = "radscorpion_blue_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	guaranteed_butcher_results  = list(/obj/item/reagent_containers/food/snacks/meat/slab/radscorpion_meat = 2)
	butcher_results = list(/obj/item/stack/sheet/animalhide/chitin = 2)
	butcher_difficulty = 1.5
	response_help_simple = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple = "hits"
	taunt_chance = 30
	speed = 1.25
	maxHealth = 150
	health = 150
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 35
	melee_damage_upper = 35
	a_intent = INTENT_HARM
	attack_verb_simple = "stings"
	attack_sound = 'sound/creatures/radscorpion_attack.ogg'
	speak_emote = list("hisses")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("radscorpion")
	gold_core_spawnable = HOSTILE_SPAWN
	var/scorpion_color = "radscorpion" //holder for icon set
	var/list/icon_sets = list("radscorpion", "radscorpion_blue", "radscorpion_black")
	blood_volume = 0
	emote_taunt = list("snips")
	emote_taunt_sound = list('sound/f13npc/scorpion/taunt1.ogg', 'sound/f13npc/scorpion/taunt2.ogg', 'sound/f13npc/scorpion/taunt3.ogg')

	aggrosound = list('sound/f13npc/scorpion/aggro.ogg', )
	idlesound = list('sound/creatures/radscorpion_snip.ogg', )

	death_sound = 'sound/f13npc/scorpion/death.ogg'


/mob/living/simple_animal/hostile/radscorpioneast/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent(/datum/reagent/toxin, 5)

/mob/living/simple_animal/hostile/giantanteast
	name = "Giant Ant"
	desc = "A large mutated insect that finds its way everywhere."
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	icon_state = "ant"
	icon_living = "ant"
	icon_dead = "ant_dead"
	icon_gib = "gib"
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	guaranteed_butcher_results = list(/obj/item/stack/sheet/sinew = 1, /obj/item/reagent_containers/food/snacks/meat/slab/ant_meat = 2)
	butcher_results = list(/obj/item/stack/sheet/animalhide/chitin = 1)
	butcher_difficulty = 1.5
	response_help_simple = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple = "hits"
	emote_taunt = list("chitters")
	emote_taunt_sound = 'sound/creatures/radroach_chitter.ogg'
	taunt_chance = 30
	speed = 1.5
	maxHealth = 160
	health = 160
	harm_intent_damage = 8
	obj_damage = 20
	melee_damage_lower = 20
	melee_damage_upper = 25
	attack_verb_simple = "stings"
	attack_sound = 'sound/creatures/radroach_attack.ogg'
	speak_emote = list("skitters")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("ant")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM
	decompose = TRUE
	blood_volume = 0

/mob/living/simple_animal/hostile/giantanteast/Initialize()
	. = ..()

/mob/living/simple_animal/hostile/giantanteast/Aggro()
	..()
	summon_backup(10)


/mob/living/simple_animal/hostile/deathclaw/yaoguai
	name = "yao guai"
	desc = "Huge hulking beast, a bear thats irradiated and insane, half blind with bleeding ulcers all over."
	icon = 'icons/fallout/mobs/animals/yaoguai.dmi'
	icon_state = "yaoguai"
	icon_living = "yaoguai"
	icon_dead = "yaoguai_dead"
	icon_gib = "yaoguai_dead"
	speak = list("ROAR!","Rawr!","Grrrowl!","Growl!")
	emote_taunt = list("stares blindly", "sniffs the air")
	speed = 0
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/bear = 4,
							/obj/item/clothing/head/bearpelt = 1,
							/obj/item/stack/sheet/bone = 4)
	maxHealth = 500
	health = 500
	armour_penetration = 0.6
	melee_damage_lower = 60
	melee_damage_upper = 70
	attack_verb_simple = "claws"
	faction = list("hostile", "wolf")
	wound_bonus = -2
	bare_wound_bonus = 5 
	sharpness = SHARP_EDGED
	emote_taunt_sound = list('sound/f13npc/deathclaw/taunt.ogg')
	aggrosound = list('sound/f13npc/deathclaw/aggro1.ogg', 'sound/f13npc/deathclaw/aggro2.ogg', )
	idlesound = list('sound/f13npc/deathclaw/idle.ogg',)
	death_sound = 'sound/f13npc/deathclaw/death.ogg'



//Want to make these cause like 100 rads or so per bite plus their damage, maybe a little less. Instead of toxins. Remove comment if able to solve it.
/mob/living/simple_animal/hostile/aradnid
	name = "aradnid"
	desc = "Deeply disturbing creature, they can only consume radiated meat and drag their prey to contaminated areas to tenderize them."
	icon = 'icons/fallout/mobs/hostile_east.dmi'
	icon_state = "aradnid"
	icon_living = "aradnid"
	icon_dead = "aradnid_dead"
	mob_biotypes = MOB_ORGANIC|MOB_BUG
	speak_emote = list("chitters")
	emote_hear = list("chitters")
	speak_chance = 5
	turns_per_move = 5
	see_in_dark = 10
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/spider = 2, /obj/item/reagent_containers/food/snacks/spiderleg = 4)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	speed = -0.5
	maxHealth = 150
	health = 150
	obj_damage = 60
	melee_damage_lower = 15
	melee_damage_upper = 25
	faction = list("spiders")
	pass_flags = PASSTABLE
	move_to_delay = 6
	attack_verb_continuous = "bites"
	attack_verb_simple = "bite"
	attack_sound = 'sound/weapons/bite.ogg'
	unique_name = 1
	see_in_dark = 6
	lighting_alpha = LIGHTING_PLANE_ALPHA_MOSTLY_VISIBLE
	footstep_type = FOOTSTEP_MOB_CLAW
	has_field_of_vision = FALSE // 360° vision.

/mob/living/simple_animal/hostile/aradnid/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent(/datum/reagent/radium, 10)


/mob/living/simple_animal/hostile/centaur
	name = "Centaur"
	desc = "The result of infection by FEV gone horribly wrong."
	icon = 'icons/fallout/mobs/hostile_general.dmi'
	icon_state = "centaur"
	icon_living = "centaur"
	icon_dead = "centaur_d"
	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	robust_searching = 1
	turns_per_move = 5
	speak_emote = list("growls")
	emote_see = list("screeches")
	a_intent = INTENT_HARM
	maxHealth = 100
	health = 100
	speed = 2
	harm_intent_damage = 8
	melee_damage_lower = 15
	melee_damage_upper = 15
	ranged = 1
	retreat_distance = 5
	minimum_distance = 5
	attack_verb_simple = "whipped"
	attack_sound = 'sound/hallucinations/growl1.ogg'
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	unsuitable_atmos_damage = 20
	robust_searching = 0
	stat_attack = UNCONSCIOUS
	gold_core_spawnable = HOSTILE_SPAWN
	faction = list("supermutant")
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab/human/centaur = 3,
							/obj/item/stack/sheet/animalhide/human = 2,
							/obj/item/stack/sheet/bone = 2)
	projectiletype = /obj/item/projectile/neurotox
	projectilesound = 'sound/f13npc/centaur/spit.ogg'

	emote_taunt_sound = list('sound/f13npc/centaur/taunt.ogg')
	emote_taunt = list("grunts")
	taunt_chance = 30
	aggrosound = list('sound/f13npc/centaur/aggro1.ogg', )
	idlesound = list('sound/f13npc/centaur/idle1.ogg', 'sound/f13npc/centaur/idle2.ogg')
	death_sound = 'sound/f13npc/centaur/centaur_death.ogg'
	attack_sound = 'sound/f13npc/centaur/lash.ogg'
	wound_bonus = 0

/obj/item/projectile/neurotox
	name = "spit"
	damage = 30
	icon_state = "toxin"
/*
/mob/living/simple_animal/hostile/scolopendra
	name = "Scolopendra"
	desc = "The clicking of chitin and multitudes of legs is all you hear before the huge centipede rushes in to catch its prey."
	icon = 'icons/fallout/mobs/animals/scolopendra.dmi'
	icon_state = "scolopendra"
	icon_living = "scolopendra"
	icon_dead = "scolopendra_dead"
	icon_gib = null
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	speak_chance = 0
	turns_per_move = 5
	guaranteed_butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/slab = 4, /obj/item/stack/sheet/sinew = 2, /obj/item/stack/sheet/bone = 2)
	butcher_results = list(/obj/item/clothing/head/f13/stalkerpelt = 1)
	butcher_difficulty = 3
	response_help_simple = "pets"
	response_disarm_simple = "gently pushes aside"
	response_harm_simple = "bites"
	emote_taunt = list("growls")
	taunt_chance = 30
	speed = 4
	maxHealth = 300
	health = 300
	harm_intent_damage = 8
	obj_damage = 15
	melee_damage_lower = 15
	melee_damage_upper = 25
	attack_verb_simple = "bites"
	attack_sound = 'sound/creatures/nightstalker_bite.ogg'
	speak_emote = list("growls")
	atmos_requirements = list("min_oxy" = 5, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	faction = list("gecko")
	gold_core_spawnable = HOSTILE_SPAWN
	a_intent = INTENT_HARM


/mob/living/simple_animal/hostile/scolopendra/AttackingTarget()
	. = ..()
	if(. && ishuman(target))
		var/mob/living/carbon/human/H = target
		H.reagents.add_reagent(/datum/reagent/toxin, 20)
*/
