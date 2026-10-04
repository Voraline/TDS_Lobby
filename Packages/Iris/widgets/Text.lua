-- Script path: ReplicatedStorage.Packages.Iris.widgets.Text
-- Decompile time: 1.70 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("Text", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1, Wrapped = 2, Color = 3, RichText = 4},
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 15
                return a1.Instance
            end),
        },
        Generate = function(a1) -- Line: 19 -- upvalues: a2 (val)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "Iris_Text"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.LayoutOrder = a1.ZIndex
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            a2.applyTextStyle(TextLabel)
            a2.UIPadding(TextLabel, Vector2.new(0, 2))
            return TextLabel
        end,
        Update = function(a1_2) -- Line: 33 -- upvalues: a1 (val)
            local Instance = a1_2.Instance
            if a1_2.arguments.Text == nil then
                error("Text argument is required for Iris.Text().", 5)
            end
            if a1_2.arguments.Wrapped == nil then
                Instance.TextWrapped = a1._config.TextWrapped
            else
                Instance.TextWrapped = a1_2.arguments.Wrapped
            end
            if not a1_2.arguments.Color then
                Instance.TextColor3 = a1._config.TextColor
            else
                Instance.TextColor3 = a1_2.arguments.Color
            end
            if a1_2.arguments.RichText == nil then
                Instance.RichText = a1._config.RichText
            else
                Instance.RichText = a1_2.arguments.RichText
            end
            Instance.Text = a1_2.arguments.Text
        end,
        Discard = function(a1) -- Line: 56
            a1.Instance:Destroy()
        end,
    })
    a1.WidgetConstructor("SeparatorText", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1},
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 69
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 73 -- upvalues: a2 (val), a1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_SeparatorText"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.ClipsDescendants = true
            a2.UIPadding(Frame, Vector2.new(0, a1._config.SeparatorTextPadding.Y))
            a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemSpacing.X))
            Frame.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.LayoutOrder = 1
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Left"
            Frame_2.AnchorPoint = Vector2.new(1, 0.5)
            Frame_2.BackgroundColor3 = a1._config.SeparatorColor
            Frame_2.BackgroundTransparency = a1._config.SeparatorTransparency
            Frame_2.BorderSizePixel = 0
            Frame_2.Size = UDim2.fromOffset(a1._config.SeparatorTextPadding.X - a1._config.ItemSpacing.X, a1._config.SeparatorTextBorderSize)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Right"
            Frame_3.AnchorPoint = Vector2.new(1, 0.5)
            Frame_3.BackgroundColor3 = a1._config.SeparatorColor
            Frame_3.BackgroundTransparency = a1._config.SeparatorTransparency
            Frame_3.BorderSizePixel = 0
            Frame_3.Size = UDim2.new(1, 0, 0, a1._config.SeparatorTextBorderSize)
            Frame_3.LayoutOrder = 2
            Frame_3.Parent = Frame
            return Frame
        end,
        Update = function(a1) -- Line: 122
            local TextLabel = a1.Instance.TextLabel
            if a1.arguments.Text == nil then
                error("Text argument is required for Iris.SeparatorText().", 5)
            end
            TextLabel.Text = a1.arguments.Text
        end,
        Discard = function(a1) -- Line: 130
            a1.Instance:Destroy()
        end,
    })
end