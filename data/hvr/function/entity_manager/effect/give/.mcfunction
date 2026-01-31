#> hvr:entity_manager/effect/give/
#
# Give asset effect
#
# @within function hvr:api/effect/core/give.m

# Whether have same effect
    function hvr:entity_manager/effect/give/whether_have_same_effect

# Prevent regiven when removing the effect event
    execute if data storage hvr:asset/effect target_effect_data{duration:-1} run data modify storage hvr:asset/effect effect_data set from storage hvr:asset/effect target_effect_data

# Format
    execute unless data storage hvr:asset/effect target_effect_data{duration:-1} run function hvr:entity_manager/effect/give/format_data

# Add effect
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects append from storage hvr:asset/effect effect_data

# Add tag
    tag @s add hvr.have_asset_effect

# Reset
    data remove storage hvr:asset/effect target_effect_data
    data remove storage hvr:asset/effect effect_data