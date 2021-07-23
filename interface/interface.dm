//Please use mob or src (not usr) in these procs. This way they can be called in the same fashion as procs.
/client/verb/tgwiki(query as text)
	set name = "tgwiki"
	set desc = "Type what you want to know about.  This will open the wiki in your web browser. Type nothing to go to the main page."
	set hidden = 1
	var/wikiurltg = CONFIG_GET(string/wikiurltg)
	if(wikiurltg)
		if(query)
			var/output = wikiurltg + "?search=" + query
			src << link(output)
			output = wikiurltg + "/index.php?title=Special%3ASearch&profile=default&search=" + query
			src << link(output)
		else if (query != null)
			src << link(wikiurltg)
	else
		to_chat(src, "<span class='danger'>The wiki URL is not set in the server configuration.</span>")
	return

/client/verb/wiki()
	set name = "wiki"
	set desc = "Opens the Wiki in your browser."
	set hidden = 1
	var/wikiurl = CONFIG_GET(string/wikiurl)
	if(wikiurl)
		if(alert("This will open the Wiki in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(wikiurl)
	else
		to_chat(src, "<span class='danger'>The Wiki URL is not set in the server configuration.</span>")
	return

/client/verb/discord()
	set name = "discord"
	set desc = "Visit the Discord."
	set hidden = 1
	var/discordurl = CONFIG_GET(string/discordurl)
	if(discordurl)
		if(alert("This will open the Discord in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(discordurl)
	else
		to_chat(src, "<span class='danger'>The discord URL is not set in the server configuration.</span>")
	return

/client/verb/forum()
	set name = "forum"
	set desc = "Visit the forum."
	set hidden = 1
	var/forumurl = CONFIG_GET(string/forumurl)
	if(forumurl)
		if(alert("This will open the forum in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(forumurl)
	else
		to_chat(src, "<span class='danger'>The forum URL is not set in the server configuration.</span>")
	return

/client/verb/rules()
	set name = "rules"
	set desc = "Show Server Rules."
	set hidden = 1
	var/rulesurl = CONFIG_GET(string/rulesurl)
	switch(alert("Where would you like to see the rules?", null, "Discord (external link)", "View here", "Cancel"))
		if("Discord (external link)")
			if(!rulesurl)
				to_chat(src, "<span class='danger'>The rules URL is not set in the server configuration.</span>")
				return
			src << link(rulesurl)
		if("View here")
			src << browse('html/rules.html', "window=changes")

/client/verb/github()
	set name = "github"
	set desc = "Visit Github"
	set hidden = 1
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		if(alert("This will open the Github repository in your browser. Are you sure?",,"Yes","No")!="Yes")
			return
		src << link(githuburl)
	else
		to_chat(src, "<span class='danger'>The Github URL is not set in the server configuration.</span>")
	return

/client/verb/reportissue()
	set name = "report-issue"
	set desc = "Report an issue"
	set hidden = 1
	var/githuburl = CONFIG_GET(string/githuburl)
	if(githuburl)
		var/message = "This will open the Github issue reporter in your browser. Are you sure?"
		if(GLOB.revdata.testmerge.len)
			message += "<br>The following experimental changes are active and are probably the cause of any new or sudden issues you may experience. If possible, please try to find a specific thread for your issue instead of posting to the general issue tracker:<br>"
			message += GLOB.revdata.GetTestMergeInfo(FALSE)
		if(tgalert(src, message, "Report Issue","Yes","No")!="Yes")
			return
		var/static/issue_template = file2text(".github/ISSUE_TEMPLATE.md")
		var/servername = CONFIG_GET(string/servername)
		var/url_params = "Reporting client version: [byond_version].[byond_build]\n\n[issue_template]"
		if(GLOB.round_id || servername)
			url_params = "Issue reported from [GLOB.round_id ? " Round ID: [GLOB.round_id][servername ? " ([servername])" : ""]" : servername]\n\n[url_params]"
		DIRECT_OUTPUT(src, link("[githuburl]/issues/new?body=[url_encode(url_params)]"))
	else
		to_chat(src, "<span class='danger'>The Github URL is not set in the server configuration.</span>")
	return

/client/verb/changelog()
	set name = "Changelog"
	set category = "OOC"
	if(!GLOB.changelog_tgui)
		GLOB.changelog_tgui = new /datum/changelog()

	GLOB.changelog_tgui.ui_interact(mob)
	if(prefs.lastchangelog != GLOB.changelog_hash)
		prefs.lastchangelog = GLOB.changelog_hash
		prefs.save_preferences()
		winset(src, "infowindow.changelog", "font-style=;")
