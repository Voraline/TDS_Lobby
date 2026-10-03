-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Tutorial.Thumbnail
-- Decompile time: 1.11 ms

local React = require(game:GetService("ReplicatedStorage").Shared.UI.React)
local u37 = (require((((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib")))).import(
    script,
    game:GetService("ReplicatedStorage"),
    "Client",
    "Interfaces",
    "Universal",
    "Components",
    "Outline"
)
return {
    Thumbnail = function(a1) -- Line: 14 -- upvalues: React (val), u37 (val)
        local v1 = {
            BackgroundTransparency = 1,
            Size = a1.Size,
            Position = a1.Position,
            AnchorPoint = a1.AnchorPoint,
            Image = a1.Image,
            ScaleType = Enum.ScaleType.Crop,
        }
        local v2 = {React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)})}
        local v3 = #v2
        local v4 = {Size = a1.Size + UDim2.fromOffset(16, 16)}
        v2[v3 + 1] = (React.createElement(u37, v4))
        local v5 = v3 + 2
        v2[v5] = (React.createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.new(0.9, 0, 0, 32),
            Position = UDim2.new(0.5, 0, 1, -32),
            FontFace = Font.fromEnum(Enum.Font.Cartoon),
            TextColor3 = Color3.fromRGB(255, 233, 120),
            Text = a1.Description,
        }, {
            React.createElement("UIStroke", {
                Thickness = 4,
                Transparency = 0.5,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                Color = Color3.fromRGB(0, 0, 0),
            }),
        }))
        return React.createElement("ImageLabel", v1, v2)
    end,
}