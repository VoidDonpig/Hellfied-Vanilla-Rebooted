#> hvr:asset/mob/enemy.witch/tick/raider_action/give_buff
#
# Give substantial buff to raiders
#
# @within function hvr:asset/mob/enemy.witch/tick/raider_action/

# Give effect
    data modify storage hvr:api __input__.id set value "witch_raider_effect"
    data modify storage hvr:api __input__.duration set value 6000
    data modify storage hvr:api __input__.level set value 1
    data modify storage hvr:api __input__.duration_operation set value "force"
    data modify storage hvr:api __input__.level_operation set value "force"
    function hvr:api/effect/give

# Give instant regen
    effect give @s regeneration 300 4 false
    effect give @s resistance 300 3 false

# SFX
    execute anchored eyes positioned ^ ^ ^ run playsound block.trial_spawner.ominous_activate hostile @a[distance=..16] ~ ~ ~ 2 1.4
    execute anchored eyes positioned ^ ^ ^ run particle dragon_breath ~ ~ ~ 0.0 0.0 0.0 0.3 20

# Add given tag
    tag @s add hvr.asset.mob.raider.already_given_witch_buff