/datum/spell/targeted/equip_item/dyrnwyn
	name = "Summon Dyrnwyn"
	desc = "Summons the legendary sword of Rhydderch Hael, said to draw in flame when held by a worthy man."
	charge_type = SPELL_HOLDVAR
	holder_var_type = "fireloss"
	holder_var_amount = 10
	invocation = "Anrhydeddu Fi!"
	invocation_type = INVOKE_SHOUT
	spell_flags = INCLUDEUSER
	range = -1
	level_max = list(UPGRADE_TOTAL = 1, UPGRADE_SPEED = 0, UPGRADE_POWER = 1)
	duration = 300 //30 seconds
	max_targets = 1
	equipped_summons = list("active hand" = /obj/item/material/sword)
	delete_old = 0
	var/material = MATERIAL_GOLD

	hud_state = "gen_immolate"


/datum/spell/targeted/equip_item/dyrnwyn/summon_item(new_type)
	var/obj/item/W = new new_type (null, material)
	W.SetName("\improper Dyrnwyn")
	W.damtype = BURN
	W.hitsound = 'sound/items/welder2.ogg'
	W.slowdown_per_slot[slot_l_hand] = 1
	W.slowdown_per_slot[slot_r_hand] = 1
	return W

/datum/spell/targeted/equip_item/dyrnwyn/ImproveSpellPower()
	if(!..())
		return 0

	material = MATERIAL_SILVER
	return "Dyrnwyn has been made pure: it is now made of silver."
