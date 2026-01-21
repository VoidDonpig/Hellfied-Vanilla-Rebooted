#> hvr:core/load_once
#
# Declare various scoreboard objectives, storages, and call specific load function of assets
#
# @within function hvr:core/load

# Add system objective
    # Forceload
        execute in overworld run forceload add -1 -1 0 0
    # Object
        execute in overworld run fill -1 -63 -1 1 -64 1 bedrock
        execute in overworld run setblock 0 -64 0 purple_shulker_box{lock:{items:"debug_stick"}}
        kill 1db9-0-0-0-0
        execute in overworld run summon marker 0.0 0.0 0.0 {UUID:[I;7609,0,0,0]}

# Common objectives
    scoreboard objectives add hvr.global dummy
    scoreboard objectives add hvr.temporary dummy

# Constant objective and define values
    scoreboard objectives add hvr.constant dummy
    function hvr:core/define_constant

# Declare difficulty
    execute unless score $difficulty hvr.global matches 1.. run scoreboard players set $difficulty hvr.global 1

# Player id objective
    scoreboard objectives add hvr.player_id dummy

# Mob id objective
    scoreboard objectives add hvr.mob_id dummy

# Player damage objectives
    scoreboard objectives add hvr.player_taken_damage custom:damage_taken
    scoreboard objectives add hvr.player_absorbed_damage custom:damage_absorbed

# Entity manager objective
    scoreboard objectives add hvr.entity_storage dummy

# Rom objective
    scoreboard objectives add hvr.rom dummy

# Lib objective
    scoreboard objectives add hvr.lib dummy

# Api objective
    scoreboard objectives add hvr.api dummy

# Initialize entity storage
    execute unless data storage hvr:entity_manager/storage _ unless data storage hvr:core/rom _ run function hvr:core/initialize_storage

# Call global variable
    # tellraw prefix
        function hvr:global/variable/tellraw_prefix
    # Common storage data
        function hvr:global/variable/storage

# Load asset function
    function hvr:asset/mob/zombie/load
    function hvr:asset/mob/creeper/load
    function hvr:asset/mob/warden/load

# Declare this function is loaded
    execute if data storage hvr:core {is_production:true} run data modify storage hvr:core loaded_once set value true

# show load message
    tellraw @a ["",\
    {text:"                                                                                ",strikethrough:true,color:"white"},\
    "\n",\
    "\n",\
    {text:"    Hellfied Vanilla Rebooted has been loaded successfully.",color:"white"},\
    "\n",\
    "\n",\
    {text:"    H A V E  F U N",color:"dark_purple"},\
    "\n",\
    "\n",\
    {text:"    Hellfied Vanilla Rebooted",color:"dark_red"},{text:" created by ",color:"white"},{text:"VoidDonpig",color:"dark_purple",underlined:true,hover_event:{action:"show_text",value:{text:"Click to open GitHub Page"}},click_event:{action:"open_url",url:"https://github.com/VoidDonpig"}},\
    "\n",\
    "\n",\
    {text:"                                                                                ",strikethrough:true,color:"white"}]