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

function enemy_ability_check(enemy)
    local ability_number = Tracker:FindObjectForCode(enemy).CurrentStage
    if ability_number == 0 or ability_number == 25 then
        return true
    end
    local ability = ABILITY_CHECK[ability_number]
    return Tracker:FindObjectForCode(ability).Active
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
    if level_access("l2") and ice_cream_arena.Active and stage_ability(ability_name, "s2_a") then
        return true
    elseif level_access("l3") and butter_arena.Active and stage_ability(ability_name, "s3_a") then
        return true
    elseif level_access("l4") and grape_arena.Active and stage_ability(ability_name, "s4_a") then
        return true
    elseif level_access("l5") and yogurt_arena.Active and stage_ability(ability_name, "s5_a") then
        return true
    elseif level_access("l6") and orange_arena.Active and stage_ability(ability_name, "s6_a") then
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
    if level_access("l1") and vegetable_museum.Active and stage_ability(ability_name, "s1_m") then
        return true
    elseif level_access("l2") and ice_cream_museum.Active and stage_ability(ability_name, "s2_m") then
        return true
    elseif level_access("l3") and butter_museum.Active and stage_ability(ability_name, "s3_m") then
        return true
    elseif level_access("l4") and grape_museum.Active and stage_ability(ability_name, "s4_m") then
        return true
    elseif level_access("l5") and yogurt_museum.Active and stage_ability(ability_name, "s5_m") then
        return true
    elseif level_access("l6") and orange_museum.Active and stage_ability(ability_name, "s6_m") then
        return true
    end
    return false
end
