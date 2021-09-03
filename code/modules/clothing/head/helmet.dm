// ------------------------------------ MERCENARY ----------------------------------------- //

/obj/item/clothing/head/helmet/steel
	name = "steel helmet"
	desc = "(V) A green steel helmet."
	icon = 'icons/fallout/clothing/helmets.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/helmet.dmi'
	icon_state = "merc"
	item_state = "merc"
	armor = list("tier" = 5, "energy" = 15, "bomb" = 25, "bio" = 60, "rad" = 20, "fire" = 75, "acid" = 10)

/obj/item/clothing/head/helmet/steel/cover
	desc = "(V) A green steel helmet with camouflage helmet cover."
	icon_state = "merc_cover"
	item_state = "merc_cover"

/obj/item/clothing/head/helmet/steel/heavy
	desc = "(VI) A green steel helmet with a thick faceplate, it can be pushed back on the head to make breathing and speaking easier."
	icon_state = "merc_heavy"
	item_state = "merc_heavy"
	armor = list("tier" = 6, "energy" = 15, "bomb" = 25, "bio" = 60, "rad" = 20, "fire" = 75, "acid" = 10)
	actions_types = list(/datum/action/item_action/toggle)

/obj/item/clothing/head/helmet/steel/heavy/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "merc_heavyup"
	item_state = "merc_heavyup"
	armor = list("tier" = 5, "energy" = 15, "bomb" = 25, "bio" = 60, "rad" = 20, "fire" = 75, "acid" = 10)




// ----------------------------------- RAIDER COALITIION ----------------------------------------- //

/obj/item/clothing/head/helmet/raider
	name = "fiend helmet"
	desc = "(III) A leather cap cobbled together with a brahmin skull, for that angry tribal look."
	icon_state = "fiend"
	item_state = "fiend"
	icon = 'icons/fallout/clothing/helmets.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothes/helmet.dmi'
	armor = list("tier" = 3, "energy" = 10, "bomb" = 20, "bio" = 20, "rad" = 0, "fire" = 30, "acid" = 30)
	flags_inv = HIDEEARS|HIDEHAIR

/obj/item/clothing/head/helmet/raider/Initialize()
	. = ..()
	AddComponent(/datum/component/armor_plate)

/obj/item/clothing/head/helmet/raider/warrior
	name = "warrior helmet"
	desc = "(III) It might have been a cooking pot once, now its a helmet, with a piece of cloth covering the neck from the sun."
	icon_state = "warrior"
	item_state = "warrior"


/obj/item/clothing/head/helmet/raider/cavebear
	name = "bear pelt"
	desc = "(IV) The pelt of a Yao Guai, made into a helmet by adding bone and metal."
	icon_state = "bearpelt"
	item_state = "bearpelt"
	visor_flags_inv = HIDEEARS
	armor = list("tier" = 4, "linemelee" = 0, "energy" = 20, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

/obj/item/clothing/head/helmet/raider/cavebear/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "bearpelt_alt"
	item_state = "bearpelt_alt"
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list("tier" = 4, "linemelee" = 0, "energy" = 25, "bomb" = 15, "bio" = 10, "rad" = 10, "fire" = 25, "acid" = 10)

/obj/item/clothing/head/helmet/raider/berserker
	name = "berserker helm"
	desc = "(IV) The head of a skull wolf mounted on a hardened leather helmet to avoid the ghosts of their enemies being able to see their face and give them the evil eye as they die."
	icon_state = "berserker"
	item_state = "berserker"
	armor = list("tier" = 4, "energy" = 15, "bomb" = 20, "bio" = 25, "rad" = 15, "fire" = 25, "acid" = 25)

/obj/item/clothing/head/helmet/raider/berserkeralt
	name = "berserker iron mask"
	desc = "(IV) A mask of iron to conceal the wearers face and protect them from the spirits of their enemies haunting them."
	icon_state = "berserker_alt"
	item_state = "berserker_alt"

/obj/item/clothing/head/helmet/raider/pilot
	name = "pilot hood"
	desc = "(IV) Leather hood with lead inserts, once issued to the Zeppelin Corps."
	icon_state = "pilot"
	item_state = "pilot"
	armor = list("tier" = 4, "energy" = 15, "bomb" = 20, "bio" = 25, "rad" = 70, "fire" = 25, "acid" = 25)

/obj/item/clothing/head/helmet/raider/smiley
	name = "smiley helmet"
	desc = "(IV) Tufts of orange polyester wool are glued to the sides of this rough metal helmet."
	icon_state = "smiley"
	item_state = "smiley"
	armor = list("tier" = 4, "energy" = 15, "bomb" = 20, "bio" = 25, "rad" = 15, "fire" = 25, "acid" = 25)

/obj/item/clothing/head/helmet/raider/wastehound
	name = "wastehound raider helmet"
	desc = "(IV) A sack hood made out of a suspicious leather with tufts of hair sticking out. This mask would make Leatherface proud."
	icon_state = "wastehound"
	item_state = "wastehound"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	armor = list("tier" = 3, "energy" = 15, "bomb" = 20, "bio" = 25, "rad" = 15, "fire" = 25, "acid" = 25)

/obj/item/clothing/head/helmet/raider/arclight
	name = "arclight raider helmet"
	desc = "(IV) Welding mask with rare polarizing glass thats somehow still in working order. A treasured item in the wasteland."
	icon_state = "arclight"
	item_state = "arclight"
	visor_flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flash_protect = 2
	tint = 0.5
	armor = list("tier" = 4, "energy" = 30, "bomb" = 40, "bio" = 50, "rad" = 30, "fire" = 50, "acid" = 50)

/obj/item/clothing/head/helmet/raider/arclight/attack_self(mob/user)
	weldingvisortoggle(user)
	icon_state = "arclight_up"
	item_state = "arclight_up"
	visor_flags_inv = HIDEEARS
	flash_protect = 0
	tint = 0
	dynamic_hair_suffix = ""
	armor = list("tier" = 3, "energy" = 15, "bomb" = 20, "bio" = 25, "rad" = 15, "fire" = 25, "acid" = 25)

/obj/item/clothing/head/helmet/raider/firefighter
	name = "firefighter raider helmet"
	desc = "(IV) A thick helmet, comes with a breathing mask."
	icon_state = "firefighter"
	item_state = "firefighter"
	flags_inv = HIDEMASK|HIDEEARS|HIDEFACE
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.01
	flags_cover = MASKCOVERSEYES | MASKCOVERSMOUTH

/obj/item/clothing/head/helmet/raider/psychotic
	name = "psycho-tic raider helmet"
	desc = "(III) A leather skullcap with tufts of hair sticking from each side."
	icon_state = "psychotic"
	item_state = "psychotic"
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEEARS|HIDEEYES|HIDEHAIR

/obj/item/clothing/head/helmet/raider/bishop
	name = "metal raider helmet"
	desc = "(V) A metal helmet, rusty and awful."
	icon_state = "raidermetal"
	item_state = "raidermetal"
	armor = list("tier" = 5, "energy" = 20, "bomb" = 25, "bio" = 30, "rad" = 30, "fire" = 20, "acid" = 0)

/obj/item/clothing/head/helmet/f13/raidermetal
	name = "metal raider helmet"
	desc = "(V) A metal helmet, rusty and awful."
	icon_state = "raidermetal"
	item_state = "raidermetal"
	can_toggle = TRUE

	flags_inv = HIDEMASK|HIDEEYES|HIDEFACE
	strip_delay = 80
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH

/obj/item/clothing/head/helmet/f13/raidercombathelmet
	name = "combat raider helmet"
	desc = "(V) A combat helmet modified with metal plating"
	icon_state = "raider_combat_helmet"
	item_state = "raider_combat_helmet"
	armor = list("tier" = 5, "energy" = 35, "bomb" = 70, "bio" = 70, "rad" = 70, "fire" = 65, "acid" = 30)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/helmet/raider/king
	name = "raider king hat"
	desc = "(IV) A kevlar skull cap under a fancy top hat."
	icon_state = "tophat"
	item_state = "tophat"
	armor = list("tier" = 4, "energy" = 20, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS



// ------------------------------------ ENCLAVE ----------------------------------------- //

/obj/item/clothing/head/helmet/f13/helmet/enclave/science
	name = "science beret"
	desc = "(I) Blue beret signifying the wearer is a Science Officer of the Enclave."
	icon_state = "hat_enclave_science"
	item_state = "hat_enclave_science"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = null
	dynamic_hair_suffix = ""
	armor = list("tier" = 1)

/obj/item/clothing/head/helmet/f13/helmet/enclave/intel
	name = "intel beret"
	desc = "(III) Dark beret issued to Intelligence Officers of the Enclave."
	icon_state = "hat_enclave_intel"
	item_state = "hat_enclave_intel"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = null
	armor = list("tier" = 3)

/obj/item/clothing/head/helmet/f13/helmet/enclave/peacekeeper
	name = "peacekeeper cap"
	desc = "(IV) Reinforced field cap issued to the soldiers of the Enclave."
	icon_state = "hat_enclave_peacekeeper"
	item_state = "hat_enclave_peacekeeper"
	flags_inv = HIDEEARS|HIDEHAIR
	strip_delay = 50
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	armor = list("tier" = 4)

/obj/item/clothing/head/helmet/f13/helmet/enclave/officer
	name = "enclave officer hat"
	desc = "(VII) Wheeled hat with a cap made of light-weight alloys beneath."
	icon_state = "hat_enclave_officer"
	item_state = "hat_enclave_officer"
	armor = list("tier" = 7, "energy" = 45, "bomb" = 60, "bio" = 60, "rad" = 15, "fire" = 60, "acid" = 30) // On par with BoS Knight




// ------------------------------------ LEGACY HELMETS ----------------------------------------- //

/obj/item/clothing/head/helmet/alt
	name = "bulletproof helmet"
	desc = "(IV*) A bulletproof combat helmet that excels in protecting the wearer against traditional projectile weaponry and explosives to a minor extent."
	icon_state = "helmetalt"
	item_state = "helmetalt"
	armor = list("tier" = 4, "linebullet" = 50, "energy" = 35, "bomb" = 55, "bio" = 0, "rad" = 0, "fire" = 55, "acid" = 55)
	can_flashlight = 1
	dog_fashion = null

/obj/item/clothing/head/helmet/old
	name = "degrading helmet"
	desc = "Standard issue security helmet. Due to degradation the helmet's visor obstructs the users ability to see long distances."
	tint = 2

/obj/item/clothing/head/helmet/riot
	name = "riot helmet"
	desc = "(III*) It's a helmet specifically designed to protect against close range attacks."
	icon_state = "riot"
	item_state = "helmet"
	toggle_message = "You pull the visor down on"
	alt_toggle_message = "You push the visor up on"
	can_toggle = 1
	armor = list("tier" = 3, "linemelee" = 55, "energy" = 5, "bomb" = 5, "bio" = 2, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS|HIDEFACE
	strip_delay = 80
	actions_types = list(/datum/action/item_action/toggle)
	visor_flags_inv = HIDEFACE
	toggle_cooldown = 0
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	visor_flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dog_fashion = null
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/attack_self(mob/user)
	if(can_toggle && !user.incapacitated())
		if(world.time > cooldown + toggle_cooldown)
			cooldown = world.time
			up = !up
			flags_1 ^= visor_flags
			flags_inv ^= visor_flags_inv
			flags_cover ^= visor_flags_cover
			icon_state = "[initial(icon_state)][up ? "up" : ""]"
			to_chat(user, "[up ? alt_toggle_message : toggle_message] \the [src]")

			user.update_inv_head()
			if(iscarbon(user))
				var/mob/living/carbon/C = user
				C.head_update(src, forced = 1)

			if(active_sound)
				while(up)
					playsound(src.loc, "[active_sound]", 100, 0, 4)
					sleep(15)

/obj/item/clothing/head/helmet/justice
	name = "helmet of justice"
	desc = "WEEEEOOO. WEEEEEOOO. WEEEEOOOO."
	icon_state = "justice"
	toggle_message = "You turn off the lights on"
	alt_toggle_message = "You turn on the lights on"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	can_toggle = 1
	toggle_cooldown = 20
	active_sound = 'sound/items/weeoo1.ogg'
	dog_fashion = null

/obj/item/clothing/head/helmet/justice/escape
	name = "alarm helmet"
	desc = "WEEEEOOO. WEEEEEOOO. STOP THAT MONKEY. WEEEOOOO."
	icon_state = "justice2"
	toggle_message = "You turn off the light on"
	alt_toggle_message = "You turn on the light on"

/obj/item/clothing/head/helmet/swat
	name = "\improper SWAT helmet"
	desc = "(V) An extremely robust, space-worthy helmet in a nefarious red and black stripe pattern."
	icon_state = "swatsyndie"
	item_state = "swatsyndie"
	armor = list("tier" = 5,"energy" = 30, "bomb" = 50, "bio" = 90, "rad" = 20, "fire" = 50, "acid" = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/swat/nanotrasen
	name = "\improper SWAT helmet"
	desc = "An extremely robust, space-worthy helmet with the Nanotrasen logo emblazoned on the top."
	icon_state = "swat"
	item_state = "swat"

/obj/item/clothing/head/helmet/thunderdome
	name = "\improper Thunderdome helmet"
	desc = "(IV) <i>'Let the battle commence!'</i>"
	flags_inv = HIDEEARS|HIDEHAIR
	icon_state = "thunderdome"
	item_state = "thunderdome"
	armor = list("tier" = 4,"energy" = 10, "bomb" = 25, "bio" = 10, "rad" = 0, "fire" = 50, "acid" = 50)
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_HELM_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = SPACE_HELM_MAX_TEMP_PROTECT
	strip_delay = 80
	dog_fashion = null

/obj/item/clothing/head/helmet/gladiator
	name = "gladiator helmet"
	desc = "(III*) Ave, Imperator, morituri te salutant."
	icon_state = "gladiator"
	item_state = "gladiator"
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEHAIR
	flags_cover = HEADCOVERSEYES
	dog_fashion = null
	armor = list("tier" = 3, "linemelee" = 20, "energy" = 10, "bomb" = 10, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)

/obj/item/clothing/head/helmet/redtaghelm
	name = "red laser tag helmet"
	desc = "(II) They have chosen their own end."
	icon_state = "redtaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "redtaghelm"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/bluetaghelm
	name = "blue laser tag helmet"
	desc = "(II) They'll need more men."
	icon_state = "bluetaghelm"
	flags_cover = HEADCOVERSEYES
	item_state = "bluetaghelm"
	armor = list("tier" = 2, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 50)
	// Offer about the same protection as a hardhat.
	dog_fashion = null

/obj/item/clothing/head/helmet/knight
	name = "medieval helmet"
	desc = "(III) A classic metal helmet worn by all ranks of knights and horsemen of the Old Era."
	icon_state = "knight_green"
	item_state = "knight_green"
	armor = list("tier" = 3, "energy" = 10, "bomb" = 20, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	strip_delay = 80
	dog_fashion = null
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/knight/Initialize(mapload)
	. = ..()
	var/datum/component = GetComponent(/datum/component/wearertargeting/earprotection)
	qdel(component)

/obj/item/clothing/head/helmet/knight/yellow
	name = "yellow medieval helmet"
	desc = "A classic metal helmet worn by all ranks of knights and horsemen of the Old Era.<br>This one is painted yellow."
	icon_state = "knight_yellow"
	item_state = "knight_yellow"

/obj/item/clothing/head/helmet/knight/templar
	name = "crusader helmet"
	desc = "Deus Vult."
	icon_state = "knight_templar"
	item_state = "knight_templar"

/obj/item/clothing/head/helmet/knight/greyscale
	name = "knight helmet"
	desc = "(III) A classic medieval helmet, if you hold it upside down you could see that it's actually a bucket."
	icon_state = "knight_greyscale"
	item_state = "knight_greyscale"
	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_COLOR | MATERIAL_AFFECT_STATISTICS //Can change color and add prefix

/obj/item/clothing/head/helmet/skull
	name = "skull helmet"
	desc = "(II) An intimidating tribal helmet, it doesn't look very comfortable."
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	flags_cover = HEADCOVERSEYES
	armor = list("tier" = 2, "energy" = 10, "bomb" = 10, "bio" = 5, "rad" = 20, "fire" = 40, "acid" = 20)
	icon_state = "skull"
	item_state = "skull"
	strip_delay = 100
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/infiltrator
	name = "insidious helmet"
	desc = "(V) An insidious armored combat helmet signed with Syndicate insignia. The visor is coated with a resistant paste guaranteed to withstand bright flashes perfectly."
	icon_state = "infiltrator"
	item_state = "infiltrator"
	armor = list("tier" = 5, "energy" = 40, "bomb" = 70, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	resistance_flags = FIRE_PROOF | ACID_PROOF
	flash_protect = 2
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDESNOUT
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	dynamic_hair_suffix = ""
	dynamic_fhair_suffix = ""
	strip_delay = 80
	mutantrace_variation = STYLE_MUZZLE

/obj/item/clothing/head/helmet/durathread
	name = "makeshift helmet"
	desc = "(III) A hardhat with strips of leather and durathread for additional blunt protection."
	icon_state = "durathread"
	item_state = "durathread"
	armor = list("tier" = 3,"energy" = 10, "bomb" = 30, "bio" = 15, "rad" = 20, "fire" = 100, "acid" = 50)

/obj/item/clothing/head/helmet/rus_ushanka
	name = "battle ushanka"
	desc = "(II) 100% bear."
	icon_state = "rus_ushanka"
	item_state = "rus_ushanka"
	clothing_flags = THICKMATERIAL
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = SPACE_SUIT_MIN_TEMP_PROTECT
	armor = list("tier" = 2,"energy" = 5, "bomb" = 5, "bio" = 50, "rad" = 20, "fire" = -10, "acid" = 0)

/obj/item/clothing/head/helmet/police
	name = "police officer's hat"
	desc = "(II) A police officer's Hat. This hat emphasizes that you are THE LAW."
	icon_state = "policehelm"
	dynamic_hair_suffix = ""
	armor = list("tier" = 2)
