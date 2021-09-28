#define SINGLE "single"
#define VERTICAL "vertical"
#define HORIZONTAL "horizontal"

#define METAL 1
#define WOOD 2
#define SAND 3

//Junk and Rubbish
//Objects to fill ruins with so it looks decayed on the inside too.
//Junk = Blocks movement, bullets, small resource when destroyed.
//small junk = Slows movement, worthless for cover, cleaned with soap etc. Having difficulty making the slowdown work =(

/obj/structure/junk
	icon = 'icons/fallout/furniture/ruined.dmi'
	obj_integrity = 100
	max_integrity = 100
	anchored = 1
	density = 1
	var/buildstacktype = /obj/item/stack/rods
	var/buildstackamount = 1

/obj/structure/junk/deconstruct()
	// If we have materials, and don't have the NOCONSTRUCT flag
	if(!(flags_1 & NODECONSTRUCT_1))
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
		else
			for(var/i in custom_materials)
				var/datum/material/M = i
				new M.sheet_type(loc, FLOOR(custom_materials[M] / MINERAL_MATERIAL_AMOUNT, 1))
	..()

//Barricades/cover

/obj/structure/barricade
	name = "chest high wall"
	desc = "Looks like this would make good cover."
	anchored = 1
	density = 1
	obj_integrity = 100
	max_integrity = 100

/////BARRICADE TYPES///////

/obj/structure/barricade/wooden
	name = "wooden barricade"
	desc = "This space is blocked off by a wooden barricade."
	icon = 'icons/obj/fence.dmi'
	icon_state = "woodenbarricade"
//	material = WOOD

/obj/structure/barricade/wooden/attackby(obj/item/weapon/I, mob/living/user, params)
	if(!istype(src, /obj/structure/barricade/wooden/planks) && !istype(src, /obj/structure/barricade/wooden/crude) && istype(I, /obj/item/stack/sheet/))
		if(isfloorturf(loc) || isplatingturf(loc))
			var/obj/item/stack/sheet/mineral/wood/W = I
			var/obj/item/stack/sheet/cloth/C = I
			var/obj/item/stack/sheet/leather/L = I //???
			var/obj/item/stack/sheet/glass/G = I
			var/obj/item/stack/sheet/rglass/M = I
			if(W.amount >= 3)
				to_chat(user, "<span class='notice'>You start building a wall...</span>")
				if(do_after(user, 100, target = src) && W.use(3))
					var/turf/open/T = loc
					T.ChangeTurf(/turf/closed/wall/f13/wood)
					qdel(src)
					return TRUE
			if(C.amount >= 3)
				to_chat(user, "<span class='notice'>You start building an interior wall...</span>")
				if(do_after(user, 100, target = src) && C.use(3))
					var/turf/open/T = loc
					T.ChangeTurf(/turf/closed/wall/f13/wood/interior)
					qdel(src)
					return TRUE
			if(L.amount >= 3)
				to_chat(user, "<span class='notice'>You start building a house wall...</span>")
				if(do_after(user, 100, target = src) && L.use(3))
					var/turf/open/T = loc
					T.ChangeTurf(/turf/closed/wall/f13/wood/house)
					qdel(src)
					return TRUE
			if(G.amount >= 3)
				to_chat(user, "<span class='notice'>You start building a house window...</span>")
				if(do_after(user, 100, target = src) && G.use(3))
					var/turf/open/T = loc
					new /obj/structure/window/fulltile/house(T)
					qdel(src)
					return TRUE
			if(M.amount >= 3)
				to_chat(user, "<span class='notice'>You start building a wood framed window...</span>")
				if(do_after(user, 100, target = src) && M.use(3))
					var/turf/open/T = loc
					new /obj/structure/window/fulltile/wood(T)
					qdel(src)
					return TRUE
			else
				to_chat(user, "<span class='warning'>You need atleast 3 materials to build a structure!</span>")
		else
			to_chat(user, "<span class='warning'>You can only build the structure on a solid floor!</span>")
	else
		return ..()



/obj/structure/barricade/wooden/strong
	name = "strong wooden barricade"
	desc = "This space is blocked off by a strong wooden barricade."
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 30

/obj/structure/barricade/bars //FighterX2500 is this you?
	name = "metal bars"
	desc = "Old, corroded metal bars. Ain't got a file on you, right?" //Description by Mr.Fagetti
	icon = 'icons/obj/fence.dmi'
	icon_state = "bars"
	obj_integrity = 400
	max_integrity = 400
	proj_pass_rate = 90
	pass_flags = LETPASSTHROW //Feed the prisoners, or not.

/obj/structure/barricade/sandbags
	name = "sandbags"
	desc = "Bags of sand. Take cover!"
	icon = 'icons/obj/smooth_structures/sandbags.dmi'
	icon_state = "sandbags"
	obj_integrity = 300
	max_integrity = 300
	proj_pass_rate = 20
	pass_flags = LETPASSTHROW
//	material = SAND
	climbable = TRUE
	smooth = SMOOTH_TRUE
	canSmoothWith = list(/obj/structure/barricade/sandbags, /turf/closed/wall, /turf/closed/wall/r_wall, /obj/structure/falsewall, /obj/structure/falsewall/reinforced, /turf/closed/wall/rust, /turf/closed/wall/r_wall/rust, /obj/structure/barricade/security)




#undef SINGLE
#undef VERTICAL
#undef HORIZONTAL

#undef METAL
#undef WOOD
#undef SAND
