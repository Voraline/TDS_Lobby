-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Sizey
-- Decompile time: 0.74 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Letter",
    render = function(a1) -- Line: 6 -- upvalues: Create (val)
        local Attribute, v1, v2
        local props = a1.props
        local stroke = a1.stroke
        local v3 = a1.labels:Get()
        local v4 = a1.container:Get().AbsoluteSize.Y / 4
        local v5 = props.speed or 2
        for i, v in ipairs(v3) do
            Attribute = v:GetAttribute("BaseTextSize")
            v1 = math.sin(tick() * v5 * 4 + i * 2)
            v2 = math.cos(tick() * v5 * 4 + i * 2)
            v.TextXAlignment = Enum.TextXAlignment.Center
            v.TextYAlignment = Enum.TextYAlignment.Center
            v.TextSize = Attribute + v1 * v4
            v.Rotation = v2 * 15
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIStroke", {Thickness = 4, Transparency = 0.5, Parent = v})
            end
        end
        a1.stroke = true
    end,
}