#> hvr:entity_manager/mob/init/define_as_asset_mob
#
# Declare this mob asset one
#
# @within function hvr:entity_manager/mob/init/natural_mob

# Declare id
    execute if entity @s[type=zombie] run data modify storage hvr:api __input__.id set value "zombie"
    execute if entity @s[type=husk] run data modify storage hvr:api __input__.id set value "husk"
    execute if entity @s[type=drowned] run data modify storage hvr:api __input__.id set value "drowned"
    execute if entity @s[type=zombified_piglin] run data modify storage hvr:api __input__.id set value "zombified_piglin"
    execute if entity @s[type=zombie_villager] run data modify storage hvr:api __input__.id set value "zombie_villager"
    execute if entity @s[type=skeleton] run data modify storage hvr:api __input__.id set value "skeleton"
    execute if entity @s[type=enderman] run data modify storage hvr:api __input__.id set value "enderman"
    execute if entity @s[type=warden] run data modify storage hvr:api __input__.id set value "warden"

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

# Set data via mob summon api
    function hvr:api/mob/summon

# Reset
    data remove storage hvr:asset/mob equipment_exist