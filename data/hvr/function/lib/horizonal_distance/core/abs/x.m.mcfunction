#> hvr:lib/horizonal_distance/core/abs/x.m
#
# Change sign
#
# @within function hvr:lib/horizonal_distance/**

$data modify storage hvr.__temp__:lib __temp__.abs set value "$(x)"
data modify storage hvr.__temp__:lib __temp__.x set string storage hvr.__temp__:lib __temp__.abs 1
