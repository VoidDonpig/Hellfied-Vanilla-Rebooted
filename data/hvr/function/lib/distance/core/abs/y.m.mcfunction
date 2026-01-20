#> hvr:lib/distance/core/abs/y.m
#
# Change sign
#
# @within function hvr:lib/distance/core/get_delta.m

$data modify storage hvr.__temp__:lib __temp__.abs set value "$(y)"
data modify storage hvr.__temp__:lib __temp__.y set string storage hvr.__temp__:lib __temp__.abs 1
