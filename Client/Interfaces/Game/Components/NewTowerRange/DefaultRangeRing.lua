-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewTowerRange.DefaultRangeRing
-- Decompile time: 0.71 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Prompts = require(ReplicatedStorage.Shared.UI.Components.Prompts)
local React = require(ReplicatedStorage.Shared.UI.React)
local RangeRing = require(ReplicatedStorage.Client.Interfaces.Game.Components.RangeRing)
local LowQualityRangeRing = require(script.Parent.LowQualityRangeRing)
local createElement = React.createElement
return (React.memo(function(a1) -- Line: 25
    -- upvalues: Prompts (val), createElement (val), LowQualityRangeRing (val), RangeRing (val)
    local ZIndex = a1.ZIndex or Prompts.zIndex or 1
    if a1.isLowQuality then
        return createElement(LowQualityRangeRing, {
            BaseRadius = a1.BaseRadius,
            Color = a1.Color,
            DisableFill = a1.DisableFill,
            FillTransparency = a1.FillTransparency,
            LineTransparency = a1.LineTransparency,
            Radius = a1.Radius,
            ZIndex = ZIndex,
        })
    end
    return createElement(RangeRing, {
        Radius = a1.Radius,
        Color = a1.Color,
        DisableFill = a1.DisableFill,
        FillTransparency = a1.FillTransparency,
        LineOffset = a1.LineOffset,
        LineSize = a1.LineSize,
        LineTransparency = a1.LineTransparency,
        Offset = Vector3.new(0, 0.01 * ZIndex, 0),
        ParentRef = a1.ParentRef,
    })
end))