/////////////
// ENCLAVE //
/////////////

/datum/job/enclave
	department_flag = ENCLAVE
	selection_color = "#aaaaf7"
	forbids = "Enclave crimes: Fraternizing with outsiders beyond what is absolutly necessary. Aiding Brotherhood members in any way no matter how small."
	enforces = "Enclave rules: Stay in uniform. Act mature and respectful. Obey orders and always remember you are representing the only true legitimate power in this land of savages. Wearing gasmasks outside the compound is encouraged but not required."
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
	l_pocket =	/obj/item/melee/onehanded/knife/bayonet

// SERGEANT

/datum/job/enclave/armor
    title = "Enclave Sergeant"
    flag = F13USSGT
    faction = "Enclave"
    total_positions = 2
    spawn_positions = 2
    description = "Entrusted with both the now rare advanced heavy weapons, alongside direct command of this post and the army personnel within it, your nation relies on you doing your job."
    supervisors = "the United States Government."
    selection_color = "#323232"
    exp_requirements = 300
    exp_type = EXP_TYPE_ENCLAVE
    access = list(ACCESS_ENCLAVE)
    minimal_access = list(ACCESS_ENCLAVE)

    outfit = /datum/outfit/job/enclave/armor

/datum/outfit/job/enclave/armor
    name = "Enclave Sergeant"
    jobtype = /datum/job/enclave/armor
    head =    /obj/item/clothing/head/helmet/f13/power_armor/x02helmet
    mask =    /obj/item/clothing/mask/gas/enclave
    neck =    /obj/item/storage/belt/holster/legholster/enclavesig
    uniform =    /obj/item/clothing/under/f13/enclave
    suit =    /obj/item/clothing/suit/armor/f13/power_armor/x02
    accessory =    /obj/item/clothing/accessory/enclave/sgt
    belt =    /obj/item/storage/belt/military/assault/enclave
    gloves =    /obj/item/gun/ballistic/revolver/ballisticfist
    suit_store = /obj/item/gun/energy/laser/plasma
    backpack_contents = list(
        /obj/item/ammo_box/shotgun/buck = 1,
        /obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
        /obj/item/stock_parts/cell/ammo/mfc = 3,
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
    supervisors = "The Corporals, alongside the Sergeants."
    selection_color = "#323232"
    exp_type = EXP_TYPE_FALLOUT
    exp_requirements = 120

    access = list(ACCESS_ENCLAVE)
    minimal_access = list(ACCESS_ENCLAVE)

    outfit = /datum/outfit/job/enclave/soldier

/datum/outfit/job/enclave/soldier
    name =    "Enclave Private"
    jobtype =    /datum/job/enclave/soldier
    head =    /obj/item/clothing/head/helmet/f13/helmet/enclave/peacekeeper
    mask =    /obj/item/clothing/mask/gas/enclave
    neck =    /obj/item/storage/belt/holster/legholster/enclavesig
    uniform =    /obj/item/clothing/under/f13/enclave
    suit =    /obj/item/clothing/suit/armor/f13/enclave
    accessory =    /obj/item/clothing/accessory/enclave/soldier
    gloves =    /obj/item/clothing/gloves/rifleman
    suit_store =     /obj/item/gun/ballistic/automatic/assault_rifle

    backpack_contents = list(
        /obj/item/grenade/smokebomb = 1,
        /obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
        /obj/item/gun/energy/laser/pistol,
        /obj/item/stock_parts/cell/ammo/ec = 1,
        /obj/item/ammo_box/magazine/m556/rifle = 2,
        /obj/item/storage/bag/money/small/wastelander = 1,
        )

// CORPORAL

/datum/job/enclave/corporal
    title = "Enclave Corporal"
    flag = F13USCORPORAL
    faction = "Enclave"
    total_positions = 3
    spawn_positions = 3
    description = "You are a member of a dying breed, true Americans, but you will do what you can to help revitalize the nation, and protect her from all enemies, foreign and domestic."
    supervisors = "You report to the Sergeants directly."
    selection_color = "#323232"
    exp_type = EXP_TYPE_ENCLAVE
    exp_requirements = 200

    access = list(ACCESS_ENCLAVE)
    minimal_access = list(ACCESS_ENCLAVE)

    outfit = /datum/outfit/job/enclave/corporal

/datum/outfit/job/enclave/corporal
    name =    "Enclave Corporal"
    jobtype =    /datum/job/enclave/corporal
    head =    /obj/item/clothing/head/helmet/f13/combat
    mask =    /obj/item/clothing/mask/gas/enclave
    neck =    /obj/item/storage/belt/holster/legholster/enclavesig
    uniform =    /obj/item/clothing/under/f13/enclave
    suit =    /obj/item/clothing/suit/armored/medium/combat
    accessory = /obj/item/clothing/accessory/ncr/CPL
    gloves =    /obj/item/clothing/gloves/rifleman
    suit_store =      /obj/item/gun/ballistic/automatic/assault_carbine

    backpack_contents = list(
        /obj/item/grenade/smokebomb = 1,
        /obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
        /obj/item/gun/energy/laser/pistol,
        /obj/item/stock_parts/cell/ammo/ec = 1,
        /obj/item/ammo_box/magazine/m556/rifle/assault = 2,
        /obj/item/storage/bag/money/small/wastelander = 1,
        /obj/item/clothing/head/helmet/f13/helmet/enclave/peacekeeper,
        )

/datum/outfit/job/enclave/armor/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
    ..()
    if(visualsOnly)
        return
    ADD_TRAIT(H, TRAIT_HARD_YARDS, src)

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


//INTELLIGENCE OFFICER

/datum/job/enclave/intel
    title = "Intelligence Officer"
    flag = F13USMEDIC
    faction = "Enclave"
    total_positions = 1
    spawn_positions = 1
    description = "Analyze and gather data, help the Scientists keep the compound running. Support active troops with paramedic duties aswell as scouting if called upon. "
    supervisors = "First the Sergeants, and second the Scientists"
    selection_color = "#323232"
    exp_type = EXP_TYPE_ENCLAVE
    exp_requirements = 200

    access = list(ACCESS_ENCLAVE)
    minimal_access = list(ACCESS_ENCLAVE)

    outfit = /datum/outfit/job/enclave/intel

/datum/outfit/job/enclave/intel
    name =    "Intelligence Officer"
    jobtype =    /datum/job/enclave/intel
    head =    /obj/item/clothing/head/helmet/f13/helmet/enclave/intel
    mask =    /obj/item/clothing/mask/gas/enclave
    glasses = /obj/item/clothing/glasses/night/polarizing
    uniform =    /obj/item/clothing/under/f13/enclave/intel
    suit =    /obj/item/clothing/suit/armored/medium/combat
    suit_store =    /obj/item/gun/ballistic/revolver/needler
    accessory =   /obj/item/clothing/accessory/ncr/SPC
    gloves =    /obj/item/clothing/gloves/rifleman
    backpack_contents = list(
        /obj/item/ammo_box/needle = 2,
        /obj/item/storage/firstaid/regular = 1,
        /obj/item/reagent_containers/hypospray/medipen/stimpak = 2,
		/obj/item/clothing/head/helmet/f13/combat,
        )

/datum/outfit/job/enclave/intel/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
    ..()
    if(visualsOnly)
        return
    ADD_TRAIT(H, TRAIT_SURGERY_LOW, src)
    ADD_TRAIT(H, TRAIT_HARD_YARDS, src)
