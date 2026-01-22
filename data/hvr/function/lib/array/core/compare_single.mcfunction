#> hvr:lib/array/core/compare_single
#
# Comapre
#
# @within function hvr:lib/array/**

# Compare
    data modify storage hvr:lib array append value {_:{_:true}}
    execute store success score $is_different hvr.temporary run data modify storage hvr:lib copied_array[-1] set from storage hvr:lib compare_target
    execute store success storage hvr:lib array[-1]._._ byte 1 if score $is_different hvr.temporary matches 0

# Remove foot
    data remove storage hvr:lib copied_array[-1]

# Repeat until all factors done
    execute if data storage hvr:lib copied_array[0] run function hvr:lib/array/core/compare_single
