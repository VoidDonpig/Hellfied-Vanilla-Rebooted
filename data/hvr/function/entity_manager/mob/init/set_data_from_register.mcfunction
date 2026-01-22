#> hvr:entity_manager/mob/init/set_data_from_register
#
# Set data using register data
#
# @within function hvr:entity_manager/mob/init/init_asset_mob

# Validation
    # equipment
        #execute unless data storage hvr:asset/mob equipment.mainhand run data modify storage hvr:asset/mob equipment.mainhand set value {}
        #execute unless data storage hvr:asset/mob equipment.offhand run data modify storage hvr:asset/mob equipment.offhand set value {}
        #execute unless data storage hvr:asset/mob equipment.head run data modify storage hvr:asset/mob equipment.head set value {}
        #execute unless data storage hvr:asset/mob equipment.chest run data modify storage hvr:asset/mob equipment.chest set value {}
        #execute unless data storage hvr:asset/mob equipment.legs run data modify storage hvr:asset/mob equipment.legs set value {}
        #execute unless data storage hvr:asset/mob equipment.feet run data modify storage hvr:asset/mob equipment.feet set value {}
        #execute unless data storage hvr:asset/mob equipment.body run data modify storage hvr:asset/mob equipment.body set value {}
        #execute unless data storage hvr:asset/mob equipment.saddle run data modify storage hvr:asset/mob equipment.saddle set value {}
    # drop_chances
        #execute unless data storage hvr:asset/mob drop_chances.mainhand run data modify storage hvr:asset/mob drop_chances.mainhand set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.offhand run data modify storage hvr:asset/mob drop_chances.offhand set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.head run data modify storage hvr:asset/mob drop_chances.head set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.chest run data modify storage hvr:asset/mob drop_chances.chest set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.legs run data modify storage hvr:asset/mob drop_chances.legs set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.feet run data modify storage hvr:asset/mob drop_chances.feet set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.body run data modify storage hvr:asset/mob drop_chances.body set value 0f
        #execute unless data storage hvr:asset/mob drop_chances.saddle run data modify storage hvr:asset/mob drop_chances.saddle set value 0f
    # Misc NBT
        execute unless data storage hvr:asset/mob silent run data modify storage hvr:asset/mob silent set value false
        execute unless data storage hvr:asset/mob no_ai run data modify storage hvr:asset/mob no_ai set value false
        execute unless data storage hvr:asset/mob no_gravity run data modify storage hvr:asset/mob no_gravity set value false
        execute unless data storage hvr:asset/mob persistance_required run data modify storage hvr:asset/mob persistance_required set value false

# Attribute settings
    # Validation
        data modify storage hvr:asset/mob attributes set value []
        execute if data storage hvr:asset/mob max_health run data modify storage hvr:asset/mob attributes append value {id:"minecraft:max_health"}
        execute if data storage hvr:asset/mob max_absorption run data modify storage hvr:asset/mob attributes append value {id:"minecraft:max_absorption"}
        execute if data storage hvr:asset/mob attack_damage run data modify storage hvr:asset/mob attributes append value {id:"minecraft:attack_damage"}
        execute if data storage hvr:asset/mob attack_knockback run data modify storage hvr:asset/mob attributes append value {id:"minecraft:attack_knockback"}
        execute if data storage hvr:asset/mob armor run data modify storage hvr:asset/mob attributes append value {id:"minecraft:armor"}
        execute if data storage hvr:asset/mob armor_toughness run data modify storage hvr:asset/mob attributes append value {id:"minecraft:armor_toughness"}
        execute if data storage hvr:asset/mob movement_speed run data modify storage hvr:asset/mob attributes append value {id:"minecraft:movement_speed"}
        execute if data storage hvr:asset/mob movement_efficiency run data modify storage hvr:asset/mob attributes append value {id:"minecraft:movement_efficiency"}
        execute if data storage hvr:asset/mob water_movement_efficiency run data modify storage hvr:asset/mob attributes append value {id:"minecraft:water_movement_efficiency"}
        execute if data storage hvr:asset/mob follow_range run data modify storage hvr:asset/mob attributes append value {id:"minecraft:follow_range"}
        execute if data storage hvr:asset/mob knockback_resistance run data modify storage hvr:asset/mob attributes append value {id:"minecraft:knockback_resistance"}
        execute if data storage hvr:asset/mob explosion_knockback_resistance run data modify storage hvr:asset/mob attributes append value {id:"minecraft:explosion_knockback_resistance"}
        execute if data storage hvr:asset/mob spawn_reinforcements run data modify storage hvr:asset/mob attributes append value {id:"minecraft:spawn_reinforcements"}
        execute if data storage hvr:asset/mob scale run data modify storage hvr:asset/mob attributes append value {id:"minecraft:scale"}
    # Set
        data modify storage hvr:asset/mob attributes[{id:"minecraft:max_health"}].base set from storage hvr:asset/mob max_health
        data modify storage hvr:asset/mob attributes[{id:"minecraft:max_absorption"}].base set from storage hvr:asset/mob max_absorption
        data modify storage hvr:asset/mob attributes[{id:"minecraft:attack_damage"}].base set from storage hvr:asset/mob attack_damage
        data modify storage hvr:asset/mob attributes[{id:"minecraft:attack_knockback"}].base set from storage hvr:asset/mob attack_knockback
        data modify storage hvr:asset/mob attributes[{id:"minecraft:armor"}].base set from storage hvr:asset/mob armor
        data modify storage hvr:asset/mob attributes[{id:"minecraft:armor_toughness"}].base set from storage hvr:asset/mob armor_toughness
        data modify storage hvr:asset/mob attributes[{id:"minecraft:movement_speed"}].base set from storage hvr:asset/mob movement_speed
        data modify storage hvr:asset/mob attributes[{id:"minecraft:movement_efficiency"}].base set from storage hvr:asset/mob movement_efficiency
        data modify storage hvr:asset/mob attributes[{id:"minecraft:water_movement_efficiency"}].base set from storage hvr:asset/mob water_movement_efficiency
        data modify storage hvr:asset/mob attributes[{id:"minecraft:follow_range"}].base set from storage hvr:asset/mob follow_range
        data modify storage hvr:asset/mob attributes[{id:"minecraft:knockback_resistance"}].base set from storage hvr:asset/mob knockback_resistance
        data modify storage hvr:asset/mob attributes[{id:"minecraft:explosion_knockback_resistance"}].base set from storage hvr:asset/mob explosion_knockback_resistance
        data modify storage hvr:asset/mob attributes[{id:"minecraft:spawn_reinforcements"}].base set from storage hvr:asset/mob spawn_reinforcements
        data modify storage hvr:asset/mob attributes[{id:"minecraft:scale"}].base set from storage hvr:asset/mob scale
    # Apply
        data modify entity @s attributes set from storage hvr:asset/mob attributes

# Name
    execute if data storage hvr:asset/mob custom_name run data modify entity @s CustomName set from storage hvr:asset/mob custom_name
    execute if data storage hvr:asset/mob custom_name_visible run data modify entity @s CustomNameVisible set from storage hvr:asset/mob custom_name_visible

# Apply equipment
    data modify entity @s equipment set from storage hvr:asset/mob equipment
    data modify entity @s drop_chances set from storage hvr:asset/mob drop_chances

# Death loot table
    execute if data storage hvr:asset/mob death_loot_table run data modify entity @s DeathLootTable set from storage hvr:asset/mob death_loot_table

# Set health
    execute store result entity @s Health float 0.01 run attribute @s max_health get 100
    execute store result entity @s AbsorptionAmount float 0.01 run attribute @s max_absorption get 100

# Set misc NBT
    data modify entity @s Silent set from storage hvr:asset/mob silent
    data modify entity @s NoAI set from storage hvr:asset/mob no_ai
    data modify entity @s NoGravity set from storage hvr:asset/mob no_gravity
    data modify entity @s PersistenceRequired set from storage hvr:asset/mob persistance_required

# Access storage
    function hvr:entity_manager/storage/access

# ID
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id set from storage hvr:asset/mob id

# Field
    execute if data storage hvr:asset/mob field_override run data modify storage hvr:asset/mob field merge from storage hvr:asset/mob field_override
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].mob_field set from storage hvr:asset/mob field

# Common init
    function hvr:entity_manager/mob/init/common

# Reset
    data remove storage hvr:asset/mob id
    data remove storage hvr:asset/mob field
    data remove storage hvr:asset/mob field_override

    data remove storage hvr:asset/mob max_health
    data remove storage hvr:asset/mob max_absorption
    data remove storage hvr:asset/mob attack_damage
    data remove storage hvr:asset/mob attack_knockback
    data remove storage hvr:asset/mob armor
    data remove storage hvr:asset/mob armor_toughness
    data remove storage hvr:asset/mob movement_speed
    data remove storage hvr:asset/mob movement_efficiency
    data remove storage hvr:asset/mob water_movement_efficiency
    data remove storage hvr:asset/mob follow_range
    data remove storage hvr:asset/mob knockback_resistance
    data remove storage hvr:asset/mob explosion_knockback_resistance
    data remove storage hvr:asset/mob spawn_reinforcements
    data remove storage hvr:asset/mob scale

    data remove storage hvr:asset/mob attributes

    data remove storage hvr:asset/mob equipment
    data remove storage hvr:asset/mob drop_chances

    data remove storage hvr:asset/mob death_loot_table

    data remove storage hvr:asset/mob silent
    data remove storage hvr:asset/mob no_ai
    data remove storage hvr:asset/mob no_gravity
    data remove storage hvr:asset/mob persistance_required