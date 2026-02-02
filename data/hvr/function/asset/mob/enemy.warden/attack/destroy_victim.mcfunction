#> hvr:asset/mob/enemy.warden/attack/destroy_victim
#
# Deal deadly damage to victim
#
# @within function hvr:asset/mob/enemy.warden/attack/

# Remove armor
    attribute @s armor modifier add hvr:asset/mob.warden.destroy_victim.no_armor -1 add_multiplied_total
    attribute @s armor_toughness modifier add hvr:asset/mob.warden.destroy_victim.no_armor_toughness -1 add_multiplied_total

# Remove resistance
    effect clear @s resistance

# Deal damage
    damage @s 340282346638528860000000000000000000000 mob_attack by @n[type=warden,tag=hvr.this]

# Remove modifier
    attribute @s armor modifier remove hvr:asset/mob.warden.destroy_victim.no_armor
    attribute @s minecraft:armor_toughness modifier remove hvr:asset/mob.warden.destroy_victim.no_armor_toughness