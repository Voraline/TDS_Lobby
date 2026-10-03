-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Objectives.Objective.story
-- Decompile time: 0.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Parent = require(script.Parent)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 9 -- upvalues: createElement (val), Parent (val), ReactRoblox (val)
    local v1 = createElement(Parent, {
        Position = UDim2.new(1, -32, 0, 16),
        AnchorPoint = Vector2.xAxis,
        Objectives = {
            {GoalDescription = "10 / 20 Waves Cleared!", Title = "Protect The Harvest!", Progress = 0.5},
            {GoalDescription = "1 / 20 Waves Cleared!", Title = "Protect The Harvest!", Progress = 0.05},
            {GoalDescription = "5 / 20 Waves Cleared!", Title = "Protect The Harvest!", Progress = 0.25},
            {GoalDescription = "20 / 20 Waves Cleared!", Title = "Protect The Harvest!", Progress = 1},
            {
                GoalDescription = "Deal 386000 Damage!",
                Title = "Deal Damage!",
                Progress = 0.9999974093264249,
            },
        },
        Size = UDim2.fromOffset(300, 0),
    })
    local u25 = ReactRoblox.createRoot(a1)
    u25:render(v1)
    return function() -- Line: 48 -- upvalues: u25 (val)
        u25:unmount()
    end
end