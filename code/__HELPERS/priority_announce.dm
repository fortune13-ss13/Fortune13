
/proc/priority_announce(text, title = "", type , sender_override)
	if(!text)
		return

	var/announcement

	if(type == "Priority")
		announcement += "<h1 class='alert'>Radio Broadcast</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>Radio Broadcast</h2>"
	else if(type == "Radio Broadcast")
		announcement += "<h1 class='alert'>Radio Broadcast</h1>"
		GLOB.news_network.SubmitArticle(text, "Captain's Announcement", "Wasteland Announcements", null)

	else
		if(!sender_override)
			announcement += "<h1 class='alert'>Radio Station Broadcast</h1>"
		else
			announcement += "<h1 class='alert'>Radio Broadcast</h1>"
		if (title && length(title) > 0)
			announcement += "<br><h2 class='alert'>Radio Broadcast</h2>"

		if(!sender_override)
			if(title == "")
				GLOB.news_network.SubmitArticle(text, "Vault-Tec Update", "Wasteland Announcements", null)
			else
				GLOB.news_network.SubmitArticle(title + "<br><br>" + text, "Vault-Tec", "Wasteland Announcements", null)

	announcement += "<br><span class='alert'>[html_encode(text)]</span><br>"
	announcement += "<br>"


	for(var/mob/M in GLOB.player_list)
		if(!isnewplayer(M) && M.can_hear())
			to_chat(M, announcement)

/proc/print_command_report(text = "", title = null, announce=TRUE)
	if(!title)
		title = "Classified Central Command Report"

	if(announce)
		priority_announce("A report has been downloaded and printed out at all communications consoles.", "Incoming Classified Message", "commandreport")

	var/datum/comm_message/M  = new
	M.title = title
	M.content =  text

	SScommunications.send_message(M)

/proc/minor_announce(message, title = "Attention:", alert)
	if(!message)
		return

	for(var/mob/M in GLOB.player_list)
		if(!isnewplayer(M) && M.can_hear())
			to_chat(M, "<span class='big bold'><font color = red>[html_encode(title)]</font color><BR>[html_encode(message)]</span><BR>")
			if(M.client.prefs.toggles & SOUND_ANNOUNCEMENTS)
				if(alert)
					SEND_SOUND(M, sound('sound/misc/notice1.ogg'))
				else
					SEND_SOUND(M, sound('sound/misc/notice2.ogg'))
