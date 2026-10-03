-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SkillReset.story
-- Decompile time: 0.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SkillReset = require(script.Parent.SkillReset)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 7 -- upvalues: React (val), SkillReset (val)
    local v1, u4 = React.useBinding(true)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        skillReset = React.createElement(SkillReset, {
            Visible = v1,
            ExitCallback = function() -- Line: 12 -- upvalues: u4 (val)
                u4(false)
            end,
            PurchaseCallback = function() -- Line: 16 -- upvalues: u4 (val)
                u4(false)
            end,
            refundCost = React.useState(10000),
            refundSkillPoints = React.useState(500000),
        }),
    })
end

return function(a1) -- Line: 36 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 41 -- upvalues: u4 (val)
        u4:unmount()
    end
end