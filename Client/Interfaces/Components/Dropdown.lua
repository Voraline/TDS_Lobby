-- Script path: ReplicatedStorage.Client.Interfaces.Components.Dropdown
-- Decompile time: 9.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local Event = React.Event

local function strokeThickness(a1) -- Line: 41 -- types: a1: number?
    if not a1 then
        return 0.02
    end
    if a1 > 1 then
        return a1 / 100
    end
    return a1
end

local function listHeight(a1, a2, a3) -- Line: 53 -- types: a1: number, a2: number, a3: number
    return a1 * a2 + math.max(a1 - 1, 0) * a3
end

local function withHeight(a1, a2) -- Line: 57 -- types: a1: Vector2, a2: number
    if a1.Y.Scale == 0 and a1.Y.Offset == 0 then
        return UDim2.new(a1.X.Scale, a1.X.Offset, 0, a2)
    end
    return a1
end

local function dropdownItem(a1, a2, a3, a4, a5, a6) -- Line: 65
    -- upvalues: createElement (val), Event (val)
    local u8 = a1.Disabled == true
    local v1 = if not u8 then Color3.fromRGB(255, 255, 255) else Color3.fromRGB(120, 120, 120)
    local v2 = {
        AutoButtonColor = not u8,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = a1.LayoutOrder or 1,
        Size = UDim2.new(1, 0, 0, a3),
        Text = "",
        ZIndex = a5 + 1,
    }

    v2[Event.Activated] = function() -- Line: 88 -- upvalues: u8 (val), a6 (val), a1 (val)
        if not u8 and a6 then
            a6(a1)
            return
        end
    end

    local v3 = {}
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0, 0.5),
        AutomaticSize = Enum.AutomaticSize.XY,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
    }
    local v5 = if not a2 then UDim2.fromScale(0, 0.5) else UDim2.new(0, 40, 0.5, 0)
    v4.Position = v5
    v4.Size = UDim2.fromScale(0, 0)
    v4.Text = a1.Label
    v4.TextColor3 = v1
    v4.TextSize = a4
    v4.TextTransparency = if not u8 then 0 else 0.25
    v4.TextXAlignment = Enum.TextXAlignment.Left
    v4.ZIndex = a5 + 1
    v3.OptionLabel = createElement("TextLabel", v4)
    v3.Checkbox = if not a2 then nil else createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(a3, a3),
        ZIndex = a5 + 1,
    }, {
        Corner = createElement("UICorner", {CornerRadius = UDim.new(0.176253214, 0)}),
        Stroke = createElement("UIStroke", {
            Thickness = 0.02,
            Color = Color3.fromRGB(51, 51, 51),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        Check = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Image = "rbxassetid://17275148743",
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(0.8, 0.8),
            Visible = a1.Selected == true,
            ZIndex = a5 + 2,
        }),
    })
    v3.Padding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12)})
    return createElement("TextButton", v2, v3)
end

return function(a1) -- Line: 149 -- upvalues: createElement (val), dropdownItem (val) -- types: a1: table
    local v1, v2
    local v3 = a1.ZIndex or 1
    local v4 = a1.ItemHeight or 30
    local v5 = a1.ItemPadding or 10
    local v6 = a1.LabelTextSize or 22
    local v7 = a1.MaxHeight or 240
    local v8 = a1.ScrollBarThickness or 4
    local v9 = a1.ShowCheckboxes == true
    local Size = a1.Size or UDim2.fromOffset(220, 0)
    local v10 = math.max(#a1.Items, 1)
    local v11 = v10 * v4 + math.max(v10 - 1, 0) * v5 + 20
    local v12 = math.min(v11, v7)
    local v13 = v12 < v11
    local v14 = {
        Layout = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, v5),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Top,
        }),
    }
    v14.Padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 12),
        PaddingRight = UDim.new(0, if not v13 then 12 else 8 + v8),
        PaddingTop = UDim.new(0, 10),
    })
    local v15 = {}
    local v16 = {}
    local CornerRadius = a1.CornerRadius or UDim.new(0, 4)
    v16.CornerRadius = CornerRadius
    v15.Corner = createElement("UICorner", v16)
    v16 = {}
    local StrokeColor = a1.StrokeColor or Color3.fromRGB(255, 255, 255)
    v16.Color = StrokeColor
    v16.StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize
    local v17 = a1.StrokeThickness or 0.02
    v16.Thickness = if v17 then if not (v17 > 1) then v17 else v17 / 100 else 0.02
    v16.Transparency = a1.StrokeTransparency or 0.800000012
    v15.Stroke = createElement("UIStroke", v16)
    if #a1.Items == 0 then
        v14.Empty = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.new(1, 0, 0, v4),
            Text = a1.EmptyText or "No options",
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextSize = math.max(v6 - 4, 10),
            TextXAlignment = Enum.TextXAlignment.Center,
            ZIndex = v3 + 1,
        })
    end
    local v18 = nil
    v16 = nil
    for i, j in a1.Items, v18, v16 do
        v2 = ("Item_%*"):format(j.Id or j.Label or i)
        v14[v2] = (dropdownItem(j, v9, v4, v6, v3, v1.OnItemActivated))
    end
    v15.Items = createElement("ScrollingFrame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        BottomImage = "",
        ClipsDescendants = true,
        MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png",
        TopImage = "",
        Active = v13,
        AutomaticCanvasSize = Enum.AutomaticSize.None,
        CanvasSize = UDim2.fromOffset(0, v11),
        ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        ScrollBarImageTransparency = if not v13 then 1 else 0.15,
        ScrollBarThickness = if not v13 then 0 else v8,
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollingEnabled = v13,
        Size = UDim2.fromScale(1, 1),
        ZIndex = v3 + 1,
    }, v14)
    v16 = {BorderSizePixel = 0}
    local AnchorPoint = v1.AnchorPoint or Vector2.new(0, 0)
    v16.AnchorPoint = AnchorPoint
    local BackgroundColor3 = v1.BackgroundColor3 or Color3.fromRGB(0, 0, 0)
    v16.BackgroundColor3 = BackgroundColor3
    v16.BackgroundTransparency = v1.BackgroundTransparency or 0.300000012
    local Position = v1.Position or UDim2.fromScale(0, 0)
    v16.Position = Position
    v16.Size = if Size.Y.Scale ~= 0 then Size else if Size.Y.Offset == 0 then UDim2.new(Size.X.Scale, Size.X.Offset, 0, v12) else Size
    v16.Visible = v1.Visible
    v16.ZIndex = v3
    return createElement("Frame", v16, v15)
end