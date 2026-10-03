-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.XmasLights
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "XmasLights",
    render = function(a1) -- Line: 10 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(37, 111, 0)
            Create("UIStroke", {
                Name = "UIStroke",
                Thickness = 4,
                Transparency = 0.84,
                Color = Color3.fromRGB(2, 98, 0),
                Parent = v,
            })
        end
        return true
    end,
}