/////////////
// ENCLAVE //
/////////////

/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#aaaaf7"
	forbids = "Enclave crimes: Fraternizing with outsiders beyond what is absolutly necessary. Aiding Brotherhood members in any way no matter how small."
	enforces = "Enclave rules: Stay in uniform. Act mature and respectful. Obey orders and always remember you are fighting for the only true legitimate power in this land of savages. Wearing gasmasks outside the compound is encouraged but not required."
	objectivesList = list("Department of Defense advisory: Collect resources and produce more Patribots, attrition is depleting our reserves.","Department of Defense advisory: Establish checkpoints to show presence, they must not forget who is the legitimate goverment.", "Science Divison advisory: Capture human subjects for experiments, alive. We have some new neurotoxin grenades we wish to do final tests with before field deployment.")
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

/datum/outfit/job/enclave
	id =	/obj/item/card/id/dogtag/enclave
	ears =	/obj/item/radio/headset/headset_enclave
	box =	/obj/item/storage/survivalkit_aid
	backpack =	/obj/item/storage/backpack/enclave
	satchel =	/obj/item/storage/backpack/satchel/enclave
	shoes =	/obj/item/clothing/shoes/f13/enclave/serviceboots
	belt =	/obj/item/storage/belt/military/assault/enclave
	r_pocket =	/obj/item/flashlight/seclite
	l_pocket =	/obj/item/melee/onehanded/knife/survival


// OFFICER

/datum/job/enclave/officer
	title = "Enclave Officer"
	flag = F13USLT
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	description = "You are the officer in charge of commanding the remnants of the Enclave forces in the area."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 300
	exp_type = EXP_TYPE_ENCLAVE
	outfit = /datum/outfit/job/enclave/officer

/datum/outfit/job/enclave/officer
	name =	"Enclave Officer"
	jobtype =	/datum/job/enclave/officer
	head =	/obj/item/clothing/head/helmet/f13/helmet/enclave/officer
	glasses = /obj/item/clothing/glasses/night
	mask =	/obj/item/clothing/mask/gas/enclave
	neck =	/obj/item/storage/belt/holster/legholster
	uniform =	/obj/item/clothing/under/f13/enclave_officer
	accessory =	/obj/item/clothing/accessory/ncr/LT1
	suit =	/obj/item/clothing/suit/armor/f13/enclave/officercoat
	gloves =	/obj/item/clothing/gloves/combat

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak/super = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/stock_parts/cell/ammo/ec = 3,
		/obj/item/gun/energy/laser/plasma/glock/extended = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/job/enclave/officer/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)

/datum/outfit/job/wasteland/enclavelt/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(H.mind)
		var/obj/effect/proc_holder/spell/terrifying_presence/S = new /obj/effect/proc_holder/spell/terrifying_presence
		H.mind.AddSpell(S)


// ARMORED INFANTRY

/datum/job/enclave/armor
	title = "Enclave Armored Infantry"
	flag = F13USSGT
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	description = "Entrusted with the now rare advanced heavy weapons, your nation relies on you doing your job and carrying out the orders of your officer."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 300
	exp_type = EXP_TYPE_ENCLAVE
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/enclave/armor

/datum/outfit/job/enclave/armor
	name = "Enclave Armored Infantry"
	jobtype = /datum/job/enclave/armor
	head =	/obj/item/clothing/head/helmet/f13/power_armor/x02helmet
	mask =	/obj/item/clothing/mask/gas/enclave
	glasses =	/obj/item/clothing/glasses/night
	neck =	/obj/item/storage/belt/holster/legholster
	uniform =	/obj/item/clothing/under/f13/enclave/peacekeeper
	suit =	/obj/item/clothing/suit/armor/f13/power_armor/x02
	accessory =	/obj/item/clothing/accessory/ncr/SGT
	belt =	/obj/item/storage/belt/military/assault/enclave
	gloves =	/obj/item/clothing/gloves/combat

	backpack_contents = list(
		/obj/item/minigunpack = 1,
		/obj/item/grenade/smokebomb = 1,
		/obj/item/gun/ballistic/automatic/pistol/sig = 1,
		/obj/item/ammo_box/magazine/m9mm = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)

/datum/outfit/job/enclave/armor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
	ADD_TRAIT(H, TRAIT_PA_WEAR, src)


// PRIVATE

/datum/job/enclave/soldier
	title = "Enclave Soldier"
	flag = F13USPRIVATE
	faction = "Enclave"
	total_positions = 4
	spawn_positions = 4
	description = "You are a member of a dying breed, true Americans, but you will do what you can to help revitalize the nation, and protect her from all enemies, foreign and domestic."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_type = EXP_TYPE_FALLOUT
	exp_requirements = 120

	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/enclave/soldier

/datum/outfit/job/enclave/soldier
	name =	"Enclave Soldier"
	jobtype =	/datum/job/enclave/soldier
	head =	/obj/item/clothing/head/helmet/f13/helmet/enclave/peacekeeper
	mask =	/obj/item/clothing/mask/gas/enclave
	neck =	/obj/item/storage/belt/holster/legholster
	uniform =	/obj/item/clothing/under/f13/enclave/peacekeeper
	suit =	/obj/item/clothing/suit/armor/f13/enclave/armorvest
	suit_store =  	/obj/item/gun/ballistic/automatic/assault_carbine

	backpack_contents = list(
		/obj/item/grenade/smokebomb = 1,
		/obj/item/gun/ballistic/automatic/pistol/sig = 1,
		/obj/item/ammo_box/magazine/m9mm = 1,
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/flashbang = 1,
		/obj/item/ammo_box/magazine/m556/rifle/extended = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		)


// SCIENTIST

/datum/job/enclave/scientist
	title = "Enclave Scientist"
	flag = F13USSCIENTIST
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	description = "You're responsible for the maintenance of the base, the knowledge you've accumulated over the years is the only thing keeping the remnants alive. You've dabbled in enough to be considered a Professor in proficiency, but they call you Doctor. Support your dwindling forces and listen to the Lieutenant."
	forbids = "The Enclave forbids you from leaving the base alone while it is still habitable."
	enforces = "You must maintain the secrecy of organization."
	supervisors = "the United States Government."
	selection_color = "#323232"
	exp_requirements = 600
	exp_type = EXP_TYPE_FALLOUT
	access = list(ACCESS_ENCLAVE)
	minimal_access = list(ACCESS_ENCLAVE)

	outfit = /datum/outfit/job/enclave/scientist

/datum/outfit/job/enclave/scientist
	name =	"Enclave Scientist"
	jobtype =	/datum/job/enclave/scientist
	head =	/obj/item/clothing/head/helmet/f13/envirosuit
	glasses =	/obj/item/clothing/glasses/meson
	mask =	/obj/item/clothing/mask/breath/medical
	gloves =	/obj/item/clothing/gloves/color/latex/nitrile
	uniform =	/obj/item/clothing/under/f13/enclave/science
	suit =	/obj/item/clothing/suit/armor/f13/environmentalsuit
	belt =	/obj/item/storage/belt/medical
	suit_store =	/obj/item/tank/internals/oxygen

	backpack_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/grenade/chem_grenade/cleaner = 1,
		/obj/item/gun/energy/laser/ultra_pistol = 1,
		/obj/item/stock_parts/cell/ammo/ec = 2,
		/obj/item/storage/bag/money/small/wastelander = 1,
		/obj/item/clothing/head/helmet/f13/helmet/enclave/science = 1,
		)

/datum/outfit/job/enclave/scientist/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_MEDICALEXPERT, src)
	ADD_TRAIT(H, TRAIT_CYBERNETICIST_EXPERT, src)
	ADD_TRAIT(H, TRAIT_SURGERY_HIGH, src)
	ADD_TRAIT(H, TRAIT_CHEMWHIZ, src)
	ADD_TRAIT(H, TRAIT_MASTER_GUNSMITH, src)
	ADD_TRAIT(H, TRAIT_UNETHICAL_PRACTITIONER, src) // Brainwashing


//Intelligence Officer
/datum/job/enclave/intel
	title = "Intel Officer"
	flag = F13USMEDIC
	faction = "Enclave"
	total_positions = 1
	spawn_positions = 1
	description = "Analyze and gather data, help the Science officers keep the compound running. Secondary duty: support the troops with paramedic duties, scouting. "
	supervisors = "The Officer first, Scientists second. The regular soldiers have no authority over you."

/datum/outfit/job/enclave/intel
	name =	"Intelligence Officer"
	jobtype =	/datum/job/enclave/intel
	head =	/obj/item/clothing/head/helmet/f13/helmet/enclave/intel
	mask =	/obj/item/clothing/mask/gas/enclave
	uniform =	/obj/item/clothing/under/f13/enclave/intel
	suit =	/obj/item/clothing/suit/armor/bulletproof
	suit_store =	/obj/item/gun/ballistic/revolver/needler
	backpack_contents = list(
		/obj/item/ammo_box/needle = 1,
		/obj/item/storage/firstaid/regular = 1,
		/obj/item/reagent_containers/spray/pepper = 1,
		)

/datum/outfit/job/enclave/intel/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
	ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
