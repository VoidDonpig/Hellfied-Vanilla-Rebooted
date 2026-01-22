#> hvr:lib/array/open
#
# Open array session
#
# @api

# Validation
    execute if data storage hvr:lib {array_session_opened:true} run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Array session is already opened."}]

# Open session
    data modify storage hvr:lib array set value []
    data modify storage hvr:lib array_a set value []
    data modify storage hvr:lib array_b set value []
    data modify storage hvr:lib cache set value []
    data modify storage hvr:lib compare_target set value []
    data modify storage hvr:lib compare_result set value []
    data modify storage hvr:lib max_result set value []

# Declare flag
    data modify storage hvr:lib array_session_opened set value true