-- Script path: ReplicatedStorage.Packages.Iris.widgets
-- Decompile time: 9.46 ms

require(script.Parent.Types)
local u5 = {}
return function(a1) -- Line: 5 -- upvalues: u5 (val)
    u5.GuiService = game:GetService("GuiService")
    u5.RunService = game:GetService("RunService")
    u5.UserInputService = game:GetService("UserInputService")
    u5.ContextActionService = game:GetService("ContextActionService")
    u5.TextService = game:GetService("TextService")
    u5.ICONS = {
        BLANK_SQUARE = "rbxasset://textures/SurfacesDefault.png",
        RIGHT_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_right.png",
        DOWN_POINTING_TRIANGLE = "rbxasset://textures/DeveloperFramework/button_arrow_down.png",
        MULTIPLICATION_SIGN = "rbxasset://textures/AnimationEditor/icon_close.png",
        BOTTOM_RIGHT_CORNER = "rbxasset://textures/ui/InspectMenu/gr-item-selector-triangle.png",
        CHECK_MARK = "rbxasset://textures/AnimationEditor/icon_checkmark.png",
        BORDER = "rbxasset://textures/ui/InspectMenu/gr-item-selector.png",
        ALPHA_BACKGROUND_TEXTURE = "rbxasset://textures/meshPartFallback.png",
        UNKNOWN_TEXTURE = "rbxasset://textures/ui/GuiImagePlaceholder.png",
    }
    u5.IS_STUDIO = u5.RunService:IsStudio()

    function u5.getTime() -- Line: 25 -- upvalues: u5 (upval)
        if u5.IS_STUDIO then
            return os.clock()
        end
        return time()
    end

    u5.GuiOffset = if not a1._config.IgnoreGuiInset then Vector2.zero else -u5.GuiService:GetGuiInset()
    u5.MouseOffset = if not a1._config.IgnoreGuiInset then u5.GuiService:GetGuiInset() else Vector2.zero
    local u65 = nil
    u65 = (u5.GuiService:GetPropertyChangedSignal("TopbarInset")):Once(function() -- Line: 41 -- upvalues: u5 (upval), a1 (val), u65 (ref)
        u5.MouseOffset = if not a1._config.IgnoreGuiInset then u5.GuiService:GetGuiInset() else Vector2.zero
        u5.GuiOffset = if not a1._config.IgnoreGuiInset then Vector2.zero else -u5.GuiService:GetGuiInset()
        u65:Disconnect()
    end)
    task.delay(5, function() -- Line: 47 -- upvalues: u65 (ref)
        u65:Disconnect()
    end)

    function u5.getMouseLocation() -- Line: 51 -- upvalues: u5 (upval)
        return (u5.UserInputService:GetMouseLocation()) - u5.MouseOffset
    end

    function u5.isPosInsideRect(a1, a2, a3) -- Line: 55 -- types: a1: userdata, a2: userdata, a3: userdata
        local v1 = false
        if a2.X <= a1.X then
            v1 = false
            if a1.X <= a3.X then
                v1 = false
                if a2.Y <= a1.Y then
                    v1 = a1.Y <= a3.Y
                end
            end
        end
        return v1
    end

    function u5.findBestWindowPosForPopup(a1, a2, a3, a4) -- Line: 59
        -- upvalues: 
        local v1 = if not (a4.X < a1.X + a2.X + 20) then a1 + Vector2.new(20) else if not (a4.Y < a1.Y + a2.Y + 20) then a1 + Vector2.new(0, 20) else a1 + Vector2.new(0, -(20 + a2.Y))
        return (Vector2.new(math.max((math.min(v1.X + a2.X, a4.X)) - a2.X, a3.X), (math.max((math.min(v1.Y + a2.Y, a4.Y)) - a2.Y, a3.Y))))
    end

    function u5.getScreenSizeForWindow(a1) -- Line: 79
        if a1.Instance:IsA("GuiBase2d") then
            return a1.Instance.AbsoluteSize
        end
        local Parent = a1.Instance.Parent
        if Parent:IsA("GuiBase2d") or Parent.Parent:IsA("GuiBase2d") then
            return Parent.AbsoluteSize
        end
        return workspace.CurrentCamera.ViewportSize
    end

    function u5.extend(a1, a2) -- Line: 96
        local v1 = table.clone(a1)
        for i, j in a2 do
            v1[i] = j
        end
        return v1
    end

    function u5.UIPadding(a1, a2) -- Line: 104 -- types: a1: userdata, a2: userdata
        local UIPadding = Instance.new("UIPadding")
        UIPadding.PaddingLeft = UDim.new(0, a2.X)
        UIPadding.PaddingRight = UDim.new(0, a2.X)
        UIPadding.PaddingTop = UDim.new(0, a2.Y)
        UIPadding.PaddingBottom = UDim.new(0, a2.Y)
        UIPadding.Parent = a1
        return UIPadding
    end

    function u5.UIListLayout(a1, a2, a3) -- Line: 114 -- types: a1: userdata, a3: Vector2
        local UIListLayout = Instance.new("UIListLayout")
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = a3
        UIListLayout.FillDirection = a2
        UIListLayout.Parent = a1
        return UIListLayout
    end

    function u5.UIStroke(a1, a2, a3, a4) -- Line: 123 -- types: a1: userdata, a2: number, a3: UDim, a4: number
        local UIStroke = Instance.new("UIStroke")
        UIStroke.Thickness = a2
        UIStroke.Color = a3
        UIStroke.Transparency = a4
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.LineJoinMode = Enum.LineJoinMode.Round
        UIStroke.Parent = a1
        return UIStroke
    end

    function u5.UICorner(a1, a2) -- Line: 134 -- types: a1: userdata, a2: number?
        local UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(if not a2 then 1 else 0, a2 or 0)
        UICorner.Parent = a1
        return UICorner
    end

    function u5.UISizeConstraint(a1, a2, a3) -- Line: 141 -- types: a1: userdata, a2: userdata?, a3: userdata?
        local UISizeConstraint = Instance.new("UISizeConstraint")
        UISizeConstraint.MinSize = a2 or UISizeConstraint.MinSize
        UISizeConstraint.MaxSize = a3 or UISizeConstraint.MaxSize
        UISizeConstraint.Parent = a1
        return UISizeConstraint
    end

    function u5.applyTextStyle(a1_2) -- Line: 151 -- upvalues: a1 (val)
        a1_2.FontFace = a1._config.TextFont
        a1_2.TextSize = a1._config.TextSize
        a1_2.TextColor3 = a1._config.TextColor
        a1_2.TextTransparency = a1._config.TextTransparency
        a1_2.TextXAlignment = Enum.TextXAlignment.Left
        a1_2.TextYAlignment = Enum.TextYAlignment.Center
        a1_2.RichText = a1._config.RichText
        a1_2.TextWrapped = a1._config.TextWrapped
        a1_2.AutoLocalize = false
    end

    function u5.applyInteractionHighlights(a1_2, a2, a3, a4) -- Line: 164
        -- upvalues: u5 (upval), a1 (val)
        local u4 = false
        u5.applyMouseEnter(a2, function() -- Line: 166 -- upvalues: a3 (val), a1_2 (val), a4 (val), u4 (ref)
            local v1 = a3
            local v2 = a1_2 .. "Color3"
            v1[v2] = a4.HoveredColor
            v1 = a3
            v2 = a1_2 .. "Transparency"
            v1[v2] = a4.HoveredTransparency
            u4 = false
        end)
        u5.applyMouseLeave(a2, function() -- Line: 173 -- upvalues: a3 (val), a1_2 (val), a4 (val), u4 (ref)
            local v1 = a3
            local v2 = a1_2 .. "Color3"
            v1[v2] = a4.Color
            v1 = a3
            v2 = a1_2 .. "Transparency"
            v1[v2] = a4.Transparency
            u4 = true
        end)
        u5.applyInputBegan(a2, function(a1) -- Line: 180 -- upvalues: a3 (val), a1_2 (val), a4 (val) -- types: a1: userdata
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1
                and a1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            local v1 = a3
            local v2 = a1_2 .. "Color3"
            v1[v2] = a4.ActiveColor
            v1 = a3
            v2 = a1_2 .. "Transparency"
            v1[v2] = a4.ActiveTransparency
        end)
        u5.applyInputEnded(a2, function(a1) -- Line: 188 -- upvalues: u4 (ref), a3 (val), a1_2 (val), a4 (val) -- types: a1: userdata
            local v1, v2
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1
                and a1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            if u4 then
                return
            end
            if a1.UserInputType == Enum.UserInputType.MouseButton1 then
                v1 = a3
                v2 = a1_2 .. "Color3"
                v1[v2] = a4.HoveredColor
                v1 = a3
                v2 = a1_2 .. "Transparency"
                v1[v2] = a4.HoveredTransparency
            end
            if a1.UserInputType == Enum.UserInputType.Gamepad1 then
                v1 = a3
                v2 = a1_2 .. "Color3"
                v1[v2] = a4.Color
                v1 = a3
                v2 = a1_2 .. "Transparency"
                v1[v2] = a4.Transparency
            end
        end)
        a2.SelectionImageObject = a1.SelectionImageObject
    end

    function u5.applyInteractionHighlightsWithMultiHighlightee(a1_2, a2, a3) -- Line: 205
        -- upvalues: u5 (upval), a1 (val)
        local u3 = false
        u5.applyMouseEnter(a2, function() -- Line: 207 -- upvalues: a3 (val), a1_2 (val), u3 (ref)
            local v1, v2
            for i, j in a3 do
                v1 = j[1]
                v2 = a1_2 .. "Color3"
                v1[v2] = j[2].HoveredColor
                v1 = j[1]
                v2 = a1_2 .. "Transparency"
                v1[v2] = j[2].HoveredTransparency
                u3 = false
            end
        end)
        u5.applyMouseLeave(a2, function() -- Line: 216 -- upvalues: a3 (val), a1_2 (val), u3 (ref)
            local v1, v2
            for i, j in a3 do
                v1 = j[1]
                v2 = a1_2 .. "Color3"
                v1[v2] = j[2].Color
                v1 = j[1]
                v2 = a1_2 .. "Transparency"
                v1[v2] = j[2].Transparency
                u3 = true
            end
        end)
        u5.applyInputBegan(a2, function(a1) -- Line: 225 -- upvalues: a3 (val), a1_2 (val) -- types: a1: userdata
            local v1, v2
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1
                and a1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            for i, j in a3 do
                v1 = j[1]
                v2 = a1_2 .. "Color3"
                v1[v2] = j[2].ActiveColor
                v1 = j[1]
                v2 = a1_2 .. "Transparency"
                v1[v2] = j[2].ActiveTransparency
            end
        end)
        u5.applyInputEnded(a2, function(a1) -- Line: 235 -- upvalues: u3 (ref), a3 (val), a1_2 (val) -- types: a1: userdata
            local v1, v2
            if a1.UserInputType ~= Enum.UserInputType.MouseButton1
                and a1.UserInputType ~= Enum.UserInputType.Gamepad1 then
                return
            end
            if u3 then
                return
            end
            local v3 = nil
            local v4 = nil
            local v5 = a1
            for i, j in a3, v3, v4 do
                if v5.UserInputType == Enum.UserInputType.MouseButton1 then
                    v1 = j[1]
                    v2 = a1_2 .. "Color3"
                    v1[v2] = j[2].HoveredColor
                    v1 = j[1]
                    v2 = a1_2 .. "Transparency"
                    v1[v2] = j[2].HoveredTransparency
                end
                if v5.UserInputType == Enum.UserInputType.Gamepad1 then
                    v1 = j[1]
                    v2 = a1_2 .. "Color3"
                    v1[v2] = j[2].Color
                    v1 = j[1]
                    v2 = a1_2 .. "Transparency"
                    v1[v2] = j[2].Transparency
                end
            end
        end)
        a2.SelectionImageObject = a1.SelectionImageObject
    end

    function u5.applyFrameStyle(a1_2, a2, a3) -- Line: 254
        -- upvalues: a1 (val), u5 (upval)
        local FrameBorderSize = a1._config.FrameBorderSize
        local FrameRounding = a1._config.FrameRounding
        a1_2.BorderSizePixel = 0
        if FrameBorderSize > 0 then
            u5.UIStroke(a1_2, FrameBorderSize, a1._config.BorderColor, a1._config.BorderTransparency)
        end
        if FrameRounding > 0 and not a3 then
            u5.UICorner(a1_2, FrameRounding)
        end
        if not a2 then
            u5.UIPadding(a1_2, a1._config.FramePadding)
        end
    end

    function u5.applyButtonClick(a1, a2) -- Line: 272 -- types: a1: userdata, a2: function
        a1.MouseButton1Click:Connect(function() -- Line: 273 -- upvalues: a2 (val)
            a2()
        end)
    end

    function u5.applyButtonDown(a1, a2) -- Line: 278 -- upvalues: u5 (upval) -- types: a1: userdata, a2: function
        a1.MouseButton1Down:Connect(function(a1, a2_2) -- Line: 279 -- upvalues: u5 (upval), a2 (val) -- types: a1: number, a2_2: number
            local v1 = (Vector2.new(a1, a2_2)) - u5.MouseOffset
            a2(v1.X, v1.Y)
        end)
    end

    function u5.applyMouseEnter(a1, a2) -- Line: 285 -- upvalues: u5 (upval) -- types: a1: userdata, a2: function
        a1.MouseEnter:Connect(function(a1, a2_2) -- Line: 286 -- upvalues: u5 (upval), a2 (val) -- types: a1: number, a2_2: number
            local v1 = (Vector2.new(a1, a2_2)) - u5.MouseOffset
            a2(v1.X, v1.Y)
        end)
    end

    function u5.applyMouseMoved(a1, a2) -- Line: 292 -- upvalues: u5 (upval) -- types: a1: userdata, a2: function
        a1.MouseMoved:Connect(function(a1, a2_2) -- Line: 293 -- upvalues: u5 (upval), a2 (val) -- types: a1: number, a2_2: number
            local v1 = (Vector2.new(a1, a2_2)) - u5.MouseOffset
            a2(v1.X, v1.Y)
        end)
    end

    function u5.applyMouseLeave(a1, a2) -- Line: 299 -- upvalues: u5 (upval) -- types: a1: userdata, a2: function
        a1.MouseLeave:Connect(function(a1, a2_2) -- Line: 300 -- upvalues: u5 (upval), a2 (val) -- types: a1: number, a2_2: number
            local v1 = (Vector2.new(a1, a2_2)) - u5.MouseOffset
            a2(v1.X, v1.Y)
        end)
    end

    function u5.applyInputBegan(a1, a2) -- Line: 306 -- types: a1: userdata, a2: function
        a1.InputBegan:Connect(function(...) -- Line: 307 -- upvalues: a2 (val)
            a2(...)
        end)
    end

    function u5.applyInputEnded(a1, a2) -- Line: 312 -- types: a1: userdata, a2: function
        a1.InputEnded:Connect(function(...) -- Line: 313 -- upvalues: a2 (val)
            a2(...)
        end)
    end

    function u5.discardState(a1) -- Line: 318
        for i, j in a1.state do
            j.ConnectedWidgets[a1.ID] = nil
        end
    end

    function u5.registerEvent(a1_2, a2) -- Line: 324
        -- upvalues: a1 (val), u5 (upval)
        table.insert(a1._initFunctions, function() -- Line: 325 -- upvalues: a1 (upval), u5 (upval), a1_2 (val), a2 (val)
            table.insert(a1._connections, (u5.UserInputService[a1_2]:Connect(a2)))
        end)
    end

    u5.EVENTS = {
        hover = function(a1) -- Line: 331 -- upvalues: u5 (upval) -- types: a1: function
            return {
                Init = function(a1_2) -- Line: 333 -- upvalues: a1 (val), u5 (upval)
                    local v1 = a1(a1_2)
                    u5.applyMouseEnter(v1, function() -- Line: 335 -- upvalues: a1_2 (val)
                        a1_2.isHoveredEvent = true
                    end)
                    u5.applyMouseLeave(v1, function() -- Line: 338 -- upvalues: a1_2 (val)
                        a1_2.isHoveredEvent = false
                    end)
                    a1_2.isHoveredEvent = false
                end,
                Get = function(a1) -- Line: 343
                    return a1.isHoveredEvent
                end,
            }
        end,
        click = function(a1_2) -- Line: 349 -- upvalues: u5 (upval), a1 (val) -- types: a1_2: function
            return {
                Init = function(a1_3) -- Line: 351 -- upvalues: a1_2 (val), u5 (upval), a1 (upval)
                    local v1 = a1_2(a1_3)
                    a1_3.lastClickedTick = -1
                    u5.applyButtonClick(v1, function() -- Line: 355 -- upvalues: a1_3 (val), a1 (upval)
                        a1_3.lastClickedTick = a1._cycleTick + 1
                    end)
                end,
                Get = function(a1_2) -- Line: 359 -- upvalues: a1 (upval)
                    return a1_2.lastClickedTick == a1._cycleTick
                end,
            }
        end,
        rightClick = function(a1_2) -- Line: 365 -- upvalues: a1 (val) -- types: a1_2: function
            return {
                Init = function(a1_3) -- Line: 367 -- upvalues: a1_2 (val), a1 (upval)
                    local v1 = a1_2(a1_3)
                    a1_3.lastRightClickedTick = -1
                    v1.MouseButton2Click:Connect(function() -- Line: 371 -- upvalues: a1_3 (val), a1 (upval)
                        a1_3.lastRightClickedTick = a1._cycleTick + 1
                    end)
                end,
                Get = function(a1_2) -- Line: 375 -- upvalues: a1 (upval)
                    return a1_2.lastRightClickedTick == a1._cycleTick
                end,
            }
        end,
        doubleClick = function(a1_2) -- Line: 381 -- upvalues: u5 (upval), a1 (val) -- types: a1_2: function
            return {
                Init = function(a1_3) -- Line: 383 -- upvalues: a1_2 (val), u5 (upval), a1 (upval)
                    local v1 = a1_2(a1_3)
                    a1_3.lastClickedTime = -1
                    a1_3.lastClickedPosition = Vector2.zero
                    a1_3.lastDoubleClickedTick = -1
                    u5.applyButtonDown(v1, function(a1_2, a2) -- Line: 389 -- upvalues: u5 (upval), a1_3 (val), a1 (upval) -- types: a1_2: number, a2: number
                        local v1 = u5.getTime()
                        if v1 - a1_3.lastClickedTime < a1._config.MouseDoubleClickTime
                            and ((Vector2.new(a1_2, a2)) - a1_3.lastClickedPosition).Magnitude < a1._config.MouseDoubleClickMaxDist then
                            a1_3.lastDoubleClickedTick = a1._cycleTick + 1
                            return
                        end
                        a1_3.lastClickedTime = v1
                        a1_3.lastClickedPosition = Vector2.new(a1_2, a2)
                    end)
                end,
                Get = function(a1_2) -- Line: 400 -- upvalues: a1 (upval)
                    return a1_2.lastDoubleClickedTick == a1._cycleTick
                end,
            }
        end,
        ctrlClick = function(a1_2) -- Line: 406 -- upvalues: u5 (upval), a1 (val) -- types: a1_2: function
            return {
                Init = function(a1_3) -- Line: 408 -- upvalues: a1_2 (val), u5 (upval), a1 (upval)
                    local v1 = a1_2(a1_3)
                    a1_3.lastCtrlClickedTick = -1
                    u5.applyButtonClick(v1, function() -- Line: 412 -- upvalues: u5 (upval), a1_3 (val), a1 (upval)
                        if u5.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)
                            or u5.UserInputService:IsKeyDown(Enum.KeyCode.RightControl) then
                            a1_3.lastCtrlClickedTick = a1._cycleTick + 1
                        end
                    end)
                end,
                Get = function(a1_2) -- Line: 418 -- upvalues: a1 (upval)
                    return a1_2.lastCtrlClickedTick == a1._cycleTick
                end,
            }
        end,
    }
    a1._utility = u5
    require(script.Root)(a1, u5)
    require(script.Window)(a1, u5)
    require(script.Menu)(a1, u5)
    require(script.Format)(a1, u5)
    require(script.Text)(a1, u5)
    require(script.Button)(a1, u5)
    require(script.Checkbox)(a1, u5)
    require(script.RadioButton)(a1, u5)
    require(script.Image)(a1, u5)
    require(script.Tree)(a1, u5)
    require(script.Tab)(a1, u5)
    require(script.Input)(a1, u5)
    require(script.Combo)(a1, u5)
    require(script.Plot)(a1, u5)
    require(script.Table)(a1, u5)
end