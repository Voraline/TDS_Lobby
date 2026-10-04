-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.TowerInformation.OtherOptionsTowerInformation
-- Decompile time: 20.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerAbilityIcons = require(ReplicatedStorage.Shared.Modules.TowerAbilityIcons)
local createElement = React.createElement

local function toAssetId(a1) -- Line: 23
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if typeof(a1) == "string" then
        return a1
    end
    return nil
end

local function LongStatComponent(a1) -- Line: 35 -- upvalues: createElement (val) -- types: a1: table
    local v1
    local v2 = {}
    if a1.description and a1.description ~= "" then
        v2.description = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            RichText = true,
            TextSize = 23,
            TextWrapped = true,
            ZIndex = 999,
            AutomaticSize = Enum.AutomaticSize.Y,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Size = UDim2.fromScale(1, 0),
            Text = a1.description,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        })
    end
    for i, j in a1.content or {} do
        v1 = ("content%*"):format(i)
        v2[v1] = (createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextSize = 23,
            TextWrapped = true,
            ZIndex = 999,
            AutomaticSize = Enum.AutomaticSize.Y,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            LayoutOrder = i + 1,
            Size = UDim2.fromScale(1, 0),
            Text = j.Text or "",
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }))
    end
    local v3 = {
        BackgroundTransparency = 1,
        ZIndex = 30,
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.fromScale(1, 0),
    }
    local v4 = {
        descriptions = createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            Position = UDim2.fromOffset(65, 30),
            Size = UDim2.new(1, -70, 0, 0),
        }, {
            uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 5), SortOrder = Enum.SortOrder.LayoutOrder}),
        }, v2),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            RichText = true,
            TextSize = 24,
            TextWrapped = true,
            ZIndex = 999,
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Position = UDim2.fromOffset(60, 0),
            Text = a1.title,
            TextColor3 = Color3.new(1, 1, 1),
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    }
    local v5 = {BackgroundTransparency = 1, ZIndex = 56}
    local icon = a1.icon
    v5.Image = (if typeof(icon) ~= "number" then if typeof(icon) ~= "string" then nil else icon else ("rbxassetid://%*"):format(icon)) or "rbxassetid://5577896808"
    v5.Size = UDim2.fromOffset(55, 55)
    v4.imageLabel = createElement("ImageLabel", v5)
    return createElement("Frame", v3, v4)
end

local function SectionSplitter(a1) -- Line: 132 -- upvalues: createElement (val) -- types: a1: table
    return createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = a1.layoutOrder,
        Size = UDim2.new(1, 0, 0, 30),
    }, {
        line = createElement("Frame", {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            ZIndex = 999,
            BackgroundColor3 = Color3.fromRGB(193, 193, 193),
            BorderColor3 = Color3.new(),
            Size = UDim2.fromOffset(100, 3),
        }, {uIFlexItem = createElement("UIFlexItem", {FlexMode = Enum.UIFlexMode.Fill})}),
        title = createElement("TextLabel", {
            BackgroundTransparency = 1,
            TextSize = 24,
            TextWrapped = true,
            ZIndex = 999,
            AnchorPoint = Vector2.new(0, 0.5),
            AutomaticSize = Enum.AutomaticSize.XY,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.new(0, 10, 0.5, 0),
            Text = a1.title,
            TextColor3 = Color3.fromRGB(255, 174, 34),
            TextXAlignment = Enum.TextXAlignment.Left,
        }, {
            uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 3), PaddingRight = UDim.new(0, 15)}),
        }),
        uIListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 20), PaddingRight = UDim.new(0, 20)}),
    })
end

local function getAbilityIcon(a1, a2) -- Line: 187 -- upvalues: TowerAbilityIcons (val) -- types: a1: table
    local v1
    local towerStats = a1.towerStats
    local v2 = towerStats and towerStats.Abilities or {}
    local v3 = nil
    local v4 = nil
    local v5, v6 = a2, a1
    for i, j in v2, v3, v4 do
        if j.Name ~= v5.Header and j.DisplayName ~= v5.Header then
            continue
        end
        v1 = TowerAbilityIcons.getIcon(v6.towerAsset, v6.towerSkin, j)
        if v1 ~= nil then
            if typeof(v1) == "number" then
                return (("rbxassetid://%*"):format(v1))
            end
            if typeof(v1) == "string" then
                return v1
            end
            return nil
        end
    end
    local Icon = v5.Icon
    if typeof(Icon) == "number" then
        return (("rbxassetid://%*"):format(Icon))
    end
    if typeof(Icon) == "string" then
        return Icon
    end
    return nil
end

local function getOptionIcon(a1, a2) -- Line: 203
    local Icon
    local v1 = if typeof(a2) ~= "number" then if typeof(a2) ~= "string" then nil else a2 else ("rbxassetid://%*"):format(a2)
    if v1 and string.find(v1, "rbxasset", 1, true) == 1 then
        return v1
    end
    local v2 = nil
    local v3 = nil
    for i, j in a1 or {}, v2, v3 do
        for k, n in j.Values or {} do
            if n.Name ~= v4 and n.Value ~= v4 then
                continue
            end
            Icon = n.Icon
            if typeof(Icon) == "number" then
                return (("rbxassetid://%*"):format(Icon))
            end
            if typeof(Icon) == "string" then
                return Icon
            end
            return nil
        end
    end
    return nil
end

local function substituteTowerStats(a1, a2) -- Line: 220 -- types: a1: string
    return string.gsub(a1, "%${(.-)}", function(a1) -- Line: 221 -- upvalues: a2 (val)
        local Attributes = a2 and a2.Attributes
        for i, j in string.split(a1, ".") do
            if type(Attributes) == "table" and Attributes[j] ~= nil then
                Attributes = Attributes[j]
                continue
            end
            return ""
        end
        if Attributes ~= nil then
            return (tostring(Attributes))
        end
        return ""
    end)
end

local function getText(a1) -- Line: 235
    if typeof(a1) == "string" then
        return (string.lower(a1))
    end
    return ""
end

local function isSummonedUnitAbility(a1) -- Line: 239
    local Header = a1.Header
    local v1 = if typeof(Header) ~= "string" then "" else string.lower(Header)
    local Description = a1.Description
    local v2 = if typeof(Description) ~= "string" then "" else string.lower(Description)
    if string.find(v1, "unit", 1, true) == nil
        and string.find(v2, "summon", 1, true) == nil
        and string.find(v2, "spawn", 1, true) == nil then
        local Text
        local Content = a1.Content or {}
        local v3 = nil
        local v4 = nil
        for i, j in Content, v3, v4 do
            Text = j.Text
            if string.find(if typeof(Text) ~= "string" then "" else string.lower(Text), "spawn time", 1, true) ~= nil then
                return true
            end
        end
        return false
    end
    return true
end

local function addAbilityRows(a1, a2, a3, a4, a5, a6, a7) -- Line: 261
    -- upvalues: createElement (val), SectionSplitter (val), LongStatComponent (val), getAbilityIcon (val)
    local ability, v1
    if #a3 == 0 then
        return a4
    end
    local v2 = a4 + 1
    a1[a5] = (createElement(SectionSplitter, {layoutOrder = v2, title = a7}))
    for i, j in a3 do
        ability = j.ability
        v2 = v2 + 1
        v1 = ("%*%*"):format(a6, j.index)
        a1[v1] = (createElement(LongStatComponent, {
            content = ability.Content,
            description = ability.Description,
            icon = getAbilityIcon(a2, ability),
            layoutOrder = v2,
            title = ability.Header or "Ability",
        }))
    end
    return v2
end

local function createRows(a1) -- Line: 296
    -- upvalues: isSummonedUnitAbility (val), addAbilityRows (val), createElement (val), SectionSplitter (val)
    -- upvalues: LongStatComponent (val), getOptionIcon (val)
    local v1
    local v2 = {}
    local v3 = 0
    local plotData = a1.plotData or {}
    local v4 = plotData["Tower Ability"]
    local v5 = plotData["Tower Options"]
    if v4 and #v4 > 0 then
        local v6
        local v7 = {}
        v1 = {}
        for i, j in v4 do
            v6 = {ability = j, index = i}
            if not isSummonedUnitAbility(j) then
                table.insert(v7, v6)
            else
                table.insert(v1, v6)
            end
        end
        v3 = addAbilityRows(v2, a1, v7, v3, "abilitiesSection", "ability", "• Abilities")
        v3 = addAbilityRows(v2, a1, v1, v3, "summonedUnitsSection", "summonedUnit", "• Summoned Units")
    end
    if v5 and #v5 > 0 then
        local Header_2, v8, v9, v10, v11, v12
        v3 = v3 + 1
        v2.towerOptionsSection = createElement(SectionSplitter, {title = "• Support Tower Options", layoutOrder = v3})
        v1 = nil
        local v13 = nil
        for k, n in v5, v1, v13 do
            v8 = {}
            for m, i5 in n.Content or {} do
                v11 = {}
                v12 = i5.Text or ""
                local towerStats = v14.towerStats
                v11.Text = string.gsub(v12, "%${(.-)}", function(a1) -- Line: 221 -- upvalues: towerStats (val)
                    local Attributes = towerStats and towerStats.Attributes
                    for i, j in string.split(a1, ".") do
                        if type(Attributes) == "table" and Attributes[j] ~= nil then
                            Attributes = Attributes[j]
                            continue
                        end
                        return ""
                    end
                    if Attributes ~= nil then
                        return (tostring(Attributes))
                    end
                    return ""
                end)
                v8[m] = v11
            end
            v3 = v3 + 1
            v9 = ("towerOption%*"):format(k)
            v10 = {
                content = v8,
                icon = getOptionIcon(v14.upgradeOptions, n.Icon),
                layoutOrder = v3,
            }
            Header_2 = if not n.Color then n.Header else ("<font color=\"%*\">%*</font>"):format(n.Color, n.Header)
            v10.title = Header_2
            v2[v9] = (createElement(LongStatComponent, v10))
        end
    end
    return v2
end

return React.memo(function(a1) -- Line: 369 -- upvalues: createRows (val), createElement (val) -- types: a1: table
    local v1 = createRows(a1)
    local v2 = next(v1) ~= nil
    return createElement("Frame", {
        BackgroundTransparency = 0.2,
        ZIndex = 12,
        BackgroundColor3 = Color3.new(),
        Position = UDim2.fromScale(0.451907, 0.0642241),
        Size = UDim2.fromOffset(481, 517),
    }, {
        uICorner = createElement("UICorner"),
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.new(1, 1, 1)}, {
            uIGradient = createElement("UIGradient", {
                Rotation = 90,
                Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
            }),
        }),
        emptyState = not v2 and createElement("Frame", {BackgroundTransparency = 1, ZIndex = 25, Size = UDim2.fromScale(1, 1)}, {
            thinking = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                Image = "rbxassetid://85032210421620",
                ImageTransparency = 0.9,
                ZIndex = 26,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.43),
                ScaleType = Enum.ScaleType.Fit,
                Size = UDim2.fromScale(0.6, 0.6),
            }),
            message = createElement("TextLabel", {
                BackgroundTransparency = 1,
                Text = "No Other Stats to show!",
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 26,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Font = Enum.Font.GothamMedium,
                Position = UDim2.fromScale(0.5, 0.77),
                Size = UDim2.fromScale(0.9, 0.07),
                TextColor3 = Color3.new(1, 1, 1),
            }),
        }),
        scrollingFrame = v2 and createElement("ScrollingFrame", {
            Active = true,
            BackgroundTransparency = 1,
            BottomImage = "",
            MidImage = "rbxassetid://95591733073455",
            ScrollBarImageTransparency = 0.2,
            ScrollBarThickness = 4,
            BorderSizePixel = 0,
            TopImage = "",
            ZIndex = 25,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            Size = UDim2.fromScale(1, 1),
            VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar,
        }, {
            uIListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 20), SortOrder = Enum.SortOrder.LayoutOrder}),
        }, v1),
        uIPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 15),
            PaddingLeft = UDim.new(0, 15),
            PaddingRight = UDim.new(0, 15),
            PaddingTop = UDim.new(0, 15),
        }),
    })
end)