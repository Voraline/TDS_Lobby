-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Zalgo
-- Decompile time: 0.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local ZalgoText = require(ReplicatedStorage.Shared.Modules.ZalgoText)
local v1 = {DesiredType = "Letter"}
local u19 = Random.new()

function v1.render(a1) -- Line: 12 -- upvalues: u19 (val), ZalgoText (val)
    local Attribute_2, GenerateRandom, v1, v2, v3, v4
    local props = a1.props
    local v5 = a1.labels:Get()
    local v6 = 2 * (a1.container:Get().AbsoluteSize.Y / 37)
    for i, v in ipairs(v5) do
        v1 = Color3.fromRGB(255, 0, 0)
        v2 = (v:GetAttribute("BasePosition")) + UDim2.fromOffset(u19:NextNumber(-2, 2), (u19:NextNumber(-2, 2)))
        v3 = u19:NextNumber()
        if v3 < 0.1 then
            v3 = u19
            v4 = -v6
            v.Rotation = v3:NextInteger(v4, v6)
        end
        v.Position = v2
        v.TextColor3 = v1
        GenerateRandom = ZalgoText.GenerateRandom
        Attribute_2 = v:GetAttribute("BaseText")
        v.Text = GenerateRandom(Attribute_2, 5)
    end
end

return v1