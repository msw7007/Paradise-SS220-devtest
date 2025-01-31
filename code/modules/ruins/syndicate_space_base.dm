// SyndiChem
/obj/machinery/economy/vending/syndichem
	name = "\improper SyndiChem"
	desc = "A vending machine full of grenades and grenade accessories. Sponsored by DonkCo(tm)."
	req_access = list(ACCESS_SYNDICATE)
	products = list(/obj/item/stack/cable_coil/random = 5,
					/obj/item/assembly/igniter = 20,
					/obj/item/assembly/prox_sensor = 5,
					/obj/item/assembly/signaler = 5,
					/obj/item/assembly/timer = 5,
					/obj/item/assembly/voice = 5,
					/obj/item/assembly/health = 5,
					/obj/item/assembly/infra = 5,
					/obj/item/grenade/chem_grenade = 5,
					/obj/item/grenade/chem_grenade/large = 5,
					/obj/item/grenade/chem_grenade/pyro = 5,
					/obj/item/grenade/chem_grenade/cryo = 5,
					/obj/item/grenade/chem_grenade/adv_release = 5,
					/obj/item/reagent_containers/drinks/bottle/holywater = 1,
					/obj/item/pen/sleepy/undisguised = 1)
	slogan_list = list("Это не пиромания, если тебе платят!","Чувствуешь запах? Плазма, сынок. Больше ничто в мире так не пахнет.","Люблю запах плазмы по утрам.")
	resistance_flags = FIRE_PROOF

// Spawners
/obj/effect/mob_spawn/human/alive/spacebase_syndicate
	name = "Syndicate Researcher sleeper"
	mob_name = "Syndicate Researcher"
	roundstart = FALSE
	death = FALSE
	icon = 'icons/obj/cryogenic2.dmi'
	icon_state = "sleeper_s"
	important_info = "Do not work against traitors or nukies. Do not leave the base."
	description = "Experiment with deadly chems, plants, viruses, etc in peace."
	flavour_text = "You are a syndicate agent, employed in a top secret research facility developing biological weapons. Continue your research as best you can, and try to keep a low profile. Do not leave your base or let non-syndicate enter it."
	outfit = /datum/outfit/spacebase_syndicate
	assignedrole = "Syndicate Researcher"
	del_types = list() // Necessary to prevent del_types from removing radio!
	allow_species_pick = TRUE
	skin_tone = 2

/obj/effect/mob_spawn/human/alive/spacebase_syndicate/Destroy()
	var/obj/structure/fluff/empty_sleeper/syndicate/S = new /obj/structure/fluff/empty_sleeper/syndicate(get_turf(src))
	S.setDir(dir)
	return ..()

/datum/outfit/spacebase_syndicate
	name = "Syndicate Researcher"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/storage/labcoat
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	r_ear = /obj/item/radio/headset/syndicate/alt/nocommon // See del_types above
	back = /obj/item/storage/backpack
	belt = /obj/item/storage/belt/utility/syndi_researcher
	r_pocket = /obj/item/gun/projectile/automatic/pistol
	id = /obj/item/card/id/syndicate/researcher
	backpack_contents = list(
		/obj/item/ammo_box/magazine/m10mm = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/clothing/mask/gas/syndicate = 1,
		/obj/item/tank/internals/emergency_oxygen/engi/syndi = 1
	)

/datum/outfit/spacebase_syndicate/post_equip(mob/living/carbon/human/H)
	. = ..()
	H.faction |= "syndicate"
	var/random_name = random_name(pick(MALE,FEMALE), H.dna.species.name)
	H.rename_character(H.real_name, random_name)
	H.job = "Syndi Researcher" // ensures they show up right in player panel for admins
	if(isunathi(H) || isvulpkanin(H) || istajaran(H) || isskrell(H))
		H.change_skin_color("#B2B2B2")
	if(ismoth(H))
		H.change_markings("White Fly Head Markings", "head")
		H.change_markings("White Fly Markings", "body")
		H.change_head_accessory("White Fly Antennae")
		H.change_body_accessory("White Fly Wings")
