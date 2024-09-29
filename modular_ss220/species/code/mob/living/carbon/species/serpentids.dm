#define SERPENTID_CHEM_REAGENT_ID "msg"

#define SERPENTID_CARAPACE_CHAMELION_STATE 5
#define SERPENTID_CARAPACE_NOPRESSURE_STATE 10

#define SERPENTID_GENE_DEGRADATION_DAMAGE 0.5
#define SERPENTID_GENE_DEGRADATION_CD 60

#define SERPENTID_HEAT_THRESHOLD_LEVEL_BASE 350
#define SERPENTID_HEAT_THRESHOLD_LEVEL_UP 50
#define SERPENTID_ARMORED_HEAT_THRESHOLD 380

#define SERPENTID_COLD_THRESHOLD_LEVEL_BASE 250
#define SERPENTID_COLD_THRESHOLD_LEVEL_DOWN 80
#define SERPENTID_ARMORED_COLD_THRESHOLD 70

#define GAS_ORGAN_CHEMISTRY_EYES 0.75
#define GAS_ORGAN_CHEMISTRY_EARS 0.25
#define GAS_ORGAN_CHEMISTRY_HEART 50
#define GAS_ORGAN_CHEMISTRY_LUNGS 1
#define GAS_ORGAN_CHEMISTRY_KIDNEYS 0.6

#define SERPENTID_CHEM_MULT_CONSUPTION 0.75
#define SERPENTID_CHEM_MULT_PRODUCTION 0.6

#define SERPENTID_EYES_LOW_VISIBLE_VALUE 0.5
#define SERPENTID_EYES_MAX_VISIBLE_VALUE 1

#define GAS_ORGAN_CHEMISTRY_MAX 100

#define SPIECES_BAN_HEADS_JOB (1<<12)

/datum/species
	var/disabilities = 0
	var/can_buckle = FALSE
	var/buckle_lying = TRUE
	var/eyes_icon = 'icons/mob/human_face.dmi'

/datum/species/serpentid
	name = "Giant Armored Serpentid"
	name_plural = "Serpentids"
	icobase = 'modular_ss220/species/icons/mob/human_races/r_serpentid.dmi'
	eyes_icon = 'modular_ss220/species/icons/mob/human_races/serpentid_eyes.dmi'
	blurb = "TODO"
	language = "Stok"
	siemens_coeff = 2.0
	stun_mod = 2
	armor = 10
	coldmod = 2
	heatmod = 4
	hunger_drain = 0.3

	species_traits = list(LIPS, NO_HAIR)
	inherent_traits = list(TRAIT_CHUNKYFINGERS, TRAIT_RESISTHEAT, TRAIT_RESISTHIGHPRESSURE, TRAIT_RESISTLOWPRESSURE, TRAIT_NOPAIN)
	inherent_biotypes = MOB_ORGANIC | MOB_HUMANOID | MOB_REPTILE
	dies_at_threshold = TRUE

	dietflags = DIET_CARN
	taste_sensitivity = TASTE_SENSITIVITY_SHARP
	allowed_consumed_mobs = list(/mob/living/simple_animal/mouse, /mob/living/simple_animal/lizard, /mob/living/simple_animal/chick, /mob/living/simple_animal/chicken,
								/mob/living/simple_animal/crab, /mob/living/simple_animal/butterfly, /mob/living/simple_animal/parrot, /mob/living/simple_animal/hostile/poison/bees)

	bodyflags = HAS_SKIN_COLOR | BALD | SHAVED
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	flesh_color = "#34AF10"
	base_color = "#066000"
	eyes = "serpentid_eyes_s"

	exotic_blood = "facid"
	blood_color = "#b0fc22"

	reagent_tag = PROCESS_ORG

	has_organ = list(
		"heart" =    /obj/item/organ/internal/heart/serpentid,
		"lungs" =    /obj/item/organ/internal/lungs/serpentid,
		"liver" =    /obj/item/organ/internal/liver/serpentid,
		"kidneys" =  /obj/item/organ/internal/kidneys/serpentid,
		"brain" =    /obj/item/organ/internal/brain/serpentid,
		"eyes" =     /obj/item/organ/internal/eyes/serpentid,
		"ears" =     /obj/item/organ/internal/ears/serpentid,
		//"l_hand" =  /obj/item/organ/internal/cyberimp/arm/toolset/serpentblade/l,
		//"r_hand" =  /obj/item/organ/internal/cyberimp/arm/toolset/serpentblade,
		"chest" =  /obj/item/organ/internal/cyberimp/chest/serpentid_blades,
		)

	has_limbs = list(
		"chest" =  list("path" = /obj/item/organ/external/chest/carapace, "descriptor" = "chest"),
		"groin" =  list("path" = /obj/item/organ/external/groin/carapace, "descriptor" = "groin"),
		"head" =   list("path" = /obj/item/organ/external/head/carapace, "descriptor" = "head"),
		"l_arm" =  list("path" = /obj/item/organ/external/arm/carapace, "descriptor" = "left arm"),
		"r_arm" =  list("path" = /obj/item/organ/external/arm/right/carapace, "descriptor" = "right arm"),
		"l_leg" =  list("path" = /obj/item/organ/external/leg/carapace, "descriptor" = "left leg"),
		"r_leg" =  list("path" = /obj/item/organ/external/leg/right/carapace, "descriptor" = "right leg"),
		"l_hand" = list("path" = /obj/item/organ/external/hand/carapace, "descriptor" = "left hand"),
		"r_hand" = list("path" = /obj/item/organ/external/hand/right/carapace, "descriptor" = "right hand"),
		"l_foot" = list("path" = /obj/item/organ/external/foot/carapace, "descriptor" = "left foot"),
		"r_foot" = list("path" = /obj/item/organ/external/foot/right/carapace, "descriptor" = "right foot"))


	suicide_messages = list(
		"is attempting to bite their tongue off!",
		"is jamming their claws into their eye sockets!",
		"is twisting their own neck!",
		"is holding their breath!")

	autohiss_basic_map = list(
			"s" = list("ss", "sss", "ssss")
		)
	autohiss_extra_map = list(
			"x" = list("ks", "kss", "ksss")
		)

	disabilities = SPIECES_BAN_HEADS_JOB
	can_buckle = TRUE
	buckle_lying = FALSE

	var/can_stealth = TRUE
	var/list/valid_limbs = list()
	var/gene_lastcall = 0
	var/cloak_engaged = FALSE

/datum/species/serpentid/handle_reagents(mob/living/carbon/human/H, datum/reagent/R)
	if (R.id == SERPENTID_CHEM_REAGENT_ID)
		return FALSE
	else
		return TRUE

/datum/species/serpentid/handle_life(mob/living/carbon/human/H)
	var/blood_percent = round((H.blood_volume / BLOOD_VOLUME_NORMAL)*100)
	speed_mod = (95 - blood_percent)/100

	var/armor_count = 0
	var/gene_degradation = 0
	for(var/obj/item/organ/external/limb in H.bodyparts)
		if (!(limb.type in valid_limbs))
			gene_degradation += SERPENTID_GENE_DEGRADATION_DAMAGE
		var/limb_armor = limb.damage
		armor_count += limb_armor

	if (gene_lastcall >= SERPENTID_GENE_DEGRADATION_CD)
		H.adjustCloneLoss(gene_degradation)
		gene_lastcall = 0
	else
		gene_lastcall += 1

	armor_count = armor_count/H.bodyparts.len
	if (armor_count <= SERPENTID_CARAPACE_CHAMELION_STATE)
		can_stealth = TRUE
	else
		can_stealth = FALSE

	var/up = SERPENTID_COLD_THRESHOLD_LEVEL_DOWN
	var/down = SERPENTID_COLD_THRESHOLD_LEVEL_DOWN
	var/cold = SERPENTID_COLD_THRESHOLD_LEVEL_BASE
	var/heat = SERPENTID_HEAT_THRESHOLD_LEVEL_BASE
	if (armor_count <= SERPENTID_CARAPACE_NOPRESSURE_STATE)
		hazard_high_pressure = 1000
		warning_high_pressure = 1000
		warning_low_pressure = -1
		hazard_low_pressure = -1
		cold = SERPENTID_ARMORED_COLD_THRESHOLD
		heat = SERPENTID_ARMORED_HEAT_THRESHOLD
	else
		hazard_high_pressure = HAZARD_HIGH_PRESSURE
		warning_high_pressure = WARNING_HIGH_PRESSURE
		warning_low_pressure = WARNING_LOW_PRESSURE
		hazard_low_pressure = HAZARD_LOW_PRESSURE
	cold_level_1 = cold
	cold_level_2 = cold_level_1 - down
	cold_level_3 = cold_level_2 - down
	heat_level_1 = heat
	heat_level_2 = heat_level_1 + up
	heat_level_3 = heat_level_2 + up

	if (can_stealth)
		sneak(H)

	. = ..()

/datum/species/serpentid/proc/sneak(mob/living/M) //look if a ghost gets this, its an admins problem
	if(((world.time - M.last_movement) >= 10 || M.move_speed >= 5)&& !M.stat && (M.mobility_flags & MOBILITY_STAND) && !M.restrained() && cloak_engaged)
		if(M.invisibility != INVISIBILITY_LEVEL_TWO)
			M.alpha -= 125
	else
		M.reset_visibility()
		M.alpha = 255
	if(M.alpha == 0)
		M.make_invisible()

/datum/species/serpentid/on_species_gain(mob/living/carbon/human/H)
	..()
	H.resize = 1
	H.can_buckle = can_buckle
	H.buckle_lying = buckle_lying
	H.update_transform()
	H.AddComponent(/datum/component/footstep, FOOTSTEP_MOB_SLIME, 1, -6)
	for (var/limb_name in has_limbs)
		valid_limbs += has_limbs[limb_name]["path"]

/datum/species/serpentid/can_equip(obj/item/I, slot, disable_warning = FALSE, mob/living/carbon/human/H)
	switch(slot)
		if(SLOT_HUD_SHOES)
			return FALSE
	. = .. ()

/mob/living/carbon/human/MouseDrop_T(atom/movable/AM, mob/user)
	var/datum/species/spiece = user.dna.species
	if((user.a_intent == "grab") && spiece.type == /datum/species/serpentid)
		if(user.incapacitated() || HAS_TRAIT(user, TRAIT_HANDS_BLOCKED) || get_dist(user, src) > 1)
			return

		if(!istype(AM))
			return

		load(AM)
		return TRUE
	. = .. ()

/datum/species/serpentid/grab(mob/living/carbon/human/user, mob/living/carbon/human/target, datum/martial_art/attacker_style)
	if (!isnull(user.loaded))
		user.unload(user.dir)
	. = .. ()

/datum/element/strippable/mouse_drop_onto(datum/source, atom/over, mob/user)
	var/mob/living/carbon/human/puppet = user
	var/datum/dna/genetic_info = user.dna
	var/datum/species/spiece = genetic_info.species
	if((user.a_intent == "grab") && spiece.type == /datum/species/serpentid)
		if(user.incapacitated() || HAS_TRAIT(user, TRAIT_HANDS_BLOCKED) || get_dist(user, source) > 1)
			return
		if(!istype(source))
			return
		puppet.load(source)
		return TRUE

	. = .. ()

/mob/living/carbon/human/proc/load(atom/movable/AM)
	if(loaded || AM.anchored || get_dist(src, AM) > 1)
		return

	//I'm sure someone will come along and ask why this is here... well people were dragging screen items onto the mule, and that was not cool.
	//So this is a simple fix that only allows a selection of item types to be considered. Further narrowing-down is below.
	if(!isitem(AM) && !ismachinery(AM) && !isstructure(AM) && !ismob(AM))
		return
	if(!isturf(AM.loc)) //To prevent the loading from stuff from someone's inventory or screen icons.
		return

	var/obj/structure/closet/crate/CRATE
	if(istype(AM,/obj/structure/closet/crate))
		CRATE = AM
		if(CRATE) // if it's a crate, close before loading
			CRATE.close()

	if(isobj(AM))
		var/obj/O = AM
		if(O.has_buckled_mobs() || (locate(/mob) in AM)) //can't load non crates objects with mobs buckled to it or inside it.
			return

	if(isliving(AM))
		if(!load_mob(AM))
			return
	else
		AM.crate_carrying_person = src
		AM.forceMoveCrate(src)

	loaded = AM
	update_icon()

/atom/movable/proc/forceMoveCrate(atom/destination)
	var/turf/old_loc = loc
	loc = destination.loc
	moving_diagonally = 0

	if(old_loc)
		old_loc.Exited(src, destination)
		for(var/atom/movable/AM in old_loc)
			AM.Uncrossed(src)

	if(destination)
		destination.Entered(src)
		for(var/atom/movable/AM in destination)
			if(AM == src)
				continue
			AM.Crossed(src, old_loc)
		var/turf/oldturf = get_turf(old_loc)
		var/turf/destturf = get_turf(destination)
		var/old_z = (oldturf ? oldturf.z : null)
		var/dest_z = (destturf ? destturf.z : null)
		if(old_z != dest_z)
			onTransitZ(old_z, dest_z)


	Moved(old_loc, NONE)

	return TRUE


/atom/movable/Move(atom/newloc, direct = 0, movetime)
	. = .. ()
	var/mob/living/carbon/human/puppet = src
	if(ishuman(puppet))
		if(!isnull(puppet.loaded))
			puppet.loaded.forceMoveCrate(puppet)

/atom/movable
	var/mob/living/carbon/human/crate_carrying_person = null

/mob/living/carbon/human/proc/load_mob(mob/living/M)
	can_buckle = TRUE
	if(buckle_mob(M))
		passenger = M
		loaded = M
		can_buckle = FALSE
		return TRUE
	return FALSE

/mob/living/carbon/human/post_buckle_mob(mob/living/M)
	.=..()
	M.pixel_y = initial(M.pixel_y) + 2
	M.layer = layer - 2

/mob/living/carbon/human/post_unbuckle_mob(mob/living/M)
	.=..()
	loaded = null
	passenger = null
	M.layer = initial(M.layer)
	M.pixel_y = initial(M.pixel_y)

/mob/living/carbon/human/proc/unload(dirn)
	if(!loaded)
		return

	unbuckle_all_mobs()

	if(loaded)
		loaded.forceMove(loc)
		loaded.pixel_y = initial(loaded.pixel_y)
		loaded.layer = initial(loaded.layer)
		loaded.plane = initial(loaded.plane)
		if(dirn)
			var/turf/T = loc
			var/turf/newT = get_step(T,dirn)
			if(loaded.CanPass(loaded,newT)) //Can't get off onto anything that wouldn't let you pass normally
				step(loaded, dirn)
		loaded.crate_carrying_person = null
		loaded = null

	update_icon(UPDATE_OVERLAYS)

/datum/job
	var/additional_restrictions = 0

/datum/job/captain/
	additional_restrictions = SPIECES_BAN_HEADS_JOB

/datum/job/New()
	. = .. ()
	blacklisted_disabilities += additional_restrictions

/datum/character_save/update_preview_icon(for_observer=0)
	. = .. ()
	var/datum/species/selected_specie = GLOB.all_species[species]
	var/user_selected_disabilities = disabilities & 0xFFF
	disabilities = user_selected_disabilities
	disabilities |= selected_specie.disabilities

	var/icon/face_s = new/icon("icon" = selected_specie.eyes_icon, "icon_state" = "bald_s")
	if(!(selected_specie.bodyflags & NO_EYES))
		var/icon/eyes_s = new/icon("icon" = selected_specie.eyes_icon, "icon_state" = selected_specie ? selected_specie.eyes : "eyes_s")
		eyes_s.Blend(e_colour, ICON_ADD)
		face_s.Blend(eyes_s, ICON_OVERLAY)

	preview_icon.Blend(face_s, ICON_OVERLAY)
	preview_icon_front = new(preview_icon, dir = SOUTH)
	preview_icon_side = new(preview_icon, dir = WEST)

/mob/living/carbon/human/serpentid/get_eyecon()
	var/obj/item/organ/internal/eyes/eyes = get_int_organ(/obj/item/organ/internal/eyes)
	if(istype(dna.species) && dna.species.eyes)
		var/icon/eyes_icon
		if(eyes)
			eyes_icon = eyes.generate_icon()
		else //Error 404: Eyes not found!
			eyes_icon = new('modular_ss220/species/icons/mob/human_races/serpentid_eyes.dmi', dna.species.eyes)
			eyes_icon.Blend("#800000", ICON_ADD)

		return eyes_icon
