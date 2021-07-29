/datum/export/gear
	include_subtypes = FALSE
	k_elasticity = 0 //We always want clothing/gear

//blanket
/datum/export/gear/hat
	cost = 3
	unit_name = "clothing"
	export_types = list(/obj/item/clothing)
	include_subtypes = TRUE

//Hats

//Blanket
/datum/export/gear/hat
	cost = 5
	unit_name = "hat"
	export_types = list(/obj/item/clothing/head)
	include_subtypes = TRUE

/datum/export/gear/sec_helmet
	cost = 70
	unit_name = "helmet"
	export_types = list(/obj/item/clothing/head/helmet/sec)

/datum/export/gear/sec_soft
	cost = 50
	unit_name = "soft sec cap"
	export_types = list(/obj/item/clothing/head/soft/sec)

/datum/export/gear/sec_helmetalt
	cost = 50
	unit_name = "bullet proof helmet"
	export_types = list(/obj/item/clothing/head/helmet/alt)

/datum/export/gear/sec_helmetold
	cost = 10
	unit_name = "old helmet"
	export_types = list(/obj/item/clothing/head/helmet/old)

/datum/export/gear/sec_helmetblue
	cost = 75
	unit_name = "blue helmet"
	export_types = list(/obj/item/clothing/head/helmet/blueshirt)

/datum/export/gear/sec_helmetriot
	cost = 100
	unit_name = "riot helmet"
	export_types = list(/obj/item/clothing/head/helmet/riot)

/datum/export/gear/sec_helmet_light
	cost = 20
	unit_name = "justice helmet"
	export_types = list(/obj/item/clothing/head/helmet/justice/escape)
	include_subtypes = TRUE

/datum/export/gear/syndicate_helmetswat
	cost = 250
	unit_name = "syndicate helmet"
	export_types = list(/obj/item/clothing/head/helmet/swat)

/datum/export/gear/sec_helmetswat
	cost = 150
	unit_name = "swat helmet"
	export_types = list(/obj/item/clothing/head/helmet/swat/nanotrasen)

/datum/export/gear/thunder_helmet
	cost = 120
	unit_name = "thunder dome helmet"
	export_types = list(/obj/item/clothing/head/helmet/thunderdome)

/datum/export/gear/roman_real
	cost = 30
	unit_name = "roman helmet"
	export_types = list(/obj/item/clothing/head/helmet/roman)

/datum/export/gear/roman_realalt
	cost = 60
	unit_name = "legionnaire helmet"
	export_types = list(/obj/item/clothing/head/helmet/roman/legionnaire)

/datum/export/gear/roman_fake
	cost = 10
	unit_name = "toy roman helmet"
	export_types = list(/obj/item/clothing/head/helmet/roman/fake)

/datum/export/gear/roman_fakealt
	cost = 20
	unit_name = "toy legionnaire helmet"
	export_types = list(/obj/item/clothing/head/helmet/roman/legionnaire/fake)

/datum/export/gear/ash_walker_helm
	cost = 70
	unit_name = "gladiator helmet"
	export_types = list(/obj/item/clothing/head/helmet/gladiator)

/datum/export/gear/lasertag
	cost = 30 //Has armor
	unit_name = "lasertag helmet"
	export_types = list(/obj/item/clothing/head/helmet/redtaghelm)

/datum/export/gear/lasertag/blue
	export_types = list(/obj/item/clothing/head/helmet/bluetaghelm)

/datum/export/gear/knight_helmet
	cost = 200
	k_elasticity = 1/5 //Rare, dont flood it
	unit_name = "knight helmet"
	export_types = list(/obj/item/clothing/head/helmet/knight, /obj/item/clothing/head/helmet/knight/blue, /obj/item/clothing/head/helmet/knight/yellow, /obj/item/clothing/head/helmet/knight/red)

/datum/export/gear/skull_hat
	cost = 70
	k_elasticity = 1/15 //Its just a skull
	unit_name = "skull"
	export_types = list(/obj/item/clothing/head/helmet/skull)

/datum/export/gear/durathread_helm
	cost = 100
	k_elasticity = 1/15
	unit_name = "durathread hat"
	export_types = list(/obj/item/clothing/head/helmet/durathread, /obj/item/clothing/head/beret/durathread, /obj/item/clothing/head/beanie/durathread)

/datum/export/gear/hard_hats
	cost = 50
	unit_name = "hard hat"
	export_types = list(/obj/item/clothing/head/hardhat, /obj/item/clothing/head/hardhat/orange, /obj/item/clothing/head/hardhat/white, /obj/item/clothing/head/hardhat/dblue)

/datum/export/gear/atmos_helm
	cost = 200 //Armored, fire proof, light, and presser proof
	unit_name = "atmos hard hat"
	export_types = list(/obj/item/clothing/head/hardhat/atmos)

/datum/export/gear/crowns
	cost = 350 //Armored, gold 300cr of gold to make so give them 50 more for working
	k_elasticity = 1/5 //Anti-floods
	unit_name = "crown"
	export_types = list(/obj/item/clothing/head/crown, /obj/item/clothing/head/crown/fancy)

/datum/export/gear/cchat
	cost = 40
	unit_name = "centcom hat"
	export_types = list(/obj/item/clothing/head/centhat)

/datum/export/gear/caphat
	cost = 150
	unit_name = "command hat"
	export_types = list(/obj/item/clothing/head/caphat, /obj/item/clothing/head/caphat/parade, /obj/item/clothing/head/caphat/beret)

/datum/export/gear/hophat
	cost = 130
	unit_name = "hop hat"
	export_types = list(/obj/item/clothing/head/hopcap, /obj/item/clothing/head/hopcap/beret)

/datum/export/gear/dechat
	cost = 75
	k_elasticity = 1/8 //Anti-floods
	unit_name = "fedora"
	export_types = list(/obj/item/clothing/head/fedora/det_hat, /obj/item/clothing/head/fedora/curator, /obj/item/clothing/head/fedora)

/datum/export/gear/hoshat
	cost = 140
	unit_name = "hos hat"
	export_types = list(/obj/item/clothing/head/HoS, /obj/item/clothing/head/HoS/beret, /obj/item/clothing/head/beret/sec/navyhos)

/datum/export/gear/syndahoshat
	cost = 300
	unit_name = "syndicate command hat"
	export_types = list(/obj/item/clothing/head/HoS/syndicate, /obj/item/clothing/head/HoS/beret/syndicate)

/datum/export/gear/wardenhat
	cost = 90
	unit_name = "warden hat"
	export_types = list(/obj/item/clothing/head/warden, /obj/item/clothing/head/warden/drill, /obj/item/clothing/head/beret/sec/navywarden)

/datum/export/gear/sechats
	cost = 60
	unit_name = "sec beret"
	export_types = list(/obj/item/clothing/head/beret/sec, /obj/item/clothing/head/beret/sec/navyofficer)

/datum/export/gear/berets
	cost = 30
	unit_name = "beret"
	export_types = list(/obj/item/clothing/head/beret/qm, /obj/item/clothing/head/beret/rd, /obj/item/clothing/head/beret/cmo, /obj/item/clothing/head/beret)

/datum/export/gear/berets
	cost = 30
	unit_name = "beret"
	export_types = list(/obj/item/clothing/head/beret/qm, /obj/item/clothing/head/beret/rd, /obj/item/clothing/head/beret/cmo, /obj/item/clothing/head/beret)

/datum/export/gear/collectable
	cost = 500
	unit_name = "collectable hat"
	k_elasticity = 1/10 //dont flood these
	export_types = list(/obj/item/clothing/head/collectable)
	include_subtypes = TRUE

/datum/export/gear/fancyhats
	cost = 75
	unit_name = "fancy hat"
	k_elasticity = 1/10 //dont flood these
	export_types = list(/obj/item/clothing/head/that, /obj/item/clothing/head/bowler, /obj/item/clothing/head/lizard, /obj/item/clothing/head/canada)

/datum/export/gear/welders
	cost = 30
	unit_name = "welder helm"
	k_elasticity = 1/20 //dont flood these
	export_types = list(/obj/item/clothing/head/welding)

/datum/export/gear/magichat //Magic as is Antags-Wiz/Cults
	cost = 450
	unit_name = "magic hat"
	export_types = list(/obj/item/clothing/head/wizard, /obj/item/clothing/head/culthood, /obj/item/clothing/head/magus, /obj/item/clothing/head/helmet/clockwork)
	exclude_types = list(/obj/item/clothing/head/wizard/fake, /obj/item/clothing/head/wizard/marisa/fake)
	include_subtypes = TRUE

//Shoes

//Blanket
/datum/export/gear/shoes
	cost = 1 //Really dont want to sell EVERY SHOE EVER - yet*
	unit_name = "shoes"
	export_types = list(/obj/item/clothing/shoes)
	include_subtypes = TRUE

/datum/export/gear/magboots
	cost = 50
	unit_name = "magboots"
	export_types = list(/obj/item/clothing/shoes/magboots)

/datum/export/gear/nosellboots
	cost = -5000 //We DONT want scew antags
	unit_name = "error shipment stolen"
	export_types = list(/obj/item/clothing/shoes/magboots/advance)

/datum/export/gear/syndamagboots
	cost = 250
	unit_name = "blood redmagboots"
	export_types = list(/obj/item/clothing/shoes/magboots/syndie)

/datum/export/gear/combatboots
	cost = 30
	unit_name = "combat boots"
	export_types = list(/obj/item/clothing/shoes/combat)

/datum/export/gear/swatboots
	cost = 45
	unit_name = "swat boots"
	export_types = list(/obj/item/clothing/shoes/combat/swat)

/datum/export/gear/galoshes
	cost = 50
	unit_name = "galoshes"
	export_types = list(/obj/item/clothing/shoes/galoshes, /obj/item/clothing/shoes/galoshes/dry)

/datum/export/gear/dressshoes
	cost = 10
	unit_name = "dress shoes"
	export_types = list(/obj/item/clothing/shoes/laceup, /obj/item/clothing/shoes/singerb, /obj/item/clothing/shoes/singery)

/datum/export/gear/working
	cost = 15
	unit_name = "boots"
	export_types = list(/obj/item/clothing/shoes/jackboots/fast, /obj/item/clothing/shoes/winterboots, /obj/item/clothing/shoes/jackboots, /obj/item/clothing/shoes/workboots, /obj/item/clothing/shoes/workboots/mining)

/datum/export/gear/hopboots
	cost = 350 //costs 1000 credits for miners to get
	unit_name = "jump boots"
	export_types = list(/obj/item/clothing/shoes/bhop)

/datum/export/gear/magicboots //Magic as in Antag - Wiz/Cults
	cost = 450
	unit_name = "magic shoes"
	export_types = list(/obj/item/clothing/shoes/sandal/marisa, /obj/item/clothing/shoes/sandal/magic, /obj/item/clothing/shoes/cult, /obj/item/clothing/shoes/clockwork)
	include_subtypes = TRUE

//Headsets/Ears

//Blanket
/datum/export/gear/ears
	cost = 2 //We dont want to sell every headset ever
	unit_name = "ear gear"
	export_types = list(/obj/item/clothing/ears, /obj/item/radio/headset)
	include_subtypes = TRUE

//Gloves

//Blanket
/datum/export/gear/gloves
	cost = 4 //Glove crafting can be done
	unit_name = "gloves"
	export_types = list(/obj/item/clothing/gloves)
	include_subtypes = TRUE

/datum/export/gear/boxing
	cost = 10 //Padding as well as a weapon
	unit_name = "boxing gloves"
	export_types = list(/obj/item/clothing/gloves/boxing)
	include_subtypes = TRUE

/datum/export/gear/combatgloves
	cost = 80
	unit_name = "combat gloves"
	export_types = list(/obj/item/clothing/gloves/tackler/combat, /obj/item/clothing/gloves/tackler/dolphin, /obj/item/clothing/gloves/krav_maga)
	include_subtypes = TRUE

/datum/export/gear/bonegloves
	cost = 30
	unit_name = "bone bracers"
	export_types = list(/obj/item/clothing/gloves/bracer)

/datum/export/gear/yellowgloves
	cost = 50
	unit_name = "insulated gloves"
	export_types = list(/obj/item/clothing/gloves/color/yellow, /obj/item/clothing/gloves/color/red/insulated)

/datum/export/gear/leathergloves
	cost = 20
	unit_name = "leather gloves"
	export_types = list(/obj/item/clothing/gloves/botanic_leather)

/datum/export/gear/fancy
	cost = 25
	unit_name = "fancy gloves"
	export_types = list(/obj/item/clothing/gloves/color/black, /obj/item/clothing/gloves/color/captain, /obj/item/clothing/gloves/color/white)

/datum/export/gear/magicgloves//Magic as in Antag - Wiz/Cults
	cost = 400
	unit_name = "magic gloves"
	export_types = list(/obj/item/clothing/gloves/clockwork)
	include_subtypes = TRUE

//Ties/neck

//Blanket
/datum/export/gear/neck
	cost = 5 //Fancy!
	unit_name = "neck based gear"
	export_types = list(/obj/item/clothing/neck)
	include_subtypes = TRUE

/datum/export/gear/collar
	cost = 7
	unit_name = "collar"
	export_types = list(/obj/item/clothing/neck/petcollar)
	include_subtypes = TRUE

/datum/export/gear/bling
	cost = 15 //Needs a coin
	unit_name = "gold plated necklace"
	export_types = list(/obj/item/clothing/neck/necklace/dope)

//masks

//Blanket
/datum/export/gear/masks
	cost = 3 //Mostly just fake stuff and clowngear
	unit_name = "face gear"
	export_types = list(/obj/item/clothing/mask)
	include_subtypes = TRUE

/datum/export/gear/gasmask
	cost = 4
	unit_name = "gas mask"
	export_types = list(/obj/item/clothing/mask/gas, /obj/item/clothing/mask/gas/glass)

/datum/export/gear/minermask
	cost = 10
	unit_name = "armored mask"
	export_types = list(/obj/item/clothing/mask/gas/welding, /obj/item/clothing/mask/gas/explorer, /obj/item/clothing/mask/gas/syndicate)

/datum/export/gear/sechailer
	cost = 6
	unit_name = "sec hailer"
	export_types = list(/obj/item/clothing/mask/gas/sechailer)
	include_subtypes = TRUE

/datum/export/gear/mask/breath
	cost = 2
	unit_name = "breath mask"
	export_types = list(/obj/item/clothing/mask/breath)

//////////
//SUITS///
//////////

/datum/export/gear/suits
	cost = 40
	unit_name = "suit"
	export_types = list(/obj/item/clothing/suit)
	include_subtypes = TRUE

//////////////////////
//Chameleon Gear//////
//////////////////////
/datum/export/gear/chameleon //Selling a full kit is easy money for 2 tc
	cost = 280
	k_elasticity = 0
	unit_name = "chameleon item"
	export_types = list(/obj/item/clothing/head/chameleon, /obj/item/clothing/mask/chameleon, /obj/item/clothing/under/chameleon, /obj/item/clothing/suit/chameleon, /obj/item/clothing/glasses/chameleon,\
						/obj/item/clothing/gloves/chameleon, /obj/item/clothing/head/chameleon, /obj/item/clothing/shoes/chameleon, /obj/item/storage/backpack/chameleon, \
						/obj/item/storage/belt/chameleon, /obj/item/radio/headset/chameleon, /obj/item/pda/chameleon, /obj/item/stamp/chameleon)
	include_subtypes = TRUE
