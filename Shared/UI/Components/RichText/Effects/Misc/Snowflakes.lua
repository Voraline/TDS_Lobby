-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Snowflakes
-- Decompile time: 0.59 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    Particle = "Snowflakes",
    render = function(a1) -- Line: 7 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
            Create("UIStroke", {
                Name = "UIStroke",
                Thickness = 4,
                Transparency = 0.84,
                Color = Color3.fromRGB(255, 255, 255),
                Parent = v,
            })
        end
        return true
    end,
}