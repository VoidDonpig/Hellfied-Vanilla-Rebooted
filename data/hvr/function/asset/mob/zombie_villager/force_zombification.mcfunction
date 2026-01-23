#> hvr:asset/mob/zombie_villager/force_zombification
#
# Force zombificate villager
#
# @within function hvr:asset/mob/zombie_villager/tick

#> Private
# @private
#declare score_holder $current_difficulty

# Get current difficulty
    execute store result score $current_difficulty hvr.temporary run difficulty

# Set difficulty hard
    difficulty hard

# Dealt extreme damage
    damage @s 9999 mob_attack by @n[type=zombie_villager,tag=hvr.self]

# SFX
    execute anchored eyes positioned ^ ^ ^ run particle spore_blossom_air ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.elder_guardian.death hostile @a[distance=..16] ~ ~ ~ 1 1.5

# Restore difficulty
    execute if score $current_difficulty hvr.temporary matches 1 run difficulty easy
    execute if score $current_difficulty hvr.temporary matches 2 run difficulty normal

# Reset
    scoreboard players reset $current_difficulty hvr.temporary