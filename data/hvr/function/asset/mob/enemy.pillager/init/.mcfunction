#> hvr:asset/mob/enemy.pillager/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Captain buff
    execute if entity @s[predicate=hvr:is_captain] run function hvr:asset/mob/enemy.pillager/init/captain_buff

# Patrol Leader buff
    execute if entity @s[nbt={PatrolLeader:true}] run function hvr:asset/mob/enemy.pillager/init/patrol_leader_buff

# Provide specific enchantment
    function hvr:asset/mob/enemy.pillager/init/enchantment_provider/

# Override drop chance
    data modify entity @s drop_chances.mainhand set value 0.0f

# If raider, add tag
    execute if entity @s[predicate=hvr:has_raid] run tag @s add hvr.asset.mob.raider