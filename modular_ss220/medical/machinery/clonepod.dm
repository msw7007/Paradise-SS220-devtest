#define CHANCE_TO_CONTROL 100

// Функция для сообщения призракам о возможности взятия тела под управление
/obj/machinery/clonepod/proc/give_control_to_ghosts()
    var/list/candidates = SSghost_spawns.poll_candidates("Хотите взять под управление [clone.name]?", null, TRUE, source = /mob/living/simple_animal/hostile/poison/terror_spider)
    if (length(candidates) > 0) // Убедитесь, что есть кандидаты
        var/mob/candidate = pick_n_take(candidates)
        log_debug("[candidate] выбран для взятия клона под управление")
        clone.key = candidate.key
    else
        log_debug("Нет доступных кандидатов для взятия под управление")

//Ejects a clone. The force var ejects even if there's still clone damage.
/obj/machinery/clonepod/eject_clone(force = FALSE)
	if(!currently_cloning)
		return FALSE

	if(!clone && force)
		new /obj/effect/gibspawner/generic(get_turf(src), desired_data.genetic_info)
		playsound(loc, 'sound/effects/splat.ogg', 50, TRUE)
		reset_cloning()
		return TRUE

	if(!clone.cloneloss)
		clone.forceMove(loc)
		if (prob(CHANCE_TO_CONTROL))
			give_control_to_ghosts()
		//var/datum/mind/patient_mind = locateUID(patient_data.mindUID)
		//patient_mind.transfer_to(clone)
		//clone.grab_ghost()
		clone.update_revive()
		REMOVE_TRAIT(clone, TRAIT_NOFIRE, "cloning")
		to_chat(clone, "<span class='userdanger'>You remember nothing from the time that you were dead!</span>")
		to_chat(clone, "<span class='notice'>There's a bright flash of light, and you take your first breath once more.</span>")

		reset_cloning()
		return TRUE

	if(!force)
		return FALSE

	clone.forceMove(loc)
	new /obj/effect/gibspawner/generic(get_turf(src), clone.dna)
	playsound(loc, 'sound/effects/splat.ogg', 50, TRUE)

	if (prob(CHANCE_TO_CONTROL))
		give_control_to_ghosts()
	//var/datum/mind/patient_mind = locateUID(patient_data.mindUID)
	//patient_mind.transfer_to(clone)
	//clone.grab_ghost()
	clone.update_revive()
	REMOVE_TRAIT(clone, TRAIT_NOFIRE, "cloning")
	to_chat(clone, "<span class='userdanger'>You remember nothing from the time that you were dead!</span>")
	to_chat(clone, "<span class='danger'>You're ripped out of blissful oblivion! You feel like shit.</span>")

	reset_cloning()
	return TRUE

#undef CHANCE_TO_CONTROL
