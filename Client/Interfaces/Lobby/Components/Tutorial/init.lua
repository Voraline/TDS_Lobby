-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Tutorial
-- Decompile time: 3.64 ms

local React = require(game:GetService("ReplicatedStorage").Shared.UI.React)
local RuntimeLib = require(((game:GetService("ReplicatedStorage")):WaitForChild("rbxts")):WaitForChild("RuntimeLib"))
local u36 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Components", "Button")
local u49 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Universal", "Components", "Header")
local u62 = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Universal", "Components", "TopBanner")
local Thumbnail = RuntimeLib.import(script, game:GetService("ReplicatedStorage"), "Client", "Interfaces", "Lobby", "Components", "Tutorial", "Thumbnail").Thumbnail
local TutorialRewards = (RuntimeLib.import(
    script,
    game:GetService("ReplicatedStorage"),
    "Client",
    "Interfaces",
    "Lobby",
    "Components",
    "Tutorial",
    "TutorialRewards"
)).TutorialRewards
return {
    TutorialWindow = function(a1) -- Line: 51
        -- upvalues: React (val), u62 (val), u49 (val), TutorialRewards (val), u36 (val), Thumbnail (val)
        local v1 = {
            BackgroundTransparency = 0.3,
            Visible = a1.Visible,
            AnchorPoint = a1.AnchorPoint,
            Size = a1.Size,
            Position = a1.Position,
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }
        local v2 = {React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)})}
        local v3 = #v2
        local v4 = {}
        local Scale = a1.Scale
        if Scale == nil then
            Scale = 1
        end
        v4.Scale = Scale
        v2[v3 + 1] = (React.createElement("UIScale", v4))
        local v5 = v3 + 2
        v2[v5] = (React.createElement(u62, {
            key = "top-banner",
            Title = "Tutorial",
            SmallTitle = "New Objective",
            RemoveGradient = true,
            BackgroundTransparency = 1,
            Size = UDim2.new(1, 0, 0, 100),
        }, {
            React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://16452280680",
                ZIndex = 0,
                Size = UDim2.fromScale(1, 1),
                ScaleType = Enum.ScaleType.Crop,
            }, {
                React.createElement("UIGradient", {
                    Rotation = -90,
                    Color = ColorSequence.new(Color3.fromRGB(255, 255, 255)),
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 0.719),
                        NumberSequenceKeypoint.new(0.279, 0.781),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
            }),
        }))
        v5 = v3 + 3
        v2[v5] = (React.createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(1, 0),
            Size = UDim2.new(0, 550, 1, -100),
            Position = UDim2.new(1, 0, 0, 100),
        }, {
            React.createElement(u49, {
                key = "objective-header",
                Title = "Objective",
                TitleIcon = "rbxassetid://16380994239",
                TextSize = 22,
                Position = UDim2.fromOffset(48, 20),
                Size = UDim2.new(0.5, 0, 0, 32),
            }),
            React.createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "Welcome Recruit! We would like to invite you to start out playing the tutorial!",
                TextScaled = true,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.new(0.5, 0, 0, 70),
                Size = UDim2.new(1, -64, 0, 64),
                TextColor3 = Color3.fromRGB(213, 213, 213),
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextXAlignment = Enum.TextXAlignment.Left,
                TextYAlignment = Enum.TextYAlignment.Top,
            }, {(React.createElement("UITextSizeConstraint", {MaxTextSize = 20}))}),
            React.createElement(u49, {
                key = "reward-header",
                Title = "Rewards",
                TitleIcon = "rbxassetid://16381447184",
                TextSize = 24,
                Position = UDim2.fromOffset(48, 130),
                Size = UDim2.new(0.5, 0, 0, 32),
            }),
            React.createElement(TutorialRewards, {
                Size = UDim2.fromOffset(128, 80),
                Position = UDim2.new(0.5, 0, 0, 225),
                AnchorPoint = Vector2.new(0.5, 0),
            }),
            React.createElement(u36, {
                key = "start-button",
                Text = "Start",
                TextFontSize = 32,
                TextScaled = true,
                TextStrokeTransparency = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromOffset(160, 46),
                Position = UDim2.new(0.5, -100, 1, -48),
                Color = Color3.fromRGB(10, 220, 80),
                Clicked = a1.OnStartClicked,
            }),
            (React.createElement(u36, {
                key = "skip-button",
                Text = "Skip",
                TextFontSize = 32,
                TextScaled = true,
                TextStrokeTransparency = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Size = UDim2.fromOffset(160, 46),
                Position = UDim2.new(0.5, 100, 1, -48),
                Color = Color3.fromRGB(229, 40, 40),
                Clicked = a1.OnSkipClicked,
            })),
        }))
        v5 = v3 + 4
        v2[v5] = (React.createElement(Thumbnail, {
            Image = "rbxassetid://16478571403",
            Description = "Learn the basics of TDS!",
            Size = UDim2.fromOffset(300, 400),
            Position = UDim2.new(0, 175, 0.5, 50),
            AnchorPoint = Vector2.new(0.5, 0.5),
        }))
        return React.createElement("Frame", v1, v2)
    end,
}