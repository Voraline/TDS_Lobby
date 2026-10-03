-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PlaytimeRewards
-- Decompile time: 7.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlaytimeRewardData = require(ReplicatedStorage.Shared.Modules.PlaytimeRewardData)
local React = require(ReplicatedStorage.Shared.UI.React)
local CloseButton = require(script.CloseButton)
local Holder = require(script.Holder)
local PlaytimeRewardButton = require(script.PlaytimeRewardButton)
local TextLabel = require(script.TextLabel)
local VideoFrame = require(script.VideoFrame)
return (React.memo(function(a1) -- Line: 29
    -- upvalues: React (val), PlaytimeRewardData (ref), PlaytimeRewardButton (val), TextLabel (val), CloseButton (val)
    -- upvalues: Holder (val), VideoFrame (val)
    local v1, v2
    local u4 = math.floor(a1.timeUntilVideoReset / 3600)
    local u9 = math.floor(a1.timeUntilVideoReset / 60) % 60
    local u11 = a1.timeUntilVideoReset % 60
    local v3 = {u4, u9, u11}
    local v4 = React.useMemo(function() -- Line: 34 -- upvalues: u4 (val), u9 (val), u11 (val)
        if u4 == 0 then
            return string.format("%d:%02d", u9, u11)
        end
        return string.format("%d:%02d:%02d", u4, u9, u11)
    end, v3)
    local v5 = 0
    v3 = {
        UIGridLayout = React.createElement("UIGridLayout", {
            FillDirectionMaxCells = 3,
            CellPadding = UDim2.fromScale(0, 0.05),
            CellSize = UDim2.fromScale(0.3, 0.47),
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
    }
    if not PlaytimeRewardData then
        PlaytimeRewardData = {
            {seconds = 300, reward = "Low Tier Chest", amount = 1},
            {seconds = 900, reward = "Low Tier Chest", amount = 2},
            {seconds = 1800, reward = "Mid Tier Chest", amount = 1},
            {seconds = 3600, reward = "Mid Tier Chest", amount = 2},
            {seconds = 7200, reward = "High Tier Chest", amount = 1},
            {seconds = 14400, reward = "High Tier Chest", amount = 2},
        }
    end
    local v6 = nil
    local v7 = nil
    local v8 = a1
    for i, j in PlaytimeRewardData, v6, v7 do
        v1 = v8.claimed[i] or false
        v2 = ("RewardButton_%*"):format(i)
        v3[v2] = (React.createElement(PlaytimeRewardButton, {
            AnchorPoint = Vector2.new(0.5, 0.5),
            playtime = v8.playtime,
            playtimeRequirement = j.seconds,
            claimed = v1,
            LayoutOrder = i,
            crateName = j.reward,
            quantity = j.amount,
            onClick = v8.onClaimed,
            onInfoClicked = v8.onRewardInfoSelected,
        }))
        v5 = v5 + (if not v1 then 0 else 1)
    end
    local v9 = nil
    if v8.rewardInfo ~= nil then
        local v10
        v6 = {}
        for k, n in v8.rewardInfo do
            v10 = ("Info_%*"):format(k)
            v6[v10] = (React.createElement(TextLabel, {
                BackgroundTransparency = 1,
                AutomaticSize = Enum.AutomaticSize.XY,
                Size = UDim2.fromScale(1, 0.08),
                Text = n,
                LayoutOrder = k + 1,
                FontWeight = Enum.FontWeight.Medium,
            }, {
                UITextSizeConstraint = React.createElement("UITextSizeConstraint", {MaxTextSize = 18}),
                UIStroke = React.createElement("UIStroke", {
                    Thickness = 1,
                    Color = Color3.fromRGB(0, 0, 0),
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                }),
            }))
        end
        v9 = React.createElement("Frame", {
            BackgroundTransparency = 0.4,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(-0.02, 0.02),
            Size = UDim2.fromScale(0.45, 0.65),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            UIPadding = React.createElement("UIPadding", {
                PaddingTop = UDim.new(0.03, 0),
                PaddingLeft = UDim.new(0.03, 0),
                PaddingRight = UDim.new(0.03, 0),
            }),
            UIStroke = React.createElement("UIStroke", {
                Thickness = 1,
                Color = Color3.fromRGB(255, 255, 255),
                ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
                LineJoinMode = Enum.LineJoinMode.Round,
            }, {
                UIGradient = React.createElement("UIGradient", {
                    Rotation = 50,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))),
                    }),
                }),
            }),
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
            UIListLayout = React.createElement("UIListLayout", {
                Padding = UDim.new(0, 0),
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Top,
            }),
            Title = React.createElement(TextLabel, {
                BackgroundTransparency = 1,
                Text = "Reward Info",
                LayoutOrder = 0,
                Size = UDim2.fromScale(0.8, 0.07),
            }),
            Separator = React.createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                LayoutOrder = 1,
                Size = UDim2.fromScale(0.9, 0.005),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                UIGradient = React.createElement("UIGradient", {
                    Transparency = NumberSequence.new({
                        NumberSequenceKeypoint.new(0, 1),
                        NumberSequenceKeypoint.new(0.25, 0),
                        NumberSequenceKeypoint.new(0.75, 0),
                        (NumberSequenceKeypoint.new(1, 1)),
                    }),
                }),
                UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            }),
            React.createElement(React.Fragment, {}, v6),
        })
    end
    local createElement_14 = React.createElement
    local v11 = {
        Visible = true,
        BackgroundTransparency = 0.3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.4, 0.55),
    }
    local v12 = {
        AspectRatio = React.createElement("UIAspectRatioConstraint", {
            AspectRatio = 0.8,
            DominantAxis = Enum.DominantAxis.Height,
            AspectType = Enum.AspectType.ScaleWithParentSize,
        }),
        UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        UIStroke = React.createElement("UIStroke", {
            Thickness = 1,
            Color = Color3.fromRGB(255, 255, 255),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
            LineJoinMode = Enum.LineJoinMode.Round,
        }, {
            UIGradient = React.createElement("UIGradient", {
                Rotation = 90,
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(45, 45, 45))),
                }),
            }),
        }),
        UIGradient = React.createElement("UIGradient", {
            Rotation = 65,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(66, 66, 66)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 0, 0))),
            }),
        }),
        CloseButton = React.createElement(CloseButton, {title = "Close", visible = true, onClick = v8.onClose}),
        TitleFrame = React.createElement("Frame", {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(1, 0.14),
            Position = UDim2.fromScale(0, 0.015),
        }, {
            Frame = React.createElement("Frame", {
                BackgroundTransparency = 0.6,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromScale(0.911, 0.022),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            }, {
                UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            }),
            Desc = React.createElement(TextLabel, {
                Text = "Earn rewards for playing!",
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.6),
                Size = UDim2.fromScale(0.925, 0.259),
                TextXAlignment = Enum.TextXAlignment.Left,
            }),
            Title = React.createElement(TextLabel, {
                Text = "Free Rewards!",
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.088),
                Size = UDim2.fromScale(0.925, 0.443),
                TextXAlignment = Enum.TextXAlignment.Left,
                FontWeight = Enum.FontWeight.ExtraBold,
            }),
        }),
        Items = React.createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, if not v8.canSeeAds then 0.25 else 0.19),
            Size = UDim2.fromScale(1, 0.62),
        }, v3),
    }
    local canSeeAds = v8.canSeeAds and React.createElement(Holder, {
        BackgroundTransparency = 0.2,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.981),
        Size = UDim2.fromScale(0.956, 0.152),
    }, {
        Title = React.createElement(TextLabel, {
            Text = "Extra Rewards!",
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.194, 0.237),
            Size = UDim2.fromScale(0.307, 0.259),
            TextXAlignment = Enum.TextXAlignment.Center,
            FontWeight = Enum.FontWeight.SemiBold,
        }),
        Desc = React.createElement(TextLabel, {
            Text = "Resets in",
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.113, 0.536),
            Size = UDim2.fromScale(0.147, 0.233),
            TextXAlignment = Enum.TextXAlignment.Center,
        }),
        Timer = React.createElement(TextLabel, {
            TextScaled = true,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(124, 124, 124),
            Text = v4,
            Position = UDim2.fromScale(0.274, 0.536),
            Size = UDim2.fromScale(0.147, 0.233),
            TextXAlignment = Enum.TextXAlignment.Center,
            FontWeight = Enum.FontWeight.SemiBold,
        }, {
            UICorner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
            UIPadding = React.createElement("UIPadding", {PaddingLeft = UDim.new(0.1, 0), PaddingRight = UDim.new(0.1, 0)}),
            UITextSizeConstraint = React.createElement("UITextSizeConstraint", {MinTextSize = 10, MaxTextSize = 15}),
        }),
        VideoFrames = React.createElement(VideoFrame, {
            AnchorPoint = Vector2.new(0, 0),
            Position = UDim2.fromScale(0.374, 0.083),
            Size = UDim2.fromScale(0.597, 0.852),
            videoStates = v8.videoStates,
            onVideoClaimed = v8.onVideoClaimed,
        }),
    })
    v12.AdditionalRewards = canSeeAds
    v12.rewardInfo = v9
    return createElement_14("Frame", v11, v12)
end))