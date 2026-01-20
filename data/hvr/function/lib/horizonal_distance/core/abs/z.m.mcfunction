#> hvr:lib/horizonal_distance/core/abs/z.m
#
# Change sign
#
# @within function hvr:lib/horizonal_distance/**

$data modify storage hvr.__temp__:lib __temp__.abs set value "$(z)"
data modify storage hvr.__temp__:lib __temp__.z set string storage hvr.__temp__:lib __temp__.abs 1
