/obj/item/clothing/suit/v_jacket
	name = "куртка V"
	desc = "Куртка так называемого V."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "v_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/takemura_jacket
	name = "куртка Такэмуры"
	desc = "Куртка так называемого Такэмуры."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "takemura_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/katarina_jacket
	name = "куртка Катарины"
	desc = "Куртка так называемой Катарины."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "katarina_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/katarina_cyberjacket
	name = "киберкуртка Катарины"
	desc = "Кибер-куртка так называемой Катарины."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "katarina_cyberjacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	flags_inv = HIDEJUMPSUIT

/obj/item/clothing/suit/hooded/shark_costume
	name = "костюм акулы"
	desc = "Костюм из 'синтетической' кожи акулы, пахнет."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "shark_casual"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	allowed = list(/obj/item/tank/internals/emergency_oxygen)
	hoodtype = /obj/item/clothing/head/hooded/shark_hood

/obj/item/clothing/head/hooded/shark_hood
	name = "акулий капюшон"
	desc = "Капюшон, прикрепленный к костюму акулы."
	icon = 'modular_ss220/clothing/icons/object/hats.dmi'
	icon_state = "shark_casual"
	icon_override = 'modular_ss220/clothing/icons/mob/hats.dmi'
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags = BLOCKHAIR
	flags_inv = HIDEEARS

/obj/item/clothing/suit/hooded/shark_costume/light
	name = "светло-голубой костюм акулы"
	icon_state = "shark_casual_light"
	hoodtype = /obj/item/clothing/head/hooded/shark_hood/light

/obj/item/clothing/head/hooded/shark_hood/light
	name = "светло-голубой акулий капюшон"
	icon_state = "shark_casual_light"

/obj/item/clothing/suit/space/deathsquad/officer/syndie
	name = "куртка офицера синдиката"
	desc = "Длинная куртка из высокопрочного волокна."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "jacket_syndie"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'

/obj/item/clothing/suit/space/deathsquad/officer/field
	name = "полевая форма офицера флота Нанотрейзен"
	desc = "Парадный плащ, разработанный в качестве массового варианта формы Верховного Главнокомандующего. У этой униформы нет тех же защитных свойств, что и у оригинала, но она все ещё является довольно удобным и стильным предметом гардероба."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "ntsc_uniform"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'

/obj/item/clothing/suit/space/deathsquad/officer/field/cloak_nt
	name = "армированная мантия офицера флота Нанотрейзен"
	desc = "Один из вариантов торжественного одеяния сотрудников Верховного Командования Нанотрейзен, подойдет для официальной встречи или важного вылета. Сшита из лёгкой и сверхпрочной ткани."
	icon = 'modular_ss220/clothing/icons/object/cloaks.dmi'
	icon_state = "ntsc_cloak"
	icon_override = 'modular_ss220/clothing/icons/mob/cloaks.dmi'

/obj/item/clothing/suit/space/deathsquad/officer/field/cloak_nt/coat_nt
	name = "полевой плащ офицера флота Нанотрейзен"
	desc = "Парадный плащ нового образца, внедряемый на объектах компании в последнее время. Отличительной чертой является стоячий воротник и резаный подол. Невысокие показатели защиты нивелируются пафосом, источаемым этим плащом."
	icon_state = "ntsc_coat"

/obj/item/clothing/suit/hooded/vi_arcane
	name = "куртка Вай"
	desc = "Слегка потрёпанный жакет боевой девчушки Вай."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "vi_arcane"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'
	flags_inv = HIDEJUMPSUIT
	hoodtype = /obj/item/clothing/head/hooded/vi_arcane

/obj/item/clothing/head/hooded/vi_arcane
	name = "капюшон Вай"
	desc = "Капюшон, прикреплённый к жакету Вай."
	icon = 'modular_ss220/clothing/icons/object/hats.dmi'
	icon_state = "vi_arcane"
	icon_override = 'modular_ss220/clothing/icons/mob/hats.dmi'
	body_parts_covered = HEAD
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	flags = BLOCKHAIR
	flags_inv = HIDEEARS

/obj/item/clothing/suit/hooded/vi_arcane
	name = "жакет Вай"
	icon_state = "vi_arcane"
	hoodtype = /obj/item/clothing/head/hooded/vi_arcane

/obj/item/clothing/head/hooded/vi_arcane
	name = "капюшон Вай"
	icon_state = "vi_arcane"

/obj/item/clothing/suit/storage/soundhand_white_jacket
	name = "серебристая куртка группы Саундхэнд"
	desc = "Редкая серебристая куртка Саундхэнд. Ограниченная серия."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_white_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_white_jacket/tag
	name = "куртка Арии"
	desc = "Редкая серебристая куртка Арии Вильвен, основательницы Саундхэнд."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_white_jacket_teg"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	item_state = "soundhand_white_jacket"
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_black_jacket
	name = "фанатская черная куртка Саундхэнд"
	desc = "Черная куртка группы Саундхэнд, исполненая в духе оригинала, но без логотипа на спине. С любовью для фанатов."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_black_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_black_jacket/tag
	name = "черная куртка Саундхэнд"
	desc = "Черная куртка с тэгом группы Саундхэнд, которую носят исполнители группы."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_black_jacket_teg"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	item_state = "soundhand_black_jacket"
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_olive_jacket
	name = "фанатская оливковая куртка Саундхэнд"
	desc = "Оливковая куртка гурппы Саундхэнд, исполненая в духе оригинала, но без логотипа на спине. С любовью для фанатов."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_olive_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_olive_jacket/tag
	name = "оливковая куртка с тэгом группы Саундхэнд"
	desc = "Оливковая куртка с тэгом группы Саундхэнд, которую носят исполнители группы."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_olive_jacket_teg"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	item_state = "soundhand_olive_jacket"
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_brown_jacket
	name = "фанатская коричневая куртка Саундхэнд"
	desc = "Коричневая куртка Саундхэнд, исполненая в духе оригинала, но без логотипа на спине. С любовью для фанатов."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_brown_jacket"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/obj/item/clothing/suit/storage/soundhand_brown_jacket/tag
	name = "коричневая куртка с тэгом Саундхэнд"
	desc = "Коричневая куртка с тэгом группы Саундхэнд, которую носят исполнители группы."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "soundhand_brown_jacket_teg"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	item_state = "soundhand_brown_jacket"
	lefthand_file = 'modular_ss220/clothing/icons/inhands/left_hand.dmi'
	righthand_file = 'modular_ss220/clothing/icons/inhands/right_hand.dmi'

/datum/supply_packs/misc/soundhand_fan
	name = "Soundhand Fan Crate"
	contains = list(/obj/item/clothing/suit/storage/soundhand_black_jacket,
					/obj/item/clothing/suit/storage/soundhand_black_jacket,
					/obj/item/clothing/suit/storage/soundhand_olive_jacket,
					/obj/item/clothing/suit/storage/soundhand_olive_jacket,
					/obj/item/clothing/suit/storage/soundhand_brown_jacket,
					/obj/item/clothing/suit/storage/soundhand_brown_jacket,
					/obj/item/clothing/suit/storage/soundhand_white_jacket)
	cost = 1500
	containername = "soundhand Fan crate"

/obj/item/clothing/suit/chef/red
	name = "chef's red apron"
	desc = "Хорошо скроенный поварской китель."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "chef_red"
	sprite_sheets = list(
		"Abductor" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Ancient Skeleton" 	= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Diona" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Drask" 			= 	'modular_ss220/clothing/icons/mob/species/drask/suits.dmi',
		"Golem" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Grey" 				= 	'modular_ss220/clothing/icons/mob/species/grey/suits.dmi',
		"Human" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Kidan" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Machine"			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Monkey" 			= 	'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		"Nian" 				= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Plasmaman" 		= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Shadow" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Skrell" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Slime People" 		= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Tajaran" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Unathi" 			= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Vox" 				= 	'modular_ss220/clothing/icons/mob/species/vox/suits.dmi',
		"Vulpkanin" 		= 	'modular_ss220/clothing/icons/mob/suits.dmi',
		"Nucleation"		=	'modular_ss220/clothing/icons/mob/suits.dmi',
		)

/datum/supply_packs/misc/soundhand
	name = "Soundhand Fan Crate"
	contains = list(/obj/item/clothing/suit/storage/soundhand_black_jacket,
					/obj/item/clothing/suit/storage/soundhand_olive_jacket,
					/obj/item/clothing/suit/storage/soundhand_brown_jacket)
	cost = 600
	containername = "soundhand fan crate"

/* Space Battle */
/obj/item/clothing/suit/space/hardsuit/security
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_state = "hardsuit-sec-old"
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'

/obj/item/clothing/head/helmet/space/hardsuit/security
	icon = 'modular_ss220/clothing/icons/object/helmet.dmi'
	icon_state = "hardsuit0-sec"
	icon_override = 'modular_ss220/clothing/icons/mob/helmet.dmi'

/* SOO jacket */
/obj/item/clothing/suit/space/deathsquad/officer/soo_brown
	icon_state = "brtrenchcoat_open"

/obj/item/clothing/suit/storage/browntrenchcoat
	name = "старое коричневое пальто"
	desc = "Поношенное пальто старого фасона."
	icon = 'modular_ss220/clothing/icons/object/suits.dmi'
	icon_override = 'modular_ss220/clothing/icons/mob/suits.dmi'
	icon_state = "brtrenchcoat"
	item_state = "brtrenchcoat"

	sprite_sheets = list(
		SPECIES_PLASMAMAN = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		SPECIES_VOX = 'modular_ss220/clothing/icons/mob/species/vox/suits.dmi',
		SPECIES_MONKEY = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		SPECIES_FARWA = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		SPECIES_WOLPIN = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		SPECIES_NEARA = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi',
		SPECIES_STOK = 'modular_ss220/clothing/icons/mob/species/monkey/suits.dmi'
		)
