#> hvr:entity_manager/mob/enemy/searching_ai/activate
#
# Activate searching ai
#
# @within function hvr:entity_manager/mob/enemy/searching_ai/tick

# Summon AI
    summon zombified_piglin ~ ~ ~ {Invulnerable:true,Silent:true,PersistenceRequired:true,Tags:[hvr.enemy_searching_ai,hvr.enemy_searching_ai.need_init,hvr.no_process,hvr.autokill,hvr.no_vehicle_kill],attributes:[{id:"scale",base:0.0625d,modifiers:[{id:"hvr:entity_manager/mob/enemy/searching_ai.scale",operation:"add_multiplied_total",amount:-1d}]},{id:"follow_range",base:64d},{id:"attack_damage",base:0d}],active_effects:[{id:"invisibility",amplifier:255,duration:-1,show_particles:false},{id:"resistance",amplifier:255,duration:-1,show_particles:false}]}

# Make dismount current passengers
    execute on passengers run tag @s add hvr.temporary_dismounted
    execute on passengers run ride @s dismount

# Mount AI
    ride @n[type=zombified_piglin,tag=hvr.enemy_searching_ai.need_init] mount @s

# Mount origin passengers
    tag @s add hvr.enemy_searching_ai.this
    execute as @e[tag=hvr.temporary_dismounted] run ride @s mount @n[type=#hvr:enemy/all_without_boss,tag=hvr.enemy_searching_ai.this]
    execute on passengers run tag @s remove hvr.temporary_dismounted
    tag @s remove hvr.enemy_searching_ai.this

# Force hostile
    data modify entity @n[type=zombified_piglin,tag=hvr.enemy_searching_ai.need_init] angry_at set from entity @p[tag=!hvr.player_may_exception,distance=..64] UUID
    data modify entity @n[type=zombified_piglin,tag=hvr.enemy_searching_ai.need_init] anger_end_time set value 2147483647

# End init
    execute on passengers if entity @s[tag=hvr.enemy_searching_ai.need_init] run tag @s remove hvr.enemy_searching_ai.need_init

# Add tag
    tag @s add hvr.enemy_searching_ai_active