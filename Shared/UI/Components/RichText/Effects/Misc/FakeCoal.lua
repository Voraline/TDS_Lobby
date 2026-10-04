-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Effects.Misc.FakeCoal
-- Decompile time: 1.36 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Children = Create.Children
return {
    DesiredType = "Word",
    render = function(a1, a2) -- Line: 11 -- upvalues: Create (val), Children (val) -- types: a1: table, a2: number
        local v1
        local v2 = a1.container:Get()
        if v2 == a1.root then
            v2 = a1.labels:Get()[1]
        end
        local v3 = a1.Stroke == true
        for i, v in ipairs(a1.labels:Get()) do
            v.TextColor3 = Color3.fromRGB(129, 129, 129)
            if not v3 then
                Create("UIStroke", {
                    Name = "UIStroke",
                    Thickness = 4,
                    Transparency = 0.47,
                    Color = Color3.fromRGB(85, 84, 84),
                    Parent = v,
                })
            end
        end
        if not v3 then
            a1.Stroke = true
        end
        if not a1.Background then
            v1 = Create
            local v4 = {
                Name = "Frame",
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BackgroundTransparency = 1,
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                BorderSizePixel = 0,
                ClipsDescendants = true,
                Position = v2.Position,
                Size = v2.Size,
                AnchorPoint = v2.AnchorPoint,
                Parent = v2.Parent,
                ZIndex = -1,
            }
            v4[Children] = {
                Create("ImageLabel", {
                    Name = "ImageLabel",
                    Image = "rbxassetid://13925567750",
                    BorderSizePixel = 0,
                    ZIndex = -1,
                    ResampleMode = Enum.ResamplerMode.Pixelated,
                    ScaleType = Enum.ScaleType.Tile,
                    TileSize = UDim2.fromOffset(50, 50),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Position = UDim2.fromScale(-0.145, -0.145),
                    Size = UDim2.fromScale(4, 4),
                }),
            }
            a1.Background = v1("Frame", v4)
        end
        if not a1.Elasped then
            a1.Elasped = 0
        end
        v1 = a1.Elasped % 3 / 3
        local v5 = (UDim2.fromScale(-1, -1)):Lerp(UDim2.fromScale(2, 2), v1)
        a1.Background.ImageLabel.Position = v5
        a1.Elasped = a1.Elasped + math.min(a2, 0.016666666666666666)
    end,
}