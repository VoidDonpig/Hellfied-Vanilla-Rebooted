#> hvr:asset/mob/creeper/explode/swell
#
# Sync swell
#
# @within function hvr:asset/mob/creeper/tick

# Swelling start SFX
    execute if score $swell_dir hvr.temporary matches 1.. if score @s hvr.mob_asset.creeper.swell matches 0 run function hvr:asset/mob/creeper/explode/swelling_start_sfx

# Save old swell dir
    scoreboard players operation @s hvr.mob_asset.creeper.old_swell_dir = $swell_dir hvr.temporary

# Add swell
    scoreboard players operation @s hvr.mob_asset.creeper.swell += $swell_dir hvr.temporary

# 0 <= swell
    execute if score @s hvr.mob_asset.creeper.swell matches ..-1 run scoreboard players set @s hvr.mob_asset.creeper.swell 0

# Swelling SFX
    execute if score @s hvr.mob_asset.creeper.swell matches 1.. run function hvr:asset/mob/creeper/explode/swelling_sfx

# Explode
    execute if score @s hvr.mob_asset.creeper.swell >= @s hvr.mob_asset.creeper.max_swell run function hvr:asset/mob/creeper/explode/exec

# Reset
    scoreboard players reset $swell_dir hvr.temporary