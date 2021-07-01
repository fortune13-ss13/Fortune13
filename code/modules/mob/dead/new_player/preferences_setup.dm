
	//The mob should have a gender you want before running this proc. Will run fine without H
/datum/preferences/proc/random_character(gender_override)
	if(gender_override)
		gender = gender_override
	else
		gender = MALE
	underwear = "Boxers"
	undie_color = "#333333"
	undershirt = "Shirt - Short Sleeved"
	shirt_color = pick("#8D8B8B", "#997C4F")
	socks = "Short"
	socks_color = "#333333"
	use_custom_skin_tone = FALSE
	skin_tone = pick("latino", "mediterranean")
	hair_style = pick("Trimmed", "Fade (Low)")
	facial_hair_style = pick("Beard (5 o\'Clock)", "Beard (3 o\'Clock)")
	hair_color = pick("#333333", "#44302B")
	facial_hair_color = "#333333"
//	var/random_eye_color = random_eye_color()
	left_eye_color = "#333333"
	right_eye_color = "#333333"
	age = (rand(20, 25))
//	if(!pref_species)
//		var/rando_race = pick(GLOB.roundstart_races)
//		pref_species = new rando_race()
//	features = random_features(pref_species?.id, gender)



/datum/preferences/proc/update_preview_icon(equip_job = TRUE)
	// Determine what job is marked as 'High' priority, and dress them up as such.
	var/datum/job/previewJob = get_highest_job()

	if(previewJob)
		// Silicons only need a very basic preview since there is no customization for them.
		if(istype(previewJob,/datum/job/ai))
			parent.show_character_previews(image('icons/mob/ai.dmi', icon_state = resolve_ai_icon(preferred_ai_core_display), dir = SOUTH))
			return
		if(istype(previewJob,/datum/job/cyborg))
			parent.show_character_previews(image('icons/mob/robots.dmi', icon_state = "robot", dir = SOUTH))
			return

	// Set up the dummy for its photoshoot
	var/mob/living/carbon/human/dummy/mannequin = generate_or_wait_for_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)
	// Apply the Dummy's preview background first so we properly layer everything else on top of it.
	mannequin.add_overlay(mutable_appearance('modular_citadel/icons/ui/backgrounds.dmi', bgstate, layer = SPACE_LAYER))
	copy_to(mannequin, initial_spawn = TRUE)

	if(previewJob && equip_job)
		mannequin.job = previewJob.title
		previewJob.equip(mannequin, TRUE, preference_source = parent)

	COMPILE_OVERLAYS(mannequin)
	parent.show_character_previews(new /mutable_appearance(mannequin))
	unset_busy_human_dummy(DUMMY_HUMAN_SLOT_PREFERENCES)

/datum/preferences/proc/get_highest_job()
	var/highest_pref = 0
	var/datum/job/highest_job
	for(var/job in job_preferences)
		if(job_preferences["[job]"] > highest_pref)
			highest_job = SSjob.GetJob(job)
			highest_pref = job_preferences["[job]"]
	return highest_job
