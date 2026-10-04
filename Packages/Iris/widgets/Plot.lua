-- Script path: ReplicatedStorage.Packages.Iris.widgets.Plot
-- Decompile time: 18.81 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("ProgressBar", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, Format = 2},
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 13
                return a1.Instance
            end),
            changed = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 18 -- upvalues: a1 (val)
                    return a1_2.lastChangedTick == a1._cycleTick
                end,
            },
        },
        Generate = function(a1_2) -- Line: 23 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_ProgressBar"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new())
            Frame.BackgroundTransparency = 1
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Bar"
            Frame_2.Size = UDim2.new(a1._config.ContentWidth, a1._config.ContentHeight)
            Frame_2.BackgroundColor3 = a1._config.FrameBgColor
            Frame_2.BackgroundTransparency = a1._config.FrameBgTransparency
            Frame_2.BorderSizePixel = 0
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.ClipsDescendants = true
            a2.applyFrameStyle(Frame_2, true)
            Frame_2.Parent = Frame
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "Progress"
            TextLabel.AutomaticSize = Enum.AutomaticSize.Y
            TextLabel.Size = UDim2.new(UDim.new(0, 0), a1._config.ContentHeight)
            TextLabel.BackgroundColor3 = a1._config.PlotHistogramColor
            TextLabel.BackgroundTransparency = a1._config.PlotHistogramTransparency
            TextLabel.BorderSizePixel = 0
            a2.applyTextStyle(TextLabel)
            a2.UIPadding(TextLabel, a1._config.FramePadding)
            a2.UICorner(TextLabel, a1._config.FrameRounding)
            TextLabel.Text = ""
            TextLabel.Parent = Frame_2
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Value"
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_2.Size = UDim2.new(UDim.new(0, 0), a1._config.ContentHeight)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.ZIndex = 1
            a2.applyTextStyle(TextLabel_2)
            a2.UIPadding(TextLabel_2, a1._config.FramePadding)
            TextLabel_2.Parent = Frame_2
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Name = "TextLabel"
            TextLabel_3.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_3.AnchorPoint = Vector2.new(0, 0.5)
            TextLabel_3.BackgroundTransparency = 1
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.LayoutOrder = 1
            a2.applyTextStyle(TextLabel_3)
            a2.UIPadding(TextLabel_2, a1._config.FramePadding)
            TextLabel_3.Parent = Frame
            return Frame
        end,
        GenerateState = function(a1_2) -- Line: 90 -- upvalues: a1 (val)
            if a1_2.state.progress == nil then
                a1_2.state.progress = a1._widgetState(a1_2, "Progress", 0)
            end
        end,
        Update = function(a1) -- Line: 95
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local Value = Instance.Bar.Value
            if a1.arguments.Format ~= nil and typeof(a1.arguments.Format) == "string" then
                Value.Text = a1.arguments.Format
            end
            TextLabel.Text = a1.arguments.Text or "Progress Bar"
        end,
        UpdateState = function(a1_2) -- Line: 107 -- upvalues: a1 (val)
            local Bar = a1_2.Instance.Bar
            local Progress = Bar.Progress
            local Value = Bar.Value
            local v1 = math.clamp(a1_2.state.progress.value, 0, 1)
            local X = Bar.AbsoluteSize.X
            local X_2 = Value.AbsoluteSize.X
            if not (X * (1 - v1) < X_2) then
                Value.AnchorPoint = Vector2.zero
                Value.Position = UDim2.new(v1, 0, 0, 0)
            else
                Value.AnchorPoint = Vector2.xAxis
                Value.Position = UDim2.fromScale(1, 0)
            end
            Progress.Size = UDim2.new(UDim.new(v1, 0), Progress.Size.Height)
            if a1_2.arguments.Format == nil or typeof(a1_2.arguments.Format) ~= "string" then
                Value.Text = string.format("%d%%", v1 * 100)
            else
                Value.Text = a1_2.arguments.Format
            end
            a1_2.lastChangedTick = a1._cycleTick + 1
        end,
        Discard = function(a1) -- Line: 133 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
    })

    local function createLine(a1_2, a2) -- Line: 139 -- upvalues: a1 (val) -- types: a1_2: userdata, a2: number
        local Frame = Instance.new("Frame")
        Frame.Name = tostring(a2)
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundColor3 = a1._config.PlotLinesColor
        Frame.BackgroundTransparency = a1._config.PlotLinesTransparency
        Frame.BorderSizePixel = 0
        Frame.Parent = a1_2
        return Frame
    end

    local function clearLine(a1_2) -- Line: 152 -- upvalues: a1 (val)
        if a1_2.HoveredLine then
            a1_2.HoveredLine.BackgroundColor3 = a1._config.PlotLinesColor
            a1_2.HoveredLine.BackgroundTransparency = a1._config.PlotLinesTransparency
            a1_2.HoveredLine = false
            a1_2.state.hovered:set(nil)
        end
    end

    local function updateLine(a1_2, a2_2) -- Line: 161 -- upvalues: a2 (val), a1 (val) -- types: a2_2: boolean?
        local Plot = a1_2.Instance.Background.Plot
        local v1 = math.ceil(((a2.getMouseLocation()).X - (Plot.AbsolutePosition - a2.GuiOffset).X) / Plot.AbsoluteSize.X * #a1_2.Lines)
        local v2 = a1_2.Lines[v1]
        if v2 then
            if v2 ~= a1_2.HoveredLine and not a2_2 and a1_2.HoveredLine then
                a1_2.HoveredLine.BackgroundColor3 = a1._config.PlotLinesColor
                a1_2.HoveredLine.BackgroundTransparency = a1._config.PlotLinesTransparency
                a1_2.HoveredLine = false
                a1_2.state.hovered:set(nil)
            end
            local v3 = a1_2.state.values.value[v1]
            local v4 = a1_2.state.values.value[v1 + 1]
            if v3 and v4 then
                if math.floor(v3) ~= v3 or math.floor(v4) ~= v4 then
                    a1_2.Tooltip.Text = ("%d: %.3f\n%d: %.3f"):format(v1, v3, v1 + 1, v4)
                else
                    a1_2.Tooltip.Text = ("%d: %d\n%d: %d"):format(v1, v3, v1 + 1, v4)
                end
            end
            a1_2.HoveredLine = v2
            v2.BackgroundColor3 = a1._config.PlotLinesHoveredColor
            v2.BackgroundTransparency = a1._config.PlotLinesHoveredTransparency
            if a2_2 then
                a1_2.state.hovered.value = {v3, v4}
                return
            end
            a1_2.state.hovered:set({v3, v4})
        end
    end

    a1.WidgetConstructor("PlotLines", {
        hasState = true,
        hasChildren = false,
        Args = {
            Text = 1,
            Height = 2,
            Min = 3,
            Max = 4,
            TextOverlay = 5,
        },
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 209
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 213 -- upvalues: a2 (val), a1 (val), updateLine (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_PlotLines"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Background"
            Frame_2.Size = UDim2.new(a1._config.ContentWidth, UDim.new(1, 0))
            Frame_2.BackgroundColor3 = a1._config.FrameBgColor
            Frame_2.BackgroundTransparency = a1._config.FrameBgTransparency
            a2.applyFrameStyle(Frame_2)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Plot"
            Frame_3.Size = UDim2.fromScale(1, 1)
            Frame_3.BackgroundTransparency = 1
            Frame_3.BorderSizePixel = 0
            Frame_3.ClipsDescendants = true
            ;(Frame_3:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 241 -- upvalues: a1_2 (val), a1 (upval)
                a1_2.state.values.lastChangeTick = a1._cycleTick
                a1._widgets.PlotLines.UpdateState(a1_2)
            end)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "OverlayText"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.AnchorPoint = Vector2.new(0.5, 0)
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.Position = UDim2.fromScale(0.5, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = 2
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame_3
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Iris_Tooltip"
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_2.Size = UDim2.fromOffset(0, 0)
            TextLabel_2.BackgroundColor3 = a1._config.PopupBgColor
            TextLabel_2.BackgroundTransparency = a1._config.PopupBgTransparency
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Visible = false
            a2.applyTextStyle(TextLabel_2)
            a2.UIStroke(TextLabel_2, a1._config.PopupBorderSize, a1._config.BorderActiveColor, a1._config.BorderActiveTransparency)
            a2.UIPadding(TextLabel_2, a1._config.WindowPadding)
            if 0 < a1._config.PopupRounding then
                a2.UICorner(TextLabel_2, a1._config.PopupRounding)
            end
            local _rootInstance = a1._rootInstance and a1._rootInstance:FindFirstChild("PopupScreenGui")
            TextLabel_2.Parent = _rootInstance and _rootInstance:FindFirstChild("TooltipContainer")
            a1_2.Tooltip = TextLabel_2
            a2.applyMouseMoved(Frame_3, function() -- Line: 281 -- upvalues: updateLine (upval), a1_2 (val)
                updateLine(a1_2)
            end)
            a2.applyMouseLeave(Frame_3, function() -- Line: 285 -- upvalues: a1_2 (val), a1 (upval)
                local v1 = a1_2
                if v1.HoveredLine then
                    v1.HoveredLine.BackgroundColor3 = a1._config.PlotLinesColor
                    v1.HoveredLine.BackgroundTransparency = a1._config.PlotLinesTransparency
                    v1.HoveredLine = false
                    v1.state.hovered:set(nil)
                end
            end)
            Frame_3.Parent = Frame_2
            a1_2.Lines = {}
            a1_2.HoveredLine = false
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Name = "TextLabel"
            TextLabel_3.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_3.Size = UDim2.fromOffset(0, 0)
            TextLabel_3.BackgroundTransparency = 1
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.ZIndex = a1_2.ZIndex + 3
            TextLabel_3.LayoutOrder = a1_2.ZIndex + 3
            a2.applyTextStyle(TextLabel_3)
            TextLabel_3.Parent = Frame
            return Frame
        end,
        GenerateState = function(a1_2) -- Line: 309 -- upvalues: a1 (val)
            if a1_2.state.values == nil then
                a1_2.state.values = a1._widgetState(a1_2, "values", {0, 1})
            end
            if a1_2.state.hovered == nil then
                a1_2.state.hovered = a1._widgetState(a1_2, "hovered", nil)
            end
        end,
        Update = function(a1) -- Line: 317
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local OverlayText = Instance.Background.Plot.OverlayText
            TextLabel.Text = a1.arguments.Text or "Plot Lines"
            OverlayText.Text = a1.arguments.TextOverlay or ""
            Instance.Size = UDim2.new(1, 0, 0, a1.arguments.Height or 0)
        end,
        UpdateState = function(a1_2) -- Line: 328 -- upvalues: a1 (val), updateLine (val)
            if a1_2.state.hovered.lastChangeTick == a1._cycleTick then
                if not a1_2.state.hovered.value then
                    a1_2.Tooltip.Visible = false
                else
                    a1_2.Tooltip.Visible = true
                end
            end
            if a1_2.state.values.lastChangeTick == a1._cycleTick then
                local v1, v2, v3, v4, v5, v6, v7
                local Plot = a1_2.Instance.Background.Plot
                local value = a1_2.state.values.value
                local v8 = #value - 1
                local v9 = #a1_2.Lines
                local Min = a1_2.arguments.Min
                local Max = a1_2.arguments.Max
                if Min == nil then
                    for i, j in value do
                        Min = math.min(Min or j, j)
                        Max = math.max(Max or j, j)
                    end
                elseif Max == nil then
                    for k, n in value do
                        Min = math.min(Min or n, n)
                        Max = math.max(Max or n, n)
                    end
                end
                if v9 < v8 then
                    local Frame, Lines
                    for i5 = v9 + 1, v8 do
                        Lines = a1_2.Lines
                        Frame = Instance.new("Frame")
                        Frame.Name = tostring(i5)
                        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
                        Frame.BackgroundColor3 = a1._config.PlotLinesColor
                        Frame.BackgroundTransparency = a1._config.PlotLinesTransparency
                        Frame.BorderSizePixel = 0
                        Frame.Parent = Plot
                        table.insert(Lines, Frame)
                    end
                    v1 = a1_2
                elseif not (v8 < v9) then
                    v1 = a1_2
                else
                    local v10
                    for m = v8 + 1, v9 do
                        v10 = table.remove(a1_2.Lines)
                        if v10 then
                            v10:Destroy()
                        end
                    end
                end
                local v11 = Max - Min
                local AbsoluteSize = Plot.AbsoluteSize
                for i6 = 1, v8 do
                    v2 = value[i6]
                    v3 = value[i6 + 1]
                    v4 = AbsoluteSize * Vector2.new((i6 - 1) / v8, (Max - v2) / v11)
                    v5 = AbsoluteSize * Vector2.new(i6 / v8, (Max - v3) / v11)
                    v6 = (v4 + v5) / 2
                    v7 = v1.Lines[i6]
                    v7.Size = UDim2.fromOffset((v5 - v4).Magnitude + 1, 1)
                    v7 = v1.Lines[i6]
                    v7.Position = UDim2.fromOffset(v6.X, v6.Y)
                    v7 = v1.Lines[i6]
                    v7.Rotation = math.atan2(v5.Y - v4.Y, v5.X - v4.X) * 57.29577951308232
                end
                if v1.HoveredLine then
                    updateLine(v1, true)
                end
            end
        end,
        Discard = function(a1) -- Line: 391 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a1.Tooltip:Destroy()
            a2.discardState(a1)
        end,
    })

    local function createBlock(a1_2, a2) -- Line: 398 -- upvalues: a1 (val) -- types: a1_2: userdata, a2: number
        local Frame = Instance.new("Frame")
        Frame.Name = tostring(a2)
        Frame.BackgroundColor3 = a1._config.PlotHistogramColor
        Frame.BackgroundTransparency = a1._config.PlotHistogramTransparency
        Frame.BorderSizePixel = 0
        Frame.Parent = a1_2
        return Frame
    end

    local function clearBlock(a1_2) -- Line: 410 -- upvalues: a1 (val)
        if a1_2.HoveredBlock then
            a1_2.HoveredBlock.BackgroundColor3 = a1._config.PlotHistogramColor
            a1_2.HoveredBlock.BackgroundTransparency = a1._config.PlotHistogramTransparency
            a1_2.HoveredBlock = false
            a1_2.state.hovered:set(nil)
        end
    end

    local function updateBlock(a1_2, a2_2) -- Line: 419 -- upvalues: a2 (val), a1 (val) -- types: a2_2: boolean?
        local Plot = a1_2.Instance.Background.Plot
        local v1 = math.ceil(((a2.getMouseLocation()).X - (Plot.AbsolutePosition - a2.GuiOffset).X) / Plot.AbsoluteSize.X * #a1_2.Blocks)
        local v2 = a1_2.Blocks[v1]
        if v2 then
            if v2 ~= a1_2.HoveredBlock and not a2_2 and a1_2.HoveredBlock then
                a1_2.HoveredBlock.BackgroundColor3 = a1._config.PlotHistogramColor
                a1_2.HoveredBlock.BackgroundTransparency = a1._config.PlotHistogramTransparency
                a1_2.HoveredBlock = false
                a1_2.state.hovered:set(nil)
            end
            local v3 = a1_2.state.values.value[v1]
            if v3 then
                local Tooltip = a1_2.Tooltip
                local v4 = if math.floor(v3) ~= v3 then ("%d: %.3f"):format(v1, v3) else ("%d: %d"):format(v1, v3)
                Tooltip.Text = v4
            end
            a1_2.HoveredBlock = v2
            v2.BackgroundColor3 = a1._config.PlotHistogramHoveredColor
            v2.BackgroundTransparency = a1._config.PlotHistogramHoveredTransparency
            if a2_2 then
                a1_2.state.hovered.value = v3
                return
            end
            a1_2.state.hovered:set(v3)
        end
    end

    a1.WidgetConstructor("PlotHistogram", {
        hasState = true,
        hasChildren = false,
        Args = {
            Text = 1,
            Height = 2,
            Min = 3,
            Max = 4,
            TextOverlay = 5,
            BaseLine = 6,
        },
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 463
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 467 -- upvalues: a2 (val), a1 (val), updateBlock (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_PlotHistogram"
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Background"
            Frame_2.Size = UDim2.new(a1._config.ContentWidth, UDim.new(1, 0))
            Frame_2.BackgroundColor3 = a1._config.FrameBgColor
            Frame_2.BackgroundTransparency = a1._config.FrameBgTransparency
            a2.applyFrameStyle(Frame_2)
            Frame_2.UIPadding.PaddingRight = UDim.new(0, a1._config.FramePadding.X - 1)
            Frame_2.Parent = Frame
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Plot"
            Frame_3.Size = UDim2.fromScale(1, 1)
            Frame_3.BackgroundTransparency = 1
            Frame_3.BorderSizePixel = 0
            Frame_3.ClipsDescendants = true
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "OverlayText"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.AnchorPoint = Vector2.new(0.5, 0)
            TextLabel.Size = UDim2.fromOffset(0, 0)
            TextLabel.Position = UDim2.fromScale(0.5, 0)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.ZIndex = 2
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame_3
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "Iris_Tooltip"
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_2.Size = UDim2.fromOffset(0, 0)
            TextLabel_2.BackgroundColor3 = a1._config.PopupBgColor
            TextLabel_2.BackgroundTransparency = a1._config.PopupBgTransparency
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.Visible = false
            a2.applyTextStyle(TextLabel_2)
            a2.UIStroke(TextLabel_2, a1._config.PopupBorderSize, a1._config.BorderActiveColor, a1._config.BorderActiveTransparency)
            a2.UIPadding(TextLabel_2, a1._config.WindowPadding)
            if 0 < a1._config.PopupRounding then
                a2.UICorner(TextLabel_2, a1._config.PopupRounding)
            end
            local _rootInstance = a1._rootInstance and a1._rootInstance:FindFirstChild("PopupScreenGui")
            TextLabel_2.Parent = _rootInstance and _rootInstance:FindFirstChild("TooltipContainer")
            a1_2.Tooltip = TextLabel_2
            a2.applyMouseMoved(Frame_3, function() -- Line: 533 -- upvalues: updateBlock (upval), a1_2 (val)
                updateBlock(a1_2)
            end)
            a2.applyMouseLeave(Frame_3, function() -- Line: 537 -- upvalues: a1_2 (val), a1 (upval)
                local v1 = a1_2
                if v1.HoveredBlock then
                    v1.HoveredBlock.BackgroundColor3 = a1._config.PlotHistogramColor
                    v1.HoveredBlock.BackgroundTransparency = a1._config.PlotHistogramTransparency
                    v1.HoveredBlock = false
                    v1.state.hovered:set(nil)
                end
            end)
            Frame_3.Parent = Frame_2
            a1_2.Blocks = {}
            a1_2.HoveredBlock = false
            local TextLabel_3 = Instance.new("TextLabel")
            TextLabel_3.Name = "TextLabel"
            TextLabel_3.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_3.Size = UDim2.fromOffset(0, 0)
            TextLabel_3.BackgroundTransparency = 1
            TextLabel_3.BorderSizePixel = 0
            TextLabel_3.ZIndex = a1_2.ZIndex + 3
            TextLabel_3.LayoutOrder = a1_2.ZIndex + 3
            a2.applyTextStyle(TextLabel_3)
            TextLabel_3.Parent = Frame
            return Frame
        end,
        GenerateState = function(a1_2) -- Line: 561 -- upvalues: a1 (val)
            if a1_2.state.values == nil then
                a1_2.state.values = a1._widgetState(a1_2, "values", {1})
            end
            if a1_2.state.hovered == nil then
                a1_2.state.hovered = a1._widgetState(a1_2, "hovered", nil)
            end
        end,
        Update = function(a1) -- Line: 569
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local OverlayText = Instance.Background.Plot.OverlayText
            TextLabel.Text = a1.arguments.Text or "Plot Histogram"
            OverlayText.Text = a1.arguments.TextOverlay or ""
            Instance.Size = UDim2.new(1, 0, 0, a1.arguments.Height or 0)
        end,
        UpdateState = function(a1_2) -- Line: 580 -- upvalues: a1 (val), updateBlock (val)
            if a1_2.state.hovered.lastChangeTick == a1._cycleTick then
                if not a1_2.state.hovered.value then
                    a1_2.Tooltip.Visible = false
                else
                    a1_2.Tooltip.Visible = true
                end
            end
            if a1_2.state.values.lastChangeTick == a1._cycleTick then
                local v1, v2, v3
                local Plot = a1_2.Instance.Background.Plot
                local value = a1_2.state.values.value
                local v4 = #value
                local v5 = #a1_2.Blocks
                local Min = a1_2.arguments.Min
                local Max = a1_2.arguments.Max
                local v6 = a1_2.arguments.BaseLine or 0
                if Min == nil then
                    for i, j in value do
                        Min = math.min(Min or j, j)
                        Max = math.max(Max or j, j)
                    end
                elseif Max == nil then
                    for k, n in value do
                        Min = math.min(Min or n, n)
                        Max = math.max(Max or n, n)
                    end
                end
                if v5 < v4 then
                    local Blocks, Frame
                    for i5 = v5 + 1, v4 do
                        Blocks = a1_2.Blocks
                        Frame = Instance.new("Frame")
                        Frame.Name = tostring(i5)
                        Frame.BackgroundColor3 = a1._config.PlotHistogramColor
                        Frame.BackgroundTransparency = a1._config.PlotHistogramTransparency
                        Frame.BorderSizePixel = 0
                        Frame.Parent = Plot
                        table.insert(Blocks, Frame)
                    end
                    v1 = a1_2
                elseif not (v4 < v5) then
                    v1 = a1_2
                else
                    local v7
                    for m = v4 + 1, v5 do
                        v7 = table.remove(a1_2.Blocks)
                        if v7 then
                            v7:Destroy()
                        end
                    end
                end
                local v8 = Max - Min
                local v9 = UDim.new(1 / v4, -1)
                for i6 = 1, v4 do
                    v2 = value[i6]
                    if not (v2 >= 0) then
                        v3 = v1.Blocks[i6]
                        v3.Size = UDim2.new(v9, UDim.new((v6 - v2) / v8))
                        v3 = v1.Blocks[i6]
                        v3.Position = UDim2.fromScale((i6 - 1) / v4, (Max - v6) / v8)
                    else
                        v3 = v1.Blocks[i6]
                        v3.Size = UDim2.new(v9, UDim.new((v2 - v6) / v8))
                        v3 = v1.Blocks[i6]
                        v3.Position = UDim2.fromScale((i6 - 1) / v4, (Max - v2) / v8)
                    end
                end
                if v1.HoveredBlock then
                    updateBlock(v1, true)
                end
            end
        end,
        Discard = function(a1) -- Line: 642 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a1.Tooltip:Destroy()
            a2.discardState(a1)
        end,
    })

    local function getBarColor(a1) -- Line: 651 -- types: a1: number
        return Color3.fromHSV((a1 - 1) * 0.15 % 1 % 1, 1, 1)
    end

    local function convertDuration(a1) -- Line: 657 -- types: a1: number
        local v1 = math.sign(a1)
        local v2 = math.abs(a1)
        local v3 = {
            [4] = "T",
            [3] = "G",
            [2] = "M",
            "k",
            [0] = " ",
            [-1] = "m",
            [-2] = "u",
            [-3] = "n",
            [-4] = "p",
        }
        local v4 = 0
        while v2 >= 1000 do
            v4 = v4 + 1
            v2 = v2 / 1000
        end
        while v2 ~= 0 do
            if not (v2 < 1) then
                break
            end
            v4 = v4 - 1
            v2 = v2 * 1000
        end
        if v2 >= 100 then
            v2 = math.floor(v2)
        elseif v2 >= 10 then
            v2 = math.floor(v2 * 10) / 10
        elseif v2 >= 1 then
            v2 = math.floor(v2 * 100) / 100
        end
        return v2 * v1 .. v3[v4] .. "s"
    end

    local function generateLegendFrame(a1_2, a2_2) -- Line: 696
        -- upvalues: a1 (val), a2 (val)
        local Frame = Instance.new("Frame")
        Frame.Size = UDim2.new(1, 0, 0, a1._config.FramePadding.Y * 2 + a1._config.TextSize)
        Frame.BackgroundTransparency = 1
        Frame.BorderSizePixel = 0
        Frame.Name = tostring(a2_2)
        Frame.LayoutOrder = a2_2
        local Frame_2 = Instance.new("Frame")
        Frame_2.Name = "Container"
        Frame_2.Size = UDim2.new(1, 0, 0, a1._config.FramePadding.Y * 2 + a1._config.TextSize)
        Frame_2.BackgroundTransparency = 1
        Frame_2.BorderSizePixel = 0
        a2.UIListLayout(Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
        local Frame_3 = Instance.new("Frame")
        Frame_3.Name = "ColorCode"
        Frame_3.Size = UDim2.new(1, -2, 1, -2)
        Frame_3.SizeConstraint = Enum.SizeConstraint.RelativeYY
        Frame_3.BorderSizePixel = 0
        a2.applyFrameStyle(Frame_3, true)
        Frame_3.BackgroundColor3 = Color3.fromHSV((a2_2 - 1) * 0.15 % 1 % 1, 1, 1)
        Frame_3.Parent = Frame_2
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "LegendName"
        TextLabel.Text = a1_2
        TextLabel.Size = UDim2.fromScale(0, 1)
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        local UIFlexItem = Instance.new("UIFlexItem")
        UIFlexItem.FlexMode = Enum.UIFlexMode.Grow
        a2.applyTextStyle(TextLabel)
        UIFlexItem.Parent = TextLabel
        TextLabel.Parent = Frame_2
        local TextLabel_2 = Instance.new("TextLabel")
        TextLabel_2.Name = "Duration"
        TextLabel_2.Text = "0ms"
        TextLabel_2.Size = UDim2.fromScale(0, 1)
        TextLabel_2.AutomaticSize = Enum.AutomaticSize.X
        TextLabel_2.BackgroundTransparency = 1
        TextLabel_2.BorderSizePixel = 0
        a2.applyTextStyle(TextLabel_2)
        TextLabel_2.TextColor3 = a1._config.TextDisabledColor
        TextLabel_2.Parent = Frame_2
        local Frame_4 = Instance.new("Frame")
        Frame_4.Name = "Bar"
        Frame_4.Size = UDim2.new(1, 0, 0, 1)
        Frame_4.Position = UDim2.fromScale(0, 1)
        Frame_4.BackgroundTransparency = 0
        Frame_4.BorderSizePixel = 0
        a2.applyFrameStyle(Frame_4, true)
        Frame_4.BackgroundColor3 = Color3.new(1, 1, 1)
        Frame_2.Parent = Frame
        Frame_4.Parent = Frame
        return Frame
    end

    a1.WidgetConstructor("PlotTimeGraph", {
        hasState = true,
        hasChildren = false,
        Args = {Name = 1, ValueNames = 2},
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 770
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 774 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_StackedGraph"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new())
            Frame.BackgroundTransparency = 1
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemInnerSpacing.Y))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local Frame_2 = Instance.new("Frame")
            Frame_2.Name = "Graph"
            Frame_2.Size = UDim2.new(a1._config.ContentWidth, UDim.new(0, 0))
            Frame_2.AutomaticSize = Enum.AutomaticSize.Y
            Frame_2.BackgroundTransparency = 1
            Frame_2.BorderSizePixel = 0
            local v2 = a2.UIListLayout(Frame_2, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v2.VerticalAlignment = Enum.VerticalAlignment.Center
            a2.applyFrameStyle(Frame_2, true)
            local v3 = a1._config.FramePadding.Y * 2 + a1._config.TextSize
            local Frame_3 = Instance.new("Frame")
            Frame_3.Name = "Bar"
            Frame_3.Size = UDim2.new(UDim.new(1, 0), UDim.new(0, v3))
            Frame_3.BackgroundColor3 = a1._config.FrameBgColor
            Frame_3.BackgroundTransparency = a1._config.FrameBgTransparency
            Frame_3.BorderSizePixel = 0
            local v4 = a2.UIListLayout(Frame_3, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v4.Padding = UDim.new(0, 0)
            a2.applyFrameStyle(Frame_3, true)
            a2.UIPadding(Frame_3, a1._config.FramePadding)
            a2.UICorner(Frame_3, a1._config.FrameRounding)
            local Frame_4 = Instance.new("Frame")
            Frame_4.Name = "Legend"
            Frame_4.Size = UDim2.new(a1._config.ContentWidth, UDim.new(0, 0))
            Frame_4.AutomaticSize = Enum.AutomaticSize.Y
            Frame_4.BackgroundTransparency = 1
            Frame_4.BorderSizePixel = 0
            Frame_4.LayoutOrder = 3
            a2.UIListLayout(Frame_4, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemInnerSpacing.X + 1))
            a2.applyFrameStyle(Frame_4, true)
            a2.UIPadding(Frame_4, a1._config.FramePadding)
            a2.UICorner(Frame_4, a1._config.FrameRounding)
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel.AnchorPoint = Vector2.new(0, 0.5)
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.LayoutOrder = 1
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame_2
            local TextLabel_2 = Instance.new("TextLabel")
            TextLabel_2.Name = "RunTime"
            TextLabel_2.Text = "Run Time: 0ms"
            TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
            TextLabel_2.AnchorPoint = Vector2.new(0, 0.5)
            TextLabel_2.BackgroundTransparency = 1
            TextLabel_2.BorderSizePixel = 0
            TextLabel_2.LayoutOrder = 2
            a2.applyTextStyle(TextLabel_2)
            TextLabel_2.TextColor3 = a1._config.TextDisabledColor
            TextLabel_2.Parent = Frame
            Frame_3.Parent = Frame_2
            Frame_4.Parent = Frame
            Frame_2.Parent = Frame
            return Frame
        end,
        GenerateState = function(a1_2) -- Line: 848 -- upvalues: a1 (val)
            if a1_2.state.values == nil then
                a1_2.state.values = a1._widgetState(a1_2, "Values", {})
            end
        end,
        Update = function(a1) -- Line: 853
            a1.Instance.Graph.TextLabel.Text = a1.arguments.Name or "Time Graph"
        end,
        UpdateState = function(a1_2) -- Line: 859 -- upvalues: convertDuration (val), a1 (val), generateLegendFrame (val)
            local name, v1, v2, v3, v4, v5, v6, value_2
            local Instance_2 = a1_2.Instance
            local Bar = Instance_2.Graph.Bar
            local RunTime = Instance_2.RunTime
            local Legend = Instance_2.Legend
            local value = a1_2.state.values.value
            local v7 = 0
            for i, v in ipairs(value) do
                v7 = v7 + v.value
            end
            RunTime.Text = ("Run Time: %*"):format((convertDuration(v7)))
            for i2, i3 in ipairs(value) do
                v2 = Bar:FindFirstChild((tostring(i2)))
                v3 = Legend:FindFirstChild((tostring(i2)))
                name = i3.name
                value_2 = i3.value
                v4 = Color3.fromHSV((i2 - 1) * 0.15 % 1 % 1, 1, 1)
                v5 = convertDuration(value_2)
                if not v2 then
                    v2 = Instance.new("Frame")
                    v2.Name = tostring(i2)
                    v2.BackgroundTransparency = a1._config.PlotHistogramTransparency
                    v2.BorderSizePixel = 0
                    v2.Parent = Bar
                end
                if not v3 then
                    v3 = generateLegendFrame(name, i2)
                    v3.Parent = Legend
                end
                if v3.Container.ColorCode.BackgroundColor3 ~= v4 then
                    v3.Container.ColorCode.ColorCode.BackgroundColor3 = v4
                end
                if v3.Container.LegendName.Text ~= name then
                    v3.Container.LegendName.Text = name
                end
                if v2.BackgroundColor3 ~= v4 then
                    v2.BackgroundColor3 = v4
                end
                v2.Size = UDim2.fromScale(value_2 / v7, 1)
                v2.LayoutOrder = -math.round(value_2 * 1000)
                v3.Container.Duration.Text = v5
                v3.Bar.Size = UDim2.new(value_2 / v7, 0, 0, 1)
            end
            local v8 = true
            local v9 = #value + 1
            while v8 do
                v6 = Bar:FindFirstChild((tostring(v9)))
                v1 = Legend:FindFirstChild((tostring(v9)))
                if v6 then
                    v6:Destroy()
                end
                if v1 then
                    v1:Destroy()
                end
                v8 = v6 or v1
                v9 = v9 + 1
            end
            a1_2.lastChangedTick = a1._cycleTick + 1
        end,
        Discard = function(a1) -- Line: 938 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
    })
end