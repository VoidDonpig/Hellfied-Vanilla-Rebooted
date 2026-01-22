#> vr:asset/mob/warden/sonic_boom/damage
#
# Deal ton of damage
#
# @within function hvr:asset/mob/warden/sonic_boom/for_until_reach

# Remove armor
    attribute @s armor modifier add hvr:asset/mob.warden.sonic_boom.no_armor -1 add_multiplied_total
    attribute @s armor_toughness modifier add hvr:asset/mob.warden.sonic_boom.no_armor_toughness -1 add_multiplied_total

# Remove resistance
    effect clear @s resistance

# Damage
    damage @s 340282346638528860000000000000000000000 sonic_boom by @n[type=warden,tag=hvr.this]

# Remove modifier
    attribute @s armor modifier remove hvr:asset/mob.warden.sonic_boom.no_armor
    attribute @s minecraft:armor_toughness modifier remove hvr:asset/mob.warden.sonic_boom.no_armor_toughness