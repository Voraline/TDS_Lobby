-- Script path: ReplicatedStorage.Packages.Iris.widgets.Table
-- Decompile time: 10.65 ms

require(script.Parent.Parent.Types)
return function(a1, a2) -- Line: 5
    local getTableDescendants
    local u2 = {}
    table.insert(a1._postCycleCallbacks, function() -- Line: 9 -- upvalues: u2 (val)
        for i, j in u2 do
            j.RowColumnIndex = 0
        end
    end)

    local function convertToValue(a1) -- Line: 26 -- types: a1: string
        if a1 == "true" then
            return true
        end
        if a1 == "false" then
            return false
        end
        if tonumber(a1) then
            return (tonumber(a1))
        end
        if a1:gsub("%s", "") == "" then
            return nil
        end
        return a1
    end

    local function convertFromValue(a1) -- Line: 40
        if a1 == nil then
            return ""
        end
        return (tostring(a1))
    end

    local function createTableEntry(a1_2, a2_2) -- Line: 48 -- upvalues: a1 (val), a2 (val) -- types: a2_2: string
        local TextButton = Instance.new("TextButton")
        TextButton.Text = ""
        TextButton.Name = a2_2
        TextButton.Size = UDim2.new(1, 0, 0, 0)
        TextButton.AutomaticSize = Enum.AutomaticSize.Y
        TextButton.BackgroundTransparency = 1
        TextButton.BorderSizePixel = 0
        TextButton.BackgroundColor3 = a1._config.FrameBgColor
        TextButton.BackgroundTransparency = a1._config.FrameBgTransparency
        TextButton.ZIndex = a1_2.ZIndex + 1
        TextButton:SetAttribute("Table", true)
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "Arrow"
        ImageLabel.Size = UDim2.fromOffset(a1._config.TextSize, (math.ceil(a1._config.TextSize * 0.8)))
        ImageLabel.AutomaticSize = Enum.AutomaticSize.Y
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.BorderSizePixel = 0
        ImageLabel.Position = UDim2.fromScale(0, 0.5)
        ImageLabel.AnchorPoint = Vector2.new(0, 0.5)
        ImageLabel.ImageColor3 = a1._config.TextColor
        ImageLabel.ImageTransparency = a1._config.TextTransparency
        ImageLabel.ScaleType = Enum.ScaleType.Fit
        ImageLabel.ZIndex = a1_2.ZIndex
        ImageLabel.LayoutOrder = 0
        ImageLabel.Parent = TextButton
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "Key"
        TextLabel.Size = UDim2.new(1, -a1._config.TextSize, 0, 0)
        TextLabel.Position = UDim2.new(0, a1._config.TextSize, 0, 0)
        TextLabel.AutomaticSize = Enum.AutomaticSize.Y
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.ZIndex = a1_2.ZIndex + 2
        TextLabel.LayoutOrder = 1
        TextLabel.ClipsDescendants = true
        TextLabel.Parent = TextButton
        Instance.new("UIPadding").Parent = TextButton
        a2.UISizeConstraint(ImageLabel, Vector2.new(1, 0))
        a2.UISizeConstraint(TextLabel, Vector2.new(1, 0))
        a2.UIStroke(TextButton, 1, a1._config.TableBorderStrongColor, a1._config.TableBorderStrongTransparency)
        a2.applyTextStyle(TextLabel)
        a2.applyFrameStyle(TextLabel)
        a2.applyFrameStyle(ImageLabel)
        TextButton.Parent = a1_2.Instance
        return TextButton, TextLabel, ImageLabel
    end

    local function createInputEntry(a1_2, a2_2) -- Line: 106 -- upvalues: a1 (val), a2 (val) -- types: a2_2: string
        local Frame = Instance.new("Frame")
        Frame.Name = a2_2
        Frame.Size = UDim2.new(1, 0, 0, 0)
        Frame.AutomaticSize = Enum.AutomaticSize.Y
        Frame.BackgroundColor3 = a1._config.FrameBgColor
        Frame.BackgroundTransparency = a1._config.FrameBgTransparency
        Frame.BorderSizePixel = 0
        Frame.ZIndex = a1_2.ZIndex + 1
        local TextLabel = Instance.new("TextLabel")
        TextLabel.Name = "Key"
        TextLabel.Size = UDim2.new(0.5, 0, 0, 0)
        TextLabel.AutomaticSize = Enum.AutomaticSize.Y
        TextLabel.BackgroundTransparency = 1
        TextLabel.BorderSizePixel = 0
        TextLabel.ZIndex = a1_2.ZIndex + 2
        TextLabel.LayoutOrder = 2
        TextLabel.ClipsDescendants = true
        TextLabel.Parent = Frame
        local TextBox = Instance.new("TextBox")
        TextBox.Name = "Value"
        TextBox.Size = UDim2.new(0.5, 0, 0, 0)
        TextBox.AutomaticSize = Enum.AutomaticSize.Y
        TextBox.BackgroundColor3 = a1._config.FrameBgColor
        TextBox.BackgroundTransparency = 1
        TextBox.BorderSizePixel = 0
        TextBox.ZIndex = a1_2.ZIndex + 2
        TextBox.LayoutOrder = 2
        TextBox.ClipsDescendants = true
        TextBox.Parent = Frame
        local Frame_2 = Instance.new("Frame")
        Frame_2.Name = "Seperator"
        Frame_2.Size = UDim2.new(0, 1, 2, 0)
        Frame_2.Position = UDim2.new(1, 1, 0.5, 0)
        Frame_2.AnchorPoint = Vector2.new(0, 0.5)
        Frame_2.BackgroundColor3 = a1._config.SeparatorColor
        Frame_2.BackgroundTransparency = a1._config.SeparatorTransparency
        Frame_2.BorderSizePixel = 0
        Frame_2.ZIndex = a1_2.ZIndex + 2
        Frame_2.LayoutOrder = 1
        Frame_2.Parent = TextLabel
        Instance.new("UIPadding").Parent = Frame
        a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, 0))
        a2.UIStroke(Frame, 1, a1._config.TableBorderStrongColor, a1._config.TableBorderStrongTransparency)
        a2.applyTextStyle(TextLabel)
        a2.applyTextStyle(TextBox)
        a2.applyFrameStyle(TextLabel)
        a2.applyFrameStyle(TextBox)
        a2.UISizeConstraint(TextLabel, Vector2.new(1, 0))
        a2.UISizeConstraint(TextBox, Vector2.new(1, 0))
        Frame.Parent = a1_2.Instance
        return Frame, TextLabel, TextBox
    end

    function getTableDescendants(a1, a2) -- Line: 171
        -- upvalues: getTableDescendants (val)
        local key, v1, v2, value
        local v3 = {}
        local v4 = {}
        for k, v in pairs(a1) do
            table.insert(v4, {key = k, value = v})
        end
        table.sort(v4, function(a1, a2) -- Line: 179
            return a1.key < a2.key
        end)
        local v5 = nil
        local v6 = nil
        local v7 = a2
        for i, j in v4, v5, v6 do
            key = j.key
            value = j.value
            v1 = {key = key, value = value}
            v1.depth = v7 and v7.depth + 1 or 0
            v2 = v7 and ("%*\001%*"):format(v7.path, key) or key
            v1.path = v2
            v1.rawPath = v7 and table.clone(v7.rawPath) or {}
            v1.parent = v7
            table.insert(v1.rawPath, key)
            table.insert(v3, v1)
            if type(value) == "table" then
                for k2, n in getTableDescendants(value, v1) do
                    table.insert(v3, n)
                end
            end
        end
        return v3
    end

    local function refreshTableState(a1_2) -- Line: 209
        -- upvalues: getTableDescendants (val), createTableEntry (val), a2 (val), createInputEntry (val), a1 (val)
        local Arrow, DOWN_POINTING_TRIANGLE, Visible, key, v1, v2, v3, v4, v5, v6, v7, v8, value_2
        local v9 = a1_2.state.expanded:get() or {}
        local v10 = {}
        local v11 = {}
        local v12 = getTableDescendants(a1_2.state.table:get() or {})
        for i, j in a1_2.Instance:GetChildren() do
            if j:IsA("Frame") or j:IsA("TextButton") then
                v10[j.Name] = j
            end
        end
        for i2, v in ipairs(v12) do
            local u155 = nil
            local u157 = nil
            v1 = typeof(v.value)
            v2 = 4 + v.depth * 16
            v3 = v10[v.path]
            v4 = v1 == "table"
            Visible = not v.parent or v9[v.parent.path] and v10[v.parent.path] and v10[v.parent.path].Visible
            if v3 then
                if not v4 then
                    u157 = v3:FindFirstChild("Value")
                elseif v3:GetAttribute("Table") then
                    u155 = v3
                else
                    v3:Destroy()
                    v3 = nil
                end
            end
            if not v3 then
                if not v4 then
                    v6, v7, v8 = createInputEntry(a1_2, v.path)
                    u155 = v6
                    v5 = v7
                    u157 = v8
                    u157.FocusLost:Connect(function() -- Line: 267 -- upvalues: a1_2 (val), u157 (ref), v (val), a1 (upval)
                        local v1, v2
                        local v3 = a1_2.state.table:get() or {}
                        local Text = u157.Text
                        if (if Text ~= "true" then if Text ~= "false" then if not tonumber(Text) then if Text:gsub("%s", "") ~= "" then Text else nil else tonumber(Text) else false else true) == nil then
                            v2 = u157
                            local value = v.value
                            v2.Text = if value ~= nil then tostring(value) else ""
                            return
                        end
                        v2 = table.clone(v.rawPath)
                        local v4 = v3
                        if #v2 > 1 then
                            while #v2 > 1 do
                                v4 = v4[table.remove(v2, 1)]
                            end
                            v4[v2[1]] = v1
                            a1_2.lastTableChangedTick = a1._cycleTick + 1
                            a1_2.state.table:set(v3, true)
                            return
                        end
                        if #v2 == 1 then
                            v3[v2[1]] = v1
                            a1_2.lastTableChangedTick = a1._cycleTick + 1
                            a1_2.state.table:set(v3, true)
                            return
                        end
                        local v5 = u157
                        local value_2 = v.value
                        v5.Text = if value_2 ~= nil then tostring(value_2) else ""
                    end)
                else
                    v6, v7 = createTableEntry(a1_2, v.path)
                    u155 = v6
                    v5 = v7
                    Arrow = u155.Arrow
                    DOWN_POINTING_TRIANGLE = if not v9[v.path] then a2.ICONS.RIGHT_POINTING_TRIANGLE else a2.ICONS.DOWN_POINTING_TRIANGLE
                    Arrow.Image = DOWN_POINTING_TRIANGLE
                    u155.MouseButton1Click:Connect(function() -- Line: 256 -- upvalues: a1_2 (val), v (val), u155 (ref), a2 (upval)
                        local v1 = a1_2.state.expanded:get() or {}
                        local v2 = not v1[v.path]
                        v1[v.path] = v2
                        local Arrow = u155.Arrow
                        local DOWN_POINTING_TRIANGLE = if not v2 then a2.ICONS.RIGHT_POINTING_TRIANGLE else a2.ICONS.DOWN_POINTING_TRIANGLE
                        Arrow.Image = DOWN_POINTING_TRIANGLE
                        a1_2.state.expanded:set(v1, true)
                    end)
                end
                key = v.key
                v5.Text = if key ~= nil then tostring(key) else ""
            end
            v11[v.path] = u155
            u155.LayoutOrder = i2
            if not v.parent then
                if not v4 then
                    v2 = v2 + 16
                    u155.Key.Size = UDim2.new(0.5, -v2 / 2, 0, 0)
                    u155.Value.Size = UDim2.new(0.5, v2 / 2, 0, 0)
                end
                u155.UIPadding.PaddingLeft = UDim.new(0, v2)
                if u157 then
                    value_2 = v.value
                    v5 = if value_2 ~= nil then tostring(value_2) else ""
                    u157.Text = v5
                end
            else
                u155.Visible = Visible
                if u155.Visible then
                    if not v4 then
                        v2 = v2 + 16
                        u155.Key.Size = UDim2.new(0.5, -v2 / 2, 0, 0)
                        u155.Value.Size = UDim2.new(0.5, v2 / 2, 0, 0)
                    end
                    u155.UIPadding.PaddingLeft = UDim.new(0, v2)
                    if u157 then
                        value_2 = v.value
                        v5 = if value_2 ~= nil then tostring(value_2) else ""
                        u157.Text = v5
                    end
                end
            end
        end
        for k, n in v10 do
            if not v11[k] then
                n:Destroy()
            end
        end
    end

    a1.WidgetConstructor("EditableTable", {
        hasState = true,
        hasChildren = false,
        Args = {Table = 1},
        Events = {
            tableChanged = {
                Init = function(a1) end,
                Get = function(a1_2) -- Line: 344 -- upvalues: a1 (val)
                    return a1_2.lastTableChangedTick == a1._cycleTick
                end,
            },
            hovered = a2.EVENTS.hover(function(a1) -- Line: 349
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 353 -- upvalues: u2 (val), a1 (val), a2 (val)
            u2[a1_2.ID] = a1_2
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_EditableTable"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex + 1024
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.ClipsDescendants = true
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
            a2.UIStroke(Frame, 1, a1._config.TableBorderStrongColor, a1._config.TableBorderStrongTransparency)
            return Frame
        end,
        Update = function(a1) end,
        Discard = function(a1) -- Line: 373 -- upvalues: u2 (val)
            u2[a1.ID] = nil
            a1.Instance:Destroy()
        end,
        GenerateState = function(a1_2) -- Line: 377 -- upvalues: a1 (val)
            a1_2.state.expanded = a1._widgetState(a1_2, "expanded", {})
            if a1_2.state.table == nil then
                a1_2.state.table = a1._widgetState(a1_2, "table", {})
            end
        end,
        UpdateState = function(a1) -- Line: 384 -- upvalues: refreshTableState (val)
            refreshTableState(a1)
        end,
    })
    a1.WidgetConstructor("Table", {
        hasState = false,
        hasChildren = true,
        Args = {NumColumns = 1, RowBg = 2, BordersOuter = 3, BordersInner = 4},
        Events = {
            hovered = a2.EVENTS.hover(function(a1) -- Line: 402
                return a1.Instance
            end),
        },
        Generate = function(a1_2) -- Line: 406 -- upvalues: u2 (val), a1 (val), a2 (val)
            u2[a1_2.ID] = a1_2
            a1_2.InitialNumColumns = -1
            a1_2.RowColumnIndex = 0
            a1_2.ColumnInstances = {}
            a1_2.CellInstances = {}
            local Frame = Instance.new("Frame")
            Frame.Name = "Iris_Table"
            Frame.Size = UDim2.new(a1._config.ItemWidth, UDim.new(0, 0))
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = a1_2.ZIndex + 1024
            Frame.LayoutOrder = a1_2.ZIndex
            Frame.ClipsDescendants = true
            a2.UIListLayout(Frame, Enum.FillDirection.Horizontal, UDim.new(0, 0))
            a2.UIStroke(Frame, 1, a1._config.TableBorderStrongColor, a1._config.TableBorderStrongTransparency)
            return Frame
        end,
        Update = function(a1_2) -- Line: 430 -- upvalues: a2 (val), a1 (val)
            local v1
            local Instance_2 = a1_2.Instance
            if a1_2.arguments.BordersOuter ~= false then
                Instance_2.UIStroke.Thickness = 1
            else
                Instance_2.UIStroke.Thickness = 0
            end
            if a1_2.InitialNumColumns == -1 then
                local Frame, v2
                if a1_2.arguments.NumColumns == nil then
                    error("NumColumns argument is required for Iris.Table().", 5)
                end
                a1_2.InitialNumColumns = a1_2.arguments.NumColumns
                local InitialNumColumns = a1_2.InitialNumColumns
                for i = 1, InitialNumColumns do
                    v2 = a1_2.ZIndex + 1 + i
                    Frame = Instance.new("Frame")
                    Frame.Name = ("Column_%*"):format(i)
                    Frame.Size = UDim2.new(1 / a1_2.InitialNumColumns, 0, 0, 0)
                    Frame.AutomaticSize = Enum.AutomaticSize.Y
                    Frame.BackgroundTransparency = 1
                    Frame.BorderSizePixel = 0
                    Frame.ZIndex = v2
                    Frame.LayoutOrder = v2
                    Frame.ClipsDescendants = true
                    a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, 0))
                    a1_2.ColumnInstances[i] = Frame
                    Frame.Parent = Instance_2
                end
            elseif a1_2.arguments.NumColumns ~= a1_2.InitialNumColumns then
                error("NumColumns Argument must be static for Iris.Table().")
            end
            if a1_2.arguments.RowBg ~= false then
                local InitialNumColumns_2, TableRowBgAltTransparency
                local v3 = nil
                local v4 = nil
                for j, k in a1_2.CellInstances, v3, v4 do
                    InitialNumColumns_2 = a1_2.InitialNumColumns
                    TableRowBgAltTransparency = if math.ceil(j / InitialNumColumns_2) % 2 ~= 0 then a1._config.TableRowBgTransparency else a1._config.TableRowBgAltTransparency
                    k.BackgroundTransparency = TableRowBgAltTransparency
                end
            else
                for n, m in a1_2.CellInstances do
                    m.BackgroundTransparency = 1
                end
                v1 = a1_2
            end
            if v1.arguments.BordersInner == false then
                for i7, i8 in v1.CellInstances do
                    i8.UIStroke.Thickness = 0
                end
                return
            end
            for i5, i6 in v1.CellInstances do
                i6.UIStroke.Thickness = 0.5
            end
        end,
        Discard = function(a1) -- Line: 492 -- upvalues: u2 (val)
            u2[a1.ID] = nil
            a1.Instance:Destroy()
        end,
        ChildAdded = function(a1_2, a2_2) -- Line: 496 -- upvalues: a2 (val), a1 (val)
            if a1_2.RowColumnIndex == 0 then
                a1_2.RowColumnIndex = 1
            end
            local v1 = a1_2.CellInstances[a1_2.RowColumnIndex]
            if v1 then
                return v1
            end
            local v2 = a1_2.ColumnInstances[(a1_2.RowColumnIndex - 1) % a1_2.InitialNumColumns + 1]
            local v3 = v2.ZIndex + a1_2.RowColumnIndex
            local Frame = Instance.new("Frame")
            Frame.Name = ("Cell_%*"):format(a1_2.RowColumnIndex)
            Frame.Size = UDim2.new(1, 0, 0, 0)
            Frame.AutomaticSize = Enum.AutomaticSize.Y
            Frame.BackgroundTransparency = 1
            Frame.BorderSizePixel = 0
            Frame.ZIndex = v3
            Frame.LayoutOrder = v3
            Frame.ClipsDescendants = true
            a2.UIPadding(Frame, a1._config.CellPadding)
            a2.UIListLayout(Frame, Enum.FillDirection.Vertical, UDim.new(0, a1._config.ItemSpacing.Y))
            if a1_2.arguments.BordersInner ~= false then
                a2.UIStroke(Frame, 0.5, a1._config.TableBorderLightColor, a1._config.TableBorderLightTransparency)
            else
                a2.UIStroke(Frame, 0, a1._config.TableBorderLightColor, a1._config.TableBorderLightTransparency)
            end
            if a1_2.arguments.RowBg ~= false then
                local v4 = math.ceil(a1_2.RowColumnIndex / a1_2.InitialNumColumns)
                local TableRowBgAltColor = if v4 % 2 ~= 0 then a1._config.TableRowBgColor else a1._config.TableRowBgAltColor
                local TableRowBgAltTransparency = if v4 % 2 ~= 0 then a1._config.TableRowBgTransparency else a1._config.TableRowBgAltTransparency
                Frame.BackgroundColor3 = TableRowBgAltColor
                Frame.BackgroundTransparency = TableRowBgAltTransparency
            end
            a1_2.CellInstances[a1_2.RowColumnIndex] = Frame
            Frame.Parent = v2
            return Frame
        end,
    })
end