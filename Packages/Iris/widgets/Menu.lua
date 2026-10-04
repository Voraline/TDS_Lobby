-- Script path: ReplicatedStorage.Packages.Iris.widgets.Menu
-- Decompile time: 9.99 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local u2 = false
    local u3 = nil
    local u4 = {}

    local function EmptyMenuStack(a1_2) -- Line: 8
        -- upvalues: u4 (val), a1 (val), u2 (ref), u3 (ref)
        local v1
        local v2 = #u4
        for i = v2, a1_2 and a1_2 + 1 or 1, -1 do
            v1 = u4[i]
            v1.state.isOpened:set(false)
            v1.Instance.BackgroundColor3 = a1._config.HeaderColor
            v1.Instance.BackgroundTransparency = 1
            table.remove(u4, i)
        end
        if #u4 == 0 then
            u2 = false
            u3 = nil
        end
    end

    local function UpdateChildContainerTransform(a1_2) -- Line: 25 -- upvalues: a2 (val), a1 (val)
        local v1
        local v2 = a1_2.parentWidget.type == "Menu"
        local Instance = a1_2.Instance
        local ChildContainer = a1_2.ChildContainer
        ChildContainer.Size = UDim2.fromOffset(Instance.AbsoluteSize.X, 0)
        if ChildContainer.Parent == nil then
            return
        end
        local v3 = Instance.AbsolutePosition - a2.GuiOffset
        local AbsoluteSize = Instance.AbsoluteSize
        local AbsoluteSize_2 = ChildContainer.AbsoluteSize
        local PopupBorderSize = a1._config.PopupBorderSize
        local AbsoluteSize_3 = ChildContainer.Parent.AbsoluteSize
        local X = v3.X
        local zero = Vector2.zero
        if v2 then
            if not (AbsoluteSize_3.X < v3.X + AbsoluteSize_2.X) then
                X = v3.X + AbsoluteSize.X
            else
                zero = Vector2.xAxis
            end
        end
        local v4 = v3.Y + AbsoluteSize_2.Y
        if not (AbsoluteSize_3.Y < v4) then
            v4 = v3.Y + PopupBorderSize
            v1 = v4 + (if not v2 then AbsoluteSize.Y else 0)
        else
            v4 = v3.Y - PopupBorderSize
            v1 = v4 + (v2 and AbsoluteSize.Y or 0)
            zero = zero + Vector2.yAxis
        end
        ChildContainer.Position = UDim2.fromOffset(X, v1)
        ChildContainer.AnchorPoint = zero
    end

    a2.registerEvent("InputBegan", function(a1_2) -- Line: 65
        -- upvalues: a1 (val), u2 (ref), u3 (ref), a2 (val), u4 (val), EmptyMenuStack (val)
        local v1
        if not a1._started then
            return
        end
        if a1_2.UserInputType ~= Enum.UserInputType.MouseButton1
            and a1_2.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return
        end
        if u2 == false or u3 == nil then
            return
        end
        local v2 = false
        local v3 = a2.getMouseLocation()
        local v4 = nil
        local v5 = nil
        for i, j in u4, v4, v5 do
            for k, n in {j.ChildContainer, j.Instance} do
                v1 = n.AbsolutePosition - a2.GuiOffset
                if a2.isPosInsideRect(v3, v1, v1 + n.AbsoluteSize) then
                    v2 = true
                    break
                end
            end
            if v2 then
                break
            end
        end
        if not v2 then
            EmptyMenuStack()
        end
    end)
    a1.WidgetConstructor("MenuBar", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1_2) -- Line: 107 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_MenuBar"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundColor3 = a1._config.MenubarBgColor
            Frame.BackgroundTransparency = a1._config.MenubarBgTransparency
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.ClipsDescendants = true
            a2.UIPadding(Frame, Vector2.new(a1._config.WindowPadding.X, 1))
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new())
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyFrameStyle(Frame, true, true)
            return Frame
        end,
        Update = function(a1) end,
        ChildAdded = function(a1, a2) -- Line: 127
            return a1.Instance
        end,
        Discard = function(a1) -- Line: 130
            a1.Instance:Destroy()
        end,
    })
    a1.WidgetConstructor("Menu", {
        hasState = true,
        hasChildren = true,
        Args = {Text = 1},
        Events = {
            clicked = a2.EVENTS.click(function(a1) -- Line: 143
                return a1.Instance
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 146
                return a1.Instance
            end),
            opened = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 151 -- upvalues: a1 (val)
                    return a1_2.lastOpenedTick == a1._cycleTick
                end,
            },
            closed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 157 -- upvalues: a1 (val)
                    return a1_2.lastClosedTick == a1._cycleTick
                end,
            },
        },
        Generate = function(a1_2) -- Line: 162 -- upvalues: a1 (val), a2 (val), u4 (val), u2 (ref), u3 (ref), EmptyMenuStack (val)
            local v1, v2
            local v3 = {
                Transparency = 1,
                Color = a1._config.HeaderColor,
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderHoveredColor,
                ActiveTransparency = a1._config.HeaderHoveredTransparency,
            }
            a1_2.ButtonColors = v3
            if a1_2.parentWidget.type ~= "Menu" then
                v1 = Instance.new("TextButton")
                v1.Name = "Menu"
                v1.AutomaticSize = Enum.AutomaticSize.XY
                v1.Size = UDim2.fromScale(0, 0)
                v1.BackgroundColor3 = a1._config.HeaderColor
                v1.BackgroundTransparency = 1
                v1.BorderSizePixel = 0
                v1.Text = ""
                v1.LayoutOrder = a1_2.ZIndex
                v1.AutoButtonColor = false
                v1.ClipsDescendants = true
                a2.applyTextStyle(v1)
                a2.UIPadding(v1, Vector2.new(a1._config.ItemSpacing.X, a1._config.FramePadding.Y))
            else
                v1 = Instance.new("TextButton")
                v1.Name = "Menu"
                v1.BackgroundColor3 = a1._config.HeaderColor
                v1.BackgroundTransparency = 1
                v1.BorderSizePixel = 0
                v1.Size = UDim2.fromScale(1, 0)
                v1.Text = ""
                v1.AutomaticSize = Enum.AutomaticSize.Y
                v1.LayoutOrder = a1_2.ZIndex
                v1.AutoButtonColor = false
                v3 = a2.UIPadding(v1, a1._config.FramePadding)
                v3.PaddingTop = v3.PaddingTop - UDim.new(0, 1)
                v2 = a2.UIListLayout(v1, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
                v2.VerticalAlignment = Enum.VerticalAlignment.Center
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "TextLabel"
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.AutomaticSize = Enum.AutomaticSize.XY
                a2.applyTextStyle(TextLabel)
                TextLabel.Parent = v1
                local v4 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
                local v5 = v4 - math.round(v4 * 0.2) * 2
                local ImageLabel = Instance.new("ImageLabel")
                ImageLabel.Name = "Icon"
                ImageLabel.Size = UDim2.fromOffset(v5, v5)
                ImageLabel.BackgroundTransparency = 1
                ImageLabel.BorderSizePixel = 0
                ImageLabel.ImageColor3 = a1._config.TextColor
                ImageLabel.ImageTransparency = a1._config.TextTransparency
                ImageLabel.Image = a2.ICONS.RIGHT_POINTING_TRIANGLE
                ImageLabel.LayoutOrder = 1
                ImageLabel.Parent = v1
            end
            a2.applyInteractionHighlights("Background", v1, v1, a1_2.ButtonColors)
            a2.applyButtonClick(v1, function() -- Line: 232 -- upvalues: u4 (upval), a1_2 (val), u2 (upval), u3 (upval)
                local v1
                a1_2.state.isOpened:set(if not (#u4 <= 1) then true else not a1_2.state.isOpened.value)
                u2 = v1
                u3 = v1 and a1_2 or nil
                if #u4 <= 1 then
                    if v1 then
                        table.insert(u4, a1_2)
                        return
                    end
                    table.remove(u4)
                end
            end)
            a2.applyMouseEnter(v1, function() -- Line: 248 -- upvalues: u2 (upval), u3 (upval), a1_2 (val), u4 (upval), EmptyMenuStack (upval)
                if u2 and u3 and u3 ~= a1_2 then
                    local parentWidget = a1_2.parentWidget
                    local v1 = table.find(u4, parentWidget)
                    EmptyMenuStack(v1)
                    a1_2.state.isOpened:set(true)
                    u3 = a1_2
                    u2 = true
                    table.insert(u4, a1_2)
                end
            end)
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "MenuContainer"
            ScrollingFrame.BackgroundColor3 = a1._config.PopupBgColor
            ScrollingFrame.BackgroundTransparency = a1._config.PopupBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.Size = UDim2.fromOffset(0, 0)
            ScrollingFrame.AutomaticSize = Enum.AutomaticSize.XY
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = a1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = a1._config.ScrollbarGrabColor
            ScrollingFrame.ScrollBarThickness = a1._config.ScrollbarSize
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.TopImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.MidImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.BottomImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.ZIndex = 6
            ScrollingFrame.LayoutOrder = 6
            ScrollingFrame.ClipsDescendants = true
            a2.UIStroke(ScrollingFrame, a1._config.WindowBorderSize, a1._config.BorderColor, a1._config.BorderTransparency)
            a2.UIPadding(ScrollingFrame, Vector2.new(2, a1._config.WindowPadding.Y - a1._config.ItemSpacing.Y))
            v2 = a2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, 1))
            v2.VerticalAlignment = Enum.VerticalAlignment.Top
            local _rootInstance = a1._rootInstance and a1._rootInstance:FindFirstChild("PopupScreenGui")
            ScrollingFrame.Parent = _rootInstance
            a1_2.ChildContainer = ScrollingFrame
            return v1
        end,
        Update = function(a1) -- Line: 301
            local Instance = a1.Instance
            local TextLabel = if a1.parentWidget.type ~= "Menu" then Instance else Instance.TextLabel
            TextLabel.Text = a1.arguments.Text or "Menu"
        end,
        ChildAdded = function(a1, a2) -- Line: 311 -- upvalues: UpdateChildContainerTransform (val)
            UpdateChildContainerTransform(a1)
            return a1.ChildContainer
        end,
        ChildDiscarded = function(a1, a2) -- Line: 315 -- upvalues: UpdateChildContainerTransform (val)
            UpdateChildContainerTransform(a1)
        end,
        GenerateState = function(a1_2) -- Line: 318 -- upvalues: a1 (val)
            if a1_2.state.isOpened == nil then
                a1_2.state.isOpened = a1._widgetState(a1_2, "isOpened", false)
            end
        end,
        UpdateState = function(a1_2) -- Line: 323 -- upvalues: a1 (val), UpdateChildContainerTransform (val)
            local ChildContainer = a1_2.ChildContainer
            if not a1_2.state.isOpened.value then
                a1_2.lastClosedTick = a1._cycleTick + 1
                a1_2.ButtonColors.Transparency = 1
                ChildContainer.Visible = false
                return
            end
            a1_2.lastOpenedTick = a1._cycleTick + 1
            a1_2.ButtonColors.Transparency = a1._config.HeaderTransparency
            ChildContainer.Visible = true
            UpdateChildContainerTransform(a1_2)
        end,
        Discard = function(a1) -- Line: 338 -- upvalues: u2 (ref), u4 (val), EmptyMenuStack (val), u3 (ref), a2 (val)
            if u2 then
                local parentWidget = a1.parentWidget
                local v1 = table.find(u4, parentWidget)
                if v1 then
                    EmptyMenuStack(v1)
                    if #u4 ~= 0 then
                        u3 = parentWidget
                        u2 = true
                    end
                end
            end
            a1.Instance:Destroy()
            a1.ChildContainer:Destroy()
            a2.discardState(a1)
        end,
    })
    a1.WidgetConstructor("MenuItem", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1, KeyCode = 2, ModifierKey = 3},
        Events = {
            clicked = a2.EVENTS.click(function(a1) -- Line: 368
                return a1.Instance
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 371
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 375 -- upvalues: a2 (val), a1 (val), EmptyMenuStack (val), u2 (ref), u3 (ref), u4 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "MenuItem"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.fromScale(1, 0)
            TextButton.Text = ""
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.LayoutOrder = a1_2.ZIndex
            TextButton.AutoButtonColor = false
            local v1 = a2.UIPadding(TextButton, a1._config.FramePadding)
            v1.PaddingTop = v1.PaddingTop - UDim.new(0, 1)
            a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            a2.applyInteractionHighlights("Background", TextButton, TextButton, {
                Transparency = 1,
                Color = a1._config.HeaderColor,
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderHoveredColor,
                ActiveTransparency = a1._config.HeaderHoveredTransparency,
            })
            a2.applyButtonClick(TextButton, function() -- Line: 399 -- upvalues: EmptyMenuStack (upval)
                EmptyMenuStack()
            end)
            a2.applyMouseEnter(TextButton, function() -- Line: 403 -- upvalues: a1_2 (val), u2 (upval), u3 (upval), u4 (upval), EmptyMenuStack (upval)
                local parentWidget = a1_2.parentWidget
                if u2 and u3 and u3 ~= parentWidget then
                    local v1 = table.find(u4, parentWidget)
                    EmptyMenuStack(v1)
                    u3 = parentWidget
                    u2 = true
                end
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Shortcut"
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.LayoutOrder = 1
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            a2.applyTextStyle(TextLabel_2)
            TextLabel_2.Text = ""
            TextLabel_2.TextColor3 = a1._config.TextDisabledColor
            TextLabel_2.TextTransparency = a1._config.TextDisabledTransparency
            TextLabel_2.Parent = TextButton
            return TextButton
        end,
        Update = function(a1) -- Line: 441
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local Shortcut = Instance.Shortcut
            TextLabel.Text = a1.arguments.Text
            if a1.arguments.KeyCode then
                if a1.arguments.ModifierKey then
                    Shortcut.Text = a1.arguments.ModifierKey.Name .. " + " .. a1.arguments.KeyCode.Name
                    return
                end
                Shortcut.Text = a1.arguments.KeyCode.Name
            end
        end,
        Discard = function(a1) -- Line: 455
            a1.Instance:Destroy()
        end,
    })
    a1.WidgetConstructor("MenuToggle", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, KeyCode = 2, ModifierKey = 3},
        Events = {
            checked = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 472 -- upvalues: a1 (val)
                    return a1_2.lastCheckedTick == a1._cycleTick
                end,
            },
            unchecked = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 478 -- upvalues: a1 (val)
                    return a1_2.lastUncheckedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 482
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 486 -- upvalues: a2 (val), a1 (val), EmptyMenuStack (val), u2 (ref), u3 (ref), u4 (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "MenuItem"
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Size = UDim2.fromScale(1, 0)
            TextButton.Text = ""
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.LayoutOrder = a1_2.ZIndex
            TextButton.AutoButtonColor = false
            local v1 = a2.UIPadding(TextButton, a1._config.FramePadding)
            v1.PaddingTop = v1.PaddingTop - UDim.new(0, 1)
            local v2 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyInteractionHighlights("Background", TextButton, TextButton, {
                Transparency = 1,
                Color = a1._config.HeaderColor,
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderHoveredColor,
                ActiveTransparency = a1._config.HeaderHoveredTransparency,
            })
            a2.applyButtonClick(TextButton, function() -- Line: 510 -- upvalues: a1_2 (val), EmptyMenuStack (upval)
                a1_2.state.isChecked:set(not a1_2.state.isChecked.value)
                EmptyMenuStack()
            end)
            a2.applyMouseEnter(TextButton, function() -- Line: 516 -- upvalues: a1_2 (val), u2 (upval), u3 (upval), u4 (upval), EmptyMenuStack (upval)
                local parentWidget = a1_2.parentWidget
                if u2 and u3 and u3 ~= parentWidget then
                    local v1 = table.find(u4, parentWidget)
                    EmptyMenuStack(v1)
                    u3 = parentWidget
                    u2 = true
                end
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Shortcut"
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.LayoutOrder = 1
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            a2.applyTextStyle(TextLabel_2)
            TextLabel_2.Text = ""
            TextLabel_2.TextColor3 = a1._config.TextDisabledColor
            TextLabel_2.TextTransparency = a1._config.TextDisabledTransparency
            TextLabel_2.Parent = TextButton
            local v3 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
            local v4 = v3 - math.round(v3 * 0.2) * 2
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Icon"
            ImageLabel.Size = UDim2.fromOffset(v4, v4)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.TextColor
            ImageLabel.ImageTransparency = a1._config.TextTransparency
            ImageLabel.Image = a2.ICONS.CHECK_MARK
            ImageLabel.LayoutOrder = 2
            ImageLabel.Parent = TextButton
            return TextButton
        end,
        GenerateState = function(a1_2) -- Line: 570 -- upvalues: a1 (val)
            if a1_2.state.isChecked == nil then
                a1_2.state.isChecked = a1._widgetState(a1_2, "isChecked", false)
            end
        end,
        Update = function(a1) -- Line: 575
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local Shortcut = Instance.Shortcut
            TextLabel.Text = a1.arguments.Text
            if a1.arguments.KeyCode then
                if a1.arguments.ModifierKey then
                    Shortcut.Text = a1.arguments.ModifierKey.Name .. " + " .. a1.arguments.KeyCode.Name
                    return
                end
                Shortcut.Text = a1.arguments.KeyCode.Name
            end
        end,
        UpdateState = function(a1_2) -- Line: 589 -- upvalues: a2 (val), a1 (val)
            local Icon = a1_2.Instance.Icon
            if a1_2.state.isChecked.value then
                Icon.Image = a2.ICONS.CHECK_MARK
                a1_2.lastCheckedTick = a1._cycleTick + 1
                return
            end
            Icon.Image = ""
            a1_2.lastUncheckedTick = a1._cycleTick + 1
        end,
        Discard = function(a1) -- Line: 601 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
    })
end