-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerTooltip.story
-- Decompile time: 0.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local TowerTooltip = require(script.Parent.TowerTooltip)
local createElement = React.createElement
return function(a1) -- Line: 8 -- upvalues: createElement (val), TowerTooltip (val), ReactRoblox (val)
    local v1 = createElement
    local v2 = TowerTooltip
    local v3 = {Position = UDim2.fromScale(0.5, 0.5), AnchorPoint = Vector2.new(0.5, 0.5)}
    local v4 = {"Scout", "Minigunner", "Commander", "Sniper"}
    v3.Name = v4[math.random(1, 4)]
    v3.Level = math.random(1, 5)
    v1 = v1(v2, v3)
    local u30 = ReactRoblox.createRoot(a1)
    u30:render(v1)
    return function() -- Line: 20 -- upvalues: u30 (val)
        u30:unmount()
    end
end