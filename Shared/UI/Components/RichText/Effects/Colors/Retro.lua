-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Colors.Retro
-- Decompile time: 0.36 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    render = function(a1) -- Line: 6 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 255, 255)
        end
        Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(255, 87, 87), Parent = v1})
        return true
    end,
}