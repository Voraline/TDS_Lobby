-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Text.StaticGlitch
-- Decompile time: 3.21 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(game:GetService("ReplicatedStorage").Shared.Modules.Standalone.Create)
require(ReplicatedStorage.Shared.Modules.spr)
local Children = Create.Children
local v1 = {DesiredType = "Letter", Particle = nil}
local u26 = Random.new()

function v1.render(a1) -- Line: 13 -- upvalues: Create (val), Children (val), u26 (val)
    local v1, v2, v3
    local v4 = a1.lastUpdate or 0
    if not a1.stroke then
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.new(1, 1, 1)
            v.Text = string.upper(v.Text)
        end
        a1.stroke = true
    end
    if not a1.static then
        a1.images = {
            Create("ImageLabel", {
                Image = "rbxassetid://236777652",
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.919, 0.656),
                Size = UDim2.fromScale(2, 2),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
            }),
            Create("ImageLabel", {
                Image = "rbxassetid://2318786350",
                ImageTransparency = 0.5,
                BackgroundTransparency = 1,
                ZIndex = 2,
                ImageColor3 = Color3.fromRGB(8, 0, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.583, 0.353),
                Size = UDim2.fromScale(2, 2),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
            }),
            Create("ImageLabel", {
                Image = "rbxassetid://2318786350",
                ImageTransparency = 0.5,
                BackgroundTransparency = 1,
                ZIndex = 3,
                ImageColor3 = Color3.fromRGB(255, 0, 0),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.305, 0.687),
                Size = UDim2.fromScale(2, 2),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
            }),
            (Create("ImageLabel", {
                Image = "rbxassetid://2318786350",
                ImageTransparency = 0.7,
                BackgroundTransparency = 1,
                ZIndex = 4,
                ImageColor3 = Color3.fromRGB(0, 255, 51),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.433, 0.996),
                Size = UDim2.fromScale(2, 2),
                SizeConstraint = Enum.SizeConstraint.RelativeXX,
            })),
        }
        local v5 = Create
        local v6 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 40, 1, 20),
            Parent = a1.container:Get(),
            ZIndex = -1,
        }
        local v7 = Children
        local v8 = {}
        v2 = Create
        local v9 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }
        v9[Children] = {
            a1.images,
            (Create("UIGradient", {
                Name = "UIGradient",
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.2, 0),
                    NumberSequenceKeypoint.new(0.8, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            })),
        }
        v2 = v2("CanvasGroup", v9)
        v3 = Create
        v1 = {
            Rotation = 90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.3, 0),
                NumberSequenceKeypoint.new(0.7, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }
        v8[1] = v2
        v8[2] = v3("UIGradient", v1)
        v6[v7] = v8
        a1.static = v5("CanvasGroup", v6)
    end
    if 0.03333333333333333 < tick() - v4 then
        local Attribute, Attribute_2, fromScale, v10, v11
        a1.lastUpdate = tick()
        for k, i2 in pairs(a1.labels:Get()) do
            v2 = u26:NextNumber(0.4, 0.6)
            Attribute = i2:GetAttribute("BasePosition")
            Attribute_2 = i2:GetAttribute("BaseTextSize")
            v1 = u26:NextNumber(-1, 1)
            v10 = u26:NextNumber(-1, 1)
            v11 = math.floor((u26:NextNumber(-1, 1)) * (Attribute_2 * 0.1))
            i2.TextTransparency = v2
            i2.TextSize = Attribute_2 + v11
            i2.Position = Attribute + UDim2.fromOffset(v1 * 5, -v11 + v10 * 5)
        end
        for k2, j in pairs(a1.images) do
            fromScale = UDim2.fromScale
            v3 = u26:NextNumber()
            j.Position = fromScale(v3, u26:NextNumber())
        end
    end
end

function v1.cleanUp(a1) -- Line: 146
    a1.static:Destroy()
    a1.static = nil
end

return v1