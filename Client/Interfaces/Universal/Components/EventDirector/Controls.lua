-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.Controls
-- Decompile time: 11.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local Components = ReplicatedStorage.Client.Interfaces.Components
local ActionButton = require(Components.ActionButton)
local Dropdown = require(Components.Dropdown)
local TextBox = require(Components.TextBox)
local TextLabel = require(Components.TextLabel)
local Theme = require(script.Parent.Theme)
local createElement = React.createElement
local u31 = {}

function u31.Text(a1) -- Line: 15 -- upvalues: createElement (val), TextLabel (val), Theme (val) -- types: a1: table
    local v1 = {
        TextScaled = false,
        TextWrapped = true,
        AnchorPoint = Vector2.zero,
        Position = UDim2.new(),
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.order,
        Size = UDim2.fromScale(1, 0),
    }
    local strongFont = if not a1.strong then Theme.font else Theme.strongFont
    v1.FontFace = strongFont
    v1.Text = a1.text
    local color = a1.color or Theme.text
    v1.TextColor3 = color
    v1.TextSize = a1.size or 16
    v1.TextXAlignment = Enum.TextXAlignment.Left
    v1.TextYAlignment = Enum.TextYAlignment.Top
    return createElement(TextLabel, v1)
end

function u31.Button(a1) -- Line: 39
    -- upvalues: createElement (val), ActionButton (val), Theme (val)
    local v1 = not a1.primary and not a1.selected and not a1.danger
    local v2 = {
        TextSize = 16,
        TextSizeIsScaled = true,
        AnchorPoint = Vector2.zero,
        Position = UDim2.new(),
        Label = a1.text,
        OnActivated = a1.onActivated,
        Disabled = a1.disabled,
        Variant = if not a1.danger then "primary" else "danger",
        BackgroundColor3 = if not v1 then nil else Theme.raised,
        StrokeColor = if not v1 then nil else Theme.outline,
        LayoutOrder = a1.order,
    }
    local v3 = if not a1.width then UDim2.new(1, 0, 0, 48) else UDim2.fromOffset(a1.width, 48)
    v2.Size = v3
    return createElement(ActionButton, v2)
end

function u31.Input(a1) -- Line: 66
    -- upvalues: createElement (val), u31 (val), Theme (val), TextBox (val)
    local v1 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.order,
        Size = UDim2.fromScale(1, 0),
    }
    local v2 = {
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}),
        Label = createElement(u31.Text, {order = 1, text = a1.label, color = Theme.muted}),
    }
    local v3 = {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        CornerRadius = 4,
        LayoutOrder = 2,
        TextSize = 16,
        TextScaled = false,
        StrokeThickness = 1,
        AnchorPoint = Vector2.zero,
        Position = UDim2.new(),
        BackgroundColor3 = Theme.background,
        Size = UDim2.new(1, 0, 0, 48),
        FontFace = Theme.font,
        Text = a1.value,
    }
    local muted = if not a1.disabled then Theme.text else Theme.muted
    v3.TextColor3 = muted
    v3.TextEditable = a1.disabled ~= true
    v3.Selectable = a1.disabled ~= true
    v3.TextTruncate = Enum.TextTruncate.AtEnd
    v3.TextXAlignment = Enum.TextXAlignment.Left
    local warning = if not a1.error then Theme.outline else Theme.warning
    v3.StrokeColor = warning
    v3.StrokeMode = Enum.ApplyStrokeMode.Border

    function v3.OnTextChanged(a1_2) -- Line: 110 -- upvalues: a1 (val)
        if not a1.disabled and a1_2.Text ~= a1.value then
            a1.onChanged(a1_2.Text)
        end
    end

    v2.Input = createElement(TextBox, v3, {
        Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12)}),
    })
    local error = a1.error and createElement(u31.Text, {order = 3, text = a1.error, color = Theme.warning})
    v2.Error = error
    return createElement("Frame", v1, v2)
end

function u31.Select(a1) -- Line: 129
    -- upvalues: React (val), createElement (val), u31 (val), Theme (val), TextBox (val), Dropdown (val)
    local v1
    local u324, u330 = React.useState(false)
    local u333, u339 = React.useState("")
    local v2 = #a1.options > 8
    local value = a1.value
    local v3 = nil
    for i, j in a1.options, v3 do
        if j.id == a1.value then
            value = j.label
            break
        end
    end
    local options_2 = a1.options
    if v2 and u333 ~= "" then
        v3 = string.lower(u333)
        for k, n in a1.options do
            if string.find(string.lower(n.label), v3, 1, true) then
                table.insert({}, n)
            end
        end
    end
    v3 = {}
    local v4 = nil
    local v5 = nil
    for m, i5 in options_2, v4, v5 do
        v1 = {
            Id = i5.id,
            Label = i5.label,
            LayoutOrder = m,
            Selected = i5.id == a1.value,
            Disabled = a1.disabled,
        }
        v3[m] = v1
    end
    local v6 = u324 and not a1.disabled
    v4 = #options_2 > 0

    local function closeSelect() -- Line: 174 -- upvalues: u330 (val), u339 (val)
        u330(false)
        u339("")
    end

    v1 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        LayoutOrder = a1.order,
        Size = UDim2.fromScale(1, 0),
    }
    local v7 = {
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}),
        Label = createElement(u31.Text, {order = 1, text = a1.label, color = Theme.muted}),
    }
    local Button = u31.Button
    local v8 = {order = 2, text = ("%*  %*"):format(value, if not u324 then "+" else "−")}
    local disabled = a1.disabled or #a1.options == 0
    v8.disabled = disabled

    function v8.onActivated() -- Line: 197 -- upvalues: u324 (val), u330 (val), u339 (val)
        if not u324 then
            u330(true)
            return
        end
        u330(false)
        u339("")
    end

    v7.Toggle = createElement(Button, v8)
    v7.Search = v6 and v2 and createElement(TextBox, {
        BackgroundTransparency = 0,
        BorderSizePixel = 0,
        ClearTextOnFocus = false,
        CornerRadius = 4,
        LayoutOrder = 3,
        PlaceholderText = "Search",
        TextSize = 16,
        TextScaled = false,
        StrokeThickness = 1,
        AnchorPoint = Vector2.zero,
        Position = UDim2.new(),
        BackgroundColor3 = Theme.background,
        Size = UDim2.new(1, 0, 0, 48),
        FontFace = Theme.font,
        Text = u333,
        TextColor3 = Theme.text,
        TextXAlignment = Enum.TextXAlignment.Left,
        StrokeColor = Theme.outline,
        StrokeMode = Enum.ApplyStrokeMode.Border,
        OnTextChanged = function(a1) -- Line: 225 -- upvalues: u333 (val), u339 (val)
            if a1.Text ~= u333 then
                u339(a1.Text)
            end
        end,
    }, {
        Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12), PaddingRight = UDim.new(0, 12)}),
    })
    v7.Options = v6 and v4 and createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 4,
        Size = UDim2.new(1, 0, 0, (math.min(#options_2 * 50 + 20, 220))),
    }, {
        Dropdown = createElement(Dropdown, {
            ItemHeight = 48,
            ItemPadding = 2,
            MaxHeight = 220,
            LabelTextSize = 16,
            AnchorPoint = Vector2.zero,
            Position = UDim2.new(),
            Items = v3,
            Size = UDim2.fromScale(1, 1),
            OnItemActivated = function(a1_2) -- Line: 250 -- upvalues: a1 (val), u330 (val), u339 (val)
                if not a1.disabled and a1_2.Id then
                    u330(false)
                    u339("")
                    a1.onChanged(a1_2.Id)
                end
            end,
        }),
    })
    v7.NoMatches = v6 and not v4 and createElement(u31.Text, {text = "No matching options", order = 4, color = Theme.muted})
    return createElement("Frame", v1, v7)
end

function u31.Scroll(a1) -- Line: 266 -- upvalues: createElement (val), Theme (val), React (val) -- types: a1: table
    local v1 = {
        BorderSizePixel = 0,
        ScrollBarThickness = 5,
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Theme.surface,
        CanvasSize = UDim2.new(),
        LayoutOrder = a1.order,
        Position = a1.position,
        ScrollBarImageColor3 = Theme.muted,
    }
    local size = a1.size or UDim2.fromScale(1, 1)
    v1.Size = size
    v1.ScrollingDirection = Enum.ScrollingDirection.Y
    return createElement("ScrollingFrame", v1, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0, 8)}),
        Padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 14),
            PaddingBottom = UDim.new(0, 14),
            PaddingLeft = UDim.new(0, 14),
            PaddingRight = UDim.new(0, 14),
        }),
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder}),
        Content = createElement(React.Fragment, {}, a1.children),
    })
end

return u31