/obj/item/clothing/head
	name = BODY_ZONE_HEAD
	icon = 'icons/obj/clothing/hats.dmi'
	icon_state = "top_hat"
	item_state = "that"
	body_parts_covered = HEAD
	slot_flags = ITEM_SLOT_HEAD
	var/blockTracking = 0 //For AI tracking
	var/can_toggle = null
	dynamic_hair_suffix = "+generic"
	var/datum/beepsky_fashion/beepsky_fashion //the associated datum for applying this to a secbot
	var/list/speechspan = null
	armor = list("tier" = 1)
	//var/tinkered = 0

/obj/item/clothing/head/Initialize()
	. = ..()
	if(ishuman(loc) && dynamic_hair_suffix)
		var/mob/living/carbon/human/H = loc
		H.update_hair()

/obj/item/clothing/head/get_head_speechspans(mob/living/carbon/user)
	if(speechspan)
		return speechspan
	else
		return



///Special throw_impact for hats to frisbee hats at people to place them on their heads.
/obj/item/clothing/head/throw_impact(atom/hit_atom, datum/thrownthing/thrownthing)
	. = ..()
	///if the thrown object's target zone isn't the head
	if(thrownthing.target_zone != BODY_ZONE_HEAD)
		return
	///ignore any hats with downsides when worn
	if(clothing_flags & IGNORE_HAT_TOSS)
		return
	///if the hat happens to be capable of holding contents and has something in it. mostly to prevent super cheesy stuff like stuffing a mini-bomb in a hat and throwing it
	if(LAZYLEN(contents))
		return
	if(iscarbon(hit_atom))
		var/mob/living/carbon/H = hit_atom
		if(istype(H.head, /obj/item))
			var/obj/item/WH = H.head
			H.visible_message("<span class='warning'>[src] bounces off [H]'s [WH.name]!", "<span class='warning'>[src] bounces off your [WH.name], falling to the floor.</span>")
			return
		if(H.equip_to_slot_if_possible(src, SLOT_HEAD, FALSE, TRUE))
			H.visible_message("<span class='notice'>[src] lands neatly on [H]'s head!", "<span class='notice'>[src] lands perfectly onto your head!</span>")
		return
	if(iscyborg(hit_atom))
		var/mob/living/silicon/robot/R = hit_atom
		///hats in the borg's blacklist bounce off
		if(!is_type_in_typecache(src, R.equippable_hats) || R.hat_offset == INFINITY)
			R.visible_message("<span class='warning'>[src] bounces off [R]!", "<span class='warning'>[src] bounces off you, falling to the floor.</span>")
			return
		else
			R.visible_message("<span class='notice'>[src] lands neatly on top of [R].", "<span class='notice'>[src] lands perfectly on top of you.</span>")
			R.place_on_head(src) //hats aren't designed to snugly fit borg heads or w/e so they'll always manage to knock eachother off



/obj/item/clothing/head/worn_overlays(isinhands = FALSE, icon_file, used_state, style_flags = NONE)
	. = ..()
	if(!isinhands)
		if(damaged_clothes)
			. += mutable_appearance('icons/effects/item_damage.dmi', "damagedhelmet")
		if(blood_DNA)
			. += mutable_appearance('icons/effects/blood.dmi', "helmetblood", color = blood_DNA_to_color())

/obj/item/clothing/head/update_clothes_damaged_state()
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_head()

/obj/item/clothing/head/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == SLOT_HEAD && speechspan)
		var/mob/living/carbon/human/H = user
		H.speech_span = speechspan

/obj/item/clothing/head/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(SLOT_HEAD) == src && speechspan)
		H.speech_span = null


// HELMET TEMPLATE

/obj/item/clothing/head/helmet
	name = "helmet"
	desc = "Standard Security gear. Protects the head from impacts."
	icon_state = "helmet"
	item_state = "helmet"
	armor = list("tier" = 3, "energy" = 10, "bomb" = 25, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 50)
	flags_inv = HIDEEARS
	cold_protection = HEAD
	min_cold_protection_temperature = HELMET_MIN_TEMP_PROTECT
	heat_protection = HEAD
	max_heat_protection_temperature = HELMET_MAX_TEMP_PROTECT
	strip_delay = 60
	resistance_flags = NONE
	flags_cover = HEADCOVERSEYES
	flags_inv = HIDEHAIR
	var/list/protected_zones = list(BODY_ZONE_HEAD)
	var/durability_threshold = 0

	dog_fashion = /datum/dog_fashion/head/helmet

	var/can_flashlight = FALSE //if a flashlight can be mounted. if it has a flashlight and this is false, it is permanently attached.
	var/obj/item/flashlight/seclite/attached_light
	var/datum/action/item_action/toggle_helmet_flashlight/alight


/obj/item/clothing/head/helmet/Initialize()
	. = ..()
	if(attached_light)
		alight = new(src)
	var/round_armor = round((armor.linemelee + armor.linebullet + armor.linelaser) / 3)
	if((durability_threshold <= 0) && round_armor > 30) // Weak armor, meh.
		var/tier_ar = round(round_armor / 10) // Tier 7 would be 200/100 = 20, Tier 11 = 40
		durability_threshold = tier_ar


/obj/item/clothing/head/helmet/Destroy()
	var/obj/item/flashlight/seclite/old_light = set_attached_light(null)
	if(old_light)
		qdel(old_light)
	return ..()


/obj/item/clothing/head/helmet/examine(mob/user)
	. = ..()
	if(attached_light)
		. += "It has \a [attached_light] [can_flashlight ? "" : "permanently "]mounted on it."
		if(can_flashlight)
			. += "<span class='info'>[attached_light] looks like it can be <b>unscrewed</b> from [src].</span>"
	else if(can_flashlight)
		. += "It has a mounting point for a <b>seclite</b>."
	. += "The helmet is at [armor_durability] durability and is providing [armor.linebullet] bullet, [armor.linelaser] energy and [armor.linemelee] melee resistance."
	if(durability_threshold > 0)
		. += "Additionally, any attack below [durability_threshold] force will not damage its durability."


/obj/item/clothing/head/helmet/handle_atom_del(atom/A)
	if(A == attached_light)
		set_attached_light(null)
		update_helmlight()
		update_icon()
		QDEL_NULL(alight)
		qdel(A)
	return ..()


///Called when attached_light value changes.
/obj/item/clothing/head/helmet/proc/set_attached_light(obj/item/flashlight/seclite/new_attached_light)
	if(attached_light == new_attached_light)
		return
	. = attached_light
	attached_light = new_attached_light
	if(attached_light)
		attached_light.set_light_flags(attached_light.light_flags | LIGHT_ATTACHED)
		if(attached_light.loc != src)
			attached_light.forceMove(src)
	else if(.)
		var/obj/item/flashlight/seclite/old_attached_light = .
		old_attached_light.set_light_flags(old_attached_light.light_flags & ~LIGHT_ATTACHED)
		if(old_attached_light.loc == src)
			old_attached_light.forceMove(get_turf(src))


/obj/item/clothing/head/helmet/run_block(mob/living/owner, atom/object, damage, attack_text, attack_type, armour_penetration, mob/attacker, def_zone, final_block_chance, list/block_return)
	var/AP_mod = armour_penetration * (damage * 1.5) // So, 100% AP bullet with 20 damage will be considered as 50 damage.
	if((damage + AP_mod) < durability_threshold)
		return ..()
	if(def_zone in protected_zones)
		damage_armor()
	. = ..()

/obj/item/clothing/head/helmet/proc/use_kit(obj/item/I, mob/user)
	var/obj/item/repair_kit/kit = I
	while(armor_durability<100)
		if(do_after(user, 10))
			to_chat(user,"You fix some of the damage on the armor, it is now at [armor_durability+1] durability.")
			if(kit.uses_left>1)
				kit.uses_left -= 1
				fix_armor()
			else
				fix_armor()
				qdel(kit)
				break

/obj/item/clothing/head/helmet/proc/damage_armor()
	if(armor.linebullet>0 && armor.linelaser>0 && armor.linemelee>0 && armor_durability>0)
		armor_durability -= 1
		armor = armor.modifyRating(linemelee = -1, linebullet = -1, linelaser = -1)

/obj/item/clothing/head/helmet/proc/fix_armor()
	if(armor_durability<100)
		armor = armor.modifyRating(linemelee = 1, linebullet = 1, linelaser = 1)
		armor_durability += 1

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/wearertargeting/earprotection, list(SLOT_HEAD))

/obj/item/clothing/head/helmet/sec
	can_flashlight = TRUE

/obj/item/clothing/head/helmet/sec/attackby(obj/item/I, mob/user, params)
	if(issignaler(I))
		var/obj/item/assembly/signaler/S = I
		if(attached_light) //Has a flashlight. Player must remove it, else it will be lost forever.
			to_chat(user, "<span class='warning'>The mounted flashlight is in the way, remove it first!</span>")
			return

		if(S.secured)
			qdel(S)
			var/obj/item/bot_assembly/secbot/A = new
			user.put_in_hands(A)
			to_chat(user, "<span class='notice'>You add the signaler to the helmet.</span>")
			qdel(src)
			return
	return ..()


//LightToggle

/obj/item/clothing/head/helmet/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/update_icon_updates_onmob)

/obj/item/clothing/head/helmet/update_icon_state()
	var/state = "[initial(icon_state)]"
	if(attached_light)
		if(attached_light.on)
			state += "-flight-on" //"helmet-flight-on" // "helmet-cam-flight-on"
		else
			state += "-flight" //etc.

	icon_state = state
	return ..()

/obj/item/clothing/head/helmet/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/toggle_helmet_flashlight))
		toggle_helmlight()
	else
		..()

/obj/item/clothing/head/helmet/attackby(obj/item/I, mob/user, params)
	if(istype(I, repair_kit))
		use_kit(I, user)
		return

	if(istype(I, /obj/item/flashlight/seclite))
		if(can_flashlight && !attached_light)
			var/obj/item/flashlight/seclite/S = I
			if(!user.transferItemToLoc(S, src))
				return
			to_chat(user, "<span class='notice'>You click [S] into place on [src].</span>")
			set_attached_light(S)
			update_helmlight()
			update_icon()
			alight = new(src)
			if(loc == user)
				alight.Grant(user)
		return
	return ..()


/obj/item/clothing/head/helmet/screwdriver_act(mob/living/user, obj/item/I)
	. = ..()
	if(can_flashlight && attached_light) //if it has a light but can_flashlight is false, the light is permanently attached.
		I.play_tool_sound(src)
		to_chat(user, "<span class='notice'>You unscrew [attached_light] from [src].</span>")
		attached_light.forceMove(drop_location())
		if(Adjacent(user) && !issilicon(user))
			user.put_in_hands(attached_light)

		var/obj/item/flashlight/removed_light = set_attached_light(null)
		update_helmlight()
		removed_light.update_brightness(user)
		update_icon()
		user.update_inv_head()
		QDEL_NULL(alight)
		return TRUE


/obj/item/clothing/head/helmet/proc/toggle_helmlight()
	set name = "Toggle Helmetlight"
	set category = "Object"
	set desc = "Click to toggle your helmet's attached flashlight."

	if(!attached_light)
		return

	var/mob/user = usr
	if(user.incapacitated())
		return
	attached_light.on = !attached_light.on
	attached_light.update_brightness()
	to_chat(user, "<span class='notice'>You toggle the helmet light [attached_light.on ? "on":"off"].</span>")

	playsound(user, 'sound/weapons/empty.ogg', 100, TRUE)
	update_helmlight()


/obj/item/clothing/head/helmet/proc/update_helmlight()
	if(attached_light)
		update_icon()

	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon()


/*
//Hat accessories

/obj/item/clothing/head/attackby(obj/item/I, mob/user, params)
	if(!attach_accessory(I, user))
		return ..()

/obj/item/clothing/head/equipped(mob/user, slot)
	..()

	if(attached_accessory && slot != SLOT_HANDS && ishuman(user))
		var/mob/living/carbon/human/H = user
		attached_accessory.on_head_equip(src, user)
		H.update_inv_head()

/obj/item/clothing/head/dropped(mob/user)
	if(attached_accessory)
		attached_accessory.on_head_dropped(src, user)
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			H.update_inv_head()

	..()

/obj/item/clothing/head/proc/attach_accessory(obj/item/I, mob/user, notifyAttach = 1)
	. = FALSE
	if(istype(I, /obj/item/clothing/armoraccessory))
		var/obj/item/clothing/armoraccessory/A = I
		if(attached_accessory)
			if(user)
				to_chat(user, "<span class='warning'>[src] already has an accessory.</span>")
			return
		if(dummy_thick)
			if(user)
				to_chat(user, "<span class='warning'>[src] is too bulky and cannot have accessories attached to it!</span>")
			return

		else
			if(user && !user.temporarilyRemoveItemFromInventory(I))
				return
			if(!A.attach(src, user))
				return

			if(user && notifyAttach)
				to_chat(user, "<span class='notice'>You attach [I] to [src].</span>")

			if((flags_inv & HIDEACCESSORY) || (A.flags_inv & HIDEACCESSORY))
				return TRUE

			accessory_overlay = mutable_appearance('icons/mob/clothing/accessories.dmi', attached_accessory.icon_state)
			accessory_overlay.alpha = attached_accessory.alpha
			accessory_overlay.color = attached_accessory.color

			if(ishuman(loc))
				var/mob/living/carbon/human/H = loc
				H.update_inv_w_uniform()
				H.update_inv_head()

			return TRUE

/obj/item/clothing/head/proc/remove_accessory(mob/user)
	if(!isliving(user))
		return
	if(!can_use(user))
		return

	if(attached_accessory)
		var/obj/item/clothing/armoraccessory/A = attached_accessory
		attached_accessory.detach(src, user)
		if(user.put_in_hands(A))
			to_chat(user, "<span class='notice'>You detach [A] from [src].</span>")
		else
			to_chat(user, "<span class='notice'>You detach [A] from [src] and it falls on the floor.</span>")

		if(ishuman(loc))
			var/mob/living/carbon/human/H = loc
			H.update_inv_w_uniform()
			H.update_inv_head()

/obj/item/clothing/head/examine(mob/user)
	. = ..()
	if(attached_accessory)
		. += "\A [attached_accessory] is attached to it."


/obj/item/clothing/head/AltClick(mob/user)
	. = ..()
	if(attached_accessory)
		remove_accessory(user)
*/
