function boss_access(level)
    local required_pieces = "star_rod_pieces_" .. level
    return Tracker:ProviderCountForCode("starrodpiece") >= Tracker:ProviderCountForCode(required_pieces)
end

function warp_access(level)
    local warp_name = LEVEL_NAMES[level] .. "warpstationkey"
    local warp = Tracker:FindObjectForCode(warp_name)
    return warp.Active and level_access(level)
end

function level_access(level)
    local warp_skips = Tracker:FindObjectForCode("warp_station_skips")
    local warp_name = LEVEL_NAMES[level] .. "warpstationkey"
    local warp = Tracker:FindObjectForCode(warp_name)
    if level == "l1" then
        return true
    elseif level == "l2" then
        if warp_skips.CurrentStage == 1 then
            return (warp_access("l1") and warp.Active) or boss_access("l1")
        else
            return boss_access("l1")
        end
    elseif level == "l3" then
        if warp_skips.CurrentStage == 1 then
            return ((warp_access("l1") or warp_access("l2")) and warp.Active) or boss_access("l2")
        else
            return boss_access("l2")
        end
    elseif level == "l4" then
        if warp_skips.CurrentStage == 1 then
            return ((warp_access("l1") or warp_access("l2") or warp_access("l3")) and warp.Active) or boss_access("l3")
        else
            return boss_access("l3")
        end
    elseif level == "l5" then
        if warp_skips.CurrentStage == 1 then
            return ((warp_access("l1") or warp_access("l2") or warp_access("l3") or warp_access("l4")) and warp.Active) or boss_access("l4")
        else
            return boss_access("l4")
        end
    elseif level == "l6" then
        if warp_skips.CurrentStage == 1 then
            return ((warp_access("l1") or warp_access("l2") or warp_access("l3") or warp_access("l4") or warp_access("l5")) and warp.Active) or boss_access("l5")
        else
            return boss_access("l5")
        end
    elseif level == "l7" then
        if warp_skips.CurrentStage == 1 then
            return ((warp_access("l1") or warp_access("l2") or warp_access("l3") or warp_access("l4") or warp_access("l5") or warp_access("l6")) and warp.Active) or boss_access("l6")
        else
            return boss_access("l6")
        end
    end
    return false
end
