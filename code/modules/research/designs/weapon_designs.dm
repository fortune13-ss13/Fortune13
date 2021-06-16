///////////////////////////////
///////Weapons & Ammo//////////
///////////////////////////////

//////////////
//Ammo Boxes//
//////////////

/*
/datum/design/c38/sec
	id = "sec_38"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38/sec/lethal
	name = "Speed Loader (.38)"
	id = "sec_38lethal"
	build_path = /obj/item/ammo_box/c38/lethal

/datum/design/c38_trac
	name = "Speed Loader (.38 TRAC)"
	desc = "Designed to quickly reload revolvers. TRAC bullets embed a tracking implant within the target's body."
	id = "c38_trac"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/silver = 5000, /datum/material/gold = 1000)
	build_path = /obj/item/ammo_box/c38/trac
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_hotshot
	name = "Speed Loader (.38 Hot Shot)"
	desc = "Designed to quickly reload revolvers. Hot Shot bullets contain an incendiary payload."
	id = "c38_hotshot"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/hotshot
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/c38_iceblox
	name = "Speed Loader (.38 Iceblox)"
	desc = "Designed to quickly reload revolvers. Iceblox bullets contain a cryogenic payload."
	id = "c38_iceblox"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 20000, /datum/material/plasma = 5000)
	build_path = /obj/item/ammo_box/c38/iceblox
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/

//////////////////
//Mag-Rifle Mags//
//////////////////

/*
/datum/design/mag_magrifle
	name = "Magrifle Magazine (Lethal)"
	desc = "A 24-round magazine for the Magrifle."
	id = "mag_magrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 8000, /datum/material/silver = 1000)
	build_path = /obj/item/ammo_box/magazine/mmag/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_magrifle/nl
	name = "Magrifle Magazine (Non-Lethal)"
	desc = "A 24- round non-lethal magazine for the Magrifle."
	id = "mag_magrifle_nl"
	materials = list(/datum/material/iron = 6000, /datum/material/silver = 500, /datum/material/titanium = 500)
	build_path = /obj/item/ammo_box/magazine/mmag

/datum/design/mag_magpistol
	name = "Magpistol Magazine"
	desc = "A 14 round magazine for the Magpistol."
	id = "mag_magpistol"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/silver = 500)
	build_path = /obj/item/ammo_box/magazine/mmag/small/lethal
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mag_magpistol/nl
	name = "Magpistol Magazine (Non-Lethal)"
	desc = "A 14 round non-lethal magazine for the Magpistol."
	id = "mag_magpistol_nl"
	materials = list(/datum/material/iron = 3000, /datum/material/silver = 250, /datum/material/titanium = 250)
	build_path = /obj/item/ammo_box/magazine/mmag/small
*/

//////////////
//Ammo Shells/
//////////////

/datum/design/shell_clip
	name = "stripper clip (shotgun shells)"
	id = "sec_shellclip"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000)
	build_path = /obj/item/ammo_box/shotgun
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/*
/datum/design/beanbag_slug/sec
	id = "sec_beanbag"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/rubbershot/sec
	id = "sec_rshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_slug/sec
	id = "sec_slug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/buckshot_shell/sec
	id = "sec_bshot"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/shotgun_dart/sec
	id = "sec_dart"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/incendiary_slug/sec
	id = "sec_islug"
	build_type = PROTOLATHE
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/

/datum/design/stunshell
	name = "Stun Shell"
	desc = "A stunning shell for a shotgun."
	id = "stunshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200)
	build_path = /obj/item/ammo_casing/shotgun/stunslug
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/techshell
	name = "Unloaded Technological Shotshell"
	desc = "A high-tech shotgun shell which can be loaded with materials to produce unique effects."
	id = "techshotshell"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 1000, /datum/material/glass = 200)
	build_path = /obj/item/ammo_casing/shotgun/techshell
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

//////////////
//Firing Pins/
//////////////

/datum/design/pin_testing
	name = "Test-Range Firing Pin"
	desc = "This safety firing pin allows firearms to be operated within proximity to a firing range."
	id = "pin_testing"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 300)
	build_path = /obj/item/firing_pin/test_range
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/pin_mindshield
	name = "Mindshield Firing Pin"
	desc = "This is a security firing pin which only authorizes users who are mindshield-implanted."
	id = "pin_loyalty"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 600, /datum/material/diamond = 600, /datum/material/uranium = 200)
	build_path = /obj/item/firing_pin/implant/mindshield
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/pin_explorer
	name = "Outback Firing Pin"
	desc = "This firing pin only shoots while ya ain't on station, fair dinkum!"
	id = "pin_explorer"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 1000, /datum/material/gold = 1000, /datum/material/iron = 500)
	build_path = /obj/item/firing_pin/explorer
	category = list("Firing Pins")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//////////////
//Guns////////
//////////////



/datum/design/ioncarbine
	name = "Ion Carbine"
	desc = "How to dismantle a cyborg : The gun."
	id = "ioncarbine"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 6000, /datum/material/iron = 8000, /datum/material/uranium = 2000)
	build_path = /obj/item/gun/energy/ionrifle/carbine
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/*
/datum/design/magpistol
	name = "Magpistol"
	desc = "A weapon which fires ferromagnetic slugs."
	id = "magpistol"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 7500, /datum/material/glass = 1000, /datum/material/uranium = 1000, /datum/material/titanium = 5000, /datum/material/silver = 2000)
	build_path = /obj/item/gun/ballistic/automatic/magrifle/pistol/nopin
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/magrifle
	name = "Magrifle"
	desc = "An upscaled Magpistol in rifle form."
	id = "magrifle"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/uranium = 2000, /datum/material/titanium = 10000, /datum/material/silver = 4000, /datum/material/gold = 2000)
	build_path = /obj/item/gun/ballistic/automatic/magrifle/nopin
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/

///////////
//Grenades/
///////////

/datum/design/large_grenade
	name = "Large Grenade"
	desc = "A grenade that affects a larger area and use larger containers."
	id = "large_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000)
	build_path = /obj/item/grenade/chem_grenade/large
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/pyro_grenade
	name = "Pyro Grenade"
	desc = "An advanced grenade that is able to self ignite its mixture."
	id = "pyro_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/plasma = 500)
	build_path = /obj/item/grenade/chem_grenade/pyro
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/cryo_grenade
	name = "Cryo Grenade"
	desc = "An advanced grenade that rapidly cools its contents upon detonation."
	id = "cryo_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/grenade/chem_grenade/cryo
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/adv_grenade
	name = "Advanced Release Grenade"
	desc = "An advanced grenade that can be detonated several times, best used with a repeating igniter."
	id = "adv_Grenade"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 3000, /datum/material/glass = 500)
	build_path = /obj/item/grenade/chem_grenade/adv_release
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

///////////
//Shields//
///////////

/datum/design/tele_shield
	name = "Telescopic Riot Shield"
	desc = "An advanced riot shield made of lightweight materials that collapses for easy storage."
	id = "tele_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 4000, /datum/material/silver = 300, /datum/material/titanium = 200)
	build_path = /obj/item/shield/riot/tele
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/laser_shield
	name = "Laser Resistant Riot Shield"
	desc = "An advanced riot shield made of darker glasses to prevent laser fire from passing through."
	id = "laser_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/plastic = 4000, /datum/material/silver = 800, /datum/material/titanium = 600, /datum/material/plasma = 5000)
	build_path = /obj/item/shield/riot/laser_proof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/bullet_shield
	name = "Bullet Resistant Riot Shield"
	desc = "An advanced riot shield made bullet resistant plastics and heavy metals to protect against projectile harm."
	id = "bullet_shield"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/glass = 1000, /datum/material/silver = 2000, /datum/material/titanium = 1200, /datum/material/plastic = 2500)
	build_path = /obj/item/shield/riot/bullet_proof
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//////////
//MISC////
//////////

/datum/design/suppressor
	name = "Suppressor"
	desc = "A reverse-engineered suppressor that fits on most small arms with threaded barrels."
	id = "suppressor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000, /datum/material/silver = 500)
	build_path = /obj/item/suppressor
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY


/*
/datum/design/stun_boomerang
	name = "OZtek Boomerang"
	desc = "Uses reverse flow gravitodynamics to flip its personal gravity back to the thrower mid-flight. Also functions similar to a stun baton."
	id = "stun_boomerang"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 4000, /datum/material/silver = 10000, /datum/material/gold = 2000)
	build_path = /obj/item/melee/baton/boomerang
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY
*/

/datum/design/mindshield
	name = "Mindshield Implant"
	desc = "A mindshield implant."
	id = "implant_loyal"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 500, /datum/material/glass = 500)
	build_path = /obj/item/implantcase/mindshield
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/mfc
	name = "Microfusion Cell"
	id = "mfc"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000)
	build_path =/obj/item/stock_parts/cell/ammo/mfc
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ec
	name = "Energy Cell"
	id = "ec"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 1000)
	build_path =/obj/item/stock_parts/cell/ammo/ec
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/ecp
	name = "Electron Charge Pack"
	id = "ecp"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 2000, /datum/material/diamond = 2000)
	build_path = /obj/item/stock_parts/cell/ammo/ecp
	category = list("Ammo")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

//weapon parts
/datum/design/fluxcap
	name = "Flux capacitator"
	desc = "An advanced weapons part."
	id = "fluxcap"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 10000, /datum/material/glass = 20000, /datum/material/plastic = 5000)
	build_path = /obj/item/advanced_crafting_components/flux
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/lenses
	name = "Focused crystal lenses"
	desc = "An advanced weapons part."
	id = "focusedlenses"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/glass = 50000, /datum/material/plastic = 3000)
	build_path = /obj/item/advanced_crafting_components/lenses
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/conductor
	name = "Superconductor coil"
	desc = "An advanced weapons part."
	id = "superconductor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000)
	build_path = /obj/item/advanced_crafting_components/conductors
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/receiver
	name = "Advanced modular receiver"
	desc = "An advanced weapons part."
	id = "advreceiver"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/titanium = 15000)
	build_path = /obj/item/advanced_crafting_components/receiver
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/assembly
	name = "Pre-war weapon assembly"
	desc = "An advanced weapons part."
	id = "preassembly"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/titanium = 15000, /datum/material/plastic = 5000)
	build_path = /obj/item/advanced_crafting_components/assembly
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/alloys
	name = "Superlight alloys"
	desc = "An advanced weapons part."
	id = "superalloys"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 15000, /datum/material/glass = 15000, /datum/material/titanium = 15000, /datum/material/plastic = 3000)
	build_path = /obj/item/advanced_crafting_components/alloys
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SCIENCE
