-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Glitchy
-- Decompile time: 0.88 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local v1 = {DesiredType = "Letter", Particle = "Glitchy"}
local u15 = Random.new()

function v1.render(a1) -- Line: 10 -- upvalues: u15 (val), Create (val)
    local Color, v1, v2, v3
    local stroke = a1.stroke
    local v4 = a1.labels:Get()
    local v5 = 30 * (a1.container:Get().AbsoluteSize.Y / 37)
    for i, v in ipairs(v4) do
        Color = Color3.new(1, 1, 1)
        v1 = (v:GetAttribute("BasePosition")) + UDim2.fromOffset(u15:NextInteger(-2, 2), (u15:NextInteger(-2, 2)))
        v2 = u15:NextNumber()
        if v2 < 0.2 then
            Color = BrickColor.Random().Color
            v2 = u15
            v3 = -v5
            v.Rotation = v2:NextInteger(v3, v5)
        end
        v.Position = v1
        v.TextColor3 = Color
        if not stroke then
            Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v})
        end
    end
    a1.stroke = true
end

return v1