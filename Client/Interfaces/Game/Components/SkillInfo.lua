-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SkillInfo
-- Decompile time: 9.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local MultiGlowButton = require(ReplicatedStorage.Client.Interfaces.Components.MultiGlowButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local TowerUpgradeStats = require(ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerUpgradeStats)
local WorldCursor = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = ReactFlow.useSpring
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
local Event = React.Event

local function PurchaseButton(a1) -- Line: 25
    -- upvalues: useState (val), useReactBindings (val), React (val), MultiGlowButton (val), Icons (val), table (val)
    -- upvalues: Comma (val)
    local v1, u4 = useState(0)
    local v2, u8 = useState(0)
    local skillPriceNumber = a1.skillPriceNumber
    local skillPointCost = a1.skillPointCost
    local v3 = a1.userSkillPoints or 0
    local v4 = {skillPointCost, skillPriceNumber}
    useReactBindings(function(a1, a2) -- Line: 33 -- upvalues: u4 (val), u8 (val)
        u4(a1)
        u8(a2)
    end, v4)
    local v5 = {}
    if v3 > 0 then
        if not (v1 <= v3) then
            v5.SkillPoints = v3
            v2 = v1 - v3
        else
            v5.SkillPoints = v1
            v2 = 0
        end
    end
    if v2 > 0 then
        v5.Coins = v2
    end
    return React.createElement(MultiGlowButton, {
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        Size = not (v3 ~= 0) and UDim2.fromScale(0.5, 0.1) or not (v2 ~= 0) and UDim2.fromScale(0.5, 0.1) or UDim2.fromScale(0.75, 0.1),
        clicked = a1.clicked,
        color = a1.coinColor,
        icon = Icons.Coins,
        padding = UDim.new(0.05, 0),
    }, {
        list = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    }, table.reduce(v5, function(a1, a2, a3) -- Line: 78 -- upvalues: React (upval), Icons (upval), Comma (upval)
        local createElement = React.createElement
        local v1 = {
            BackgroundTransparency = 1,
            Size = UDim2.fromScale(0, 1),
            SizeConstraint = Enum.SizeConstraint.RelativeYY,
            AutomaticSize = Enum.AutomaticSize.X,
        }
        local v2 = {
            list = React.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder,
                FillDirection = Enum.FillDirection.Horizontal,
                VerticalAlignment = Enum.VerticalAlignment.Center,
                Padding = UDim.new(0, 2),
            }),
        }
        local createElement_3 = React.createElement
        local v3 = {BackgroundTransparency = 1, LayoutOrder = 0}
        local Coins = Icons[a3] or Icons.Coins
        v3.Image = Coins
        v3.Size = UDim2.fromScale(0.8, 0.8)
        v3.SizeConstraint = Enum.SizeConstraint.RelativeYY
        v3.Position = UDim2.fromScale(0, 0)
        v2.icon = createElement_3("ImageLabel", v3)
        v2.text = React.createElement("TextLabel", {
            TextScaled = true,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Text = Comma((math.floor(a2))),
            Size = UDim2.fromScale(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            Position = UDim2.fromScale(0.5, 0),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        })
        a1[a3] = (createElement("Frame", v1, v2))
        return a1
    end, {}))
end

return function(a1) -- Line: 123
    -- upvalues: Skills (val), useCache (val), useBinding (val), useSpring (val), useReactBindings (val)
    -- upvalues: useEffect (val), React (val), Event (val), WorldCursor (val), TowerUpgradeStats (val)
    -- upvalues: PurchaseButton (val)
    local SkillEnum = a1.SkillEnum
    local SkillData = a1.SkillData or SkillEnum and Skills.nodes[SkillEnum]
    local SkillComparison = a1.SkillComparison
    local SkillPriceNumber = a1.SkillPriceNumber
    local SkillDescription = a1.SkillDescription
    local MaxedOut = a1.MaxedOut
    local v1 = true
    if a1.Mode ~= "Research" then
        v1 = SkillData and SkillData.mode == "Research"
    end
    local UpgradeStats = a1.UpgradeStats or SkillData and SkillData.upgradeStats or {}
    local v2 = v1
    if v2 then
        v2 = false
        if typeof(UpgradeStats) == "table" then
            v2 = #UpgradeStats > 0
        end
    end
    local v3 = a1.SkillPoints or 0
    local SkillPointCost = a1.SkillPointCost
    local u46 = useCache("Values.Coins", 0)
    local v4 = useBinding(true)
    local v5, u58 = useSpring({speed = 20, damper = 1, start = Color3.fromRGB(255, 255, 255)})
    local v6 = {SkillPriceNumber}
    useReactBindings(function(a1) -- Line: 143 -- upvalues: u58 (val), u46 (val)
        local v1 = {}
        local v2 = a1 <= u46 and Color3.fromRGB(46, 252, 80) or Color3.fromRGB(255, 0, 0)
        v1.target = v2
        u58(v1)
    end, v6)
    v6 = {u46}
    useEffect(function() -- Line: 150 -- upvalues: u58 (val), u46 (val), SkillPriceNumber (val)
        local v1 = {}
        local v2 = SkillPriceNumber:getValue() <= u46 and Color3.fromRGB(46, 252, 80) or Color3.fromRGB(255, 0, 0)
        v1.target = v2
        u58(v1)
    end, v6)
    local createElement = React.createElement
    v6 = {}

    v6[Event.MouseEnter] = function() -- Line: 158 -- upvalues: WorldCursor (upval)
        WorldCursor:PauseInput(true)
    end

    v6[Event.MouseLeave] = function() -- Line: 161 -- upvalues: WorldCursor (upval)
        WorldCursor:ResumeInput()
    end

    v6.AnchorPoint = Vector2.new(0.5, 0.5)
    local Position = a1.Position or UDim2.fromScale(0.1, 0.5)
    v6.Position = Position
    local v7 = if not v2 then if not v1 then UDim2.new(0.225, 40, 0.225, 80) else UDim2.new(0.225, 40, 0.2, 50) else UDim2.new(0.245, 64, 0.255, 112)
    v6.Size = v7
    v6.BorderSizePixel = 0
    v6.BackgroundTransparency = 0.1
    v6.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    v6.ZIndex = 100
    v7 = {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {
            AspectRatio = if not v2 then if not v1 then 0.625 else 0.7142857142857143 else 0.5882352941176471,
        }),
    }
    v7.Scale = React.createElement("UIScale", {Scale = a1.Scale})
    v7.Stroke = React.createElement("UIStroke", {
        Thickness = 2,
        Transparency = 0.8,
        Color = Color3.fromRGB(255, 255, 255),
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        LineJoinMode = Enum.LineJoinMode.Round,
    })
    v7.CornerRadius = React.createElement("UICorner", {CornerRadius = UDim.new(0.04, 0)})
    v7.SkillName = React.createElement("TextLabel", {
        TextScaled = true,
        BackgroundTransparency = 1,
        Text = SkillData and SkillData.displayName or "NO NAME",
        AnchorPoint = Vector2.new(0.5, 0),
        Size = UDim2.fromScale(0.9, 0.075),
        Position = UDim2.fromScale(0.5, 0.05),
        TextColor3 = Color3.fromRGB(255, 255, 255),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }, {
        Stroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.25, Color = Color3.fromRGB(0, 0, 0)}),
    })
    v7.DividerFrame = React.createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.15),
        Size = UDim2.fromScale(0.8, 0.002),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        Gradient = React.createElement("UIGradient", {
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 1),
                NumberSequenceKeypoint.new(0.5, 0),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
        }),
    })
    local createElement_10 = React.createElement
    local v8 = {
        BackgroundTransparency = 1,
        Image = if not SkillData or typeof(SkillData.icon) ~= "number" then if not SkillData then "rbxassetid://0" else if not SkillData.icon then "rbxassetid://0" else SkillData.icon else ("rbxassetid://%*"):format(SkillData.icon),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v9 = if not v2 then if not v1 then UDim2.fromScale(0.5, 0.37) else UDim2.fromScale(0.5, 0.36) else UDim2.fromScale(0.5, 0.3)
    v8.Position = v9
    v9 = if not v2 then if not v1 then UDim2.fromScale(1, 1) else UDim2.fromScale(0.92, 0.92) else UDim2.fromScale(0.68, 0.68)
    v8.Size = v9
    v7.SkillImage = createElement_10("ImageLabel", v8, {AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    local createElement_11 = React.createElement
    v8 = {
        TextScaled = true,
        RichText = true,
        BackgroundTransparency = 1,
        Text = SkillDescription,
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    v9 = if not v2 then if not v1 then UDim2.fromScale(0.5, 0.64) else UDim2.fromScale(0.5, 0.7) else UDim2.fromScale(0.5, 0.49)
    v8.Position = v9
    v8.TextColor3 = Color3.fromRGB(255, 255, 255)
    v8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v9 = if not v2 then if not v1 then UDim2.fromScale(0.8, 0.15) else UDim2.fromScale(0.84, 0.22) else UDim2.fromScale(0.84, 0.13)
    v8.Size = v9
    v8.TextYAlignment = if not v1 then Enum.TextYAlignment.Bottom else Enum.TextYAlignment.Center
    v9 = {
        Stroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.25, Color = Color3.fromRGB(0, 0, 0)}),
    }
    v7.SkillDescription = createElement_11("TextLabel", v8, v9)
    v7.ResearchStats = v2 and React.createElement(TowerUpgradeStats, {
        CornerRadius = 6,
        ZIndex = 12,
        IsLocked = false,
        IsVertical = true,
        KeepStatsExpanded = true,
        Size = UDim2.fromScale(0.84, 0.29),
        Position = UDim2.fromScale(0.5, 0.62),
        AnchorPoint = Vector2.new(0.5, 0),
        Visible = v4,
        UpgradeStats = UpgradeStats,
    })
    local v10 = not v1
    if v10 then
        local createElement_14 = React.createElement
        v8 = {
            TextScaled = true,
            RichText = true,
            BackgroundTransparency = 1,
            ZIndex = 12,
            Text = SkillComparison,
            AnchorPoint = Vector2.new(0.5, 1),
        }
        v9 = MaxedOut and UDim2.fromScale(0.5, 0.86) or UDim2.fromScale(0.5, 0.79)
        v8.Position = v9
        v8.TextColor3 = Color3.fromRGB(255, 255, 255)
        v8.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)
        v8.Size = UDim2.fromScale(0.85, 0.06)
        v10 = createElement_14("TextLabel", v8, {
            Stroke = React.createElement("UIStroke", {Thickness = 2, Transparency = 0.25, Color = Color3.fromRGB(0, 0, 0)}),
        })
    end
    v7.SkillComparison = v10
    v7.PurchaseButton = not v1 and not MaxedOut and React.createElement(PurchaseButton, {
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.93),
        clicked = a1.Clicked,
        coinColor = v5,
        userSkillPoints = v3,
        skillPriceNumber = SkillPriceNumber,
        skillPointCost = SkillPointCost,
    })
    v7.PointerImage = React.createElement("ImageLabel", {
        Image = "http://www.roblox.com/asset/?id=8429335105",
        BackgroundTransparency = 1,
        ZIndex = 10,
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.fromScale(0.99, 0.5),
        Size = UDim2.fromScale(0.3, 0.3),
    }, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.20300751879699247}),
    })
    v7.DropShadow = React.createElement("ImageLabel", {
        Image = "http://www.roblox.com/asset/?id=9239716855",
        BackgroundTransparency = 1,
        ImageTransparency = 0.2,
        ZIndex = 9,
        SliceScale = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.1, 1.02),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
    }, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.646875}),
    })
    return createElement("Frame", v6, v7)
end