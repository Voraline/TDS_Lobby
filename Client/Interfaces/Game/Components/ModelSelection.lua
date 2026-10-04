-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.ModelSelection
-- Decompile time: 2.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useRef = React.useRef
local useState = React.useState
local useEffect = React.useEffect
local createElement = React.createElement
local CaptureEditor = require(ReplicatedStorage.Client.Controllers.Shared.DebugController.Tools.CaptureEditor)
require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useTween = require(ReplicatedStorage.Client.Interfaces.Hooks.useTween)
local u38 = Color3.new(1000, 1000, 1000)
return function(a1) -- Line: 16 -- upvalues: useRef (val), u38 (val), useTween (val), CaptureEditor (val), createElement (val)
    local v1, v2
    local Animate = if a1.Animate == nil then true else a1.Animate
    local Target = a1.Target
    local Color = a1.Color
    local Visible = if a1.Visible == nil then true else a1.Visible
    local ShowFill = if a1.ShowFill == nil then Visible else a1.ShowFill
    local v3 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
    local v4 = useRef(u38)
    local v5 = useRef(nil)
    if not Target then
        if a1.ShouldDeselect then
            v5.current = nil
        end
        Visible = false
    else
        v5.current = Target
    end
    if not Animate then
        v1 = if not Visible then 1 else 0
        v2 = if not Visible then 1 else if not ShowFill then 1 else 0.6
    else
        local v6, v7 = useTween(1, v3, true, true)
        v2 = v6
        local v8 = v7
        v6, v7 = useTween(1, v3, true, true)
        v1 = v6
        v7 = if not Visible then 1 else 0
        v7(v7)
        v8(if not Visible then 1 else if not ShowFill then 1 else 0.6)
    end
    if Color and Visible then
        v4.current = Color
    end
    if CaptureEditor.toggleHighlights and CaptureEditor.toggleHighlights:get() then
        return
    end
    return createElement("Highlight", {
        Name = a1.Name or "ModelSelection",
        OutlineColor = v4.current,
        FillColor = v4.current,
        FillTransparency = v2,
        OutlineTransparency = v1,
        Adornee = v5.current,
    })
end