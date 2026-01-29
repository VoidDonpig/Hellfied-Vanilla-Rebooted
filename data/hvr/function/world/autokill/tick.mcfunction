#> hvr:world/autokill/tick
#
# Autokill tick
#
# @within function hvr:world/tick

# No vehicle kill
    execute if entity @s[tag=hvr.no_vehicle_kill] unless predicate hvr:is_riding run function hvr:lib/vanish/exec

# No passengers kill
    execute if entity @s[tag=hvr.no_passengers_kill] unless predicate hvr:is_ridden run function hvr:lib/vanish/exec