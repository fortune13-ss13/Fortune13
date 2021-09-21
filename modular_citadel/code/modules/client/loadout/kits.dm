///Item boxes for custom loadouts transferred from Legacy.

/obj/item/storage/box/large/custom_kit
	name = "Custom Loadout"
	desc = "Your custom loadout items!"
	w_class = WEIGHT_CLASS_BULKY

//Crimson - Rigbe
/obj/item/storage/box/large/custom_kit/crimson/PopulateContents()
	new /obj/item/clothing/mask/bandana/skull(src)
	new /obj/item/clothing/glasses/sunglasses/big(src)

//Tumbledown - SpaceAnglo
/obj/item/storage/box/large/custom_kit/tumbledown/PopulateContents()
	new /obj/item/clothing/head/helmet/f13/remnant/intel(src)
	new /obj/item/clothing/under/f13/enclave/intel(src)
	new /obj/item/clothing/accessory/ncr/SPC(src)
