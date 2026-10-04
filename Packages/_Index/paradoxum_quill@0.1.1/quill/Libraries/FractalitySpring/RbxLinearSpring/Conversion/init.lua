-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.Libraries.FractalitySpring.RbxLinearSpring.Conversion
-- Decompile time: 0.90 ms

local Color3Luv = require(script.Color3Luv)
return {
    boolean = {
        serialize = function(a1) -- Line: 15
            if a1 then
                return {1}
            end
            return {0}
        end,
        deserialize = function(a1) -- Line: 18
            return 0.5 <= a1[1]
        end,
    },
    number = {
        serialize = function(a1) -- Line: 24
            return {a1}
        end,
        deserialize = function(a1) -- Line: 27
            return a1[1]
        end,
    },
    NumberRange = {
        serialize = function(a1) -- Line: 33
            return {a1.Min, a1.Max}
        end,
        deserialize = function(a1) -- Line: 36
            return NumberRange.new(a1[1], a1[2])
        end,
    },
    UDim = {
        serialize = function(a1) -- Line: 42
            return {a1.Scale, a1.Offset}
        end,
        deserialize = function(a1) -- Line: 45
            return UDim.new(a1[1], a1[2])
        end,
    },
    UDim2 = {
        serialize = function(a1) -- Line: 51
            return {
                a1.X.Scale,
                a1.X.Offset,
                a1.Y.Scale,
                a1.Y.Offset,
            }
        end,
        deserialize = function(a1) -- Line: 54
            return UDim2.new(a1[1], a1[2], a1[3], a1[4])
        end,
    },
    Vector2 = {
        serialize = function(a1) -- Line: 60
            return {a1.X, a1.Y}
        end,
        deserialize = function(a1) -- Line: 63
            return Vector2.new(a1[1], a1[2])
        end,
    },
    Vector3 = {
        serialize = function(a1) -- Line: 69
            return {a1.X, a1.Y, a1.Z}
        end,
        deserialize = function(a1) -- Line: 72
            return (Vector3.new(a1[1], a1[2], a1[3]))
        end,
    },
    Color3 = {serialize = Color3Luv.rgbToLuv, deserialize = Color3Luv.luvToRgb},
}