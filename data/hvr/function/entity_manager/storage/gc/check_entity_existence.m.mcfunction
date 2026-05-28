#> hvr:entity_manager/storage/gc/check_entity_existence.m
#
# Check specific entity existence
#
# @within function hvr:entity_manager/storage/gc/foreach

#> Declare
# @within function hvr:entity_manager/storage/gc/foreach
#declare score_holder $existed

# Check via macro
    $execute store success score $existed hvr.temporary if entity @e[nbt={UUID:$(owner_uuid)}]