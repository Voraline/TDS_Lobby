-- Script path: ReplicatedStorage.Packages.Iris.widgets.Tree
-- Decompile time: 4.47 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local v1 = {
        hasState = true,
        hasChildren = true,
        Events = {
            collapsed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 10 -- upvalues: a1 (val)
                    return a1_2.lastCollapsedTick == a1._cycleTick
                end,
            },
            uncollapsed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 16 -- upvalues: a1 (val)
                    return a1_2.lastUncollapsedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 20
                return a1.Instance
            end),
        },
        Discard = function(a1) -- Line: 24 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        ChildAdded = function(a1, a2) -- Line: 28
            local ChildContainer = a1.ChildContainer
            ChildContainer.Visible = a1.state.isUncollapsed.value
            return ChildContainer
        end,
        UpdateState = function(a1_2) -- Line: 35 -- upvalues: a2 (val), a1 (val)
            local value = a1_2.state.isUncollapsed.value
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            local Arrow = Instance.Header.Button.Arrow
            local DOWN_POINTING_TRIANGLE = value and a2.ICONS.DOWN_POINTING_TRIANGLE or a2.ICONS.RIGHT_POINTING_TRIANGLE
            Arrow.Image = DOWN_POINTING_TRIANGLE
            if not value then
                a1_2.lastCollapsedTick = a1._cycleTick + 1
            else
                a1_2.lastUncollapsedTick = a1._cycleTick + 1
            end
            ChildContainer.Visible = value
        end,
        GenerateState = function(a1_2) -- Line: 52 -- upvalues: a1 (val)
            if a1_2.state.isUncollapsed == nil then
                a1_2.state.isUncollapsed = a1._widgetState(a1_2, "isUncollapsed", false)
            end
        end,
    }
    a1.WidgetConstructor("Tree", a2.extend(v1, {
        Args = {Text = 1, SpanAvailWidth = 2, NoIndent = 3},
        Generate = function(a1_2) -- Line: 68 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Tree"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "TreeContainer"
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            Frame_2.LayoutOrder = 1
            Frame_2.Visible = false
            a2.UIListLayout(Frame_2, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            local v1 = a2.UIPadding(Frame_2, Vector2.zero)
            v1.PaddingTop = UDim.new(0, a1._config.ItemSpacing.Y)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Header"
            Frame_3.Size = UDim2.fromScale(1, 0)
            Frame_3.AutomaticSize = Enum.AutomaticSize.Y
            Frame_3.BackgroundTransparency = 1
            Frame_3.BorderSizePixel = 0
            Frame_3.Parent = Frame
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Button"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            a2.applyInteractionHighlights("Background", TextButton, Frame_3, {
                Transparency = 1,
                Color = Color3.fromRGB(0, 0, 0),
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderActiveColor,
                ActiveTransparency = a1._config.HeaderActiveTransparency,
            })
            local v2 = a2.UIPadding(TextButton, Vector2.zero)
            v2.PaddingLeft = UDim.new(0, a1._config.FramePadding.X)
            local v3 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.FramePadding.X))
            v3.VerticalAlignment = Enum.VerticalAlignment.Center
            TextButton.Parent = Frame_3
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Arrow"
            ImageLabel.Size = UDim2.fromOffset(a1._config.TextSize, (math.floor(a1._config.TextSize * 0.7)))
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.TextColor
            ImageLabel.ImageTransparency = a1._config.TextTransparency
            ImageLabel.ScaleType = Enum.ScaleType.Fit
            ImageLabel.Parent = TextButton
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            local v4 = a2.UIPadding(TextLabel, Vector2.zero)
            v4.PaddingRight = UDim.new(0, 21)
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            a2.applyButtonClick(TextButton, function() -- Line: 150 -- upvalues: a1_2 (val)
                a1_2.state.isUncollapsed:set(not a1_2.state.isUncollapsed.value)
            end)
            a1_2.ChildContainer = Frame_2
            return Frame
        end,
        Update = function(a1_2) -- Line: 157 -- upvalues: a1 (val)
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            local Button = Instance.Header.Button
            local TextLabel = Button.TextLabel
            local UIPadding = ChildContainer.UIPadding
            TextLabel.Text = a1_2.arguments.Text or "Tree"
            if not a1_2.arguments.SpanAvailWidth then
                Button.AutomaticSize = Enum.AutomaticSize.XY
                Button.Size = UDim2.fromScale(0, 0)
            else
                Button.AutomaticSize = Enum.AutomaticSize.Y
                Button.Size = UDim2.fromScale(1, 0)
            end
            if a1_2.arguments.NoIndent then
                UIPadding.PaddingLeft = UDim.new(0, 0)
                return
            end
            UIPadding.PaddingLeft = UDim.new(0, a1._config.IndentSpacing)
        end,
    }))
    a1.WidgetConstructor("CollapsingHeader", a2.extend(v1, {
        Args = {Text = 1},
        Generate = function(a1_2) -- Line: 190 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_CollapsingHeader"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "CollapsingHeaderContainer"
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            Frame_2.LayoutOrder = 1
            Frame_2.Visible = false
            a2.UIListLayout(Frame_2, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            local v1 = a2.UIPadding(Frame_2, Vector2.zero)
            v1.PaddingTop = UDim.new(0, a1._config.ItemSpacing.Y)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Header"
            Frame_3.Size = UDim2.fromScale(1, 0)
            Frame_3.AutomaticSize = Enum.AutomaticSize.Y
            Frame_3.BackgroundTransparency = 1
            Frame_3.BorderSizePixel = 0
            Frame_3.Parent = Frame
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Button"
            TextButton.Size = UDim2.new(1, 0, 0, 0)
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.BackgroundColor3 = a1._config.HeaderColor
            TextButton.BackgroundTransparency = a1._config.HeaderTransparency
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            TextButton.ClipsDescendants = true
            a2.UIPadding(TextButton, a1._config.FramePadding)
            a2.applyFrameStyle(TextButton, true)
            local v2 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, 2 * a1._config.FramePadding.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyInteractionHighlights("Background", TextButton, TextButton, {
                Color = a1._config.HeaderColor,
                Transparency = a1._config.HeaderTransparency,
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderActiveColor,
                ActiveTransparency = a1._config.HeaderActiveTransparency,
            })
            TextButton.Parent = Frame_3
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Arrow"
            ImageLabel.Size = UDim2.fromOffset(a1._config.TextSize, (math.ceil(a1._config.TextSize * 0.8)))
            ImageLabel.AutomaticSize = Enum.AutomaticSize.Y
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.TextColor
            ImageLabel.ImageTransparency = a1._config.TextTransparency
            ImageLabel.ScaleType = Enum.ScaleType.Fit
            ImageLabel.Parent = TextButton
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            local v3 = a2.UIPadding(TextLabel, Vector2.zero)
            v3.PaddingRight = UDim.new(0, 21)
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            a2.applyButtonClick(TextButton, function() -- Line: 277 -- upvalues: a1_2 (val)
                a1_2.state.isUncollapsed:set(not a1_2.state.isUncollapsed.value)
            end)
            a1_2.ChildContainer = Frame_2
            return Frame
        end,
        Update = function(a1) -- Line: 284
            a1.Instance.Header.Button.TextLabel.Text = a1.arguments.Text or "Collapsing Header"
        end,
    }))
end