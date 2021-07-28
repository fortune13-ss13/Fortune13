/**********************************
*******Interactions code by HONKERTRON feat TestUnit********
**Contains a lot ammount of ERP and MEHANOYEBLYA**
**CREDIT TO ATMTA STATION FOR MOST OF THIS CODE, I ONLY MADE IT WORK IN /vg/ - Matt
** Rewritten 30/08/16 by Zuhayr, sry if I removed anything important.
**I removed ERP and replaced it with handholding. Nothing of worth was lost. - Vic
**Fuck you, Vic. ERP is back. - TT
**Edited again by Dusty Dave for Fortune13. Assuming it even gets merged.
***********************************/

var/list/interactions

/proc/make_interactions(var/interaction)
	if(!interactions)
		interactions = list()
		for(var/itype in typesof(/datum/interaction)-/datum/interaction)
			var/datum/interaction/I = new itype()
			interactions[I.command] = I

/datum/interaction
	var/command = "interact"
	var/description = "Interact with them."
	var/simple_message
	var/simple_style = "notice"
	var/write_log_user
	var/write_log_target

	var/interaction_sound
	var/interaction_sound_age_pitch

	var/max_distance = 1
	var/require_user_hands
	var/require_target_hands
	var/needs_physical_contact

/datum/interaction/proc/evaluate_user(var/mob/user, var/silent=1)
	if(require_user_hands && !user.has_hands())
		if(!silent) user << "<span class = 'warning'>You don't have hands.</span>"
		return 0
	return 1

/datum/interaction/proc/evaluate_target(var/mob/user, var/mob/target, var/silent=1)
	if(require_target_hands && !target.has_hands())
		if(!silent) user << "<span class = 'warning'>They don't have hands.</span>"
		return 0
	return 1

/datum/interaction/proc/get_action_link_for(var/mob/user, var/mob/target)
	return "<a href='?src=\ref[src];action=1;action_user=\ref[user];action_target=\ref[target]'>[description]</a><br>"

/datum/interaction/Topic(href, href_list)
	if(..())
		return 1
	if(href_list["action"])
		do_action(locate(href_list["action_user"]), locate(href_list["action_target"]))
		return 1
	return 0

/datum/interaction/proc/do_action(var/mob/user, var/mob/target)
	if(get_dist(user, target) > max_distance)
		user << "<span class='warning'>They are too far away.</span>"
		return
	if(needs_physical_contact && !(user.Adjacent(target) && target.Adjacent(user)))
		user << "<span class='warning'>You cannot get to them.</span>"
		return
	if(!evaluate_user(user, silent=0))
		return
	if(!evaluate_target(user, target, silent=0))
		return

	display_interaction(user, target)

	post_interaction(user, target)

/datum/interaction/proc/display_interaction(var/mob/user, var/mob/target)
	if(simple_message)
		var/use_message = replacetext(simple_message, "USER", "\the [user]")
		use_message = replacetext(use_message, "TARGET", "\the [target]")
		user.visible_message("<span class='[simple_style]'>[capitalize(use_message)]</span>")

/datum/interaction/proc/post_interaction(var/mob/user, var/mob/target)
	if(interaction_sound)
		if(interaction_sound_age_pitch)
			playsound(get_turf(user), interaction_sound, 50, 1, -1)//, pitch = user.get_age_pitch())
		else
			playsound(get_turf(user), interaction_sound, 50, 1, -1)
	return

/mob/proc/has_hands()
	return 0

/mob/living/carbon/human/has_hands()
	return 1//(can_use_hand("l_hand") || can_use_hand("r_hand"))

