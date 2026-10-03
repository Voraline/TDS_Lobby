-- Script path: ReplicatedStorage.Packages.Iris.widgets.Button
-- Decompile time: 1.36 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 3
    local u2 = {hasState = false, hasChildren = false, Args = {Text = 1, Size = 2}}
    u2.Events = {
        clicked = a2.EVENTS.click(function(a1) -- Line: 12
            return a1.Instance
        end),
        rightClicked = a2.EVENTS.rightClick(function(a1) -- Line: 15
            return a1.Instance
        end),
        doubleClicked = a2.EVENTS.doubleClick(function(a1) -- Line: 18
            return a1.Instance
        end),
        ctrlClicked = a2.EVENTS.ctrlClick(function(a1) -- Line: 21
            return a1.Instance
        end),
        hovered = a2.EVENTS.hover(function(a1) -- Line: 24
            return a1.Instance
        end),
    }

    function u2.Generate(a1_2) -- Line: 28 -- upvalues: a1 (val), a2 (val)
        local TextButton = Instance.new("TextButton")
        TextButton.Size = UDim2.fromOffset(0, 0)
        TextButton.BackgroundColor3 = a1._config.ButtonColor
        TextButton.BackgroundTransparency = a1._config.ButtonTransparency
        TextButton.AutoButtonColor = false
        TextButton.AutomaticSize = Enum.AutomaticSize.XY
        a2.applyTextStyle(TextButton)
        TextButton.TextXAlignment = Enum.TextXAlignment.Center
        a2.applyFrameStyle(TextButton)
        a2.applyInteractionHighlights("Background", TextButton, TextButton, {
            Color = a1._config.ButtonColor,
            Transparency = a1._config.ButtonTransparency,
            HoveredColor = a1._config.ButtonHoveredColor,
            HoveredTransparency = a1._config.ButtonHoveredTransparency,
            ActiveColor = a1._config.ButtonActiveColor,
            ActiveTransparency = a1._config.ButtonActiveTransparency,
        })
        TextButton.ZIndex = a1_2.ZIndex
        TextButton.LayoutOrder = a1_2.ZIndex
        return TextButton
    end

    function u2.Update(a1) -- Line: 55
        local Instance = a1.Instance
        Instance.Text = a1.arguments.Text or "Button"
        local Size = a1.arguments.Size or UDim2.fromOffset(0, 0)
        Instance.Size = Size
    end

    function u2.Discard(a1) -- Line: 60
        a1.Instance:Destroy()
    end

    a2.abstractButton = u2
    a1.WidgetConstructor("Button", a2.extend(u2, {
        Generate = function(a1) -- Line: 68 -- upvalues: u2 (val)
            local v1 = u2.Generate(a1)
            v1.Name = "Iris_Button"
            return v1
        end,
    }))
    a1.WidgetConstructor("SmallButton", a2.extend(u2, {
        Generate = function(a1) -- Line: 79 -- upvalues: u2 (val)
            local v1 = u2.Generate(a1)
            v1.Name = "Iris_SmallButton"
            local UIPadding = v1.UIPadding
            UIPadding.PaddingLeft = UDim.new(0, 2)
            UIPadding.PaddingRight = UDim.new(0, 2)
            UIPadding.PaddingTop = UDim.new(0, 0)
            UIPadding.PaddingBottom = UDim.new(0, 0)
            return v1
        end,
    }))
end