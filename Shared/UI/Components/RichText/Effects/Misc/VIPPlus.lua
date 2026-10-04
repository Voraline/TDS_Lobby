-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.VIPPlus
-- Decompile time: 1.64 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
return {
    DesiredType = "Letter",
    Particle = "VIPPlus",
    render = function(a1) -- Line: 7 -- upvalues: Create (val)
        local Attribute, v1, v2
        local props = a1.props
        local stroke = a1.stroke
        local gradient = a1.gradient
        local v3 = a1.labels:Get()
        local v4 = a1.container:Get().AbsoluteSize.Y / 4
        local v5 = props.speed or 1
        local root = a1.root
        local v6 = root and root:FindFirstAncestorWhichIsA("BasePart")
        local v7 = a1
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
            if not gradient then
                Create("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 210, 32)),
                        ColorSequenceKeypoint.new(0.453, Color3.fromRGB(255, 229, 32)),
                        ColorSequenceKeypoint.new(0.488, Color3.fromRGB(255, 166, 25)),
                        ColorSequenceKeypoint.new(0.721, Color3.fromRGB(255, 33, 140)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 138, 20))),
                    }),
                    Parent = v,
                })
            end
        end
        if v6 then
            local Flair = v6:FindFirstChild("Flair")
            local CrownAttachment = v6:FindFirstChild("CrownAttachment")
            if CrownAttachment then
                local v8 = Flair and CFrame.new(0, 1, 0) or CFrame.new(0, 0.65, 0)
                CrownAttachment.CFrame = v8
            end
        end
        v7.stroke = true
        v7.gradient = true
    end,
}