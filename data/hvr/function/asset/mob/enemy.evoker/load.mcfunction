#> hvr:asset/mob/enemy.evoker/load
#
# Load function
#
# @within function hvr:core/load/once

# Summon axis
    kill d687cb36-9161-41e2-9fe5-cac100000000
    execute in overworld run summon marker 0.0 0.0 0.0 {Rotation:[0,90],Tags:["hvr.asset.mob.evoker.axis"],UUID:[I;-695743690,-1855897118,-1612330303,0]}
    kill d687cb36-9161-41e2-9fe5-cac100000001
    execute in overworld run summon marker 0.0 0.0 0.0 {Rotation:[180,-90],Tags:["hvr.asset.mob.evoker.axis"],UUID:[I;-695743690,-1855897118,-1612330303,1]}