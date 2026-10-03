-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Transition.Slide
-- Decompile time: 6.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
ReplicatedStorage:WaitForChild("Shared")
local Packages = ReplicatedStorage:WaitForChild("Packages")
local Fusion = require(Packages.Fusion)
local SpringScheduler = require(Packages.Fusion.Animation.SpringScheduler)
local Value = Fusion.Value
local Observer = Fusion.Observer
local Spring = Fusion.Spring
local Fade = require(script.Parent.Fade)
local Stagger = require(script.Parent.Utils.Stagger)
local u40 = {
    Offset = 40,
    Duration = 0.2,
    FadeDuration = 0.2,
    Staggered = true,
    UseCenter = false,
    Direction = "Right",
    Tween = {Type = "Spring", Speed = 15, Damping = 0.4},
}
local u42 = {}
local u43 = {}

local function addUDim(a1, a2) -- Line: 34 -- types: a1: userdata, a2: userdata
    return UDim2.new(a1.X.Scale + a2.X.Scale, a1.X.Offset + a2.X.Offset, a1.Y.Scale + a2.Y.Scale, a1.Y.Offset + a2.Y.Offset)
end

local function getActiveSpring(a1, a2) -- Line: 43 -- upvalues: u42 (val) -- types: a1: userdata, a2: string
    for k, v in pairs(u42) do
        if v.Instance == a1 and v.Property == a2 then
            return k, v
        end
    end
end

local function getActiveTween(a1, a2) -- Line: 51 -- upvalues: u43 (val) -- types: a1: userdata, a2: string
    for k, v in pairs(u43) do
        if v.Instance == a1 and v.Property == a2 then
            return k
        end
    end
end

local function getSpringVelocity(a1) -- Line: 59
    local v1 = 0
    for i, v in ipairs(a1._springVelocities) do
        v1 = v1 + v
    end
    return (math.abs(v1))
end

local function cancelLastAnimation(a1, a2) -- Line: 69
    -- upvalues: u42 (val), u43 (val)
    local v1, v2, v3
    for k, v in pairs(u42) do
        if v.Instance == a1 and v.Property == a2 then
            v1 = k
            v2 = v
            for k2, i in pairs(u43) do
                if i.Instance == a1 and i.Property == a2 then
                    v3 = k2
                    if v1 then
                        v2.Disconnect()
                        u42[v1] = nil
                    end
                    if v3 then
                        u43[v3] = nil
                        v3:Cancel()
                    end
                    return
                end
            end
            v3 = nil
            if v1 then
                v2.Disconnect()
                u42[v1] = nil
            end
            if v3 then
                u43[v3] = nil
                v3:Cancel()
            end
            return
        end
    end
    v1 = nil
    for k3, j in pairs(u43) do
        if j.Instance == a1 and j.Property == a2 then
            v3 = k3
            if v1 then
                (nil).Disconnect()
                u42[v1] = nil
            end
            if v3 then
                u43[v3] = nil
                v3:Cancel()
            end
            return
        end
    end
    v3 = nil
    if v1 then
        v2.Disconnect()
        u42[v1] = nil
    end
    if v3 then
        u43[v3] = nil
        v3:Cancel()
    end
end

local function useSpring(a1, a2, a3, a4, a5, a6) -- Line: 84
    -- upvalues: Value (val), Spring (val), Observer (val), SpringScheduler (val), u42 (val)
    local v1 = Value(a3)
    local u13 = Spring(v1, a5, a6)
    local u14 = nil
    local u21 = (Observer(u13)):onChange(function() -- Line: 96 -- upvalues: u13 (val), u14 (ref), a1 (val), a2 (val)
        local v1 = u13:get(false)
        local v2 = 0
        for i, v in ipairs(u13._springVelocities) do
            v2 = v2 + v
        end
        if math.abs(v2) < 0.001 and u14 then
            u14()
        end
        a1[a2] = v1
    end)

    function u14() -- Line: 106 -- upvalues: SpringScheduler (upval), u13 (val), u42 (upval), u21 (val)
        SpringScheduler.remove(u13)
        u42[u13] = nil
        u21()
    end

    u42[u13] = {
        Instance = a1,
        Property = a2,
        Disconnect = u14,
        Callback = function() -- Line: 116 -- upvalues: a1 (val), a2 (val), u13 (val)
            a1[a2] = u13.p
        end,
    }
    v1:set(a4)
end

local function useTween(a1, a2, a3, a4, a5) -- Line: 124
    -- upvalues: TweenService (val), u43 (val)
    local u16 = TweenService:Create(a1, TweenInfo.new(a4, a5.EasingStyle, a5.EasingDirection), {[a2] = a3})
    u43[u16] = {Instance = a1, Property = a2}
    u16.Completed:Connect(function() -- Line: 141 -- upvalues: u43 (upval), u16 (val)
        u43[u16] = nil
    end)
    u16:Play()
end

local function useAnimation(a1, a2, a3, a4, a5, a6) -- Line: 148
    -- upvalues: u42 (val), u43 (val), useSpring (val), useTween (val)
    local v1, v2, v3
    for k, v in pairs(u42) do
        if v.Instance == a1 and v.Property == a2 then
            v1 = k
            v2 = v
            for k2, i in pairs(u43) do
                if i.Instance == a1 and i.Property == a2 then
                    v3 = k2
                    if v1 then
                        v2.Disconnect()
                        u42[v1] = nil
                    end
                    if v3 then
                        u43[v3] = nil
                        v3:Cancel()
                    end
                    if a3 == a4 then
                        return
                    end
                    if a6.Type == "Spring" then
                        useSpring(a1, a2, a3, a4, a6.Speed, a6.Damping)
                        return
                    end
                    useTween(a1, a2, a4, a5, a6)
                    return
                end
            end
            v3 = nil
            if v1 then
                v2.Disconnect()
                u42[v1] = nil
            end
            if v3 then
                u43[v3] = nil
                v3:Cancel()
            end
            if a3 == a4 then
                return
            end
            if a6.Type == "Spring" then
                useSpring(a1, a2, a3, a4, a6.Speed, a6.Damping)
                return
            end
            useTween(a1, a2, a4, a5, a6)
            return
        end
    end
    v1 = nil
    for k3, j in pairs(u43) do
        if j.Instance == a1 and j.Property == a2 then
            v3 = k3
            if v1 then
                (nil).Disconnect()
                u42[v1] = nil
            end
            if v3 then
                u43[v3] = nil
                v3:Cancel()
            end
            if a3 == a4 then
                return
            end
            if a6.Type == "Spring" then
                useSpring(a1, a2, a3, a4, a6.Speed, a6.Damping)
                return
            end
            useTween(a1, a2, a4, a5, a6)
            return
        end
    end
    v3 = nil
    if v1 then
        v2.Disconnect()
        u42[v1] = nil
    end
    if v3 then
        u43[v3] = nil
        v3:Cancel()
    end
    if a3 == a4 then
        return
    end
    if a6.Type == "Spring" then
        useSpring(a1, a2, a3, a4, a6.Speed, a6.Damping)
        return
    end
    useTween(a1, a2, a4, a5, a6)
end

return function(a1, a2, a3) -- Line: 169
    -- upvalues: u40 (val), Stagger (val), useAnimation (val), Fade (val)
    local Attribute, v1, v2
    local v3 = a3 or u40
    local Duration = v3.Duration
    if not Duration then
        Duration = u40.Duration
    end
    local u12 = v3.FadeDuration or Duration
    local Staggered = v3.Staggered or u40.Staggered
    local Direction = v3.Direction or u40.Direction
    local Offset = v3.Offset or u40.Offset
    local Tween = v3.Tween
    if not Tween then
        Tween = u40.Tween
    end
    local v4 = Stagger.GetDirection(Direction) * Offset
    local v5 = UDim2.fromOffset(v4.X, v4.Y)
    local v6 = {}
    if a3.UseWorkaround ~= true then
        for i, v in ipairs(a2:GetChildren()) do
            if v:IsA("GuiObject") then
                table.insert(v6, v)
            end
        end
    else
        local Children, v7
        for i2, i3 in ipairs(a2:GetChildren()) do
            if i3:IsA("GuiObject") then
                Children = i3:GetChildren()
                v7 = Children[1]
                if #Children == 1 and v7 and v7:IsA("GuiObject") then
                    table.insert(v6, v7)
                end
            end
        end
    end

    local function u102(a1_2, a2, a3) -- Line: 201
        -- upvalues: useAnimation (upval), Duration (val), Tween (val), u12 (val), Fade (upval), a1 (val)
        useAnimation(a1_2, "Position", a2, a3, Duration, Tween)
        if u12 > 0 then
            Fade(a1, a1_2, {Duration = u12}, true)
        end
    end

    for i4, j in ipairs(v6) do
        Attribute = j:GetAttribute("BasePosition")
        if not Attribute then
            Attribute = j.Position
            j:SetAttribute("BasePosition", Attribute)
        end
        v1 = UDim2.new(
            Attribute.X.Scale + v5.X.Scale,
            Attribute.X.Offset + v5.X.Offset,
            Attribute.Y.Scale + v5.Y.Scale,
            Attribute.Y.Offset + v5.Y.Offset
        )
        v2 = Stagger.GetPercent(j, Direction, Tween.UseCenter)
        if not a1 then
            u194 = Attribute
        else
            local u194 = v1
        end
        if not a1 then
            u199 = v1
        else
            local u199 = Attribute
        end
        j.Position = u194
        if not Staggered then
            u102(j, u194, u199)
        else
            task.delay((1 - v2) * Duration, function() -- Line: 226 -- upvalues: u102 (val), j (val), u194 (val), u199 (val)
                u102(j, u194, u199)
            end)
        end
    end
end