-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSkill
-- Decompile time: 1.77 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local LocalPlayer = Players.LocalPlayer
return function(a1) -- Line: 10 -- upvalues: useGameStateValue (val), React (val), SkillsUtil (val), LocalPlayer (val)
    local v1 = {useGameStateValue("Skills", {}), a1}
    local v2 = React.useMemo(function() -- Line: 12 -- upvalues: SkillsUtil (upval), LocalPlayer (upval), a1 (val)
        local v1 = SkillsUtil.skill(LocalPlayer, a1)
        return {level = v1, value = SkillsUtil.evaluate(a1, v1)}
    end, v1)
    return v2.level, v2.value
end