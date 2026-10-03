-- Script path: ReplicatedStorage.Packages.Iris.widgets.RadioButton
-- Decompile time: 2.16 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("RadioButton", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, Index = 2},
        Events = {
            selected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 15 -- upvalues: a1 (val)
                    return a1_2.lastSelectedTick == a1._cycleTick
                end,
            },
            unselected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 21 -- upvalues: a1 (val)
                    return a1_2.lastUnselectedTick == a1._cycleTick
                end,
            },
            active = {
                Init = function(a1) end,
                Get = function(a1) -- Line: 27
                    return a1.state.index.value == a1.arguments.Index
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 31
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 35 -- upvalues: a2 (val), a1 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Iris_RadioButton"
            TextButton.AutomaticSize = Enum.AutomaticSize.XY
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.LayoutOrder = a1_2.ZIndex
            TextButton.AutoButtonColor = false
            TextButton.ZIndex = a1_2.ZIndex
            TextButton.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local v2 = a1._config.TextSize + 2 * (a1._config.FramePadding.Y - 1)
            local Frame = Instance.new("Frame")
            Frame.Name = "Button"
            Frame.Size = UDim2.fromOffset(v2, v2)
            Frame.Parent = TextButton
            Frame.BackgroundColor3 = a1._config.FrameBgColor
            Frame.BackgroundTransparency = a1._config.FrameBgTransparency
            a2.UICorner(Frame)
            a2.UIPadding(Frame, Vector2.new(math.max(1, (math.floor(v2 / 5))), (math.max(1, (math.floor(v2 / 5))))))
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Circle"
            Frame_2.Size = UDim2.fromScale(1, 1)
            Frame_2.Parent = Frame
            Frame_2.BackgroundColor3 = a1._config.CheckMarkColor
            Frame_2.BackgroundTransparency = a1._config.CheckMarkTransparency
            a2.UICorner(Frame_2)
            a2.applyInteractionHighlights("Background", TextButton, Frame, {
                Color = a1._config.FrameBgColor,
                Transparency = a1._config.FrameBgTransparency,
                HoveredColor = a1._config.FrameBgHoveredColor,
                HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                ActiveColor = a1._config.FrameBgActiveColor,
                ActiveTransparency = a1._config.FrameBgActiveTransparency,
            })
            a2.applyButtonClick(TextButton, function() -- Line: 79 -- upvalues: a1_2 (val)
                a1_2.state.index:set(a1_2.arguments.Index)
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.LayoutOrder = 1
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            return TextButton
        end,
        Update = function(a1_2) -- Line: 95 -- upvalues: a1 (val)
            a1_2.Instance.TextLabel.Text = a1_2.arguments.Text or "Radio Button"
            if a1_2.state then
                a1_2.state.index.lastChangeTick = a1._cycleTick
                a1._widgets[a1_2.type].UpdateState(a1_2)
            end
        end,
        Discard = function(a1) -- Line: 105 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        GenerateState = function(a1_2) -- Line: 109 -- upvalues: a1 (val)
            if a1_2.state.index == nil then
                a1_2.state.index = a1._widgetState(a1_2, "index", a1_2.arguments.Index)
            end
        end,
        UpdateState = function(a1_2) -- Line: 114 -- upvalues: a1 (val)
            local Circle = a1_2.Instance.Button.Circle
            if a1_2.state.index.value == a1_2.arguments.Index then
                Circle.BackgroundTransparency = a1._config.CheckMarkTransparency
                a1_2.lastSelectedTick = a1._cycleTick + 1
                return
            end
            Circle.BackgroundTransparency = 1
            a1_2.lastUnselectedTick = a1._cycleTick + 1
        end,
    })
end