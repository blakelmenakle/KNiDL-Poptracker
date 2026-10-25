function boss_w1()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w1")
end
function boss_w2()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w2")
end
function boss_w3()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w3")
end
function boss_w4()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w4")
end
function boss_w5()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w5")
end
function boss_w6()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_w6")
end
function boss_w7()
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode("star_rod_pieces_needed")
end

function warp_w1()
    local warp_1 = Tracker:FindObjectForCode("vegetablevalleywarpstationkey")
    return warp_1.Active and access_w1()
end
function warp_w2()
    local warp_2 = Tracker:FindObjectForCode("icecreamislandwarpstationkey")
    return warp_2.Active and access_w2()
end
function warp_w3()
    local warp_3 = Tracker:FindObjectForCode("butterbuildingwarpstationkey")
    return warp_3.Active and access_w3()
end
function warp_w4()
    local warp_4 = Tracker:FindObjectForCode("grapegardenwarpstationkey")
    return warp_4.Active and access_w4()
end
function warp_w5()
    local warp_5 = Tracker:FindObjectForCode("yogurtyardwarpstationkey")
    return warp_5.Active and access_w5()
end
function warp_w6()
    local warp_6 = Tracker:FindObjectForCode("orangeoceanwarpstationkey")
    return warp_6.Active and access_w6()
end
function warp_w7()
    local warp_7 = Tracker:FindObjectForCode("rainbowresortwarpstationkey")
    return warp_7.Active and access_w7()
end

function access_w1()
    return true
end
function access_w2()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_2 = Tracker:FindObjectForCode("icecreamislandwarpstationkey")
        return (warp_w1() and warp_2.Active) or boss_w1()
    else
        return boss_w1()
    end
end
function access_w3()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_3 = Tracker:FindObjectForCode("butterbuildingwarpstationkey")
        return ((warp_w1() or warp_w2()) and warp_3.Active) or boss_w2()
    else
        return boss_w2()
    end
end
function access_w4()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_4 = Tracker:FindObjectForCode("grapegardenwarpstationkey")
        return ((warp_w1() or warp_w2() or warp_w3()) and warp_4.Active) or boss_w3()
    else
        return boss_w3()
    end
end
function access_w5()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_5 = Tracker:FindObjectForCode("yogurtyardwarpstationkey")
        return ((warp_w1() or warp_w2() or warp_w3() or warp_w4()) and warp_5.Active) or boss_w4()
    else
        return boss_w4()
    end
end
function access_w6()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_6 = Tracker:FindObjectForCode("orangeoceanwarpstationkey")
        return ((warp_w1() or warp_w2() or warp_w3() or warp_w4() or warp_w5()) and warp_6.Active) or boss_w5()
    else
        return boss_w5()
    end
end
function access_w7()
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    if warp_skips.CurrentStage == 1 then
        local warp_7 = Tracker:FindObjectForCode("rainbowresortwarpstationkey")
        return ((warp_w1() or warp_w2() or warp_w3() or warp_w4() or warp_w5() or warp_w6()) and warp_7.Active) or boss_w6()
    else
        return boss_w6()
    end
end

function ability_backdrop()
    local backdrop = Tracker:FindObjectForCode("backdrop")
    local arena = Tracker:FindObjectForCode("grapegardenarenakey")
    return backdrop.Active and (access_w3() or (access_w4() and arena.Active) or access_w7())
end
function ability_ball()
    local ball = Tracker:FindObjectForCode("ball")
    return ball.Active and (access_w4() or access_w5() or access_w7())
end
function ability_beam()
    local beam = Tracker:FindObjectForCode("beam")
    return beam.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_burning()
    local burning = Tracker:FindObjectForCode("burning")
    return burning.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_crash()
    local crash = Tracker:FindObjectForCode("crash")
    return crash.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_cutter()
    local cutter = Tracker:FindObjectForCode("cutter")
    return cutter.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_fire()
    local fire = Tracker:FindObjectForCode("fire")
    return fire.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_freeze()
    local freeze = Tracker:FindObjectForCode("freeze")
    local arena = Tracker:FindObjectForCode("icecreamislandarenakey")
    return freeze.Active and (access_w1() or (access_w2() and arena.Active) or access_w3() or access_w4() or access_w6() or access_w7())
end
function ability_hammer()
    local hammer = Tracker:FindObjectForCode("hammer")
    return hammer.Active and (access_w3() or access_w5() or access_w6() or access_w7())
end
function ability_hi_jump()
    local hi_jump = Tracker:FindObjectForCode("hi-jump")
    return hi_jump.Active and (access_w2() or access_w3() or access_w4() or access_w5() or access_w6())
end
function ability_ice()
    local ice = Tracker:FindObjectForCode("ice")
    return ice.Active and (access_w3() or access_w5() or access_w6())
end
function ability_laser()
    local laser = Tracker:FindObjectForCode("laser")
    return laser.Active and (access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_light()
    local light = Tracker:FindObjectForCode("light")
    return light.Active and (access_w3() or access_w4() or access_w5())
end
function ability_mike()
    local mike = Tracker:FindObjectForCode("mike")
    return mike.Active and (access_w2() or access_w3() or access_w4() or access_w7())
end
function ability_needle()
    local needle = Tracker:FindObjectForCode("needle")
    return needle.Active and (access_w1() or access_w2() or access_w3() or access_w5() or access_w6())
end
function ability_parasol()
    local parasol = Tracker:FindObjectForCode("parasol")
    return parasol.Active and (access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_spark()
    local spark = Tracker:FindObjectForCode("spark")
    return spark.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_stone()
    local stone = Tracker:FindObjectForCode("stone")
    return stone.Active and (access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_sword()
    local sword = Tracker:FindObjectForCode("sword")
    return sword.Active and (access_w1() or access_w2() or access_w3() or access_w4() or access_w5() or access_w6() or access_w7())
end
function ability_throw()
    local throw = Tracker:FindObjectForCode("throw")
    return throw.Active and (access_w4() or access_w6() or access_w7())
end
function ability_tornado()
    local tornado = Tracker:FindObjectForCode("tornado")
    local museum = Tracker:FindObjectForCode("yogurtyardmuseumkey")
    return tornado.Active and (access_w2() or access_w4() or (access_w5() and museum.Active) or access_w6() or access_w7())
end
function ability_ufo()
    local ufo = Tracker:FindObjectForCode("ufo")
    return ufo.Active and (access_w1() or access_w2() or access_w4() or access_w6())
end
function ability_wheel()
    local wheel = Tracker:FindObjectForCode("wheel")
    local museum = Tracker:FindObjectForCode("orangeoceanmuseumkey")
    return wheel.Active and (access_w2() or access_w3() or access_w4() or access_w5() or (access_w6() and museum.Active) or access_w7())
end

function destroy_metal()
    return ability_wheel() or ability_burning() or ability_hammer()
end
function light_fuse()
    return ability_fire() or ability_burning() or ability_laser()
end
function pound_stake()
    return ability_stone() or ability_hammer()
end
