#> hvr:lib/vanish/
#
# Instantly vanish entity
#
# @input as entity
#
# @api

# Vanish
    tp @s ~ -1024 ~
    kill @s
    data modify entity @s Health set value 0f