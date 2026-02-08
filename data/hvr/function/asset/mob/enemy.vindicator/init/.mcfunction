#> hvr:asset/mob/enemy.vindicator/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Force enchant axe
    function hvr:asset/mob/enemy.vindicator/init/enchantment_provider/

# Additional Attack Damage
    attribute @s attack_damage modifier add hvr:asset/mob/enemy.vindicator.attack_damage.spawn_modifier 0.2 add_multiplied_total

# If raider, add tag
    execute if entity @s[predicate=hvr:has_raid] run tag @s add hvr.asset.mob.raider