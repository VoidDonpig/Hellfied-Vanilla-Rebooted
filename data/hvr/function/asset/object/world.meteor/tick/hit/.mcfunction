#> hvr:asset/object/world.meteor/tick/hit/
#
# Hit process
#
# @within function hvr:asset/object/world.meteor/tick/move

# SFX
    playsound entity.generic.explode ambient @a[predicate=hvr:dimension/overworld] ~ ~ ~ 2 0.5 1
    playsound entity.lightning_bolt.thunder ambient @a[predicate=hvr:dimension/overworld] ~ ~ ~ 2 2 1
    playsound entity.lightning_bolt.thunder ambient @a[predicate=hvr:dimension/overworld] ~ ~ ~ 2 2 1
    particle explosion ~ ~ ~ 0.0 0.0 0.0 32 4 force
    particle poof ~ ~ ~ 0.0 0.0 0.0 0.8 32 force

# Explosion
    summon armor_stand ~ ~ ~ {equipment:{body:{id:"stone_button",components:{enchantments:{"hvr:asset/object/world.meteor/explosion":1}}}},Silent:true,Marker:true,Invisible:true}

# Kill
    tag @s add hvr.vanish