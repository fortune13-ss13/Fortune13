/datum/job/wasteland
	department_flag = WASTELAND


/datum/outfit/job/wasteland
	backpack =	/obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo


// RAIDER BOSS

/datum/job/wasteland/f13mobboss
	title = "Raider Boss"
	flag = F13MOBBOSS
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 1
	spawn_positions = 1
	description = "Raiders are a rough crowd to say the least, and only exceptionally strong or ruthless individuals can rise to positions of authority amongst them. Don't expect blind obedience, and watch out for knives entering your back if you ever show weakness."
	supervisors = "No one. Might makes right."
	selection_color = "#ff4747"
	exp_requirements = 300
	exp_type = EXP_TYPE_OUTLAW
	outfit = /datum/outfit/job/wasteland/f13mobboss
	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)

	loadout_options = list(
		/datum/outfit/loadout/pyro,
		/datum/outfit/loadout/gambler,
		/datum/outfit/loadout/king,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis/f13mayor,
			/datum/job/oasis/f13sheriff,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
		),
	)

/datum/outfit/job/wasteland/f13mobboss
	name = "Raider Boss"
	jobtype = /datum/job/wasteland/f13mobboss
	id = /obj/item/card/id/dentattoo
	ears = /obj/item/radio/headset/headset_den
	r_pocket = /obj/item/flashlight/lantern
	uniform = /obj/item/clothing/under/f13/raider_leather
	shoes = null
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/bag/money/small/raider/mobboss = 1,)

/datum/outfit/job/wasteland/f13mobboss/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/wasteland/f13mobboss/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM

/datum/outfit/loadout/pyro
	name = "Burn Baby"
	head = /obj/item/clothing/head/helmet/f13/sulphitehelm
	suit = /obj/item/clothing/suit/armor/f13/sulphitearmor
	shoes = /obj/item/clothing/shoes/f13/military/plated
	gloves = /obj/item/clothing/gloves/f13/leather
	belt = /obj/item/storage/belt/military/assault
	backpack_contents = list(
		/obj/item/twohanded/fireaxe = 1,
		/obj/item/m2flamethrowertank/salvagedflamer = 1,
		/obj/item/reagent_containers/pill/patch/jet = 2,
		)

/datum/outfit/loadout/king
	name = "Raider King"
	r_hand = /obj/item/gun/ballistic/automatic/hobo/destroyer
	suit = /obj/item/clothing/suit/armor/f13/metalarmor/reinforced
	uniform = /obj/item/clothing/under/f13/bennys
	belt = /obj/item/storage/belt/champion
	head = /obj/item/clothing/head/helmet/f13/raidermetal
	shoes = /obj/item/clothing/shoes/jackboots
	backpack_contents = list(
		/obj/item/ammo_box/magazine/greasegun = 2,
		/obj/item/melee/onehanded/machete/scrapsabre = 1,
		)

/datum/outfit/loadout/gambler
	name = "The Gambler"
	l_hand = /obj/item/clothing/gloves/ring/diamond
	suit = /obj/item/clothing/suit/armor/bulletproof
	uniform = /obj/item/clothing/under/f13/bartenderalt
	head = /obj/item/clothing/head/f13/purple/mobster
	shoes = /obj/item/clothing/shoes/laceup
	belt = /obj/item/storage/belt/grenade
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/pistol/pistol14/compact = 1,
		/obj/item/ammo_box/magazine/m14mm = 3,
		/obj/item/storage/belt/holster = 1,
		/obj/item/gun/ballistic/revolver/hobo/knifegun = 1,
		/obj/item/grenade/frag = 1,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/toy/cards/deck = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)


// RAIDER ENFORCER

/datum/job/wasteland/f13enforcer
	title = "Raider Enforcer"
	flag = F13ENFORCER
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 2
	spawn_positions = 2
	description = "Hand-picked by the Boss, your job is to make sure he is respected, and alive."
	supervisors = "The Boss."
	selection_color = "#ff4747"
	exp_requirements = 120
	exp_type = EXP_TYPE_OUTLAW
	outfit = /datum/outfit/job/wasteland/f13enforcer
	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)

	loadout_options = list(
		/datum/outfit/loadout/killer,
		/datum/outfit/loadout/bodyguard,
		/datum/outfit/loadout/strongman,
		)

/datum/outfit/job/wasteland/f13enforcer
	name = "Raider Enforcer"
	jobtype = /datum/job/wasteland/f13enforcer
	uniform = null
	shoes = null
	belt = /obj/item/storage/belt/military/assault
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/job/wasteland/f13enforcer/pre_equip(mob/living/carbon/human/H)
	..()
	r_hand = /obj/item/book/granter/trait/selection

/datum/outfit/job/wasteland/f13enforcer/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM

/datum/outfit/loadout/killer
	name = "Killer"
	head = /obj/item/clothing/head/helmet/f13/fiend
	r_hand = /obj/item/gun/ballistic/automatic/smg/mini_uzi
	uniform = /obj/item/clothing/under/jabroni
	suit = /obj/item/clothing/suit/armor/f13/leather_jacket/combat/coat
	mask = /obj/item/clothing/mask/bandana/skull
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/f13/leather
	shoes = /obj/item/clothing/shoes/jackboots
	r_pocket = /obj/item/flashlight/seclite
	backpack_contents = list(
		/obj/item/ammo_box/magazine/uzim9mm = 2,
		/obj/item/twohanded/baseball/golfclub/louisville = 1,
		)

/datum/outfit/loadout/bodyguard
	name = "Bodyguard"
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	suit = /obj/item/clothing/suit/armor/f13/metalarmor
	uniform = /obj/item/clothing/under/f13/merccharm
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	shoes = /obj/item/clothing/shoes/f13/military/leather
	l_pocket = /obj/item/melee/onehanded/knife/hunting
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		)

/datum/outfit/loadout/strongman
	name = "Strongman"
	uniform = /obj/item/clothing/under/pants/f13/warboy
	head = /obj/item/clothing/head/helmet/skull
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	shoes = /obj/item/clothing/shoes/f13/military/plated
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/hobo/knucklegun = 2,
		/obj/item/ammo_box/c38box = 1,
		/obj/item/reagent_containers/pill/patch/turbo = 1,
		)



// STREET DOC

datum/job/wasteland/f13dendoctor
	title = "Street Doc"
	flag = F13DENDOCTOR
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 1
	spawn_positions = 1
	description = "Maybe you have read some medical books, maybe you can't read and just have plenty of hands-on experience. Either way, you are what passes for a doctor amongst raiders."
	supervisors = "The Boss."
	selection_color = "#ff4747"
	exp_requirements = 60
	exp_type = EXP_TYPE_OUTLAW
	outfit = /datum/outfit/job/wasteland/f13dendoctor
	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)

/datum/outfit/job/wasteland/f13dendoctor
	name = "Street Doc"
	jobtype = /datum/job/wasteland/f13dendoctor
	mask = /obj/item/clothing/mask/gas
	belt = /obj/item/storage/belt/medical
	neck =	/obj/item/clothing/neck/apron/labor
	shoes = /obj/item/clothing/shoes/winterboots
	r_pocket = /obj/item/flashlight/lantern
	uniform = /obj/item/clothing/under/f13/mercc
	gloves =  /obj/item/clothing/gloves/f13/crudemedical
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/grenade/chem_grenade = 1,
		/obj/item/twohanded/chainsaw = 1,
		)


/datum/outfit/job/wasteland/f13dendoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)

/datum/outfit/job/wasteland/f13dendoctor/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	if(!H.gang)
		var/datum/gang/denmob/DM = GLOB.denmob
		GLOB.all_gangs |= DM
		DM.add_member(H)
		H.gang = DM



// RAIDER

/datum/job/wasteland/f13raider
	title = "Raider"
	flag = F13RAIDER
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 8
	spawn_positions = 8
	description = "You are an undesirable figure of some kind- perhaps a corrupt official, or a cannibalistic bartender, or a devious conman, to name a few examples. You have more freedom than anyone else in the wastes, and are not bound by the same moral code as others, but though you may only be interested in self-gain, you still have a responsibility to make your time here interesting, fun, and engaging for others- this means that whatever path you pursue should be more nuanced and flavorful than simple highway robbery or slavery. (Adminhelp if you require help setting up your character for the round.)"
	supervisors = "Your desire to make things interesting and fun"
	selection_color = "#ff4747"
	exp_requirements = 60
	exp_type = EXP_TYPE_WASTELAND
	outfit = /datum/outfit/job/wasteland/f13raider

	access = list()
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			//datum/job/wasteland/f13pusher,
		),
		/datum/matchmaking_pref/rival = list(
			//datum/job/wasteland/f13pusher,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/outlaw = list(
			/datum/job/wasteland/f13raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			/datum/job/wasteland/f13raider,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/raider_supafly,
	/datum/outfit/loadout/raider_yankee,
	/datum/outfit/loadout/raider_blast,
	/datum/outfit/loadout/raider_sadist,
	/datum/outfit/loadout/raider_painspike,
	)


/datum/outfit/job/wasteland/f13raider
	name = "Raider"
	jobtype = /datum/job/wasteland/f13raider
	belt = null
	r_hand = /obj/item/book/granter/trait/selection
	gloves = /obj/item/clothing/gloves/f13/handwraps
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/restraints/handcuffs = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider = 1,
		)

/datum/outfit/job/wasteland/f13raider/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/merca, \
		/obj/item/clothing/under/f13/mercc, \
		/obj/item/clothing/under/f13/raider_leather, \
		/obj/item/clothing/under/f13/raiderrags, \
		/obj/item/clothing/under/pants/f13/ghoul, \
		/obj/item/clothing/under/jabroni)
	shoes = pick(
		/obj/item/clothing/shoes/jackboots,\
		/obj/item/clothing/shoes/f13/raidertreads)

/datum/outfit/job/wasteland/f13raider/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return

	H.social_faction = "Raiders"
	add_verb(H, /mob/living/proc/creategang)

/datum/outfit/loadout/raider_supafly
	name = "Supa-fly"
	suit = /obj/item/clothing/suit/armor/f13/raider/supafly
	head = /obj/item/clothing/head/helmet/f13/raider/supafly
	backpack_contents = list(
		/obj/item/ammo_box/magazine/autopipe = 1,
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/melee/onehanded/club/tireiron = 1,
		/obj/item/storage/box/dice = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis = 1,
		)

/datum/outfit/loadout/raider_yankee
	name = "Yankee"
	suit = /obj/item/clothing/suit/armor/f13/raider/yankee
	head = /obj/item/clothing/head/helmet/f13/raider/yankee
	uniform = /obj/item/clothing/under/f13/batter
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/single_shotgun = 1,
		/obj/item/ammo_box/shotgun/improvised = 1,
		/obj/item/reagent_containers/food/drinks/bottle/molotov = 1,
		/obj/item/reagent_containers/glass/bottle/napalm = 1,
		/obj/item/lighter/greyscale = 1,
		/obj/item/reagent_containers/food/drinks/bottle/rotgut = 1,
		)

/datum/outfit/loadout/raider_blast
	name = "Blastmaster"
	suit = /obj/item/clothing/suit/armor/f13/raider/blastmaster
	head = /obj/item/clothing/head/helmet/f13/raider/blastmaster
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/mosin = 1,
		/obj/item/ammo_box/a762 = 2,
		/obj/item/kitchen/knife/butcher = 1,
		/obj/item/grenade/homemade/firebomb = 3,
		/obj/item/grenade/homemade/coffeepotbomb = 2,
		)

/datum/outfit/loadout/raider_sadist
	name = "Sadist"
	suit = /obj/item/clothing/suit/armor/f13/raider/sadist
	head = /obj/item/clothing/head/helmet/f13/raider/wastehound
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/colt6520 = 1,
		/obj/item/ammo_box/l10mm = 1,
		/obj/item/twohanded/spear = 1,
		/obj/item/reagent_containers/pill/patch/turbo = 1,
		)

/datum/outfit/loadout/raider_painspike
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting/obrez = 1,
		/obj/item/ammo_box/a308 = 3,
		/obj/item/twohanded/baseball/golfclub = 1,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		)

/*
// WASTELANDER

/datum/job/wasteland/f13wastelander
	title = "Wastelander"
	flag = F13WASTELANDER
	faction = "Wastelander"
	total_positions = 4
	spawn_positions = 4
	description = "You got bleak prospects and little to your name, but you're still alive. With no home and no allies, you need to use your wits to survive."
	supervisors = "God"
	selection_color = "#dddddd"
	outfit = /datum/outfit/job/wasteland/f13wastelander
	access = list()		
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/wasteland/f13wastelander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/wasteland/f13wastelander,
			/datum/job/wasteland/f13mobboss,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/wasteland/f13wastelander,
		),
	)
	loadout_options = list(
	/datum/outfit/loadout/tribal,
	/datum/outfit/loadout/salvager,
	/datum/outfit/loadout/scavenger,
	/datum/outfit/loadout/warrior,
	/datum/outfit/loadout/doctor,
	)

/datum/outfit/job/wasteland/f13wastelander
	name = "Wastelander"
	jobtype = /datum/job/wasteland/f13wastelander
	id = null
	ears = null
	belt = null
	r_hand = /obj/item/book/granter/trait/selection
	l_pocket = /obj/item/storage/bag/money/small/wastelander
	r_pocket = /obj/item/flashlight/flare
	belt = /obj/item/melee/onehanded/knife/survival
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/reagent_containers/pill/radx,
		)

/datum/outfit/loadout/tribal
	name = "Tribal"
	uniform = /obj/item/clothing/under/f13/tribe
	suit = /obj/item/clothing/suit/armor/f13/leatherarmor
	suit_store = /obj/item/melee/onehanded/machete
	shoes = /obj/item/clothing/shoes/sandal
	belt = /obj/item/storage/backpack/spearquiver
	box = /obj/item/storage/survivalkit_tribal
	back = /obj/item/storage/backpack/satchel/explorer
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/hobo/piperifle	= 1,
		/obj/item/ammo_box/a556/sport/improvised = 1,
		)

/datum/outfit/loadout/salvager
	name = "Salvager"
	uniform = /obj/item/clothing/under/f13/machinist
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/f13/blacksmith
	head = /obj/item/clothing/head/welding
	suit = /obj/item/clothing/suit/armor/f13/kit
	r_hand = /obj/item/weldingtool
	backpack_contents = list(/obj/item/gun/ballistic/automatic/pistol/m1911/compact=1)

/datum/outfit/loadout/scavenger
	name = "Scavenger"
	shoes = /obj/item/clothing/shoes/f13/explorer
	uniform = /obj/item/clothing/under/f13/lumberjack
	r_hand = /obj/item/storage/backpack/duffelbag/scavengers
	suit =	/obj/item/clothing/suit/armor/f13/leather_jacket
	l_hand = /obj/item/pickaxe
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/mining_scanner=1,
		/obj/item/metaldetector=1,
		/obj/item/shovel=1,
		/obj/item/gun/ballistic/revolver/winchesterrebored = 1,
		/obj/item/ammo_box/a308box = 1,)

/datum/outfit/loadout/settler
	name = "Settler"
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/f13/explorer
	suit = /obj/item/clothing/suit/f13/veteran
	r_hand = /obj/item/hatchet
	l_hand = /obj/item/gun/ballistic/revolver/caravan_shotgun
	belt = /obj/item/storage/belt
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 1,
		/obj/item/stack/sheet/metal = 50,
		/obj/item/stack/sheet/mineral/wood = 50,
		/obj/item/toy/crayon/spraycan = 1,
		/obj/item/cultivator = 1,
		/obj/item/reagent_containers/glass/bucket = 1,
		/obj/item/storage/bag/plants/portaseeder = 1,
		)

/datum/outfit/loadout/medic
	name = "Wandering Doctor"
	uniform = /obj/item/clothing/under/f13/follower
	suit = /obj/item/clothing/suit/toggle/labcoat/f13/followers
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/color/latex
	backpack_contents =  list(
		/obj/item/reagent_containers/medspray/synthflesh=2,
		/obj/item/stack/medical/suture/emergency/fifteen=1,
		/obj/item/stack/medical/ointment/twelve=1,
		/obj/item/defibrillator/primitive = 1,
		/obj/item/smelling_salts/crafted=1,
		/obj/item/healthanalyzer=1,
		/obj/item/stack/sheet/mineral/silver=1,
		/obj/item/gun/ballistic/automatic/pistol/pistol22=1,
		/obj/item/ammo_box/magazine/m22 = 1,
		/obj/item/lighter=1,
		/obj/item/screwdriver=1,
		/obj/item/wirecutters=1,
		/obj/item/saw=1
		)

/datum/outfit/loadout/warrior
	name = "Wasteland Warrior"
	uniform = /obj/item/clothing/under/f13/brahminm
	shoes = /obj/item/clothing/shoes/f13/raidertreads
	suit = /obj/item/clothing/suit/armor/light/wastewar
	head = /obj/item/clothing/head/helmet/f13/wastewarhat
	glasses = /obj/item/clothing/glasses/welding
	l_hand = /obj/item/shield/riot/buckler/stop
	backpack_contents = list(
		/obj/item/melee/onehanded/machete/scrapsabre = 1,
		)
*/
