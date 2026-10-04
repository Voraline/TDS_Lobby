-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.PVPUserRank
-- Decompile time: 6.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local PVPProgressBar = require(script.PVPProgressBar)
local RankDisplay = require(script.RankDisplay)
return function(a1) -- Line: 10 -- upvalues: React (val), RankDisplay (val), PVPProgressBar (val)
    local v1
    local rankEnum = a1.rankEnum
    local rankData = a1.rankData
    local previousRankData = a1.previousRankData
    local nextRankData = a1.nextRankData
    local rank = a1.rank
    local emitter = a1.emitter
    local createElement = React.createElement
    local v2 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 1),
        Size = UDim2.fromScale(0.325, 0.65),
        Position = a1.Position,
    }
    local v3 = {
        RankBackgroundImage = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = "rbxassetid://115188802672020",
            ImageTransparency = 0,
            ZIndex = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.525),
            Size = UDim2.fromScale(1.65, 1.65),
        }, {
            UIAspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.7541984732824427}),
        }),
    }
    v3.RankGlowImage = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://128192412874734",
        ImageTransparency = 0.3,
        ZIndex = 2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.28),
        Size = UDim2.fromScale(0.85, 0.85),
    })
    local createElement_4 = React.createElement
    local v4 = {
        HighlightRank = true,
        RankDescriptionText = "Current Rank",
        Visible = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(1.05, 1.05),
        Position = UDim2.fromScale(0.5, 0.35),
    }
    v4.UserRankText = rankData and rankData.Name or "Unranked"
    v4.Icon = rankData and rankData.Icon or "15277395439"
    v3.RankDisplay = createElement_4(RankDisplay, v4)
    local createElement_5 = React.createElement
    v4 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.95),
        Size = UDim2.fromScale(1, 0.3),
    }
    local v5 = {}
    local v6 = false
    if 0 < (rank:getValue()) then
        local createElement_6 = React.createElement
        v1 = {
            AnchorPoint = Vector2.new(0.5, 1),
            Position = UDim2.fromScale(0.5, 0.775),
            Size = UDim2.fromScale(1, 0.15),
        }
        v1.level = rankData and rankData.Name or "Unranked"
        v1.emitter = emitter == true
        v1.progress = rank:map(function(a1) -- Line: 68 -- upvalues: rankData (val)
            if rankData and a1 > 0 then
                return a1 - rankData.RankRange.Min
            end
            return 0
        end)
        v1.maxProgress = rankData and rankData.RankRange.Max - rankData.RankRange.Min or 0
        v6 = createElement_6(PVPProgressBar, v1)
    end
    v5.ProgressBar = v6
    local createElement_7 = React.createElement
    v1 = {HighlightRank = false, RankDescriptionText = "Previous Rank"}
    v1.AnchorPoint = Vector2.new(0, 0)
    v1.Position = UDim2.fromScale(-0.125, -0.5)
    v1.Size = UDim2.fromScale(1.3, 1.3)
    v1.UserRankText = previousRankData and previousRankData.Name or "Unranked"
    v1.Icon = previousRankData and previousRankData.Icon or "15277395439"
    v1.Visible = previousRankData ~= nil
    v5.PreviousRank = createElement_7(RankDisplay, v1)
    local createElement_8 = React.createElement
    v1 = {
        HighlightRank = false,
        RankDescriptionText = "Next Rank",
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.fromScale(1.125, -0.5),
        Size = UDim2.fromScale(1.3, 1.3),
    }
    v1.UserRankText = nextRankData and nextRankData.Name or "Unranked"
    v1.Icon = nextRankData and nextRankData.Icon or "15277395439"
    v1.Visible = nextRankData ~= nil
    v5.NextRank = createElement_8(RankDisplay, v1)
    v5.XPGlowImage = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://128192412874734",
        ImageTransparency = 1,
        ZIndex = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        Size = UDim2.fromScale(0.6, 1.3),
    })
    v5.XPLabel = React.createElement("TextLabel", {
        BackgroundTransparency = 1,
        TextScaled = true,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.4),
        Size = UDim2.fromScale(0.8, 0.175),
        FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        Text = rank:map(function(a1) -- Line: 111 -- upvalues: rankData (val)
            if rankData and not (a1 < 0) then
                local v1 = tostring((math.round(a1)))
                local Max = rankData.RankRange.Max
                if Max == (1 / 0) then
                    return (("%*"):format(v1))
                end
                return (("%* / %*"):format(v1, (tostring(Max))))
            end
            return ""
        end),
    }, {
        UIStroke = React.createElement("UIStroke", {Thickness = 1, Transparency = 0.75, Color = Color3.fromRGB(221, 255, 30)}),
        UIGradient = React.createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 242, 63)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
            }),
        }),
    })
    v3.BottomFrame = createElement_5("Frame", v4, v5)
    return createElement("Frame", v2, v3)
end