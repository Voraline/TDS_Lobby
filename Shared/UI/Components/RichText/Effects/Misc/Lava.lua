-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Lava
-- Decompile time: 0.41 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Lava",
    render = function(a1) -- Line: 7 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(255, 114, 58)
        end
        Create("UIStroke", {Thickness = 3, Transparency = 0, Color = Color3.fromRGB(195, 133, 83), Parent = v1})
        return true
    end,
}