-- Script path: ReplicatedStorage.Packages.Fusion.Animation.packType
-- Decompile time: 1.82 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local Oklab = require(Parent.Colour.Oklab)
return function(a1, a2) -- Line: 16 -- upvalues: Oklab (val) -- types: a1: table, a2: string
    if a2 == "number" then
        return a1[1]
    end
    if a2 == "CFrame" then
        return (CFrame.new(a1[1], a1[2], a1[3])) * CFrame.fromAxisAngle(Vector3.new(a1[4], a1[5], a1[6]).Unit, a1[7])
    end
    if a2 == "Color3" then
        return Oklab.from(Vector3.new(a1[1], a1[2], a1[3]), false)
    end
    if a2 == "ColorSequenceKeypoint" then
        return ColorSequenceKeypoint.new(a1[4], Oklab.from(Vector3.new(a1[1], a1[2], a1[3]), false))
    end
    if a2 == "DateTime" then
        return DateTime.fromUnixTimestampMillis(a1[1])
    end
    if a2 == "NumberRange" then
        return NumberRange.new(a1[1], a1[2])
    end
    if a2 == "NumberSequenceKeypoint" then
        return NumberSequenceKeypoint.new(a1[2], a1[1], a1[3])
    end
    if a2 == "PhysicalProperties" then
        return PhysicalProperties.new(a1[1], a1[2], a1[3], a1[4], a1[5])
    end
    if a2 == "Ray" then
        return Ray.new(Vector3.new(a1[1], a1[2], a1[3]), (Vector3.new(a1[4], a1[5], a1[6])))
    end
    if a2 == "Rect" then
        return Rect.new(a1[1], a1[2], a1[3], a1[4])
    end
    if a2 == "Region3" then
        local v1 = Vector3.new(a1[1], a1[2], a1[3])
        local v2 = Vector3.new(a1[4] / 2, a1[5] / 2, a1[6] / 2)
        return Region3.new(v1 - v2, v1 + v2)
    end
    if a2 == "Region3int16" then
        return Region3int16.new(Vector3int16.new(a1[1], a1[2], a1[3]), Vector3int16.new(a1[4], a1[5], a1[6]))
    end
    if a2 == "UDim" then
        return UDim.new(a1[1], a1[2])
    end
    if a2 == "UDim2" then
        return UDim2.new(a1[1], a1[2], a1[3], a1[4])
    end
    if a2 == "Vector2" then
        return Vector2.new(a1[1], a1[2])
    end
    if a2 == "Vector2int16" then
        return Vector2int16.new(a1[1], a1[2])
    end
    if a2 == "Vector3" then
        return (Vector3.new(a1[1], a1[2], a1[3]))
    end
    if a2 == "Vector3int16" then
        return Vector3int16.new(a1[1], a1[2], a1[3])
    end
    return nil
end