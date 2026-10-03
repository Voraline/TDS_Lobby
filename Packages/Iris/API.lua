-- Script path: ReplicatedStorage.Packages.Iris.API
-- Decompile time: 4.74 ms

require(script.Parent.Types)
return function(a1) -- Line: 3
    local function wrapper(a1_2) -- Line: 5 -- upvalues: a1 (val) -- types: a1_2: string
        return function(a1_3, a2) -- Line: 6 -- upvalues: a1 (upval), a1_2 (val)
            return a1.Internal._Insert(a1_2, a1_3, a2)
        end
    end

    local u2 = "Window"

    function a1.Window(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u2 (val)
        return a1.Internal._Insert(u2, a1_2, a2)
    end

    a1.SetFocusedWindow = a1.Internal.SetFocusedWindow
    local u6 = "Tooltip"

    function a1.Tooltip(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u6 (val)
        return a1.Internal._Insert(u6, a1_2, a2)
    end

    local u8 = "MenuBar"

    function a1.MenuBar(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u8 (val)
        return a1.Internal._Insert(u8, a1_2, a2)
    end

    local u10 = "Menu"

    function a1.Menu(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u10 (val)
        return a1.Internal._Insert(u10, a1_2, a2)
    end

    local u12 = "MenuItem"

    function a1.MenuItem(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u12 (val)
        return a1.Internal._Insert(u12, a1_2, a2)
    end

    local u14 = "MenuToggle"

    function a1.MenuToggle(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u14 (val)
        return a1.Internal._Insert(u14, a1_2, a2)
    end

    local u16 = "Separator"

    function a1.Separator(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u16 (val)
        return a1.Internal._Insert(u16, a1_2, a2)
    end

    local u18 = "Indent"

    function a1.Indent(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u18 (val)
        return a1.Internal._Insert(u18, a1_2, a2)
    end

    local u20 = "SameLine"

    function a1.SameLine(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u20 (val)
        return a1.Internal._Insert(u20, a1_2, a2)
    end

    local u22 = "Group"

    function a1.Group(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u22 (val)
        return a1.Internal._Insert(u22, a1_2, a2)
    end

    local u24 = "Text"

    function a1.Text(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u24 (val)
        return a1.Internal._Insert(u24, a1_2, a2)
    end

    function a1.TextWrapped(a1_2) -- Line: 366 -- upvalues: a1 (val)
        a1_2[2] = true
        return (a1.Internal._Insert("Text", a1_2))
    end

    function a1.TextColored(a1_2) -- Line: 391 -- upvalues: a1 (val)
        a1_2[3] = a1_2[2]
        a1_2[2] = nil
        return (a1.Internal._Insert("Text", a1_2))
    end

    local u28 = "SeparatorText"

    function a1.SeparatorText(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u28 (val)
        return a1.Internal._Insert(u28, a1_2, a2)
    end

    local u30 = "InputText"

    function a1.InputText(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u30 (val)
        return a1.Internal._Insert(u30, a1_2, a2)
    end

    local u32 = "Button"

    function a1.Button(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u32 (val)
        return a1.Internal._Insert(u32, a1_2, a2)
    end

    local u34 = "SmallButton"

    function a1.SmallButton(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u34 (val)
        return a1.Internal._Insert(u34, a1_2, a2)
    end

    local u36 = "Checkbox"

    function a1.Checkbox(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u36 (val)
        return a1.Internal._Insert(u36, a1_2, a2)
    end

    local u38 = "RadioButton"

    function a1.RadioButton(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u38 (val)
        return a1.Internal._Insert(u38, a1_2, a2)
    end

    local u40 = "Image"

    function a1.Image(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u40 (val)
        return a1.Internal._Insert(u40, a1_2, a2)
    end

    local u42 = "ImageButton"

    function a1.ImageButton(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u42 (val)
        return a1.Internal._Insert(u42, a1_2, a2)
    end

    local u44 = "Tree"

    function a1.Tree(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u44 (val)
        return a1.Internal._Insert(u44, a1_2, a2)
    end

    local u46 = "CollapsingHeader"

    function a1.CollapsingHeader(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u46 (val)
        return a1.Internal._Insert(u46, a1_2, a2)
    end

    local u48 = "TabBar"

    function a1.TabBar(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u48 (val)
        return a1.Internal._Insert(u48, a1_2, a2)
    end

    local u50 = "Tab"

    function a1.Tab(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u50 (val)
        return a1.Internal._Insert(u50, a1_2, a2)
    end

    local u52 = "InputNum"

    function a1.InputNum(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u52 (val)
        return a1.Internal._Insert(u52, a1_2, a2)
    end

    local u54 = "InputVector2"

    function a1.InputVector2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u54 (val)
        return a1.Internal._Insert(u54, a1_2, a2)
    end

    local u56 = "InputVector3"

    function a1.InputVector3(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u56 (val)
        return a1.Internal._Insert(u56, a1_2, a2)
    end

    local u58 = "InputUDim"

    function a1.InputUDim(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u58 (val)
        return a1.Internal._Insert(u58, a1_2, a2)
    end

    local u60 = "InputUDim2"

    function a1.InputUDim2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u60 (val)
        return a1.Internal._Insert(u60, a1_2, a2)
    end

    local u62 = "InputRect"

    function a1.InputRect(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u62 (val)
        return a1.Internal._Insert(u62, a1_2, a2)
    end

    local u64 = "DragNum"

    function a1.DragNum(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u64 (val)
        return a1.Internal._Insert(u64, a1_2, a2)
    end

    local u66 = "DragVector2"

    function a1.DragVector2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u66 (val)
        return a1.Internal._Insert(u66, a1_2, a2)
    end

    local u68 = "DragVector3"

    function a1.DragVector3(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u68 (val)
        return a1.Internal._Insert(u68, a1_2, a2)
    end

    local u70 = "DragUDim"

    function a1.DragUDim(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u70 (val)
        return a1.Internal._Insert(u70, a1_2, a2)
    end

    local u72 = "DragUDim2"

    function a1.DragUDim2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u72 (val)
        return a1.Internal._Insert(u72, a1_2, a2)
    end

    local u74 = "DragRect"

    function a1.DragRect(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u74 (val)
        return a1.Internal._Insert(u74, a1_2, a2)
    end

    local u76 = "InputColor3"

    function a1.InputColor3(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u76 (val)
        return a1.Internal._Insert(u76, a1_2, a2)
    end

    local u78 = "InputColor4"

    function a1.InputColor4(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u78 (val)
        return a1.Internal._Insert(u78, a1_2, a2)
    end

    local u80 = "SliderNum"

    function a1.SliderNum(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u80 (val)
        return a1.Internal._Insert(u80, a1_2, a2)
    end

    local u82 = "SliderVector2"

    function a1.SliderVector2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u82 (val)
        return a1.Internal._Insert(u82, a1_2, a2)
    end

    local u84 = "SliderVector3"

    function a1.SliderVector3(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u84 (val)
        return a1.Internal._Insert(u84, a1_2, a2)
    end

    local u86 = "SliderUDim"

    function a1.SliderUDim(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u86 (val)
        return a1.Internal._Insert(u86, a1_2, a2)
    end

    local u88 = "SliderUDim2"

    function a1.SliderUDim2(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u88 (val)
        return a1.Internal._Insert(u88, a1_2, a2)
    end

    local u90 = "SliderRect"

    function a1.SliderRect(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u90 (val)
        return a1.Internal._Insert(u90, a1_2, a2)
    end

    local u92 = "Selectable"

    function a1.Selectable(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u92 (val)
        return a1.Internal._Insert(u92, a1_2, a2)
    end

    local u94 = "Combo"

    function a1.Combo(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u94 (val)
        return a1.Internal._Insert(u94, a1_2, a2)
    end

    function a1.ComboArray(a1_2, a2, a3) -- Line: 1569 -- upvalues: a1 (val) -- types: a3: table
        local v1 = a1.Internal._Insert("Combo", a1_2, if a2 ~= nil then a2 else a1.State(a3[1]))
        for i, j in a3 do
            a1.Internal._Insert("Selectable", {j, j}, {index = v1.state.index})
        end
        a1.End()
        return v1
    end

    function a1.ComboEnum(a1_2, a2, a3) -- Line: 1618 -- upvalues: a1 (val) -- types: a3: userdata
        local v1 = a1.Internal._Insert("Combo", a1_2, if a2 ~= nil then a2 else a1.State(a3:GetEnumItems()[1]))
        local index = v1.state.index
        for i, j in a3:GetEnumItems() do
            a1.Internal._Insert("Selectable", {j.Name, j}, {index = index})
        end
        a1.End()
        return v1
    end

    a1.InputEnum = a1.ComboEnum
    local u99 = "ProgressBar"

    function a1.ProgressBar(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u99 (val)
        return a1.Internal._Insert(u99, a1_2, a2)
    end

    local u101 = "PlotLines"

    function a1.PlotLines(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u101 (val)
        return a1.Internal._Insert(u101, a1_2, a2)
    end

    local u103 = "PlotHistogram"

    function a1.PlotHistogram(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u103 (val)
        return a1.Internal._Insert(u103, a1_2, a2)
    end

    local u105 = "PlotTimeGraph"

    function a1.PlotTimeGraph(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u105 (val)
        return a1.Internal._Insert(u105, a1_2, a2)
    end

    local u107 = "Table"

    function a1.Table(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u107 (val)
        return a1.Internal._Insert(u107, a1_2, a2)
    end

    local u109 = "EditableTable"

    function a1.EditableTable(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u109 (val)
        return a1.Internal._Insert(u109, a1_2, a2)
    end

    local u111 = "EditableTable"

    function a1.EditableTable(a1_2, a2) -- Line: 6 -- upvalues: a1 (val), u111 (val)
        return a1.Internal._Insert(u111, a1_2, a2)
    end

    function a1.NextColumn() -- Line: 1899 -- upvalues: a1 (val)
        local v1 = a1.Internal._GetParentWidget()
        assert(v1.type == "Table", "Iris.NextColumn() can only be called within a table.")
        v1.RowColumnIndex = v1.RowColumnIndex + 1
    end

    function a1.SetColumnIndex(a1_2) -- Line: 1912 -- upvalues: a1 (val) -- types: a1_2: number
        local v1 = a1.Internal._GetParentWidget()
        assert(v1.type == "Table", "Iris.SetColumnIndex() can only be called within a table.")
        assert(v1.InitialNumColumns <= a1_2, "Iris.SetColumnIndex() argument must be in column range.")
        v1.RowColumnIndex = (math.floor(v1.RowColumnIndex / v1.InitialNumColumns)) + (a1_2 - 1)
    end

    function a1.NextRow() -- Line: 1926 -- upvalues: a1 (val)
        local v1 = a1.Internal._GetParentWidget()
        assert(v1.type == "Table", "Iris.NextColumn() can only be called within a table.")
        local InitialNumColumns = v1.InitialNumColumns
        v1.RowColumnIndex = math.floor((v1.RowColumnIndex + 1) / InitialNumColumns) * InitialNumColumns
    end
end