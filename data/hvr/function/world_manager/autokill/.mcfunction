#> hvr:world_manager/autokill/
#
# Autokill process
#
# @within function hvr:core/tick/world/

# No vehicle kill
    execute if entity @s[tag=hvr.no_vehicle_kill] unless predicate hvr:is_riding run function hvr:lib/vanish/

# No passengers kill
    execute if entity @s[tag=hvr.no_passengers_kill] unless predicate hvr:is_ridden run function hvr:lib/vanish/