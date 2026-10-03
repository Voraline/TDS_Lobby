-- Script path: ReplicatedStorage.Packages.Fusion.Animation.lerpType
-- Decompile time: 3.47 ms

local Parent = script.Parent.Parent
require(Parent.PubTypes)
local Oklab = require(Parent.Colour.Oklab)
return function(a1, a2, a3) -- Line: 16 -- upvalues: Oklab (val) -- types: a3: number
    local v1 = typeof(a1)
    if typeof(a2) == v1 then
        local v2, v3
        if v1 == "number" then
            v3 = a1
            return (a2 - v3) * a3 + v3
        end
        if v1 == "CFrame" then
            return a1:Lerp(a2, a3)
        end
        if v1 == "Color3" then
            return Oklab.from((Oklab.to(a1)):Lerp(Oklab.to(a2), a3), false)
        end
        if v1 == "ColorSequenceKeypoint" then
            v2 = a2
            v3 = a1
            return ColorSequenceKeypoint.new(
                (v2.Time - v3.Time) * a3 + v3.Time,
                Oklab.from((Oklab.to(v3.Value)):Lerp(Oklab.to(v2.Value), a3), false)
            )
        end
        if v1 == "DateTime" then
            v3 = a1
            return DateTime.fromUnixTimestampMillis((a2.UnixTimestampMillis - v3.UnixTimestampMillis) * a3 + v3.UnixTimestampMillis)
        end
        if v1 == "NumberRange" then
            v2 = a2
            v3 = a1
            return NumberRange.new((v2.Min - v3.Min) * a3 + v3.Min, (v2.Max - v3.Max) * a3 + v3.Max)
        end
        if v1 == "NumberSequenceKeypoint" then
            v2 = a2
            v3 = a1
            return NumberSequenceKeypoint.new(
                (v2.Time - v3.Time) * a3 + v3.Time,
                (v2.Value - v3.Value) * a3 + v3.Value,
                (v2.Envelope - v3.Envelope) * a3 + v3.Envelope
            )
        end
        if v1 == "PhysicalProperties" then
            v2 = a2
            v3 = a1
            return PhysicalProperties.new(
                (v2.Density - v3.Density) * a3 + v3.Density,
                (v2.Friction - v3.Friction) * a3 + v3.Friction,
                (v2.Elasticity - v3.Elasticity) * a3 + v3.Elasticity,
                (v2.FrictionWeight - v3.FrictionWeight) * a3 + v3.FrictionWeight,
                (v2.ElasticityWeight - v3.ElasticityWeight) * a3 + v3.ElasticityWeight
            )
        end
        if v1 == "Ray" then
            v2 = a2
            v3 = a1
            return Ray.new(v3.Origin:Lerp(v2.Origin, a3), v3.Direction:Lerp(v2.Direction, a3))
        end
        if v1 == "Rect" then
            v2 = a2
            v3 = a1
            return Rect.new(v3.Min:Lerp(v2.Min, a3), v3.Max:Lerp(v2.Max, a3))
        end
        if v1 == "Region3" then
            v2 = a2
            v3 = a1
            local v4 = v3.CFrame.Position:Lerp(v2.CFrame.Position, a3)
            local v5 = v3.Size:Lerp(v2.Size, a3) / 2
            return Region3.new(v4 - v5, v4 + v5)
        end
        if v1 == "Region3int16" then
            v2 = a2
            v3 = a1
            return Region3int16.new(Vector3int16.new(
                (v2.Min.X - v3.Min.X) * a3 + v3.Min.X,
                (v2.Min.Y - v3.Min.Y) * a3 + v3.Min.Y,
                (v2.Min.Z - v3.Min.Z) * a3 + v3.Min.Z
            ), Vector3int16.new(
                (v2.Max.X - v3.Max.X) * a3 + v3.Max.X,
                (v2.Max.Y - v3.Max.Y) * a3 + v3.Max.Y,
                (v2.Max.Z - v3.Max.Z) * a3 + v3.Max.Z
            ))
        end
        if v1 == "UDim" then
            v2 = a2
            v3 = a1
            return UDim.new((v2.Scale - v3.Scale) * a3 + v3.Scale, (v2.Offset - v3.Offset) * a3 + v3.Offset)
        end
        if v1 == "UDim2" or v1 == "Vector2" then
            return a1:Lerp(a2, a3)
        end
        if v1 == "Vector2int16" then
            v2 = a2
            v3 = a1
            return Vector2int16.new((v2.X - v3.X) * a3 + v3.X, (v2.Y - v3.Y) * a3 + v3.Y)
        end
        if v1 == "Vector3" then
            return a1:Lerp(a2, a3)
        end
        if v1 == "Vector3int16" then
            v2 = a2
            v3 = a1
            return Vector3int16.new((v2.X - v3.X) * a3 + v3.X, (v2.Y - v3.Y) * a3 + v3.Y, (v2.Z - v3.Z) * a3 + v3.Z)
        end
    end
    if a3 < 0.5 then
        return a1
    end
    return a2
end