-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Transition.Utils.Stagger
-- Decompile time: 2.26 ms

local u0 = {}
u0.Up = Vector2.new(0, -1)
u0.Down = Vector2.new(0, 1)
u0.Left = Vector2.new(-1, 0)
u0.Right = Vector2.new(1, 0)
local v1 = {}

local function distance(a1, a2) -- Line: 14 -- types: a1: vector, a2: vector
    return (math.sqrt((a2.X - a1.X) ^ 2 + (a2.Y - a1.Y) ^ 2))
end

function v1.GetPercent(a1, a2, a3) -- Line: 21 -- types: a1: userdata, a2: string, a3: boolean?
    local v1
    local ViewportSize = workspace.CurrentCamera.ViewportSize
    local Attribute = a1:GetAttribute("BaseAbsPosition")
    if not Attribute then
        Attribute = a1.AbsolutePosition
        if Attribute.X ~= 0 and Attribute.Y ~= 0 then
            a1:SetAttribute("BaseAbsPosition", Attribute)
        end
    end
    local v2 = nil
    if a3 then
        v2 = Vector2.new(ViewportSize.X / 2, ViewportSize.Y / 2)
    elseif a2 == "Left" then
        v2 = Vector2.new(ViewportSize.X, ViewportSize.Y / 2)
    elseif a2 == "Right" then
        v2 = Vector2.new(0, ViewportSize.Y / 2)
    elseif a2 == "Up" then
        v2 = Vector2.new(ViewportSize.X / 2, ViewportSize.Y)
    elseif a2 == "Down" then
        v2 = Vector2.new(ViewportSize.X / 2, 0)
    end
    if a2 ~= "Up" and a2 ~= "Down" then
        v1 = Vector2.new(Attribute.X, v2.Y)
        local X = v2.X
        local X_2 = v1.X
        local Y = v2.Y
        local Y_2 = v1.Y
        return math.sqrt((X_2 - X) ^ 2 + (Y_2 - Y) ^ 2) / ViewportSize.X
    end
    v1 = Vector2.new(v2.X, Attribute.Y)
    local X_3 = v2.X
    local X_4 = v1.X
    local Y_3 = v2.Y
    local Y_4 = v1.Y
    return math.sqrt((X_4 - X_3) ^ 2 + (Y_4 - Y_3) ^ 2) / ViewportSize.Y
end

function v1.GetDirection(a1) -- Line: 58 -- upvalues: u0 (val) -- types: a1: string
    return u0[a1]
end

return v1