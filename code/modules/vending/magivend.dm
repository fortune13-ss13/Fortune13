/obj/machinery/vending/magivend
	name = "\improper MagiVend"
	desc = "A magic vending machine."
	icon_state = "MagiVend"
	product_slogans = "Sling spells the proper way with MagiVend!;Be your own Houdini! Use MagiVend!"
	vend_reply = "Have an enchanted evening!"
	product_ads = "EI NATH;Destroy the station!;Admin conspiracies since forever!;Space-time bending hardware!;Now-magic proofing venders!"
	products = list(/obj/item/clothing/head/wizard = 1,
					/obj/item/clothing/suit/wizrobe = 1,
					/obj/item/clothing/head/wizard/red = 1,
					/obj/item/clothing/suit/wizrobe/red = 1,
					/obj/item/clothing/head/wizard/yellow = 1,
					/obj/item/clothing/suit/wizrobe/yellow = 1,
					/obj/item/clothing/shoes/sandal/magic = 1,
					/obj/item/staff = 2)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50, "magic" = 100)
	resistance_flags = FIRE_PROOF
	default_price = PRICE_EXPENSIVE
	extra_price = PRICE_ABOVE_EXPENSIVE
	payment_department = ACCOUNT_SRV
