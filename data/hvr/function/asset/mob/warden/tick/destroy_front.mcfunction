#> hvr:asset/mob/warden/destroy_front
#
# Destroy blocks in front of warden
#
# @within function hvr:asset/mob/warden/tick/in_hostile

# Destroy blocks
    execute unless block ^-1 ^ ^1 #hvr:asset/mob/warden/warden_immune unless block ^-1 ^ ^ #hvr:asset/mob/warden/warden_immune run setblock ^-1 ^ ^ air destroy
    execute unless block ^ ^ ^1 #hvr:asset/mob/warden/warden_immune run setblock ^ ^ ^1 air destroy
    execute unless block ^1 ^ ^1 #hvr:asset/mob/warden/warden_immune unless block ^1 ^ ^ #hvr:asset/mob/warden/warden_immune run setblock ^1 ^ ^ air destroy

    execute unless block ^-1 ^1 ^1 #hvr:asset/mob/warden/warden_immune unless block ^-1 ^1 ^ #hvr:asset/mob/warden/warden_immune run setblock ^-1 ^1 ^ air destroy
    execute unless block ^ ^1 ^1 #hvr:asset/mob/warden/warden_immune run setblock ^ ^1 ^1 air destroy
    execute unless block ^1 ^1 ^1 #hvr:asset/mob/warden/warden_immune unless block ^1 ^1 ^ #hvr:asset/mob/warden/warden_immune run setblock ^1 ^1 ^ air destroy

    execute unless block ^-1 ^2 ^1 #hvr:asset/mob/warden/warden_immune unless block ^-1 ^2 ^ #hvr:asset/mob/warden/warden_immune run setblock ^-1 ^2 ^ air destroy
    execute unless block ^ ^2 ^1 #hvr:asset/mob/warden/warden_immune run setblock ^ ^2 ^1 air destroy
    execute unless block ^1 ^2 ^1 #hvr:asset/mob/warden/warden_immune unless block ^1 ^2 ^ #hvr:asset/mob/warden/warden_immune run setblock ^1 ^2 ^ air destroy