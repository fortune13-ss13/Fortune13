//In this document: Pistol calibre cartridges values for damage and penetration.

//////////////////////
// AMMUNITION TYPES //
//////////////////////
/*
FMJ (full metal jacket)		=	Baseline
AP (armor piercing)			=	-10% damage. AP increased by 0.2. Wound bonus -50%
JHP (jacketed hollow point)	=	+10% damage. AP reduced by 0.2. Wound bonus + 50%
SWC (semi wadcutter)		=	AP reduced by 0.1. Wound bonus +50%
P+ (overpressure)			=	extra speed 500. AP + 01. Wound bonus -25%
Match						=	extra speed 200. AP +0.05. Wound bonus -10%
Civilian round				=	-10% damage. AP reduced by 50% 
*/


////////////////////
// .22 LONG RIFLE //
////////////////////		-very light round

/obj/item/projectile/bullet/c22
	name = ".22lr bullet"
	damage = 20
	armour_penetration = 0.06
	wound_bonus = 6

/obj/item/projectile/bullet/c22/hp
	name = ".22lr hollow point bullet"
	damage = 22
	armour_penetration = -0.14
	wound_bonus = -9
	bare_wound_bonus = 9

/obj/item/projectile/bullet/c22/plinking
	name = ".22lr plinking bullet"
	damage = 18
	armour_penetration = 0.03
	wound_bonus = 0


/////////////////
// .38 SPECIAL //
/////////////////		-Light round, slight damage focus

/obj/item/projectile/bullet/c38
	name = ".38 bullet"
	damage = 30
	armour_penetration = 0.04
	wound_bonus = 10


//////////
// 9 MM //
//////////				-Light round, allround

/obj/item/projectile/bullet/c9mm
	name = "9mm FMJ bullet"
	damage = 28
	armour_penetration = 0.05
	wound_bonus = 15

/obj/item/projectile/bullet/c9mm/ap
	name = "9mm AP bullet"
	damage = 25
	armour_penetration = 0.25
	wound_bonus = 8
	bare_wound_bonus = -8

/obj/item/projectile/bullet/c9mm/jhp
	name = "9mm JHP bullet"
	damage = 31
	armour_penetration = -0.15
	wound_bonus = -23
	bare_wound_bonus = 23

/obj/item/projectile/bullet/c9mm/op
	name = "9mm +P bullet"
	damage = 28
	armour_penetration = 0.15
	wound_bonus = 11
	bare_wound_bonus = -11
	var/extra_speed = 500

/obj/item/projectile/bullet/c9mm/simple //for simple mobs, separate to allow balancing
	name = "9mm bullet"


///////////
// 10 MM //
///////////				-Medium round, AP focus

/obj/item/projectile/bullet/c10mm
	name = "10mm FMJ bullet"
	damage = 30
	armour_penetration = 0.12
	wound_bonus = 18

/obj/item/projectile/bullet/c10mm/ap
	name = "10mm AP bullet"
	damage = 27
	armour_penetration = 0.32
	wound_bonus = 9
	bare_wound_bonus = -9

/obj/item/projectile/bullet/c10mm/hp
	name = "10mm JHP bullet"
	damage = 33
	armour_penetration = -0.08
	wound_bonus = -27
	bare_wound_bonus = 27


/////////////
// .45 ACP //
/////////////			-Medium round, damage focus

/obj/item/projectile/bullet/c45
	name = ".45 FMJ bullet"
	damage = 33
	armour_penetration = 0.1
	wound_bonus = 20

/obj/item/projectile/bullet/c45/jhp
	name = ".45 JHP bullet"
	damage = 36
	armour_penetration = -0.1
	wound_bonus = -30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/c45/op
	name = ".45 +P bullet"
	damage = 33
	armour_penetration = 0.2
	wound_bonus = 15
	bare_wound_bonus = -15
	var/extra_speed = 500


/////////////////
// .357 MAGNUM //
/////////////////		-High power round

/obj/item/projectile/bullet/a357
	name = ".357 FMJ bullet"
	damage = 37
	armour_penetration = 0.15
	wound_bonus = 14
	bare_wound_bonus = -14

/obj/item/projectile/bullet/a357/jhp
	name = ".357 JHP bullet"
	damage = 41
	armour_penetration = -0.05
	wound_bonus = -21
	bare_wound_bonus = 21

/obj/item/projectile/bullet/a357/jfp
	name = ".357 JFP bullet"
	damage = 39
	armour_penetration = 0.1
	wound_bonus = 18
	bare_wound_bonus = 18


////////////////
// .44 MAGNUM //
////////////////		- High power round

/obj/item/projectile/bullet/m44
	name = ".44 FMJ bullet"
	damage = 40
	armour_penetration = 0.2
	wound_bonus = 20
	bare_wound_bonus = -20

/obj/item/projectile/bullet/m44/jhp
	name = ".44 JHP bullet"
	damage = 44
	armour_penetration = 0
	wound_bonus = -30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/m44/swc
	name = ".44 SWC bullet"
	damage = 40
	armour_penetration = 0.1
	wound_bonus = 30
	bare_wound_bonus = 30

/obj/item/projectile/bullet/m44/simple //for simple mobs, separate to allow balancing
	name = ".44 bullet"

//45 Long Colt. Bouncy ammo but less damage then the Sequoia. It's in one of the Vet Ranger kits
/obj/item/projectile/bullet/a45lc
	name = ".45 LC bullet"
	damage = 44 //Right inbetween 44 and 45-70. Gun this is used in has a fire delay of 8, doing the math I'm pretty sure a regular M29 has a higher DPS then dual wielding these unless you bounce shots
	armour_penetration = 0.25 //Again, right inbetween 44 and 45-70.
	wound_bonus = 20
	bare_wound_bonus = -20
	ricochets_max = 3
	ricochet_incidence_leeway = 130
	ricochet_decay_damage = 1.1 //48 damage on first bounce, 53 on second, 58 on third. Unless you bounce, the DPS dual wielding is lower then a single M29
	ricochet_decay_chance = 1
	ricochet_chance = 80 //100% if you have the vet's trait
	ricochet_auto_aim_range = 4

////////////
// .45-70 //
////////////			-Huge round, AP focus

/obj/item/projectile/bullet/c4570
	name = ".45-70 FMJ bullet"
	damage = 48
	armour_penetration = 0.3
	wound_bonus = 24
	bare_wound_bonus = -24

/obj/item/projectile/bullet/c4570/jhp
	name = ".45-70 JHP bullet"
	damage = 53
	armour_penetration = 0.1
	wound_bonus = -36
	bare_wound_bonus = 36

/obj/item/projectile/bullet/c4570/swc
	name = ".45-70 SWC bullet"
	damage = 48
	armour_penetration = 0.2
	wound_bonus = 36
	bare_wound_bonus = 36

/obj/item/projectile/bullet/c4570/explosive
	damage = 10
	armour_penetration = 1
	pixels_per_second = TILES_TO_PIXELS(500)
	name = ".45-70 explosive bullet"

/obj/item/projectile/bullet/c4570/explosive/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, 0, 0, 1, 1, flame_range = 1)


///////////
// 14 MM //
///////////				-Huge pistol round, damage focus

/obj/item/projectile/bullet/a127mm
	name = "14mm FMJ bullet"
	damage = 56
	armour_penetration = 0.25
	wound_bonus = 28
	bare_wound_bonus = -28

/obj/item/projectile/bullet/a127mm/jhp
	name = "14mm JHP bullet"
	damage = 62
	armour_penetration = 0.05
	wound_bonus = -42
	bare_wound_bonus = 42


/////////////
// NEEDLER //
/////////////			- AP focus

/obj/item/projectile/bullet/needle
	name = "needle"
	icon_state = "cbbolt"
	damage = 35
	armour_penetration = 0.6
	var/piercing = FALSE

/obj/item/projectile/bullet/needle/ap
	name = "armour piercing needle"
	damage = 32
	armour_penetration = 0.8
	wound_bonus = 0
	bare_wound_bonus = 0
	piercing = TRUE

/obj/item/projectile/bullet/needle/ultra
	name = "ultracite needle"
	damage = 39
	armour_penetration = 0.4
	piercing = TRUE



////////////////
//CODE ARCHIVE//
////////////////

/*
SYNDIE AMMO
/obj/item/projectile/bullet/p50
	name =".50 bullet"
	pixels_per_second = TILES_TO_PIXELS(25)
	damage = 70
	knockdown = 100
	dismemberment = 50
	armour_penetration = 0.85
	zone_accuracy_factor = 100		//guarunteed 100%
	var/breakthings = TRUE

/obj/item/projectile/bullet/p50/on_hit(atom/target, blocked = 0)
	if(isobj(target) && (blocked != 100) && breakthings)
		var/obj/O = target
		O.take_damage(80, BRUTE, "bullet", FALSE)
	return ..()

/obj/item/projectile/bullet/p50/soporific
	name =".50 soporific bullet"
	armour_penetration = 0
	damage = 0
	dismemberment = 0
	knockdown = 0
	breakthings = FALSE

/obj/item/projectile/bullet/p50/soporific/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()

/obj/item/projectile/bullet/p50/penetrator
	name =".50 penetrator bullet"
	icon_state = "gauss"
	name = "penetrator round"
	damage = 60
	movement_type = FLYING | UNSTOPPABLE
	dismemberment = 0 //It goes through you cleanly.
	knockdown = 0
	breakthings = FALSE

/obj/item/projectile/bullet/p50/penetrator/shuttle //Nukeop Shuttle Variety
	icon_state = "gaussstrong"
	damage = 25
	pixels_per_second = TILES_TO_PIXELS(33.33)
	range = 16

NEEDLE INJECTION CODE
/obj/item/projectile/bullet/needle/Initialize()
	. = ..()
	create_reagents(50, NO_REACT, NO_REAGENTS_VALUE)

/obj/item/projectile/bullet/needle/on_hit(atom/target, blocked = FALSE, skip = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone, piercing)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				if(skip == TRUE)
					return BULLET_ACT_HIT
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return TRUE
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='userdanger'>You were protected against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.reagents_holder_flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

BOUNCING BULLET CODE
	ricochets_max = 2
	ricochet_chance = 50
	ricochet_auto_aim_angle = 10
	ricochet_auto_aim_range = 3
	wound_bonus = -20
	bare_wound_bonus = 10
	embedding = list(embed_chance=15, fall_chance=2, jostle_chance=2, ignore_throwspeed_threshold=TRUE, pain_stam_pct=0.4, pain_mult=3, jostle_pain_mult=5, rip_time=10)


SOPORIFIC ROUND CODE
/obj/item/projectile/bullet/p50/soporific/on_hit(atom/target, blocked = FALSE)
	if((blocked != 100) && isliving(target))
		var/mob/living/L = target
		L.Sleeping(400)
	return ..()
*/
