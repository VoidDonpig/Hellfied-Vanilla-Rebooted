#> hvr:lib/array/close
#
# Close array session
#
# @api

# Validation
    execute unless data storage hvr:lib {array_session_opened:true} run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Array session is already closed."}]

# Close session
    data remove storage hvr:lib array
    data remove storage hvr:lib array_a
    data remove storage hvr:lib array_b
    data remove storage hvr:lib cache
    data remove storage hvr:lib compare_target
    data remove storage hvr:lib compare_result
    data remove storage hvr:lib max_result

# Declare flag
    data modify storage hvr:lib array_session_opened set value false