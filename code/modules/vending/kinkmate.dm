/obj/machinery/vending/kink
	name = "KinkMate"
	desc = "A vending machine for all your unmentionable desires."
	icon_state = "kink"
	circuit = /obj/item/circuitboard/machine/kinkmate
	product_slogans = "Kinky!;Sexy!;Check me out, big boy!"
	vend_reply = "Have fun, you shameless pervert!"
	products = list(
				/obj/item/clothing/head/maid = 1,
				/obj/item/clothing/neck/petcollar/choker = 1,
				/obj/item/restraints/handcuffs/fake/kinky = 2,
				/obj/item/clothing/glasses/sunglasses/blindfold = 1,
				/obj/item/clothing/mask/muzzle = 1,
				/obj/item/clothing/under/misc/stripper = 3,
				/obj/item/clothing/under/misc/stripper/green = 3,
				/obj/item/clothing/under/misc/gear_harness = 1,
				/obj/item/dildo/custom = 2,
				/obj/item/clothing/under/shorts/polychromic/pantsu = 1,
				/obj/item/clothing/under/misc/poly_bottomless = 1,
				/obj/item/clothing/under/misc/poly_tanktop = 1,
				/obj/item/clothing/under/misc/poly_tanktop/female = 1,
				)
	contraband = list(
				/obj/item/clothing/neck/petcollar/locked = 1,
				/obj/item/key/collar = 1,
				/obj/item/clothing/under/misc/keyholesweater = 1,
				/obj/item/clothing/under/misc/stripper/mankini = 1,
				/obj/item/dildo/flared/huge = 1
				)
	premium = list(
				/obj/item/clothing/accessory/skullcodpiece/fake = 1,
				)
	default_price = PRICE_CHEAP
	extra_price = PRICE_BELOW_NORMAL
	payment_department = NO_FREEBIES
