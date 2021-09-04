/datum/job/raider
	department_flag = WASTELAND
	access = list(ACCESS_DEN)
	minimal_access = list(ACCESS_DEN)
	exp_type = EXP_TYPE_OUTLAW
	faction = "Wastelander"
	social_faction = "Raiders"
	exp_requirements = 0
	selection_color = "#ff4747"

	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/raider,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/raider/bandit,
			/datum/job/raider/psycho,
			/datum/job/raider/tribal,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/boss_bandit,
			/datum/job/raider/boss_psycho,
			/datum/job/raider/boss_tribal,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/raider/bandit,
			/datum/job/raider/psycho,
			/datum/job/raider/tribal,
		),
		/datum/matchmaking_pref/outlaw = list(
			//datum/job/raider,
		),
		/datum/matchmaking_pref/bounty_hunter = list(
			//datum/job/raider,
		),
	)

/datum/outfit/job/raider
	backpack =	/obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	ears = /obj/item/radio/headset/headset_den
	id = /obj/item/card/id/dentattoo
	belt = /obj/item/storage/belt/military/assault



// STREET DOC

/datum/job/raider/streetdoc
	title = "Street Doc"
	flag = F13DENDOCTOR
	faction = "Wastelander"
	social_faction = "Raiders"
	total_positions = 2
	spawn_positions = 2
	description = "Maybe you have read some medical books, maybe you can't read and just have plenty of hands-on experience. Either way, you are what passes for a doctor amongst raiders."
	supervisors = "The Boss."
	outfit = /datum/outfit/job/raider/streetdoc
	loadout_options = list(
		/datum/outfit/loadout/butcher,
		/datum/outfit/loadout/jetcook,
		)

/datum/outfit/job/raider/streetdoc
	name = "Street Doc"
	jobtype = /datum/job/raider/streetdoc
	belt = /obj/item/storage/belt/medical
	shoes = null
	r_pocket = /obj/item/flashlight
	uniform = /obj/item/clothing/under/f13/doctor
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/healthanalyzer = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/grenade/chem_grenade = 1,
		)

/datum/outfit/job/wasteland/f13dendoctor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_MID, src)
	ADD_TRAIT(H, TRAIT_MARS_TEACH, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/jet)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/turbo)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/psycho)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/medx)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/buffout)


/datum/outfit/loadout/butcher
	name = "Butcher"
	neck =	/obj/item/clothing/neck/apron/chef
	shoes = /obj/item/clothing/shoes/winterboots
	gloves =  /obj/item/clothing/gloves/f13/crudemedical
	r_hand = /obj/item/twohanded/chainsaw
	mask = /obj/item/clothing/mask/bandana/skull

/datum/outfit/loadout/jetcook
	name = "Jet Cook"
	head = /obj/item/clothing/head/helmet/f13/hoodedmask
	neck =	/obj/item/clothing/neck/apron/labor
	shoes = /obj/item/clothing/shoes/galoshes
	gloves =  /obj/item/clothing/gloves/color/fyellow
	backpack_contents = list(
		/obj/item/m2flamethrowertank/salvagedflamer = 1,
		/obj/item/reagent_containers/pill/patch/jet = 3,
		/obj/item/ammo_box/jerrycan = 1,
		)


// -------------------------------------- THE BANDITS ------------------------------------------- // 
// The strongest gang, evolved from salvagers who banded together for mutual protection and merged
// with small gangs for protection. Their leader is called the Raider King, first jokingly, but it
// has stuck, and it marks their position as the senior gang leader in the region.


// RAIDER BOSS

/datum/job/raider/boss_bandit
	title = "Raider Boss"
	flag = F13MOBBOSS
	total_positions = 1
	spawn_positions = 1
	description = "Raiders are a rough crowd to say the least, and only exceptionally strong or ruthless individuals can rise to positions of authority amongst them. Don't expect blind obedience, and watch out for knives entering your back if you ever show weakness."
	supervisors = "No one. Might makes right. Hail to the king"
	exp_requirements = 180
	outfit = /datum/outfit/job/raider/boss_bandit
	loadout_options = list(
		/datum/outfit/loadout/gambler,
		/datum/outfit/loadout/goldenone,
		)

	matchmaking_allowed = list(
		/datum/matchmaking_pref/rival = list(
			/datum/job/raider/boss_psycho,
			/datum/job/raider/boss_tribal,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/raider/bandit,
		),
		/datum/matchmaking_pref/friend = list(
			/datum/job/raider/enforcer_bandit,
			/datum/job/raider/streetdoc,
		),
	)

/datum/outfit/job/raider/boss_bandit
	name = "Raider Boss"
	jobtype = /datum/job/raider/boss_bandit
	suit = /obj/item/clothing/suit/armor/raider/leadcoat
	r_pocket = /obj/item/flashlight
	head = /obj/item/clothing/head/helmet/raider/king
	uniform = /obj/item/clothing/under/f13/raider_leather
	shoes = /obj/item/clothing/shoes/f13/military
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1,
		/obj/item/restraints/handcuffs=1,
		/obj/item/storage/bag/money/small/raider/mobboss = 1,)

/datum/outfit/job/raider/boss_bandit/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/loadout/gambler
	name = "Gambler"
	r_hand = /obj/item/gun/ballistic/automatic/pistol/pistol14
	neck = /obj/item/storage/belt/holster
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m14mm = 2,
		/obj/item/melee/unarmed/lacerator = 1,
		/obj/item/toy/cards/deck = 1,
		)

/datum/outfit/loadout/goldenone
	name = "Golden One"
	neck = /obj/item/clothing/neck/necklace/dope
	r_hand = /obj/item/gun/ballistic/automatic/marksman/sniper/gold
	backpack_contents = list(
		/obj/item/ammo_box/magazine/w308 = 2,
		/obj/item/gun/ballistic/revolver/hobo/knifegun = 1,
		)


// RAIDER ENFORCER

/datum/job/raider/enforcer_bandit
	title = "Raider Bodyguard"
	flag = F13ENFORCER
	description = "Hand-picked by the Boss to keep him in power, and alive."
	supervisors = "The Boss."
	total_positions = 2
	spawn_positions = 2
	outfit = /datum/outfit/job/raider/enforcer_bandit
	loadout_options = list(
		/datum/outfit/loadout/professional,
		/datum/outfit/loadout/hiredgun,
		)

/datum/outfit/job/raider/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_NICE_SHOT, src)

/datum/outfit/job/raider/enforcer_bandit
	name = "Raider Bodyguard"
	jobtype = /datum/job/raider/enforcer_bandit
	uniform = /obj/item/clothing/under/f13/merccharm
	shoes = /obj/item/clothing/shoes/f13/explorer
	gloves = /obj/item/clothing/gloves/fingerless
	r_pocket = /obj/item/flashlight
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak=1, \
		/obj/item/restraints/handcuffs=1, \
		/obj/item/storage/bag/money/small/wastelander)

/datum/outfit/loadout/professional
	name = "Professional"
	r_hand = /obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever
	suit = /obj/item/clothing/suit/armor/f13/metalarmor
	head = /obj/item/clothing/head/helmet/f13/raider/arclight
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 2,
		/obj/item/melee/onehanded/knife/hunting = 1,
		)

/datum/outfit/loadout/hiredgun
	name = "Hired Gun"
	head = /obj/item/clothing/head/helmet/raider/pilot
	suit = /obj/item/clothing/suit/armor/raider/king
	mask = /obj/item/clothing/mask/bandana/skull
	gloves = /obj/item/clothing/gloves/f13/leather
	r_hand =	/obj/item/gun/ballistic/revolver/revolver45/gunslinger
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/revolver45/gunslinger = 1,
		/obj/item/ammo_box/a45lcbox = 1,
		/obj/item/melee/onehanded/knife/trench = 1,
		)


// RAIDER - BANDIT
/datum/job/raider/bandit
	title = "Raider Bandit"
	flag = F13RAIDER
	total_positions = 6
	spawn_positions = 6
	description = "With a flexible conscience and long experience in salvaging and stealing, you know how to look out for number one, and that it's better to be one of the wolves than the sheep."
	supervisors = "The Boss, obviously, and his Bodyguards."
	selection_color = "#ff4747"
	outfit = /datum/outfit/job/raider/bandit
	loadout_options = list(
		/datum/outfit/loadout/weldingman,
		/datum/outfit/loadout/painspike,
		)

/datum/outfit/job/raider/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/lance)


/datum/outfit/job/raider/bandit
	name =	"Raider Bandit"
	jobtype =	/datum/job/raider/bandit
	uniform =	/obj/item/clothing/under/f13/raider_leather
	shoes =	/obj/item/clothing/shoes/f13/military/leather
	glasses = /obj/item/clothing/glasses/welding
	gloves = /obj/item/clothing/gloves/fingerless
	r_pocket =	/obj/item/flashlight
	backpack_contents = list(
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/weldingtool/crude = 1,
		)

/datum/outfit/loadout/weldingman
	name = "Weldingman"
	suit = /obj/item/clothing/suit/armor/raider/rebel
	head = /obj/item/clothing/head/helmet/raider/weld
	r_hand = /obj/item/gun/ballistic/automatic/smg/rockwell
	backpack_contents = list(
		/obj/item/ammo_box/magazine/uzim9mm/rockwell = 1,
		/obj/item/melee/onehanded/club/tireiron = 1,
		/obj/item/storage/box/dice = 1,
		)

/datum/outfit/loadout/painspike
	name = "Painspike"
	suit = /obj/item/clothing/suit/armor/f13/raider/painspike
	head = /obj/item/clothing/head/helmet/f13/raider/psychotic
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting/obrez = 1,
		/obj/item/ammo_box/a308 = 3,
		/obj/item/twohanded/baseball/golfclub = 1,
		/obj/item/reagent_containers/food/drinks/bottle/molotov = 1,
		/obj/item/reagent_containers/glass/bottle/napalm = 1,
		/obj/item/lighter/greyscale = 1,
		)



// --------------------------------------- THE PSYCHOS ----------------------------------------------- // 
// Drug makers, junkies, and lost souls, these brain damaged lunatics are brutal but somehow manage to 
// co-exist with the other two partners in the coalition. The Bishop keeps them together with a mix of 
// vague religion and threats, and manufacturing drugs is what brings in the caps.

/datum/job/raider/boss_psycho
	title = "Raider Bishop"
	faction = "Wastelander"
	flag = RAIDERBISHOP
	social_faction = "Raiders"
	total_positions = 1
	spawn_positions = 1
	description = "Psychos are a rough crowd to say the least, and while they are united by some coked out religious traditions, just because they call their their leader the Bishop don't expect the gang to be choir boys. Try to outcrazy your men or rule with fear, either way, you are smart enough to know you need to stay on top or die, either from traitors or the other gangs."
	supervisors = "No one. Might makes right."
	selection_color = "#ff4747"
	exp_requirements = 120
	outfit = /datum/outfit/job/raider/boss_psycho
	loadout_options = list(
		/datum/outfit/loadout/trenchie,
		/datum/outfit/loadout/hammertime,
		)

/datum/outfit/job/raider/boss_psycho
	name =	"Raider Bishop"
	jobtype =	/datum/job/raider/boss_psycho
	head =	/obj/item/clothing/head/helmet/raider/firefighter
	suit =	/obj/item/clothing/suit/armor/f13/sulphitearmor/bishop
	gloves =	/obj/item/clothing/gloves/f13/leather
	r_pocket =	/obj/item/flashlight/flare
	uniform =	/obj/item/clothing/under/f13/chaplain
	shoes =	/obj/item/clothing/shoes/f13/military/plated
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/reagent_containers/pill/patch/turbo = 2,
		/obj/item/flashlight/flare = 1,
		/obj/item/storage/bag/money/small/raider/mobboss = 1,
		/obj/item/storage/book/bible = 1,
		)

/datum/outfit/job/wasteland/f13mobboss/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/loadout/trenchie
	name = "Trenchie"
	r_hand = /obj/item/gun/ballistic/shotgun/trench
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/buck = 1,
		/obj/item/melee/onehanded/machete = 1,
		)

/datum/outfit/loadout/hammertime
	name = "Hammertime"
	r_hand = /obj/item/twohanded/sledgehammer/rockethammer
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/thatgun = 1,
		/obj/item/ammo_box/a556/sport/improvised = 2,
		)


// ENFORCER = STRONGMAN
/datum/job/raider/enforcer_psycho
	title = "Raider Strongman"
	flag = RAIDERSTRONGMAN
	total_positions = 2
	spawn_positions = 2
	description = "Perhaps you have visions from God, perhaps you just know to bet on a winning horse, either way you are the Bishops personal guards."
	supervisors = "The Bishop."
	selection_color = "#ff4747"
	outfit = /datum/outfit/job/raider/enforcer_psycho
	loadout_options = list(
		/datum/outfit/loadout/blastmaster,	// Hunting Rifle, bombs
		/datum/outfit/loadout/smiley,	// Autopipe, mace glove
		)

/datum/outfit/job/raider/enforcer_psycho/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)
	ADD_TRAIT(H, TRAIT_NOSLIPALL, src)

/datum/outfit/job/raider/enforcer_psycho
	name =	"Raider Strongman"
	jobtype =	/datum/job/raider/enforcer_psycho
	head =	/obj/item/clothing/head/helmet/raider/wastehound
	uniform =	/obj/item/clothing/under/jabroni
	suit =	/obj/item/clothing/suit/armor/raider/slammer
	gloves =	/obj/item/clothing/gloves/f13/handwraps
	shoes =	/obj/item/clothing/shoes/f13/raidertreads
	r_pocket =	/obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/turbo = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/loadout/blastmaster
	name =	"Blastmaster"
	head =	/obj/item/clothing/head/helmet/f13/raider/eyebot
	suit =	/obj/item/clothing/suit/armor/raider/iconoclast
	r_hand =	/obj/item/grenade/homemade/firebomb
	shoes =	/obj/item/clothing/shoes/f13/raidertreads
	backpack_contents = list(
		/obj/item/gun/ballistic/rifle/hunting = 1,
		/obj/item/ammo_box/a762 = 2,
		/obj/item/kitchen/knife/butcher = 1,
		/obj/item/grenade/homemade/firebomb = 2,
		/obj/item/grenade/homemade/coffeepotbomb = 2,
		/obj/item/reagent_containers/pill/patch/jet = 1,

		)

/datum/outfit/loadout/smiley
	name =	"Smiley"
	head =	/obj/item/clothing/head/helmet/raider/smiley
	mask =	/obj/item/clothing/mask/whitefacemakeup
	r_hand =	/obj/item/melee/unarmed/maceglove
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/autopipe = 1,
		/obj/item/ammo_box/magazine/autopipe = 2,
		/obj/item/reagent_containers/hypospray/medipen/psycho = 1,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		)


// RAIDER - PSYCHO
/datum/job/raider/psycho
	title = "Raider Psycho"
	flag = RAIDERTRIBAL
	total_positions = 6
	spawn_positions = 6
	description = "You are are one of the Psychos, rejects united by their common faith and fondness of heavy drug use and its manufacturing."
	supervisors = "The bishop and his strongmen."
	selection_color = "#ff4747"
	outfit = /datum/outfit/job/raider/psycho
	loadout_options = list(
		/datum/outfit/loadout/batter,
		/datum/outfit/loadout/warrior,
		)

/datum/outfit/job/wasteland/f13mobboss/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_BIG_LEAGUES, src)

/datum/outfit/job/raider/psycho
	name =	"Raider Psycho"
	jobtype =	/datum/job/raider/psycho
	uniform =	/obj/item/clothing/under/f13/raiderharness
	gloves =	/obj/item/clothing/gloves/f13/handwraps
	shoes = 	/obj/item/clothing/shoes/f13/rag
	r_pocket =	/obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/loadout/batter
	name = "Batter"
	head =	/obj/item/clothing/head/helmet/raider/wastehound
	suit =	/obj/item/clothing/suit/armor/raider/slammer
	r_hand = /obj/item/gun/ballistic/revolver/single_shotgun
	backpack_contents = list(
		/obj/item/ammo_box/shotgun/improvised = 2,
		/obj/item/grenade/smokebomb = 1,
		)

/datum/outfit/loadout/warrior
	name =	"Warrior"
	head =	/obj/item/clothing/head/helmet/raider/warrior
	suit =	/obj/item/clothing/suit/armor/raider
	r_hand =	/obj/item/melee/onehanded/machete/scrapsabre
	l_hand =	/obj/item/shield/riot/buckler/stop
	backpack_contents = list(
		/obj/item/reagent_containers/syringe/medx = 1,
		/obj/item/gun/ballistic/revolver/police = 1,
		/obj/item/ammo_box/c38box/improvised = 1,
		)


// --------------------------------------- THE TRIBE ----------------------------------------------- // 
// A tribe forced into the coaliton by the other two gangs who wanted their gunsmiths and their women,
//but the tribe was too strong to be enslaved. A compromise was made, and the tribe may grumble as they
// provide guns and brothels, but they love the share of caps that come their way, and the new security.

// BOSS = CHIEFTAIN 
/datum/job/raider/boss_tribal
	title = "Raider Chieftain"
	flag = RAIDERCHIEFTAIN
	total_positions = 1
	spawn_positions = 1
	description = "You lead the tribe, a tough job as the weakest of the three gangs, and with least respect. You know the others need your gunsmiths and desire your women, but if bartering fails, your berserkers are fearsome warriors. Even a molerat can sever a jugular when cornered...."
	supervisors = "No one, but you must maintain the approval of your blood kin and the respect of the other two gang leaders if possible."
	selection_color = "#ff4747"
	exp_requirements = 120
	outfit = /datum/outfit/job/raider/boss_tribal

	loadout_options = list(
		/datum/outfit/loadout/insect,
		/datum/outfit/loadout/cavebear,
		)

/datum/outfit/job/raider/boss_tribal/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_LIFEGIVER, src)

/datum/outfit/job/raider/boss_tribal
	name =	"Raider Chieftain"
	jobtype =	/datum/job/raider/boss_tribal
	r_pocket =	/obj/item/flashlight/lantern
	uniform =	/obj/item/clothing/under/f13/merca
	shoes =	/obj/item/clothing/shoes/f13/peltboots
	gloves =	/obj/item/clothing/gloves/ring
	box = /obj/item/storage/survivalkit_tribal/chief
	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 1,
		/obj/item/storage/bag/money/small/raider/mobboss = 1,
		)

/datum/outfit/loadout/insect
	name =	"Lord of Flies"
	head = /obj/item/clothing/head/helmet/f13/raider/supafly
	suit =	/obj/item/clothing/suit/armor/f13/chitinarmor
	r_hand = /obj/item/gun/ballistic/rifle/hobo/plasmacaster 
	backpack_contents = list(
		/obj/item/ammo_box/plasmamusket = 2,
		/obj/item/gun/ballistic/revolver/hobo/knifegun = 1,
		/obj/item/ammo_box/m44box/improvised = 1,
		)

/datum/outfit/loadout/cavebear
	name =	"Lord of Bears"
	head =	/obj/item/clothing/head/helmet/raider/cavebear
	suit =	/obj/item/clothing/suit/armor/raider/bone
	r_hand =	/obj/item/gun/ballistic/revolver/winchesterrebored
	backpack_contents = list(
		/obj/item/ammo_box/a50MG/improvised = 1,
		/obj/item/melee/onehanded/club/warclub = 1
		)


// ENFORCER = BERSERKER
/datum/job/raider/enforcer_tribal
	title = "Raider Berserker"
	flag = RAIDERBERSERKER
	total_positions = 2
	spawn_positions = 2
	description = "The chieftain is your close kin and it's your purpose in life to make sure they remain respected, and alive. It is custom for warriors of the tribe to sniff the rage powder before battle, and to ritualistically consume the cooked flesh of their killed foe."
	supervisors = "The Chieftain."
	selection_color = "#ff4747"
	outfit = /datum/outfit/job/raider/enforcer_tribal
	loadout_options = list(
		/datum/outfit/loadout/brawler,	// 2 x Knuckleguns, Bola
		/datum/outfit/loadout/laser,	// Laser Musket, Trench knife
		)

/datum/outfit/job/raider/enforcer_tribal/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_BERSERKER, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	ADD_TRAIT(H, TRAIT_LONGPORKLOVER, src)	

/datum/outfit/job/raider/enforcer_tribal
	name = "Raider Berserker"
	jobtype = /datum/job/raider/enforcer_tribal
	uniform = /obj/item/clothing/under/pants/f13/warboy
	shoes =	/obj/item/clothing/shoes/f13/peltboots
	box = /obj/item/storage/survivalkit_tribal
	r_pocket = /obj/item/flashlight/lantern
	backpack_contents = list(
		/obj/item/reagent_containers/pill/patch/healingpowder/berserker = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/storage/backpack/spearquiver = 1,
		)

/datum/outfit/loadout/brawler
	name = "Brawler"
	head = /obj/item/clothing/head/helmet/raider/berserker
	suit = /obj/item/clothing/suit/armor/f13/raider/badlands
	r_hand = /obj/item/gun/ballistic/revolver/hobo/knucklegun
	backpack_contents = list(
		/obj/item/gun/ballistic/revolver/hobo/knucklegun = 1,
		/obj/item/ammo_box/c38box = 1,
		/obj/item/restraints/legcuffs/bola = 1,
		)

/datum/outfit/loadout/laser
	name =	"Laser"
	head =	/obj/item/clothing/head/helmet/raider/berserkeralt
	suit =	/obj/item/clothing/suit/armor/raider/bone
	r_hand = /obj/item/gun/ballistic/rifle/hobo/lasmusket
	backpack_contents = list(
		/obj/item/ammo_box/lasmusket = 1,
		/obj/item/melee/onehanded/machete = 1,
		)


// RAIDER - TRIBAL
/datum/job/raider/tribal
	title = "Raider Tribal"
	flag = RAIDERTRIBAL
	total_positions = 6
	spawn_positions = 6
	description = "You are a member of the tribe, bound by blood to a tough life in the wastes, but at least you have many brothers and sisters. Men and women are expected to work hard, whether it be hunting and fighting, or working in the brothel and gathering food. Those who do not work do not eat."
	supervisors = "The chieftain and berserkers first, the other bosses and enforcers second."
	selection_color = "#ff4747"
	outfit = /datum/outfit/job/raider/tribal
	loadout_options = list(
		/datum/outfit/loadout/forager,
		/datum/outfit/loadout/hunter,
		)

/datum/outfit/job/raider/tribal/pre_equip(mob/living/carbon/human/H)
	..()
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)
	ADD_TRAIT(H, TRAIT_TRIBAL, src)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/zipgun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/pepperbox)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/piperifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/autopiperifle)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/shotgunbat)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/knucklegun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/knifegun)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/lasmusket)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/gun/plasmamusket)


/datum/outfit/job/raider/tribal
	name =	"Raider Tribal"
	jobtype =	/datum/job/raider/tribal
	uniform =	/obj/item/clothing/under/f13/exile/tribal
	shoes =	/obj/item/clothing/shoes/f13/peltboots
	r_pocket =	/obj/item/flashlight/lantern
	box =	/obj/item/storage/survivalkit_tribal
	backpack_contents = list(
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/loadout/forager
	name =	"Forager"
	suit =	/obj/item/clothing/suit/hooded/tribaloutcast
	r_hand =	/obj/item/melee/unarmed/tigerclaw
	backpack_contents = list(
		/obj/item/gun/ballistic/automatic/hobo/zipgun = 1,
		/obj/item/ammo_box/c9mm = 1,
		/obj/item/storage/fancy/cigarettes/cigpack_cannabis = 1,
		)

/datum/outfit/loadout/hunter
	name = "Hunter"
	head =	/obj/item/clothing/head/helmet/raider
	suit =	/obj/item/clothing/suit/armor/raider/tribal/ragged
	r_hand =	/obj/item/gun/ballistic/revolver/hobo/pepperbox
	backpack_contents = list(
		/obj/item/ammo_box/c10mm = 1,
		/obj/item/melee/onehanded/club/warclub = 1,
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
