-- Script path: ReplicatedStorage.Packages.Iris.demoWindow
-- Decompile time: 48.43 ms

require(script.Parent.Types)
return function(a1) -- Line: 3
    local recursiveMenu, recursiveTree, recursiveWindow
    local u3 = a1.State(true)
    local u6 = a1.State(false)
    local u9 = a1.State(false)
    local u12 = a1.State(false)
    local u15 = a1.State(false)
    local u18 = a1.State(false)
    local u21 = a1.State(false)

    local function helpMarker(a1_2) -- Line: 12 -- upvalues: a1 (val) -- types: a1_2: string
        a1.PushConfig({TextColor = a1._config.TextDisabledColor})
        local v1 = a1.Text({"(?)"})
        a1.PopConfig()
        a1.PushConfig({ContentWidth = UDim.new(0, 350)})
        if v1.hovered() then
            a1.Tooltip({a1_2})
        end
        a1.PopConfig()
    end

    local function textAndHelpMarker(a1_2, a2) -- Line: 24
        -- upvalues: a1 (val), helpMarker (val)
        a1.SameLine()
        a1.Text({a1_2})
        helpMarker(a2)
        a1.End()
    end

    local u24 = {}

    function u24.EditableTable() -- Line: 35 -- upvalues: a1 (val)
        a1.Tree({"EditableTable"})
        local v1 = a1.State({Test1 = 1, Test2 = "2", Test4 = true, Test3 = {}})
        v1:onChange(function(a1) -- Line: 45
            print("updated", a1)
        end)
        print(v1.value)
        a1.EditableTable({}, {table = v1})
        a1.End()
    end

    function u24.Basic() -- Line: 58 -- upvalues: a1 (val)
        a1.Tree({"Basic"})
        a1.SeparatorText({"Basic"})
        local v1 = a1.State(1)
        a1.Button({"Button"})
        a1.SmallButton({"SmallButton"})
        a1.Text({"Text"})
        a1.TextWrapped({string.rep("Text Wrapped ", 5)})
        a1.TextColored({"Colored Text", Color3.fromRGB(255, 128, 0)})
        a1.Text({
            "Rich Text: <b>bold text</b> <i>italic text</i> <u>underline text</u> <s>strikethrough text</s> <font color= \"rgb(240, 40, 10)\">red text</font> <font size=\"32\">bigger text</font>",
            true,
            nil,
            true,
        })
        a1.SameLine()
        a1.RadioButton({"Index '1'", 1}, {index = v1})
        a1.RadioButton({"Index 'two'", "two"}, {index = v1})
        if a1.RadioButton({"Index 'false'", false}, {index = v1}).active() == false
            and a1.SmallButton({"Select last"}).clicked() then
            v1:set(false)
        end
        a1.End()
        a1.Text({"The Index is: " .. tostring(v1.value)})
        a1.SeparatorText({"Inputs"})
        a1.InputNum({})
        a1.DragNum({})
        a1.SliderNum({})
        a1.End()
    end

    function u24.Image() -- Line: 94 -- upvalues: a1 (val)
        a1.Tree({"Image"})
        a1.SeparatorText({"Image Controls"})
        local v1 = a1.State("rbxasset://textures/ui/common/robux.png")
        local v2 = a1.State(UDim2.fromOffset(100, 100))
        local v3 = a1.State(Rect.new(0, 0, 0, 0))
        local v4 = a1.State(Enum.ScaleType.Stretch)
        local v5 = a1.State(false)
        local v6 = a1.ComputedState(v5, function(a1) -- Line: 104 -- types: a1: boolean
            return a1 and Enum.ResamplerMode.Pixelated or Enum.ResamplerMode.Default
        end)
        local v7 = a1.State(a1._config.ImageColor)
        local v8 = a1.State(a1._config.ImageTransparency)
        a1.InputColor4({"Image Tint"}, {color = v7, transparency = v8})
        a1.Combo({"Asset"}, {index = v1})
        a1.Selectable({"Robux Small", "rbxasset://textures/ui/common/robux.png"}, {index = v1})
        a1.Selectable({"Robux Large", "rbxasset://textures//ui/common/robux@3x.png"}, {index = v1})
        a1.Selectable({"Loading Texture", "rbxasset://textures//loading/darkLoadingTexture.png"}, {index = v1})
        a1.Selectable({"Hue-Saturation Gradient", "rbxasset://textures//TagEditor/huesatgradient.png"}, {index = v1})
        a1.Selectable({"famfamfam.png (WHY?)", "rbxasset://textures//TagEditor/famfamfam.png"}, {index = v1})
        a1.End()
        a1.SliderUDim2({"Image Size", nil, nil, UDim2.new(1, 240, 1, 240)}, {number = v2})
        a1.SliderRect({"Image Rect", nil, nil, Rect.new(256, 256, 256, 256)}, {number = v3})
        a1.Combo({"Scale Type"}, {index = v4})
        a1.Selectable({"Stretch", Enum.ScaleType.Stretch}, {index = v4})
        a1.Selectable({"Fit", Enum.ScaleType.Fit}, {index = v4})
        a1.Selectable({"Crop", Enum.ScaleType.Crop}, {index = v4})
        a1.End()
        a1.Checkbox({"Pixelated"}, {isChecked = v5})
        a1.PushConfig({ImageColor = v7:get(), ImageTransparency = v8:get()})
        a1.Image({v1:get(), v2:get(), v3:get(), v4:get(), (v6:get())})
        a1.PopConfig()
        a1.SeparatorText({"Tile"})
        local v9 = a1.State(UDim2.fromScale(0.5, 0.5))
        a1.SliderUDim2({"Tile Size", nil, nil, UDim2.new(1, 240, 1, 240)}, {number = v9})
        a1.PushConfig({ImageColor = v7:get(), ImageTransparency = v8:get()})
        a1.Image({
            "rbxasset://textures/grid2.png",
            v2:get(),
            nil,
            Enum.ScaleType.Tile,
            v6:get(),
            (v9:get()),
        })
        a1.PopConfig()
        a1.SeparatorText({"Slice"})
        local v10 = a1.State(1)
        a1.SliderNum({"Image Slice Scale", 0.1, 0.1, 5}, {number = v10})
        a1.PushConfig({ImageColor = v7:get(), ImageTransparency = v8:get()})
        a1.Image({
            "rbxasset://textures/ui/chatBubble_blue_notify_bkg.png",
            v2:get(),
            nil,
            Enum.ScaleType.Slice,
            v6:get(),
            nil,
            Rect.new(12, 12, 56, 56),
            1,
        }, v10:get())
        a1.PopConfig()
        a1.SeparatorText({"Image Button"})
        local v11 = a1.State(0)
        a1.SameLine()
        a1.PushConfig({ImageColor = v7:get(), ImageTransparency = v8:get()})
        if a1.ImageButton({"rbxasset://textures/AvatarCompatibilityPreviewer/add.png", UDim2.fromOffset(20, 20)}).clicked() then
            v11:set(v11.value + 1)
        end
        a1.PopConfig()
        a1.Text({(("Click count: %*"):format(v11.value))})
        a1.End()
        a1.End()
    end

    function u24.Selectable() -- Line: 185 -- upvalues: a1 (val)
        a1.Tree({"Selectable"})
        local v1 = a1.State(2)
        a1.Selectable({"Selectable #1", 1}, {index = v1})
        a1.Selectable({"Selectable #2", 2}, {index = v1})
        if a1.Selectable({"Double click Selectable", 3, true}, {index = v1}).doubleClicked() then
            v1:set(3)
        end
        a1.Selectable({"Impossible to select", 4, true}, {index = v1})
        if a1.Button({"Select last"}).clicked() then
            v1:set(4)
        end
        a1.Selectable({"Independent Selectable"})
        a1.End()
    end

    function u24.Combo() -- Line: 205 -- upvalues: a1 (val)
        a1.Tree({"Combo"})
        a1.PushConfig({ContentWidth = UDim.new(1, -200)})
        local v1 = a1.State("No Selection")
        a1.SameLine()
        local v2 = a1.Checkbox({"No Preview"})
        local v3 = a1.Checkbox({"No Button"})
        if v2.checked() and v3.isChecked.value == true then
            v3.isChecked:set(false)
        end
        if v3.checked() and v2.isChecked.value == true then
            v2.isChecked:set(false)
        end
        a1.End()
        a1.Combo({"Basic Usage", v3.isChecked:get(), (v2.isChecked:get())}, {index = v1})
        a1.Selectable({"Select 1", "One"}, {index = v1})
        a1.Selectable({"Select 2", "Two"}, {index = v1})
        a1.Selectable({"Select 3", "Three"}, {index = v1})
        a1.End()
        a1.ComboArray({"Using ComboArray"}, {index = "No Selection"}, {"Red", "Green", "Blue"})
        local v4 = {}
        for i = 1, 50 do
            table.insert(v4, (tostring(i)))
        end
        a1.ComboArray({"Height Test"}, {index = "1"}, v4)
        local v5 = a1.State("7 AM")
        a1.Combo({"Combo with Inner widgets"}, {index = v5})
        a1.Tree({"Morning Shifts"})
        a1.Selectable({"Shift at 7 AM", "7 AM"}, {index = v5})
        a1.Selectable({"Shift at 11 AM", "11 AM"}, {index = v5})
        a1.Selectable({"Shift at 3 PM", "3 PM"}, {index = v5})
        a1.End()
        a1.Tree({"Night Shifts"})
        a1.Selectable({"Shift at 6 PM", "6 PM"}, {index = v5})
        a1.Selectable({"Shift at 9 PM", "9 PM"}, {index = v5})
        a1.End()
        a1.End()
        a1.Text({
            "Selected: " .. (a1.ComboEnum({"Using ComboEnum"}, {index = Enum.UserInputState.Begin}, Enum.UserInputState)).index:get().Name,
        })
        a1.PopConfig()
        a1.End()
    end

    function u24.Tree() -- Line: 268 -- upvalues: a1 (val), helpMarker (val)
        a1.Tree({"Trees"})
        a1.Tree({"Tree using SpanAvailWidth", true})
        helpMarker("SpanAvailWidth determines if the Tree is selectable from its entire with, or only the text area")
        a1.End()
        local v1 = a1.Tree({"Tree with Children"})
        a1.Text({"Im inside the first tree!"})
        a1.Button({"Im a button inside the first tree!"})
        a1.Tree({"Im a tree inside the first tree!"})
        a1.Text({"I am the innermost text!"})
        a1.End()
        a1.End()
        a1.Checkbox({"Toggle above tree"}, {isChecked = v1.state.isUncollapsed})
        a1.End()
    end

    function u24.CollapsingHeader() -- Line: 294 -- upvalues: a1 (val)
        a1.Tree({"Collapsing Headers"})
        a1.CollapsingHeader({"A header"})
        a1.Text({"This is under the first header!"})
        a1.End()
        local v1 = a1.State(false)
        a1.CollapsingHeader({"Another header"}, {isUncollapsed = v1})
        if a1.Button({"Shhh... secret button!"}).clicked() then
            v1:set(true)
        end
        a1.End()
        a1.End()
    end

    function u24.Group() -- Line: 315 -- upvalues: a1 (val)
        a1.Tree({"Groups"})
        a1.SameLine()
        a1.Group()
        a1.Text({"I am in group A"})
        a1.Button({"Im also in A"})
        a1.End()
        a1.Separator()
        a1.Group()
        a1.Text({"I am in group B"})
        a1.Button({"Im also in B"})
        a1.Button({"Also group B"})
        a1.End()
        a1.End()
        a1.End()
    end

    function u24.Tab() -- Line: 342 -- upvalues: a1 (val)
        a1.Tree({"Tabs"})
        a1.Tree({"Simple"})
        a1.TabBar()
        a1.Tab({"Apples"})
        a1.Text({"Who loves apples?"})
        a1.End()
        a1.Tab({"Broccoli"})
        a1.Text({"And what about broccoli?"})
        a1.End()
        a1.Tab({"Carrots"})
        a1.Text({"But carrots are the best."})
        a1.End()
        a1.End()
        a1.Separator()
        a1.Text({"Very important questions."})
        a1.End()
        a1.Tree({"Closable"})
        local v1 = a1.State(true)
        local v2 = a1.State(true)
        local v3 = a1.State(true)
        a1.TabBar()
        a1.Tab({"🍎", true}, {isOpened = v1})
        a1.Text({"Who loves apples?"})
        if a1.Button({"I don't like apples."}).clicked() then
            v1:set(false)
        end
        a1.End()
        a1.Tab({"🥦", true}, {isOpened = v2})
        a1.Text({"And what about broccoli?"})
        if a1.Button({"Not for me."}).clicked() then
            v2:set(false)
        end
        a1.End()
        a1.Tab({"🥕", true}, {isOpened = v3})
        a1.Text({"But carrots are the best."})
        if a1.Button({"I disagree with you."}).clicked() then
            v3:set(false)
        end
        a1.End()
        a1.End()
        a1.Separator()
        if a1.Button({"Actually, let me reconsider it."}).clicked() then
            v1:set(true)
            v2:set(true)
            v3:set(true)
        end
        a1.End()
        a1.End()
    end

    function u24.Indent() -- Line: 417 -- upvalues: a1 (val)
        a1.Tree({"Indents"})
        a1.Text({"Not Indented"})
        a1.Indent()
        a1.Text({"Indented"})
        a1.Indent({7})
        a1.Text({"Indented by 7 more pixels"})
        a1.End()
        a1.Indent({-7})
        a1.Text({"Indented by 7 less pixels"})
        a1.End()
        a1.End()
        a1.End()
    end

    function u24.Input() -- Line: 439 -- upvalues: a1 (val), helpMarker (val)
        a1.Tree({"Input"})
        local v1 = a1.State(false)
        local v2 = a1.State(false)
        local v3 = a1.State(0)
        local v4 = a1.State(100)
        local v5 = a1.State(1)
        local v6 = a1.State("%d")
        a1.PushConfig({ContentWidth = UDim.new(1, -120)})
        local InputNum = a1.InputNum
        local v7 = {[a1.Args.InputNum.Text] = "Input Number"}
        v7[a1.Args.InputNum.NoButtons] = v2.value
        v7[a1.Args.InputNum.Min] = v3.value
        v7[a1.Args.InputNum.Max] = v4.value
        v7[a1.Args.InputNum.Increment] = v5.value
        v7[a1.Args.InputNum.Format] = {v6.value}
        local v8 = InputNum(v7)
        a1.PopConfig()
        a1.Text({"The Value is: " .. v8.number.value})
        if a1.Button({"Randomize Number"}).clicked() then
            v8.number:set((math.random(1, 99)))
        end
        v7 = a1.Checkbox({"NoField"}, {isChecked = v1})
        local v9 = a1.Checkbox({"NoButtons"}, {isChecked = v2})
        if v7.checked() and v9.isChecked.value == true then
            v9.isChecked:set(false)
        end
        if v9.checked() and v7.isChecked.value == true then
            v7.isChecked:set(false)
        end
        a1.PushConfig({ContentWidth = UDim.new(1, -120)})
        a1.InputVector2({"InputVector2"})
        a1.InputVector3({"InputVector3"})
        a1.InputUDim({"InputUDim"})
        a1.InputUDim2({"InputUDim2"})
        local v10 = a1.State(false)
        local v11 = a1.State(false)
        local v12 = a1.State(Color3.new())
        local v13 = a1.State(0)
        a1.SliderNum({"Transparency", 0.01, 0, 1}, {number = v13})
        a1.InputColor3({"InputColor3", v10:get(), (v11:get())}, {color = v12})
        a1.InputColor4({"InputColor4", v10:get(), (v11:get())}, {color = v12, transparency = v13})
        a1.SameLine()
        a1.Text({v12:get():ToHex()})
        a1.Checkbox({"Use Floats"}, {isChecked = v10})
        a1.Checkbox({"Use HSV"}, {isChecked = v11})
        a1.End()
        a1.PopConfig()
        a1.Separator()
        a1.SameLine()
        a1.Text({"Slider Numbers"})
        helpMarker("ctrl + click slider number widgets to input a number")
        a1.End()
        a1.PushConfig({ContentWidth = UDim.new(1, -120)})
        a1.SliderNum({"Slide Int", 1, 1, 8})
        a1.SliderNum({"Slide Float", 0.01, 0, 100})
        a1.SliderNum({"Small Numbers", 0.001, -2, 1, "%f radians"})
        a1.SliderNum({"Odd Ranges", 0.001, -3.141592653589793, 3.141592653589793, "%f radians"})
        a1.SliderNum({"Big Numbers", 10000, 100000, 10000000})
        a1.SliderNum({"Few Numbers", 1, 0, 3})
        a1.PopConfig()
        a1.Separator()
        a1.SameLine()
        a1.Text({"Drag Numbers"})
        helpMarker("ctrl + click or double click drag number widgets to input a number, hold shift/alt while dragging to increase/decrease speed")
        a1.End()
        a1.PushConfig({ContentWidth = UDim.new(1, -120)})
        a1.DragNum({"Drag Int"})
        a1.DragNum({"Slide Float", 0.001, -10, 10})
        a1.DragNum({"Percentage", 1, 0, 100, "%d %%"})
        a1.PopConfig()
        a1.End()
    end

    function u24.InputText() -- Line: 522 -- upvalues: a1 (val)
        a1.Tree({"Input Text"})
        a1.Text({
            "The text is: " .. (a1.InputText({"Input Text Test", "Input Text here"})).text.value,
        })
        a1.End()
    end

    function u24.MultiInput() -- Line: 531 -- upvalues: a1 (val)
        a1.Tree({"Multi-Component Input"})
        local v1 = a1.State(Vector2.new())
        local v2 = a1.State((Vector3.new()))
        local v3 = a1.State(UDim.new())
        local v4 = a1.State(UDim2.new())
        local v5 = a1.State(Color3.new())
        local v6 = a1.State(Rect.new(0, 0, 0, 0))
        a1.SeparatorText({"Input"})
        a1.InputVector2({}, {number = v1})
        a1.InputVector3({}, {number = v2})
        a1.InputUDim({}, {number = v3})
        a1.InputUDim2({}, {number = v4})
        a1.InputRect({}, {number = v6})
        a1.SeparatorText({"Drag"})
        a1.DragVector2({}, {number = v1})
        a1.DragVector3({}, {number = v2})
        a1.DragUDim({}, {number = v3})
        a1.DragUDim2({}, {number = v4})
        a1.DragRect({}, {number = v6})
        a1.SeparatorText({"Slider"})
        a1.SliderVector2({}, {number = v1})
        a1.SliderVector3({}, {number = v2})
        a1.SliderUDim({}, {number = v3})
        a1.SliderUDim2({}, {number = v4})
        a1.SliderRect({}, {number = v6})
        a1.SeparatorText({"Color"})
        a1.InputColor3({}, {color = v5})
        a1.InputColor4({}, {color = v5})
        a1.End()
    end

    function u24.Tooltip() -- Line: 573 -- upvalues: a1 (val)
        a1.PushConfig({ContentWidth = UDim.new(0, 250)})
        a1.Tree({"Tooltip"})
        if a1.Text({"Hover over me to reveal a tooltip"}).hovered() then
            a1.Tooltip({"I am some helpful tooltip text"})
        end
        local v1 = a1.State("Hello ")
        local v2 = a1.State(1)
        if a1.InputNum({"# of repeat", 1, 1, 50}, {number = v2}).numberChanged() then
            v1:set((string.rep("Hello ", (v2:get()))))
        end
        if a1.Checkbox({"Show dynamic text tooltip"}).state.isChecked.value then
            a1.Tooltip({v1:get()})
        end
        a1.End()
        a1.PopConfig()
    end

    function u24.Plotting() -- Line: 593 -- upvalues: a1 (val)
        local v1, v2, v3, value_4, value_5, value_6, value_7, value_8, value_9
        a1.Tree({"Plotting"})
        a1.SeparatorText({"Progress"})
        local v4 = os.clock() * 15
        local v5 = a1.State(0)
        v5:set((math.clamp(math.abs(v4 % 100 - 50) - 7.5, 0, 35)) / 35)
        a1.ProgressBar({"Progress Bar"}, {progress = v5})
        a1.ProgressBar({"Progress Bar", (("%*/1753"):format((math.floor((v5:get()) * 1753))))}, {progress = v5})
        a1.SeparatorText({"Graphs"})
        local v6 = a1.State({0.5, 0.8, 0.2, 0.9, 0.1, 0.6, 0.4, 0.7, 0.3, 0})
        a1.PlotHistogram({"Histogram", 100, 0, 1, "random"}, {values = v6})
        a1.PlotLines({"Lines", 100, 0, 1, "random"}, {values = v6})
        local v7 = Random.new()
        local v8 = a1.State({
            {name = "SystemA", value = v7:NextNumber(0.3, 0.6)},
            {name = "SystemB", value = v7:NextNumber(0.1, 0.2)},
            {name = "SystemC", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemD", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemE", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemF", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemG", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemH", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemI", value = v7:NextNumber(0.05, 0.1)},
            {name = "SystemJ", value = v7:NextNumber(0.05, 0.1)},
        })
        if tick() % 0.1 < 0.01 then
            v8:set({
                {name = "SystemA", value = v7:NextNumber(0.3, 0.6)},
                {name = "SystemB", value = v7:NextNumber(0.1, 0.2)},
                {name = "SystemC", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemD", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemE", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemF", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemG", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemH", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemI", value = v7:NextNumber(0.05, 0.1)},
                {name = "SystemJ", value = v7:NextNumber(0.05, 0.1)},
            })
        end
        a1.SeparatorText({"Time Graph"})
        a1.PlotTimeGraph({"Graph"}, {values = v8})
        a1.SeparatorText({"Other Graphs"})
        local Cos = a1.State("Cos")
        v7 = a1.State(37)
        v8 = a1.State(0)
        local v9 = a1.State({})
        local v10 = a1.State(0)
        local v11 = a1.Checkbox({"Animate"})
        local v12 = a1.ComboArray({"Plotting Function"}, {index = Cos}, {"Sin", "Cos", "Tan", "Saw"})
        local v13 = a1.SliderNum({"Samples", 1, 1, 145, "%d samples"}, {number = v7})
        if a1.SliderNum({"Baseline", 0.1, -1, 1}, {number = v8}).numberChanged() then
            v9:set(v9.value, true)
        end
        if v11.state.isChecked.value then
            if v11.state.isChecked.value then
                v10:set(v10.value + a1.Internal._deltaTime)
            end
            v1 = math.floor(v10.value * 30) - 1
            value_4 = Cos.value
            table.clear(v9.value)
            value_5 = v7.value
            for i = 1, value_5 do
                if value_4 == "Sin" then
                    value_6 = v9.value
                    v3 = math.rad((i + v1) * 5)
                    value_6[i] = (math.sin(v3))
                elseif value_4 == "Cos" then
                    value_7 = v9.value
                    v3 = math.rad((i + v1) * 5)
                    value_7[i] = (math.cos(v3))
                elseif value_4 == "Tan" then
                    value_8 = v9.value
                    v3 = math.rad((i + v1) * 5)
                    value_8[i] = (math.tan(v3))
                elseif value_4 == "Saw" then
                    value_9 = v9.value
                    v2 = if i % 2 ~= v1 % 2 then -1 else 1
                    value_9[i] = v2
                end
            end
            v9:set(v9.value, true)
        elseif v12.closed() then
            if v11.state.isChecked.value then
                v10:set(v10.value + a1.Internal._deltaTime)
            end
            v1 = math.floor(v10.value * 30) - 1
            value_4 = Cos.value
            table.clear(v9.value)
            value_5 = v7.value
            for j = 1, value_5 do
                if value_4 == "Sin" then
                    value_6 = v9.value
                    v3 = math.rad((j + v1) * 5)
                    value_6[j] = (math.sin(v3))
                elseif value_4 == "Cos" then
                    value_7 = v9.value
                    v3 = math.rad((j + v1) * 5)
                    value_7[j] = (math.cos(v3))
                elseif value_4 == "Tan" then
                    value_8 = v9.value
                    v3 = math.rad((j + v1) * 5)
                    value_8[j] = (math.tan(v3))
                elseif value_4 == "Saw" then
                    value_9 = v9.value
                    v2 = if j % 2 ~= v1 % 2 then -1 else 1
                    value_9[j] = v2
                end
            end
            v9:set(v9.value, true)
        elseif v13.numberChanged() then
            if v11.state.isChecked.value then
                v10:set(v10.value + a1.Internal._deltaTime)
            end
            v1 = math.floor(v10.value * 30) - 1
            value_4 = Cos.value
            table.clear(v9.value)
            value_5 = v7.value
            for k = 1, value_5 do
                if value_4 == "Sin" then
                    value_6 = v9.value
                    v3 = math.rad((k + v1) * 5)
                    value_6[k] = (math.sin(v3))
                elseif value_4 == "Cos" then
                    value_7 = v9.value
                    v3 = math.rad((k + v1) * 5)
                    value_7[k] = (math.cos(v3))
                elseif value_4 == "Tan" then
                    value_8 = v9.value
                    v3 = math.rad((k + v1) * 5)
                    value_8[k] = (math.tan(v3))
                elseif value_4 == "Saw" then
                    value_9 = v9.value
                    v2 = if k % 2 ~= v1 % 2 then -1 else 1
                    value_9[k] = v2
                end
            end
            v9:set(v9.value, true)
        elseif #v9.value == 0 then
            if v11.state.isChecked.value then
                v10:set(v10.value + a1.Internal._deltaTime)
            end
            v1 = math.floor(v10.value * 30) - 1
            value_4 = Cos.value
            table.clear(v9.value)
            value_5 = v7.value
            for n = 1, value_5 do
                if value_4 == "Sin" then
                    value_6 = v9.value
                    v3 = math.rad((n + v1) * 5)
                    value_6[n] = (math.sin(v3))
                elseif value_4 == "Cos" then
                    value_7 = v9.value
                    v3 = math.rad((n + v1) * 5)
                    value_7[n] = (math.cos(v3))
                elseif value_4 == "Tan" then
                    value_8 = v9.value
                    v3 = math.rad((n + v1) * 5)
                    value_8[n] = (math.tan(v3))
                elseif value_4 == "Saw" then
                    value_9 = v9.value
                    v2 = if n % 2 ~= v1 % 2 then -1 else 1
                    value_9[n] = v2
                end
            end
            v9:set(v9.value, true)
        end
        a1.PlotHistogram({"Histogram", 100, -1, 1, "", v8:get()}, {values = v9})
        a1.PlotLines({"Lines", 100, -1, 1}, {values = v9})
        a1.End()
    end

    local u40 = {
        "Basic",
        "Tree",
        "CollapsingHeader",
        "Group",
        "Indent",
        "Input",
        "MultiInput",
        "InputText",
        "Tooltip",
        "Selectable",
        "Combo",
        "Plotting",
    }

    function recursiveTree() -- Line: 696 -- upvalues: a1 (val), recursiveTree (val)
        if a1.Tree({"Recursive Tree"}).state.isUncollapsed.value then
            recursiveTree()
        end
        a1.End()
    end

    function recursiveWindow(a1_2) -- Line: 706 -- upvalues: a1 (val), recursiveWindow (val)
        a1.Window({"Recursive Window"}, {size = a1.State(Vector2.new(175, 100)), isOpened = a1_2})
        local v1 = a1.Checkbox({"Recurse Again"})
        a1.End()
        if v1.isChecked.value then
            recursiveWindow(v1.isChecked)
        end
    end

    local function runtimeInfo() -- Line: 720 -- upvalues: a1 (val), u9 (val), helpMarker (val)
        local v1 = a1.Window({"Runtime Info"}, {isOpened = u9})
        local _lastVDOM = a1.Internal._lastVDOM
        local _states = a1.Internal._states
        local v2 = a1.State(3)
        local v3 = a1.State(0)
        local v4 = a1.State(os.clock())
        a1.SameLine()
        a1.InputNum({
            [a1.Args.InputNum.Text] = "",
            [a1.Args.InputNum.Format] = "%d Seconds",
            [a1.Args.InputNum.Max] = 10,
        }, {number = v2})
        if a1.Button({"Disable"}).clicked() then
            a1.Disabled = true
            task.delay(v2:get(), function() -- Line: 735 -- upvalues: a1 (upval)
                a1.Disabled = false
            end)
        end
        a1.End()
        local v5 = os.clock()
        v3.value = v3.value + (v5 - v4.value - v3.value) * 0.2
        v4.value = v5
        a1.Text({
            (string.format("Average %.3f ms/frame (%.1f FPS)", v3.value * 1000, 1 / v3.value)),
        })
        a1.Text({
            string.format(
                "Window Position: (%d, %d), Window Size: (%d, %d)",
                v1.position.value.X,
                v1.position.value.Y,
                v1.size.value.X,
                v1.size.value.Y
            ),
        })
        a1.SameLine()
        a1.Text({"Enter an ID to learn more about it."})
        helpMarker("every widget and state has an ID which Iris tracks to remember which widget is which. below lists all widgets and states, with their respective IDs")
        a1.End()
        a1.PushConfig({ItemWidth = UDim.new(1, -150)})
        local value = a1.InputText({"ID field"}, {text = a1.State(v1.ID)}).state.text.value
        a1.PopConfig()
        a1.Indent()
        local v6 = _lastVDOM[value]
        local v7 = _states[value]
        if v6 then
            a1.Table({1})
            a1.Text({string.format("The ID, \"%s\", is a widget", value)})
            a1.NextRow()
            a1.Text({string.format("Widget is type: %s", v6.type)})
            a1.NextRow()
            a1.Tree({"Widget has Args:"}, {isUncollapsed = a1.State(true)})
            for k, n in v6.arguments do
                a1.Text({k .. " - " .. tostring(n)})
            end
            a1.End()
            a1.NextRow()
            if v6.state then
                a1.Tree({"Widget has State:"}, {isUncollapsed = a1.State(true)})
                for m, i5 in v6.state do
                    a1.Text({m .. " - " .. tostring(i5.value)})
                end
                a1.End()
            end
            a1.End()
        elseif not v7 then
            a1.Text({string.format("The ID, \"%s\", is not a state or widget", value)})
        else
            a1.Table({1})
            a1.Text({string.format("The ID, \"%s\", is a state", value)})
            a1.NextRow()
            a1.Text({
                string.format("Value is type: %s, Value = %s", typeof(v7.value), (tostring(v7.value))),
            })
            a1.NextRow()
            a1.Tree({"state has connected widgets:"}, {isUncollapsed = a1.State(true)})
            for i, j in v7.ConnectedWidgets do
                a1.Text({i .. " - " .. j.type})
            end
            a1.End()
            a1.NextRow()
            a1.Text({
                string.format("state has: %d connected functions", #v7.ConnectedFunctions),
            })
            a1.End()
        end
        a1.End()
        v7 = {"Widgets"}
        if a1.Tree(v7).state.isUncollapsed.value then
            v6 = 0
            v7 = ""
            for i6, i7 in _lastVDOM do
                v6 = v6 + 1
                v7 = v7 .. "\n" .. i7.ID .. " - " .. i7.type
            end
            a1.Text({"Number of Widgets: " .. v6})
            a1.Text({v7})
        end
        a1.End()
        v7 = {"States"}
        if a1.Tree(v7).state.isUncollapsed.value then
            local value_5
            v6 = 0
            v7 = ""
            for i8, i9 in _states do
                v6 = v6 + 1
                value_5 = i9.value
                v7 = v7 .. "\n" .. i8 .. " - " .. tostring(value_5)
            end
            a1.Text({"Number of States: " .. v6})
            a1.Text({v7})
        end
        a1.End()
        a1.End()
    end

    local function debugPanel() -- Line: 844 -- upvalues: a1 (val), u21 (val)
        a1.Window({"Debug Panel"}, {isOpened = u21})
        a1.CollapsingHeader({"Widgets"})
        a1.SeparatorText({"GuiService"})
        a1.Text({(("GuiOffset: %*"):format(a1.Internal._utility.GuiOffset))})
        a1.Text({(("MouseOffset: %*"):format(a1.Internal._utility.MouseOffset))})
        a1.SeparatorText({"UserInputService"})
        a1.Text({
            (("MousePosition: %*"):format((a1.Internal._utility.UserInputService:GetMouseLocation()))),
        })
        a1.Text({(("MouseLocation: %*"):format((a1.Internal._utility.getMouseLocation())))})
        a1.Text({
            (("Left Control: %*"):format((a1.Internal._utility.UserInputService:IsKeyDown(Enum.KeyCode.LeftControl)))),
        })
        a1.Text({
            (("Right Control: %*"):format((a1.Internal._utility.UserInputService:IsKeyDown(Enum.KeyCode.RightControl)))),
        })
        a1.End()
        a1.End()
    end

    function recursiveMenu() -- Line: 865 -- upvalues: a1 (val), recursiveMenu (val)
        if a1.Menu({"Recursive"}).state.isOpened.value then
            a1.MenuItem({"New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl})
            a1.MenuItem({"Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl})
            a1.MenuItem({"Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl})
            a1.Separator()
            a1.MenuToggle({"Autosave"})
            a1.MenuToggle({"Checked"})
            a1.Separator()
            a1.Menu({"Options"})
            a1.MenuItem({"Red"})
            a1.MenuItem({"Yellow"})
            a1.MenuItem({"Green"})
            a1.MenuItem({"Blue"})
            a1.Separator()
            recursiveMenu()
            a1.End()
        end
        a1.End()
    end

    local function mainMenuBar() -- Line: 886
        -- upvalues: a1 (val), recursiveMenu (val), u3 (val), u6 (val), u15 (val), u18 (val), u9 (val), u12 (val)
        -- upvalues: u21 (val)
        a1.MenuBar()
        a1.Menu({"File"})
        a1.MenuItem({"New", Enum.KeyCode.N, Enum.ModifierKey.Ctrl})
        a1.MenuItem({"Open", Enum.KeyCode.O, Enum.ModifierKey.Ctrl})
        a1.MenuItem({"Save", Enum.KeyCode.S, Enum.ModifierKey.Ctrl})
        recursiveMenu()
        if a1.MenuItem({"Quit", Enum.KeyCode.Q, Enum.ModifierKey.Alt}).clicked() then
            u3:set(false)
        end
        a1.End()
        a1.Menu({"Examples"})
        a1.MenuToggle({"Recursive Window"}, {isChecked = u6})
        a1.MenuToggle({"Windowless"}, {isChecked = u15})
        a1.MenuToggle({"Main Menu Bar"}, {isChecked = u18})
        a1.End()
        a1.Menu({"Tools"})
        a1.MenuToggle({"Runtime Info"}, {isChecked = u9})
        a1.MenuToggle({"Style Editor"}, {isChecked = u12})
        a1.MenuToggle({"Debug Panel"}, {isChecked = u21})
        a1.End()
        a1.End()
    end

    local function mainMenuBarExample() -- Line: 920 -- upvalues: mainMenuBar (val)
        mainMenuBar()
    end

    local function u61() -- Line: 935 -- upvalues: a1 (val), helpMarker (val), u12 (val)
        local v1 = {
            {
                "Sizing",
                function() -- Line: 939 -- upvalues: a1 (upval), helpMarker (upval)
                    local u3 = a1.State({})
                    a1.SameLine()
                    if a1.Button({"Update"}).clicked() then
                        a1.UpdateGlobalConfig(u3.value)
                        u3:set({})
                    end
                    helpMarker("Update the global config with these changes.")
                    a1.End()

                    local function SliderInput(a1_2, a2) -- Line: 953
                        -- upvalues: a1 (upval), u3 (val)
                        local v1 = a1[a1_2](a2, {number = a1.WeakState(a1._config[a2[1]])})
                        if v1.numberChanged() then
                            u3.value[a2[1]] = (v1.number:get())
                        end
                    end

                    local function BooleanInput(a1_2) -- Line: 960
                        -- upvalues: a1 (upval), u3 (val)
                        local v1 = a1.Checkbox(a1_2, {isChecked = a1.WeakState(a1._config[a1_2[1]])})
                        if v1.checked() or v1.unchecked() then
                            u3.value[a1_2[1]] = (v1.isChecked:get())
                        end
                    end

                    a1.SeparatorText({"Main"})
                    SliderInput("SliderVector2", {"WindowPadding", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"WindowResizePadding", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"FramePadding", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"ItemSpacing", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"ItemInnerSpacing", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"CellPadding", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderNum", {"IndentSpacing", 1, 0, 36})
                    SliderInput("SliderNum", {"ScrollbarSize", 1, 0, 20})
                    SliderInput("SliderNum", {"GrabMinSize", 1, 0, 20})
                    a1.SeparatorText({"Borders & Rounding"})
                    SliderInput("SliderNum", {"FrameBorderSize", 0.1, 0, 1})
                    SliderInput("SliderNum", {"WindowBorderSize", 0.1, 0, 1})
                    SliderInput("SliderNum", {"PopupBorderSize", 0.1, 0, 1})
                    SliderInput("SliderNum", {"SeparatorTextBorderSize", 1, 0, 20})
                    SliderInput("SliderNum", {"FrameRounding", 1, 0, 12})
                    SliderInput("SliderNum", {"GrabRounding", 1, 0, 12})
                    SliderInput("SliderNum", {"PopupRounding", 1, 0, 12})
                    a1.SeparatorText({"Widgets"})
                    SliderInput("SliderVector2", {"DisplaySafeAreaPadding", nil, Vector2.zero, Vector2.new(20, 20)})
                    SliderInput("SliderVector2", {"SeparatorTextPadding", nil, Vector2.zero, Vector2.new(36, 36)})
                    SliderInput("SliderUDim", {"ItemWidth", nil, UDim.new(), UDim.new(1, 200)})
                    SliderInput("SliderUDim", {"ContentWidth", nil, UDim.new(), UDim.new(1, 200)})
                    SliderInput("SliderNum", {"ImageBorderSize", 1, 0, 12})
                    local v1 = a1.ComboEnum({"WindowTitleAlign"}, {index = a1.WeakState(a1._config.WindowTitleAlign)}, Enum.LeftRight)
                    if v1.closed() then
                        u3.value.WindowTitleAlign = v1.index:get()
                    end
                    BooleanInput({"RichText"})
                    BooleanInput({"TextWrapped"})
                    a1.SeparatorText({"Config"})
                    BooleanInput({"UseScreenGUIs"})
                    SliderInput("DragNum", {"DisplayOrderOffset", 1, 0})
                    SliderInput("DragNum", {"ZIndexOffset", 1, 0})
                    SliderInput("SliderNum", {"MouseDoubleClickTime", 0.1, 0, 5})
                    SliderInput("SliderNum", {"MouseDoubleClickMaxDist", 0.1, 0, 20})
                end,
            },
            {
                "Colors",
                function() -- Line: 1010 -- upvalues: a1 (upval), helpMarker (upval)
                    local InputColor4, v1, v2, value, value_2
                    local v3 = a1.State({})
                    a1.SameLine()
                    if a1.Button({"Update"}).clicked() then
                        a1.UpdateGlobalConfig(v3.value)
                        v3:set({})
                    end
                    helpMarker("Update the global config with these changes.")
                    a1.End()
                    for i, j in {
                        "Text",
                        "TextDisabled",
                        "WindowBg",
                        "PopupBg",
                        "Border",
                        "BorderActive",
                        "ScrollbarGrab",
                        "TitleBg",
                        "TitleBgActive",
                        "TitleBgCollapsed",
                        "MenubarBg",
                        "FrameBg",
                        "FrameBgHovered",
                        "FrameBgActive",
                        "Button",
                        "ButtonHovered",
                        "ButtonActive",
                        "Image",
                        "SliderGrab",
                        "SliderGrabActive",
                        "Header",
                        "HeaderHovered",
                        "HeaderActive",
                        "SelectionImageObject",
                        "SelectionImageObjectBorder",
                        "TableBorderStrong",
                        "TableBorderLight",
                        "TableRowBg",
                        "TableRowBgAlt",
                        "NavWindowingHighlight",
                        "NavWindowingDimBg",
                        "Separator",
                        "CheckMark",
                    } do
                        InputColor4 = a1.InputColor4
                        v2 = {
                            color = a1.WeakState(a1._config[j .. "Color"]),
                            transparency = a1.WeakState(a1._config[j .. "Transparency"]),
                        }
                        v1 = InputColor4({j}, v2)
                        if v1.numberChanged() then
                            value = v3.value
                            v2 = j .. "Color"
                            value[v2] = (v1.color:get())
                            value_2 = v3.value
                            v2 = j .. "Transparency"
                            value_2[v2] = (v1.transparency:get())
                        end
                    end
                end,
            },
            {
                "Fonts",
                function() -- Line: 1073 -- upvalues: a1 (upval), helpMarker (upval)
                    local v1
                    local v2 = a1.State({})
                    a1.SameLine()
                    if a1.Button({"Update"}).clicked() then
                        a1.UpdateGlobalConfig(v2.value)
                        v2:set({})
                    end
                    helpMarker("Update the global config with these changes.")
                    a1.End()
                    local v3 = {
                        ["Code (default)"] = Font.fromEnum(Enum.Font.Code),
                        ["Ubuntu (template)"] = Font.fromEnum(Enum.Font.Ubuntu),
                        Arial = Font.fromEnum(Enum.Font.Arial),
                        Highway = Font.fromEnum(Enum.Font.Highway),
                        Roboto = Font.fromEnum(Enum.Font.Roboto),
                        ["Roboto Mono"] = Font.fromEnum(Enum.Font.RobotoMono),
                        ["Noto Sans"] = Font.new("rbxassetid://12187370747"),
                        ["Builder Sans"] = Font.fromEnum(Enum.Font.BuilderSans),
                        ["Builder Mono"] = Font.new("rbxassetid://16658246179"),
                        Sono = Font.new("rbxassetid://12187374537"),
                    }
                    a1.Text({
                        (("Current Font: %* Weight: %* Style: %*"):format(
                            a1._config.TextFont.Family,
                            a1._config.TextFont.Weight,
                            a1._config.TextFont.Style
                        )),
                    })
                    a1.SeparatorText({"Size"})
                    local v4 = a1.SliderNum({"Font Size", 1, 4, 20}, {number = a1.WeakState(a1._config.TextSize)})
                    if v4.numberChanged() then
                        v2.value.TextSize = v4.state.number:get()
                    end
                    a1.SeparatorText({"Properties"})
                    local v5 = a1.WeakState(a1._config.TextFont.Family)
                    local v6 = a1.ComboEnum({"Font Weight"}, {index = a1.WeakState(a1._config.TextFont.Weight)}, Enum.FontWeight)
                    local v7 = a1.ComboEnum({"Font Style"}, {index = a1.WeakState(a1._config.TextFont.Style)}, Enum.FontStyle)
                    a1.SeparatorText({"Fonts"})
                    local v8 = nil
                    local v9 = nil
                    for i, j in v3, v8, v9 do
                        v1 = Font.new(j.Family, v6.state.index.value, v7.state.index.value)
                        a1.SameLine()
                        a1.PushConfig({TextFont = v1})
                        if a1.Selectable({
                            ("%* | \"The quick brown fox jumps over the lazy dog.\""):format(i),
                            v1.Family,
                        }, {index = v5}).selected() then
                            v2.value.TextFont = v1
                        end
                        a1.PopConfig()
                        a1.End()
                    end
                end,
            },
        }
        a1.Window({"Style Editor"}, {isOpened = u12})
        a1.Text({"Customize the look of Iris in realtime."})
        local v2 = a1.State("Dark Theme")
        if a1.ComboArray({"Theme"}, {index = v2}, {"Dark Theme", "Light Theme"}).closed() then
            if v2.value == "Dark Theme" then
                a1.UpdateGlobalConfig(a1.TemplateConfig.colorDark)
            elseif v2.value == "Light Theme" then
                a1.UpdateGlobalConfig(a1.TemplateConfig.colorLight)
            end
        end
        local v3 = a1.State("Classic Size")
        if a1.ComboArray({"Size"}, {index = v3}, {"Classic Size", "Larger Size"}).closed() then
            if v3.value == "Classic Size" then
                a1.UpdateGlobalConfig(a1.TemplateConfig.sizeDefault)
            elseif v3.value == "Larger Size" then
                a1.UpdateGlobalConfig(a1.TemplateConfig.sizeClear)
            end
        end
        a1.SameLine()
        if a1.Button({"Revert"}).clicked() then
            a1.UpdateGlobalConfig(a1.TemplateConfig.colorDark)
            a1.UpdateGlobalConfig(a1.TemplateConfig.sizeDefault)
            v2:set("Dark Theme")
            v3:set("Classic Size")
        end
        helpMarker("Reset Iris to the default theme and size.")
        a1.End()
        a1.TabBar()
        for i, v in ipairs(v1) do
            a1.Tab({v[1]})
            v1[i][2]()
            a1.End()
        end
        a1.End()
        a1.Separator()
        a1.End()
    end

    local function widgetEventInteractivity() -- Line: 1187 -- upvalues: a1 (val)
        a1.CollapsingHeader({"Widget Event Interactivity"})
        local v1 = a1.State(0)
        if a1.Button({"Click to increase Number"}).clicked() then
            v1:set((v1:get()) + 1)
        end
        a1.Text({"The Number is: " .. v1:get()})
        a1.Separator()
        local v2 = a1.State(false)
        local clicked = a1.State("clicked")
        a1.SameLine()
        a1.RadioButton({"clicked", "clicked"}, {index = clicked})
        a1.RadioButton({"rightClicked", "rightClicked"}, {index = clicked})
        a1.RadioButton({"doubleClicked", "doubleClicked"}, {index = clicked})
        a1.RadioButton({"ctrlClicked", "ctrlClicked"}, {index = clicked})
        a1.End()
        a1.SameLine()
        if a1.Button({(clicked:get()) .. " to reveal text"})[clicked:get()]() then
            v2:set(not (v2:get()))
        end
        if v2:get() then
            a1.Text({"Here i am!"})
        end
        a1.End()
        a1.Separator()
        local v3 = a1.State(0)
        a1.SameLine()
        if a1.Button({"Click to show text for 20 frames"}).clicked() then
            v3:set(20)
        end
        if 0 < (v3:get()) then
            a1.Text({"Here i am!"})
        end
        a1.End()
        v3:set((math.max(0, (v3:get()) - 1)))
        a1.Text({"Text Timer: " .. v3:get()})
        local v4 = a1.Checkbox({"Event-tracked checkbox"})
        a1.Indent()
        a1.Text({"unchecked: " .. tostring((v4.unchecked()))})
        a1.Text({"checked: " .. tostring((v4.checked()))})
        a1.End()
        a1.SameLine()
        if a1.Button({"Hover over me"}).hovered() then
            a1.Text({"The button is hovered"})
        end
        a1.End()
        a1.End()
    end

    local function widgetStateInteractivity() -- Line: 1258 -- upvalues: a1 (val)
        a1.CollapsingHeader({"Widget State Interactivity"})
        a1.Text({
            (("isChecked: %*\n"):format((a1.Checkbox({"Widget-Generated State"})).state.isChecked.value)),
        })
        a1.Text({
            (("isChecked: %*\n"):format((a1.Checkbox({"User-Generated State"}, {isChecked = a1.State(false)})).state.isChecked.value)),
        })
        a1.Text({
            (("isChecked: %*\n"):format((a1.Checkbox({"Coupled to above Checkbox"}, {isChecked = (a1.Checkbox({"Widget Coupled State"})).state.isChecked})).state.isChecked.value)),
        })
        local v1 = a1.State(false)
        a1.Checkbox({"Widget and Code Coupled State"}, {isChecked = v1})
        if a1.Button({"Click to toggle above checkbox"}).clicked() then
            v1:set(not (v1:get()))
        end
        a1.Text({(("isChecked: %*\n"):format(v1.value))})
        local v2 = a1.State(true)
        local v3 = a1.ComputedState(v2, function(a1) -- Line: 1281
            return not a1
        end)
        a1.Checkbox({"ComputedState (dynamic coupling)"}, {isChecked = v2})
        a1.Checkbox({"Inverted of above checkbox"}, {isChecked = v3})
        a1.Text({(("isChecked: %*\n"):format(v3.value))})
        a1.End()
    end

    local function dynamicStyle() -- Line: 1291 -- upvalues: a1 (val), helpMarker (val)
        a1.CollapsingHeader({"Dynamic Styles"})
        local v1 = a1.State(0)
        a1.SameLine()
        if a1.Button({"Change Color"}).clicked() then
            v1:set((math.random()))
        end
        a1.Text({"Hue: " .. math.floor((v1:get()) * 255)})
        helpMarker("Using PushConfig with a changing value, this can be done with any config field")
        a1.End()
        a1.PushConfig({TextColor = Color3.fromHSV(v1:get(), 1, 1)})
        a1.Text({"Text with a unique and changable color"})
        a1.PopConfig()
        a1.End()
    end

    local function tablesDemo() -- Line: 1312 -- upvalues: a1 (val), helpMarker (val)
        local v1 = a1.State(false)
        a1.CollapsingHeader({"Tables & Columns"}, {isUncollapsed = v1})
        if v1.value == false then
            a1.End()
            return
        end
        a1.Tree({"EditableTable"})
        local v2 = a1.State({Test6 = 2, Test1 = {Test2 = true, Test3 = false, Test4 = {Test5 = 1}}})
        if a1.EditableTable({}, {table = v2}).tableChanged() then
            print("updated", v2:get())
        end
        a1.End()
        a1.Tree({"Tables"})
        a1.SameLine()
        a1.Text({"Table using NextRow and NextColumn syntax:"})
        helpMarker("calling Iris.NextRow() in the outer loop, and Iris.NextColumn()in the inner loop")
        a1.End()
        a1.Table({3})
        for i = 1, 4 do
            a1.NextRow()
            for j = 1, 3 do
                a1.NextColumn()
                a1.Text({(("Row: %*, Column: %*"):format(i, j))})
            end
        end
        a1.End()
        a1.Text({""})
        a1.SameLine()
        a1.Text({"Table using NextColumn only syntax:"})
        helpMarker("only calling Iris.NextColumn() in the inner loop, the result is identical")
        a1.End()
        a1.Table({2})
        for k = 1, 4 do
            for n = 1, 2 do
                a1.NextColumn()
                a1.Text({(("Row: %*, Column: %*"):format(k, n))})
            end
        end
        a1.End()
        a1.Separator()
        local v3 = a1.State(false)
        local v4 = a1.State(false)
        local v5 = a1.State(true)
        local v6 = a1.State(true)
        local v7 = a1.State(3)
        a1.Text({"Table with Customizable Arguments"})
        local Table_3 = a1.Table
        local v8 = {4}
        v8[a1.Args.Table.RowBg] = v3.value
        v8[a1.Args.Table.BordersOuter] = v4.value
        v8[a1.Args.Table.BordersInner] = v5.value
        Table_3(v8)
        for m = 1, (v7:get()) do
            for i5 = 1, 4 do
                a1.NextColumn()
                if not v6.value then
                    a1.Text({(("Month: %*, Week: %*"):format(m, i5))})
                else
                    a1.Button({(("Month: %*, Week: %*"):format(m, i5))})
                end
            end
        end
        a1.End()
        a1.Checkbox({"RowBg"}, {isChecked = v3})
        a1.Checkbox({"BordersOuter"}, {isChecked = v4})
        a1.Checkbox({"BordersInner"}, {isChecked = v5})
        a1.SameLine()
        a1.RadioButton({"Buttons", true}, {index = v6})
        a1.RadioButton({"Text", false}, {index = v6})
        a1.End()
        a1.InputNum({
            "Number of rows",
            [a1.Args.InputNum.Min] = 0,
            [a1.Args.InputNum.Max] = 100,
            [a1.Args.InputNum.Format] = "%d",
        }, {number = v7})
        a1.End()
        a1.End()
    end

    local function layoutDemo() -- Line: 1424 -- upvalues: a1 (val), helpMarker (val)
        a1.CollapsingHeader({"Widget Layout"})
        a1.Tree({"Widget Alignment"})
        a1.Text({"Iris.SameLine has optional argument supporting horizontal and vertical alignments."})
        a1.Text({"This allows widgets to be place anywhere on the line."})
        a1.Separator()
        a1.SameLine()
        a1.Text({"By default child widgets will be aligned to the left."})
        helpMarker("Iris.SameLine()\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()")
        a1.End()
        a1.SameLine()
        a1.Button({"Button A"})
        a1.Button({"Button B"})
        a1.End()
        a1.SameLine()
        a1.Text({"But can be aligned to the center."})
        helpMarker("Iris.SameLine({ nil, nil, Enum.HorizontalAlignment.Center })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()")
        a1.End()
        a1.SameLine({nil, nil, Enum.HorizontalAlignment.Center})
        a1.Button({"Button A"})
        a1.Button({"Button B"})
        a1.End()
        a1.SameLine()
        a1.Text({"Or right."})
        helpMarker("Iris.SameLine({ nil, nil, Enum.HorizontalAlignment.Right })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()")
        a1.End()
        a1.SameLine({nil, nil, Enum.HorizontalAlignment.Right})
        a1.Button({"Button A"})
        a1.Button({"Button B"})
        a1.End()
        a1.Separator()
        a1.SameLine()
        a1.Text({"You can also specify the padding."})
        helpMarker("Iris.SameLine({ 0, nil, Enum.HorizontalAlignment.Center })\n\tIris.Button({ \"Button A\" })\n\tIris.Button({ \"Button B\" })\nIris.End()")
        a1.End()
        a1.SameLine({0, nil, Enum.HorizontalAlignment.Center})
        a1.Button({"Button A"})
        a1.Button({"Button B"})
        a1.End()
        a1.End()
        a1.Tree({"Widget Sizing"})
        a1.Text({"Nearly all widgets are the minimum size of the content."})
        a1.Text({"For example, text and button widgets will be the size of the text labels."})
        a1.Text({
            "Some widgets, such as the Image and Button have Size arguments will will set the size of them.",
        })
        a1.Separator()
        a1.SameLine()
        a1.Text({"The button takes up the full screen-width."})
        helpMarker("Iris.Button({ \"Button\", UDim2.fromScale(1, 0) })")
        a1.End()
        a1.Button({"Button", UDim2.fromScale(1, 0)})
        a1.SameLine()
        a1.Text({"The button takes up half the screen-width."})
        helpMarker("Iris.Button({ \"Button\", UDim2.fromScale(0.5, 0) })")
        a1.End()
        a1.Button({"Button", UDim2.fromScale(0.5, 0)})
        a1.SameLine()
        a1.Text({"Combining with SameLine, the buttons can fill the screen width."})
        helpMarker("The button will still be larger that the text size.")
        a1.End()
        local v1 = a1.State(2)
        a1.SliderNum({"Number of Buttons", 1, 1, 8}, {number = v1})
        a1.SameLine({0, nil, Enum.HorizontalAlignment.Center})
        local value = v1.value
        for i = 1, value do
            a1.Button({("Button %*"):format(i), (UDim2.fromScale(1 / v1.value, 0))})
        end
        a1.End()
        a1.End()
        a1.Tree({"Content Width"})
        v1 = a1.State(50)
        local v2 = a1.State(Enum.Axis.X)
        a1.Text({"The Content Width is a size property which determines the width of input fields."})
        a1.SameLine()
        a1.Text({"By default the value is UDim.new(0.65, 0)"})
        helpMarker("This is the default value from Dear ImGui.\nIt is 65% of the window width.")
        a1.End()
        a1.Text({
            "This works well, but sometimes we know how wide elements are going to be and want to maximise the space.",
        })
        a1.Text({"Therefore, we can use Iris.PushConfig() to change the width"})
        a1.Separator()
        a1.SameLine()
        a1.Text({"Content Width = 150 pixels"})
        helpMarker("UDim.new(0, 150)")
        a1.End()
        a1.PushConfig({ContentWidth = UDim.new(0, 150)})
        a1.DragNum({"number", 1, 0, 100}, {number = v1})
        a1.InputEnum({"axis"}, {index = v2}, Enum.Axis)
        a1.PopConfig()
        a1.SameLine()
        a1.Text({"Content Width = 50% window width"})
        helpMarker("UDim.new(0.5, 0)")
        a1.End()
        a1.PushConfig({ContentWidth = UDim.new(0.5, 0)})
        a1.DragNum({"number", 1, 0, 100}, {number = v1})
        a1.InputEnum({"axis"}, {index = v2}, Enum.Axis)
        a1.PopConfig()
        a1.SameLine()
        a1.Text({"Content Width = -150 pixels from the right side"})
        helpMarker("UDim.new(1, -150)")
        a1.End()
        a1.PushConfig({ContentWidth = UDim.new(1, -150)})
        a1.DragNum({"number", 1, 0, 100}, {number = v1})
        a1.InputEnum({"axis"}, {index = v2}, Enum.Axis)
        a1.PopConfig()
        a1.End()
        a1.Tree({"Content Height"})
        v1 = a1.State("a single line")
        v2 = a1.State(50)
        local v3 = a1.State(Enum.Axis.X)
        local v4 = a1.State(0)
        v4:set((math.clamp(math.abs((os.clock()) * 15 % 100 - 50) - 7.5, 0, 35)) / 35)
        a1.Text({"The Content Height is a size property that determines the minimum size of certain widgets."})
        a1.Text({"By default the value is UDim.new(0, 0), so there is no minimum height."})
        a1.Text({"We use Iris.PushConfig() to change this value."})
        a1.Separator()
        a1.SameLine()
        a1.Text({"Content Height = 0 pixels"})
        helpMarker("UDim.new(0, 0)")
        a1.End()
        a1.InputText({"text"}, {text = v1})
        a1.ProgressBar({"progress"}, {progress = v4})
        a1.DragNum({"number", 1, 0, 100}, {number = v2})
        a1.ComboEnum({"axis"}, {index = v3}, Enum.Axis)
        a1.SameLine()
        a1.Text({"Content Height = 60 pixels"})
        helpMarker("UDim.new(0, 60)")
        a1.End()
        a1.PushConfig({ContentHeight = UDim.new(0, 60)})
        a1.InputText({"text", nil, nil, true}, {text = v1})
        a1.ProgressBar({"progress"}, {progress = v4})
        a1.DragNum({"number", 1, 0, 100}, {number = v2})
        a1.ComboEnum({"axis"}, {index = v3}, Enum.Axis)
        a1.PopConfig()
        a1.Text({"This property can be used to force the height of a text box."})
        a1.Text({"Just make sure you enable the MultiLine argument."})
        a1.End()
        a1.End()
    end

    local function windowlessDemo() -- Line: 1625 -- upvalues: a1 (val), helpMarker (val)
        a1.PushConfig({ItemWidth = UDim.new(0, 150)})
        a1.SameLine()
        a1.TextWrapped({"Windowless widgets"})
        helpMarker("Widgets which are placed outside of a window will appear on the top left side of the screen.")
        a1.End()
        a1.Button({})
        a1.Tree({})
        a1.InputText({})
        a1.End()
        a1.PopConfig()
    end

    return function() -- Line: 1645
        -- upvalues: a1 (val), u3 (val), mainMenuBar (val), widgetEventInteractivity (val)
        -- upvalues: widgetStateInteractivity (val), recursiveTree (val), dynamicStyle (val), u40 (val), u24 (val)
        -- upvalues: tablesDemo (val), layoutDemo (val), u6 (val), recursiveWindow (val), u9 (val), runtimeInfo (val)
        -- upvalues: u21 (val), debugPanel (val), u12 (val), u61 (ref), u15 (val), windowlessDemo (val), u18 (val)
        local v1 = a1.State(false)
        local v2 = a1.State(false)
        local v3 = a1.State(false)
        local v4 = a1.State(true)
        local v5 = a1.State(false)
        local v6 = a1.State(false)
        local v7 = a1.State(false)
        local v8 = a1.State(false)
        local v9 = a1.State(false)
        if u3.value == false then
            a1.Checkbox({"Open main window"}, {isChecked = u3})
            return
        end
        debug.profilebegin("Iris/Demo/Window")
        local Window = a1.Window
        local v10 = {[a1.Args.Window.Title] = "Iris Demo Window"}
        v10[a1.Args.Window.NoTitleBar] = v1.value
        v10[a1.Args.Window.NoBackground] = v2.value
        v10[a1.Args.Window.NoCollapse] = v3.value
        v10[a1.Args.Window.NoClose] = v4.value
        v10[a1.Args.Window.NoMove] = v5.value
        v10[a1.Args.Window.NoScrollbar] = v6.value
        v10[a1.Args.Window.NoResize] = v7.value
        v10[a1.Args.Window.NoNav] = v8.value
        v10[a1.Args.Window.NoMenu] = v9.value
        local v11 = Window(v10, {
            size = a1.State(Vector2.new(600, 550)),
            position = a1.State(Vector2.new(100, 25)),
            isOpened = u3,
        })
        if v11.state.isUncollapsed.value and v11.state.isOpened.value then
            debug.profilebegin("Iris/Demo/MenuBar")
            mainMenuBar()
            debug.profileend()
            a1.Text({"Iris says hello. (" .. a1.Internal._version .. ")"})
            debug.profilebegin("Iris/Demo/Options")
            a1.CollapsingHeader({"Window Options"})
            a1.Table({3, false, false, false})
            a1.NextColumn()
            a1.Checkbox({"NoTitleBar"}, {isChecked = v1})
            a1.NextColumn()
            a1.Checkbox({"NoBackground"}, {isChecked = v2})
            a1.NextColumn()
            a1.Checkbox({"NoCollapse"}, {isChecked = v3})
            a1.NextColumn()
            a1.Checkbox({"NoClose"}, {isChecked = v4})
            a1.NextColumn()
            a1.Checkbox({"NoMove"}, {isChecked = v5})
            a1.NextColumn()
            a1.Checkbox({"NoScrollbar"}, {isChecked = v6})
            a1.NextColumn()
            a1.Checkbox({"NoResize"}, {isChecked = v7})
            a1.NextColumn()
            a1.Checkbox({"NoNav"}, {isChecked = v8})
            a1.NextColumn()
            a1.Checkbox({"NoMenu"}, {isChecked = v9})
            a1.End()
            a1.End()
            debug.profileend()
            debug.profilebegin("Iris/Demo/Events")
            widgetEventInteractivity()
            debug.profileend()
            debug.profilebegin("Iris/Demo/States")
            widgetStateInteractivity()
            debug.profileend()
            debug.profilebegin("Iris/Demo/Recursive")
            a1.CollapsingHeader({"Recursive Tree"})
            if a1.Tree({"Recursive Tree"}).state.isUncollapsed.value then
                recursiveTree()
            end
            a1.End()
            a1.End()
            debug.profileend()
            debug.profilebegin("Iris/Demo/Style")
            dynamicStyle()
            debug.profileend()
            a1.Separator()
            debug.profilebegin("Iris/Demo/Widgets")
            a1.CollapsingHeader({"Widgets"})
            for i, j in u40 do
                debug.profilebegin((("Iris/Demo/Widgets/%*"):format(j)))
                u24[j]()
                debug.profileend()
            end
            a1.End()
            debug.profileend()
            debug.profilebegin("Iris/Demo/Tables")
            tablesDemo()
            debug.profileend()
            debug.profilebegin("Iris/Demo/Layout")
            layoutDemo()
            debug.profileend()
        end
        a1.End()
        debug.profileend()
        if u6.value then
            recursiveWindow(u6)
        end
        if u9.value then
            runtimeInfo()
        end
        if u21.value then
            debugPanel()
        end
        if u12.value then
            u61()
        end
        if u15.value then
            windowlessDemo()
        end
        if u18.value then
            mainMenuBar()
        end
        return v11
    end
end