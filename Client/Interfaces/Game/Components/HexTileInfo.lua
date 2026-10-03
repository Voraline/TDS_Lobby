-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HexTileInfo
-- Decompile time: 12.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useAtomBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = ReactFlow.useSpring
local useState = React.useState

local function PurchaseFrame(a1) -- Line: 21
    -- upvalues: useState (val), useReactBindings (val), React (val), table (val), Icons (val), Comma (val)
    local v1, u4 = useState(0)
    local v2, u8 = useState(0)
    local skillPriceNumber = a1.skillPriceNumber
    local skillPointCost = a1.skillPointCost
    local userSkillPoints = a1.userSkillPoints
    local v3 = {skillPointCost, skillPriceNumber}
    useReactBindings(function(a1, a2) -- Line: 29 -- upvalues: u4 (val), u8 (val)
        u4(a1)
        u8(a2)
    end, v3)
    local v4 = {}
    if userSkillPoints > 0 then
        if not (v1 <= userSkillPoints) then
            v4.SkillPoints = userSkillPoints
            v2 = v1 - userSkillPoints
        else
            v4.SkillPoints = v1
            v2 = 0
        end
    end
    if v2 > 0 then
        v4.Coins = v2
    end
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Size = not (userSkillPoints ~= 0) and UDim2.fromScale(0.5, 1.5) or not (v2 ~= 0) and UDim2.fromScale(0.5, 1.5) or UDim2.fromScale(0.75, 1.5),
    }, {
        list = React.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder,
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0, 10),
        }),
    }, table.reduce(v4, function(a1, a2, a3) -- Line: 70 -- upvalues: React (upval), Icons (upval), Comma (upval)
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

local function ResearchProgressBar(a1) -- Line: 115 -- upvalues: React (val)
    local v1
    local v2 = math.clamp(a1.Progress or 0, 0, 1)
    local v3 = v2 > 0
    local v4 = {}
    for i = 1, 5 do
        v1 = ("Marker%*"):format(i)
        v4[v1] = (React.createElement("Frame", {
            BackgroundTransparency = 0.62,
            BorderSizePixel = 0,
            ZIndex = 8,
            Size = UDim2.fromScale(0.012, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            LayoutOrder = i,
        }))
    end
    return React.createElement("Frame", {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = 3,
        Size = UDim2.fromScale(0.56, 0.052),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.84),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }, {
        CornerRadius = React.createElement("UICorner", {CornerRadius = UDim.new(0.5, 0)}),
        Gradient = React.createElement("UIGradient", {
            Rotation = 90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(86, 64, 37)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(22, 18, 13))),
            }),
        }),
        Stroke = React.createElement("UIStroke", {Thickness = 5, Transparency = 0.12, Color = Color3.fromRGB(18, 13, 8)}),
        Fill = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://76876230251877",
            ZIndex = 5,
            Size = UDim2.fromScale(v2, 1),
            ScaleType = Enum.ScaleType.Stretch,
        }, {
            CornerRadius = React.createElement("UICorner", {CornerRadius = UDim.new(0.5, 0)}),
            Gradient = React.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 122, 18)),
                    ColorSequenceKeypoint.new(0.58, Color3.fromRGB(255, 174, 38)),
                    ColorSequenceKeypoint.new(0.9, Color3.fromRGB(255, 232, 144)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))),
                }),
            }),
        }),
        Cap = v3 and React.createElement("Frame", {
            BackgroundTransparency = 0.1,
            BorderSizePixel = 0,
            ZIndex = 7,
            Size = UDim2.fromScale(0.035, 1),
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(math.clamp(v2, 0.025, 0.985), 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 244, 179),
        }, {
            Gradient = React.createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
        }),
        Markers = React.createElement("Frame", {BackgroundTransparency = 1, ZIndex = 8, Size = UDim2.fromScale(1, 1)}, {
            ListLayout = React.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                HorizontalFlex = Enum.UIFlexAlignment.SpaceEvenly,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            React.createElement(React.Fragment, nil, v4),
        }),
    })
end

return function(a1) -- Line: 209
    -- upvalues: useAtom (val), useCache (val), useAtomBinding (val), Skills (val), useSpring (val), React (val)
    -- upvalues: PurchaseFrame (val), ResearchProgressBar (val), Icons (val)
    local u3 = useAtom(a1.Level)
    local u6 = useAtom(a1.IsHovering)
    local u9 = useAtom(a1.Price)
    local v1 = useAtom(a1.IsLocked)
    local v2 = useAtom(a1.SkillCap)
    local u18 = useAtom(a1.LevelsNeeded)
    local v3 = useAtom(a1.IsMaxedOut)
    local u25 = useCache("Values.Coins", 0)
    local v4 = useCache("Values.SkillCredits", 0)
    local v5 = useAtomBinding(a1.SkillPointCost)
    local v6 = useAtomBinding(a1.SkillPriceNumber)
    local SkillData = a1.SkillData or Skills.nodes[a1.SkillEnum] or {}
    local u45 = a1.Mode == "Research"
    local v7 = u45 and v1
    local u53 = SkillData.previousNodeLevel or 1
    local RequiredTowerLevel = a1.RequiredTowerLevel or SkillData.requiredTowerLevel
    local v8 = if typeof(RequiredTowerLevel) ~= "number" then u53 else RequiredTowerLevel
    local v9 = math.clamp(u18, 0, 1)
    local v10, u81 = useSpring({speed = 20, damper = 1, start = Color3.fromRGB(255, 243, 68)})
    local v11, u94 = useSpring({speed = 20, damper = 1, start = if not u6 then 1 else 0})
    local v12, u102 = useSpring({speed = 20, damper = 1, start = Vector2.new(0, 0.5)})
    local v13, u110 = useSpring({speed = 20, damper = 1, start = UDim2.fromScale(0.5, 0.5)})
    local v14, u115 = React.useState(false)
    local v15 = {u6}
    React.useEffect(function() -- Line: 247 -- upvalues: u94 (val), u6 (val)
        u94({target = if not u6 then 1 else 0})
    end, v15)
    v15 = {u25, u9}
    React.useEffect(function() -- Line: 250 -- upvalues: u81 (val), u25 (val), u9 (val)
        local v1 = {}
        local v2 = u9 <= u25 and Color3.fromRGB(255, 243, 68) or Color3.fromRGB(255, 0, 0)
        v1.target = v2
        u81(v1)
    end, v15)
    v15 = {u3}
    React.useEffect(function() -- Line: 256 -- upvalues: u115 (val), u3 (val), u110 (val)
        u115(u3 == 0)
        if u3 == 0 then
            u110({target = UDim2.fromScale(0.5, 0.425)})
            return
        end
        u110({target = UDim2.fromScale(0.5, 0.5)})
    end, v15)
    v15 = {u45, u18, u53}
    React.useEffect(function() -- Line: 265 -- upvalues: u45 (val), u53 (val), u18 (val), u102 (val)
        local v1 = if not u45 then u53 else 1
        u102({target = Vector2.new(0, 0.5 - math.clamp(u18, 0, v1) / v1)})
    end, v15)
    local createElement = React.createElement
    v15 = {BackgroundTransparency = 1, Rotation = 90, Size = UDim2.fromScale(1, 1)}
    local v16 = {}
    local createElement_2 = React.createElement
    local v17 = {
        BackgroundTransparency = 1,
        TextScaled = false,
        TextSize = 100,
        TextWrapped = true,
        ZIndex = 2,
        Size = UDim2.fromScale(0.9, 0.3),
        AnchorPoint = Vector2.new(0.5, 1),
    }
    local v18 = v3 and UDim2.fromScale(0.5, 0.85) or UDim2.fromScale(0.5, 0.775)
    v17.Position = v18
    v18 = if not v7 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(165, 165, 165)
    v17.TextColor3 = v18
    v17.Visible = not v1 or u45
    v17.TextYAlignment = Enum.TextYAlignment.Bottom
    v17.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    local Text = a1.Text or SkillData.displayName or "Extreme Conditioning"
    v17.Text = Text
    v16.SkillName = createElement_2("TextLabel", v17, {
        UIStroke = React.createElement("UIStroke", {
            Thickness = 10,
            Transparency = 0,
            Color = Color3.fromRGB(25, 25, 25),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        }),
    })
    local createElement_4 = React.createElement
    v17 = {
        BackgroundTransparency = 1,
        TextScaled = false,
        TextSize = 90,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 0.09),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0.125),
    }
    v18 = if not v7 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(255, 171, 61)
    v17.TextColor3 = v18
    v17.FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal)
    v18 = if not u45 then v3 and "MAX [" .. u3 .. "]" or u3 .. "/" .. v2 else if not v3 then ("Lv. %*"):format(v8) else "UNLOCKED"
    v17.Text = v18
    if not u45 then
        v18 = false
        if v1 == false then
            v18 = v14 == false
        end
    else
        v18 = true
    end
    v17.Visible = v18
    v16.SkillLevel = createElement_4("TextLabel", v17, {
        UIStroke = React.createElement("UIStroke", {
            Thickness = 10,
            Transparency = 0,
            Color = Color3.fromRGB(25, 25, 25),
            ApplyStrokeMode = Enum.ApplyStrokeMode.Contextual,
        }),
    })
    v16.PurchaseFrame = not u45 and not v3 and React.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 2,
        Size = UDim2.fromScale(1, 0.09),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.89),
        Visible = not v1,
    }, {
        UIListLayout = React.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.025, 0),
        }),
        PurchaseFrame = React.createElement(PurchaseFrame, {
            skillPriceNumber = v6,
            skillPointCost = v5,
            userSkillPoints = v4,
            Background = a1.Background,
            coinColor = v10,
        }),
    })
    local v19 = u45
    if v19 then
        v19 = v1
        if v19 then
            v19 = false
            if v8 > 0 then
                v19 = React.createElement(ResearchProgressBar, {Progress = v9})
            end
        end
    end
    v16.ResearchProgress = v19
    v16.InnerGlow = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://82471154511192",
        ZIndex = 5,
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageTransparency = v11,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = Enum.ScaleType.Crop,
    }, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.88}),
    })
    v16.MaxedGlow = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://82471154511192",
        ImageTransparency = 0,
        ZIndex = 4,
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(255, 245, 155),
        ScaleType = Enum.ScaleType.Crop,
        Visible = v3,
    }, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.88}),
    })
    local createElement_12 = React.createElement
    v17 = {BackgroundTransparency = 1, ZIndex = 1}
    v18 = if not u45 then UDim2.fromScale(1, 1) else UDim2.fromScale(0.85, 0.85)
    v17.Size = v18
    v17.AnchorPoint = Vector2.new(0.5, 0.5)
    v17.Position = v13
    local icon_3 = if typeof(SkillData.icon) ~= "number" then SkillData.icon or Icons.QuestionMark else ("rbxassetid://%*"):format(SkillData.icon)
    v17.Image = icon_3
    v18 = if not v7 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(135, 135, 135)
    v17.ImageColor3 = v18
    v17.ImageTransparency = if not v7 then 0 else 0.55
    v17.Visible = not v1 or u45
    v17.ScaleType = Enum.ScaleType.Crop
    v18 = {AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})}
    local v20 = u45 and React.createElement("UICorner", {CornerRadius = UDim.new(1, 0)})
    v18.CornerRadius = v20
    v16.SkillIcon = createElement_12("ImageLabel", v17, v18)
    v16.LockedIcon = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://128309542125994",
        ZIndex = 1,
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = Enum.ScaleType.Crop,
        Visible = v1 and not u45,
    }, {AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    local createElement_15 = React.createElement
    v17 = {
        BackgroundTransparency = 1,
        ZIndex = -5,
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    v17.Image = not (v1 ~= false) and not (v14 ~= false) and a1.Background or "rbxassetid://140238974525975"
    v18 = if not v7 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(85, 85, 85)
    v17.ImageColor3 = v18
    v17.ScaleType = Enum.ScaleType.Crop
    v16.BackgroundImage = createElement_15("ImageLabel", v17, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.88}),
    })
    v16.FillImage = React.createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://110108164854855",
        ImageTransparency = 0.75,
        ZIndex = 0,
        Size = UDim2.fromScale(1.1, 1.1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Visible = v1,
        ImageColor3 = Color3.fromRGB(255, 255, 255),
        ScaleType = Enum.ScaleType.Crop,
    }, {
        AspectRatioConstraint = React.createElement("UIAspectRatioConstraint", {AspectRatio = 0.88}),
        UIGradient = React.createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(0.5, 0),
                NumberSequenceKeypoint.new(0.51, 1),
                (NumberSequenceKeypoint.new(1, 1)),
            }),
            Offset = v12,
        }),
    })
    return createElement("Frame", v15, v16)
end