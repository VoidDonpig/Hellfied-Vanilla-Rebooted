#> hvr:entity_manager/mob/init/define_as_asset_mob
#
# Declare this mob asset one
#
# @within function hvr:entity_manager/mob/init/natural_mob

# Declare id
    execute if entity @s[type=zombie] run data modify storage hvr:api __input__.id set value "enemy.zombie"
    execute if entity @s[type=husk] run data modify storage hvr:api __input__.id set value "enemy.husk"
    execute if entity @s[type=drowned] run data modify storage hvr:api __input__.id set value "enemy.drowned"
    execute if entity @s[type=zombified_piglin] run data modify storage hvr:api __input__.id set value "enemy.zombified_piglin"
    execute if entity @s[type=zombie_villager] run data modify storage hvr:api __input__.id set value "enemy.zombie_villager"
    execute if entity @s[type=skeleton] run data modify storage hvr:api __input__.id set value "enemy.skeleton"
    execute if entity @s[type=stray] run data modify storage hvr:api __input__.id set value "enemy.stray"
    execute if entity @s[type=bogged] run data modify storage hvr:api __input__.id set value "enemy.bogged"
    execute if entity @s[type=parched] run data modify storage hvr:api __input__.id set value "enemy.parched"
    execute if entity @s[type=wither_skeleton] run data modify storage hvr:api __input__.id set value "enemy.wither_skeleton"
    execute if entity @s[type=creeper] run data modify storage hvr:api __input__.id set value "enemy.creeper"
    execute if entity @s[type=spider] run data modify storage hvr:api __input__.id set value "enemy.spider"
    execute if entity @s[type=cave_spider] run data modify storage hvr:api __input__.id set value "enemy.cave_spider"
    execute if entity @s[type=enderman] run data modify storage hvr:api __input__.id set value "enemy.enderman"
    execute if entity @s[type=blaze] run data modify storage hvr:api __input__.id set value "enemy.blaze"
    execute if entity @s[type=vindicator] run data modify storage hvr:api __input__.id set value "enemy.vindicator"
    execute if entity @s[type=warden] run data modify storage hvr:api __input__.id set value "enemy.warden"

# Declare skip summon entity
    data modify storage hvr:api __input__.skip_summon set value true

# Set tag
    tag @s add hvr.mob_need_init

# Get slot as args
    data modify storage hvr:asset/mob equipment_exist set value {mainhand:false,offhand:false,head:false,chest:false,legs:false,feet:false}
    execute if data entity @s equipment.mainhand run data modify storage hvr:asset/mob equipment_exist.mainhand set value true
    execute if data entity @s equipment.offhand run data modify storage hvr:asset/mob equipment_exist.offhand set value true
    execute if data entity @s equipment.head run data modify storage hvr:asset/mob equipment_exist.head set value true
    execute if data entity @s equipment.chest run data modify storage hvr:asset/mob equipment_exist.chest set value true
    execute if data entity @s equipment.legs run data modify storage hvr:asset/mob equipment_exist.legs set value true
    execute if data entity @s equipment.feet run data modify storage hvr:asset/mob equipment_exist.feet set value true

# Lefthanded
    data modify storage hvr:asset/mob left_handed set value false
    execute if data entity @s {LeftHanded:true} run data modify storage hvr:asset/mob left_handed set value true

# Set data via mob summon api
    function hvr:api/mob/summon

# Reset
    data remove storage hvr:asset/mob equipment_exist
    data remove storage hvr:asset/mob left_handed