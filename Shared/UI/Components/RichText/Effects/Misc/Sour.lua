-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Sour
-- Decompile time: 0.62 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    getColor = function(a1) -- Line: 6
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(37, 163, 130)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(240, 208, 65))),
        })
    end,
    render = function(a1) -- Line: 13 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIGradient", {Color = a1:getColor(), Parent = v1})
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        return true
    end,
}