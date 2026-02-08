#> hvr:asset/mob/enemy.witch/init/raid_init
#
# Raid init
#
# @within function hvr:asset/mob/enemy.witch/init/

# Provide significantly strong buff
    effect give @s regeneration infinite 3 false
    effect give @s resistance infinite 2 true

# Additional armor point and KB resistance
    attribute @s armor modifier add hvr:asset/mob/enemy.witch.armor.raid_buff 4 add_value
    attribute @s knockback_resistance modifier add hvr:asset/mob/enemy.witch.knockback_resistance.raid_buff 0.73 add_value

# Immune to fall damage
    attribute @s fall_damage_multiplier modifier add hvr:asset/mob/enemy.witch.fall_damage_multiplider.raid_buff -1 add_multiplied_total

# Add raider tag
    tag @s add hvr.asset.mob.raider
