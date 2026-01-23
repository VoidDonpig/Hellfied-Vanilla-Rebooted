#> hvr:core/rom/allocate_int_id
#
# Provide rom int id
#
# @within function hvr:core/rom/access

#> Index
# @private
#declare score_holder $rom_id_index

# Provide new id if not have
    $execute unless data storage hvr:core/rom int_id.$(address).value store result storage hvr:core/rom int_id.$(address).value int 1 run scoreboard players add $rom_id_index hvr.global 1

# Get id
    $execute store result score $ hvr.rom run data get storage hvr:core/rom int_id.$(address).value
