-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.Hexscaped
-- Decompile time: 1.66 ms

local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
local Children = Create.Children
return {
    DesiredType = "Word",
    Particle = "Hexscaped",
    getColor = function(a1) -- Line: 10
        return ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 251, 255)),
            ColorSequenceKeypoint.new(0.445, Color3.fromRGB(176, 10, 255)),
            ColorSequenceKeypoint.new(0.488, Color3.fromRGB(255, 0, 221)),
            ColorSequenceKeypoint.new(0.531, Color3.fromRGB(169, 20, 251)),
            (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 204))),
        })
    end,
    onCreate = function(self) -- Line: 20
        local adornee = self.adornee
        if not adornee then
            return
        end
        local v1 = adornee.Size / 2
        local v2 = adornee:FindFirstChild("3")
        local v3 = adornee:FindFirstChild("4")
        for i, j in v2:GetChildren() do
            if j:IsA("Beam") then
                j.Attachment0 = v2
                j.Attachment1 = v3
            end
        end
        v2.CFrame = CFrame.new(v1.X + 0.5, 0, 0)
        v3.CFrame = CFrame.new(-v1.X - 0.5, 0, 0)
    end,
    render = function(a1) -- Line: 41 -- upvalues: Create (val), Children (val)
        local v1, v2
        local props = a1.props
        local v3 = a1.labels:Get()
        local stroke = a1.stroke
        local root = a1.root
        local v4 = root and root:FindFirstAncestorWhichIsA("BasePart")
        for i, v in ipairs(v3) do
            if not stroke then
                v.TextColor3 = Color3.new(1, 1, 1)
                Create("UIGradient", {
                    Rotation = 90,
                    Color = a1:getColor(),
                    Offset = Vector2.new(0, 0.05),
                    Parent = v,
                })
                Create("UIStroke", {
                    Name = "UIStroke",
                    Thickness = 4,
                    Transparency = 0.5,
                    Color = Color3.fromRGB(0, 0, 0),
                    Parent = v,
                })
            end
            if not a1.frame and v4 then
                v1 = Create
                v2 = {
                    Name = "ImageLabel",
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundTransparency = 1,
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    BorderSizePixel = 0,
                    Image = "rbxassetid://83012799868338",
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.new(1.3, 0, 0, 200),
                    Parent = v,
                }
                v2[Children] = (Create("UISizeConstraint", {MinSize = Vector2.new(300, 0)}))
                a1.frame = v1("ImageLabel", v2)
            end
        end
        if not a1.created then
            task.defer(function() -- Line: 90 -- upvalues: a1 (val)
                a1:onCreate()
            end)
        end
        a1.frame = true
        a1.stroke = true
        a1.created = true
    end,
}