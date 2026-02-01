#> hvr:lib/vanish/
#
# Instantly vanish entity
#
# @input as entity
#
# @api

# Prevent score lingering
    data modify entity @s PersistenceRequired set value true
    data modify entity @s Invulnerable set value true

# Set DeathTime
    data modify entity @s DeathTime set value 19s

# Vanish
    tp @s ~ -1024 ~
    kill @s
    data modify entity @s Health set value 0f