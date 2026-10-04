-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SkillInfo.story
-- Decompile time: 2.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SkillInfo = require(script.Parent.SkillInfo)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 8 -- upvalues: Enum (val), React (val), SkillInfo (val)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        skillInfo = React.createElement(SkillInfo, {
            SkillComparison = "+10% Minion Health",
            SkillPoints = 0,
            SkillEnum = Enum.SkillTreeNode.BeefedUpMinions,
            SkillPointCost = React.useBinding(1000),
            SkillPriceNumber = React.useBinding(500),
        }),
    })
end

return function(a1) -- Line: 29 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 34 -- upvalues: u4 (val)
        u4:unmount()
    end
end