/*
WARNING: Changing job names changes spawn position and whitelists too. It's not just path that matters.
Town access doors
Sheriff/Deputy, Gatehouse etc: 62 ACCESS_GATEWAY
General access: 25 ACCESS_BAR
Clinic surgery/storage: 68 ACCESS_CLONING
Machinist/cargo: 34 ACCESS_CARGO_BOT
Banker : 52 ACCESS_MINT_VAULT
Barkeep : 28 ACCESS_KITCHEN - you jebronis made default bar for no reason bruh
Prospector : 48 ACCESS_MINING
Detective : 4 ACCESS_FORENSICS_LOCKERS
here's a tip, go search DEFINES/access.dm
*/

/datum/job/town
	exp_type = EXP_TYPE_OASIS
	department_flag = DEP_OASIS
	faction = "Town"
	selection_color = "#d7b088"
	exp_requirements = 0
	access = list(ACCESS_BAR)
	minimal_access = list(ACCESS_BAR)
	outfit = /datum/outfit/job/town
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town,
		),
	)

/datum/outfit/job/town
	backpack =	/obj/item/storage/backpack/satchel/explorer
	ears =	/obj/item/radio/headset/headset_town
	id = /obj/item/card/id/dogtag/town
	backpack = /obj/item/storage/backpack



/*---------------------- ALDERMAN ---------------------------*/
// Town leader, peace judge and runs the market, using the 
// town treasury to make good deals. Not allowed to kill or rob
// his citizens, technically the employer of the mercenaries.

/datum/job/town/alderman
	title = "Alderman"
	flag = F13MAYOR
	total_positions = 1
	spawn_positions = 1
	supervisors = "The town council in theory."
	description = "You are the Alderman, chosen by the town council to be master of the market and keeper of the treasury. The settlers are a rough crowd but the council hired top-notch mercenaries to make sure the town stays free from outside rule and the council secure at the top."
	exp_requirements = 180

	outfit = /datum/outfit/job/town/alderman
	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_CARGO_BOT, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town,
		//	/datum/job/wasteland/f13mobboss,
		),
	)

/datum/outfit/job/town/alderman/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)

/datum/outfit/job/town/alderman
	name = "Alderman"
	jobtype = /datum/job/town/alderman
	id = /obj/item/card/id/silver/mayor/alderman
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	neck = /obj/item/storage/belt/holster
	l_pocket =	/obj/item/storage/bag/money/small/legofficers
	r_pocket = /obj/item/flashlight/lantern
	belt = /obj/item/gun/ballistic/automatic/pistol/beretta/automatic
	shoes = /obj/item/clothing/shoes/f13/tan
	l_hand = /obj/item/gun/ballistic/automatic/smg/greasegun
	uniform = /obj/item/clothing/under/f13/gentlesuit
	suit = /obj/item/clothing/suit/hooded/alderman
	backpack_contents = list(
		/obj/item/storage/box/citizenship_permits = 1,
		/obj/item/ammo_box/magazine/m9mmds = 1,
		/obj/item/pen/fountain/captain = 1,
		/obj/item/megaphone = 1,
		)



/*------------------------ PREACHER ---------------------------*/
// A unifying figure in the settlement, the preacher is respected
// and the natural leader if the Alderman for some reason is 
// unable to lead. Comfort your flock and protect them from evil-doers.

/datum/job/town/preacher
	title = "Preacher"
	flag = F13PREACHER
	department_head = list("Captain")
	head_announce = list("Security")
	exp_requirements = 120
	total_positions = 1
	spawn_positions = 1
	supervisors = "Rivertown Alderman in theory, but you true master is far above them. If the Alderman is indisposed the people look to you for leadership."
	description = "There are many lost souls in this wasteland, comfort them or condemn them as your conscience and faith demands. You do live here so don't go overboard."
	outfit = /datum/outfit/job/town/preacher
	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town,
		),
	)

/datum/outfit/job/town/preacher
	name = "Preacher"
	jobtype = /datum/job/town/preacher
	id = /obj/item/card/id/dogtag/town/preacher
	belt = null
	backpack = /obj/item/storage/backpack/satchel/leather
	uniform = /obj/item/clothing/under/f13/chaplain
	suit = /obj/item/clothing/suit/armor/f13/rosary
	shoes =	/obj/item/clothing/shoes/f13/fancy
	r_pocket = /obj/item/flashlight/lantern
	l_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/auto5
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/ammo_box/shotgun/slug = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		)

/datum/job/town/preacher/after_spawn(mob/living/H, mob/M)
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
		if("hinduism")
			B.name = "The Vedas"
		if("islam")
			B.name = "Quran"
		if("judaism")
			B.name = "The Torah"
		if("lol", "wtf", "gay", "penis", "ass", "poo", "badmin", "shitmin", "deadmin", "cock", "cocks", "meme", "memes", "amogus", "sussus", "sussus amogus",)
			B.name = pick("Woodys Got Wood: The Aftermath", "War of the Cocks: Farming Troubles", "Self-fisting Rulebook")
			H.adjustOrganLoss(ORGAN_SLOT_BRAIN, 100) // starts off dumb as fuck
		if("mormonism")
			B.name = "The Book of Mormon"
		if("scientology")
			B.name = pick("The Biography of L. Ron Hubbard","Dianetics")
		else
			B.name = "The Holy Book of [new_religion]"

	GLOB.religion = new_religion
	GLOB.bible_name = B.name
	GLOB.deity = B.deity_name

	H.equip_to_slot_or_del(B, SLOT_IN_BACKPACK)

	SSblackbox.record_feedback("text", "religion_name", 1, "[new_religion]", 1)
	SSblackbox.record_feedback("text", "religion_deity", 1, "[new_deity]", 1)



/*------------------ MERCENARY COMMANDER ---------------------*/
// Leader of the mercenaries, men and women who fight for pay.
// Loyalty to their employer is always negotiable, but Rivertown
// is a fat monthly paycheck and betrayal costs reputation which is
// vital if you wanna find work ever again in this business.

/datum/job/town/commander
	title = "Mercenary Commander"
	faction = "Mercenary"
	flag = F13SHERIFF
	head_announce = list("Security")
	total_positions = 1
	spawn_positions = 1
	supervisors = "None"
	description = "The townies hired you to defend their dirty hovel, and so you will. You know the company lives and dies by its reputation, and so do you, so your boys are gonna bury any fool who tries to muscle their way in."
	selection_color = "#dcba97"
	exp_requirements = 180

	loadout_options = list(
	/datum/outfit/loadout/cleaner,
	/datum/outfit/loadout/sniper,
	)

	outfit = /datum/outfit/job/town/commander

	access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_MINT_VAULT, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_MINISAT)
	minimal_access = list(ACCESS_BAR, ACCESS_CLONING, ACCESS_GATEWAY, ACCESS_MINT_VAULT, ACCESS_CLINIC, ACCESS_KITCHEN, ACCESS_MINING, ACCESS_FORENSICS_LOCKERS, ACCESS_MINISAT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town/preacher,
			/datum/job/raider/boss_bandit,
			/datum/job/raider/boss_psycho,
			/datum/job/raider/boss_tribal,
		),
	)

/datum/outfit/job/town/commander
	name = "Mercenary Commander"
	jobtype = /datum/job/town/commander
	id = /obj/item/card/id/dogtag/sheriff/talon
	satchel = /obj/item/storage/backpack/satchel/explorer
	head = /obj/item/clothing/head/helmet/steel/heavy
	glasses = /obj/item/clothing/glasses/sunglasses
	neck = /obj/item/storage/belt/holster/legholster
	suit = /obj/item/clothing/suit/armor/f13/combat/swat
	r_pocket = /obj/item/flashlight/seclite
	r_hand = /obj/item/melee/onehanded/knife/hunting
	shoes = /obj/item/clothing/shoes/f13/military/leather
	uniform = /obj/item/clothing/under/f13/talonuniform
	belt = /obj/item/storage/belt/military/NCR_Bandolier/ammobandolier
	l_pocket =	/obj/item/storage/bag/money/small/legofficers
	mask = /obj/item/clothing/mask/balaclava/merc
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable/zipties = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/job/town/commander/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)
	ADD_TRAIT(H, TRAIT_IRONFIST	, src)
	
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



/*----------------------- MERCENARY --------------------------*/
// From a settlement or the wasteland, mercenaries signed up 
// for the company knowing its a dirty job, but its their ticket
// out of poverty and being disrespected. Often hotheaded and proud,
// they do have professional standards and summary court-martials to
// keep things in check so it does not hurt business.

/datum/job/town/mercenary
	title = "Mercenary"
	faction = "Mercenary"
	flag = F13DEPUTY
	total_positions = 4
	spawn_positions = 4
	supervisors = "Mercenary Commander"
	description = "Mercenaries don't die, they just regroup at the gates of Hell some say. Maybe so, but you prefer not finding out. The outfit has given you a chance to improve your life, but you got to earn your keep every day."
	selection_color = "#dcba97"

	loadout_options = list(
	/datum/outfit/loadout/grunt,
	/datum/outfit/loadout/gunner,
	)

	outfit = /datum/outfit/job/town/mercenary
	access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_MINISAT)
	minimal_access = list(ACCESS_BAR, ACCESS_GATEWAY, ACCESS_MINISAT)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis,
		),
	)

/datum/outfit/job/town/mercenary/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_SELF_AWARE, src)

/datum/outfit/job/town/mercenary
	name = "Mercenary"
	jobtype = /datum/job/town/mercenary
	id = /obj/item/card/id/dogtag/deputy/talon
	satchel = /obj/item/storage/backpack/satchel/explorer
	neck = /obj/item/storage/belt/holster/legholster/chinapistol
	suit = /obj/item/clothing/suit/armor/f13/combat/chinese
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/military/leather
	uniform = /obj/item/clothing/under/f13/talonuniform
	mask = /obj/item/clothing/mask/balaclava/merc
	belt = /obj/item/storage/belt/military/NCR_Bandolier/ammobandolier
	backpack_contents = list(
		/obj/item/restraints/handcuffs/cable/zipties = 1,
		/obj/item/storage/bag/money/small/legenlisted = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/grunt
	name = "Grunt"
	head = /obj/item/clothing/head/helmet/steel
	r_hand = /obj/item/gun/ballistic/automatic/smg/cg45
	backpack_contents = list(
		/obj/item/ammo_box/magazine/cg45 = 2,
		)

/datum/outfit/loadout/gunner
	name = "Gunner"
	head = /obj/item/clothing/head/helmet/steel/cover
	r_hand = /obj/item/gun/ballistic/automatic/m1garand/sks
	backpack_contents = list(
		/obj/item/ammo_box/magazine/sks = 3,
		)



/*---------------------- TOWN DOCTOR ---------------------------*/
// The wealth of Rivertown has allowed the citizens to send promising
// children to other settlements to learn, or to hire tutors. The 
// healtchare in the town has improved drastically due to this.

/datum/job/town/doctor
	title = "Town Doctor"
	flag = F13DENDOC
	faction = "Town"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the town Alderman"
	description = "Handy with a scalpel and chemistry beakers, your expertise in the practice of medicine makes you an indispensible asset to the Town. Just remember - medicine doesn't come free, and you aren't here out of the kindness of your heart. Be sure to turn a profit, or the Mayor might reconsider your position!"
	outfit = /datum/outfit/job/town/doctor
	access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)
	minimal_access = list(ACCESS_BAR, ACCESS_CLINIC, ACCESS_CLONING)

	loadout_options = list(
	/datum/outfit/loadout/physician,
	/datum/outfit/loadout/nurse,
	)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town,
		),
	)

/datum/outfit/job/town/doctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)

/datum/outfit/job/town/doctor
	name = "Town Doctor"
	jobtype = /datum/job/town/doctor
	uniform = /obj/item/clothing/under/f13/doctor
	backpack = /obj/item/storage/backpack/satchel/med
	satchel = /obj/item/storage/backpack/satchel/med
	shoes = /obj/item/clothing/shoes/f13/brownie
	id = /obj/item/card/id/dendoctor
	l_pocket =	/obj/item/storage/bag/money/small/legenlisted
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=2, \
		/obj/item/storage/firstaid/regular,
		/obj/item/clothing/accessory/armband/medblue  \
		/obj/item/gun/ballistic/automatic/pistol/m1911/compact = 1,
		/obj/item/ammo_box/magazine/m45 = 1,
		)

/datum/outfit/loadout/physician
	name = "Physician"
	neck = /obj/item/clothing/neck/stethoscope
	suit = /obj/item/clothing/suit/toggle/labcoat
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



/*---------------------- TOWN BARKEEP ---------------------------*/
// Rivertown specializes in seafood for obvious reasons, but people
// love variety, and the barkeep provides both that and a place to 
// gather, socialize and enjoy a break from daily life.

/datum/job/town/barkeep
	title = "Barkeep"
	flag = F13BARKEEP
	total_positions = 2
	spawn_positions = 2
	supervisors = "Alderman"
	description = "As the barkeep, you are responsible for comfort and full bellies in town. Hidden safely away behind the town walls, you are free to refine your skills without always watching your back. As a citizen of the town you must follow its laws. However the inn is your private business, and you decide who is allowed to dine or reside in your hospitality."
	outfit = /datum/outfit/job/town/barkeep

	loadout_options = list(
	/datum/outfit/loadout/frontier,
	/datum/outfit/loadout/richmantender,
	/datum/outfit/loadout/diner)

	access = list(ACCESS_BAR, ACCESS_KITCHEN)
	minimal_access = list(ACCESS_BAR, ACCESS_KITCHEN)
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/town,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/town,
		),
	)

/datum/outfit/job/town/barkeep
	name = "Barkeep"
	jobtype = /datum/job/town/barkeep
	uniform = /obj/item/clothing/under/f13/bartenderalt
	backpack = /obj/item/storage/backpack/satchel/leather
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/frontier
	name = "Frontier"
	head = /obj/item/clothing/head/bowler
	mask = /obj/item/clothing/mask/fakemoustache
	uniform = /obj/item/clothing/under/f13/westender
	suit = /obj/item/clothing/suit/f13/westender
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/gun/ballistic/revolver/widowmaker = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom,
		/obj/item/ammo_box/magazine/m45 = 1,
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
		/obj/item/ammo_box/shotgun/bean = 1,
		/obj/item/gun/ballistic/revolver/widowmaker = 1,
		/obj/item/gun/ballistic/automatic/pistol/m1911/custom,
		/obj/item/ammo_box/magazine/m45 = 1,
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



/*----------------------- SETTLER ----------------------------*/
// Often new arrivals from downriver, with the lack of living
// space on the central island, the town council encourages the
// reclaiming of wasteland and turning it into farmland.

/datum/job/town/settler
	title = "Settler"
	flag = F13SETTLER
	total_positions = 4
	spawn_positions = 4
	supervisors = "Rivertown Alderman"
	description = "You are a new citizen of Rivertown, but you lack a home of your own in its safety. You scrape together a living in your settlers cabin as well you can."
	outfit = /datum/outfit/job/town/settler
	loadout_options = list(
		/datum/outfit/loadout/farmer,
		/datum/outfit/loadout/bum,
		/datum/outfit/loadout/fisherman,
		/datum/outfit/loadout/prospector,
	)


/datum/outfit/job/town/settler
	name = "Settler"
	jobtype = /datum/job/town/settler
	belt = null
	uniform = /obj/item/clothing/under/f13/settler
	shoes = null
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/farmer
	name = "Farmer"
	neck = /obj/item/clothing/neck/scarf/cptpatriot
	suit = /obj/item/clothing/suit/jacket/miljacket
	uniform = /obj/item/clothing/under/f13/flannelshirt
	shoes = /obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/food/drinks/flask = 1,
		/obj/item/gun/ballistic/revolver/caravan_shotgun = 1,
		/obj/item/ammo_box/shotgun/improvised = 1,
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/clothing/ears/headphones = 1,
		/obj/item/stack/sheet/metal = 10,
		/obj/item/stack/sheet/mineral/wood = 10,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		/obj/item/cultivator = 1,
		)

/datum/outfit/loadout/bum
	name = "Bum"
	mask = /obj/item/clothing/mask/facewrap
	neck = /obj/item/clothing/neck/mantle/poncho
	uniform = /obj/item/clothing/under/f13/rag
	gloves = /obj/item/clothing/gloves/f13/handwraps
	shoes = /obj/item/clothing/shoes/f13/rag
	r_hand = /obj/item/gun/ballistic/revolver/hobo/piperifle 
	backpack_contents = list(
		/obj/item/ammo_box/a556/sport/improvised = 1,
		/obj/item/storage/bag/trash = 1, 
		/obj/item/reagent_containers/food/drinks/bottle/whiskey = 1,
		/obj/item/flashlight/flare = 1,
		/obj/item/melee/onehanded/club/tireiron = 1,
		)

/datum/outfit/loadout/fisherman
	name = "Fisherman"
	uniform = /obj/item/clothing/under/f13/caravaneer
	shoes = /obj/item/clothing/shoes/galoshes
	suit = /obj/item/clothing/suit/apron/overalls
	gloves = /obj/item/clothing/gloves/f13/leather
	r_hand = /obj/item/gun/ballistic/rifle/mag/varmint
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m556/rifle/small = 2,
		/obj/item/flashlight/flare = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/shovel/spade = 1,
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
	backpack_contents = list(
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/gun/ballistic/rifle/hunting = 1,
		/obj/item/ammo_box/a308 = 2,
		/obj/item/mining_scanner = 1,
		/obj/item/pickaxe/mini = 1,
		)


/*---------------------- TOWN CITIZEN ---------------------------*/
// The citizens of Rivertown work in the fishing industry, trading,
// entertaining or doing any of the hundred odd jobs needed in the 
// settlement. You are free, fairly safe, though the shadow of the 
// disaster ten years ago weigh on the minds of the older members.

/datum/job/town/citizen
	title = "Citizen"
	flag = F13SETTLER
	total_positions = 8
	spawn_positions = 8
	supervisors = "Rivertown Alderman"
	description = "You are a citizen living in Rivertown, it's your home, so act accordingly and keep it as clean and safe as you can."

	outfit = /datum/outfit/job/town/citizen
	loadout_options = list(
		/datum/outfit/loadout/properlady,
		/datum/outfit/loadout/propergent,
		/datum/outfit/loadout/tailor,
		/datum/outfit/loadout/singer,
	)

/datum/outfit/job/town/citizen
	name = "Citizen"
	jobtype = /datum/job/town/citizen
	belt = null
	ears = /obj/item/radio/headset/headset_town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = null
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
//	r_hand = /obj/item/book/granter/trait/selection
	backpack_contents = list(
		/obj/item/storage/bag/money/small/legenlisted = 1,
		)

/datum/outfit/loadout/properlady
	name = "Proper Lady"
	head = /obj/item/clothing/head/beret/black
	suit = /obj/item/clothing/under/sailordress
	gloves = /obj/item/clothing/gloves/f13/lace
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/reagent_containers/food/drinks/bottle/champagne = 1,
	/obj/item/gun/ballistic/revolver/police = 1,
	/obj/item/ammo_box/c38 = 2,
	)

/datum/outfit/loadout/propergent
	name = "Respectable Gent"
	head = /obj/item/clothing/head/f13/beaver
	suit = /obj/item/clothing/suit/f13/cowboybvest
	uniform = /obj/item/clothing/under/f13/bartenderalt
	shoes = /obj/item/clothing/shoes/f13/fancy
	backpack_contents = list(/obj/item/storage/box/matches = 1,
	/obj/item/storage/fancy/cigarettes/cigars = 1,
	/obj/item/gun/ballistic/automatic/pistol/ninemil = 1,
	/obj/item/ammo_box/magazine/m9mm = 2,
	)

/datum/outfit/loadout/tailor 
	name = "Tailor"
	uniform = /obj/item/clothing/under/suit/black
	glasses = /obj/item/clothing/glasses/regular/hipster
	shoes = /obj/item/clothing/shoes/laceup
	r_hand = /obj/item/storage/briefcase
	backpack_contents = list(
	/obj/item/clothing/under/suit/black/skirt = 1,
	/obj/item/gun/ballistic/automatic/pistol/pistol22 = 1,
	/obj/item/ammo_box/magazine/m22 = 2,
	)
	
/datum/outfit/loadout/singer
	name = "Saloon Singer"
	shoes = /obj/item/clothing/shoes/laceup
	backpack_contents = list(/obj/item/clothing/under/f13/classdress = 1,
	/obj/item/clothing/under/suit/black_really = 1,
	/obj/item/clothing/gloves/evening = 1,
	/obj/item/clothing/gloves/color/white = 1,
	/obj/item/melee/unarmed/brass = 1,
	)



/*---------------------- TOWN MACHINIST ---------------------------*/
// The secrets of blacksmithing and crafting many things from salvage
// has been kept alive in Rivertown and is the main source of their
// power, besides the income from the open air market and the fishing.

/datum/job/town/machinist
	title = "Town Machinist"
	flag = F13SHOPKEEPER
	total_positions = 1
	spawn_positions = 1
	supervisors = "Town Alderman"
	description = "You are a skilled machinist and mechanic, you have a functional quad bike in your garage which you carry the key for & are responsible for repairs to the vital water wheel that drives the generators and river trading barges."
	outfit = /datum/outfit/job/town/machinist
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT)

/datum/outfit/job/town/machinist
	name = "Town Machinist"
	jobtype =	/datum/job/town/machinist
	uniform =	/obj/item/clothing/under/f13/mechanic
	glasses =	/obj/item/clothing/glasses/welding
	suit =	/obj/item/clothing/suit/armor/f13/utilityvest
	gloves =	/obj/item/clothing/gloves/f13/blacksmith
	belt = /obj/item/storage/belt/utility/waster
	l_pocket =	/obj/item/storage/bag/money/small/legenlisted
	r_pocket =	/obj/item/key/janitor
	shoes =	/obj/item/clothing/shoes/f13/explorer
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/m1911/compact = 1,
		/obj/item/ammo_box/magazine/m45 = 1,
	)

/datum/outfit/job/town/mechanic/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_GENERIC, src)
