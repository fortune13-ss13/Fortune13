/datum/antagonist/ncragent
	name = "NCR SAD Agent"
	antagpanel_category = "NCR SAD Agent"
	job_rank = ROLE_NCR
	var/special_role = ROLE_NCRAGENT
	var/datum/team/ncragent_team/team
	antag_moodlet = /datum/mood_event/focused

/datum/antagonist/ncragent/create_team(datum/team/ncragent_team/new_team)
	if(!new_team)
		return
	if(!istype(new_team))
		stack_trace("Wrong team type passed to [type] initialization.")
	team = new_team

/datum/antagonist/ncragent/get_team()
	return team

/datum/antagonist/ncragent/on_gain()
	SSticker.mode.brothers += owner
	objectives += team.objectives
	owner.special_role = special_role
	finalize_ncragent()
	return ..()

/datum/antagonist/ncragent/on_removal()
	SSticker.mode.brothers -= owner
	if(owner.current)
		to_chat(owner.current,"<span class='userdanger'>You are no longer the [special_role]!</span>")
	owner.special_role = null
	return ..()

/datum/antagonist/ncragent/greet()
	var/ncragent_text = ""
	var/list/ncragents = team.members - owner
	for(var/i = 1 to ncragents.len)
		var/datum/mind/M = ncragents[i]
		ncragent_text += M.name
		if(i == ncragents.len - 1)
			ncragent_text += " and "
		else if(i != ncragents.len)
			ncragent_text += ", "
	to_chat(owner.current, "<B><font size=3 color=red>You are the [owner.special_role] of [ncragent_text].</font></B>")
	to_chat(owner.current, "The Special Activities Divsion only accepts the most skilled, and most unscrupulous of volunteers. Whether you are a raider given the choice between death and service, a mercenary in too deep, or a genuine patriot, you and [team.member_name] are both fully willing to go beyond the call of duty for the NCR. Good luck.")
	owner.announce_objectives()

/datum/antagonist/ncragent/proc/finalize_ncragent()
	SSticker.mode.update_brother_icons_added(owner)

/datum/team/ncragent_team
	name = "Special Activities Division"
	member_name = "fellow SAD agent"

/datum/team/ncragent_team/is_solo()
	return FALSE

/datum/team/ncragent_team/proc/update_name()
	var/list/last_names = list()
	for(var/datum/mind/M in members)
		var/list/split_name = splittext(M.name," ")
		last_names += split_name[split_name.len]

	name = last_names.Join(" & ")

/datum/team/ncragent_team/roundend_report()
	var/list/parts = list()

	parts += "<span class='header'>The Agents of the NCR Special Activities Divisionn were:</span>"
	for(var/datum/mind/M in members)
		parts += printplayer(M)
	var/win = TRUE
	var/objective_count = 1
	for(var/datum/objective/objective in objectives)
		if(objective.completable)
			var/completion = objective.check_completion()
			if(completion >= 1)
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] <span class='greentext'><B>Success!</B></span>"
			else if(completion <= 0)
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] <span class='redtext'>Fail.</span>"
				win = FALSE
			else
				parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text] <span class='yellowtext'>[completion*100]%</span>"
		else
			parts += "<B>Objective #[objective_count]</B>: [objective.explanation_text]"
		objective_count++
	if(win)
		parts += "<span class='greentext'>The SAD agents were successful!</span>"
	else
		parts += "<span class='redtext'>The SAD agents have failed!</span>"

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/datum/team/ncragent_team/proc/add_objective(datum/objective/O, needs_target = FALSE)
	O.team = src
	if(needs_target)
		O.find_target()
	O.update_explanation_text()
	objectives += O

/datum/team/ncragent_team/proc/forge_ncragent_objectives()
	objectives = list()
	for(var/i = 1 to max(1, CONFIG_GET(number/brother_objectives_amount) + (members.len > 2)))
		forge_single_objective()
	if(!locate(/datum/objective/escape) in objectives)
		add_objective(new/datum/objective/escape)

/datum/team/ncragent_team/proc/forge_single_objective()
	if(prob(50))
		if(prob(30))
			add_objective(new/datum/objective/maroon, TRUE)
		else
			var/datum/objective/ncragent/assassinate/kill_objective = new
			kill_objective.find_target_by_role(role = ROLE_NCR, role_type = 0, invert = 1)
			objectives += kill_objective
	else
		add_objective(new/datum/objective/steal, TRUE)

/datum/team/ncragent_team/antag_listing_name()
	return "[name] NCR SAD agent"
