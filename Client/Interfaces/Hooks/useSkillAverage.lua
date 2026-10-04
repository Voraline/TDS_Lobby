-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSkillAverage
-- Decompile time: 1.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
return function(a1) -- Line: 7 -- upvalues: useGameStateValue (val), React (val), SkillsUtil (val)
    local v1 = {useGameStateValue("Skills", {}), a1}
    local v2 = React.useMemo(function() -- Line: 9 -- upvalues: SkillsUtil (upval), a1 (val)
        local v1 = SkillsUtil.avgSkill(a1)
        return {level = v1, value = SkillsUtil.evaluate(a1, v1)}
    end, v1)
    return v2.level, v2.value
end