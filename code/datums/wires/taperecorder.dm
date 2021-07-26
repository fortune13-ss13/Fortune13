/datum/wires/taperecorder
	holder_type = /obj/item/taperecorder
	proper_name = "Universal Recorder"
	req_knowledge = JOB_SKILL_TRAINED
	req_skill = JOB_SKILL_UNTRAINED

/datum/wires/taperecorder/New(atom/holder)
	wires = list(
		WIRE_RECORD,
		WIRE_STOP, WIRE_PLAY
	)
	..()

/datum/wires/taperecorder/interactable(mob/user)
	. = FALSE
	var/obj/item/taperecorder/T = holder
	if(T.panel_open)
		. = TRUE

/datum/wires/taperecorder/on_pulse(wire)
	var/obj/item/taperecorder/T = holder
	switch(wire)
		if(WIRE_RECORD)
			T.record()
		if(WIRE_STOP)
			T.stop()
		if(WIRE_PLAY)
			T.play()