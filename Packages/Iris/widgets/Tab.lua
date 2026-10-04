-- Script path: ReplicatedStorage.Packages.Iris.widgets.Tab
-- Decompile time: 5.08 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local function openTab(a1, a2) -- Line: 4 -- types: a2: number
        if 0 < a1.state.index.value then
            return
        end
        a1.state.index:set(a2)
    end

    local function closeTab(a1, a2) -- Line: 12 -- types: a2: number
        if a1.state.index.value ~= a2 then
            return
        end
        for i = a2 - 1, 1, -1 do
            if a1.Tabs[i].state.isOpened.value == true then
                a1.state.index:set(i)
                return
            end
        end
        local v1 = #a1.Tabs
        for j = a2, v1 do
            if a1.Tabs[j].state.isOpened.value == true then
                a1.state.index:set(j)
                return
            end
        end
        a1.state.index:set(0)
    end

    a1.WidgetConstructor("TabBar", {
        hasState = true,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1_2) -- Line: 43 -- upvalues: a2 (val), a1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_TabBar"
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new())
            v1.VerticalAlignment = Enum.VerticalAlignment.Bottom
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Bar"
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.Size = UDim2.fromScale(1, 0)
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            a2.UIListLayout(Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Underline"
            Frame_3.Size = UDim2.new(1, 0, 0, 1)
            Frame_3.BackgroundColor3 = a1._config.TabActiveColor
            Frame_3.BackgroundTransparency = a1._config.TabActiveTransparency
            Frame_3.BorderSizePixel = 0
            Frame_3.LayoutOrder = 1
            Frame_3.Parent = Frame
            local Frame_4 = Instance.new("Frame")
            Frame_4.Name = "TabContainer"
            Frame_4.AutomaticSize = Enum.AutomaticSize.Y
            Frame_4.Size = UDim2.fromScale(1, 0)
            Frame_4.BackgroundTransparency = 1
            Frame_4.BorderSizePixel = 0
            Frame_4.LayoutOrder = 2
            Frame_4.ClipsDescendants = true
            Frame_4.Parent = Frame
            a1_2.ChildContainer = Frame_4
            a1_2.Tabs = {}
            return Frame
        end,
        Update = function(a1) end,
        ChildAdded = function(a1, a2) -- Line: 92
            assert(a2.type == "Tab", "Only Iris.Tab can be parented to Iris.TabBar.")
            local Instance = a1.Instance
            a2.ChildContainer.Parent = a1.ChildContainer
            a2.Index = #a1.Tabs + 1
            a1.state.index.ConnectedWidgets[a2.ID] = a2
            table.insert(a1.Tabs, a2)
            return Instance.Bar
        end,
        ChildDiscarded = function(a1, a2) -- Line: 102 -- upvalues: closeTab (val)
            local Index = a2.Index
            table.remove(a1.Tabs, Index)
            local v1 = #a1.Tabs
            for i = Index, v1 do
                a1.Tabs[i].Index = i
            end
            closeTab(a1, Index)
        end,
        GenerateState = function(a1_2) -- Line: 112 -- upvalues: a1 (val)
            if a1_2.state.index == nil then
                a1_2.state.index = a1._widgetState(a1_2, "index", 1)
            end
        end,
        UpdateState = function(a1) end,
        Discard = function(a1) -- Line: 119
            a1.Instance:Destroy()
        end,
    })
    a1.WidgetConstructor("Tab", {
        hasState = true,
        hasChildren = true,
        Args = {Text = 1, Hideable = 2},
        Events = {
            clicked = a2.EVENTS.click(function(a1) -- Line: 133
                return a1.Instance
            end),
            hovered = a2.EVENTS.hover(function(a1) -- Line: 136
                return a1.Instance
            end),
            selected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 141 -- upvalues: a1 (val)
                    return a1_2.lastSelectedTick == a1._cycleTick
                end,
            },
            unselected = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 147 -- upvalues: a1 (val)
                    return a1_2.lastUnselectedTick == a1._cycleTick
                end,
            },
            active = {
                Init = function(a1) end,
                Get = function(a1) -- Line: 153
                    return a1.state.index.value == a1.Index
                end,
            },
            opened = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 159 -- upvalues: a1 (val)
                    return a1_2.lastOpenedTick == a1._cycleTick
                end,
            },
            closed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 165 -- upvalues: a1 (val)
                    return a1_2.lastClosedTick == a1._cycleTick
                end,
            },
        },
        Generate = function(a1_2) -- Line: 170 -- upvalues: a1 (val), a2 (val), closeTab (val)
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "Iris_Tab"
            TextButton.AutomaticSize = Enum.AutomaticSize.XY
            TextButton.BackgroundColor3 = a1._config.TabColor
            TextButton.BackgroundTransparency = a1._config.TabTransparency
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.AutoButtonColor = false
            a1_2.ButtonColors = {
                Color = a1._config.TabColor,
                Transparency = a1._config.TabTransparency,
                HoveredColor = a1._config.TabHoveredColor,
                HoveredTransparency = a1._config.TabHoveredTransparency,
                ActiveColor = a1._config.TabActiveColor,
                ActiveTransparency = a1._config.TabActiveTransparency,
            }
            a2.UIPadding(TextButton, Vector2.new(a1._config.FramePadding.X, 0))
            a2.applyFrameStyle(TextButton, true, true)
            local v1 = a2.UIListLayout(TextButton, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyInteractionHighlights("Background", TextButton, TextButton, a1_2.ButtonColors)
            a2.applyButtonClick(TextButton, function() -- Line: 193 -- upvalues: a1_2 (val)
                a1_2.state.index:set(a1_2.Index)
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            a2.applyTextStyle(TextLabel)
            a2.UIPadding(TextLabel, Vector2.new(0, a1._config.FramePadding.Y))
            TextLabel.Parent = TextButton
            local v2 = a1._config.TextSize + (a1._config.FramePadding.Y - 1) * 2
            local TextButton_2 = Instance.new("TextButton")
            TextButton_2.Name = "CloseButton"
            TextButton_2.BackgroundTransparency = 1
            TextButton_2.BorderSizePixel = 0
            TextButton_2.LayoutOrder = 1
            TextButton_2.Size = UDim2.fromOffset(v2, v2)
            TextButton_2.Text = ""
            TextButton_2.AutoButtonColor = false
            a2.UICorner(TextButton_2)
            a2.applyButtonClick(TextButton_2, function() -- Line: 220 -- upvalues: a1_2 (val), closeTab (upval)
                a1_2.state.isOpened:set(false)
                closeTab(a1_2.parentWidget, a1_2.Index)
            end)
            a2.applyInteractionHighlights("Background", TextButton_2, TextButton_2, {
                Transparency = 1,
                Color = a1._config.TabColor,
                HoveredColor = a1._config.ButtonHoveredColor,
                HoveredTransparency = a1._config.ButtonHoveredTransparency,
                ActiveColor = a1._config.ButtonActiveColor,
                ActiveTransparency = a1._config.ButtonActiveTransparency,
            })
            TextButton_2.Parent = TextButton
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Icon"
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Image = a2.ICONS.MULTIPLICATION_SIGN
            ImageLabel.ImageTransparency = 1
            ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel.Size = UDim2.fromOffset(math.floor(v2 * 0.7), (math.floor(v2 * 0.7)))
            a2.applyInteractionHighlights("Image", TextButton, ImageLabel, {
                Transparency = 1,
                Color = a1._config.TextColor,
                HoveredColor = a1._config.TextColor,
                HoveredTransparency = a1._config.TextTransparency,
                ActiveColor = a1._config.TextColor,
                ActiveTransparency = a1._config.TextTransparency,
            })
            ImageLabel.Parent = TextButton_2
            local Frame = Instance.new("Frame")
            Frame.Name = "TabContainer"
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ClipsDescendants = true
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            local v3 = a2.UIPadding(Frame, Vector2.new(0, a1._config.ItemSpacing.Y))
            v3.PaddingBottom = UDim.new()
            a1_2.ChildContainer = Frame
            return TextButton
        end,
        Update = function(a1) -- Line: 271
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local CloseButton = Instance.CloseButton
            TextLabel.Text = a1.arguments.Text
            CloseButton.Visible = not (a1.arguments.Hideable ~= true)
        end,
        ChildAdded = function(a1, a2) -- Line: 279
            return a1.ChildContainer
        end,
        GenerateState = function(a1_2) -- Line: 282 -- upvalues: a1 (val)
            a1_2.state.index = a1_2.parentWidget.state.index
            a1_2.state.index.ConnectedWidgets[a1_2.ID] = a1_2
            if a1_2.state.isOpened == nil then
                a1_2.state.isOpened = a1._widgetState(a1_2, "isOpened", true)
            end
        end,
        UpdateState = function(a1_2) -- Line: 290 -- upvalues: a1 (val), closeTab (val)
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            if a1_2.state.isOpened.lastChangeTick == a1._cycleTick then
                if a1_2.state.isOpened.value ~= true then
                    a1_2.lastClosedTick = a1._cycleTick + 1
                    closeTab(a1_2.parentWidget, a1_2.Index)
                    Instance.Visible = false
                else
                    a1_2.lastOpenedTick = a1._cycleTick + 1
                    local parentWidget = a1_2.parentWidget
                    local Index = a1_2.Index
                    if not (0 < parentWidget.state.index.value) then
                        parentWidget.state.index:set(Index)
                    end
                    Instance.Visible = true
                end
            end
            if a1_2.state.index.lastChangeTick == a1._cycleTick then
                if a1_2.state.index.value == a1_2.Index then
                    a1_2.ButtonColors.Color = a1._config.TabActiveColor
                    a1_2.ButtonColors.Transparency = a1._config.TabActiveTransparency
                    Instance.BackgroundColor3 = a1._config.TabActiveColor
                    Instance.BackgroundTransparency = a1._config.TabActiveTransparency
                    ChildContainer.Visible = true
                    a1_2.lastSelectedTick = a1._cycleTick + 1
                    return
                end
                a1_2.ButtonColors.Color = a1._config.TabColor
                a1_2.ButtonColors.Transparency = a1._config.TabTransparency
                Instance.BackgroundColor3 = a1._config.TabColor
                Instance.BackgroundTransparency = a1._config.TabTransparency
                ChildContainer.Visible = false
                a1_2.lastUnselectedTick = a1._cycleTick + 1
            end
        end,
        Discard = function(a1) -- Line: 324 -- upvalues: closeTab (val), a2 (val)
            if a1.state.isOpened.value == true then
                closeTab(a1.parentWidget, a1.Index)
            end
            a1.Instance:Destroy()
            a1.ChildContainer:Destroy()
            a2.discardState(a1)
        end,
    })
end