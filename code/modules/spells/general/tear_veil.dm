/datum/spell/tear_veil
	name = "Tear Veil"
	desc = "Use your mental strength to literally tear a hole from this dimension to the next, letting things through..."

	charge_max = 300
	spell_flags = Z2NOCAST
	invocation = "none"
	invocation_type = INVOKE_NONE

	number_of_channels = 0
	time_between_channels = 200
	hud_state = "const_floor"
	cast_sound = 'sound/effects/meteorimpact.ogg'
	var/list/possible_spawns = list(
		/mob/living/simple_animal/hostile/scarybat/cult,
		/mob/living/simple_animal/hostile/creature/cult,
		/mob/living/simple_animal/hostile/faithless/cult
		)

	spell_cost = 5
	mana_cost = 35

/datum/spell/tear_veil/choose_targets(mob/user = usr)
	var/turf/T = get_turf(holder)
	holder.visible_message("<span class='notice'>A strange portal rips open underneath \the [holder]!</span>")
	var/obj/effect/gateway/hole = new(get_turf(T))
	hole.density = FALSE
	perform(user, list(hole))

/datum/spell/tear_veil/cast(list/targets, mob/holder, channel_count)
	if(channel_count == 1)
		return
	var/type = pick(possible_spawns)
	var/mob/living/L = new type(get_turf(targets[1]))
	L.faction = holder.faction
	L.visible_message("<span class='warning'>\A [L] escapes from the portal!</span>")

/datum/spell/tear_veil/after_spell(var/list/targets)
	qdel(targets[1])
	return
