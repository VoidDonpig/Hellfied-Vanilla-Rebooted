#> hvr:asset/effect/in_flame/register
#
# Register function
#
# @within function hvr:api/effect/core/give

# ID
    data modify storage hvr:asset/effect id set value "in_flame"

# Removed on using milk
    data modify storage hvr:asset/effect removed_on_using_milk set value false

# Removed on death
    data modify storage hvr:asset/effect removed_on_death set value true
