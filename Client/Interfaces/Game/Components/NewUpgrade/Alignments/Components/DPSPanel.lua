-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.DPSPanel
-- Decompile time: 0.51 ms

local Shared = (game:GetService("ReplicatedStorage")).Shared
local Parent = script.Parent
local React = require(Shared.UI.React)
local StatsPanel = require(Parent.StatsPanel)
local createElement = React.createElement
return function(a1) -- Line: 16 -- upvalues: createElement (val), StatsPanel (val)
    return createElement(StatsPanel, {
        ShowTooltips = true,
        Title = "DPS",
        TitleHeight = 24,
        ShowUnderline = false,
        Size = a1.Size,
        Position = a1.Position,
        AnchorPoint = a1.AnchorPoint,
        LayoutOrder = a1.LayoutOrder,
        Stats = a1.Stats,
        Transparency = a1.Transparency,
        Visible = a1.Visible,
        TooltipsEnabled = a1.TooltipsEnabled,
        TooltipName = a1.TooltipName or "DPSPanel",
        TitleTextSize = UDim2.fromScale(0.9, 0.8),
    })
end