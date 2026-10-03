-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.Rainbow
-- Decompile time: 1.10 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Word",
    getColor = function(self) -- Line: 6
        local speed = self.props.speed
        local v1 = tick() * (speed or 1) * 10 % 20 / 20
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromHSV(v1, 0.5, 1)),
            ColorSequenceKeypoint.new(0.25, Color3.fromHSV((v1 + 0.2) % 1, 0.5, 1)),
            ColorSequenceKeypoint.new(0.5, Color3.fromHSV((v1 + 0.3) % 1, 0.5, 1)),
            ColorSequenceKeypoint.new(0.75, Color3.fromHSV((v1 + 0.4) % 1, 0.5, 1)),
            (ColorSequenceKeypoint.new(1, Color3.fromHSV((v1 + 0.5) % 1, 0.5, 1))),
        })
    end,
    render = function(a1) -- Line: 20 -- upvalues: Create (val)
        local v1 = a1.container:Get()
        if v1 == a1.root then
            v1 = a1.labels:Get()[1]
        end
        if not a1.gradient then
            for i, v in ipairs(a1.labels:Get()) do
                v.TextColor3 = Color3.new(1, 1, 1)
            end
            a1.gradient = Create("UIGradient", {Parent = v1})
        end
        if not a1.stroke then
            a1.stroke = Create("UIStroke", {Thickness = 4, Transparency = 0.5, Color = Color3.fromRGB(0, 0, 0), Parent = v1})
        end
        a1.gradient.Color = a1:getColor()
    end,
}