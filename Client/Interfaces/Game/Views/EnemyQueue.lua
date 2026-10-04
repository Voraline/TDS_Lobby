-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.EnemyQueue
-- Decompile time: 1.27 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EnemyQueue = require(ReplicatedStorage.Client.Interfaces.Game.Components.PVP.EnemyQueue)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
return function() -- Line: 14 -- upvalues: useGameStateValue (val), useScale (val), createElement (val), EnemyQueue (val)
    local v1 = useGameStateValue("GameMode", "")
    local v2 = useScale(1.5)
    if v1 ~= "PVP" then
        return
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromOffset(640, 60),
    }, {
        uiScale = createElement("UIScale", {Scale = v2}),
        enemyQueue = createElement(EnemyQueue),
    })
end