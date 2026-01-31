#> hvr:lib/motion/core/knockback_resistance
#
# Calculate knockback including resistance
#
# @within function hvr:lib/motion/

# Calc
    scoreboard players set $calc hvr.temporary 100
    scoreboard players operation $calc hvr.temporary -= $knockback_resistance hvr.temporary
    scoreboard players operation $calc hvr.temporary >< $knockback_resistance hvr.temporary

    scoreboard players operation $vector_magnitude hvr.temporary *= $knockback_resistance hvr.temporary

    scoreboard players operation $vector_magnitude hvr.temporary /= $100 hvr.constant

# Reset
    scoreboard players reset $calc hvr.temporary