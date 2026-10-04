-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerBuffs.story
-- Decompile time: 4.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TowerBuffs = require(script.Parent.TowerBuffs)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local createElement = React.createElement

local function getValue() -- Line: 10
    return math.floor((math.random()) * 100) / 100
end

local function render(a1) -- Line: 14 -- upvalues: createElement (val), TowerBuffs (val), Enum (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromOffset(200, 200),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        content = createElement(TowerBuffs, {
            story = true,
            buffs = {
                {name = "Cooldown", value = math.floor((math.random()) * 100) / 100},
                {name = "Discount", value = math.floor((math.random()) * 100) / 100},
                {name = "Fatigue", value = math.floor((math.random()) * 100) / 100},
                {name = "Damage", value = math.floor((math.random()) * 100) / 100},
                {name = "Hidden", value = math.floor((math.random()) * 100) / 100},
                {name = "Range", value = math.floor((math.random()) * 100) / 100},
                {name = "Scared", value = math.floor((math.random()) * 100) / 100},
                {
                    name = "DisableDiscount",
                    value = math.floor((math.random()) * 100) / 100,
                },
                {
                    name = Enum.StatusEffect.Coordination,
                    value = math.floor((math.random()) * 100) / 100,
                },
                {value = 100, name = Enum.StatusEffect.SharedOptics},
            },
        }),
    })
end

return function(a1) -- Line: 39 -- upvalues: ReactRoblox (val), createElement (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((createElement(render)))
    return function() -- Line: 43 -- upvalues: u4 (val)
        u4:unmount()
    end
end