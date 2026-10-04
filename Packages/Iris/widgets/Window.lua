-- Script path: ReplicatedStorage.Packages.Iris.widgets.Window
-- Decompile time: 22.94 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local function relocateTooltips() -- Line: 4 -- upvalues: a1 (val), a2 (val)
        if a1._rootInstance == nil then
            return
        end
        local PopupScreenGui = a1._rootInstance:FindFirstChild("PopupScreenGui")
        local TooltipContainer = PopupScreenGui.TooltipContainer
        local v1 = a2.findBestWindowPosForPopup(
            a2.getMouseLocation(),
            TooltipContainer.AbsoluteSize,
            a1._config.DisplaySafeAreaPadding,
            PopupScreenGui.AbsoluteSize
        )
        TooltipContainer.Position = UDim2.fromOffset(v1.X, v1.Y)
    end

    a2.registerEvent("InputChanged", function() -- Line: 15 -- upvalues: a1 (val), relocateTooltips (val)
        if not a1._started then
            return
        end
        relocateTooltips()
    end)
    a1.WidgetConstructor("Tooltip", {
        hasState = false,
        hasChildren = false,
        Args = {Text = 1},
        Events = {},
        Generate = function(a1_2) -- Line: 30 -- upvalues: a1 (val), a2 (val)
            a1_2.parentWidget = a1._rootWidget
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Tooltip"
            Frame.Size = UDim2.new(a1._config.ContentWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BorderSizePixel = 0
            Frame.BackgroundTransparency = 1
            Frame.ZIndex = 1
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TooltipText"
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BackgroundColor3 = a1._config.PopupBgColor
            TextLabel.BackgroundTransparency = a1._config.PopupBgTransparency
            TextLabel.TextWrapped = a1._config.TextWrapped
            a2.applyTextStyle(TextLabel)
            a2.UIStroke(TextLabel, a1._config.PopupBorderSize, a1._config.BorderActiveColor, a1._config.BorderActiveTransparency)
            a2.UIPadding(TextLabel, a1._config.WindowPadding)
            if 0 < a1._config.PopupRounding then
                a2.UICorner(TextLabel, a1._config.PopupRounding)
            end
            TextLabel.Parent = Frame
            return Frame
        end,
        Update = function(a1) -- Line: 60 -- upvalues: relocateTooltips (val)
            local TooltipText = a1.Instance.TooltipText
            if a1.arguments.Text == nil then
                error("Text argument is required for Iris.Tooltip().", 5)
            end
            TooltipText.Text = a1.arguments.Text
            relocateTooltips()
        end,
        Discard = function(a1) -- Line: 69
            a1.Instance:Destroy()
        end,
    })
    local u17 = 0
    local u18 = nil
    local u19 = false
    local u20 = nil
    local u21 = nil
    local u22 = false
    local u23 = false
    local u24 = false
    local Top = Enum.TopBottom.Top
    local Left = Enum.LeftRight.Left
    local u27 = nil
    local u28 = nil
    local u29 = false
    local u30 = {}

    local function quickSwapWindows() -- Line: 93 -- upvalues: a1 (val), u30 (val)
        local DisplayOrder
        if a1._config.UseScreenGUIs == false then
            return
        end
        local v1 = 65535
        local v2 = nil
        for i, j in u30 do
            if j.state.isOpened.value and not j.arguments.NoNav and j.Instance:IsA("ScreenGui") then
                DisplayOrder = j.Instance.DisplayOrder
                if DisplayOrder < v1 then
                    v2 = j
                end
            end
        end
        if not v2 then
            return
        end
        if v2.state.isUncollapsed.value == false then
            v2.state.isUncollapsed:set(true)
        end
        a1.SetFocusedWindow(v2)
    end

    local function fitSizeToWindowBounds(a1_2, a2_2) -- Line: 124
        -- upvalues: a1 (val), a2 (val)
        local v1 = Vector2.new(a1_2.state.position.value.X, a1_2.state.position.value.Y)
        local v2 = (a1._config.TextSize + 2 * a1._config.FramePadding.Y) * 2
        local v3 = a2.getScreenSizeForWindow(a1_2)
        local v4 = Vector2.new(
            a1._config.WindowBorderSize + a1._config.DisplaySafeAreaPadding.X,
            a1._config.WindowBorderSize + a1._config.DisplaySafeAreaPadding.Y
        )
        local v5 = v3 - v1 - v4
        return Vector2.new(math.clamp(a2_2.X, v2, (math.max(v5.X, v2))), (math.clamp(a2_2.Y, v2, (math.max(v5.Y, v2)))))
    end

    local function fitPositionToWindowBounds(a1_2, a2_2) -- Line: 134
        -- upvalues: a2 (val), a1 (val)
        local Instance = a1_2.Instance
        local v1 = a2.getScreenSizeForWindow(a1_2)
        local v2 = Vector2.new(
            a1._config.WindowBorderSize + a1._config.DisplaySafeAreaPadding.X,
            a1._config.WindowBorderSize + a1._config.DisplaySafeAreaPadding.Y
        )
        return Vector2.new(
            math.clamp(a2_2.X, v2.X, (math.max(v2.X, v1.X - Instance.WindowButton.AbsoluteSize.X - v2.X))),
            (math.clamp(a2_2.Y, v2.Y, (math.max(v2.Y, v1.Y - Instance.WindowButton.AbsoluteSize.Y - v2.Y))))
        )
    end

    function a1.SetFocusedWindow(a1_2) -- Line: 145
        -- upvalues: u28 (ref), u29 (ref), u30 (val), a1 (val), u17 (ref), a2 (val)
        if u28 == a1_2 then
            return
        end
        if u29 and u28 ~= nil then
            if u30[u28.ID] then
                local WindowButton = u28.Instance.WindowButton
                local TitleBar = WindowButton.Content.TitleBar
                if not u28.state.isUncollapsed.value then
                    TitleBar.BackgroundColor3 = a1._config.TitleBgCollapsedColor
                    TitleBar.BackgroundTransparency = a1._config.TitleBgCollapsedTransparency
                else
                    TitleBar.BackgroundColor3 = a1._config.TitleBgColor
                    TitleBar.BackgroundTransparency = a1._config.TitleBgTransparency
                end
                WindowButton.UIStroke.Color = a1._config.BorderColor
            end
            u29 = false
            u28 = nil
        end
        if a1_2 ~= nil then
            u29 = true
            u28 = a1_2
            local Instance = a1_2.Instance
            local WindowButton_2 = Instance.WindowButton
            local TitleBar_2 = WindowButton_2.Content.TitleBar
            TitleBar_2.BackgroundColor3 = a1._config.TitleBgActiveColor
            TitleBar_2.BackgroundTransparency = a1._config.TitleBgActiveTransparency
            WindowButton_2.UIStroke.Color = a1._config.BorderActiveColor
            u17 = u17 + 1
            if not a1_2.usesScreenGuis then
                Instance.ZIndex = u17 + a1._config.DisplayOrderOffset
            else
                Instance.DisplayOrder = u17 + a1._config.DisplayOrderOffset
            end
            if a1_2.state.isUncollapsed.value == false then
                a1_2.state.isUncollapsed:set(true)
            end
            if a2.GuiService.SelectedObject then
                if TitleBar_2.Visible then
                    a2.GuiService:Select(TitleBar_2)
                    return
                end
                a2.GuiService:Select(a1_2.ChildContainer)
            end
        end
    end

    a2.registerEvent("InputBegan", function(a1_2) -- Line: 206
        -- upvalues: a1 (val), a2 (val), u30 (val), quickSwapWindows (val), u23 (ref), u24 (ref), u29 (ref), u28 (ref)
        -- upvalues: Top (ref), Left (ref), u22 (ref), u21 (ref)
        local v1, v2
        if not a1._started then
            return
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
            local Instance, ResizeBorder
            v1 = false
            v2 = a2.getMouseLocation()
            for i, j in u30 do
                Instance = j.Instance
                if Instance then
                    ResizeBorder = Instance.WindowButton.ResizeBorder
                    if ResizeBorder
                        and a2.isPosInsideRect(
                            v2,
                            ResizeBorder.AbsolutePosition - a2.GuiOffset,
                            ResizeBorder.AbsolutePosition - a2.GuiOffset + ResizeBorder.AbsoluteSize
                        ) then
                        v1 = true
                        break
                    end
                end
            end
            if not v1 then
                a1.SetFocusedWindow(nil)
            end
        end
        if a1_2.KeyCode == Enum.KeyCode.Tab then
            if a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
                or a2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                quickSwapWindows()
            end
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 and u23 and not u24 and u29 and u28 then
            v1 = u28.state.position.value + u28.state.size.value / 2
            v2 = a2.getMouseLocation() - v1
            local v3 = (math.abs(v2.X)) * u28.state.size.value.Y
            if not ((math.abs(v2.Y)) * u28.state.size.value.X <= v3) then
                Left = Enum.LeftRight.Center
                Top = if math.sign(v2.Y) ~= -1 then Enum.TopBottom.Bottom else Enum.TopBottom.Top
            else
                Top = Enum.TopBottom.Center
                Left = if math.sign(v2.X) ~= -1 then Enum.LeftRight.Right else Enum.LeftRight.Left
            end
            u22 = true
            u21 = u28
        end
    end)
    a2.registerEvent("TouchTapInWorld", function(a1_2, a2) -- Line: 252 -- upvalues: a1 (val) -- types: a2: boolean
        if not a1._started then
            return
        end
        if not a2 then
            a1.SetFocusedWindow(nil)
        end
    end)
    a2.registerEvent("InputChanged", function(a1_2) -- Line: 261
        -- upvalues: a1 (val), u19 (ref), u18 (ref), a2 (val), u20 (ref), fitPositionToWindowBounds (val), u22 (ref)
        -- upvalues: u21 (ref), u27 (ref), Left (ref), Top (ref), fitSizeToWindowBounds (val)
        local v1
        if not a1._started then
            return
        end
        if u19 and u18 then
            local v2
            if a1_2.UserInputType ~= Enum.UserInputType.Touch then
                v2 = a2.getMouseLocation()
            else
                local Position = a1_2.Position
                v2 = Vector2.new(Position.X, Position.Y)
            end
            local WindowButton = u18.Instance.WindowButton
            v1 = v2 - u20
            local v3 = fitPositionToWindowBounds(u18, v1)
            WindowButton.Position = UDim2.fromOffset(v3.X, v3.Y)
            u18.state.position.value = v3
        end
        if u22 and u21 and u21.arguments.NoResize ~= true then
            local WindowButton_2 = u21.Instance.WindowButton
            local v4 = Vector2.new(WindowButton_2.Position.X.Offset, WindowButton_2.Position.Y.Offset)
            v1 = Vector2.new(WindowButton_2.Size.X.Offset, WindowButton_2.Size.Y.Offset)
            local Delta = if a1_2.UserInputType ~= Enum.UserInputType.Touch then a2.getMouseLocation() - u27 else a1_2.Delta
            local new = Vector2.new
            local v5 = v4 + new(if Left ~= Enum.LeftRight.Left then 0 else Delta.X, if Top ~= Enum.TopBottom.Top then 0 else Delta.Y)
            local new_2 = Vector2.new
            local v6 = v1 + new_2(
                if Left ~= Enum.LeftRight.Left then if Left ~= Enum.LeftRight.Right then 0 else Delta.X else -Delta.X,
                if Top ~= Enum.TopBottom.Top then if Top ~= Enum.TopBottom.Bottom then 0 else Delta.Y else -Delta.Y
            )
            local v7 = fitSizeToWindowBounds(u21, v6)
            local v8 = fitPositionToWindowBounds(u21, v5)
            WindowButton_2.Size = UDim2.fromOffset(v7.X, v7.Y)
            u21.state.size.value = v7
            WindowButton_2.Position = UDim2.fromOffset(v8.X, v8.Y)
            u21.state.position.value = v8
        end
        u27 = a2.getMouseLocation()
    end)
    a2.registerEvent("InputEnded", function(a1_2, a2) -- Line: 315
        -- upvalues: a1 (val), u19 (ref), u18 (ref), u22 (ref), u21 (ref), quickSwapWindows (val)
        local Instance, WindowButton
        if not a1._started then
            return
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
            if u19 and u18 then
                WindowButton = u18.Instance.WindowButton
                u19 = false
                u18.state.position:set((Vector2.new(WindowButton.Position.X.Offset, WindowButton.Position.Y.Offset)))
            end
        elseif a1_2.UserInputType == Enum.UserInputType.Touch and u19 and u18 then
            WindowButton = u18.Instance.WindowButton
            u19 = false
            u18.state.position:set((Vector2.new(WindowButton.Position.X.Offset, WindowButton.Position.Y.Offset)))
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 then
            if u22 and u21 then
                Instance = u21.Instance
                u22 = false
                u21.state.size:set(Instance.WindowButton.AbsoluteSize)
            end
        elseif a1_2.UserInputType == Enum.UserInputType.Touch and u22 and u21 then
            Instance = u21.Instance
            u22 = false
            u21.state.size:set(Instance.WindowButton.AbsoluteSize)
        end
        if a1_2.KeyCode == Enum.KeyCode.ButtonX then
            quickSwapWindows()
        end
    end)
    a1.WidgetConstructor("Window", {
        hasState = true,
        hasChildren = true,
        Args = {
            Title = 1,
            NoTitleBar = 2,
            NoBackground = 3,
            NoCollapse = 4,
            NoClose = 5,
            NoMove = 6,
            NoScrollbar = 7,
            NoResize = 8,
            NoNav = 9,
            NoMenu = 10,
        },
        Events = {
            closed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 355 -- upvalues: a1 (val)
                    return a1_2.lastClosedTick == a1._cycleTick
                end,
            },
            opened = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 361 -- upvalues: a1 (val)
                    return a1_2.lastOpenedTick == a1._cycleTick
                end,
            },
            collapsed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 367 -- upvalues: a1 (val)
                    return a1_2.lastCollapsedTick == a1._cycleTick
                end,
            },
            uncollapsed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 373 -- upvalues: a1 (val)
                    return a1_2.lastUncollapsedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 377
                return a1.Instance.WindowButton
            end),
        },
        Generate = function(a1_2) -- Line: 382
            -- upvalues: a1 (val), u30 (val), a2 (val), u18 (ref), u19 (ref), u20 (ref), u29 (ref), u28 (ref), u22 (ref)
            -- upvalues: Top (ref), Left (ref), u21 (ref), u23 (ref), u24 (ref)
            local v1
            a1_2.parentWidget = a1._rootWidget
            a1_2.usesScreenGuis = a1._config.UseScreenGUIs
            u30[a1_2.ID] = a1_2
            if not a1_2.usesScreenGuis then
                v1 = Instance.new("Frame")
                v1.AnchorPoint = Vector2.new(0.5, 0.5)
                v1.Position = UDim2.new(0.5, 0, 0.5, 0)
                v1.Size = UDim2.new(1, 0, 1, 0)
                v1.BackgroundTransparency = 1
                v1.ZIndex = a1._config.DisplayOrderOffset
            else
                v1 = Instance.new("ScreenGui")
                v1.ResetOnSpawn = false
                v1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                v1.DisplayOrder = a1._config.DisplayOrderOffset
                v1.IgnoreGuiInset = a1._config.IgnoreGuiInset
            end
            v1.Name = "Iris_Window"
            local v2 = a1._config.TextSize + (a1._config.FramePadding.Y - 1) * 2
            local TextButton = Instance.new("TextButton")
            TextButton.Name = "WindowButton"
            TextButton.Size = UDim2.fromOffset(0, 0)
            TextButton.BackgroundTransparency = 1
            TextButton.BorderSizePixel = 0
            TextButton.Text = ""
            TextButton.ClipsDescendants = false
            TextButton.AutoButtonColor = false
            TextButton.Selectable = false
            TextButton.SelectionImageObject = a1.SelectionImageObject
            TextButton.SelectionGroup = true
            TextButton.SelectionBehaviorUp = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorDown = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorLeft = Enum.SelectionBehavior.Stop
            TextButton.SelectionBehaviorRight = Enum.SelectionBehavior.Stop
            a2.UIStroke(TextButton, a1._config.WindowBorderSize, a1._config.BorderColor, a1._config.BorderTransparency)
            TextButton.Parent = v1
            a2.applyInputBegan(TextButton, function(a1_3) -- Line: 428
                -- upvalues: a1_2 (val), a1 (upval), u18 (upval), u19 (upval), u20 (upval), a2 (upval)
                if a1_3.UserInputType ~= Enum.UserInputType.MouseMovement
                    and a1_3.UserInputType ~= Enum.UserInputType.Keyboard then
                    if a1_2.state.isUncollapsed.value then
                        a1.SetFocusedWindow(a1_2)
                    end
                    if not a1_2.arguments.NoMove and a1_3.UserInputType == Enum.UserInputType.MouseButton1 then
                        u18 = a1_2
                        u19 = true
                        u20 = a2.getMouseLocation() - a1_2.state.position.value
                    end
                    return
                end
            end)
            local Frame = Instance.new("Frame")
            Frame.Name = "Content"
            Frame.AnchorPoint = Vector2.new(0.5, 0.5)
            Frame.Position = UDim2.fromScale(0.5, 0.5)
            Frame.Size = UDim2.fromScale(1, 1)
            Frame.BackgroundTransparency = 1
            Frame.ClipsDescendants = true
            Frame.Parent = TextButton
            local v3 = a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            v3.HorizontalAlignment = Enum.HorizontalAlignment.Center
            v3.VerticalAlignment = Enum.VerticalAlignment.Top
            local ScrollingFrame = Instance.new("ScrollingFrame")
            ScrollingFrame.Name = "ChildContainer"
            ScrollingFrame.AutomaticSize = Enum.AutomaticSize.None
            ScrollingFrame.Size = UDim2.new(1, 0, 1, -v2)
            ScrollingFrame.Position = UDim2.fromOffset(0, 0)
            ScrollingFrame.BackgroundColor3 = a1._config.WindowBgColor
            ScrollingFrame.BackgroundTransparency = a1._config.WindowBgTransparency
            ScrollingFrame.BorderSizePixel = 0
            ScrollingFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
            ScrollingFrame.ScrollBarImageTransparency = a1._config.ScrollbarGrabTransparency
            ScrollingFrame.ScrollBarImageColor3 = a1._config.ScrollbarGrabColor
            ScrollingFrame.CanvasSize = UDim2.fromScale(0, 0)
            ScrollingFrame.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
            ScrollingFrame.TopImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.MidImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.BottomImage = a2.ICONS.BLANK_SQUARE
            ScrollingFrame.LayoutOrder = a1_2.ZIndex + 65535
            ScrollingFrame.ClipsDescendants = true
            a2.UIPadding(ScrollingFrame, a1._config.WindowPadding)
            ScrollingFrame.Parent = Frame
            local UIFlexItem = Instance.new("UIFlexItem")
            UIFlexItem.FlexMode = Enum.UIFlexMode.Fill
            UIFlexItem.ItemLineAlignment = Enum.ItemLineAlignment.End
            UIFlexItem.Parent = ScrollingFrame
            ;(ScrollingFrame:GetPropertyChangedSignal("CanvasPosition")):Connect(function() -- Line: 485 -- upvalues: a1_2 (val), ScrollingFrame (val)
                a1_2.state.scrollDistance.value = ScrollingFrame.CanvasPosition.Y
            end)
            a2.applyInputBegan(ScrollingFrame, function(a1_3) -- Line: 490 -- upvalues: a1_2 (val), a1 (upval) -- types: a1_3: userdata
                if a1_3.UserInputType ~= Enum.UserInputType.MouseMovement
                    and a1_3.UserInputType ~= Enum.UserInputType.Keyboard then
                    if a1_2.state.isUncollapsed.value then
                        a1.SetFocusedWindow(a1_2)
                    end
                    return
                end
            end)
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "TerminatingFrame"
            Frame_2.Size = UDim2.fromOffset(0, a1._config.WindowPadding.Y + a1._config.FramePadding.Y)
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            Frame_2.LayoutOrder = 2147483632
            local v4 = a2.UIListLayout(ScrollingFrame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            v4.VerticalAlignment = Enum.VerticalAlignment.Top
            Frame_2.Parent = ScrollingFrame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "TitleBar"
            Frame_3.AutomaticSize = Enum.AutomaticSize.Y
            Frame_3.Size = UDim2.fromScale(1, 0)
            Frame_3.BorderSizePixel = 0
            Frame_3.ClipsDescendants = true
            Frame_3.Parent = Frame
            a2.UIPadding(Frame_3, Vector2.new(a1._config.FramePadding.X))
            local v5 = a2.UIListLayout(Frame_3, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v5.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyInputBegan(Frame_3, function(a1) -- Line: 522 -- upvalues: a1_2 (val), u18 (upval), u19 (upval), u20 (upval) -- types: a1: userdata
                if a1.UserInputType == Enum.UserInputType.Touch and not a1_2.arguments.NoMove then
                    u18 = a1_2
                    u19 = true
                    local Position = a1.Position
                    u20 = (Vector2.new(Position.X, Position.Y)) - a1_2.state.position.value
                end
            end)
            local TextButton_2 = Instance.new("TextButton")
            TextButton_2.Name = "CollapseButton"
            TextButton_2.AnchorPoint = Vector2.new(0, 0.5)
            TextButton_2.Size = UDim2.fromOffset(v2, v2)
            TextButton_2.Position = UDim2.new(0, 0, 0.5, 0)
            TextButton_2.AutomaticSize = Enum.AutomaticSize.None
            TextButton_2.BackgroundTransparency = 1
            TextButton_2.BorderSizePixel = 0
            TextButton_2.AutoButtonColor = false
            TextButton_2.Text = ""
            a2.UICorner(TextButton_2)
            TextButton_2.Parent = Frame_3
            a2.applyButtonClick(TextButton_2, function() -- Line: 549 -- upvalues: a1_2 (val)
                a1_2.state.isUncollapsed:set(not a1_2.state.isUncollapsed.value)
            end)
            a2.applyInteractionHighlights("Background", TextButton_2, TextButton_2, {
                Transparency = 1,
                Color = a1._config.ButtonColor,
                HoveredColor = a1._config.ButtonHoveredColor,
                HoveredTransparency = a1._config.ButtonHoveredTransparency,
                ActiveColor = a1._config.ButtonActiveColor,
                ActiveTransparency = a1._config.ButtonActiveTransparency,
            })
            local ImageLabel = Instance.new("ImageLabel")
            ImageLabel.Name = "Arrow"
            ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel.Size = UDim2.fromOffset(math.floor(v2 * 0.7), (math.floor(v2 * 0.7)))
            ImageLabel.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel.BackgroundTransparency = 1
            ImageLabel.BorderSizePixel = 0
            ImageLabel.Image = a2.ICONS.MULTIPLICATION_SIGN
            ImageLabel.ImageColor3 = a1._config.TextColor
            ImageLabel.ImageTransparency = a1._config.TextTransparency
            ImageLabel.Parent = TextButton_2
            local TextButton_3 = Instance.new("TextButton")
            TextButton_3.Name = "CloseButton"
            TextButton_3.AnchorPoint = Vector2.new(1, 0.5)
            TextButton_3.Size = UDim2.fromOffset(v2, v2)
            TextButton_3.Position = UDim2.new(1, 0, 0.5, 0)
            TextButton_3.AutomaticSize = Enum.AutomaticSize.None
            TextButton_3.BackgroundTransparency = 1
            TextButton_3.BorderSizePixel = 0
            TextButton_3.Text = ""
            TextButton_3.LayoutOrder = 2
            TextButton_3.AutoButtonColor = false
            a2.UICorner(TextButton_3)
            a2.applyButtonClick(TextButton_3, function() -- Line: 588 -- upvalues: a1_2 (val)
                a1_2.state.isOpened:set(false)
            end)
            a2.applyInteractionHighlights("Background", TextButton_3, TextButton_3, {
                Transparency = 1,
                Color = a1._config.ButtonColor,
                HoveredColor = a1._config.ButtonHoveredColor,
                HoveredTransparency = a1._config.ButtonHoveredTransparency,
                ActiveColor = a1._config.ButtonActiveColor,
                ActiveTransparency = a1._config.ButtonActiveTransparency,
            })
            TextButton_3.Parent = Frame_3
            local ImageLabel_2 = Instance.new("ImageLabel")
            ImageLabel_2.Name = "Icon"
            ImageLabel_2.AnchorPoint = Vector2.new(0.5, 0.5)
            ImageLabel_2.Size = UDim2.fromOffset(math.floor(v2 * 0.7), (math.floor(v2 * 0.7)))
            ImageLabel_2.Position = UDim2.fromScale(0.5, 0.5)
            ImageLabel_2.BackgroundTransparency = 1
            ImageLabel_2.BorderSizePixel = 0
            ImageLabel_2.Image = a2.ICONS.MULTIPLICATION_SIGN
            ImageLabel_2.ImageColor3 = a1._config.TextColor
            ImageLabel_2.ImageTransparency = a1._config.TextTransparency
            ImageLabel_2.Parent = TextButton_3
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "Title"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.BorderSizePixel = 0
            TextLabel.BackgroundTransparency = 1
            TextLabel.LayoutOrder = 1
            TextLabel.ClipsDescendants = true
            a2.UIPadding(TextLabel, Vector2.new(0, a1._config.FramePadding.Y))
            a2.applyTextStyle(TextLabel)
            TextLabel.TextXAlignment = Enum.TextXAlignment[a1._config.WindowTitleAlign.Name]
            local UIFlexItem_2 = Instance.new("UIFlexItem")
            UIFlexItem_2.FlexMode = Enum.UIFlexMode.Fill
            UIFlexItem_2.ItemLineAlignment = Enum.ItemLineAlignment.Center
            UIFlexItem_2.Parent = TextLabel
            TextLabel.Parent = Frame_3
            local v6 = a1._config.TextSize + a1._config.FramePadding.X
            local ImageButton = Instance.new("ImageButton")
            ImageButton.Name = "LeftResizeGrip"
            ImageButton.AnchorPoint = Vector2.yAxis
            ImageButton.Rotation = 180
            ImageButton.Size = UDim2.fromOffset(v6, v6)
            ImageButton.Position = UDim2.fromScale(0, 1)
            ImageButton.BackgroundTransparency = 1
            ImageButton.BorderSizePixel = 0
            ImageButton.Image = a2.ICONS.BOTTOM_RIGHT_CORNER
            ImageButton.ImageColor3 = a1._config.ResizeGripColor
            ImageButton.ImageTransparency = 1
            ImageButton.AutoButtonColor = false
            ImageButton.ZIndex = 3
            ImageButton.Parent = TextButton
            a2.applyInteractionHighlights("Image", ImageButton, ImageButton, {
                Transparency = 1,
                Color = a1._config.ResizeGripColor,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            a2.applyButtonDown(ImageButton, function() -- Line: 663
                -- upvalues: u29 (upval), u28 (upval), a1_2 (val), a1 (upval), u22 (upval), Top (upval), Left (upval)
                -- upvalues: u21 (upval)
                if not u29 or u28 ~= a1_2 then
                    a1.SetFocusedWindow(a1_2)
                end
                u22 = true
                Top = Enum.TopBottom.Bottom
                Left = Enum.LeftRight.Left
                u21 = a1_2
            end)
            local ImageButton_2 = Instance.new("ImageButton")
            ImageButton_2.Name = "RightResizeGrip"
            ImageButton_2.AnchorPoint = Vector2.one
            ImageButton_2.Rotation = 90
            ImageButton_2.Size = UDim2.fromOffset(v6, v6)
            ImageButton_2.Position = UDim2.fromScale(1, 1)
            ImageButton_2.BackgroundTransparency = 1
            ImageButton_2.BorderSizePixel = 0
            ImageButton_2.Image = a2.ICONS.BOTTOM_RIGHT_CORNER
            ImageButton_2.ImageColor3 = a1._config.ResizeGripColor
            ImageButton_2.ImageTransparency = a1._config.ResizeGripTransparency
            ImageButton_2.AutoButtonColor = false
            ImageButton_2.ZIndex = 3
            ImageButton_2.Parent = TextButton
            a2.applyInteractionHighlights("Image", ImageButton_2, ImageButton_2, {
                Color = a1._config.ResizeGripColor,
                Transparency = a1._config.ResizeGripTransparency,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            a2.applyButtonDown(ImageButton_2, function() -- Line: 699
                -- upvalues: u29 (upval), u28 (upval), a1_2 (val), a1 (upval), u22 (upval), Top (upval), Left (upval)
                -- upvalues: u21 (upval)
                if not u29 or u28 ~= a1_2 then
                    a1.SetFocusedWindow(a1_2)
                end
                u22 = true
                Top = Enum.TopBottom.Bottom
                Left = Enum.LeftRight.Right
                u21 = a1_2
            end)
            local ImageButton_3 = Instance.new("ImageButton")
            ImageButton_3.Name = "LeftResizeBorder"
            ImageButton_3.AnchorPoint = Vector2.new(1, 0.5)
            ImageButton_3.Position = UDim2.fromScale(0, 0.5)
            ImageButton_3.Size = UDim2.new(0, a1._config.WindowResizePadding.X, 1, 2 * a1._config.WindowBorderSize)
            ImageButton_3.Transparency = 1
            ImageButton_3.Image = a2.ICONS.BORDER
            ImageButton_3.ResampleMode = Enum.ResamplerMode.Pixelated
            ImageButton_3.ScaleType = Enum.ScaleType.Slice
            ImageButton_3.SliceCenter = Rect.new(0, 0, 1, 1)
            ImageButton_3.ImageRectOffset = Vector2.new(2, 2)
            ImageButton_3.ImageRectSize = Vector2.new(2, 1)
            ImageButton_3.ImageTransparency = 1
            ImageButton_3.ZIndex = 4
            ImageButton_3.AutoButtonColor = false
            ImageButton_3.Parent = TextButton
            local ImageButton_4 = Instance.new("ImageButton")
            ImageButton_4.Name = "RightResizeBorder"
            ImageButton_4.AnchorPoint = Vector2.new(0, 0.5)
            ImageButton_4.Position = UDim2.fromScale(1, 0.5)
            ImageButton_4.Size = UDim2.new(0, a1._config.WindowResizePadding.X, 1, 2 * a1._config.WindowBorderSize)
            ImageButton_4.Transparency = 1
            ImageButton_4.Image = a2.ICONS.BORDER
            ImageButton_4.ResampleMode = Enum.ResamplerMode.Pixelated
            ImageButton_4.ScaleType = Enum.ScaleType.Slice
            ImageButton_4.SliceCenter = Rect.new(1, 0, 2, 1)
            ImageButton_4.ImageRectOffset = Vector2.new(1, 2)
            ImageButton_4.ImageRectSize = Vector2.new(2, 1)
            ImageButton_4.ImageTransparency = 1
            ImageButton_4.ZIndex = 4
            ImageButton_4.AutoButtonColor = false
            ImageButton_4.Parent = TextButton
            local ImageButton_5 = Instance.new("ImageButton")
            ImageButton_5.Name = "TopResizeBorder"
            ImageButton_5.AnchorPoint = Vector2.new(0.5, 1)
            ImageButton_5.Position = UDim2.fromScale(0.5, 0)
            ImageButton_5.Size = UDim2.new(1, 2 * a1._config.WindowBorderSize, 0, a1._config.WindowResizePadding.Y)
            ImageButton_5.Transparency = 1
            ImageButton_5.Image = a2.ICONS.BORDER
            ImageButton_5.ResampleMode = Enum.ResamplerMode.Pixelated
            ImageButton_5.ScaleType = Enum.ScaleType.Slice
            ImageButton_5.SliceCenter = Rect.new(0, 0, 1, 1)
            ImageButton_5.ImageRectOffset = Vector2.new(2, 2)
            ImageButton_5.ImageRectSize = Vector2.new(1, 2)
            ImageButton_5.ImageTransparency = 1
            ImageButton_5.ZIndex = 4
            ImageButton_5.AutoButtonColor = false
            ImageButton_5.Parent = TextButton
            local ImageButton_6 = Instance.new("ImageButton")
            ImageButton_6.Name = "BottomResizeBorder"
            ImageButton_6.AnchorPoint = Vector2.new(0.5, 0)
            ImageButton_6.Position = UDim2.fromScale(0.5, 1)
            ImageButton_6.Size = UDim2.new(1, 2 * a1._config.WindowBorderSize, 0, a1._config.WindowResizePadding.Y)
            ImageButton_6.Transparency = 1
            ImageButton_6.Image = a2.ICONS.BORDER
            ImageButton_6.ResampleMode = Enum.ResamplerMode.Pixelated
            ImageButton_6.ScaleType = Enum.ScaleType.Slice
            ImageButton_6.SliceCenter = Rect.new(0, 1, 1, 2)
            ImageButton_6.ImageRectOffset = Vector2.new(2, 1)
            ImageButton_6.ImageRectSize = Vector2.new(1, 2)
            ImageButton_6.ImageTransparency = 1
            ImageButton_6.ZIndex = 4
            ImageButton_6.AutoButtonColor = false
            ImageButton_6.Parent = TextButton
            a2.applyInteractionHighlights("Image", ImageButton_3, ImageButton_3, {
                Transparency = 1,
                Color = a1._config.ResizeGripColor,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            a2.applyInteractionHighlights("Image", ImageButton_4, ImageButton_4, {
                Transparency = 1,
                Color = a1._config.ResizeGripColor,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            a2.applyInteractionHighlights("Image", ImageButton_5, ImageButton_5, {
                Transparency = 1,
                Color = a1._config.ResizeGripColor,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            a2.applyInteractionHighlights("Image", ImageButton_6, ImageButton_6, {
                Transparency = 1,
                Color = a1._config.ResizeGripColor,
                HoveredColor = a1._config.ResizeGripHoveredColor,
                HoveredTransparency = a1._config.ResizeGripHoveredTransparency,
                ActiveColor = a1._config.ResizeGripActiveColor,
                ActiveTransparency = a1._config.ResizeGripActiveTransparency,
            })
            local Frame_4 = Instance.new("Frame")
            Frame_4.Name = "ResizeBorder"
            Frame_4.Size = UDim2.new(1, a1._config.WindowResizePadding.X * 2, 1, a1._config.WindowResizePadding.Y * 2)
            Frame_4.Position = UDim2.fromOffset(-a1._config.WindowResizePadding.X, -a1._config.WindowResizePadding.Y)
            Frame_4.BackgroundTransparency = 1
            Frame_4.BorderSizePixel = 0
            Frame_4.Active = true
            Frame_4.Selectable = false
            Frame_4.ClipsDescendants = false
            Frame_4.Parent = TextButton
            a2.applyMouseEnter(Frame_4, function() -- Line: 829 -- upvalues: u28 (upval), a1_2 (val), u23 (upval)
                if u28 == a1_2 then
                    u23 = true
                end
            end)
            a2.applyMouseLeave(Frame_4, function() -- Line: 834 -- upvalues: u28 (upval), a1_2 (val), u23 (upval)
                if u28 == a1_2 then
                    u23 = false
                end
            end)
            a2.applyInputBegan(Frame_4, function(a1_3) -- Line: 839 -- upvalues: a1_2 (val), a1 (upval) -- types: a1_3: userdata
                if a1_3.UserInputType ~= Enum.UserInputType.MouseMovement
                    and a1_3.UserInputType ~= Enum.UserInputType.Keyboard then
                    if a1_2.state.isUncollapsed.value then
                        a1.SetFocusedWindow(a1_2)
                    end
                    return
                end
            end)
            a2.applyMouseEnter(TextButton, function() -- Line: 848 -- upvalues: u28 (upval), a1_2 (val), u24 (upval)
                if u28 == a1_2 then
                    u24 = true
                end
            end)
            a2.applyMouseLeave(TextButton, function() -- Line: 853 -- upvalues: u28 (upval), a1_2 (val), u24 (upval)
                if u28 == a1_2 then
                    u24 = false
                end
            end)
            a1_2.ChildContainer = ScrollingFrame
            return v1
        end,
        Update = function(a1_2) -- Line: 862 -- upvalues: a1 (val)
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            local WindowButton = Instance.WindowButton
            local Content = WindowButton.Content
            local TitleBar = Content.TitleBar
            local Title = TitleBar.Title
            local MenuBar = Content:FindFirstChild("MenuBar")
            local LeftResizeGrip = WindowButton.LeftResizeGrip
            local RightResizeGrip = WindowButton.RightResizeGrip
            local LeftResizeBorder = WindowButton.LeftResizeBorder
            local RightResizeBorder = WindowButton.RightResizeBorder
            local TopResizeBorder = WindowButton.TopResizeBorder
            local BottomResizeBorder = WindowButton.BottomResizeBorder
            if a1_2.arguments.NoResize == true then
                LeftResizeGrip.Visible = false
                RightResizeGrip.Visible = false
                LeftResizeBorder.Visible = false
                RightResizeBorder.Visible = false
                TopResizeBorder.Visible = false
                BottomResizeBorder.Visible = false
            else
                LeftResizeGrip.Visible = true
                RightResizeGrip.Visible = true
                LeftResizeBorder.Visible = true
                RightResizeBorder.Visible = true
                TopResizeBorder.Visible = true
                BottomResizeBorder.Visible = true
            end
            if not a1_2.arguments.NoScrollbar then
                ChildContainer.ScrollBarThickness = a1._config.ScrollbarSize
            else
                ChildContainer.ScrollBarThickness = 0
            end
            if not a1_2.arguments.NoTitleBar then
                TitleBar.Visible = true
            else
                TitleBar.Visible = false
            end
            if MenuBar then
                if not a1_2.arguments.NoMenu then
                    MenuBar.Visible = true
                else
                    MenuBar.Visible = false
                end
            end
            if not a1_2.arguments.NoBackground then
                ChildContainer.BackgroundTransparency = a1._config.WindowBgTransparency
            else
                ChildContainer.BackgroundTransparency = 1
            end
            if not a1_2.arguments.NoCollapse then
                TitleBar.CollapseButton.Visible = true
            else
                TitleBar.CollapseButton.Visible = false
            end
            if not a1_2.arguments.NoClose then
                TitleBar.CloseButton.Visible = true
            else
                TitleBar.CloseButton.Visible = false
            end
            Title.Text = a1_2.arguments.Title or ""
        end,
        Discard = function(a1) -- Line: 929
            -- upvalues: u28 (ref), u29 (ref), u18 (ref), u19 (ref), u21 (ref), u22 (ref), u30 (val), a2 (val)
            if u28 == a1 then
                u28 = nil
                u29 = false
            end
            if u18 == a1 then
                u18 = nil
                u19 = false
            end
            if u21 == a1 then
                u21 = nil
                u22 = false
            end
            u30[a1.ID] = nil
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        ChildAdded = function(a1, a2) -- Line: 946
            local Content = a1.Instance.WindowButton.Content
            if a2.type ~= "MenuBar" then
                return a1.ChildContainer
            end
            local ChildContainer = a1.ChildContainer
            a2.Instance.ZIndex = ChildContainer.ZIndex + 1
            a2.Instance.LayoutOrder = ChildContainer.LayoutOrder - 1
            return Content
        end,
        UpdateState = function(a1_2) -- Line: 958 -- upvalues: a1 (val), a2 (val)
            local value_2 = a1_2.state.size.value
            local value_3 = a1_2.state.position.value
            local value_4 = a1_2.state.isUncollapsed.value
            local value_5 = a1_2.state.isOpened.value
            local value = a1_2.state.scrollDistance.value
            local Instance = a1_2.Instance
            local ChildContainer = a1_2.ChildContainer
            local WindowButton = Instance.WindowButton
            local Content = WindowButton.Content
            local TitleBar = Content.TitleBar
            local MenuBar = Content:FindFirstChild("MenuBar")
            local LeftResizeGrip = WindowButton.LeftResizeGrip
            local RightResizeGrip = WindowButton.RightResizeGrip
            local LeftResizeBorder = WindowButton.LeftResizeBorder
            local RightResizeBorder = WindowButton.RightResizeBorder
            local TopResizeBorder = WindowButton.TopResizeBorder
            local BottomResizeBorder = WindowButton.BottomResizeBorder
            WindowButton.Size = UDim2.fromOffset(value_2.X, value_2.Y)
            WindowButton.Position = UDim2.fromOffset(value_3.X, value_3.Y)
            if not value_5 then
                if not a1_2.usesScreenGuis then
                    Instance.Visible = false
                else
                    Instance.Enabled = false
                end
                WindowButton.Visible = false
                a1_2.lastClosedTick = a1._cycleTick + 1
            else
                if not a1_2.usesScreenGuis then
                    Instance.Visible = true
                else
                    Instance.Enabled = true
                end
                WindowButton.Visible = true
                a1_2.lastOpenedTick = a1._cycleTick + 1
            end
            if not value_4 then
                local Y = TitleBar.AbsoluteSize.Y
                TitleBar.CollapseButton.Arrow.Image = a2.ICONS.RIGHT_POINTING_TRIANGLE
                if MenuBar then
                    MenuBar.Visible = false
                end
                ChildContainer.Visible = false
                LeftResizeGrip.Visible = false
                RightResizeGrip.Visible = false
                LeftResizeBorder.Visible = false
                RightResizeBorder.Visible = false
                TopResizeBorder.Visible = false
                BottomResizeBorder.Visible = false
                WindowButton.Size = UDim2.fromOffset(value_2.X, Y)
                a1_2.lastCollapsedTick = a1._cycleTick + 1
            else
                TitleBar.CollapseButton.Arrow.Image = a2.ICONS.DOWN_POINTING_TRIANGLE
                if MenuBar then
                    MenuBar.Visible = not a1_2.arguments.NoMenu
                end
                ChildContainer.Visible = true
                if a1_2.arguments.NoResize ~= true then
                    LeftResizeGrip.Visible = true
                    RightResizeGrip.Visible = true
                    LeftResizeBorder.Visible = true
                    RightResizeBorder.Visible = true
                    TopResizeBorder.Visible = true
                    BottomResizeBorder.Visible = true
                end
                WindowButton.AutomaticSize = Enum.AutomaticSize.None
                a1_2.lastUncollapsedTick = a1._cycleTick + 1
            end
            if not value_5 or not value_4 then
                TitleBar.BackgroundColor3 = a1._config.TitleBgCollapsedColor
                TitleBar.BackgroundTransparency = a1._config.TitleBgCollapsedTransparency
                WindowButton.UIStroke.Color = a1._config.BorderColor
                a1.SetFocusedWindow(nil)
            else
                a1.SetFocusedWindow(a1_2)
            end
            if value and value ~= 0 then
                local u208 = #a1._postCycleCallbacks + 1
                local u211 = a1._cycleTick + 1

                a1._postCycleCallbacks[u208] = function() -- Line: 1049 -- upvalues: a1 (upval), u211 (val), a1_2 (val), ChildContainer (val), value (val), u208 (val)
                    if u211 <= a1._cycleTick then
                        if a1_2.lastCycleTick ~= -1 then
                            ChildContainer.CanvasPosition = Vector2.new(0, value)
                        end
                        a1._postCycleCallbacks[u208] = nil
                    end
                end
            end
        end,
        GenerateState = function(a1_2) -- Line: 1059
            -- upvalues: a1 (val), u29 (ref), u28 (ref), fitPositionToWindowBounds (val), fitSizeToWindowBounds (val)
            if a1_2.state.size == nil then
                a1_2.state.size = a1._widgetState(a1_2, "size", Vector2.new(400, 300))
            end
            if a1_2.state.position == nil then
                a1_2.state.position = a1._widgetState(
                    a1_2,
                    "position",
                    if not u29 then Vector2.new(150, 250) else if not u28 then Vector2.new(150, 250) else u28.state.position.value + Vector2.new(15, 45)
                )
            end
            a1_2.state.position.value = fitPositionToWindowBounds(a1_2, a1_2.state.position.value)
            a1_2.state.size.value = fitSizeToWindowBounds(a1_2, a1_2.state.size.value)
            if a1_2.state.isUncollapsed == nil then
                a1_2.state.isUncollapsed = a1._widgetState(a1_2, "isUncollapsed", true)
            end
            if a1_2.state.isOpened == nil then
                a1_2.state.isOpened = a1._widgetState(a1_2, "isOpened", true)
            end
            if a1_2.state.scrollDistance == nil then
                a1_2.state.scrollDistance = a1._widgetState(a1_2, "scrollDistance", 0)
            end
        end,
    })
end