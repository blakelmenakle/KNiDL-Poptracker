function enemy_ability(ability_name, ...)
    local enemy_list = { ... }
    local ability = ABILITY_LOOKUP[ability_name]
    for _, enemy_name in pairs(enemy_list) do 
        local enemy = Tracker:FindObjectForCode(enemy_name)
        if enemy.CurrentStage == ability then
            return true
        end
    end
    return false
end

function stage_ability(ability_name, stage)
    local enemy_list = STAGE_ENEMIES[stage]
    local ability = ABILITY_LOOKUP[ability_name]
    for _, enemy_name in pairs(enemy_list) do 
        local enemy = Tracker:FindObjectForCode(enemy_name)
        if enemy.CurrentStage == ability then
            return true
        end
    end
    return false
end

function arena_enemy(ability_name)
    local ice_cream_arena = Tracker:FindObjectForCode("icecreamislandarenakey")
    local butter_arena = Tracker:FindObjectForCode("butterbuildingarenakey")
    local grape_arena = Tracker:FindObjectForCode("grapegardenarenakey")
    local yogurt_arena = Tracker:FindObjectForCode("yogurtyardarenakey")
    local orange_arena = Tracker:FindObjectForCode("orangeoceanarenakey")
    if level_access("l2") and ice_cream_arena.Active and stage_ability(ability_name, "S2_A") then
        return true
    elseif level_access("l3") and butter_arena.Active and stage_ability(ability_name, "S3_A") then
        return true
    elseif level_access("l4") and grape_arena.Active and stage_ability(ability_name, "S4_A") then
        return true
    elseif level_access("l5") and yogurt_arena.Active and stage_ability(ability_name, "S5_A") then
        return true
    elseif level_access("l6") and orange_arena.Active and stage_ability(ability_name, "S6_A") then
        return true
    end
    return false
end

function museum_enemy(ability_name)
    local vegetable_museum = Tracker:FindObjectForCode("vegetablevalleymuseumkey")
    local ice_cream_museum = Tracker:FindObjectForCode("icecreamislandmuseumkey")
    local butter_museum = Tracker:FindObjectForCode("butterbuildingmuseumkey")
    local grape_museum = Tracker:FindObjectForCode("grapegardenmuseumkey")
    local yogurt_museum = Tracker:FindObjectForCode("yogurtyardmuseumkey")
    local orange_museum = Tracker:FindObjectForCode("orangeoceanmuseumkey")
    if level_access("l1") and vegetable_museum.Active and stage_ability(ability_name, "S1_M") then
        return true
    elseif level_access("l2") and ice_cream_museum.Active and stage_ability(ability_name, "S2_M") then
        return true
    elseif level_access("l3") and butter_museum.Active and stage_ability(ability_name, "S3_M") then
        return true
    elseif level_access("l4") and grape_museum.Active and stage_ability(ability_name, "S4_M") then
        return true
    elseif level_access("l5") and yogurt_museum.Active and stage_ability(ability_name, "S5_M") then
        return true
    elseif level_access("l6") and orange_museum.Active and stage_ability(ability_name, "S6_M") then
        return true
    end
    return false
end
