//Mantles

/obj/item/clothing/neck/mantle
	name = "mantle template"
	desc = " worn over the shoulders, no hood, decorative."
	icon = 'icons/fallout/clothing/mantle.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/mantles.dmi'
	w_class = WEIGHT_CLASS_SMALL
	body_parts_covered = CHEST|ARMS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	min_cold_protection_temperature = ARMOR_MIN_TEMP_PROTECT
	heat_protection = null
	cold_protection = null
	permeability_coefficient = 0.9

/obj/item/clothing/neck/cloak/suicide_act(mob/user)
	user.visible_message("<span class='suicide'>[user] is strangling [user.p_them()]self with [src]! It looks like [user.p_theyre()] trying to commit suicide!</span>")
	return(OXYLOSS)

/obj/item/clothing/neck/mantle/gecko
	name = "gecko skin mantle"
	desc = "Made from tanned young gecko hides, too thin to be useful for armor. The small claws are still attached."
	icon_state = "gecko"

/obj/item/clothing/neck/mantle/gray
	name = "plain gray mantle"
	desc = "A simple mantle to cover your shoulders with."
	icon_state = "gray"

/obj/item/clothing/neck/mantle/brown
	name = "plain brown mantle"
	desc = "A simple mantle to cover your shoulders with."
	icon_state = "brown"

/obj/item/clothing/neck/mantle/overseer
	name = "vault-tec overseers mantle"
	desc = "This is the overseers mantle.  Issued by the Vault-tec corporation to easily identify the overseer. This mantle has been passed down from overseer to overseer"
	icon_state = "overseer"

/obj/item/clothing/neck/mantle/bos
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_l"

/obj/item/clothing/neck/mantle/bos/left
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_l"

/obj/item/clothing/neck/mantle/bos/right
	name = "Brotherhood of Steel shoulder cape"
	desc = "Issued to the Elders of the Brotherhood. Style over substance is important. This one is designed to be worn over the shoulder."
	icon_state = "bosshouldercape_r"

/obj/item/clothing/neck/mantle/bos/paladin
	name = "Paladin cape"
	desc = "This stylish deep crimson cape is made to be worn below a power armor pauldron, a shoulder holster is added for utility."
	icon_state = "paladin"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bos/paladin

/obj/item/clothing/neck/mantle/ranger
	name = "NCR ranger cape"
	desc = "Ranger cape made from what looks like old poncho fitted with star, stripes and a bear. Most likely has a holster hidden underneath."
	icon_state = "rangercape"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/bos/paladin

/obj/item/clothing/neck/mantle/chief
	name = "chieftains mantle"
	desc = "A symbol of the authority of the Wayfarer Chief."
	icon_state = "tribechief"

/obj/item/clothing/neck/mantle/jay
	name = "blue silk mantle"
	desc = "A finely woven and blue dyed mantle, with the emblem of a bird on its back."
	icon_state = "jay"

/obj/item/clothing/neck/mantle/enclavecommander
	name = "commanders mantle"
	desc = "A fine mantle marking the wearer as a Commander of the Enclave."
	icon_state = "commander"

/obj/item/clothing/neck/mantle/treasurer
	name = "treasurers mantle"
	desc = "The grey and black mantle with gold thread trimming shows the wearer is entrusted with matters of money and records. Hidden inner pockets can store money bags and keys safely, and a discrete sheath for a knife for self defence is also attached."
	icon_state = "treasurer"
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/treasurer

/obj/item/clothing/neck/mantle/peltfur
	name = "fur pelt"
	desc = "A pelt made from longhorner fur."
	icon_state = "peltfur"
	cold_protection = = CHEST|GROIN|ARMS
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)¨

/obj/item/clothing/neck/mantle/peltmountain
	name = "fur pelt"
	desc = "A pelt made from a mountain bear, brought in from Colorado."
	icon_state = "peltmountain"
	cold_protection = CHEST|GROIN|ARMS
	armor = list("melee" = 5, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)¨

/obj/item/clothing/neck/mantle/ragged
	name = "ragged mantle"
	desc = "A worn and ripped old primitive mantle, made from sinew and bone."
	icon_state = "ragged"

/obj/item/clothing/neck/mantle/poncho
	name = "poncho"
	desc = "Plain and rugged piece of clothing, to make sure your gear don't get soaked through when it rains."
	icon_state = "poncho"
	body_parts_covered = CHEST|GROIN|ARMS

/obj/item/clothing/neck/mantle/rangerponcho
	name = "ranger poncho"
	desc = "Well made poncho, though it's starting to fray at the edges a little from heavy use."
	icon_state = "rangerponcho"
	body_parts_covered = CHEST|GROIN|ARMS

// Aprons	Specialized pockets, small environmental bonus for some
/obj/item/clothing/neck/apron
	name = "apron template"
	icon = 'icons/fallout/clothing/mantle.dmi'
	mob_overlay_icon = 'icons/fallout/onmob/clothing/mantles.dmi'
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
