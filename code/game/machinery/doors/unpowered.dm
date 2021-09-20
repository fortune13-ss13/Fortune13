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

/obj/machinery/door/unpowered/do_animate(animation)
	switch(animation)
		if("opening")
			playsound(src,'sound/machines/door_open.ogg',40,1)
			flick("[icon_state]opening", src)
		if("closing")
			playsound(src,'sound/machines/door_close.ogg',40,1)
			flick("[icon_state]closing", src)

/obj/machinery/door/unpowered/wooddoor
	name = "wooden door"
	icon_state = "wood"

/obj/machinery/door/unpowered/padlockwooddoor
	name = "wooden door with lock"
	icon_state = "wood" 
	req_one_access_txt = "25" // Standard Town access
	max_integrity = 180

/obj/machinery/door/unpowered/padlockwooddoor/update_icon_state()
	if(density)
		icon_state = "woodclosing"
	else
		icon_state = "woodopening"

/obj/machinery/door/unpowered/padlockwooddoor/clinic
	name = "Town Clinic"
	icon_state = "white-weathered" 
	req_one_access_txt = "68" // Clinic access
	max_integrity = 180

/obj/machinery/door/unpowered/padlockwooddoor/clinic/update_icon_state()
	if(density)
		icon_state = "white-weatheredclosing"
	else
		icon_state = "white-weatheredopening"

/obj/machinery/door/unpowered/padlockwooddoor/clinic/interior
	name = "wooden door with lock"
	icon_state = "white-dirty" 

/obj/machinery/door/unpowered/padlockwooddoor/clinic/interior/update_icon_state()
	if(density)
		icon_state = "white-dirtyclosing"
	else
		icon_state = "white-dirtyopening"

/obj/machinery/door/unpowered/padlockwooddoor/alderman
	name = "Aldermans office"
	icon_state = "white-dirty" 
	req_one_access_txt = "52" // Alderman access

/obj/machinery/door/unpowered/padlockwooddoor/alderman/update_icon_state()
	if(density)
		icon_state = "white-dirtyclosing"
	else
		icon_state = "white-dirtyopening"

/obj/machinery/door/unpowered/padlockwooddoor/alderman/interior
	name = "wooden door with lock"
	icon_state = "white" 

/obj/machinery/door/unpowered/padlockwooddoor/alderman/interior/update_icon_state()
	if(density)
		icon_state = "whiteclosing"
	else
		icon_state = "whiteopening"

/obj/machinery/door/unpowered/padlockirondoor
	name = "iron door with lock"
	icon_state = "metal"
	max_integrity = 600
	req_one_access_txt = "34" // Trader access

/obj/machinery/door/unpowered/padlockirondoor/update_icon_state()
	if(density)
		icon_state = "metalclosing"
	else
		icon_state = "metalopening"
