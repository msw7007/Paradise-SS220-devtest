#define COMSIG_MOB_REVIVED "mob_revived"
#define COMSIG_MOB_ADV_SCANNED "mob_adv_scanned"
#define COMSIG_MOB_CLONNED "mob_bio_scanned"
#define COMSIG_MOB_GET_OLD_DDS "mob_get_old_dds"
#define DD_THRESHOLD 60 SECONDS

/datum/component/death_debuff
	var/death_count = 0
	var/list/applied_debuffs = list()
	var/obj/item/organ/internal/brain/brain_item
	var/death_time = 0

/datum/component/death_debuff/Initialize()
	. = ..()
	brain_item = parent
	death_time = world.time

/datum/component/death_debuff/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOB_REVIVED, PROC_REF(apply_debuffs))
	RegisterSignal(parent, COMSIG_MOB_DEATH, PROC_REF(set_death_time))
	RegisterSignal(parent, COMSIG_BRAIN_UNDEBUFFED, PROC_REF(remove_debuff))
	RegisterSignal(parent, COMSIG_MOB_ADV_SCANNED, PROC_REF(brain_scan))
	RegisterSignal(parent, COMSIG_MOB_CLONNED, PROC_REF(clonning_transfer))
	RegisterSignal(parent, COMSIG_MOB_GET_OLD_DDS, PROC_REF(get_list))

/datum/component/death_debuff/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_MOB_REVIVED)
	UnregisterSignal(parent, COMSIG_MOB_DEATH)
	UnregisterSignal(parent, COMSIG_BRAIN_UNDEBUFFED)
	UnregisterSignal(parent, COMSIG_MOB_ADV_SCANNED)
	UnregisterSignal(parent, COMSIG_MOB_CLONNED)
	UnregisterSignal(parent, COMSIG_MOB_GET_OLD_DDS)

/datum/component/death_debuff/proc/clonning_transfer(obj/item/organ/internal/brain/new_brain, obj/item/organ/internal/brain/old_brain,)
	SIGNAL_HANDLER
	. = list()
	SEND_SIGNAL(old_brain, COMSIG_MOB_GET_OLD_DDS, .)
	applied_debuffs = .
	for(var/datum/death_debuff/debuff_selected in applied_debuffs)
		debuff_selected.apply_debuff(brain_item.owner, debuff_selected.state)

/datum/component/death_debuff/proc/get_list(obj/item/organ/internal/brain/source, list/income_list)
	income_list = applied_debuffs

/datum/component/death_debuff/proc/bio_scan(obj/item/organ/internal/brain/source, list/scan_list)
	SIGNAL_HANDLER
	for(var/datum/death_debuff/dd_check in applied_debuffs)
		scan_list += dd_check.name

/datum/component/death_debuff/proc/brain_scan(obj/item/organ/internal/brain/source, list/scan_list)
	SIGNAL_HANDLER
	for(var/datum/death_debuff/dd_check in applied_debuffs)
		scan_list += dd_check.get_adv_analyzer_info()

/datum/component/death_debuff/proc/set_death_time()
	SIGNAL_HANDLER
	death_time = world.time

/datum/component/death_debuff/proc/remove_debuff(obj/item/organ/internal/brain/component_holder, datum/death_debuff/debuff)
	SIGNAL_HANDLER
	applied_debuffs -= debuff

/datum/component/death_debuff/proc/apply_debuffs()
	SIGNAL_HANDLER
	if(world.time - death_time > DD_THRESHOLD)
		death_count += 1
	//Наложить случайный дебафф

	for(var/i in 1 to death_count)
		var/datum/death_debuff/debuff_selected = select_debuff()

		// Если найден подходящий дебафф, применяем его
		if(debuff_selected)
			debuff_selected.apply_debuff(brain_item.owner)
			applied_debuffs += debuff_selected

/datum/component/death_debuff/proc/select_debuff()
	var/dd_candidate = null
	var/list/available_debuffs = subtypesof(/datum/death_debuff) - applied_debuffs
	var/list/affected_zones = list()

	for(var/datum/death_debuff/dd_check in applied_debuffs)
		affected_zones += dd_check.affected_zone

	for(var/i in 1 to length(available_debuffs))
		var/datum/death_debuff/dd_check_candidate = pick(available_debuffs)
		if(dd_check_candidate.affected_zone in affected_zones)
			continue
		else
			dd_candidate = dd_check_candidate
			break

	if(!dd_candidate)
		dd_candidate = pick(available_debuffs)

	var/datum/death_debuff/debuff = new dd_candidate
	return debuff

/obj/item/organ/internal/brain/Initialize(mapload, datum/species/new_species)
	. = ..()
	AddComponent(/datum/component/death_debuff)

#undef DD_THRESHOLD

/mob/living/death(gibbed)
	. = ..()
	var/is_zombie = HAS_TRAIT(src, TRAIT_I_WANT_BRAINS)
	if(ishuman(src) && !is_zombie)
		var/obj/item/organ/internal/brain/brain_item = get_int_organ_tag("brain")
		SEND_SIGNAL(brain_item, COMSIG_MOB_DEATH)

/mob/living/update_revive()
	. = ..()
	var/is_zombie = HAS_TRAIT(src, TRAIT_I_WANT_BRAINS)
	if(ishuman(src) && !is_zombie)
		var/obj/item/organ/internal/brain/brain_item = get_int_organ_tag("brain")
		SEND_SIGNAL(brain_item, COMSIG_MOB_REVIVED)

/obj/item/healthanalyzer/attack(mob/living/M, mob/living/user)
	. = ..()
	var/is_zombie = HAS_TRAIT(src, TRAIT_I_WANT_BRAINS)
	if(ishuman(M) && !is_zombie)
		var/obj/item/organ/internal/brain/brain_item = M.get_int_organ_tag("brain")
		. = list()
		SEND_SIGNAL(brain_item, COMSIG_MOB_ADV_SCANNED, .)
		var/list/result = .
		to_chat(user, chat_box_healthscan(result.Join("<br>")))

/obj/machinery/clonepod/eject_clone(force = FALSE)
	var/datum/mind/patient_mind = locateUID(patient_data.mindUID)
	var/mob/living/carbon/human/original = locateUID(patient_mind.original_mob_UID)
	var/obj/item/organ/internal/brain/old_brain = original.get_int_organ_tag("brain")
	var/obj/item/organ/internal/brain/new_brain = clone.get_int_organ_tag("brain")
	SEND_SIGNAL(new_brain, COMSIG_MOB_GET_OLD_DDS, old_brain)
	. = ..()
