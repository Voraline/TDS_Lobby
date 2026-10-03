-- Script path: ReplicatedStorage.Shared.Modules.ChatColorUtil
-- Decompile time: 0.81 ms

local v1 = {}
local u1 = {}
local v2 = Color3.new(0.9921568627450981, 0.1607843137254902, 0.2627450980392157)
local v3 = Color3.new(0.00392156862745098, 0.6352941176470588, 1)
local v4 = Color3.new(0.00784313725490196, 0.7215686274509804, 0.3411764705882353)
u1[1] = v2
u1[2] = v3
u1[3] = v4
u1[4] = BrickColor.new("Alder").Color
u1[5] = BrickColor.new("Bright orange").Color
u1[6] = BrickColor.new("Bright yellow").Color
u1[7] = BrickColor.new("Light reddish violet").Color
u1[8] = BrickColor.new("Brick yellow").Color

local function getNameValue(a1) -- Line: 14 -- types: a1: string
    local v1, v2
    local v3 = 0
    local v4 = #a1
    local v5 = a1
    for i = 1, v4 do
        v1 = string.byte((string.sub(v5, i, i)))
        v2 = #v5 - i + 1
        if #v5 % 2 == 1 then
            v2 = v2 - 1
        end
        if 2 <= v2 % 4 then
            v1 = -v1
        end
        v3 = v3 + v1
    end
    return v3
end

function v1.getNameColor(a1) -- Line: 35 -- upvalues: u1 (val), getNameValue (val) -- types: a1: string
    return u1[(getNameValue(a1)) % #u1 + 1]
end

return v1