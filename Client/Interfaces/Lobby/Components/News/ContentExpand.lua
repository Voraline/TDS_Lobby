-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ContentExpand
-- Decompile time: 9.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local Change = React.Change
local Event = React.Event
local createElement = React.createElement
local useEffect = React.useEffect
local useState = React.useState
local u36 = Color3.fromRGB(247, 250, 252)
local u41 = Font.new("rbxasset://fonts/families/Montserrat.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal)

local function stripRichText(a1) -- Line: 47 -- types: a1: string
    return string.gsub(a1, "<[^>]->", "")
end

local function stripLeadingBullet(a1) -- Line: 51 -- types: a1: string
    return string.gsub(a1, "^%s*•%s*", "", 1)
end

local function getEntryText(a1) -- Line: 55 -- upvalues: stripLeadingBullet (val)
    return stripLeadingBullet((tostring((if typeof(a1) ~= "table" then a1 else a1.Text or a1.text) or "")))
end

local function getEntryProps(a1) -- Line: 62
    if typeof(a1) == "table" then
        return a1
    end
    return {}
end

local function getContentEntries(a1) -- Line: 66
    local Content = a1.Content or a1.Lines or a1.Items or a1.Text or {}
    if typeof(Content) == "string" then
        return {Content}
    end
    return Content
end

local function measureTextHeight(a1, a2, a3, a4) -- Line: 75
    -- upvalues: u41 (val), TextService (val)
    local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
    GetTextBoundsParams.Font = u41
    GetTextBoundsParams.Size = a3
    GetTextBoundsParams.Text = string.gsub(a1, "<[^>]->", "")
    GetTextBoundsParams.Width = math.max(1, a2)
    local success, result = pcall(function() -- Line: 87 -- upvalues: TextService (upval), GetTextBoundsParams (val)
        return TextService:GetTextBoundsAsync(GetTextBoundsParams)
    end)
    GetTextBoundsParams:Destroy()
    if not success then
        return 16
    end
    local v1 = math.ceil(result.Y)
    if a4 then
        v1 = math.ceil(v1 * a4)
    end
    return (math.max(16, v1))
end

local function getEntryTextSize(a1) -- Line: 105
    if typeof(a1.TextSize) == "number" then
        return a1.TextSize
    end
    return 16
end

local function getEntryStyleKey(a1) -- Line: 109 -- upvalues: u36 (val)
    return table.concat({
        tostring(a1.FontWeight or "SemiBold"),
        tostring(a1.RichText ~= false),
        tostring(if typeof(a1.TextSize) ~= "number" then 16 else a1.TextSize),
        tostring(a1.TextColor3 or u36),
        tostring(a1.TextXAlignment or Enum.TextXAlignment.Left),
        (tostring(a1.TextYAlignment or Enum.TextYAlignment.Top)),
    }, "|")
end

local function getBatchText(a1) -- Line: 120 -- types: a1: table
    return table.concat(a1.TextRows, "\n")
end

local function canAppendToTextBatch(a1, a2, a3) -- Line: 124 -- types: a1: table?, a2: string, a3: string
    if not a1 or a1.StyleKey ~= a2 or #a1.TextRows >= 40 then
        return false
    end
    return a1.TextLength + 1 + #a3 <= 8000
end

local function getTextBatches(a1) -- Line: 139 -- upvalues: getEntryStyleKey (val)
    local v1, v2, v3, v4, v5
    local u130 = {}
    local u59 = nil

    local function flushTextBatch() -- Line: 143 -- upvalues: u59 (ref), u130 (val)
        if not u59 then
            return
        end
        table.insert(u130, u59)
        u59 = nil
    end

    local v6 = nil
    local v7 = nil
    for i, j in a1, v6, v7 do
        v5 = if typeof(j) ~= "table" then {} else j
        v1 = string.gsub(tostring((if typeof(j) ~= "table" then j else j.Text or j.text) or ""), "^%s*•%s*", "", 1)
        if typeof(v5.Height) ~= "number" then
            v2 = getEntryStyleKey(v5)
            v4 = u59
            if not (if not v4 or v4.StyleKey ~= v2 then false else if not (#v4.TextRows >= 40) then v4.TextLength + 1 + #v1 <= 8000 else false) then
                if u59 then
                    table.insert(u130, u59)
                end
                u59 = {
                    TextLength = 0,
                    LayoutOrder = i,
                    Props = v5,
                    StyleKey = v2,
                    TextRows = {},
                }
            end
            v3 = u59
            table.insert(v3.TextRows, v1)
            if v3.TextLength ~= 0 then
                v3.TextLength = v3.TextLength + (#v1 + 1)
            else
                v3.TextLength = #v1
            end
        else
            if u59 then
                table.insert(u130, u59)
                u59 = nil
            end
            table.insert(u130, {
                Height = v5.Height,
                LayoutOrder = i,
                Props = v5,
                StyleKey = ("height-%*"):format(i),
                TextLength = #v1,
                TextRows = {v1},
            })
        end
    end
    if u59 then
        table.insert(u130, u59)
    end
    return u130
end

local function getBatchHeight(a1, a2) -- Line: 196 -- upvalues: measureTextHeight (val) -- types: a1: table, a2: number
    if typeof(a1.Height) == "number" then
        return a1.Height
    end
    local v1 = if not (#a1.TextRows > 1) then nil else 1.2
    local v2 = table.concat(a1.TextRows, "\n")
    local Props = a1.Props
    return (measureTextHeight(v2, a2, if typeof(Props.TextSize) ~= "number" then 16 else Props.TextSize, v1))
end

local function getListHeight(a1, a2) -- Line: 205 -- upvalues: measureTextHeight (val) -- types: a2: number
    local Height_2, Props, v1, v2
    local v3 = {}
    local v4 = 34
    local v5 = math.max(1, a2 * 0.94)
    local v6 = nil
    local v7 = nil
    for i, j in a1, v6, v7 do
        if typeof(j.Height) ~= "number" then
            v1 = if not (#j.TextRows > 1) then nil else 1.2
            v2 = table.concat(j.TextRows, "\n")
            Props = j.Props
            Height_2 = measureTextHeight(v2, v5, if typeof(Props.TextSize) ~= "number" then 16 else Props.TextSize, v1)
        else
            Height_2 = j.Height
        end
        v3[i] = Height_2
        v4 = v4 + Height_2
        if i < #a1 then
            v4 = v4 + 8
        end
    end
    return v4, v3
end

return function(a1) -- Line: 223
    -- upvalues: useState (val), useEffect (val), getContentEntries (val), getTextBatches (val), getListHeight (val)
    -- upvalues: useTransparencyModifier (val), createElement (val), TextLabel (val), u36 (val), Change (val)
    -- upvalues: Event (val), React (val)
    local Props, TextColor3, TextXAlignment, TextYAlignment, v1, v2, v3
    local v4, u552 = useState(a1.KeepExpanded or a1.DefaultExpanded or a1.Expanded == true)
    local u561, u571 = useState(360)
    local v5 = useEffect
    local v6 = {a1.Expanded}
    v5(function() -- Line: 228 -- upvalues: a1 (val), u552 (val)
        if a1.Expanded ~= nil then
            u552(a1.Expanded == true)
        end
    end, v6)
    local u578 = a1.KeepExpanded or v4
    local v7 = getContentEntries(a1)
    local Title = a1.Title or (if typeof(a1.Text) ~= "string" then "Changes" else a1.Text)
    local v8 = 0
    local v9 = {}
    if u578 then
        local v10, v11 = getListHeight(getTextBatches(v7), u561)
        v8 = v10
        v9 = v11
    end
    local v12 = useTransparencyModifier(a1.Transparency)
    local v13 = {}
    local v14 = {}
    local v15 = nil
    local v16 = nil
    for i, j in v14, v15, v16 do
        v1 = table.concat(j.TextRows, "\n")
        Props = j.Props
        v2 = tostring(i)
        v3 = {
            BackgroundTransparency = 1,
            TextScaled = false,
            TextWrapped = true,
            FontWeight = Props.FontWeight or "SemiBold",
            LayoutOrder = j.LayoutOrder,
            LineHeight = if not (#j.TextRows > 1) then nil else 1.2,
            RichText = Props.RichText ~= false,
            Size = UDim2.new(0.94, 0, 0, v9[i]),
            Text = v1,
        }
        TextColor3 = Props.TextColor3 or u36
        v3.TextColor3 = TextColor3
        v3.TextSize = if typeof(Props.TextSize) ~= "number" then 16 else Props.TextSize
        TextXAlignment = Props.TextXAlignment or Enum.TextXAlignment.Left
        v3.TextXAlignment = TextXAlignment
        TextYAlignment = Props.TextYAlignment or Enum.TextYAlignment.Top
        v3.TextYAlignment = TextYAlignment
        v3.Transparency = a1.Transparency
        v13[v2] = (createElement(TextLabel, v3))
    end
    v16 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = a1.LayoutOrder,
        Size = UDim2.new(1, 0, 0, if not u578 then 28 else v8 + 10),
    }

    v16[Change.AbsoluteSize] = function(a1) -- Line: 279 -- upvalues: u561 (val), u571 (val)
        local v1 = math.floor(a1.AbsoluteSize.X)
        if v1 > 0 and v1 ~= u561 then
            u571(v1)
        end
    end

    local v17 = {}
    local v18 = {
        Active = not a1.KeepExpanded,
        AnchorPoint = Vector2.new(0.5, 0),
        AutoButtonColor = false,
        BackgroundTransparency = 1,
        LayoutOrder = a1.LayoutOrder,
        Position = UDim2.fromScale(0.5, 0),
        Selectable = not a1.KeepExpanded,
        Size = UDim2.new(1, 0, 0, 28),
        Text = "",
        ZIndex = 0,
    }

    v18[Event.Activated] = function() -- Line: 297 -- upvalues: a1 (val), u578 (val), u552 (val)
        if a1.KeepExpanded then
            return
        end
        local v1 = not u578
        u552(v1)
        if a1.OnExpandedChanged then
            a1.OnExpandedChanged(v1)
        end
    end

    v2 = {}
    v3 = {BorderSizePixel = 0}
    v3.AnchorPoint = Vector2.new(0.5, 0.5)
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BackgroundTransparency = v12(0)
    v3.Position = UDim2.fromScale(0.5, 0.5)
    v3.Size = UDim2.fromScale(1, 1)
    local v19 = {}
    local v20 = {Rotation = 90}
    local GradientColor = a1.GradientColor or ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 170, 0)),
        ColorSequenceKeypoint.new(0.3, Color3.fromRGB(255, 170, 0)),
        (ColorSequenceKeypoint.new(1, Color3.fromRGB(186, 124, 0))),
    })
    v20.Color = GradientColor
    v19.uiGradient = createElement("UIGradient", v20)
    v19.uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 5)})
    v19.expandIcon = not a1.KeepExpanded and createElement("ImageLabel", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(1, 0.5),
        Image = if not u578 then "rbxassetid://136808285389414" else "rbxassetid://89267092672390",
        ImageTransparency = v12(0),
        Position = UDim2.fromScale(0.96, 0.52),
        Size = UDim2.fromOffset(15, 8),
    })
    v19.titleLabel = createElement(TextLabel, {
        StrokeThickness = 2,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        FontWeight = a1.TitleFontWeight or "SemiBold",
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.94, 0.75),
        Text = Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        Transparency = a1.Transparency,
    }, {
        textSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = a1.TitleMaxTextSize or 24}),
    })
    v2.buttonContainer = createElement("Frame", v3, v19)
    v17.expandButton = createElement("TextButton", v18, v2)
    v18 = {
        BorderSizePixel = 0,
        ClipsDescendants = true,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0),
    }
    local ContentBackgroundColor3 = a1.ContentBackgroundColor3 or Color3.fromRGB(0, 0, 0)
    v18.BackgroundColor3 = ContentBackgroundColor3
    v18.BackgroundTransparency = v12(a1.ContentBackgroundTransparency or 0.5)
    v18.Position = UDim2.new(0.5, 0, 0, 10)
    v18.Size = UDim2.new(1, 0, 0, if not u578 then 0 else v8)
    v17.expandContainer = createElement("Frame", v18, {
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 5)}),
        uiListLayout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
        uiPadding = createElement("UIPadding", {
            PaddingBottom = UDim.new(0, if not u578 then 0 else 7),
            PaddingTop = UDim.new(0, if not u578 then 0 else 27),
        }),
        expandList = createElement(React.Fragment, {}, if not u578 then nil else v13),
    })
    return createElement("Frame", v16, v17)
end