-- Script path: ReplicatedStorage.Packages.Iris.widgets.Combo
-- Decompile time: 7.82 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("Selectable", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, Index = 2, NoClick = 3},
        Events = {
            selected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 16 -- upvalues: a1 (val)
                    return a1_2.lastSelectedTick == a1._cycleTick
                end,
            },
            unselected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 22 -- upvalues: a1 (val)
                    return a1_2.lastUnselectedTick == a1._cycleTick
                end,
            },
            active = {
                Init = function(a1) end,
                Get = function(a1) -- Line: 28
                    return a1.state.index.value == a1.arguments.Index
                end,
            },
            clicked = a2.EVENTS.click(function(a1) -- Line: 32
                return a1.Instance.SelectableButton
            end),
            rightClicked = a2.EVENTS.rightClick(function(a1) -- Line: 36
                return a1.Instance.SelectableButton
            end),
            doubleClicked = a2.EVENTS.doubleClick(function(a1) -- Line: 40
                return a1.Instance.SelectableButton
            end),
            ctrlClicked = a2.EVENTS.ctrlClick(function(a1) -- Line: 44
                return a1.Instance.SelectableButton
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 48
                return a1.Instance.SelectableButton
            end),
        },
        Generate = function(a1_2) -- Line: 53 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Selectable"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new(0, a1._config.TextSize + 2 * a1._config.FramePadding.Y - a1._config.ItemSpacing.Y))
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = 0
            Frame.LayoutOrder = a1_2.ZIndex
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "SelectableButton"
            TextButton.Size = UDim2.new(1, 0, 0, a1._config.TextSize + 2 * a1._config.FramePadding.Y)
            TextButton.Position = UDim2.fromOffset(0, -bit32.rshift(a1._config.ItemSpacing.Y, 1))
            TextButton.BackgroundColor3 = a1._config.HeaderColor
            TextButton.ClipsDescendants = true
            a2.applyFrameStyle(TextButton)
            a2.applyTextStyle(TextButton)
            a2.UISizeConstraint(TextButton, Vector2.xAxis)
            a1_2.ButtonColors = {
                Transparency = 1,
                Color = a1._config.HeaderColor,
                HoveredColor = a1._config.HeaderHoveredColor,
                HoveredTransparency = a1._config.HeaderHoveredTransparency,
                ActiveColor = a1._config.HeaderActiveColor,
                ActiveTransparency = a1._config.HeaderActiveTransparency,
            }
            a2.applyInteractionHighlights("Background", TextButton, TextButton, a1_2.ButtonColors)
            a2.applyButtonClick(TextButton, function() -- Line: 84 -- upvalues: a1_2 (val)
                if a1_2.arguments.NoClick ~= true then
                    if type(a1_2.state.index.value) == "boolean" then
                        a1_2.state.index:set(not a1_2.state.index.value)
                        return
                    end
                    a1_2.state.index:set(a1_2.arguments.Index)
                end
            end)
            TextButton.Parent = Frame
            return Frame
        end,
        Update = function(a1) -- Line: 98
            a1.Instance.SelectableButton.Text = a1.arguments.Text or "Selectable"
        end,
        Discard = function(a1) -- Line: 103 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        GenerateState = function(a1_2) -- Line: 107 -- upvalues: a1 (val)
            if a1_2.state.index == nil then
                if a1_2.arguments.Index ~= nil then
                    error("A shared state index is required for Iris.Selectables() with an Index argument.", 5)
                end
                a1_2.state.index = a1._widgetState(a1_2, "index", false)
            end
        end,
        UpdateState = function(a1_2) -- Line: 115 -- upvalues: a1 (val)
            local SelectableButton = a1_2.Instance.SelectableButton
            if a1_2.state.index.value == (a1_2.arguments.Index or true) then
                a1_2.ButtonColors.Transparency = a1._config.HeaderTransparency
                SelectableButton.BackgroundTransparency = a1._config.HeaderTransparency
                a1_2.lastSelectedTick = a1._cycleTick + 1
                return
            end
            a1_2.ButtonColors.Transparency = 1
            SelectableButton.BackgroundTransparency = 1
            a1_2.lastUnselectedTick = a1._cycleTick + 1
        end,
    })
    local u45 = false
    local u46 = -1
    local u47 = nil
    local u48 = 0

    local function UpdateChildContainerTransform(a1_2) -- Line: 135 -- upvalues: a2 (val), a1 (val), u48 (ref)
        local PreviewContainer = a1_2.Instance.PreviewContainer
        local ChildContainer = a1_2.ChildContainer
        local v1 = PreviewContainer.AbsolutePosition - a2.GuiOffset
        local AbsoluteSize = PreviewContainer.AbsoluteSize
        local PopupBorderSize = a1._config.PopupBorderSize
        local AbsoluteSize_2 = ChildContainer.Parent.AbsoluteSize
        local Y = a1_2.UIListLayout.AbsoluteContentSize.Y
        u48 = Y
        local v2 = Y + 2 * a1._config.WindowPadding.Y
        local X = v1.X
        local v3 = v1.Y + AbsoluteSize.Y + PopupBorderSize
        local zero = Vector2.zero
        local v4 = AbsoluteSize_2.Y - v3
        if v4 < v2 and AbsoluteSize_2.Y / 2 < v3 then
            v3 = v1.Y - PopupBorderSize
            zero = Vector2.yAxis
            v4 = v3
        end
        ChildContainer.AnchorPoint = zero
        ChildContainer.Position = UDim2.fromOffset(X, v3)
        ChildContainer.Size = UDim2.fromOffset(PreviewContainer.AbsoluteSize.X, (math.min(v2, v4)))
    end

    table.insert(a1._postCycleCallbacks, function() -- Line: 170 -- upvalues: u45 (ref), u47 (ref), u48 (ref), UpdateChildContainerTransform (val)
        if u45 and u47 and u47.UIListLayout.AbsoluteContentSize.Y ~= u48 then
            UpdateChildContainerTransform(u47)
        end
    end)

    local function UpdateComboState(a1_2) -- Line: 179
        -- upvalues: a1 (val), u45 (ref), u47 (ref), u46 (ref), a2 (val)
        if not a1._started then
            return
        end
        if a1_2.UserInputType ~= Enum.UserInputType.MouseButton1
            and a1_2.UserInputType ~= Enum.UserInputType.MouseButton2
            and a1_2.UserInputType ~= Enum.UserInputType.Touch
            and a1_2.UserInputType ~= Enum.UserInputType.MouseWheel then
            return
        end
        if u45 ~= false and u47 then
            if u46 == a1._cycleTick then
                return
            end
            local v1 = a2.getMouseLocation()
            local PreviewContainer = u47.Instance.PreviewContainer
            local ChildContainer = u47.ChildContainer
            if a2.isPosInsideRect(
                    v1,
                    PreviewContainer.AbsolutePosition - a2.GuiOffset,
                    PreviewContainer.AbsolutePosition - a2.GuiOffset + PreviewContainer.AbsoluteSize
                )
                or a2.isPosInsideRect(
                    v1,
                    ChildContainer.AbsolutePosition - a2.GuiOffset,
                    ChildContainer.AbsolutePosition - a2.GuiOffset + ChildContainer.AbsoluteSize
                ) then
                return
            end
            u47.state.isOpened:set(false)
            return
        end
    end

    a2.registerEvent("InputBegan", UpdateComboState)
    a2.registerEvent("InputChanged", UpdateComboState)
    a1.WidgetConstructor("Combo", {
        hasState = true,
        hasChildren = true,
        Args = {Text = 1, NoButton = 2, NoPreview = 3},
        Events = {
            opened = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 228 -- upvalues: a1 (val)
                    return a1_2.lastOpenedTick == a1._cycleTick
                end,
            },
            closed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 234 -- upvalues: a1 (val)
                    return a1_2.lastClosedTick == a1._cycleTick
                end,
            },
            clicked = a2.EVENTS.click(function(a1) -- Line: 238
                return a1.Instance
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 241
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 245 -- upvalues: a1 (val), a2 (val), u45 (ref), u47 (ref)
            local v1 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Combo"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            local v2 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "PreviewContainer"
            TextButton.Size = UDim2.new(a1._config.ContentWidth, UDim.new(0, 0))
            TextButton.AutomaticSize = Enum.AutomaticSize.Y
            TextButton.BackgroundTransparency = 1
            TextButton.Text = ""
            TextButton.ZIndex = a1_2.ZIndex + 2
            TextButton.AutoButtonColor = false
            a2.applyFrameStyle(TextButton, true)
            a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            a2.UISizeConstraint(TextButton, Vector2.new(v1))
            TextButton.Parent = Frame
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "PreviewLabel"
            TextLabel.Size = UDim2.new(UDim.new(1, 0), a1._config.ContentHeight)
            TextLabel.AutomaticSize = Enum.AutomaticSize.Y
            TextLabel.BackgroundColor3 = a1._config.FrameBgColor
            TextLabel.BackgroundTransparency = a1._config.FrameBgTransparency
            TextLabel.BorderSizePixel = 0
            TextLabel.ClipsDescendants = true
            a2.applyTextStyle(TextLabel)
            a2.UIPadding(TextLabel, a1._config.FramePadding)
            TextLabel.Parent = TextButton
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "DropdownButton"
            TextLabel_2.Size = UDim2.new(0, v1, a1._config.ContentHeight.Scale, (math.max(a1._config.ContentHeight.Offset, v1)))
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.BackgroundColor3 = a1._config.ButtonColor
            TextLabel_2.BackgroundTransparency = a1._config.ButtonTransparency
            TextLabel_2.Text = ""
            local v3 = v1 - math.round(v1 * 0.2) * 2
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Dropdown"
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.Size = UDim2.fromOffset(v3, v3)
            ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.ImageColor3 = a1._config.TextColor
            ImageLabel.ImageTransparency = a1._config.TextTransparency
            ImageLabel.Parent = TextLabel_2
            TextLabel_2.Parent = TextButton
            a2.applyInteractionHighlightsWithMultiHighlightee("Background", TextButton, {
                {
                    TextLabel,
                    {
                        Color = a1._config.FrameBgColor,
                        Transparency = a1._config.FrameBgTransparency,
                        HoveredColor = a1._config.FrameBgHoveredColor,
                        HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                        ActiveColor = a1._config.FrameBgActiveColor,
                        ActiveTransparency = a1._config.FrameBgActiveTransparency,
                    },
                },
                {
                    TextLabel_2,
                    {
                        Color = a1._config.ButtonColor,
                        Transparency = a1._config.ButtonTransparency,
                        HoveredColor = a1._config.ButtonHoveredColor,
                        HoveredTransparency = a1._config.ButtonHoveredTransparency,
                        ActiveColor = a1._config.ButtonHoveredColor,
                        ActiveTransparency = a1._config.ButtonHoveredTransparency,
                    },
                },
            })
            a2.applyButtonClick(TextButton, function() -- Line: 341 -- upvalues: u45 (upval), u47 (upval), a1_2 (val)
                if u45 and u47 ~= a1_2 then
                    return
                end
                a1_2.state.isOpened:set(not a1_2.state.isOpened.value)
            end)
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Name = "TextLabel"
            TextLabel_3.Size = UDim2.fromOffset(0, v1)
            TextLabel_3.AutomaticSize = Enum.AutomaticSize.X
            TextLabel_3.BackgroundTransparency = 1
            TextLabel_3.BorderSizePixel = 0
            a2.applyTextStyle(TextLabel_3)
            TextLabel_3.Parent = Frame
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "ComboContainer"
            ScrollingFrame.BackgroundColor3 = a1._config.PopupBgColor
            ScrollingFrame.BackgroundTransparency = a1._config.PopupBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = a1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = a1._config.ScrollbarGrabColor
            ScrollingFrame.ScrollBarThickness = a1._config.ScrollbarSize
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.TopImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.MidImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.BottomImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.ClipsDescendants = true
            a2.UIStroke(ScrollingFrame, a1._config.WindowBorderSize, a1._config.BorderColor, a1._config.BorderTransparency)
            a2.UIPadding(ScrollingFrame, Vector2.new(2, a1._config.WindowPadding.Y))
            a2.UISizeConstraint(ScrollingFrame, Vector2.new(100))
            local v4 = a2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            v4.VerticalAlignment = Enum.VerticalAlignment.Top
            local _rootInstance = a1._rootInstance and a1._rootInstance:WaitForChild("PopupScreenGui")
            ScrollingFrame.Parent = _rootInstance
            a1_2.ChildContainer = ScrollingFrame
            a1_2.UIListLayout = v4
            return Frame
        end,
        Update = function(a1_2) -- Line: 397 -- upvalues: a1 (val)
            local Instance = a1_2.Instance
            local PreviewContainer = Instance.PreviewContainer
            local PreviewLabel = PreviewContainer.PreviewLabel
            local DropdownButton = PreviewContainer.DropdownButton
            Instance.TextLabel.Text = a1_2.arguments.Text or "Combo"
            if not a1_2.arguments.NoButton then
                DropdownButton.Visible = true
                PreviewLabel.Size = UDim2.new(UDim.new(1, -(a1._config.TextSize + 2 * a1._config.FramePadding.Y)), PreviewLabel.Size.Height)
            else
                DropdownButton.Visible = false
                PreviewLabel.Size = UDim2.new(UDim.new(1, 0), PreviewLabel.Size.Height)
            end
            if a1_2.arguments.NoPreview then
                PreviewLabel.Visible = false
                PreviewContainer.Size = UDim2.new(0, 0, 0, 0)
                PreviewContainer.AutomaticSize = Enum.AutomaticSize.XY
                return
            end
            PreviewLabel.Visible = true
            PreviewContainer.Size = UDim2.new(a1._config.ContentWidth, a1._config.ContentHeight)
            PreviewContainer.AutomaticSize = Enum.AutomaticSize.Y
        end,
        ChildAdded = function(a1, a2) -- Line: 425 -- upvalues: UpdateChildContainerTransform (val)
            UpdateChildContainerTransform(a1)
            return a1.ChildContainer
        end,
        GenerateState = function(a1_2) -- Line: 429 -- upvalues: a1 (val)
            if a1_2.state.index == nil then
                a1_2.state.index = a1._widgetState(a1_2, "index", "No Selection")
            end
            a1_2.state.index:onChange(function() -- Line: 433 -- upvalues: a1_2 (val)
                if a1_2.state.isOpened.value then
                    a1_2.state.isOpened:set(false)
                end
            end)
            if a1_2.state.isOpened == nil then
                a1_2.state.isOpened = a1._widgetState(a1_2, "isOpened", false)
            end
        end,
        UpdateState = function(a1_2) -- Line: 442
            -- upvalues: u45 (ref), u47 (ref), u46 (ref), a1 (val), a2 (val), UpdateChildContainerTransform (val)
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            local PreviewContainer = Instance.PreviewContainer
            local PreviewLabel = PreviewContainer.PreviewLabel
            local Dropdown = PreviewContainer.DropdownButton.Dropdown
            if not a1_2.state.isOpened.value then
                if u45 then
                    u45 = false
                    u47 = nil
                    a1_2.lastClosedTick = a1._cycleTick + 1
                end
                Dropdown.Image = a2.ICONS.DOWN_POINTING_TRIANGLE
                ChildContainer.Visible = false
            else
                u45 = true
                u47 = a1_2
                u46 = a1._cycleTick
                a1_2.lastOpenedTick = a1._cycleTick + 1
                Dropdown.Image = a2.ICONS.RIGHT_POINTING_TRIANGLE
                ChildContainer.Visible = true
                UpdateChildContainerTransform(a1_2)
            end
            local value = a1_2.state.index.value
            local Name = if typeof(value) ~= "EnumItem" then tostring(value) else value.Name
            PreviewLabel.Text = Name
        end,
        Discard = function(a1) -- Line: 474 -- upvalues: u47 (ref), u45 (ref), a2 (val)
            if u47 and u47 == a1 then
                u47 = nil
                u45 = false
            end
            a1.Instance:Destroy()
            a1.ChildContainer:Destroy()
            a2.discardState(a1)
        end,
    })
end