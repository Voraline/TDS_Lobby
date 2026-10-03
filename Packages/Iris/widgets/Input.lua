-- Script path: ReplicatedStorage.Packages.Iris.widgets.Input
-- Decompile time: 39.40 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 5
    local u2 = {}

    function u2.Init(a1) end

    function u2.Get(a1_2) -- Line: 8 -- upvalues: a1 (val)
        return a1_2.lastNumberChangedTick == a1._cycleTick
    end

    local function getValueByIndex(a1, a2, a3) -- Line: 13 -- types: a2: number
        local v1 = typeof(a1)
        if v1 == "number" then
            return a1
        end
        if v1 == "Vector2" then
            if a2 == 1 then
                return a1.X
            end
            if a2 == 2 then
                return a1.Y
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if v1 == "Vector3" then
            if a2 == 1 then
                return a1.X
            end
            if a2 == 2 then
                return a1.Y
            end
            if a2 == 3 then
                return a1.Z
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if v1 == "UDim" then
            if a2 == 1 then
                return a1.Scale
            end
            if a2 == 2 then
                return a1.Offset
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if v1 == "UDim2" then
            if a2 == 1 then
                return a1.X.Scale
            end
            if a2 == 2 then
                return a1.X.Offset
            end
            if a2 == 3 then
                return a1.Y.Scale
            end
            if a2 == 4 then
                return a1.Y.Offset
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if v1 == "Color3" then
            local v2 = a3.UseHSV and {a1:ToHSV()} or {a1.R, a1.G, a1.B}
            if a2 == 1 then
                return v2[1]
            end
            if a2 == 2 then
                return v2[2]
            end
            if a2 == 3 then
                return v2[3]
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if v1 ~= "Rect" then
            if v1 == "table" then
                return a1[a2]
            end
            error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if a2 == 1 then
            return a1.Min.X
        end
        if a2 == 2 then
            return a1.Min.Y
        end
        if a2 == 3 then
            return a1.Max.X
        end
        if a2 == 4 then
            return a1.Max.Y
        end
        error((("Incorrect datatype or value: %* %* %*."):format(a1, typeof(a1), a2)))
    end

    local function updateValueByIndex(a1, a2, a3, a4) -- Line: 74 -- types: a2: number, a3: number
        if typeof(a1) == "number" then
            return a3
        end
        if typeof(a1) == "Vector2" then
            if a2 == 1 then
                return (Vector2.new(a3, a1.Y))
            end
            if a2 == 2 then
                return (Vector2.new(a1.X, a3))
            end
            error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if typeof(a1) == "Vector3" then
            if a2 == 1 then
                return (Vector3.new(a3, a1.Y, a1.Z))
            end
            if a2 == 2 then
                return (Vector3.new(a1.X, a3, a1.Z))
            end
            if a2 == 3 then
                return (Vector3.new(a1.X, a1.Y, a3))
            end
            error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if typeof(a1) == "UDim" then
            if a2 == 1 then
                return (UDim.new(a3, a1.Offset))
            end
            if a2 == 2 then
                return (UDim.new(a1.Scale, a3))
            end
            error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if typeof(a1) == "UDim2" then
            if a2 == 1 then
                return (UDim2.new(UDim.new(a3, a1.X.Offset), a1.Y))
            end
            if a2 == 2 then
                return (UDim2.new(UDim.new(a1.X.Scale, a3), a1.Y))
            end
            if a2 == 3 then
                return (UDim2.new(a1.X, UDim.new(a3, a1.Y.Offset)))
            end
            if a2 == 4 then
                return (UDim2.new(a1.X, UDim.new(a1.Y.Scale, a3)))
            end
            error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if typeof(a1) == "Rect" then
            if a2 == 1 then
                return (Rect.new(Vector2.new(a3, a1.Min.Y), a1.Max))
            end
            if a2 == 2 then
                return (Rect.new(Vector2.new(a1.Min.X, a3), a1.Max))
            end
            if a2 == 3 then
                return (Rect.new(a1.Min, Vector2.new(a3, a1.Max.Y)))
            end
            if a2 == 4 then
                return (Rect.new(a1.Min, Vector2.new(a1.Max.X, a3)))
            end
            error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
            return
        end
        if typeof(a1) == "Color3" then
            if a4.UseHSV then
                local v1, v2, v3 = a1:ToHSV()
                if a2 == 1 then
                    return (Color3.fromHSV(a3, v2, v3))
                end
                if a2 == 2 then
                    return (Color3.fromHSV(v1, a3, v3))
                end
                if a2 == 3 then
                    return (Color3.fromHSV(v1, v2, a3))
                end
            end
            if a2 == 1 then
                return (Color3.new(a3, a1.G, a1.B))
            end
            if a2 == 2 then
                return (Color3.new(a1.R, a3, a1.B))
            end
            if a2 == 3 then
                return (Color3.new(a1.R, a1.G, a3))
            end
        end
        error((("Incorrect datatype or value %* %* %*."):format(a1, typeof(a1), a2)))
    end

    local u7 = {
        Num = {1},
        Vector2 = {1, 1},
        Vector3 = {1, 1, 1},
        UDim = {0.01, 1},
        UDim2 = {0.01, 1, 0.01, 1},
        Color3 = {1, 1, 1},
        Color4 = {1, 1, 1, 1},
        Rect = {1, 1, 1, 1},
    }
    local u39 = {
        Num = {0},
        Vector2 = {0, 0},
        Vector3 = {0, 0, 0},
        UDim = {0, 0},
        UDim2 = {0, 0, 0, 0},
        Rect = {0, 0, 0, 0},
    }
    local u62 = {
        Num = {100},
        Vector2 = {100, 100},
        Vector3 = {100, 100, 100},
        UDim = {1, 960},
        UDim2 = {1, 960, 1, 960},
        Rect = {960, 960, 960, 960},
    }
    local u85 = {
        Num = {""},
        Vector2 = {"X: ", "Y: "},
        Vector3 = {"X: ", "Y: ", "Z: "},
        UDim = {"", ""},
        UDim2 = {"", "", "", ""},
        Color3_RGB = {"R: ", "G: ", "B: "},
        Color3_HSV = {"H: ", "S: ", "V: "},
        Color4_RGB = {"R: ", "G: ", "B: ", "T: "},
        Color4_HSV = {"H: ", "S: ", "V: ", "T: "},
        Rect = {"X: ", "Y: ", "X: ", "Y: "},
    }
    local u126 = {
        Num = {0},
        Vector2 = {0, 0},
        Vector3 = {0, 0, 0},
        UDim = {3, 0},
        UDim2 = {3, 0, 3, 0},
        Color3 = {0, 0, 0},
        Color4 = {0, 0, 0, 0},
        Rect = {0, 0, 0, 0},
    }

    local function generateButtons(a1_2, a2_2, a3) -- Line: 198
        -- upvalues: a2 (val), a1 (val), getValueByIndex (val)
        local v1 = a2.abstractButton.Generate(a1_2)
        v1.Name = "SubButton"
        v1.ZIndex = 5
        v1.LayoutOrder = 5
        v1.TextXAlignment = Enum.TextXAlignment.Center
        v1.Text = "-"
        v1.Size = UDim2.fromOffset(a1._config.TextSize + 2 * a1._config.FramePadding.Y, a1._config.TextSize)
        v1.Parent = a2_2
        a2.applyButtonClick(v1, function() -- Line: 208 -- upvalues: a2 (upval), a1_2 (val), getValueByIndex (upval), a1 (upval)
            local v1 = a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or a2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
            local v2 = a1_2.state.number.value - (a1_2.arguments.Increment and getValueByIndex(a1_2.arguments.Increment, 1, a1_2.arguments) or 1) * (if not v1 then 1 else 100)
            if a1_2.arguments.Min ~= nil then
                v2 = math.max(v2, (getValueByIndex(a1_2.arguments.Min, 1, a1_2.arguments)))
            end
            if a1_2.arguments.Max ~= nil then
                v2 = math.min(v2, (getValueByIndex(a1_2.arguments.Max, 1, a1_2.arguments)))
            end
            a1_2.state.number:set(v2)
            a1_2.lastNumberChangedTick = a1._cycleTick + 1
        end)
        local v2 = a2.abstractButton.Generate(a1_2)
        v2.Name = "AddButton"
        v2.ZIndex = 6
        v2.LayoutOrder = 6
        v2.TextXAlignment = Enum.TextXAlignment.Center
        v2.Text = "+"
        v2.Size = UDim2.fromOffset(a1._config.TextSize + 2 * a1._config.FramePadding.Y, a1._config.TextSize)
        v2.Parent = a2_2
        a2.applyButtonClick(v2, function() -- Line: 231 -- upvalues: a2 (upval), a1_2 (val), getValueByIndex (upval), a1 (upval)
            local v1 = a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or a2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
            local v2 = a1_2.state.number.value + (a1_2.arguments.Increment and getValueByIndex(a1_2.arguments.Increment, 1, a1_2.arguments) or 1) * (if not v1 then 1 else 100)
            if a1_2.arguments.Min ~= nil then
                v2 = math.max(v2, (getValueByIndex(a1_2.arguments.Min, 1, a1_2.arguments)))
            end
            if a1_2.arguments.Max ~= nil then
                v2 = math.min(v2, (getValueByIndex(a1_2.arguments.Max, 1, a1_2.arguments)))
            end
            a1_2.state.number:set(v2)
            a1_2.lastNumberChangedTick = a1._cycleTick + 1
        end)
        return 2 * a1._config.ItemInnerSpacing.X + a3 * 2
    end

    local function generateInputScalar(a1_2, a2_2, a3) -- Line: 248
        -- upvalues: u2 (val), a2 (val), a1 (val), generateButtons (val), getValueByIndex (val)
        -- upvalues: updateValueByIndex (val), u126 (val), u85 (val)
        return {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {
                numberChanged = u2,
                hovered = a2.EVENTS.hover(function(a1) -- Line: 261
                    return a1.Instance
                end),
            },
            Generate = function(a1_3) -- Line: 265
                -- upvalues: a1_2 (val), a2 (upval), a1 (upval), a2_2 (val), generateButtons (upval)
                -- upvalues: getValueByIndex (upval), updateValueByIndex (upval)
                local Frame = Instance.new("Frame")
                Frame.Name = "Iris_Input" .. a1_2
                Frame.Size = UDim2.fromScale(1, 0)
                Frame.BackgroundTransparency = 1
                Frame.BorderSizePixel = 0
                Frame.LayoutOrder = a1_3.ZIndex
                Frame.AutomaticSize = Enum.AutomaticSize.Y
                local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
                v1.VerticalAlignment = Enum.VerticalAlignment.Center
                local v2 = 0
                local v3 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
                if a2_2 == 1 then
                    v2 = generateButtons(a1_3, Frame, v3)
                end
                local v4 = UDim.new(
                    a1._config.ContentWidth.Scale / a2_2,
                    (a1._config.ContentWidth.Offset - a1._config.ItemInnerSpacing.X * (a2_2 - 1) - v2) / a2_2
                )
                local v5 = UDim.new(v4.Scale * (a2_2 - 1), v4.Offset * (a2_2 - 1) + a1._config.ItemInnerSpacing.X * (a2_2 - 1) + v2)
                local v6 = a1._config.ContentWidth - v5
                for i = 1, a2_2 do
                    local TextBox = Instance.new("TextBox")
                    TextBox.Name = "InputField" .. tostring(i)
                    TextBox.LayoutOrder = i
                    if i ~= a2_2 then
                        TextBox.Size = UDim2.new(v4, a1._config.ContentHeight)
                    else
                        TextBox.Size = UDim2.new(v6, a1._config.ContentHeight)
                    end
                    TextBox.AutomaticSize = Enum.AutomaticSize.Y
                    TextBox.BackgroundColor3 = a1._config.FrameBgColor
                    TextBox.BackgroundTransparency = a1._config.FrameBgTransparency
                    TextBox.ClearTextOnFocus = false
                    TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                    TextBox.ClipsDescendants = true
                    a2.applyFrameStyle(TextBox)
                    a2.applyTextStyle(TextBox)
                    a2.UISizeConstraint(TextBox, Vector2.xAxis)
                    TextBox.Parent = Frame
                    TextBox.FocusLost:Connect(function() -- Line: 314
                        -- upvalues: TextBox (val), a1_3 (val), getValueByIndex (upval), i (val)
                        -- upvalues: updateValueByIndex (upval), a1 (upval)
                        local v1 = tonumber((TextBox.Text:match("-?%d*%.?%d*")))
                        if v1 ~= nil then
                            if a1_3.arguments.Min ~= nil then
                                v1 = math.max(v1, (getValueByIndex(a1_3.arguments.Min, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Max ~= nil then
                                v1 = math.min(v1, (getValueByIndex(a1_3.arguments.Max, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Increment then
                                v1 = (math.round(v1 / (getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)))) * getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)
                            end
                            a1_3.state.number:set((updateValueByIndex(a1_3.state.number.value, i, v1, a1_3.arguments)))
                            a1_3.lastNumberChangedTick = a1._cycleTick + 1
                        end
                        local v2 = a1_3.arguments.Format[i] or a1_3.arguments.Format[1]
                        if a1_3.arguments.Prefix then
                            v2 = a1_3.arguments.Prefix[i] .. v2
                        end
                        TextBox.Text = string.format(v2, getValueByIndex(a1_3.state.number.value, i, a1_3.arguments))
                        a1_3.state.editingText:set(0)
                    end)
                    TextBox.Focused:Connect(function() -- Line: 340 -- upvalues: TextBox (val), a1_3 (val), i (val)
                        TextBox.CursorPosition = #TextBox.Text + 1
                        TextBox.SelectionStart = 1
                        a1_3.state.editingText:set(i)
                    end)
                end
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "TextLabel"
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.LayoutOrder = 7
                TextLabel.AutomaticSize = Enum.AutomaticSize.XY
                a2.applyTextStyle(TextLabel)
                TextLabel.Parent = Frame
                return Frame
            end,
            Update = function(a1_3) -- Line: 362
                -- upvalues: a1_2 (val), a2_2 (val), a1 (upval), u126 (upval), getValueByIndex (upval), u85 (upval)
                local v1
                local Instance = a1_3.Instance
                local TextLabel = Instance.TextLabel
                local Text = a1_3.arguments.Text or ("Input %*"):format(a1_2)
                TextLabel.Text = Text
                if a2_2 == 1 then
                    Instance.SubButton.Visible = not a1_3.arguments.NoButtons
                    Instance.AddButton.Visible = not a1_3.arguments.NoButtons
                    v1 = if not a1_3.arguments.NoButtons then 2 * a1._config.ItemInnerSpacing.X + 2 * (a1._config.TextSize + 2 * a1._config.FramePadding.Y) else 0
                    Instance.InputField1.Size = UDim2.new(UDim.new(a1._config.ContentWidth.Scale, a1._config.ContentWidth.Offset - v1), a1._config.ContentHeight)
                end
                if a1_3.arguments.Format and typeof(a1_3.arguments.Format) ~= "table" then
                    a1_3.arguments.Format = {a1_3.arguments.Format}
                    return
                end
                if not a1_3.arguments.Format then
                    local v2, v3
                    v1 = {}
                    local v4 = a1_3
                    for i = 1, a2_2 do
                        v2 = u126[a1_2][i]
                        if v4.arguments.Increment then
                            v3 = getValueByIndex(v4.arguments.Increment, i, v4.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if v4.arguments.Max then
                            v3 = getValueByIndex(v4.arguments.Max, i, v4.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if v4.arguments.Min then
                            v3 = getValueByIndex(v4.arguments.Min, i, v4.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if not (v2 > 0) then
                            v1[i] = "%d"
                        else
                            v1[i] = (("%%.%*f"):format(v2))
                        end
                    end
                    v4.arguments.Format = v1
                    v4.arguments.Prefix = u85[a1_2]
                end
            end,
            Discard = function(a1) -- Line: 410 -- upvalues: a2 (upval)
                a1.Instance:Destroy()
                a2.discardState(a1)
            end,
            GenerateState = function(a1_2) -- Line: 414 -- upvalues: a1 (upval), a3 (val)
                if a1_2.state.number == nil then
                    a1_2.state.number = a1._widgetState(a1_2, "number", a3)
                end
                if a1_2.state.editingText == nil then
                    a1_2.state.editingText = a1._widgetState(a1_2, "editingText", 0)
                end
            end,
            UpdateState = function(a1) -- Line: 422 -- upvalues: a2_2 (val), getValueByIndex (upval)
                local v1, v2
                local v3 = a1
                for i = 1, a2_2 do
                    v1 = a1.Instance:FindFirstChild("InputField" .. (tostring(i)))
                    v2 = v3.arguments.Format[i] or v3.arguments.Format[1]
                    if v3.arguments.Prefix then
                        v2 = v3.arguments.Prefix[i] .. v2
                    end
                    v1.Text = string.format(v2, getValueByIndex(v3.state.number.value, i, v3.arguments))
                end
            end,
        }
    end

    local u163 = 0
    local u164 = false
    local u165 = nil
    local u166 = 0
    local u167 = ""

    local function updateActiveDrag() -- Line: 450
        -- upvalues: a2 (val), u163 (ref), u164 (ref), u165 (ref), u167 (ref), u166 (ref), getValueByIndex (val)
        -- upvalues: u7 (val), updateValueByIndex (val), a1 (val)
        local v1
        local X = a2.getMouseLocation().X
        local v2 = X - u163
        u163 = X
        if u164 == false or u165 == nil then
            return
        end
        local number = u165.state.number
        if u167 == "Color3" or u167 == "Color4" then
            v1 = u165
            number = v1.state.color
            if u166 == 4 then
                number = v1.state.transparency
            end
        end
        v1 = u165.arguments.Increment and getValueByIndex(u165.arguments.Increment, u166, u165.arguments) or u7[u167][u166]
        v1 = v1 * (if a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then 10 else if not a2.UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 1 else 10)
        v1 = v1 * (if a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftAlt) then 0.1 else if not a2.UserInputService:IsKeyDown(Enum.KeyCode.RightAlt) then 1 else 0.1)
        v1 = v1 * (if u167 == "Color3" then 5 else if u167 ~= "Color4" then 1 else 5)
        local v3 = (getValueByIndex(number.value, u166, u165.arguments)) + v2 * v1
        if u165.arguments.Min ~= nil then
            v3 = math.max(v3, (getValueByIndex(u165.arguments.Min, u166, u165.arguments)))
        end
        if u165.arguments.Max ~= nil then
            v3 = math.min(v3, (getValueByIndex(u165.arguments.Max, u166, u165.arguments)))
        end
        number:set((updateValueByIndex(number.value, u166, v3, u165.arguments)))
        u165.lastNumberChangedTick = a1._cycleTick + 1
    end

    local function DragMouseDown(a1_2, a2_2, a3, a4, a5) -- Line: 490
        -- upvalues: a2 (val), a1 (val), u164 (ref), u165 (ref), u166 (ref), u167 (ref), updateActiveDrag (val)
        local v1 = a2.getTime()
        local v2 = v1 - a1_2.lastClickedTime < a1._config.MouseDoubleClickTime
        local v3 = a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or a2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
        if v2
            and ((Vector2.new(a4, a5)) - a1_2.lastClickedPosition).Magnitude < a1._config.MouseDoubleClickMaxDist then
            a1_2.state.editingText:set(a3)
            return
        end
        if v3 then
            a1_2.state.editingText:set(a3)
            return
        end
        a1_2.lastClickedTime = v1
        a1_2.lastClickedPosition = Vector2.new(a4, a5)
        u164 = true
        u165 = a1_2
        u166 = a3
        u167 = a2_2
        updateActiveDrag()
    end

    a2.registerEvent("InputChanged", function() -- Line: 508 -- upvalues: a1 (val), updateActiveDrag (val)
        if not a1._started then
            return
        end
        updateActiveDrag()
    end)
    a2.registerEvent("InputEnded", function(a1_2) -- Line: 515 -- upvalues: a1 (val), u164 (ref), u165 (ref), u166 (ref) -- types: a1_2: userdata
        if not a1._started then
            return
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 and u164 then
            u164 = false
            u165 = nil
            u166 = 0
        end
    end)

    local function generateDragScalar(a1_2, a2_2, a3) -- Line: 526
        -- upvalues: u2 (val), a2 (val), a1 (val), getValueByIndex (val), updateValueByIndex (val), DragMouseDown (val)
        -- upvalues: u126 (val), u85 (val)
        return {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {
                numberChanged = u2,
                hovered = a2.EVENTS.hover(function(a1) -- Line: 539
                    return a1.Instance
                end),
            },
            Generate = function(a1_3) -- Line: 543
                -- upvalues: a1_2 (val), a2 (upval), a1 (upval), a2_2 (val), getValueByIndex (upval)
                -- upvalues: updateValueByIndex (upval), DragMouseDown (upval)
                local TextButton
                a1_3.lastClickedTime = -1
                a1_3.lastClickedPosition = Vector2.zero
                local Frame = Instance.new("Frame")
                Frame.Name = "Iris_Drag" .. a1_2
                Frame.Size = UDim2.fromScale(1, 0)
                Frame.BackgroundTransparency = 1
                Frame.BorderSizePixel = 0
                Frame.LayoutOrder = a1_3.ZIndex
                Frame.AutomaticSize = Enum.AutomaticSize.Y
                local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
                v1.VerticalAlignment = Enum.VerticalAlignment.Center
                local v2 = 0
                local v3 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
                if a1_2 == "Color3" or a1_2 == "Color4" then
                    v2 = v2 + (a1._config.ItemInnerSpacing.X + v3)
                    local ImageLabel = Instance.new("ImageLabel")
                    ImageLabel.Name = "ColorBox"
                    ImageLabel.BorderSizePixel = 0
                    ImageLabel.Size = UDim2.fromOffset(v3, v3)
                    ImageLabel.LayoutOrder = 5
                    ImageLabel.Image = a2.ICONS.ALPHA_BACKGROUND_TEXTURE
                    ImageLabel.ImageTransparency = 1
                    a2.applyFrameStyle(ImageLabel, true)
                    ImageLabel.Parent = Frame
                end
                local v4 = UDim.new(
                    a1._config.ContentWidth.Scale / a2_2,
                    (a1._config.ContentWidth.Offset - a1._config.ItemInnerSpacing.X * (a2_2 - 1) - v2) / a2_2
                )
                local v5 = UDim.new(v4.Scale * (a2_2 - 1), v4.Offset * (a2_2 - 1) + a1._config.ItemInnerSpacing.X * (a2_2 - 1) + v2)
                local v6 = a1._config.ContentWidth - v5
                for i = 1, a2_2 do
                    TextButton = Instance.new("TextButton")
                    TextButton.Name = "DragField" .. tostring(i)
                    TextButton.LayoutOrder = i
                    if i ~= a2_2 then
                        TextButton.Size = UDim2.new(v4, a1._config.ContentHeight)
                    else
                        TextButton.Size = UDim2.new(v6, a1._config.ContentHeight)
                    end
                    TextButton.AutomaticSize = Enum.AutomaticSize.Y
                    TextButton.BackgroundColor3 = a1._config.FrameBgColor
                    TextButton.BackgroundTransparency = a1._config.FrameBgTransparency
                    TextButton.AutoButtonColor = false
                    TextButton.Text = ""
                    TextButton.ClipsDescendants = true
                    a2.applyFrameStyle(TextButton)
                    a2.applyTextStyle(TextButton)
                    a2.UISizeConstraint(TextButton, Vector2.xAxis)
                    TextButton.TextXAlignment = Enum.TextXAlignment.Center
                    TextButton.Parent = Frame
                    a2.applyInteractionHighlights("Background", TextButton, TextButton, {
                        Color = a1._config.FrameBgColor,
                        Transparency = a1._config.FrameBgTransparency,
                        HoveredColor = a1._config.FrameBgHoveredColor,
                        HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                        ActiveColor = a1._config.FrameBgActiveColor,
                        ActiveTransparency = a1._config.FrameBgActiveTransparency,
                    })
                    local TextBox = Instance.new("TextBox")
                    TextBox.Name = "InputField"
                    TextBox.Size = UDim2.new(1, 0, 1, 0)
                    TextBox.BackgroundTransparency = 1
                    TextBox.ClearTextOnFocus = false
                    TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                    TextBox.ClipsDescendants = true
                    TextBox.Visible = false
                    a2.applyFrameStyle(TextBox, true)
                    a2.applyTextStyle(TextBox)
                    TextBox.Parent = TextButton
                    TextBox.FocusLost:Connect(function() -- Line: 631
                        -- upvalues: TextBox (val), a1_3 (val), a1_2 (upval), i (val), getValueByIndex (upval)
                        -- upvalues: updateValueByIndex (upval), a1 (upval)
                        local v1 = tonumber((TextBox.Text:match("-?%d*%.?%d*")))
                        local number = a1_3.state.number
                        local v2 = a1_3
                        if a1_2 ~= "Color4" then
                            if a1_2 == "Color3" or a1_2 == "Color4" then
                                number = v2.state.color
                            end
                        elseif i == 4 then
                            number = v2.state.transparency
                        elseif a1_2 == "Color3" or a1_2 == "Color4" then
                            number = v2.state.color
                        end
                        if v1 ~= nil then
                            if a1_2 == "Color3" or a1_2 == "Color4" and not v2.arguments.UseFloats then
                                v1 = v1 / 255
                            end
                            if a1_3.arguments.Min ~= nil then
                                v1 = math.max(v1, (getValueByIndex(a1_3.arguments.Min, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Max ~= nil then
                                v1 = math.min(v1, (getValueByIndex(a1_3.arguments.Max, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Increment then
                                v1 = (math.round(v1 / (getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)))) * getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)
                            end
                            number:set((updateValueByIndex(number.value, i, v1, a1_3.arguments)))
                            a1_3.lastNumberChangedTick = a1._cycleTick + 1
                        end
                        local v3 = getValueByIndex(number.value, i, a1_3.arguments)
                        if a1_2 == "Color3" or a1_2 == "Color4" and not v2.arguments.UseFloats then
                            v3 = math.round(v3 * 255)
                        end
                        local v4 = a1_3.arguments.Format[i] or a1_3.arguments.Format[1]
                        if a1_3.arguments.Prefix then
                            v4 = a1_3.arguments.Prefix[i] .. v4
                        end
                        TextBox.Text = string.format(v4, v3)
                        a1_3.state.editingText:set(0)
                        TextBox:ReleaseFocus(true)
                    end)
                    TextBox.Focused:Connect(function() -- Line: 674 -- upvalues: TextBox (val), a1_3 (val), i (val)
                        TextBox.CursorPosition = #TextBox.Text + 1
                        TextBox.SelectionStart = 1
                        a1_3.state.editingText:set(i)
                    end)
                    a2.applyButtonDown(TextButton, function(a1, a2) -- Line: 682
                        -- upvalues: DragMouseDown (upval), a1_3 (val), a1_2 (upval), i (val)
                        DragMouseDown(a1_3, a1_2, i, a1, a2)
                    end)
                end
                local TextLabel = Instance.new("TextLabel")
                TextLabel.Name = "TextLabel"
                TextLabel.BackgroundTransparency = 1
                TextLabel.BorderSizePixel = 0
                TextLabel.LayoutOrder = 6
                TextLabel.AutomaticSize = Enum.AutomaticSize.XY
                a2.applyTextStyle(TextLabel)
                TextLabel.Parent = Frame
                return Frame
            end,
            Update = function(a1) -- Line: 700 -- upvalues: a1_2 (val), a2_2 (val), u126 (upval), getValueByIndex (upval), u85 (upval)
                local TextLabel = a1.Instance.TextLabel
                local Text = a1.arguments.Text or ("Drag %*"):format(a1_2)
                TextLabel.Text = Text
                if a1.arguments.Format and typeof(a1.arguments.Format) ~= "table" then
                    a1.arguments.Format = {a1.arguments.Format}
                    return
                end
                if not a1.arguments.Format then
                    local v1, v2
                    local v3 = {}
                    local v4 = a1
                    for i = 1, a2_2 do
                        v1 = u126[a1_2][i]
                        if v4.arguments.Increment then
                            v2 = getValueByIndex(v4.arguments.Increment, i, v4.arguments)
                            v1 = math.max(v1, math.ceil(-(math.log10(if v2 ~= 0 then v2 else 1))), v1)
                        end
                        if v4.arguments.Max then
                            v2 = getValueByIndex(v4.arguments.Max, i, v4.arguments)
                            v1 = math.max(v1, math.ceil(-(math.log10(if v2 ~= 0 then v2 else 1))), v1)
                        end
                        if v4.arguments.Min then
                            v2 = getValueByIndex(v4.arguments.Min, i, v4.arguments)
                            v1 = math.max(v1, math.ceil(-(math.log10(if v2 ~= 0 then v2 else 1))), v1)
                        end
                        if not (v1 > 0) then
                            v3[i] = "%d"
                        else
                            v3[i] = (("%%.%*f"):format(v1))
                        end
                    end
                    v4.arguments.Format = v3
                    v4.arguments.Prefix = u85[a1_2]
                end
            end,
            Discard = function(a1) -- Line: 740 -- upvalues: a2 (upval)
                a1.Instance:Destroy()
                a2.discardState(a1)
            end,
            GenerateState = function(a1_2) -- Line: 744 -- upvalues: a1 (upval), a3 (val)
                if a1_2.state.number == nil then
                    a1_2.state.number = a1._widgetState(a1_2, "number", a3)
                end
                if a1_2.state.editingText == nil then
                    a1_2.state.editingText = a1._widgetState(a1_2, "editingText", false)
                end
            end,
            UpdateState = function(a1_3) -- Line: 752 -- upvalues: a2_2 (val), a1_2 (val), getValueByIndex (upval), a1 (upval)
                local InputField, number, v1, v2, v3
                local Instance = a1_3.Instance
                for i = 1, a2_2 do
                    number = a1_3.state.number
                    if a1_2 == "Color3" or a1_2 == "Color4" then
                        number = a1_3.state.color
                        if i == 4 then
                            number = a1_3.state.transparency
                        end
                    end
                    v1 = Instance:FindFirstChild("DragField" .. (tostring(i)))
                    InputField = v1.InputField
                    v2 = getValueByIndex(number.value, i, a1_3.arguments)
                    if a1_2 == "Color3" then
                        if not a1_3.arguments.UseFloats then
                            v2 = math.round(v2 * 255)
                        end
                    elseif a1_2 == "Color4" and not a1_3.arguments.UseFloats then
                        v2 = math.round(v2 * 255)
                    end
                    v3 = a1_3.arguments.Format[i] or a1_3.arguments.Format[1]
                    if a1_3.arguments.Prefix then
                        v3 = a1_3.arguments.Prefix[i] .. v3
                    end
                    v1.Text = string.format(v3, v2)
                    InputField.Text = tostring(v2)
                    if a1_3.state.editingText.value ~= i then
                        InputField.Visible = false
                        v1.TextTransparency = a1._config.TextTransparency
                    else
                        InputField.Visible = true
                        InputField:CaptureFocus()
                        v1.TextTransparency = 1
                    end
                end
                if a1_2 == "Color3" or a1_2 == "Color4" then
                    local ColorBox = Instance.ColorBox
                    ColorBox.BackgroundColor3 = a1_3.state.color.value
                    if a1_2 == "Color4" then
                        ColorBox.ImageTransparency = 1 - a1_3.state.transparency.value
                    end
                end
            end,
        }
    end

    local function generateColorDragScalar(a1_2, ...) -- Line: 801
        -- upvalues: generateDragScalar (ref), a2 (val), u85 (val), a1 (val)
        local u1 = {}
        u1[1] = ...
        return a2.extend(generateDragScalar(a1_2, if a1_2 ~= "Color4" then 3 else 4, u1[1]), {
            Args = {Text = 1, UseFloats = 2, UseHSV = 3, Format = 4},
            Update = function(a1_3) -- Line: 812 -- upvalues: a1_2 (val), u85 (upval), a1 (upval)
                local v1
                local TextLabel = a1_3.Instance.TextLabel
                local Text = a1_3.arguments.Text or ("Drag %*"):format(a1_2)
                TextLabel.Text = Text
                if not a1_3.arguments.Format then
                    if not a1_3.arguments.Format then
                        if not a1_3.arguments.UseFloats then
                            a1_3.arguments.Format = {"%d"}
                        else
                            a1_3.arguments.Format = {"%.3f"}
                        end
                        v1 = u85
                        a1_3.arguments.Prefix = v1[a1_2 .. (if not a1_3.arguments.UseHSV then "_RGB" else "_HSV")]
                    end
                elseif typeof(a1_3.arguments.Format) ~= "table" then
                    a1_3.arguments.Format = {a1_3.arguments.Format}
                elseif not a1_3.arguments.Format then
                    if not a1_3.arguments.UseFloats then
                        a1_3.arguments.Format = {"%d"}
                    else
                        a1_3.arguments.Format = {"%.3f"}
                    end
                    v1 = u85
                    a1_3.arguments.Prefix = v1[a1_2 .. (if not a1_3.arguments.UseHSV then "_RGB" else "_HSV")]
                end
                a1_3.arguments.Min = {0, 0, 0, 0}
                a1_3.arguments.Max = {1, 1, 1, 1}
                a1_3.arguments.Increment = {0.001, 0.001, 0.001, 0.001}
                if a1_3.state then
                    a1_3.state.color.lastChangeTick = a1._cycleTick
                    if a1_2 == "Color4" then
                        a1_3.state.transparency.lastChangeTick = a1._cycleTick
                    end
                    a1._widgets[a1_3.type].UpdateState(a1_3)
                end
            end,
            GenerateState = function(a1_3) -- Line: 843 -- upvalues: a1 (upval), u1 (val), a1_2 (val)
                if a1_3.state.color == nil then
                    a1_3.state.color = a1._widgetState(a1_3, "color", u1[1])
                end
                if a1_2 == "Color4" and a1_3.state.transparency == nil then
                    a1_3.state.transparency = a1._widgetState(a1_3, "transparency", u1[2])
                end
                if a1_3.state.editingText == nil then
                    a1_3.state.editingText = a1._widgetState(a1_3, "editingText", false)
                end
            end,
        })
    end

    local u182 = false
    local u183 = nil
    local u184 = 0
    local u185 = ""

    local function updateActiveSlider() -- Line: 871
        -- upvalues: u182 (ref), u183 (ref), u184 (ref), getValueByIndex (val), u7 (val), u185 (ref), u39 (val)
        -- upvalues: u62 (val), a2 (val), updateValueByIndex (val), a1 (val)
        if u182 == false or u183 == nil then
            return
        end
        local v1 = u183.Instance:FindFirstChild("SliderField" .. (tostring(u184)))
        local GrabBar = v1.GrabBar
        local v2 = u183.arguments.Increment and getValueByIndex(u183.arguments.Increment, u184, u183.arguments) or u7[u185][u184]
        local v3 = u183.arguments.Min and getValueByIndex(u183.arguments.Min, u184, u183.arguments) or u39[u185][u184]
        local v4 = u183.arguments.Max and getValueByIndex(u183.arguments.Max, u184, u183.arguments) or u62[u185][u184]
        local X = GrabBar.AbsoluteSize.X
        local v5 = math.clamp(
            math.round(((a2.getMouseLocation()).X - (v1.AbsolutePosition.X - a2.GuiOffset.X + X / 2)) / (v1.AbsoluteSize.X - X) * (math.floor((v4 - v3) / v2))) * v2 + v3,
            v3,
            v4
        )
        u183.state.number:set((updateValueByIndex(u183.state.number.value, u184, v5, u183.arguments)))
        u183.lastNumberChangedTick = a1._cycleTick + 1
    end

    local function SliderMouseDown(a1, a2_2, a3) -- Line: 897
        -- upvalues: a2 (val), u182 (ref), u183 (ref), u184 (ref), u185 (ref), updateActiveSlider (val)
        local v1 = a2.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or a2.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)
        if v1 then
            a1.state.editingText:set(a3)
            return
        end
        u182 = true
        u183 = a1
        u184 = a3
        u185 = a2_2
        updateActiveSlider()
    end

    a2.registerEvent("InputChanged", function() -- Line: 910 -- upvalues: a1 (val), updateActiveSlider (val)
        if not a1._started then
            return
        end
        updateActiveSlider()
    end)
    a2.registerEvent("InputEnded", function(a1_2) -- Line: 917
        -- upvalues: a1 (val), u182 (ref), u183 (ref), u184 (ref), u185 (ref)
        if not a1._started then
            return
        end
        if a1_2.UserInputType == Enum.UserInputType.MouseButton1 and u182 then
            u182 = false
            u183 = nil
            u184 = 0
            u185 = ""
        end
    end)

    local function generateSliderScalar(a1_2, a2_2, a3) -- Line: 929
        -- upvalues: u2 (val), a2 (val), a1 (val), getValueByIndex (val), updateValueByIndex (val)
        -- upvalues: SliderMouseDown (val), u126 (val), u85 (val), u7 (val), u39 (val), u62 (val)
        return {
            hasState = true,
            hasChildren = false,
            Args = {
                Text = 1,
                Increment = 2,
                Min = 3,
                Max = 4,
                Format = 5,
            },
            Events = {
                numberChanged = u2,
                hovered = a2.EVENTS.hover(function(a1) -- Line: 942
                    return a1.Instance
                end),
            },
            Generate = function(a1_3) -- Line: 946
                -- upvalues: a1_2 (val), a2 (upval), a1 (upval), a2_2 (val), getValueByIndex (upval)
                -- upvalues: updateValueByIndex (upval), SliderMouseDown (upval)
                local Frame_2, TextButton, TextLabel
                local Frame = Instance.new("Frame")
                Frame.Name = "Iris_Slider" .. a1_2
                Frame.Size = UDim2.fromScale(1, 0)
                Frame.BackgroundTransparency = 1
                Frame.BorderSizePixel = 0
                Frame.LayoutOrder = a1_3.ZIndex
                Frame.AutomaticSize = Enum.AutomaticSize.Y
                local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
                v1.VerticalAlignment = Enum.VerticalAlignment.Center
                local v2 = UDim.new(
                    a1._config.ContentWidth.Scale / a2_2,
                    (a1._config.ContentWidth.Offset - a1._config.ItemInnerSpacing.X * (a2_2 - 1)) / a2_2
                )
                local v3 = UDim.new(v2.Scale * (a2_2 - 1), v2.Offset * (a2_2 - 1) + a1._config.ItemInnerSpacing.X * (a2_2 - 1))
                local v4 = a1._config.ContentWidth - v3
                for i = 1, a2_2 do
                    TextButton = Instance.new("TextButton")
                    TextButton.Name = "SliderField" .. tostring(i)
                    TextButton.LayoutOrder = i
                    if i ~= a2_2 then
                        TextButton.Size = UDim2.new(v2, a1._config.ContentHeight)
                    else
                        TextButton.Size = UDim2.new(v4, a1._config.ContentHeight)
                    end
                    TextButton.AutomaticSize = Enum.AutomaticSize.Y
                    TextButton.BackgroundColor3 = a1._config.FrameBgColor
                    TextButton.BackgroundTransparency = a1._config.FrameBgTransparency
                    TextButton.AutoButtonColor = false
                    TextButton.Text = ""
                    TextButton.ClipsDescendants = true
                    a2.applyFrameStyle(TextButton)
                    a2.applyTextStyle(TextButton)
                    a2.UISizeConstraint(TextButton, Vector2.xAxis)
                    TextButton.Parent = Frame
                    TextLabel = Instance.new("TextLabel")
                    TextLabel.Name = "OverlayText"
                    TextLabel.Size = UDim2.fromScale(1, 1)
                    TextLabel.BackgroundTransparency = 1
                    TextLabel.BorderSizePixel = 0
                    TextLabel.ZIndex = 10
                    TextLabel.ClipsDescendants = true
                    a2.applyTextStyle(TextLabel)
                    TextLabel.TextXAlignment = Enum.TextXAlignment.Center
                    TextLabel.Parent = TextButton
                    a2.applyInteractionHighlights("Background", TextButton, TextButton, {
                        Color = a1._config.FrameBgColor,
                        Transparency = a1._config.FrameBgTransparency,
                        HoveredColor = a1._config.FrameBgHoveredColor,
                        HoveredTransparency = a1._config.FrameBgHoveredTransparency,
                        ActiveColor = a1._config.FrameBgActiveColor,
                        ActiveTransparency = a1._config.FrameBgActiveTransparency,
                    })
                    local TextBox = Instance.new("TextBox")
                    TextBox.Name = "InputField"
                    TextBox.Size = UDim2.new(1, 0, 1, 0)
                    TextBox.BackgroundTransparency = 1
                    TextBox.ClearTextOnFocus = false
                    TextBox.TextTruncate = Enum.TextTruncate.AtEnd
                    TextBox.ClipsDescendants = true
                    TextBox.Visible = false
                    a2.applyFrameStyle(TextBox, true)
                    a2.applyTextStyle(TextBox)
                    TextBox.Parent = TextButton
                    TextBox.FocusLost:Connect(function() -- Line: 1023
                        -- upvalues: TextBox (val), a1_3 (val), getValueByIndex (upval), i (val)
                        -- upvalues: updateValueByIndex (upval), a1 (upval)
                        local v1 = tonumber((TextBox.Text:match("-?%d*%.?%d*")))
                        if v1 ~= nil then
                            if a1_3.arguments.Min ~= nil then
                                v1 = math.max(v1, (getValueByIndex(a1_3.arguments.Min, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Max ~= nil then
                                v1 = math.min(v1, (getValueByIndex(a1_3.arguments.Max, i, a1_3.arguments)))
                            end
                            if a1_3.arguments.Increment then
                                v1 = (math.round(v1 / (getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)))) * getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)
                            end
                            a1_3.state.number:set((updateValueByIndex(a1_3.state.number.value, i, v1, a1_3.arguments)))
                            a1_3.lastNumberChangedTick = a1._cycleTick + 1
                        end
                        local v2 = a1_3.arguments.Format[i] or a1_3.arguments.Format[1]
                        if a1_3.arguments.Prefix then
                            v2 = a1_3.arguments.Prefix[i] .. v2
                        end
                        TextBox.Text = string.format(v2, getValueByIndex(a1_3.state.number.value, i, a1_3.arguments))
                        a1_3.state.editingText:set(0)
                        TextBox:ReleaseFocus(true)
                    end)
                    TextBox.Focused:Connect(function() -- Line: 1052 -- upvalues: TextBox (val), a1_3 (val), i (val)
                        TextBox.CursorPosition = #TextBox.Text + 1
                        TextBox.SelectionStart = 1
                        a1_3.state.editingText:set(i)
                    end)
                    a2.applyButtonDown(TextButton, function() -- Line: 1060 -- upvalues: SliderMouseDown (upval), a1_3 (val), a1_2 (upval), i (val)
                        SliderMouseDown(a1_3, a1_2, i)
                    end)
                    Frame_2 = Instance.new("Frame")
                    Frame_2.Name = "GrabBar"
                    Frame_2.ZIndex = 5
                    Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
                    Frame_2.Position = UDim2.new(0, 0, 0.5, 0)
                    Frame_2.BorderSizePixel = 0
                    Frame_2.BackgroundColor3 = a1._config.SliderGrabColor
                    Frame_2.Transparency = a1._config.SliderGrabTransparency
                    if 0 < a1._config.GrabRounding then
                        a2.UICorner(Frame_2, a1._config.GrabRounding)
                    end
                    a2.UISizeConstraint(Frame_2, Vector2.new(a1._config.GrabMinSize, 0))
                    Frame_2.Parent = TextButton
                end
                local TextLabel_2 = Instance.new("TextLabel")
                TextLabel_2.Name = "TextLabel"
                TextLabel_2.BackgroundTransparency = 1
                TextLabel_2.BorderSizePixel = 0
                TextLabel_2.LayoutOrder = 5
                TextLabel_2.AutomaticSize = Enum.AutomaticSize.XY
                a2.applyTextStyle(TextLabel_2)
                TextLabel_2.Parent = Frame
                return Frame
            end,
            Update = function(a1_3) -- Line: 1094
                -- upvalues: a1_2 (val), a2_2 (val), u126 (upval), getValueByIndex (upval), u85 (upval), u7 (upval)
                -- upvalues: u39 (upval), u62 (upval), a1 (upval)
                local GrabBar, v1, v2, v3, v4
                local Instance = a1_3.Instance
                local TextLabel = Instance.TextLabel
                local Text = a1_3.arguments.Text or ("Slider %*"):format(a1_2)
                TextLabel.Text = Text
                if not a1_3.arguments.Format then
                    if not a1_3.arguments.Format then
                        v1 = {}
                        for i = 1, a2_2 do
                            v2 = u126[a1_2][i]
                            if a1_3.arguments.Increment then
                                v3 = getValueByIndex(a1_3.arguments.Increment, i, a1_3.arguments)
                                v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                            end
                            if a1_3.arguments.Max then
                                v3 = getValueByIndex(a1_3.arguments.Max, i, a1_3.arguments)
                                v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                            end
                            if a1_3.arguments.Min then
                                v3 = getValueByIndex(a1_3.arguments.Min, i, a1_3.arguments)
                                v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                            end
                            if not (v2 > 0) then
                                v1[i] = "%d"
                            else
                                v1[i] = (("%%.%*f"):format(v2))
                            end
                        end
                        a1_3.arguments.Format = v1
                        a1_3.arguments.Prefix = u85[a1_2]
                    end
                elseif typeof(a1_3.arguments.Format) ~= "table" then
                    a1_3.arguments.Format = {a1_3.arguments.Format}
                elseif not a1_3.arguments.Format then
                    v1 = {}
                    for j = 1, a2_2 do
                        v2 = u126[a1_2][j]
                        if a1_3.arguments.Increment then
                            v3 = getValueByIndex(a1_3.arguments.Increment, j, a1_3.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if a1_3.arguments.Max then
                            v3 = getValueByIndex(a1_3.arguments.Max, j, a1_3.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if a1_3.arguments.Min then
                            v3 = getValueByIndex(a1_3.arguments.Min, j, a1_3.arguments)
                            v2 = math.max(v2, math.ceil(-(math.log10(if v3 ~= 0 then v3 else 1))), v2)
                        end
                        if not (v2 > 0) then
                            v1[j] = "%d"
                        else
                            v1[j] = (("%%.%*f"):format(v2))
                        end
                    end
                    a1_3.arguments.Format = v1
                    a1_3.arguments.Prefix = u85[a1_2]
                end
                for k = 1, a2_2 do
                    GrabBar = Instance:FindFirstChild("SliderField" .. (tostring(k))).GrabBar
                    v3 = a1_3.arguments.Increment and getValueByIndex(a1_3.arguments.Increment, k, a1_3.arguments) or u7[a1_2][k]
                    v4 = a1_3.arguments.Min and getValueByIndex(a1_3.arguments.Min, k, a1_3.arguments) or u39[a1_2][k]
                    GrabBar.Size = UDim2.new(
                        1 / math.floor(((a1_3.arguments.Max and getValueByIndex(a1_3.arguments.Max, k, a1_3.arguments) or u62[a1_2][k]) + 1 - v4) / v3),
                        0,
                        1,
                        0
                    )
                end
                local u291 = #a1._postCycleCallbacks + 1
                local u294 = a1._cycleTick + 1

                a1._postCycleCallbacks[u291] = function() -- Line: 1149 -- upvalues: a1 (upval), u294 (val), a1_3 (val), a1_2 (upval), u291 (val)
                    if u294 <= a1._cycleTick then
                        if a1_3.lastCycleTick ~= -1 then
                            a1_3.state.number.lastChangeTick = a1._cycleTick
                            local v1 = a1_2
                            a1._widgets[("Slider%*"):format(v1)].UpdateState(a1_3)
                        end
                        a1._postCycleCallbacks[u291] = nil
                    end
                end
            end,
            Discard = function(a1) -- Line: 1159 -- upvalues: a2 (upval)
                a1.Instance:Destroy()
                a2.discardState(a1)
            end,
            GenerateState = function(a1_2) -- Line: 1163 -- upvalues: a1 (upval), a3 (val)
                if a1_2.state.number == nil then
                    a1_2.state.number = a1._widgetState(a1_2, "number", a3)
                end
                if a1_2.state.editingText == nil then
                    a1_2.state.editingText = a1._widgetState(a1_2, "editingText", false)
                end
            end,
            UpdateState = function(a1) -- Line: 1171
                -- upvalues: a2_2 (val), getValueByIndex (upval), u7 (upval), a1_2 (val), u39 (upval), u62 (upval)
                local GrabBar, InputField, OverlayText, X, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
                local v11 = a1
                for i = 1, a2_2 do
                    v9 = a1.Instance:FindFirstChild("SliderField" .. (tostring(i)))
                    InputField = v9.InputField
                    OverlayText = v9.OverlayText
                    GrabBar = v9.GrabBar
                    v10 = getValueByIndex(v11.state.number.value, i, v11.arguments)
                    v1 = v11.arguments.Format[i] or v11.arguments.Format[1]
                    if v11.arguments.Prefix then
                        v1 = v11.arguments.Prefix[i] .. v1
                    end
                    OverlayText.Text = string.format(v1, v10)
                    InputField.Text = tostring(v10)
                    v2 = v11.arguments.Increment and getValueByIndex(v11.arguments.Increment, i, v11.arguments) or u7[a1_2][i]
                    v3 = v11.arguments.Min and getValueByIndex(v11.arguments.Min, i, v11.arguments) or u39[a1_2][i]
                    v4 = v11.arguments.Max and getValueByIndex(v11.arguments.Max, i, v11.arguments) or u62[a1_2][i]
                    X = v9.AbsoluteSize.X
                    v5 = X - GrabBar.AbsoluteSize.X
                    v6 = (v10 - v3) / (v4 - v3)
                    v7 = math.floor((v4 - v3) / v2)
                    v8 = math.clamp(math.floor(v6 * v7) / v7, 0, 1)
                    GrabBar.Position = UDim2.new(v5 / X * v8 + (1 - v5 / X) / 2, 0, 0.5, 0)
                    if v11.state.editingText.value ~= i then
                        InputField.Visible = false
                        OverlayText.Visible = true
                        GrabBar.Visible = true
                    else
                        InputField.Visible = true
                        OverlayText.Visible = false
                        GrabBar.Visible = false
                        InputField:CaptureFocus()
                    end
                end
            end,
        }
    end

    local function generateEnumSliderScalar(a1_2, a2_2) -- Line: 1217
        -- upvalues: generateSliderScalar (ref), a2 (val), a1 (val)
        local v1 = generateSliderScalar("Enum", 1, a2_2.Value)
        local v2 = {string}
        for i, j in a1_2:GetEnumItems() do
            v2[j.Value] = j.Name
        end
        return a2.extend(v1, {
            Args = {Text = 1},
            Update = function(a1) -- Line: 1229 -- upvalues: a1_2 (val)
                local Instance = a1.Instance
                Instance.TextLabel.Text = a1.arguments.Text or "Input Enum"
                a1.arguments.Increment = 1
                a1.arguments.Min = 0
                a1.arguments.Max = #a1_2:GetEnumItems() - 1
                local GrabBar = (Instance:FindFirstChild("SliderField1")).GrabBar
                GrabBar.Size = UDim2.new(1 / math.floor(#(a1_2:GetEnumItems())), 0, 1, 0)
            end,
            GenerateState = function(a1_2) -- Line: 1245 -- upvalues: a1 (upval), a2_2 (val)
                if a1_2.state.number == nil then
                    a1_2.state.number = a1._widgetState(a1_2, "number", a2_2.Value)
                end
                if a1_2.state.enumItem == nil then
                    a1_2.state.enumItem = a1._widgetState(a1_2, "enumItem", a2_2)
                end
                if a1_2.state.editingText == nil then
                    a1_2.state.editingText = a1._widgetState(a1_2, "editingText", false)
                end
            end,
        })
    end

    local v1 = generateInputScalar("Num", 1, 0)
    v1.Args.NoButtons = 6
    a1.WidgetConstructor("InputNum", v1)
    a1.WidgetConstructor("InputVector2", generateInputScalar("Vector2", 2, Vector2.zero))
    a1.WidgetConstructor("InputVector3", generateInputScalar("Vector3", 3, (Vector3.new(0, 0, 0))))
    a1.WidgetConstructor("InputUDim", generateInputScalar("UDim", 2, UDim.new()))
    a1.WidgetConstructor("InputUDim2", generateInputScalar("UDim2", 4, UDim2.new()))
    a1.WidgetConstructor("InputRect", generateInputScalar("Rect", 4, Rect.new(0, 0, 0, 0)))
    a1.WidgetConstructor("DragNum", generateDragScalar("Num", 1, 0))
    a1.WidgetConstructor("DragVector2", generateDragScalar("Vector2", 2, Vector2.zero))
    a1.WidgetConstructor("DragVector3", generateDragScalar("Vector3", 3, (Vector3.new(0, 0, 0))))
    a1.WidgetConstructor("DragUDim", generateDragScalar("UDim", 2, UDim.new()))
    a1.WidgetConstructor("DragUDim2", generateDragScalar("UDim2", 4, UDim2.new()))
    a1.WidgetConstructor("DragRect", generateDragScalar("Rect", 4, Rect.new(0, 0, 0, 0)))
    a1.WidgetConstructor("InputColor3", generateColorDragScalar("Color3", Color3.fromRGB(0, 0, 0)))
    a1.WidgetConstructor("InputColor4", generateColorDragScalar("Color4", Color3.fromRGB(0, 0, 0), 0))
    a1.WidgetConstructor("SliderNum", generateSliderScalar("Num", 1, 0))
    a1.WidgetConstructor("SliderVector2", generateSliderScalar("Vector2", 2, Vector2.zero))
    a1.WidgetConstructor("SliderVector3", generateSliderScalar("Vector3", 3, (Vector3.new(0, 0, 0))))
    a1.WidgetConstructor("SliderUDim", generateSliderScalar("UDim", 2, UDim.new()))
    a1.WidgetConstructor("SliderUDim2", generateSliderScalar("UDim2", 4, UDim2.new()))
    a1.WidgetConstructor("SliderRect", generateSliderScalar("Rect", 4, Rect.new(0, 0, 0, 0)))
    a1.WidgetConstructor("InputText", {
        hasState = true,
        hasChildren = false,
        Args = {Text = 1, TextHint = 2, ReadOnly = 3, MultiLine = 4},
        Events = {
            textChanged = {
                Init = function(a1) -- Line: 1301
                    a1.lastTextChangedTick = 0
                end,
                Get = function(a1_2) -- Line: 1304 -- upvalues: a1 (val)
                    return a1_2.lastTextChangedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 1308
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 1312 -- upvalues: a2 (val), a1 (val)
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_InputText"
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.Size = UDim2.fromScale(1, 0)
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex
            Frame.LayoutOrder = a1_2.ZIndex
            local v1 = a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, a1._config.ItemInnerSpacing.X))
            v1.VerticalAlignment = Enum.VerticalAlignment.Center
            local TextBox = Instance.new("TextBox")
            TextBox.Name = "InputField"
            TextBox.Size = UDim2.new(a1._config.ContentWidth, a1._config.ContentHeight)
            TextBox.AutomaticSize = Enum.AutomaticSize.Y
            TextBox.BackgroundColor3 = a1._config.FrameBgColor
            TextBox.BackgroundTransparency = a1._config.FrameBgTransparency
            TextBox.Text = ""
            TextBox.TextYAlignment = Enum.TextYAlignment.Top
            TextBox.PlaceholderColor3 = a1._config.TextDisabledColor
            TextBox.ClearTextOnFocus = false
            TextBox.ClipsDescendants = true
            a2.applyFrameStyle(TextBox)
            a2.applyTextStyle(TextBox)
            a2.UISizeConstraint(TextBox, Vector2.xAxis)
            TextBox.Parent = Frame
            TextBox.FocusLost:Connect(function() -- Line: 1343 -- upvalues: a1_2 (val), TextBox (val), a1 (upval)
                a1_2.state.text:set(TextBox.Text)
                a1_2.lastTextChangedTick = a1._cycleTick + 1
            end)
            local v2 = a1._config.TextSize + 2 * a1._config.FramePadding.Y
            local TextLabel = Instance.new("TextLabel")
            TextLabel.Name = "TextLabel"
            TextLabel.Size = UDim2.fromOffset(0, v2)
            TextLabel.AutomaticSize = Enum.AutomaticSize.X
            TextLabel.BackgroundTransparency = 1
            TextLabel.BorderSizePixel = 0
            TextLabel.LayoutOrder = 1
            a2.applyTextStyle(TextLabel)
            TextLabel.Parent = Frame
            return Frame
        end,
        Update = function(a1) -- Line: 1364
            local Instance = a1.Instance
            local TextLabel = Instance.TextLabel
            local InputField = Instance.InputField
            TextLabel.Text = a1.arguments.Text or "Input Text"
            InputField.PlaceholderText = a1.arguments.TextHint or ""
            InputField.TextEditable = not a1.arguments.ReadOnly
            InputField.MultiLine = a1.arguments.MultiLine or false
        end,
        Discard = function(a1) -- Line: 1374 -- upvalues: a2 (val)
            a1.Instance:Destroy()
            a2.discardState(a1)
        end,
        GenerateState = function(a1_2) -- Line: 1378 -- upvalues: a1 (val)
            if a1_2.state.text == nil then
                a1_2.state.text = a1._widgetState(a1_2, "text", "")
            end
        end,
        UpdateState = function(a1) -- Line: 1383
            a1.Instance.InputField.Text = a1.state.text.value
        end,
    })
end