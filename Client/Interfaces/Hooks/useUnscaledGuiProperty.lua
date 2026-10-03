-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUnscaledGuiProperty
-- Decompile time: 4.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local React = require(ReplicatedStorage.Shared.UI.React)

local function nearlyEqualNumber(a1, a2, a3) -- Line: 8 -- types: a1: number, a2: number, a3: number
    return math.abs(a1 - a2) <= a3
end

local function nearlyEqualUDim(a1, a2, a3) -- Line: 12 -- types: a1: userdata, a2: userdata, a3: number
    local v1 = false
    if a1.Scale == a2.Scale then
        v1 = math.abs(a1.Offset - a2.Offset) <= a3
    end
    return v1
end

local function nearlyEqualValue(a1, a2, a3) -- Line: 16 -- types: a3: number
    if a1 == a2 then
        return true
    end
    if a1 ~= nil and a2 ~= nil then
        local v1
        local v2 = typeof(a1)
        if v2 ~= typeof(a2) then
            return false
        end
        if v2 == "number" then
            return math.abs(a1 - a2) <= a3
        end
        if v2 == "Vector2" then
            return math.abs(a1.X - a2.X) <= a3 and math.abs(a1.Y - a2.Y) <= a3
        end
        if v2 == "UDim" then
            v1 = false
            if a1.Scale == a2.Scale then
                v1 = math.abs(a1.Offset - a2.Offset) <= a3
            end
            return v1
        end
        if v2 ~= "UDim2" then
            return false
        end
        local X_3 = a1.X
        local X_4 = a2.X
        v1 = false
        if X_3.Scale == X_4.Scale then
            v1 = math.abs(X_3.Offset - X_4.Offset) <= a3
        end
        if v1 then
            local Y_3 = a1.Y
            local Y_4 = a2.Y
            v1 = false
            if Y_3.Scale == Y_4.Scale then
                v1 = math.abs(Y_3.Offset - Y_4.Offset) <= a3
            end
        end
        return v1
    end
    return false
end

local function canOwnUIScale(a1) -- Line: 51 -- types: a1: userdata
    return a1:IsA("GuiObject") or a1:IsA("LayerCollector")
end

local function getGuiPivot(a1) -- Line: 55 -- types: a1: userdata
    if not a1:IsA("GuiObject") then
        return Vector2.zero
    end
    local AbsoluteSize = a1.AbsoluteSize
    local AnchorPoint = a1.AnchorPoint
    return a1.AbsolutePosition + Vector2.new(AbsoluteSize.X * AnchorPoint.X, AbsoluteSize.Y * AnchorPoint.Y)
end

local function getOwnUIScale(a1) -- Line: 67 -- types: a1: userdata
    local v1 = 1
    for i, j in a1:GetChildren() do
        if j:IsA("UIScale") then
            v1 = v1 * j.Scale
        end
    end
    return v1
end

local function getScaleOwners(a1) -- Line: 79 -- upvalues: getOwnUIScale (val) -- types: a1: userdata?
    local v1
    local v2 = {}
    local v3 = 1
    local Parent = a1
    local v4 = false
    while Parent do
        v1 = Parent:IsA("GuiObject") or Parent:IsA("LayerCollector")
        if not v1 then
            if v4 then
                break
            end
        else
            v1 = getOwnUIScale(Parent)
            v3 = v3 * v1
            if v1 ~= 1 then
                table.insert(v2, {instance = Parent, scale = v1})
            end
        end
        Parent = Parent.Parent
    end
    return v2, v3
end

local function unscaleAbsolutePosition(a1, a2) -- Line: 108 -- types: a1: userdata
    local AbsoluteSize, AnchorPoint, instance, scale, zero
    local v1 = a1
    local v2 = nil
    local v3 = nil
    for i, j in a2, v2, v3 do
        scale = j.scale
        if scale ~= 0 then
            instance = j.instance
            if instance:IsA("GuiObject") then
                AbsoluteSize = instance.AbsoluteSize
                AnchorPoint = instance.AnchorPoint
                zero = instance.AbsolutePosition + Vector2.new(AbsoluteSize.X * AnchorPoint.X, AbsoluteSize.Y * AnchorPoint.Y)
            else
                zero = Vector2.zero
            end
            v1 = zero + (v1 - zero) / scale
        end
    end
    return v1
end

local function unscaleValue(a1, a2, a3, a4) -- Line: 123
    -- upvalues: unscaleAbsolutePosition (val)
    if a1 == "AbsolutePosition" and typeof(a2) == "Vector2" then
        return (unscaleAbsolutePosition(a2, a4))
    end
    if a3 == 0 then
        return a2
    end
    if typeof(a2) == "number" or typeof(a2) == "Vector2" then
        return a2 / a3
    end
    if typeof(a2) == "UDim" then
        return UDim.new(a2.Scale, a2.Offset / a3)
    end
    if typeof(a2) == "UDim2" then
        return UDim2.new(a2.X.Scale, a2.X.Offset / a3, a2.Y.Scale, a2.Y.Offset / a3)
    end
    return a2
end

return function(a1, a2, a3, a4) -- Line: 156
    -- upvalues: React (val), Maid (val), nearlyEqualValue (val), getScaleOwners (val), unscaleValue (val)
    local v1, v2
    if not a4 then
        v1, v2 = React.useState(nil)
    else
        v1, v2 = React.useBinding(nil)
    end
    local u19 = v2
    local useLayoutEffect = React.useLayoutEffect
    local v3 = {}
    local v4 = a3 or {}
    v3[1] = a1
    v3[2] = a2
    v3[3] = unpack(v4)
    useLayoutEffect(function() -- Line: 165
        -- upvalues: Maid (upval), a1 (val), u19 (ref), a2 (val), nearlyEqualValue (upval), getScaleOwners (upval)
        -- upvalues: unscaleValue (upval)
        debug.profilebegin("useUnscaledGuiProperty - LayoutEffect")
        local u5 = Maid.new()
        local u6 = true
        local u7 = nil

        local function update() -- Line: 171
            -- upvalues: u6 (ref), a1 (upval), u7 (ref), u19 (upval), a2 (upval), nearlyEqualValue (upval)
            -- upvalues: getScaleOwners (upval), unscaleValue (upval)
            debug.profilebegin("useUnscaledGuiProperty - Update")
            if not u6 then
                debug.profileend()
                return
            end
            local current = a1.current
            if not current then
                u7 = nil
                u19(nil)
                debug.profileend()
                return
            end
            local v1 = current[a2]
            if nearlyEqualValue(u7, v1, 0.001) then
                debug.profileend()
                return
            end
            u7 = v1
            local v2, v3 = getScaleOwners(current)
            u19(unscaleValue(a2, v1, v3, v2))
            debug.profileend()
        end

        local current = a1.current
        if current then
            u5:Mark(((current:GetPropertyChangedSignal(a2)):Connect(update)))
            u5:Mark((current.AncestryChanged:Connect(update)))
        end
        update()
        debug.profileend()
        return function() -- Line: 211 -- upvalues: u6 (ref), u5 (val)
            u6 = false
            u5:Sweep()
        end
    end, v3)
    return v1
end