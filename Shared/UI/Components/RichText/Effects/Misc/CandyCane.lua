-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.CandyCane
-- Decompile time: 0.43 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Letter",
    render = function(a1) -- Line: 6 -- upvalues: Create (val)
        local v1
        local v2 = a1.container:Get()
        if v2 == a1.root then
            v2 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v1 = not (i % 2 ~= 0) and Color3.new(1, 0, 0) or Color3.new(1, 1, 1)
            v.TextColor3 = v1
        end
        Create("UIStroke", {
            Name = "UIStroke",
            Thickness = 4,
            Transparency = 0.5,
            Color = Color3.fromRGB(85, 0, 0),
        })
        return true
    end,
}