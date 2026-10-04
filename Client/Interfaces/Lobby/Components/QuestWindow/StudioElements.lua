-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.QuestWindow.StudioElements
-- Decompile time: 1.82 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
local u11 = {}

function u11.strokeThickness(a1) -- Line: 9 -- types: a1: number?
    if not a1 then
        return 0.02
    end
    if a1 > 1 then
        return a1 / 100
    end
    return a1
end

function u11.scaledStroke(a1, a2) -- Line: 21 -- upvalues: u11 (val), createElement (val)
    local v1 = table.clone(a1 or {})
    v1.Thickness = u11.strokeThickness(v1.Thickness)
    v1.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    return createElement("UIStroke", v1, a2)
end

function u11.textStroke(a1, a2) -- Line: 29 -- upvalues: u11 (val)
    local v1 = table.clone(a1 or {})
    v1.Thickness = v1.Thickness or 0.05
    local LineJoinMode = v1.LineJoinMode or Enum.LineJoinMode.Miter
    v1.LineJoinMode = LineJoinMode
    return u11.scaledStroke(v1, a2)
end

function u11.strokedText(a1, a2, a3, a4) -- Line: 37
    -- upvalues: u11 (val), createElement (val)
    local Children = a1.Children or {}
    a1.Children = nil
    Children.Stroke = u11.textStroke({
        Color = a2 or Color3.fromRGB(0, 0, 0),
        Thickness = a3 or 0.05,
        Transparency = a4 or 0,
    })
    return createElement("TextLabel", a1, Children)
end

return u11