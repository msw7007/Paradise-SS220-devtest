//Глаза - включают режим щитков, но очень уязвивым к вспышкам (в 2 раза сильнее молиных глаз)
/obj/item/organ/internal/eyes/serpentid
	name = "visual sensor"
	icon = 'modular_ss220/species/serpentids/icons/organs.dmi'
	desc = "A large looking eyes with some chemical enchanments."
	icon_state = "eyes01"
	see_in_dark = 0
	flash_protect = FLASH_PROTECTION_EXTRA_SENSITIVE
	tint = FLASH_PROTECTION_NONE
	var/chemical_id = SERPENTID_CHEM_REAGENT_ID
	var/decay_rate = 1
	var/decay_recovery = BASIC_RECOVER_VALUE
	var/organ_process_toxins = 0.35
	var/chemical_consuption = GAS_ORGAN_CHEMISTRY_EYES


/obj/item/organ/internal/eyes/serpentid/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/organ_decay, decay_rate, decay_recovery)
	AddComponent(/datum/component/organ_toxin_damage, organ_process_toxins)
	AddComponent(/datum/component/chemistry_organ, chemical_id)

//Прок на получение цвета глаз
/obj/item/organ/internal/eyes/serpentid/generate_icon(mob/living/carbon/human/HA)
	var/mob/living/carbon/human/H = HA
	if(!istype(H))
		H = owner
	var/icon/eyes_icon = new /icon(H.dna.species.eyes_icon, H.dna.species.eyes)
	eyes_icon.Blend(eye_color, ICON_ADD)

	return eyes_icon

/obj/item/organ/internal/eyes/serpentid/on_life()
	. = ..()
	if(!isnull(owner))
		var/mob/mob = owner
		mob.update_client_colour(time = 10)
	switch_mode()

/obj/item/organ/internal/eyes/serpentid/get_colourmatrix()
	var/chem_value = (owner.get_chemical_value(chemical_id) + GAS_ORGAN_CHEMISTRY_MAX/2)/GAS_ORGAN_CHEMISTRY_MAX
	var/vision_chem = clamp(chem_value, SERPENTID_EYES_LOW_VISIBLE_VALUE, SERPENTID_EYES_MAX_VISIBLE_VALUE)
	var/vision_concentration = (1 - vision_chem/SERPENTID_EYES_MAX_VISIBLE_VALUE)*SERPENTID_EYES_LOW_VISIBLE_VALUE

	var/k = 0.4
	vision_concentration = SERPENTID_EYES_LOW_VISIBLE_VALUE * (1 - chem_value**k)
	var/vision_adjust = clamp(vision_concentration, 0, SERPENTID_EYES_LOW_VISIBLE_VALUE/2)

	var/vision_matrix = list(vision_chem, vision_adjust, vision_adjust,\
		vision_adjust, vision_chem, vision_adjust,\
		vision_adjust, vision_adjust, vision_chem)
	return vision_matrix

/obj/item/organ/internal/eyes/serpentid/switch_mode(force_off = FALSE)
	.=..()
	if(!force_off && owner.get_chemical_value(chemical_id) >= chemical_consuption && !(status & ORGAN_DEAD))
		see_in_dark = 8
		chemical_consuption = GAS_ORGAN_CHEMISTRY_EYES + GAS_ORGAN_CHEMISTRY_EYES * (max_damage - damage / max_damage)
	else
		see_in_dark = 0
		chemical_consuption = 0
