#> hvr:asset/effect/witch_raider_buff/register
#
# Register function
#
# @within function hvr:api/effect/core/give

# ID
    data modify storage hvr:asset/effect id set value "witch_raider_buff"

# Removed on using milk
    data modify storage hvr:asset/effect removed_on_using_milk set value true

# Removed on death
    data modify storage hvr:asset/effect removed_on_death set value true
