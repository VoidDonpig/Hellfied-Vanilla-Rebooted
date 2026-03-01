#> hvr:asset/mob/enemy.hazardous.inferno/register
#
# Register function
#
# @within function hvr:api/mob/core/summon

# ID
    data modify storage hvr:asset/mob id set value "enemy.hazardous.inferno"

# Attribute
    data modify storage hvr:asset/mob max_health set value 200d
    #data modify storage hvr:asset/mob max_absorption set value
    data modify storage hvr:asset/mob attack_damage set value 200d
    data modify storage hvr:asset/mob attack_knockback set value 4.0d
    data modify storage hvr:asset/mob armor set value 4d
    data modify storage hvr:asset/mob armor_toughness set value 2d
    #data modify storage hvr:asset/mob movement_speed set value
    #data modify storage hvr:asset/mob movement_efficiency set value
    #data modify storage hvr:asset/mob water_movement_efficiency set value
    data modify storage hvr:asset/mob follow_range set value 64
    data modify storage hvr:asset/mob knockback_resistance set value 1.0d
    data modify storage hvr:asset/mob explosion_knockback_resistance set value 1.0d
    #data modify storage hvr:asset/mob spawn_reinforcements set value
    #data modify storage hvr:asset/mob scale set value
    #data modify storage hvr:asset/mob burning_time set value
    #data modify storage hvr:asset/mob fall_damage_multiplier set value
    #data modify storage hvr:asset/mob flying_speed set value
    #data modify storage hvr:asset/mob gravity set value
    #data modify storage hvr:asset/mob jump_strength set value
    #data modify storage hvr:asset/mob oxygen_bonus set value
    #data modify storage hvr:asset/mob safe_fall_distance set value
    #data modify storage hvr:asset/mob step_height set value
    #data modify storage hvr:asset/mob tempt_range set value

# Name
    data modify storage hvr:asset/mob custom_name set value [{"text":"❈ ","color":"red"},{"text":"Inferno",color:"dark_red"}]
    #data modify storage hvr:asset/mob custom_name_visible set value

# Equipment
    #data modify storage hvr:asset/mob equipment.mainhand set value
    #data modify storage hvr:asset/mob equipment.offhand set value
    #data modify storage hvr:asset/mob equipment.head set value
    #data modify storage hvr:asset/mob equipment.chest set value
    #data modify storage hvr:asset/mob equipment.legs set value
    #data modify storage hvr:asset/mob equipment.feet set value
    data modify storage hvr:asset/mob equipment.body set value {id:"stone_button",components:{"minecraft:enchantments":{"hvr:asset/mob/enemy.hazardous.inferno/base":1}}}
    #data modify storage hvr:asset/mob equipment.saddle set value

# Drop chances
    #data modify storage hvr:asset/mob drop_chances.mainhand set value
    #data modify storage hvr:asset/mob drop_chances.offhand set value
    #data modify storage hvr:asset/mob drop_chances.head set value
    #data modify storage hvr:asset/mob drop_chances.chest set value
    #data modify storage hvr:asset/mob drop_chances.legs set value
    #data modify storage hvr:asset/mob drop_chances.feet set value
    data modify storage hvr:asset/mob drop_chances.body set value 0f
    #data modify storage hvr:asset/mob drop_chances.saddle set value

# Death loot table
    #data modify storage hvr:asset/mob death_loot_table set value

# Misc NBT
    data modify storage hvr:asset/mob silent set value true
    #data modify storage hvr:asset/mob no_ai set value
    #data modify storage hvr:asset/mob no_gravity set value
    #data modify storage hvr:asset/mob persistance_required set value