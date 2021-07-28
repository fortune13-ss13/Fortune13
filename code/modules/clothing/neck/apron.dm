// Aprons	Specialized pockets, small environmental bonus for some
/obj/item/clothing/neck/apron
	name = "apron template"
	icon = 'icons/fallout/clothing/aprons.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/apron.dmi'
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|GROIN|LEGS
	permeability_coefficient = 0.9
	pocket_storage_component_path = null

/obj/item/clothing/neck/apron/bartender
	name = "bartenders apron"
	desc = "A fancy purple apron for a stylish person."
	icon_state = "apronbartender"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bartender

/obj/item/clothing/neck/apron/medicus
	name = "medicus apron"
	desc = "The waxed cotton apron of a Medicus, marked with a red bull insignia."
	icon_state = "apronmedicus"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/medical
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 20, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/apron/surgical
	name = "surgical apron"
	desc = "A sterile blue surgical apron."
	icon_state = "apronsurgical"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/medical
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 20, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/apron/chef
	name = "chefs apron"
	desc = "A white apron for kitchenwork."
	icon_state = "apronchef"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/kitchen

/obj/item/clothing/neck/apron/labor
	name = "black apron"
	desc = "A dark apron for manual labor."
	icon_state = "apronblack"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/crafter

/obj/item/clothing/neck/apron/labor/forge
	name = "forgemasters apron"
	desc = "A heavy leather apron designed for protecting the user when metalforging. The bull insignia marks the wearer as a Forgemaster."
	icon_state = "apronforge"
	heat_protection = CHEST|GROIN|LEGS
	max_heat_protection_temperature = GLOVES_MAX_TEMP_PROTECT
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/crafter
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 20, "acid" = 0)

/obj/item/clothing/neck/apron/50sapron
	name = "50s housewife apron"
	desc = "A cutesy pink checkerboard apron. The pattern is copied from ancient commercial billboards."
	icon_state = "apron50s"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/kitchen

/*
Obsolete
/obj/item/clothing/neck/cloak

/obj/item/clothing/suit/poncho
	name = "poncho"
	desc = "(I) Your classic, non-racist poncho."
	icon_state = "classicponcho"
	item_state = "classicponcho"
	permeability_coefficient = 0.8

/obj/item/clothing/suit/poncho/green
	name = "green poncho"
	desc = "(I) Your classic, non-racist poncho. This one is green."
	icon_state = "greenponcho"
	item_state = "greenponcho"

/obj/item/clothing/suit/poncho/red
	name = "red poncho"
	desc = "(I) Your classic, non-racist poncho. This one is red."
	icon_state = "redponcho"
	item_state = "redponcho"
*/
