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

//Courier of Hope - KingFriesV3
/obj/item/storage/box/large/custom_kit/courier/PopulateContents()
	new /obj/item/clothing/under/f13/exile/tribal(src)
	new /obj/item/clothing/head/kitty(src)
	new /obj/item/clothing/gloves/f13/blacksmith(src)

//Emelly Fries - KingFriesV3
/obj/item/storage/box/large/custom_kit/emelly/PopulateContents()
	new /obj/item/clothing/under/f13/bos/bodysuit(src)
	new /obj/item/clothing/accessory/bos/knightcaptain(src)
