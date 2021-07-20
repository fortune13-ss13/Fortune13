//Faction datums of sorts, use the dang hierarchies in the future
//It looks like var/faction controls what becomes visible on setup. Should likely be fixed or something, but I'm not doing it.
/datum/job/CaesarsLegion
	department_flag = LEGION
	selection_color = "#ffeeee"

	forbids = "The Legion forbids: Using drugs such as stimpacks and alcohol. Ghouls joining. Women fighting or being trained to fight (self defense and suicide allowed). Using robots and advanced machines. Killing Legion members in secret, only if according to law and in public is it acceptable."
	enforces = "The Legion demands: Obeying orders of superiors. A roman style name. Wearing the uniform, unless acting as a NON-COMBAT infiltrator. Expect death as punishment for failing to obey."
	objectivesList = list("Focus on the tribals, win them over or intimidate them.", "Focus on Oasis, display dominance.", "Send out patrols and establish checkpoints to curb use of digusting drugs and degenerate behaviour.", "Flagstaff requests more worker: acquire slaves, train them if possible, send them east for breaking if not.", "Make sure no other faction gains dominance over Oasis, if they remain neutral it can be used to the Legions advantage.")

	exp_type = EXP_TYPE_LEGION

/datum/outfit/job/CaesarsLegion
	ears = null
	box = null

/datum/outfit/job/CaesarsLegion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmor)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombatarmormk2)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/legioncombathelmetmk2)

/datum/outfit/job/CaesarsLegion/Legionnaire
	belt = 			/obj/item/storage/belt/military/assault/legion
	ears =			/obj/item/radio/headset/headset_legion
	backpack = 		/obj/item/storage/backpack/explorer
	satchel = 		/obj/item/storage/backpack/satchel/explorer
	uniform = 		/obj/item/clothing/under/f13/legskirt
	shoes = 		/obj/item/clothing/shoes/f13/military/plated
	gloves =		/obj/item/clothing/gloves/legion
	box = 			/obj/item/storage/survivalkit_tribal

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == FEMALE)
		H.gender = MALE
		H.real_name = random_unique_name(MALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

/datum/outfit/job/CaesarsLegion/Legionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)


/obj/item/storage/box/legate
	name = "legate belongings"
	icon_state = "secbox"
	illustration = "flashbang"

/obj/item/storage/box/legate/PopulateContents()
	. = ..()
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/reagent_containers/pill/patch/healpoultice(src)
	new /obj/item/ammo_box/magazine/m44(src)
	new /obj/item/ammo_box/magazine/m44(src)
	new /obj/item/ammo_box/magazine/m44(src)


////////////////////
///Legate - Admin///
////////////////////

/datum/job/CaesarsLegion/Legionnaire/f13legate
	title = "Legate"
	flag = F13LEGATE
	head_announce = list("Security")
	supervisors = "Caesar"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	total_positions = 0
	spawn_positions = 0
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	access = list()
	minimal_access = list()

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legate
	name =			"Legate"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/f13legate
	shoes = 		/obj/item/clothing/shoes/f13/military/legate
	suit = 			/obj/item/clothing/suit/armor/f13/legion/legate
	head = 			/obj/item/clothing/head/helmet/f13/legion/legate
	gloves =		/obj/item/clothing/gloves/legion/legate
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	suit_store = 	/obj/item/gun/ballistic/automatic/pistol/automag
	r_pocket =      /obj/item/storage/bag/money/small/legion
	l_pocket = 		/obj/item/flashlight/lantern
	r_hand = 		/obj/item/gun/ballistic/revolver/ballisticfist
	l_hand = 		/obj/item/ammo_box/shotgun/slug
	backpack = 		null
	satchel = 		null
	box = 			/obj/item/storage/box/legate


///////////////
////Officers///
///////////////

// CENTURION

/datum/job/CaesarsLegion/Legionnaire/f13centurion
	title = "Legion Centurion"
	flag = F13CENTURION
	faction = "Legion"
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	description = "You are the camp commander and strongest soldier. Use your officers, the Decanii, to delegate tasks, make sure you lead and give orders. Take no disrespect, you are the dominus. If you prove a fool or weak, expect to be dispatched by a stronger subordinate."
	supervisors = "the Legate"
	selection_color = "#ffdddd"
	req_admin_notify = 1
	display_order = JOB_DISPLAY_ORDER_CENTURION
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	exp_requirements = 1500

	loadout_options = list(
	/datum/outfit/loadout/palacent, //10mm SMG, large magazines and thermic lance
	/datum/outfit/loadout/rangerhunter, //hunting revolver and ripper
	/datum/outfit/loadout/centurion //marksman and powerfist
	)
/*	/datum/outfit/loadout/berserkercenturion
kept here incase it gets reworked later*/

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13centurion
	name = 			"Legion Centurion"
	jobtype = 		/datum/job/CaesarsLegion/Legionnaire/f13centurion
	id =			/obj/item/card/id/dogtag/legcenturion
	mask =			/obj/item/clothing/mask/bandana/legion/legcenturion
	neck =			/obj/item/storage/belt/holster
	gloves =		/obj/item/clothing/gloves/legion/plated
	glasses = 		/obj/item/clothing/glasses/legionpolarizing
	r_pocket =      /obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern
	box = 			/obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
					/obj/item/restraints/legcuffs/bola=1,
					/obj/item/storage/bag/money/small/legofficers=1,)

/datum/outfit/loadout/palacent
	name = 			"Paladin-Slayer Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/palacent
	head = 			/obj/item/clothing/head/helmet/f13/legion/palacent
	suit_store = 	/obj/item/twohanded/thermic_lance
	backpack_contents = list(
					/obj/item/gun/ballistic/automatic/smg/smg10mm=1,
					/obj/item/ammo_box/magazine/m10mm_adv/ext=2,)

/datum/outfit/loadout/rangerhunter
	name = 			"Ranger-Hunter Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/rangercent
	head = 			/obj/item/clothing/head/helmet/f13/legion/rangercent
	backpack_contents = list(
					/obj/item/ammo_box/c4570=3,
					/obj/item/gun/ballistic/revolver/hunting=1,
					/obj/item/melee/powered/ripper=1,)

/datum/outfit/loadout/centurion
	name = 			"Frontline Centurion"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	suit_store = 	/obj/item/gun/ballistic/automatic/marksman
	backpack_contents = list(
					/obj/item/melee/powerfist/goliath=1,
					/obj/item/ammo_box/magazine/m556/rifle=2,
					/obj/item/tank/internals/oxygen=2,)

/* /datum/outfit/loadout/berserkercenturion
	name = 			"Praetorian Candidate"
	suit = 			/obj/item/clothing/suit/armor/f13/legion/centurion
	head = 			/obj/item/clothing/head/helmet/f13/legion/centurion
	backpack_contents = list(
					/obj/item/melee/unarmed/sappers=1,
					/obj/item/book/granter/martial/berserker=1,
					/obj/item/reagent_containers/pill/patch/healingpowder/berserker=2)


commented out pending rework*/


// VETERAN DECANUS (Riot Shotgun, Spatha M1911)

/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	title = "Legion Veteran Decanus"
	flag = F13DECANVET
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You answer directly to the Centurion, his second in command. Lead the camp, ensure its defended, keep track of the Explorers and use your veterans to their full potential."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANVET
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	exp_requirements = 900

	loadout_options = list(
	/datum/outfit/loadout/decvetfront, // Carl Gustaf and fireaxe, slightly better helmet
	/datum/outfit/loadout/decvetrear //SKS and spatha
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanvet
	name = 			"Legion Veteran Decanus"
	jobtype = 		/datum/job/CaesarsLegion/Legionnaire/f13decanvet
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/heavy
	mask =			/obj/item/clothing/mask/bandana/legion/legdecan
	neck =			/obj/item/storage/belt/holster
	gloves =		/obj/item/clothing/gloves/legion/plated
	glasses = 		/obj/item/clothing/glasses/sunglasses/big
	r_pocket =      /obj/item/flashlight/lantern
	box = 			/obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
					/obj/item/ammo_box/a357=1,
					/obj/item/gun/ballistic/revolver/colt357=1,
					/obj/item/restraints/handcuffs=1,
					/obj/item/storage/bag/money/small/legion=1)

/datum/outfit/loadout/decvetfront
	name =			"Lead from the front"
	head = 			/obj/item/clothing/head/helmet/f13/legion/heavy
	suit_store =	/obj/item/twohanded/fireaxe
	backpack_contents = list(
					/obj/item/gun/ballistic/automatic/smg/cg45=1,
					/obj/item/ammo_box/magazine/cg45=2)

/datum/outfit/loadout/decvetrear
	name = "Lead from the rear"
	head = /obj/item/clothing/head/helmet/f13/legion/vet/decan
	suit_store = /obj/item/gun/ballistic/automatic/m1garand/sks
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/spatha = 1,
		/obj/item/ammo_box/magazine/sks = 3,
		)


// PRIME DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decan
	title = "Legion Prime Decanus"
	flag = F13DECAN
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "A experienced officer, often commanding the camp. Give orders, lead patrols."
	supervisors = "the Veteran Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECAN
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	exp_requirements = 720

	loadout_options = list(
	/datum/outfit/loadout/decprimfront, //worn 10mm SMG and shield, punchdagger
	/datum/outfit/loadout/decprimrear //trail carbine, gladius
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decan
	name =			"Prime Decanus"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/f13decan
	id = 			/obj/item/card/id/dogtag/legveteran
	suit =			/obj/item/clothing/suit/armor/f13/legion/vet
	head =			/obj/item/clothing/head/helmet/f13/legion/prime/decan
	mask =			/obj/item/clothing/mask/bandana/legion/legdecan
	neck =			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/sunglasses
	r_pocket =		/obj/item/flashlight/lantern
	box = 			/obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
					/obj/item/restraints/handcuffs=1,
					/obj/item/gun/ballistic/revolver/revolver45=1,
					/obj/item/ammo_box/c45rev=1)

/datum/outfit/loadout/decprimfront
	name =			"Lead from the front"
	suit_store =	/obj/item/gun/ballistic/automatic/smg/smg10mm/worn
	backpack_contents = list(
					/obj/item/ammo_box/magazine/m10mm_adv/simple = 3,
					/obj/item/shield/riot/legion=1,
					/obj/item/melee/unarmed/punchdagger=1)

/datum/outfit/loadout/decprimrear
	name = "Lead from the rear"
	suit_store = /obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		)


// RECRUIT DECANUS

/datum/job/CaesarsLegion/Legionnaire/f13decanrec
	title = "Legion Recruit Decanus"
	flag = F13DECANREC
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "The junior officer, you must train the recruits and test them, and if a suicide charge is needed, lead them to a glorious death."
	supervisors = "the Prime/Veteran Decanus and the Centurion"
	display_order = JOB_DISPLAY_ORDER_DECANREC
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/recdeclegion, //lever shotgun, reinforced machete
	/datum/outfit/loadout/recdectribal // .44 revolver, javelins and bumper sword
	)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13decanrec
	name = 			"Legion Recruit Decanus"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13decanrec
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet
	head = 			/obj/item/clothing/head/helmet/f13/legion/recruit/decan
	mask =			/obj/item/clothing/mask/bandana/legion/legdecan
	neck =			/obj/item/storage/belt/holster
	belt = 			null
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	r_pocket =		/obj/item/flashlight/lantern
	l_pocket = 		/obj/item/storage/survivalkit_tribal
	backpack_contents = list(
					/obj/item/reagent_containers/pill/patch/healingpowder=1,
					/obj/item/restraints/handcuffs=1)

/datum/outfit/loadout/recdeclegion
	name =			"Born in the Legion"
	suit_store =	/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	belt = 			/obj/item/storage/belt/military/assault/legion
	backpack_contents = list(
					/obj/item/ammo_box/shotgun/buck=2,
					/obj/item/claymore/machete/reinforced=1)

/datum/outfit/loadout/recdectribal
	name =			"Tribal background"
	suit_store =	/obj/item/twohanded/fireaxe/bmprsword
	belt = 			/obj/item/storage/backpack/spearquiver
	backpack_contents = list(
					/obj/item/gun/ballistic/revolver/m29=1,
					/obj/item/ammo_box/m44=3)

////////////////////
///Specialist///////
////////////////////

// VEXILLARIUS (.45 2 ap mag to fight PA, spatha, smoke bomb.) Intended to have flexible loadout to help counter stuff Legion can't replicate.

/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	title = "Legion Vexillarius"
	flag = F13VEXILLARIUS
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You are a Veteran of proven bravery. When not fighting, relay orders from the commander and act as a bodyguard."
	supervisors = "the Veteran Decanus and Centurion"
	display_order = JOB_DISPLAY_ORDER_VEXILLARIUS
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	exp_requirements = 720

	loadout_options = list(
	/datum/outfit/loadout/vexbear, //.45 with AP ammo, spatha, c4
	/datum/outfit/loadout/vexfox // dual .357s, lance, smoke grenades
	)


/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_IRONFIST, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13vexillarius
	name =			"Vexillarius"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/f13vexillarius
	id = 			/obj/item/card/id/dogtag/legveteran
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet/vexil
	mask =			/obj/item/clothing/mask/bandana/legion/legvet
	neck =			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/sunglasses
	gloves =		/obj/item/clothing/gloves/legion/plated
	r_pocket =		/obj/item/flashlight/lantern
	backpack_contents = list(
					/obj/item/reagent_containers/pill/patch/healingpowder=1,
					/obj/item/restraints/handcuffs,
					/obj/item/megaphone/cornu=1)

/datum/outfit/loadout/vexbear
	name =			"Mountain Bear"
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/combvexil
	suit_store = 	/obj/item/gun/ballistic/automatic/pistol/m1911
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m45/ap = 2,
		/obj/item/ammo_box/magazine/m45 = 2,
		/obj/item/grenade/plastic/c4 = 1,
		/obj/item/melee/onehanded/machete/spatha = 1,
		)

/datum/outfit/loadout/vexfox
	name =			"Desert Fox"
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/vexil
	suit_store =	/obj/item/twohanded/spear/lance
	backpack_contents = list(
					/obj/item/ammo_box/a357=4,
					/obj/item/gun/ballistic/revolver/colt357=2,
					/obj/item/grenade/smokebomb=2)



///////////////////
////Legionnaires///
///////////////////

// VETERAN

/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	title = "Veteran Legionnaire"
	flag = F13VETLEGIONARY
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	description = "A hardened warrior, obeying the orders from the Decanus and Centurion is second nature, as is fighting the profligates. If no officers are present, make sure the younger warriors act like proper Legionaires."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_VETLEGIONARY
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	exp_requirements = 600

	loadout_options = list(
		/datum/outfit/loadout/vetshielder, //greasegun, shield, gladius
		/datum/outfit/loadout/vetrifle, //trail gun, .357 revolver, gladius
		/datum/outfit/loadout/vetberserker, //lever shotgun, fireaxe, bola. The former tribal at his peak.
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/vetlegionnaire
	name =			"Veteran Legionnaire"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/vetlegionnaire
	id = 			/obj/item/card/id/dogtag/legveteran
	mask =			/obj/item/clothing/mask/bandana/legion/legvet
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet
	neck = 			/obj/item/storage/belt/holster
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet
	glasses = 		/obj/item/clothing/glasses/sunglasses
	r_pocket =		/obj/item/flashlight/lantern
	backpack_contents = list(
					/obj/item/reagent_containers/pill/patch/healingpowder=1)

/datum/outfit/loadout/vetshielder
	name =			"Breacher"
	suit_store =	/obj/item/gun/ballistic/automatic/smg/greasegun
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/shield/riot/legion = 1,
		)

/datum/outfit/loadout/vetrifle
	name =			"Sharpshooter"
	suit_store =	/obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
		/obj/item/ammo_box/tube/m44 = 2,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/ammo_box/a357 = 1,
		/obj/item/gun/ballistic/revolver/colt357 = 1,
		)


/datum/outfit/loadout/vetberserker
	name =			"Berserker"
	suit_store =	/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	backpack_contents = list(
					/obj/item/ammo_box/shotgun/slug=1,
					/obj/item/twohanded/fireaxe=1,
					/obj/item/restraints/legcuffs/bola=1)


// PRIME

/datum/job/CaesarsLegion/Legionnaire/f13legionary
	title = "Prime Legionnaire"
	flag = F13LEGIONARY
	faction = "Legion"
	total_positions = 4
	spawn_positions = 4
	description = "A front line soldier who has shown ability to obey and fought in some battles. The Legions muscle, the young men who will build the future with their own blood and sacrifice, for Caesar."
	supervisors = "the Decani and Centurion"
	display_order = JOB_DISPLAY_ORDER_LEGIONARY
	exp_requirements = 120
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary

	loadout_options = list(
		/datum/outfit/loadout/primelancer, //.44 revolver, lance
		/datum/outfit/loadout/primerifle, //cowboy repeater, machete
		/datum/outfit/loadout/primebrave //hunting shotgun, throwing spears, bola. Experienced tribal recruit.
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13legionary
	name =			"Prime Legionnaire"
	jobtype = 		/datum/job/CaesarsLegion/Legionnaire/f13legionary
	id =			/obj/item/card/id/dogtag/legprime
	mask =			/obj/item/clothing/mask/bandana/legion/legprime
	head =			/obj/item/clothing/head/helmet/f13/legion/prime
	neck =			/obj/item/storage/belt/holster
	suit =			/obj/item/clothing/suit/armor/f13/legion/prime
	belt = 			null
	glasses =		/obj/item/clothing/glasses/legiongoggles
	r_pocket =		/obj/item/flashlight/lantern
	l_pocket =		/obj/item/restraints/handcuffs
	backpack_contents = list(
					/obj/item/reagent_containers/pill/patch/healingpowder=1)

/datum/outfit/loadout/primelancer
	name =			"Lancer"
	belt = 			/obj/item/storage/belt/military/assault/legion
	suit_store =	/obj/item/twohanded/spear/lance
	backpack_contents = list(
					/obj/item/ammo_box/m44=3,
					/obj/item/restraints/legcuffs/bola=1,
					/obj/item/gun/ballistic/revolver/m29=1)

/datum/outfit/loadout/primerifle
	name =			"Gunner"
	belt = 			/obj/item/storage/belt/military/assault/legion
	suit_store =	/obj/item/gun/ballistic/rifle/repeater/cowboy
	backpack_contents = list(
					/obj/item/ammo_box/a357=3,
					/obj/item/claymore/machete/reinforced=1)

/datum/outfit/loadout/primebrave
	name =			"Brave"
	belt = 			/obj/item/storage/backpack/spearquiver
	suit_store =	/obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
					/obj/item/ammo_box/shotgun/buck=1,
					/obj/item/restraints/legcuffs/bola=1)


// RECRUIT

/datum/job/CaesarsLegion/Legionnaire/f13recleg
	title = "Recruit Legionnaire"
	flag = F13RECRUITLEG
	faction = "Legion"
	total_positions = 5
	spawn_positions = 5
	description = "You have recently come of age or been inducted into Caesar's Legion. You have absolutely no training, and are expected to follow every whim of the Decanii and your Centurion. Respect the soldiers of higher rank."
	supervisors = "the Decani and Centurion."
	display_order = JOB_DISPLAY_ORDER_RECRUITLEG
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg

	loadout_options = list(
		/datum/outfit/loadout/recruittribal, //spiked baseball bat, .357 revolver
		/datum/outfit/loadout/recruitlegion //autopipe, machete
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13recleg
	name =			"Recruit Legionnaire"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/f13recleg
	id = 			/obj/item/card/id/dogtag/legrecruit
	shoes = 		/obj/item/clothing/shoes/f13/military/leather
	suit = 			/obj/item/clothing/suit/armor/f13/legion/recruit
	head = 			/obj/item/clothing/head/helmet/f13/legion/recruit
	mask =			/obj/item/clothing/mask/bandana/legion/legrecruit
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	backpack_contents = list(
		/obj/item/flashlight/lantern=1,
		/obj/item/reagent_containers/pill/patch/healingpowder=2)

/datum/outfit/loadout/recruittribal
	name =			"Tribal Recruit"
	suit_store = 	/obj/item/twohanded/spear/lance
	backpack_contents = list(
					/obj/item/ammo_box/a357=1,
					/obj/item/gun/ballistic/revolver/colt357=1)

/datum/outfit/loadout/recruitlegion
	name =			"Legion Recruit"
	suit_store =	/obj/item/gun/ballistic/automatic/autopipe
	backpack_contents = list(
					/obj/item/claymore/machete=1,
					/obj/item/ammo_box/magazine/autopipe=1)


//EXPLORER

/datum/job/CaesarsLegion/Legionnaire/f13explorer
	title = "Legion Explorer"
	flag = F13EXPLORER
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	description = "Scout the area, secure key points, but do not ignore orders or wordlessly die some place. A good explorer helps his unit by taking initiative and helping the commander without needing micro-managment."
	supervisors = "the Veteran Decanus and Centurion must be obeyed, and as always, respect must be given to other Decanus. You are not a officer, but you are a specialist."
	display_order = JOB_DISPLAY_ORDER_EXPLORER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	exp_requirements = 300

	loadout_options = list(
		/datum/outfit/loadout/expsniper, //scoped trailgun, .357 revolver, c4, machete, smokebomb
		/datum/outfit/loadout/expambusher //trench shotgun, .44 snubnose revolver, c4, smokebomb
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13explorer
	name =			"Legion Explorer"
	jobtype =		/datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = 			/obj/item/card/id/dogtag/legprime
	suit = 			/obj/item/clothing/suit/armor/f13/legion/vet/explorer
	head = 			/obj/item/clothing/head/helmet/f13/legion/vet/explorer
	neck = 			/obj/item/storage/belt/holster
	glasses = 		/obj/item/clothing/glasses/legiongoggles
	r_pocket =		/obj/item/flashlight
	l_pocket =		/obj/item/binoculars
	backpack_contents = list(
					/obj/item/reagent_containers/pill/patch/healingpowder=1,
					/obj/item/grenade/plastic/c4=1,
					/obj/item/grenade/smokebomb=1,
					/obj/item/storage/bag/money/small/legion=1)

/datum/outfit/loadout/expambusher
	name =			"Ambusher"
	suit_store =	/obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
					/obj/item/ammo_box/shotgun/buck=1,
					/obj/item/ammo_box/shotgun/slug=1,
					/obj/item/gun/ballistic/revolver/m29/snub=1,
					/obj/item/ammo_box/m44=1,
					/obj/item/kitchen/knife/combat=1)

/datum/outfit/loadout/expsniper
	name =			"Sniper"
	l_pocket =		/obj/item/attachments/scope
	suit_store =	/obj/item/gun/ballistic/rifle/repeater/trail
	backpack_contents = list(
					/obj/item/claymore/machete/reinforced=1,
					/obj/item/ammo_box/tube/m44=3,
					/obj/item/gun/ballistic/revolver/colt357=1,
					/obj/item/ammo_box/a357=1)

//////////////////////
////Support Roles ////
//////////////////////

// CAMP DUTY Forgemasters: legion weapon recipes, tinkering or Slavemasters, temporary posting for legionnaires, RP, keep eye on slaves.
// For both : Defend camp, help out there, dont run off, Mars teachings to help make potions.

/datum/job/CaesarsLegion/Legionnaire/f13campfollower
	title = "Legion Camp Duty"
	flag = F13CAMPFOLLOWER
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	description = " The Slavemaster is a legionnaire temporarily assigned to keeping slaves and prisoners in check, either to recuperate from wounds or by request. The Forgemaster makes weapons of all sorts and upgrades them, keeping order in the Forge. Both are warriors expected to kill intruders and fight in defense of the camp."
	supervisors = "the Centurion."
	display_order = JOB_DISPLAY_ORDER_CAMPFOLLOWER
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower
	exp_requirements = 300

	loadout_options = list(
		/datum/outfit/loadout/slavemaster, //shotgun, whip, bolas
		/datum/outfit/loadout/forgemaster //sledgehammer, crafting recipes spathas, gladius, lance, trail carbine
		)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13campfollower
	name =			"Camp Duty"
	jobtype = 		/datum/job/CaesarsLegion/Legionnaire/f13campfollower
	id =			/obj/item/card/id/dogtag/legslavemaster
	mask = 			/obj/item/clothing/mask/bandana/legion/camp
	uniform = 		/obj/item/clothing/under/f13/legskirt
	glasses = 		/obj/item/clothing/glasses/sunglasses
	shoes = 		/obj/item/clothing/shoes/roman
	r_pocket = 		/obj/item/restraints/handcuffs
	l_pocket = 		/obj/item/flashlight/lantern

/datum/outfit/loadout/slavemaster
	name =			"Slavemaster"
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	head = 			/obj/item/clothing/head/helmet/f13/legion/prime/slavemaster
	suit = 			/obj/item/clothing/suit/armor/f13/legion/prime/slavemaster
	suit_store = 	/obj/item/gun/ballistic/shotgun/hunting
	backpack_contents = list(
		/obj/item/claymore/machete/reinforced=1,
		/obj/item/ammo_box/shotgun/bean=1,
		/obj/item/melee/curator_whip=1,
		/obj/item/razor=1,
		/obj/item/restraints/legcuffs/bola=1)

/datum/outfit/loadout/forgemaster
	name =			"Forgemaster"
	glasses =		/obj/item/clothing/glasses/welding
	belt =			/obj/item/storage/belt/utility/full/engi
	suit =			/obj/item/clothing/suit/armor/f13/legion/forgemaster
	gloves =		/obj/item/clothing/gloves/legion/forgemaster
	shoes = 		/obj/item/clothing/shoes/f13/military/plated
	suit_store =	/obj/item/twohanded/sledgehammer
	backpack_contents = list(
		/obj/item/stack/sheet/metal/twenty=1,
		/obj/item/stack/sheet/mineral/wood/twenty=1,
		/obj/item/stack/sheet/leather/twenty=1,
		/obj/item/stack/sheet/cloth/thirty=1,
		/obj/item/stack/sheet/prewar=1,
		/obj/item/book/granter/trait/forgemaster=1,
		/obj/item/book/granter/trait/techno=1)


// AUXILIA - Civilians with special training.
// Medicus only one with MID surgery, Treasurer get tinkering, both get Mars & Low Surgery.

/datum/job/CaesarsLegion/auxilia
	title = "Legion Auxilia"
	flag = F13AUXILIA
	faction = "Legion"
	total_positions = 2
	spawn_positions = 2
	description = "A non-combat position in the Legion for free citizens who perform tasks that need special training, such as surgery."
	supervisors = "the Centurion"
	display_order = JOB_DISPLAY_ORDER_AUXILIA
	outfit = /datum/outfit/job/CaesarsLegion/auxilia
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/auxassist, // Tinker and keep track of the money, handle trading beneath the warriors
	/datum/outfit/loadout/auxmedicus // Do surgery, medical tasks.
	)

/*
/datum/outfit/job/CaesarsLegion/auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()
*/

/datum/outfit/job/CaesarsLegion/auxilia
	name = 			"Auxilia"
	jobtype = 		/datum/job/CaesarsLegion/auxilia
	id =			/obj/item/card/id/dogtag/legauxilia
	head =			/obj/item/clothing/head/f13/legion/auxilia
	uniform = 		/obj/item/clothing/under/f13/legauxiliaf
	shoes = 		/obj/item/clothing/shoes/roman
	ears	=		/obj/item/radio/headset/headset_legion
	gloves =		null
	belt =			null
	r_pocket =		/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder=2)

/datum/outfit/job/CaesarsLegion/auxilia/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/loadout/auxassist
	name =		"Treasurer"
	neck =		/obj/item/clothing/neck/cloak/treasurer
	backpack_contents = list(
		/obj/item/folder/red=1,
		/obj/item/paper/natural=2,
		/obj/item/pen/fountain=1,
		/obj/item/storage/bag/money/small/legofficers=2,
		/obj/item/taperecorder=1,
		/obj/item/book/granter/trait/tinkering=1)

/datum/outfit/loadout/auxmedicus
	name =		"Medicus (Surgeon)"
	suit =		/obj/item/clothing/suit/armor/f13/medicus
	gloves =	/obj/item/clothing/gloves/f13/crudemedical
	backpack_contents = list(
		/obj/item/storage/firstaid/ancient=1,
		/obj/item/scalpel=1,
		/obj/item/hemostat=1,
		/obj/item/retractor=1,
		/obj/item/circular_saw=1,
		/obj/item/cautery=1,
		/obj/item/surgical_drapes=1,
		/obj/item/stack/sticky_tape/surgical=1,
		/obj/item/stack/medical/bone_gel=1,
		/obj/item/bonesetter=1,
		/obj/item/book/granter/trait/midsurgery=1)


// LOYAL SLAVES - Servant cook, and assist with medical, low surgery. Worker farm and mine.
// Both get Mars teachings to help out when normal work is done.

/datum/job/CaesarsLegion/slave
	title = "Legion Slave"
	flag = F13LEGIONSLAVE
	faction = "Legion"
	total_positions = 3
	spawn_positions = 3
	description = "A slave that survives the breaking camps is given a Legion appropriate name (latin-tribal inspired) and bull tattoo. Be obedient, respectful, stay inside the camp. Work the farm, mine, make food, clean and help injured men. Do NOT escape on your own, up to you how to handle it if forcibly freed by outside forces."
	supervisors = "Officers and slavemaster first, then auxilia and warriors."
	display_order = JOB_DISPLAY_ORDER_LEGIONSLAVE
	exp_requirements = 120
	outfit = /datum/outfit/job/CaesarsLegion/slave

	loadout_options = list(
		/datum/outfit/loadout/slaveservant,
		/datum/outfit/loadout/slaveworker)

/datum/outfit/job/CaesarsLegion/slave/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)

/datum/outfit/job/CaesarsLegion/slave
	name =		"Legion Slave"
	jobtype =	/datum/outfit/job/CaesarsLegion/slave
	id =		/obj/item/card/id/legionbrand
	uniform =	/obj/item/clothing/under/f13/legslavef
	neck =		/obj/item/electropack/shockcollar
	shoes =		null
	l_pocket =	/obj/item/radio


//Servants cook, clean, help with medical tasks.
/datum/outfit/loadout/slaveservant
	name =		"Servant (Female)"
	head =		/obj/item/clothing/head/f13/legion/servant
	uniform	=	/obj/item/clothing/under/f13/campfollowermale
	gloves =	/obj/item/clothing/gloves/f13/crudemedical
	shoes =		/obj/item/clothing/shoes/roman
	r_pocket =	/obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder=2,
		/obj/item/reagent_containers/pill/patch/healpoultice=2,
		/obj/item/smelling_salts/crafted=1,
		/obj/item/book/granter/trait/lowsurgery=1,
		/obj/item/reagent_containers/food/condiment/flour=2,
		/obj/item/storage/box/bowls=1,
		/obj/item/reagent_containers/glass/beaker/large=1,
		/obj/item/soap/homemade=1,
		/obj/item/lighter=1)

/datum/outfit/loadout/slaveservant/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.gender == MALE)
		H.gender = FEMALE
		H.real_name = random_unique_name(FEMALE)
		H.name = H.real_name
		if(H.wear_id)
			var/obj/item/card/id/dogtag/L = H.wear_id
			L.registered_name = H.name
			L.update_label()

//Laborers farm and mine.
/datum/outfit/loadout/slaveworker
	name =		"Worker (Farm/Mine)"
	suit =		/obj/item/clothing/suit/armor/f13/slavelabor
	uniform =	/obj/item/clothing/under/f13/legslave
	shoes =		/obj/item/clothing/shoes/f13/rag
	r_hand =	/obj/item/flashlight/flare/torch
	backpack_contents = list(
		/obj/item/storage/bag/plants=1,
		/obj/item/reagent_containers/food/snacks/grown/ambrosia/deus=1,
		/obj/item/cultivator=1,
		/obj/item/soap/homemade=1,
		/obj/item/shovel/spade=1)

/*
Possible paths - refine Forgemaster role, more recipes etc.
Continue tweaking down power of loadouts in tandem with NCR.
Slavemaster merged with Forgemaster in a support role has pros and cons, might need shuffle around at some later date.
Add recipes/traits to keep refining support roles.

Priestess of Mars removed to reduce bloat, Legate is enough for admin intervention IC.

Venator  - Removed to reduce role bloat and clarify chain of command.
*/
/datum/job/CaesarsLegion/Legionnaire/f13venator
	title = "Legion Venator"
	flag = F13VENATOR
	faction = "Legion"
	total_positions = 1
	spawn_positions = 1
	description = "You are the Venator -- the Hunter. With your powerful rifle and your many years of experience, you are a formidable killing machine, capable of taking down even the most formidable targets. Note that you are not a rank-and-file legionary, and you should not be operating as such -- your job is special operations, not fighting alongside the hordes of the Legion."
	supervisors = "the Centurion"
	selection_color = "#ffdddd"
	display_order = JOB_DISPLAY_ORDER_VENATOR
	outfit = /datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	exp_requirements = 1500

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/CaesarsLegion/Legionnaire/f13venator
	name = "Legion Venator"
	jobtype = /datum/job/CaesarsLegion/Legionnaire/f13explorer
	id = /obj/item/card/id/dogtag/legvenator
	suit = /obj/item/clothing/suit/armor/f13/legion/venator
	head = /obj/item/clothing/head/helmet/f13/legion/venator
	mask = /obj/item/clothing/mask/bandana/legion/legdecan
	neck = /obj/item/storage/belt/holster
	glasses = /obj/item/clothing/glasses/night
	ears = /obj/item/radio/headset/headset_legion
	r_pocket = /obj/item/binoculars
	suit_store = /obj/item/gun/ballistic/automatic/marksman/sniper
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 3,
		/obj/item/melee/onehanded/machete/gladius = 1,
		/obj/item/storage/bag/money/small/legion = 1,
		/obj/item/reagent_containers/pill/patch/healpoultice = 1,
		/obj/item/gun/ballistic/revolver/revolver45 = 1,
		/obj/item/ammo_box/c45rev = 3,
		)
