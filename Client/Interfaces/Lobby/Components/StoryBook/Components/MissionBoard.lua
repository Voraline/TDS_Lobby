-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.StoryBook.Components.MissionBoard
-- Decompile time: 6.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ConsumablePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.ConsumablePreview)
local Icons = require(ReplicatedStorage.Client.Interfaces.Icons)
local Icons_2 = require(ReplicatedStorage.Shared.Data.Icons)
local NewMaps = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.NewMaps)
local createElement = React.createElement
local u35 = {
    Coins = Icons.CoinsTiny,
    Timescale = Icons.Timescale,
    Revive = Icons.Revive,
    Spin = Icons.Spin,
}

local function rewardIcon(a1) -- Line: 45 -- upvalues: u35 (val), Icons (val), Icons_2 (val) -- types: a1: table
    if a1.Type == "Currency" then
        return u35[a1.Name] or Icons.CoinsTiny
    end
    if a1.Type ~= "Experience" and a1.Type ~= "TowerExp" then
        if a1.Type == "Crate" then
            return Icons_2.Crates[a1.Name] or ""
        end
        return ""
    end
    return Icons.Experience
end

local function createRewardEntry(a1, a2) -- Line: 57
    -- upvalues: createElement (val), ConsumablePreview (val), u35 (val), Icons (val), Icons_2 (val)
    local v1, v2
    local v3 = {
        RewardLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            TextWrapped = true,
            Position = UDim2.fromScale(-0.55, 0.755),
            Size = UDim2.fromScale(2.079, 0.245),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            Text = a1.Name,
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {UIStroke = createElement("UIStroke", {})}),
    }
    local v4 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(18, 18, 18),
        LayoutOrder = a2,
        Size = UDim2.fromScale(0.119, 0.897),
    }
    local v5 = {}
    if a1.Type ~= "Consumable" then
        v2 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
        v2.Image = if a1.Type ~= "Currency" then if a1.Type == "Experience" then Icons.Experience else if a1.Type ~= "TowerExp" then not (a1.Type ~= "Crate") and Icons_2.Crates[a1.Name] or "" else Icons.Experience else u35[a1.Name] or Icons.CoinsTiny
        v2.Position = UDim2.fromScale(0.5, 0.5)
        v2.ScaleType = Enum.ScaleType.Fit
        v2.Size = UDim2.fromScale(0.656, 0.656)
        v1 = createElement("ImageLabel", v2, v3)
    else
        v1 = createElement
        local v6 = ConsumablePreview
        v2 = {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.656, 0.656),
            name = a1.Name,
        }
        v1 = v1(v6, v2, v3)
        if not v1 then
            v2 = {BackgroundTransparency = 1, AnchorPoint = Vector2.new(0.5, 0.5)}
            v2.Image = if a1.Type ~= "Currency" then if a1.Type == "Experience" then Icons.Experience else if a1.Type ~= "TowerExp" then not (a1.Type ~= "Crate") and Icons_2.Crates[a1.Name] or "" else Icons.Experience else u35[a1.Name] or Icons.CoinsTiny
            v2.Position = UDim2.fromScale(0.5, 0.5)
            v2.ScaleType = Enum.ScaleType.Fit
            v2.Size = UDim2.fromScale(0.656, 0.656)
            v1 = createElement("ImageLabel", v2, v3)
        end
    end
    v5.Icon = v1
    v5.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})
    v5.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.041, 0)})
    v5.UIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})
    return createElement("Frame", v4, v5)
end

return function(a1) -- Line: 112
    -- upvalues: NewMaps (val), createElement (val), React (val), createRewardEntry (val)
    local v1, v2, v3
    local v4 = "rbxassetid://129664072496886"
    local map = a1.map and NewMaps(a1.map)
    if map and map.ImageID then
        v4 = ("rbxassetid://%*"):format(map.ImageID)
    end
    local v5 = a1.stars or 0
    local v6 = {
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0.04, 0),
        }),
    }
    local v7 = a1
    for i = 1, 3 do
        v3 = ("Star_%*"):format(i)
        v1 = {
            BackgroundTransparency = 1,
            Image = "rbxassetid://17368097932",
            LayoutOrder = i,
            Size = UDim2.fromScale(0.3, 1),
        }
        v2 = i <= v5 and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(60, 60, 60)
        v1.ImageColor3 = v2
        v1.ScaleType = Enum.ScaleType.Fit
        v6[v3] = (createElement("ImageLabel", v1, {UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {})}))
    end
    local v8, u96 = React.useBinding(UDim2.new())
    local rewards = v7.rewards
    v3 = {}
    v3.UIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 2), PaddingTop = UDim.new(0, 4)})
    local v9 = createElement
    v1 = {
        FillDirection = Enum.FillDirection.Horizontal,
        Padding = UDim.new(0, 15),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v1[React.Change.AbsoluteContentSize] = function(a1) -- Line: 161 -- upvalues: u96 (val) -- types: a1: userdata
        u96(UDim2.fromOffset(a1.AbsoluteContentSize.X, 0))
    end

    v3.UIListLayout = v9("UIListLayout", v1)
    if rewards then
        local v10
        for j, k in rewards do
            v10 = ("Reward_%*"):format(j)
            v3[v10] = (createRewardEntry(k, j))
        end
    end
    v1 = {
        BackgroundTransparency = 0.1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
        Position = UDim2.fromScale(0.293, 0.018),
        Size = UDim2.fromScale(0.693, 0.793),
    }
    v2 = {}
    local v11 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.35),
        Size = UDim2.fromScale(0.976, 0.675),
    }
    local v12 = {
        MissionImage = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 0,
            Position = UDim2.fromScale(0, 0.01),
            Size = UDim2.fromScale(0.99, 1.076),
            Image = v4,
            ScaleType = Enum.ScaleType.Crop,
        }),
        MissionTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.724, 0.1),
            Size = UDim2.fromScale(0.693, 0.141),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = v7.missionTitle or "Mission Name",
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
        }),
        ChapterTitle = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TextScaled = true,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.472, 0.204),
            Size = UDim2.fromScale(0.44, 0.089),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Bold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            Text = v7.chapterTitle or "Chapter Name",
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(0, 0, 0)}),
        }),
    }
    local v13 = false
    if v7.stars ~= nil then
        v13 = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(1, 0),
            Position = UDim2.fromScale(0.98, 0.05),
            Size = UDim2.fromScale(0.35, 0.1),
        }, v6)
    end
    v12.StarRating = v13
    v12.UIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1.83})
    v12.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.034, 0)})
    v12.UIStroke = createElement("UIStroke", {
        Thickness = 0.01,
        Transparency = 0.95,
        BorderStrokePosition = Enum.BorderStrokePosition.Inner,
        Color = Color3.fromRGB(255, 255, 255),
        StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
    })
    v2.Display = createElement("Frame", v11, v12)
    v2.Rewards = createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.505, 0.88),
        Size = UDim2.fromScale(0.968, 0.262),
    }, {
        RewardsLabel = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Text = "Mission Rewards",
            TextScaled = true,
            TextWrapped = true,
            Size = UDim2.fromScale(0.339, 0.25),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.Heavy),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }),
        List = createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ScrollBarImageTransparency = 1,
            ScrollBarThickness = 0,
            CanvasSize = v8,
            HorizontalScrollBarInset = Enum.ScrollBarInset.None,
            Position = UDim2.fromScale(0, 0.328),
            ScrollingDirection = Enum.ScrollingDirection.X,
            Size = UDim2.fromScale(0.994, 0.619),
        }, v3),
        UIListLayout = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder}),
    })
    v2.Counter = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(39, 39, 39),
        Position = UDim2.fromScale(-0.386, 1.076),
        Size = UDim2.fromScale(0.328, 0.073),
    }, {
        Label = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 1,
            Text = "Levels completed",
            TextScaled = true,
            TextWrapped = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Size = UDim2.fromScale(0.646, 0.773),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        Count = createElement("TextLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 2,
            TextScaled = true,
            TextWrapped = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Size = UDim2.fromScale(0, 0.55),
            FontFace = Font.fromName("Montserrat", Enum.FontWeight.SemiBold),
            Text = ("%* / %*"):format(v7.completedMissions or 0, v7.totalMissions or 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }, {
            UIStroke = createElement("UIStroke", {Thickness = 2}),
            UITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24}),
        }),
        UIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        InnerStroke = createElement("UIStroke", {
            Thickness = 0.05,
            Color = Color3.fromRGB(109, 109, 109),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
    })
    v2.UICorner = createElement("UICorner", {CornerRadius = UDim.new(0.018, 0)})
    v2.UIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.8, Color = Color3.fromRGB(255, 255, 255)})
    return createElement("Frame", v1, v2)
end