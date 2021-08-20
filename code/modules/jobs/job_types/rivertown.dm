/*
Town access doors
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic surgery/storage: 68 ACCESS_CLONING
Shopkeeper: 34 ACCESS_CARGO_BOT
Banker : 52 ACCESS_MINT_VAULT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Prospector : 48 ACCESS_MINING
Detective : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/



// ALDERMAN

/datum/job/oasis
	exp_type = EXP_TYPE_OASIS

/datum/job/oasis/f13mayor
	title = "Alderman"
	flag = F13MAYOR
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "The town council in theory."
	description = "You are the Alderman, chosen by the town council to lead your settlement into the future. The settlers are a rough crowd but the council hired top-notch mercenaries to make sure the town stays free from outside rule and the council secure at the top."
	selection_color = "#d7b088"
	exp_requirements = 600

	outfit = /datum/outfit/job/den/f13mayor
	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		//	/datum/job/wasteland/f13mobboss,
		),
	)

/datum/outfit/job/den/f13mayor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/den/f13mayor
	name = "Alderman"
	jobtype = /datum/job/oasis/f13mayor
	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/silver/mayor/alderman
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	neck = /obj/item/storage/belt/holster
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight/lantern
	belt = /obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	shoes = /obj/item/clothing/shoes/f13/tan
	uniform = /obj/item/clothing/under/f13/gentlesuit
	suit = /obj/item/clothing/suit/hooded/alderman
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1,
		/obj/item/ammo_box/magazine/m9mmds = 1,
		/obj/item/pen/fountain/captain = 1,
		/obj/item/megaphone = 1,
		)


// Talon Commander

datum/job/oasis/f13sheriff
	title = "Talon Commander"
	flag = F13SHERIFF
	department_flag = DEP_OASIS
	head_announce = list("Security")
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Talon HQ and the Alderman"
	description = "The townies hired you to defend their dirty hovel, and so you will. You know the company lives and dies by its reputation, and so do you, so your boys are gonna bury any fool who tries to muscle their way in."
	selection_color = "#d7b088"
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/cleaner,
	/datum/outfit/loadout/sniper,
	)

	outfit = /datum/outfit/job/den/f13sheriff

	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		//	/datum/job/wasteland/f13mobboss,
		),
	)

/datum/outfit/job/den/f13sheriff
	name = "Talon Commander"
	jobtype = /datum/job/oasis/f13sheriff
	id = /obj/item/card/id/dogtag/sheriff/talon
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_town
	head = /obj/item/clothing/head/helmet/f13/mercenary/heavy
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armor/f13/combat/swat
	r_pocket = /obj/item/flashlight/seclite
	r_hand = /obj/item/melee/onehanded/knife/hunting
	shoes = /obj/item/clothing/shoes/f13/military/leather
	uniform = /obj/item/clothing/under/f13/talonuniform
	belt = /obj/item/storage/belt/military/NCR_Bandolier/ammobandolier
	l_pocket = /obj/item/storage/bag/money/small/den
	mask = /obj/item/clothing/mask/balaclava/merc
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable/zipties = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/den/f13sheriff/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/datum/outfit/loadout/cleaner
	name = "Cleaner"
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/automag/talon = 1,
		/obj/item/ammo_box/magazine/automag/ap = 2,
		/obj/item/gun/ballistic/automatic/smg/ppsh = 1,
		)
	
/datum/outfit/loadout/sniper
	name = "Sniper"
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/mag/antimateriel = 1,
		/obj/item/gun/energy/laser/wattz = 1,
		/obj/item/stock_parts/cell/ammo/ec = 1,
		)


// Talon Mercenary

/datum/job/oasis/f13deputy
	title = "Talon Mercenary"
	flag = F13DEPUTY
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 4
	spawn_positions = 4
	supervisors = "Talon Commander"
	description = "Mercenaries don't die, they just regroup at the gates of Hell some say. Maybe so, but you prefer not finding out. Talon has given you a chance to improve your life, but you got to earn your keep every day."
	selection_color = "#dcba97"
	exp_requirements = 12
	exp_type = EXP_TYPE_OASIS
	exp_requirements = 600

	loadout_options = list(
	/datum/outfit/loadout/grunt,
	/datum/outfit/loadout/gunner,
	)

	outfit = /datum/outfit/job/den/f13deputy
	access = list(ACCESS_BAR, ACCESS_GATEWAY)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13deputy/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/datum/outfit/job/den/f13deputy
	name = "Talon Mercenary"
	jobtype = /datum/job/oasis/f13deputy
	ears = /obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/deputy/talon
	satchel = /obj/item/storage/backpack/satchel/explorer
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armor/f13/combat/chinese
	r_pocket = /obj/item/flashlight/seclite
	r_hand = /obj/item/melee/onehanded/knife/hunting
	shoes = /obj/item/clothing/shoes/f13/military/leather
	uniform = /obj/item/clothing/under/f13/talonuniform
	mask = /obj/item/clothing/mask/balaclava/merc
	belt = /obj/item/storage/belt/military/NCR_Bandolier/ammobandolier
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable/zipties = 1,
		/obj/item/storage/bag/money/small/settler = 1,
		/obj/item/gun/ballistic/automatic/pistol/type17 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		)

/datum/outfit/loadout/grunt
	name = "Grunt"
	head = /obj/item/clothing/head/helmet/f13/mercenary
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/smg/cg45 = 1,
		/obj/item/ammo_box/magazine/cg45 = 2,
		)

/datum/outfit/loadout/gunner
	name = "Gunner"
	head = /obj/item/clothing/head/helmet/f13/mercenary/cover
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/slr = 1,
		/obj/item/ammo_box/magazine/m762 = 2,
		)



// Doctor

/datum/job/oasis/f13dendoc
	title = "Doctor"
	flag = F13DENDOC
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the town Alderman"
	description = "Handy with a scalpel and chemistry beakers, your expertise in the practice of medicine makes you an indispensible asset to the Town. Just remember - medicine doesn't come free, and you aren't here out of the kindness of your heart. Be sure to turn a profit, or the Mayor might reconsider your position!"
	selection_color = "#dcba97"
	outfit = /datum/outfit/job/den/f13dendoc
	access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)
	minimal_access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)

	loadout_options = list(
	/datum/outfit/loadout/physician,
	/datum/outfit/loadout/nurse,
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13dendoc
	name = "Doctor"
	jobtype = /datum/job/oasis/f13dendoc
	chemwhiz = TRUE
	uniform = /obj/item/clothing/under/f13/doctor
	ears = /obj/item/radio/headset/headset_town

	suit = /obj/item/clothing/suit/toggle/labcoat
	backpack = /obj/item/storage/backpack/satchel/med
	satchel = /obj/item/storage/backpack/satchel/med
	shoes = null
	id = /obj/item/card/id/dendoctor
	l_pocket = /obj/item/storage/bag/money/small/settler
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/storage/firstaid/regular,
		/obj/item/clothing/accessory/armband/medblue  \
		)
/datum/outfit/job/den/f13dendoc/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)

/datum/outfit/loadout/physician
	name = "Physician"
	neck = /obj/item/clothing/neck/stethoscope
	shoes = /obj/item/clothing/shoes/f13/brownie
	backpack_contents = list(
		/obj/item/pen/fountain = 1,
		)


/datum/outfit/loadout/nurse
	name = "Nurse"
	head = /obj/item/clothing/head/f13/nursehat
	uniform = /obj/item/clothing/under/rank/medical/doctor/nurse
	shoes = /obj/item/clothing/shoes/sneakers/white
	backpack_contents = list(
		/obj/item/toy/plush/snakeplushie = 1,
		)



// Barkeep

/datum/job/oasis/f13barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Alderman"
	description = "As the innkeeper, you are responsible for comfort and full bellies in town. Hidden safely away behind the town walls, you are free to refine your skills without always watching your back. As a citizen of the town you must follow its laws. However the inn is your private business, and you decide who is allowed to dine or reside in your hospitality."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13barkeep

	loadout_options = list(
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13barkeep
	name = "Barkeep"
	jobtype = /datum/job/oasis/f13barkeep
	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,
		)

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	neck = /obj/item/clothing/neck/apron/labor
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/gun/ballistic/revolver/widowmaker = 1,
		)

/datum/outfit/loadout/richmantender
	name = "Fancy"
	head = /obj/item/clothing/head/fedora
	glasses = /obj/item/clothing/glasses/monocle
	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	shoes = /obj/item/clothing/shoes/f13/fancy
	neck = /obj/item/clothing/neck/tie/black
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
		/obj/item/ammo_box/magazine/m22 = 1,
		)

/datum/outfit/loadout/diner
	name = "Diner"
	uniform = /obj/item/clothing/neck/apron/bartender
	neck = /obj/item/clothing/under/rank/bartender/purple
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/detective = 1,
		/obj/item/ammo_box/c38 = 1,
		)


// Citizen

/datum/job/oasis/f13settler
	title = "Citizen"
	flag = F13SETTLER
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 8
	spawn_positions = 8
	supervisors = "Rivertown Alderman"
	description = "You are a citizen living in Rivertown, it's your home, so act accordingly and keep it as clean and safe as you can."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13settler

	loadout_options = list(
		/datum/outfit/loadout/provisioner,
		/datum/outfit/loadout/bum,
		/datum/outfit/loadout/properlady,
		/datum/outfit/loadout/propergent,
		/datum/outfit/loadout/singer,
		/datum/outfit/loadout/prospector,
	)
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/job/den/f13settler
	name = "Citizen"
	jobtype = /datum/job/oasis/f13settler
	ears = /obj/item/radio/headset/headset_town
	belt = null
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/settler = 1,

		)

/datum/outfit/loadout/provisioner
	name = "Provisioner"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	uniform = /obj/item/clothing/under/f13/merca
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/gun/ballistic/automatic/pistol/n99 = 1,
		/obj/item/ammo_box/magazine/m10mm_adv/simple = 2,
		/obj/item/clothing/ears/headphones = 1,
		/obj/item/shovel = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/bum
	name = "Bum"
	mask = /obj/item/clothing/mask/facewrap
	neck = /obj/item/clothing/neck/mantle/poncho
	uniform = /obj/item/clothing/under/f13/rag
	gloves = /obj/item/clothing/gloves/f13/handwraps
	shoes = /obj/item/clothing/shoes/f13/rag
	backpack_contents = list(
		/obj/item/storage/bag/trash = 1, 
		/obj/item/reagent_containers/food/drinks/bottle/whiskey = 1,
		/obj/item/gun/ballistic/automatic/hobo/zipgun = 1,
		/obj/item/twohanded/spear/scrapspear = 1,
		/obj/item/ammo_box/magazine/zipgun = 1,
		)

/datum/outfit/loadout/properlady
	name = "Proper Lady"
	head = /obj/item/clothing/head/beret/black
	suit = /obj/item/clothing/under/sailordress
	gloves = /obj/item/clothing/gloves/f13/lace
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/reagent_containers/food/drinks/bottle/champagne = 1,
		/obj/item/gun/ballistic/revolver/police = 1,
		/obj/item/ammo_box/c38 = 2,
		)

/datum/outfit/loadout/propergent
	name = "Respectable Gent"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/tan
	backpack_contents = list(
		/obj/item/storage/box/matches = 1,
		/obj/item/storage/fancy/cigarettes/cigars = 1,
		/obj/item/gun/ballistic/revolver/hobo/knifegun = 1,
		/obj/item/ammo_box/m44 = 1,
		)

/datum/outfit/loadout/singer
	name = "Saloon Singer"
	shoes = /obj/item/clothing/shoes/laceup
	gloves = /obj/item/clothing/gloves/ring/silver
	backpack_contents = list(
		/obj/item/clothing/under/f13/classdress = 1,
		/obj/item/clothing/under/suit/black_really = 1,
		/obj/item/clothing/gloves/evening = 1,
		/obj/item/clothing/gloves/color/white = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)

/datum/outfit/loadout/prospector
	name = "Prospector"
	head = /obj/item/clothing/head/scarecrow_hat
	glasses = /obj/item/clothing/glasses/welding
	uniform = /obj/item/clothing/under/f13/lumberjack
	suit = /obj/item/clothing/suit/armor/f13/utilityvest
	belt = /obj/item/storage/bag/ore
	gloves = /obj/item/clothing/gloves/fingerless
	shoes = /obj/item/clothing/shoes/workboots
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/gun/ballistic/rifle/hunting = 1,
		/obj/item/ammo_box/a308 = 2,
		/obj/item/mining_scanner = 1,
		/obj/item/pickaxe/mini = 1,
		)


/*--------------------------------------------------------------*/

/datum/job/oasis/f13shopkeeper
	title = "Shopkeeper"
	flag = F13SHOPKEEPER
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "free hand of the market"
	description = "The greed of the United States survived better than its people. You are an organ of this greed. Ensure its continuation."
	selection_color = "#dcba97"
	exp_requirements = 600

	outfit = /datum/outfit/job/den/f13shopkeeper
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/den/f13shopkeeper
	name = "Shopkeeper"
	jobtype = /datum/job/oasis/f13shopkeeper

	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/roving
	ears = /obj/item/radio/headset/headset_town
	backpack = /obj/item/storage/backpack
	satchel = /obj/item/storage/backpack/satchel
	duffelbag = /obj/item/storage/backpack/duffelbag
	l_pocket = /obj/item/storage/bag/money/small/den
	r_pocket = /obj/item/flashlight/lantern
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list()

/datum/outfit/job/den/f13shopkeeper/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)

/datum/outfit/job/den/f13shopkeeper/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

/datum/job/oasis/f13preacher
	title = "Preacher"
	flag = F13PREACHER
	department_head = list("Captain")
	department_flag = DEP_OASIS
	head_announce = list("Security")
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "Oasis Government & Police Department"
	description = "You have finished your long pilgrimage to the fabled oasis. You have restored the chapel and cleared weeds from the grove, and it is now your duty to restore faith to this empty land. Remember that the Oak is the most holy living relic in this valley, protect it at all costs."
	selection_color = "#dcba97"

	outfit = /datum/outfit/job/den/f13preacher

	loadout_options = list(
		/datum/outfit/loadout/standardpreacher, //Robes, Book
		/datum/outfit/loadout/atompreacher, //Atoms Judgement, Followers Robes
	)

	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)


/datum/outfit/loadout/atompreacher
	name = "Atom's Devout"
	l_hand = /obj/item/twohanded/sledgehammer/atomsjudgement
	backpack_contents = list(
		/obj/item/clothing/under/f13/atombeliever=1,
		/obj/item/clothing/under/f13/atomfaithful=3,
		/obj/item/clothing/head/helmet/f13/atombeliever=1
		)

/datum/outfit/loadout/standardpreacher
	name = "Protector of the Faith"
	l_hand = /obj/item/nullrod
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2
		)

/datum/job/oasis/f13preacher/after_spawn(mob/living/H, mob/M)
	. = ..()
	if(H.mind)
		H.mind.isholy = TRUE

	var/obj/item/storage/book/bible/booze/B = new

	if(GLOB.religion)
		B.deity_name = GLOB.deity
		B.name = GLOB.bible_name
		B.icon_state = GLOB.bible_icon_state
		B.item_state = GLOB.bible_item_state
		to_chat(H, "There is already an established religion onboard the station. You are an acolyte of [GLOB.deity]. Defer to the Chaplain.")
		H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)
		var/nrt = GLOB.holy_weapon_type || /obj/item/nullrod
		var/obj/item/nullrod/N = new nrt(H)
		H.put_in_hands(N)
		return

	var/new_religion = DEFAULT_RELIGION
	if(M.client && M.client.prefs.custom_names["religion"])
		new_religion = M.client.prefs.custom_names["religion"]

	var/new_deity = DEFAULT_DEITY
	if(M.client && M.client.prefs.custom_names["deity"])
		new_deity = M.client.prefs.custom_names["deity"]

	B.deity_name = new_deity


	switch(lowertext(new_religion))
		if("christianity") // DEFAULT_RELIGION
			B.name = pick("The Holy Bible","The Dead Sea Scrolls")
		if("buddhism")
			B.name = "The Sutras"
		if("clownism","honkmother","honk","honkism","comedy")
			B.name = pick("The Holy Joke Book", "Just a Prank", "Hymns to the Honkmother")
		if("chaos")
			B.name = "The Book of Lorgar"
		if("cthulhu")
			B.name = "The Necronomicon"
		if("hinduism")
			B.name = "The Vedas"
		if("homosexuality")
			B.name = pick("Guys Gone Wild","Coming Out of The Closet")
		if("imperium")
			B.name = "Uplifting Primer"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lampism")
			B.name = "Fluorescent Incandescence"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes")
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks", "Sweet Bro and Hella Jef: Expanded Edition","F.A.T.A.L. Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("monkeyism","apism","gorillism","primatism")
			B.name = pick("Going Bananas", "Bananas Out For Harambe")
		if("mormonism")
			B.name = "The Book of Mormon"
		if("pastafarianism")
			B.name = "The Gospel of the Flying Spaghetti Monster"
		if("rastafarianism","rasta")
			B.name = "The Holy Piby"
		if("satanism")
			B.name = "The Unholy Bible"
		if("science")
			B.name = pick("Principle of Relativity", "Quantum Enigma: Physics Encounters Consciousness", "Programming the Universe", "Quantum Physics and Theology", "String Theory for Dummies", "How To: Build Your Own Warp Drive", "The Mysteries of Bluespace", "Playing God: Collector's Edition")
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		if("servicianism", "partying")
			B.name = "The Tenets of Servicia"
			B.deity_name = pick("Servicia", "Space Bacchus", "Space Dionysus")
			B.desc = "Happy, Full, Clean. Live it and give it."
		if("subgenius")
			B.name = "Book of the SubGenius"
		if("toolboxia","greytide")
			B.name = pick("Toolbox Manifesto","iGlove Assistants")
		if("weeaboo","kawaii")
			B.name = pick("Fanfiction Compendium","Japanese for Dummies","The Manganomicon","Establishing Your O.T.P")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)


/datum/outfit/job/den/f13preacher
	name = "Preacher"
	jobtype = /datum/job/oasis/f13preacher

	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town
	belt = null
	uniform = /obj/item/clothing/under/f13/chaplain
	backpack_contents = list(/obj/item/camera/spooky = 1)
	backpack = /obj/item/storage/backpack/cultpack
	satchel = /obj/item/storage/backpack/cultpack
	gloves =		/obj/item/clothing/gloves/fingerless
	shoes = 		/obj/item/clothing/shoes/jackboots
	backpack = 		/obj/item/storage/backpack/cultpack
	satchel = 		/obj/item/storage/backpack/cultpack
	r_hand = 		/obj/item/gun/ballistic/revolver/m29
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/ammo_box/m44=2, \
		/obj/item/reagent_containers/food/drinks/flask=1, \
		/obj/item/storage/fancy/candle_box, \
		/obj/item/storage/bag/money/small/settler)


/*
/datum/job/oasis/f13banker
	title = "Banker"
	flag = F13BANKER
	department_flag = DEP_OASIS
	faction = "Town"
	total_positions = 2
	spawn_positions = 2
	supervisors = "law and order"
	description = "No matter where society lurks, profit and fortune are there to be made! It is up to you to distribute caps and earn interest while safekeeping items of value for the wastelands denizens! Ensure you make a profit and make your money back no matter the cost. You are to work alongside the Town, and should not be attempting to harm the residents of Oasis."
	selection_color = "#dcba97"
	enforces = "You are in a Job meant for encouraging roleplay with others, do not abandon your post or hoard money unless absolutely necessary. Do not use the caps provided for yourself."

	outfit = /datum/outfit/job/den/f13banker

	loadout_options = list(
	/datum/outfit/loadout/classy,
	/datum/outfit/loadout/loanshark,
	/datum/outfit/loadout/investor,
	)

	access = list(ACCESS_BAR, ACCESS_MINT_VAULT)
	minimal_access = list(ACCESS_BAR, ACCESS_MINT_VAULT)

/datum/outfit/job/den/f13banker
	name = "Banker"
	jobtype = /datum/job/oasis/f13banker

	uniform = /obj/item/clothing/under/lawyer/blacksuit
	id = /obj/item/card/id/silver
	ears = /obj/item/radio/headset/headset_town
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/banker)

/datum/outfit/loadout/classy
	name = "Classy"
	head = /obj/item/clothing/head/collectable/tophat
	glasses = /obj/item/clothing/glasses/monocle
	uniform = /obj/item/clothing/under/suit_jacket/charcoal
	suit = /obj/item/clothing/suit/f13/banker
	gloves = /obj/item/clothing/gloves/color/white/redcoat
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(
	/obj/item/cane=1,
	/obj/item/gun/ballistic/automatic/hobo/zipgun=1
	/obj/item/storage/fancy/cigarettes/cigpack_bigboss=1,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass=1
	)

/datum/outfit/loadout/loanshark
	name = "Loanshark"
	glasses = /obj/item/clothing/glasses/orange
	mask = /obj/item/clothing/mask/cigarette/cigar
	suit = /obj/item/clothing/suit/f13/vest
	uniform = /obj/item/clothing/under/f13/sleazeball
	shoes = /obj/item/clothing/shoes/sandal
	backpack_contents = list(
	/obj/item/reagent_containers/food/drinks/bottle/whiskey=1,
	/obj/item/storage/box/matches=1,
	/obj/item/gun/ballistic/automatic/smg/mini_uzi=1
	)
*/
