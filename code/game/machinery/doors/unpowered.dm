/obj/machinery/door/unpowered
	icon = 'icons/obj/doors/wastelanddoors.dmi'
	opacity = 1
	density = TRUE
	explosion_block = 1
	armor = list("melee" = 25, "bullet" = 25, "laser" = 25, "energy" = 25, "bomb" = 25, "bio" = 100, "rad" = 100, "fire" = 80, "acid" = 70)
	max_integrity = 60
//	assemblytype = /obj/item/stack/sheet/mineral/wood/five

/*
/obj/machinery/door/unpowered/update_icon_state()
	if(density)
		icon_state = "[icon_state]"
	else
		icon_state = "[icon_state]"

/obj/machinery/door/unpowered/proc/do_animate(animation)
	switch(animation)
		if("opening")
			if(panel_open)
				flick("[icon_state]opening", src)
			else
				flick("[icon_state]opening", src)
		if("closing")
			if(panel_open)
				flick("[icon_state]closing", src)
			else
				flick("[icon_state]closing", src)
		if("deny")
			if(!stat)
				flick("[icon_state]", src)

/obj/machinery/door/unpowered/wooddoor/update_icon()
	if(density)
		icon_state = "[icon_state]"
	else
		icon_state = "[icon_state]"

/obj/machinery/door/unpowered/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("[icon_state]opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("[icon_state]closing", src)
*/

/obj/machinery/door/unpowered/Bumped(atom/movable/AM)
	if(src.locked)
		return
	..()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I, mob/user, params)
	if(locked)
		return
	else
		return ..()

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	name = "door"
	icon_state = "door1"

/obj/machinery/door/unpowered/wooddoor
	name = "wooden door"
	icon_state = "wood"


/obj/machinery/door/unpowered/padlockwooddoor
	name = "wooden door with lock"
	icon_state = "wood" 
	req_one_access_txt = "25" // Standard Town access
	max_integrity = 180

/obj/machinery/door/unpowered/padlockwooddoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			icon_state = "woodopening"
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			icon_state = "woodclosing"

/obj/machinery/door/unpowered/padlockwooddoor/merc
	name = "wooden door with lock"
	icon_state = "wood" 
	req_one_access_txt = "62" // Standard Town access
	max_integrity = 180


/obj/machinery/door/unpowered/ragecagefencedoor
	name = "padlocked fence door"
	icon_state = "fence"
	req_one_access_txt = "87" // Raider access
	max_integrity = 80

/obj/machinery/door/unpowered/ragecagefencedoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorchainlink_open.ogg',40,1)
			icon_state = "fenceopening"
		if("closing")
			playsound(src,'sound/f13machines/doorchainlink_close.ogg',40,1)
			icon_state = "fenceclosing"


/obj/machinery/door/unpowered/barredcelldoor
	name = "cell door"
	icon_state = "barred"
	req_one_access_txt = "62" // Mercenary access
	max_integrity = 220

/obj/machinery/door/unpowered/barredcelldoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorstore_open.ogg',40,1)
			icon_state = "barredopening"
		if("closing")
			playsound(src,'sound/f13machines/doorstore_close.ogg',40,1)
			icon_state = "barredclosing"


/obj/machinery/door/unpowered/padlockwooddoor/clinic
	name = "Town Clinic"
	icon_state = "white-weathered" 
	req_one_access_txt = "68" // Clinic access
	max_integrity = 180

/obj/machinery/door/unpowered/padlockwooddoor/clinic/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			icon_state = "white-weatheredopening"
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			icon_state = "white-weatheredclosing"


/obj/machinery/door/unpowered/padlockwooddoor/clinic/interior
	name = "wooden door with lock"
	icon_state = "white-dirty" 

/obj/machinery/door/unpowered/padlockwooddoor/clinic/interior/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			icon_state = "white-dirtyopening"
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			icon_state = "white-dirtyclosing"


/obj/machinery/door/unpowered/padlockwooddoor/alderman
	name = "Aldermans office"
	icon_state = "white-dirty" 
	req_one_access_txt = "52" // Alderman access

/obj/machinery/door/unpowered/padlockwooddoor/alderman/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			icon_state = "white-dirtyopening"
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			icon_state = "white-dirtyclosing"


/obj/machinery/door/unpowered/padlockwooddoor/alderman/interior
	name = "wooden door with lock"
	icon_state = "white" 

/obj/machinery/door/unpowered/padlockwooddoor/alderman/interior/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			icon_state = "whiteopening"
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			icon_state = "whiteclosing"


/obj/machinery/door/unpowered/padlockirondoor
	name = "iron door with lock"
	icon_state = "metal"
	max_integrity = 600
	req_one_access_txt = "34" // Trader access

/obj/machinery/door/unpowered/padlockirondoor/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/f13machines/doorstore_open.ogg',40,1)
			icon_state = "metalopening"
		if("closing")
			playsound(src,'sound/f13machines/doorstore_close.ogg',40,1)
			icon_state = "metalclosing"

/obj/machinery/door/unpowered/padlockirondoor/merc
	req_one_access_txt = "62" // Mercenary access

/obj/machinery/door/unpowered/padlockirondoor/merc/commander
	req_one_access_txt = "65" // Mercenary commander access
