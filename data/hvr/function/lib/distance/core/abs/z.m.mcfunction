#> hvr:lib/distance/core/abs/z.m
#
# Change sign
#
# @within function hvr:lib/distance/core/get_delta.m

$data modify storage hvr.__temp__:lib __temp__.abs set value "$(z)"
data modify storage hvr.__temp__:lib __temp__.z set string storage hvr.__temp__:lib __temp__.abs 1
