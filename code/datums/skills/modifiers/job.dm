/// Jobbie skill modifiers.

/datum/skill_modifier/job
	name = "Job Training"
	modifier_flags = MODIFIER_SKILL_VALUE|MODIFIER_SKILL_VIRTUE|MODIFIER_SKILL_ORIGIN_DIFF
	priority = MODIFIER_SKILL_PRIORITY_MAX


/datum/skill_modifier/job/affinity
	modifier_flags = MODIFIER_SKILL_AFFINITY|MODIFIER_SKILL_VIRTUE
	affinity_mod = STARTING_SKILL_AFFINITY_DEF_JOB

/// Level skill modifiers below.
/datum/skill_modifier/job/level
	modifier_flags = MODIFIER_SKILL_VALUE|MODIFIER_SKILL_LEVEL|MODIFIER_SKILL_VIRTUE|MODIFIER_SKILL_ORIGIN_DIFF
	level_mod = JOB_SKILL_TRAINED

/datum/skill_modifier/job/level/New(id, register = FALSE)
	if(level_mod)
		value_mod = GET_STANDARD_LVL(level_mod)
	..()
