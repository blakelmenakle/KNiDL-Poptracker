function has_ability(...)
    local ability_list = { ... }
    for _, ability_name in pairs(ability_list) do 
        local ability = Tracker:FindObjectForCode(ability_name)
        if ability.Active then
            local levels = {"l1", "l2", "l3", "l4", "l5", "l6", "l7"}
            for _, level in pairs(levels) do
                if level_access(level) and enemy_ability(ability_name, table.unpack(LEVEL_ENEMIES[level])) then
                    return true
                end
            end
            if arena_enemy(ability_name) then
                return true
            elseif museum_enemy(ability_name) then
                return true
            end
        end
    end
    return false
end

function destroy_metal()
    return has_ability("burning", "hammer", "wheel")
end
function light_fuse()
    return has_ability("burning", "fire", "laser")
end
function pound_stake()
    return has_ability("hammer", "stone")
end

function ability_reset()
	if Tracker:FindObjectForCode("reset_abilities").CurrentStage == 1 then
		local enemyList = ALL_ENEMIES
		for _, enemy in ipairs(enemyList) do
            local ability = DEFAULT_ABILITIES[enemy]
			Tracker:FindObjectForCode(enemy).CurrentStage = ABILITY_LOOKUP[ability]
		end
    Tracker:FindObjectForCode("reset_abilities").CurrentStage = 0
	end
end

function ability_clear()
	if Tracker:FindObjectForCode("clear_abilities").CurrentStage == 1 then
		local enemyList = ALL_ENEMIES
		for _, enemy in ipairs(enemyList) do
			Tracker:FindObjectForCode(enemy).CurrentStage = 0
		end
    Tracker:FindObjectForCode("clear_abilities").CurrentStage = 0
	end
end

-- function fill_abilities()
-- 	if Tracker:FindObjectForCode("fill_abilities").CurrentStage == 1 then
-- 		local enemyList = ALL_ENEMIES
-- 		for _, enemy in ipairs(enemyList) do
-- 			Tracker:FindObjectForCode(enemy).CurrentStage = Tracker:FindObjectForCode(enemy.."_hidden").CurrentStage
-- 		end
--  Tracker:FindObjectForCode("fill_abilities").CurrentStage = 0
-- 	end
-- end

ScriptHost:AddWatchForCode("ability resetter", "reset_abilities", ability_reset)
ScriptHost:AddWatchForCode("ability clearer", "clear_abilities", ability_clear)
-- ScriptHost:AddWatchForCode("ability filler", "fill_abilities", ability_fill)
