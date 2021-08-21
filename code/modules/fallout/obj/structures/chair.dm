//Fallout 13 unique furniture directory

/obj/structure/chair/bench
	name = "bench"
	desc = "A classic wooden bench. It has some dried wax on it..."
	icon_state = "church"
	icon = 'icons/obj/objects2.dmi'
	item_chair = null
	buildstacktype = /obj/item/stack/sheet/mineral/wood

/obj/structure/furniture
	icon = 'icons/fallout/objects/structures/stationary.dmi'
	obj_integrity = 100
	max_integrity = 100
	anchored = 1
	density = 1
	var/buildstacktype = /obj/item/stack/sheet/mineral/wood
	var/buildstackamount = 1

/obj/structure/furniture/grand_clock
	name = "very old clock"
	desc = "Meticulously maintained old clock, the delicate machinery inside it irreplacable. Ticks when it does not tock."
	icon_state = "grand_clock_act"
