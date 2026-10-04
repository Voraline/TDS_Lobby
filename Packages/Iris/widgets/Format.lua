-- Script path: ReplicatedStorage.Packages.Iris.widgets.Format
-- Decompile time: 1.96 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    a1.WidgetConstructor("Separator", {
        hasState = false,
        hasChildren = false,
        Args = {},
        Events = {},
        Generate = function(a1_2) -- Line: 10 -- upvalues: a1 (val), a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Separator"
            Frame.BackgroundColor3 = a1._config.SeparatorColor
            Frame.BackgroundTransparency = a1._config.SeparatorTransparency
            Frame.BorderSizePixel = 0
            if a1_2.parentWidget.type ~= "SameLine" then
                Frame.Size = UDim2.new(1, 0, 0, 1)
            else
                Frame.Size = UDim2.new(0, 1, 1, 0)
            end
            Frame.LayoutOrder = a1_2.ZIndex
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            return Frame
        end,
        Update = function(a1) end,
        Discard = function(a1) -- Line: 29
            a1.Instance:Destroy()
        end,
    })
    a1.WidgetConstructor("Indent", {
        hasState = false,
        hasChildren = true,
        Args = {Width = 1},
        Events = {},
        Generate = function(a1_2) -- Line: 42 -- upvalues: a2 (val), a1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Indent"
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.LayoutOrder = a1_2.ZIndex
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            a2.UIPadding(Frame, Vector2.zero)
            return Frame
        end,
        Update = function(a1_2) -- Line: 56 -- upvalues: a1 (val)
            local Instance = a1_2.Instance
            local Width = if not a1_2.arguments.Width then a1._config.IndentSpacing else a1_2.arguments.Width
            Instance.UIPadding.PaddingLeft = UDim.new(0, Width)
        end,
        Discard = function(a1) -- Line: 67
            a1.Instance:Destroy()
        end,
        ChildAdded = function(a1, a2) -- Line: 70
            return a1.Instance
        end,
    })
    a1.WidgetConstructor("SameLine", {
        hasState = false,
        hasChildren = true,
        Args = {Width = 1, VerticalAlignment = 2, HorizontalAlignment = 3},
        Events = {},
        Generate = function(a1) -- Line: 85 -- upvalues: a2 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_SameLine"
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.LayoutOrder = a1.ZIndex
            a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            return Frame
        end,
        Update = function(a1_2) -- Line: 98 -- upvalues: a1 (val)
            local UIListLayout = a1_2.Instance.UIListLayout
            UIListLayout.Padding = UDim.new(0, if not a1_2.arguments.Width then a1._config.ItemSpacing.X else a1_2.arguments.Width)
            if not a1_2.arguments.VerticalAlignment then
                UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
            else
                UIListLayout.VerticalAlignment = a1_2.arguments.VerticalAlignment
            end
            if a1_2.arguments.HorizontalAlignment then
                UIListLayout.HorizontalAlignment = a1_2.arguments.HorizontalAlignment
                return
            end
            UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Left
        end,
        Discard = function(a1) -- Line: 119
            a1.Instance:Destroy()
        end,
        ChildAdded = function(a1, a2) -- Line: 122
            return a1.Instance
        end,
    })
    a1.WidgetConstructor("Group", {
        hasState = false,
        hasChildren = true,
        Args = {},
        Events = {},
        Generate = function(a1_2) -- Line: 133 -- upvalues: a2 (val), a1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Group"
            Frame.AutomaticSize = Enum.AutomaticSize.XY
            Frame.Size = UDim2.fromOffset(0, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.ClipsDescendants = false
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            return Frame
        end,
        Update = function(a1) end,
        Discard = function(a1) -- Line: 148
            a1.Instance:Destroy()
        end,
        ChildAdded = function(a1, a2) -- Line: 151
            return a1.Instance
        end,
    })
end