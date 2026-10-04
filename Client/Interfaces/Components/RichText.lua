-- Script path: ReplicatedStorage.Client.Interfaces.Components.RichText
-- Decompile time: 4.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local RichText = require(ReplicatedStorage.Shared.UI.Components.RichText)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local createElement = React.createElement
local useEffect = React.useEffect
local useRef = React.useRef
local memo = React.memo
local Fragment = React.Fragment
local u31 = {}
Scheduler.add("ReactAnimatedRichText", RunService.Heartbeat, function(a1) -- Line: 36 -- upvalues: u31 (val)
    for i, j in u31 do
        if j then
            i:Step(a1)
        end
    end
end)
return memo(function(a1) -- Line: 44
    -- upvalues: useRef (val), useEffect (val), RichText (val), u31 (val), createElement (val), React (val)
    -- upvalues: Fragment (val)
    local u2 = useRef()
    local u4 = useRef()
    local u7 = useRef(0)
    local u10 = a1.Playing ~= false
    local ParticleScale = a1.ParticleScale
    local u15 = a1.Animated ~= false
    local u19 = a1.Centered ~= false
    local u23 = a1.NoStroke == true
    local u27 = a1.TopAligned == true
    local u30 = a1.MaxVisibleGraphemes or -1
    local u32 = a1.Text or "Hello World!"
    local FontSize = a1.FontSize
    local v1 = {u32, u4}
    useEffect(function() -- Line: 61 -- upvalues: u4 (val), u32 (val)
        if u4.current then
            u4.current:SetText(u32)
            u4.current:Step(0)
        end
    end, v1)
    v1 = {u30, u4}
    useEffect(function() -- Line: 68 -- upvalues: u4 (val), u30 (val)
        if u4.current and u30 then
            u4.current:SetMaxVisibleGraphemes(u30)
        end
    end, v1)
    v1 = {u2, u15, FontSize, u23}
    useEffect(function() -- Line: 74
        -- upvalues: u2 (val), RichText (upval), FontSize (val), u15 (val), u19 (val), u27 (val), ParticleScale (val)
        -- upvalues: u32 (val), u4 (val), u31 (upval), u23 (val)
        if not u2.current then
            return
        end
        local u27_2 = nil
        local u14 = RichText({
            textScale = 1,
            textSettings = {FontSize = FontSize},
            animate = u15,
            centered = u19,
            topAligned = u27,
            particleScale = ParticleScale,
            text = u32,
            Parent = u2.current,
        })
        u4.current = u14
        if u15 then
            u31[u14] = true
        end
        if u23 then
            u27_2 = u14._container.DescendantAdded:Connect(function(a1) -- Line: 102 -- types: a1: userdata
                if a1:IsA("UIStroke") then
                    a1:Destroy()
                end
            end)
            for i, v in ipairs(u14._container:GetDescendants()) do
                if v:IsA("UIStroke") then
                    v:Destroy()
                end
            end
        end
        return function() -- Line: 115 -- upvalues: u31 (upval), u14 (val), u27_2 (ref), u4 (upval)
            u31[u14] = nil
            u14:Destroy()
            if u27_2 then
                u27_2:Disconnect()
            end
            if u4.current == u14 then
                u4.current = nil
            end
        end
    end, v1)
    v1 = {u2, u15, FontSize, u23, u10}
    useEffect(function() -- Line: 129 -- upvalues: u4 (val), u31 (upval), u10 (val)
        local current = u4.current
        if current then
            u31[current] = u10
            if not u10 then
                current:ClearParticles()
            end
        end
    end, v1)
    v1 = {
        Size = a1.Size,
        AutomaticSize = a1.AutomaticSize,
        LayoutOrder = a1.LayoutOrder,
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        ZIndex = a1.ZIndex,
        BackgroundTransparency = 1,
        Name = "RichTextContainer",
        ref = u2,
    }

    v1[React.Change.AbsoluteSize] = function() -- Line: 150 -- upvalues: u2 (val), u4 (val), u7 (val)
        if u2.current and u4.current then
            if u7.current == u2.current.AbsoluteSize.Y then
                return
            end
            u7.current = u2.current.AbsoluteSize.Y
            u4.current:Step(0)
            return
        end
    end

    return createElement("Frame", v1, {content = createElement(Fragment, nil, a1.children or {})})
end)