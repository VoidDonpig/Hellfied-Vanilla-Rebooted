#> hvr:entity_manager/effect/give/whether_have_same_effect
#
# Check if have the same effect and proceed
#
# @within function hvr:entity_manager/effect/give/

# Get storage
    function hvr:entity_manager/storage/access

# Open session
    function hvr:lib/array/session/open

# Whether have same effect
    data modify storage hvr:lib array append from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects[].id
    data modify storage hvr:lib compare_target set from storage hvr:asset/effect id
    function hvr:lib/array/compare_single

# Get same id effect
    data modify storage hvr:lib array set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects
    data modify storage hvr:lib masks set from storage hvr:lib compare_result
    function hvr:lib/array/mask_inverted
    data modify storage hvr:asset/effect target_effect_data set from storage hvr:lib array[0]

# Remove effects from the list
    data modify storage hvr:lib array set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects
    data modify storage hvr:lib masks set from storage hvr:lib compare_result
    function hvr:lib/array/mask
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects set from storage hvr:lib array

# Close session
    function hvr:lib/array/session/close