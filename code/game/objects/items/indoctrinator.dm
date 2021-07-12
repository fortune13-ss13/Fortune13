/obj/item/indoctrinator
	name = "indoctrinator"
	desc = "What!? Who gave you that? It is NOT POSSIBLE!!!"
	icon = 'icons/obj/device.dmi'
	icon_state = "indoctrinator"
	item_state = "electronic"
	lefthand_file = 'icons/mob/inhands/misc/devices_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/devices_righthand.dmi'
	force = 0
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 0
	throw_speed = 3
	throw_range = 7
	item_flags = NOBLUDGEON
	var/given_faction = "Coders" // What faction it gives and checks for.
	var/item_charges = 999 // How many uses left
	var/indoc_message = "You are now part of coders. You will code funny PRs." // The message that will show up and added to the notes on use.
	var/use_time = 4 SECONDS // How long will be the do_after.

/obj/item/indoctrinator/examine(mob/user)
	. = ..()
	. += "It has [item_charges] uses left."

/obj/item/indoctrinator/attack(mob/living/carbon/human/M, mob/living/carbon/human/user)
	if(user.a_intent == INTENT_HARM) // On harm intent do nothing useful.
		..()
		return
	if(M == user)
		to_chat(user, "<span class='warning'>You can't use [src] on yourself!</span>")
		return
	if(item_charges <= 0) // No charges left.
		to_chat(user, "<span class='warning'>[src] has no uses left!</span>")
		return
	if(given_faction in M.faction) // Target already has the faction.
		to_chat(user, "<span class='notice'>[M] is already a part of [given_faction].</span>")
		return
	if(M.stat > SOFT_CRIT)
		to_chat(user, "<span class='warning'>[M] should be healthy to receive treatment!</span>")
		return
	if(!M.mind)
		to_chat(user, "<span class='warning'>[M] has no mind!</span>")
		return
	if(!M.key)
		to_chat(user, "<span class='warning'>[M] isn't capable of receiving treatment.</span>")
		return
	if(!M.getorgan(/obj/item/organ/brain))
		to_chat(user, "<span class='warning'>[M] is lacking a brain to operate on!</span>")
		return
	to_chat(user, "<span class='notice'>You begin to place [src] near the head of [M].</span>")
	if(!do_after(user, use_time, target = M))
		return
	to_chat(user, "<span class='notice'>[M]'s brain begins to react to [src].</span>")
	if(alert(M, "Do you wish to become a part of [given_faction]?", "Yes", "No") == "No" || "Cancel")
		to_chat(user, "<span class='warning'>The brain of the subject resists procedure!</span>")
		return
	M.faction |= given_faction // Give the faction.
	to_chat(M, "<big><span class='warning'><b>[indoc_message]</b></span></big>")
	M.visible_message("<span class='notice'>[M] shakes for a moment, then [M.p_their()] eyes focus on surroundings.</span>")
	message_admins("<span class='notice'>[key_name(M)] joined [given_faction] via the use of [src].</span>")
	item_charges -= 1 // Charge be gone.
	M.Jitter(10)

/obj/item/indoctrinator/enclave
	desc = "A high-tech device used by the scientists of the Enclave. Apply it on a willing target to begin the indoctrination process."
	given_faction = "Enclave" // What faction it gives and checks for.
	item_charges = 12 // How many uses left
	indoc_message = "You are a loyal soldier of the Enclave! You must obey every order issued to you by the Enclave officers and scientists. You must protect the Enclave and its secrecy. You can't abandon your duties."
