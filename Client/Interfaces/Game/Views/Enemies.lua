-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.Enemies
-- Decompile time: 1.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Client.Interfaces.Stores.Game.EnemiesStore)
require(ReplicatedStorage.Packages.ReactCharm)
require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local NewEnemyHealth = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewEnemyHealth)
require(ReplicatedStorage.Client.Interfaces.Hooks.useCurrentTeam)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement
local u44 = Vector2.new(1987, 1152)

local function EnemyHealthSlot(a1) -- Line: 15 -- upvalues: createElement (val), u44 (val), NewEnemyHealth (val)
    local v1 = math.max(a1.MaxHealth or a1.Health or 1, 1)
    local v2 = math.clamp(a1.Health or v1, 0, v1)
    local v3 = math.max(a1.Shield or 0, 0)
    local v4 = a1.Scale or 1
    local v5 = {
        BackgroundTransparency = 1,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.fromOffset(768, 64),
        Visible = a1.Visible ~= false,
    }
    local v6 = {}
    local v7 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(u44.X * v4, u44.Y * v4),
    }
    local v8 = {}
    local v9 = {health = v2, maxHealth = v1, shieldHealth = v3}
    local DisplayName = a1.DisplayName or a1.Name
    v9.enemyName = DisplayName
    v8.health = createElement(NewEnemyHealth, v9)
    v6.healthParent = createElement("Frame", v7, v8)
    return createElement("Frame", v5, v6)
end

return function(a1) -- Line: 46
    return nil
end