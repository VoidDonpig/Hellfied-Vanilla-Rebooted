#> hvr:asset/mob/enemy.warden/tick/in_hostile
#
# In hostile tick
#
# @within function hvr:asset/mob/enemy.warden/tick/

# Sonic boom activation
    execute if data entity @s Brain.memories."minecraft:sonic_boom_sound_delay"{ttl:0L} run function hvr:asset/mob/enemy.warden/sonic_boom/double_check_process

# Destroy front block
    execute facing entity @n[type=#hvr:living,tag=hvr.target] eyes rotated ~ 0 run function hvr:asset/mob/enemy.warden/tick/destroy_front