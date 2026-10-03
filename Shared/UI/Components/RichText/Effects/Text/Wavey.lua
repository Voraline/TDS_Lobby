-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Wavey
-- Decompile time: 0.95 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Letter",
    render = function(a1) -- Line: 6 -- upvalues: Create (val)
        local Attribute, v1, v2
        local props = a1.props
        local stroke = a1.stroke
        local v3 = a1.labels:Get()
        local v4 = a1.container:Get().AbsoluteSize.Y / 4
        local v5 = props.speed or 1
        for i, v in ipairs(v3) do
            Attribute = v:GetAttribute("BasePosition")
            v1 = (math.sin((tick()) * v5 * 4 + i)) * v4
            v.Position = Attribute + UDim2.fromOffset(0, v1)
            v2 = (tick()) * v5 * 4 + i
            v.Rotation = math.cos(v2) * 10 - 5
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIStroke", {Thickness = 4, Transparency = 0.5, Parent = v})
            end
        end
        a1.stroke = true
    end,
}