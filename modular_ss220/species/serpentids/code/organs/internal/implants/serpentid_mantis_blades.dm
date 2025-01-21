// ============ Органы внешние ============
/obj/item/kitchen/knife/combat/serpentblade
	name = "serpentid mantis blade"
	icon = 'modular_ss220/species/serpentids/icons/organs.dmi'
	icon_state = "left_blade"
	lefthand_file = null
	righthand_file = null
	desc = "Biological melee weapon. Sharp and durable. It can cut off some heads, or maybe not..."
	origin_tech = null
	force = 11
	armour_penetration_flat = 20
	tool_behaviour = TOOL_SAW
	new_attack_chain = TRUE
	var/obj/item/organ/internal/cyberimp/chest/serpentid_blades/parent_blade_implant

/obj/item/kitchen/knife/combat/serpentblade/Initialize(mapload)
	. = ..()
	ADD_TRAIT(src, TRAIT_ADVANCED_SURGICAL, ROUNDSTART_TRAIT)
	AddComponent(/datum/component/forces_doors_open)
	AddComponent(/datum/component/parry, _stamina_constant = 2, _stamina_coefficient = 0.5, _parryable_attack_types = NON_PROJECTILE_ATTACKS)
	AddComponent(/datum/component/double_attack)

/obj/item/kitchen/knife/combat/serpentblade/equipped(mob/user, slot, initial)
	. = ..()
	var/mob/living/carbon/human/owner = loc
	if(ishuman(owner))
		if(IS_CHANGELING(owner) && force == 11)
			force = 7
			armour_penetration_flat = 10
