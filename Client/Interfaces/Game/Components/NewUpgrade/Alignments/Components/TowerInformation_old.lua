-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.NewUpgrade.Alignments.Components.TowerInformation_old
-- Decompile time: 37.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Shared = ReplicatedStorage.Shared
local Packages = ReplicatedStorage.Packages
local Hooks = Interfaces.Hooks
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local React = require(Shared.UI.React)
local ReactFlow = require(Packages.ReactFlow)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local useReactBindings = require(Hooks.useReactBindings)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local Icons_2 = require(ReplicatedStorage.Client.Interfaces.Icons)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local createElement = React.createElement
local memo = React.memo
local useEffect = React.useEffect
local useSpring = ReactFlow.useSpring
local useTween = ReactFlow.useTween

local function formatPercent(a1) -- Line: 35 -- types: a1: number
    local v1 = math.round(a1 * 10) / 10
    if v1 == math.floor(v1) then
        return (tostring(v1))
    end
    return string.format("%.1f", v1)
end

local function formatSignedPercent(a1) -- Line: 45 -- types: a1: number
    local v1 = if not (a1 > 0) then "" else "+"
    local v2 = math.round(a1 * 10) / 10
    return (("%*%*%%"):format(v1, if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)))
end

local function getCoordinationDamageBonusText(a1) -- Line: 51
    local Attributes = a1 and a1.Attributes
    local CoordinationDamageBonus = Attributes and Attributes.CoordinationDamageBonus
    if type(CoordinationDamageBonus) == "number" and not ((math.abs(CoordinationDamageBonus)) < 0.05) then
        local v1 = if not (CoordinationDamageBonus > 0) then "" else "+"
        local v2 = math.round(CoordinationDamageBonus * 10) / 10
        return (("%*%*%%"):format(v1, if v2 ~= math.floor(v2) then string.format("%.1f", v2) else tostring(v2)))
    end
    return nil
end

local function createStatHolder(a1, a2, a3, a4) -- Line: 62
    -- upvalues: createElement (val), React (val)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(150, 30),
    }, {
        icon = React.createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = a3,
            ScaleType = Enum.ScaleType.Fit,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(25, 25),
            ImageTransparency = a4(0),
        }),
        textLabel = React.createElement("TextLabel", {
            TextSize = 15,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Text = a1,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 28, 0.48, 0),
            Size = UDim2.new(0, 120, 1, 0),
            TextTransparency = a4(0),
        }),
        textLabel1 = React.createElement("TextLabel", {
            TextSize = 15,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Text = a2,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Right,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 28, 0.48, 0),
            Size = UDim2.new(0, 140, 1, 0),
            TextTransparency = a4(0),
        }),
    })
end

local u59 = memo(function(a1) -- Line: 130
    -- upvalues: createStatHolder (val), Icons (val), Icons_2 (val), createElement (val), React (val)
    local Locked, v1
    local v2 = {}
    if not a1.towerStats then
        return nil
    end
    local v3 = {"Range", "Damage", "Cooldown", "Limit"}
    local v4 = nil
    local v5 = nil
    for i, j in a1.towerStats, v4, v5 do
        if table.find(v3, i) then
            Locked = Icons[i] or Icons.Locked
            v2[i] = (createStatHolder(i, j, Locked, a1.TransparencyModifier))
        end
    end
    local towerStats_2 = a1.towerStats
    local Attributes = towerStats_2 and towerStats_2.Attributes
    local CoordinationDamageBonus = Attributes and Attributes.CoordinationDamageBonus
    if type(CoordinationDamageBonus) ~= "number" then
        v1 = nil
    elseif not ((math.abs(CoordinationDamageBonus)) < 0.05) then
        local v6 = math.round(CoordinationDamageBonus * 10) / 10
        local v7 = if v6 ~= math.floor(v6) then string.format("%.1f", v6) else tostring(v6)
        v1 = ("%*%*%%"):format(if not (CoordinationDamageBonus > 0) then "" else "+", v7)
    else
        v1 = nil
    end
    if v1 then
        local TransparencyModifier
        v2.CoordinationDamageBonus = createStatHolder("Coord. Damage", v1, Icons_2.Coordination, TransparencyModifier)
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        uIListLayout = React.createElement("UIListLayout", {Padding = UDim.new(0, -7), SortOrder = Enum.SortOrder.LayoutOrder}),
    }, v2)
end)
local u63 = memo(function(a1) -- Line: 172 -- upvalues: createElement (val), React (val), Icons_2 (val)
    local v1
    local u1 = {}
    local TransparencyModifier = a1.TransparencyModifier
    local v2 = {
        HiddenDetection = {Name = "Hidden", Icon = "Hidden", Text = "Hidden Detection"},
        FlyingDetection = {Name = "Flying", Icon = "Flying", Text = "Flying Detection"},
        LeadDetection = {Name = "Lead", Icon = "Lead", Text = "Lead Detection"},
        FreezeImmune = {Name = "Freeze Immune", Icon = "FreezeImmune", Text = "Freeze Immunity"},
        StunImmune = {Name = "Stun Immune", Icon = "StunImmune", Text = "Stun Immunity"},
    }
    local u9 = {}

    local function pushBadge(a1) -- Line: 207
        -- upvalues: u9 (val), u1 (val), createElement (upval), React (upval), Icons_2 (upval)
        -- upvalues: TransparencyModifier (val)
        if u9[a1.Name] then
            return
        end
        u9[a1.Name] = true
        u1[a1.Name] = (createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(150, 30),
        }, {
            icon = React.createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Image = Icons_2[a1.Icon],
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0, 1, 0.5, 0),
                Size = UDim2.fromOffset(20, 20),
                ImageTransparency = TransparencyModifier(0),
            }),
            textLabel = React.createElement("TextLabel", {
                TextSize = 15,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                Text = a1.Text,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0, 0.5),
                AutomaticSize = Enum.AutomaticSize.X,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.new(0, 28, 0.48, 0),
                Size = UDim2.fromScale(0, 1),
                TextTransparency = TransparencyModifier(0),
            }),
        }))
    end

    if a1.towerStats and a1.towerStats.Detections then
        for i, j in a1.towerStats.Detections do
            if j then
                v1 = v2[i]
                if v1 then
                    pushBadge(v1)
                end
            end
        end
    end
    if a1.statusEffects then
        for k, n in a1.statusEffects do
            if n then
                v1 = v2[k]
                if v1 then
                    pushBadge(v1)
                end
            end
        end
    end
    if next(u1) == nil then
        return nil
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromOffset(0, 120),
    }, {
        uIListLayout = React.createElement("UIListLayout", {Padding = UDim.new(0, -7), SortOrder = Enum.SortOrder.LayoutOrder}),
    }, u1)
end, function(a1, a2) -- Line: 299
    local v1 = false
    if a1.statusEffects == a2.statusEffects then
        v1 = a1.towerStats == a2.towerStats
    end
    return v1
end)
local u66 = memo(function(a1) -- Line: 304 -- upvalues: TowerAbilityIcons (val), createElement (val), React (val)
    local v1 = {}
    if a1.plotData and a1.plotData["Tower Ability"] then
        local Header, v2, v3, v4, v5, v6, v7, v8
        local v9 = a1.plotData["Tower Ability"]
        local towerStats = a1.towerStats

        local function getIcon(a1_2) -- Line: 314 -- upvalues: towerStats (val), TowerAbilityIcons (upval), a1 (val)
            local v1
            if not towerStats.Abilities then
                return nil
            end
            local v2 = nil
            local v3 = nil
            local v4 = a1_2
            for i, j in towerStats.Abilities, v2, v3 do
                if j.Name ~= v4 and j.DisplayName ~= v4 then
                    continue
                end
                v1 = TowerAbilityIcons.getIcon(a1.towerAsset, a1.towerSkin, j)
                if v1 ~= nil then
                    return (("rbxassetid://%*"):format(v1))
                end
            end
            return nil
        end

        if not v9 then
            return
        end
        local TransparencyModifier = a1.TransparencyModifier
        local v10 = nil
        local v11 = nil
        for i, j in v9, v10, v11 do
            v2 = getIcon(j.Header)
            if not v2 and typeof(j.Icon) == "number" then
                v2 = ("rbxassetid://%*"):format(j.Icon)
            end
            v3 = {}
            for k, n in j.Content do
                v6 = createElement
                v7 = {
                    RichText = true,
                    TextSize = 13,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                    Text = n.Text,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    LayoutOrder = 1 + k,
                    Size = UDim2.fromScale(1, 0),
                    TextTransparency = TransparencyModifier(0),
                }
                v3[k] = (v6("TextLabel", v7))
            end
            Header = j.Header
            v4 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromOffset(290, 0),
            }
            v5 = {
                icon = v2 and createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    Image = v2,
                    ScaleType = Enum.ScaleType.Fit,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromOffset(50, 50),
                    ImageTransparency = TransparencyModifier(0),
                }),
            }
            v7 = {BackgroundTransparency = 1, BorderSizePixel = 0}
            v7.AutomaticSize = Enum.AutomaticSize.Y
            v7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            v7.BorderColor3 = Color3.fromRGB(0, 0, 0)
            v8 = v2 and UDim2.fromOffset(50, 0) or UDim2.fromOffset(0, 0)
            v7.Position = v8
            v7.Size = UDim2.fromScale(1, 0)
            v5.frame = createElement("Frame", v7, {
                uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}),
                uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 5)}),
                Description = createElement("TextLabel", {
                    RichText = true,
                    LayoutOrder = 1,
                    TextSize = 13,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                    Text = j.Description,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    TextYAlignment = Enum.TextYAlignment.Top,
                    AutomaticSize = Enum.AutomaticSize.Y,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromScale(1, 0),
                    TextTransparency = TransparencyModifier(0),
                }),
                Title = createElement("TextLabel", {
                    RichText = true,
                    LayoutOrder = 0,
                    TextSize = 18,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Text = j.Header,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    TextTransparency = TransparencyModifier(0),
                }, {
                    uIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = TransparencyModifier(0.84)}),
                }),
                Content = createElement(React.Fragment, nil, v3),
            })
            v1[Header] = (createElement("Frame", v4, v5))
        end
        local v12 = {}
        for m, i5 in v1 do
            v12[#v12 + 1] = (createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                LayoutOrder = 2,
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromOffset(0, 120),
                Size = UDim2.fromOffset(350, 0),
            }, {
                uIListLayout1 = React.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                uIPadding1 = React.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 5),
                    PaddingLeft = UDim.new(0, 5),
                    PaddingRight = UDim.new(0, 5),
                    PaddingTop = UDim.new(0, 5),
                }),
            }, i5))
        end
        return createElement(React.Fragment, nil, v12)
    end
    return nil
end)
local u69 = memo(function(a1) -- Line: 490 -- upvalues: createElement (val), React (val)
    if a1.plotData and a1.plotData["Tower Options"] then
        local v1, v2, v3, v4, v5, v6, v7, v8
        local optionsData = a1.optionsData
        local v9 = a1.plotData["Tower Options"]
        local towerStats = a1.towerStats
        local TransparencyModifier = a1.TransparencyModifier

        local function getIcon(a1) -- Line: 502 -- upvalues: optionsData (val)
            if typeof(a1) == "number" then
                return (("rbxassetid://%*"):format(a1))
            end
            local v1 = nil
            local v2 = nil
            for i, j in optionsData, v1, v2 do
                for k, n in j.Values do
                    if n.Name == v3 then
                        return (("rbxassetid://%*"):format(n.Icon))
                    end
                end
            end
            return nil
        end

        local v10 = {}
        local v11 = nil
        local v12 = nil
        for i, j in v9, v11, v12 do
            v1 = getIcon(j.Icon)
            v2 = {}
            for k, n in j.Content do
                v6 = string.gsub(n.Text, "%$%{(.-)%}", function(a1) -- Line: 526 -- upvalues: towerStats (val)
                    local v1 = string.split(a1, ".")
                    local Attributes = towerStats.Attributes
                    for i, j in v1 do
                        if Attributes[j] == nil then
                            return ""
                        else
                            Attributes = Attributes[j]
                        end
                    end
                    if Attributes ~= nil then
                        return (tostring(Attributes))
                    end
                    return ""
                end)
                v7 = createElement
                v8 = {
                    RichText = true,
                    TextSize = 13,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                    Text = v6,
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextXAlignment = Enum.TextXAlignment.Left,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    LayoutOrder = k + 1,
                    TextTransparency = TransparencyModifier(0),
                }
                v2[k] = (v7("TextLabel", v8))
            end
            v3 = createElement
            v4 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
            }
            v5 = {
                uIListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 5),
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                icon = createElement("ImageLabel", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    LayoutOrder = -1,
                    Image = v1,
                    ScaleType = Enum.ScaleType.Fit,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                    Size = UDim2.fromOffset(30, 30),
                    ImageTransparency = TransparencyModifier(0),
                }),
                info = createElement("Frame", {
                    BackgroundTransparency = 1,
                    BorderSizePixel = 0,
                    AutomaticSize = Enum.AutomaticSize.XY,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    BorderColor3 = Color3.fromRGB(0, 0, 0),
                }, {
                    uIListLayout1 = createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder,
                        VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    }),
                    header = createElement("TextLabel", {
                        RichText = true,
                        TextSize = 13,
                        TextWrapped = true,
                        BackgroundTransparency = 1,
                        BorderSizePixel = 0,
                        LayoutOrder = -10,
                        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
                        Text = ("<font size=\"18\" color=\"%*\">%*</font>"):format(j.Color, j.Header),
                        TextColor3 = Color3.fromRGB(255, 255, 255),
                        TextXAlignment = Enum.TextXAlignment.Left,
                        AutomaticSize = Enum.AutomaticSize.XY,
                        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                        BorderColor3 = Color3.fromRGB(0, 0, 0),
                        TextTransparency = TransparencyModifier(0),
                    }),
                    Content = createElement(React.Fragment, nil, v2),
                }),
            }
            v10[i] = (v3("Frame", v4, v5))
        end
        if #v10 == 0 then
            return nil
        end
        return createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = 4,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromOffset(350, 0),
        }, {
            uIListLayout = React.createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}),
            title = React.createElement("TextLabel", {
                Text = "Tower Options",
                TextSize = 20,
                BackgroundTransparency = 1,
                LayoutOrder = -55,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                TextTransparency = TransparencyModifier(0),
            }, {
                uIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = TransparencyModifier(0.84)}),
            }),
            uIPadding = React.createElement("UIPadding", {PaddingLeft = UDim.new(0, 5)}),
            options = createElement(React.Fragment, nil, v10),
        })
    end
    return nil
end)
return function(a1) -- Line: 676
    -- upvalues: useTween (val), useSpring (val), useTransparencyModifier (val), useReactBindings (val), useEffect (val)
    -- upvalues: createElement (val), React (val), IconButton (val), u59 (val), u63 (val), u66 (val), u69 (val)
    local v1, u9 = useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
    })
    local v2, u13 = useSpring({target = 1, start = 1, damper = 0.7, speed = 20})
    local v3, u17 = useSpring({target = 0, start = 0, damper = 0.8, speed = 10})
    local v4, u34 = useTween({
        start = Color3.fromRGB(46, 46, 46),
        target = Color3.fromRGB(46, 46, 46),
        info = TweenInfo.new(0),
    })
    local u37 = useTransparencyModifier(v1)
    local v5 = useReactBindings
    local v6 = {a1.towerInformationEnabled}
    v5(function(a1) -- Line: 705 -- upvalues: u9 (val), u13 (val)
        local v1 = {target = if not a1 then 1 else 0}
        local v2 = a1 and TweenInfo.new(0.6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out) or TweenInfo.new(0.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        v1.info = v2
        u9(v1)
        u13({target = if not a1 then 1 else 0})
    end, v6, {})
    v5 = useEffect
    v6 = {a1.level, a1.path}
    v5(function() -- Line: 718 -- upvalues: u34 (val), u17 (val)
        u34({target = Color3.fromRGB(23, 255, 128), info = TweenInfo.new(0)})
        local u14 = task.delay(0.1, function() -- Line: 724 -- upvalues: u34 (upval)
            u34({
                target = Color3.fromRGB(8, 8, 8),
                info = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            })
        end)
        u17({force = -2})
        return function() -- Line: 735 -- upvalues: u14 (val)
            task.cancel(u14)
        end
    end, v6)
    return createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 999,
        AnchorPoint = Vector2.new(0.5, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        BackgroundColor3 = Color3.fromRGB(8, 8, 8),
        BackgroundTransparency = u37(0.06),
        Visible = a1.towerInformationEnabled,
        Position = React.joinBindings({v2, v3}):map(function(a1) -- Line: 748
            return (UDim2.fromScale(0.5, 0.5)) + UDim2.fromScale(0, (a1[1] + a1[2]) * 0.5)
        end),
    }, {
        corner = React.createElement("UICorner", {CornerRadius = UDim.new(0, 2)}),
        scale = React.createElement("UIScale", {Scale = 0.999}),
        stroke = React.createElement("UIStroke", {
            Color = v4,
            Thickness = v3:map(function(a1) -- Line: 762
                return a1 + 3
            end),
            Transparency = u37(0),
        }),
        iSizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new((1 / 0), 400), MinSize = Vector2.new(300, 0)}),
        textLabel = React.createElement("TextLabel", {
            Text = "Tower Information",
            TextSize = 28,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            LayoutOrder = -1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromOffset(0, -20),
            TextTransparency = u37(0),
        }, {
            uIStroke = React.createElement("UIStroke", {Thickness = 2, Transparency = u37(0.7)}),
            uIPadding = React.createElement("UIPadding", {PaddingTop = UDim.new(0, 5)}),
        }),
        closeButton = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(1, 0),
        }, {
            Exit = createElement(IconButton, {
                LayoutOrder = 4,
                Color = Color3.fromRGB(255, 79, 73),
                Position = UDim2.fromScale(0.5, 0.5),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Clicked = a1.onClose,
                Transparency = v1,
            }),
        }),
        frame = React.createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            AutomaticSize = Enum.AutomaticSize.XY,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
        }, {
            holder = React.createElement("Frame", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AutomaticSize = Enum.AutomaticSize.XY,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
            }, {
                iListLayout1 = React.createElement("UIListLayout", {
                    Wraps = true,
                    Padding = UDim.new(0, 20),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                iPadding1 = React.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 10),
                    PaddingLeft = UDim.new(0, 10),
                    PaddingRight = UDim.new(0, 10),
                    PaddingTop = UDim.new(0, 10),
                }),
                Stats = createElement(u59, {
                    towerStats = a1.towerStats,
                    plotData = a1.plotData,
                    TransparencyModifier = function(a1) -- Line: 849 -- upvalues: u37 (val)
                        return u37(a1 or 0)
                    end,
                }),
                Detections = createElement(u63, {
                    towerStats = a1.towerStats,
                    plotData = a1.plotData,
                    statusEffects = a1.statusEffects,
                    TransparencyModifier = function(a1) -- Line: 857 -- upvalues: u37 (val)
                        return u37(a1 or 0)
                    end,
                }),
                Ability = createElement(u66, {
                    towerStats = a1.towerStats,
                    towerAsset = a1.towerAsset,
                    towerSkin = a1.towerSkin,
                    plotData = a1.plotData,
                    TransparencyModifier = function(a1) -- Line: 866 -- upvalues: u37 (val)
                        return u37(a1 or 0)
                    end,
                }),
                TowerOptions = createElement(u69, {
                    towerStats = a1.towerStats,
                    plotData = a1.plotData,
                    optionsData = a1.upgradeOptions,
                    TransparencyModifier = function(a1) -- Line: 874 -- upvalues: u37 (val)
                        return u37(a1 or 0)
                    end,
                }),
            }),
        }),
    })
end