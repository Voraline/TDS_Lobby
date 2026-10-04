-- Script path: ReplicatedStorage.Packages.Iris.widgets.Checkbox
-- Decompile time: 1.91 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("Checkbox", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1},
        Events = {
            checked = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 14 -- upvalues: a1 (val)
                    return a1_2.lastCheckedTick == a1._cycleTick
                end,
            },
            unchecked = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 20 -- upvalues: a1 (val)
                    return a1_2.lastUncheckedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 24
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 28 -- upvalues: a2 (val), a1 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Iris_Checkbox"
            TextButton.AutomaticSize = Enum.AutomaticSize.XY
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            TextButton.ZIndex = a1_2.ZIndex
            TextButton.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local v2 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
            local Frame = Instance.new("Frame")
            Frame.Name = "Box"
            Frame.Size = UDim2.fromOffset(v2, v2)
            Frame.BackgroundColor3 = a1._config.FrameBgColor
            Frame.BackgroundTransparency = a1._config.FrameBgTransparency
            a2.applyFrameStyle(Frame, true)
            a2.UIPadding(Frame, Vector2.new(math.floor(v2 / 10), (math.floor(v2 / 10))))
            a2.applyInteractionHighlights("Background", TextButton, Frame, {
                Color = a1._config.FrameBgColor,
                Transparency = a1._config.FrameBgTransparency,
                HoveredColor = a1._config.FrameBgHoveredColor,
                HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                ActiveColor = a1._config.FrameBgActiveColor,
                ActiveTransparency = a1._config.FrameBgActiveTransparency,
            })
            Frame.Parent = TextButton
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Checkmark"
            ImageLabel.Size = UDim2.fromScale(1, 1)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.ImageColor3 = a1._config.CheckMarkColor
            ImageLabel.ImageTransparency = a1._config.CheckMarkTransparency
            ImageLabel.ScaleType = Enum.ScaleType.Fit
            ImageLabel.Parent = Frame
            a2.applyButtonClick(TextButton, function() -- Line: 75 -- upvalues: a1_2 (val)
                a1_2.state.isChecked:set(not a1_2.state.isChecked.value)
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
        Update = function(a1) -- Line: 92
            a1.Instance.TextLabel.Text = a1.arguments.Text or "Checkbox"
        end,
        Discard = function(a1) -- Line: 96 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        GenerateState = function(a1_2) -- Line: 100 -- upvalues: a1 (val)
            if a1_2.state.isChecked == nil then
                a1_2.state.isChecked = a1._widgetState(a1_2, "checked", false)
            end
        end,
        UpdateState = function(a1_2) -- Line: 105 -- upvalues: a2 (val), a1 (val)
            local Checkmark = a1_2.Instance.Box.Checkmark
            if a1_2.state.isChecked.value then
                Checkmark.Image = a2.ICONS.CHECK_MARK
                a1_2.lastCheckedTick = a1._cycleTick + 1
                return
            end
            Checkmark.Image = ""
            a1_2.lastUncheckedTick = a1._cycleTick + 1
        end,
    })
end