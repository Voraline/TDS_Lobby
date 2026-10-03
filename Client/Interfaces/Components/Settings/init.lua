-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings
-- Decompile time: 12.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Properties = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController.Modules.Game.Properties)
local SettingTypes = Properties.SettingTypes
local SettingOrder = Properties.SettingOrder
local useFFlag = require(ReplicatedStorage.Client.Interfaces.Hooks.useFFlag)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local AbilityKeybind = require(script.AbilityKeybind)
local Button = require(ReplicatedStorage.Client.Interfaces.Components.Button)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local Keybind = require(script.Keybind)
local Keybinds = require(script.Keybinds)
local Prompt = require(ReplicatedStorage.Client.Interfaces.Components.Prompt)
local Setting = require(script.Setting)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useState = React.useState
local useEffect = React.useEffect
local useRef = React.useRef

local function group(a1) -- Line: 40 -- upvalues: SettingOrder (val) -- types: a1: table
    local v1, v2
    local v3 = {}
    local v4 = {}
    local v5 = {name = "Unknown", children = {}}
    v4[v5.name] = v5
    table.insert(v3, v5)
    local v6 = nil
    local v7 = nil
    for i, j in a1, v6, v7 do
        v2 = j.Group or "Unknown"
        v1 = v4[v2]
        if not v1 then
            v1 = {name = v2, children = {}}
            v4[v2] = v1
            table.insert(v3, v1)
        end
        table.insert(v1.children, {i, j})
    end
    for k, n in v3 do
        table.sort(n.children, function(a1, a2) -- Line: 62 -- upvalues: SettingOrder (upval)
            local v1 = table.find(SettingOrder, a1[1])
            local v2 = table.find(SettingOrder, a2[1])
            if v1 and v2 then
                return v1 < v2
            end
            if v1 then
                return true
            end
            if v2 then
                return false
            end
            return a1.name < a2.name
        end)
    end
    return v3
end

local function categorize(a1, a2) -- Line: 81 -- types: a1: string, a2: table
    local v1 = {}
    for i, j in a2 do
        if j.Category == a1 then
            v1[i] = j
        end
    end
    return v1
end

local function Window(a1) -- Line: 95
    -- upvalues: useRef (val), useState (val), useEffect (val), createElement (val), Button (val), React (val)
    -- upvalues: IconButton (val)
    local v1, v2
    local v3 = a1.Scale or 1
    local Sections = a1.Sections or {}
    local Section = a1.Section
    local SetSection = a1.SetSection
    if not Section then
        Section = Sections[1]
    end
    local u326 = useRef()
    local v4, u15 = useState(0)
    local v5 = {u326}
    useEffect(function() -- Line: 107 -- upvalues: u326 (val), u15 (val)
        if not u326 then
            return
        end
        local current = u326.current
        local u10 = (current:GetPropertyChangedSignal("AbsoluteContentSize")):Connect(function() -- Line: 113 -- upvalues: u15 (upval), current (val)
            u15(current.AbsoluteContentSize.Y)
        end)
        u15(current.AbsoluteContentSize.Y)
        return function() -- Line: 119 -- upvalues: u10 (val)
            u10:Disconnect()
        end
    end, v5)
    local v6 = {}
    v5 = nil
    local v7 = nil
    local v8 = a1
    for i, j in Sections, v5, v7 do
        v1 = {Text = j, LayoutOrder = i}
        v1.Size = UDim2.new(1 / #Sections, -5, 0, 44)
        v2 = not (Section ~= j) and Color3.fromRGB(109, 243, 72) or Color3.fromRGB(135, 135, 135)
        v1.Color = v2

        function v1.Clicked() -- Line: 132 -- upvalues: SetSection (val), j (val)
            if SetSection then
                SetSection(j)
            end
        end

        v6[j] = (createElement(Button, v1))
    end
    return createElement("Frame", {
        BackgroundTransparency = 0.2,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(9, 9, 9),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromOffset(864, 502),
        Visible = v8.Visible,
    }, {
        uICorner = createElement("UICorner"),
        uiScale = createElement("UIScale", {Scale = v3}),
        dropShadow = createElement("ImageLabel", {
            Image = "rbxassetid://9239716855",
            ImageTransparency = 0.2,
            BackgroundTransparency = 1,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }),
        navigation = createElement("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(10, 0),
            Size = UDim2.new(1, -20, 0, 64),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 10),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            buttons = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.new(1, -55, 1, 0)}, {
                uIListLayout = createElement("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                }),
                content = React.createElement(React.Fragment, {}, v6),
                leave = createElement(IconButton, {
                    LayoutOrder = 10,
                    AnchorPoint = Vector2.new(0, 0.5),
                    Size = UDim2.fromOffset(44, 44),
                    Position = UDim2.new(0, 10, 0.5, 0),
                    Color = Color3.fromRGB(255, 60, 60),
                    Clicked = v8.Leave,
                }),
            }),
        }),
        scrollingFrame = createElement("ScrollingFrame", {
            ScrollBarThickness = 8,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            CanvasSize = UDim2.new(0, 0, 0, v4 * (1 / v3) + 10),
            ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
            ScrollingDirection = Enum.ScrollingDirection.Y,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0, 64),
            Size = UDim2.new(1, 0, 1, -72),
        }, {
            uIListLayout1 = createElement("UIListLayout", {
                Padding = UDim.new(0, 8),
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                SortOrder = Enum.SortOrder.LayoutOrder,
                ref = u326,
            }),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 8),
            }),
            children = React.createElement(React.Fragment, {}, v8.children or {}),
        }),
    })
end

local function WindowSection(a1) -- Line: 239 -- upvalues: createElement (val), React (val)
    local v1 = if not (a1.UseGrid == true) then createElement("UIListLayout", {
        Padding = UDim.new(0, 8),
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        SortOrder = Enum.SortOrder.LayoutOrder,
    }) else createElement("UIGridLayout", {
        CellPadding = UDim2.fromOffset(8, 8),
        CellSize = UDim2.new(0.5, -8, 0, 80),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    local v2 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.LayoutOrder or 2,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.new(1, 0, 0, 0),
    }
    local v3 = {}
    local v4 = a1.Title and createElement("TextLabel", {
        TextSize = 24,
        BackgroundTransparency = 1,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Text = a1.Title,
        TextColor3 = Color3.fromRGB(255, 255, 255),
        TextXAlignment = Enum.TextXAlignment.Left,
        AnchorPoint = Vector2.new(0, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.new(0, 8, 0.5, 0),
        Size = UDim2.new(1, 0, 0, 25),
    }, {
        divider = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(121, 121, 121),
            Position = UDim2.new(0.5, 0, 1, 2),
            Size = UDim2.new(0.9, 0, 0, 2),
        }),
    }) or nil
    v3.title = v4
    v3.layout = v1
    v3.children = React.createElement(React.Fragment, {}, a1.children or {})
    return createElement("Frame", v2, v3)
end

return function(a1) -- Line: 296
    -- upvalues: useScale (val), useFFlag (val), useState (val), SettingTypes (val), group (val), AbilityKeybind (val)
    -- upvalues: Keybind (val), Setting (val), createElement (val), Keybinds (val), WindowSection (val), React (val)
    -- upvalues: Button (val), Prompt (val), Window (val), UserInputService (val)
    local Default, Type, name, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = useScale(1.5)
    local v10 = useScale(1)
    local v11 = useFFlag("tower_pets.enabled", false, {enabled = a1.Visible ~= false})
    local v12 = useFFlag("shop.subscriptions", false, {enabled = a1.Visible ~= false})
    local v13 = v11 and v12
    local Gameplay, Gameplay_2 = useState("Gameplay")
    local u565, u571 = useState(false)
    local v14 = {}
    local u583 = {}
    for i, j in SettingTypes do
        if j.Category == Gameplay then
            u583[i] = j
        end
    end
    local v15 = Gameplay == "Keybinds"
    local Settings = a1.Settings or {}
    local UpdateSetting = a1.UpdateSetting
    if not UpdateSetting then
        function UpdateSetting(a1, a2) end
    end
    local v16 = a1
    for k, n in group(u583) do
        v1 = {}
        v2 = true
        if #n.children ~= 0 then
            v3 = nil
            v4 = nil
            for m, i5 in n.children, v3, v4 do
                v6, v7 = unpack(i5)
                Type = v7.Type
                Default = Settings[v6]
                if Default == nil then
                    Default = v7.Default
                end
                if v6 == "Show Tower Pets" then
                    if v13 then
                        if Type ~= "Switch"
                            and Type ~= "AutoSkip"
                            and Type ~= "EquipTowerPets"
                            and Type ~= "SkillsEnabled" then
                            v2 = false
                        end
                        v8 = {
                            Size = UDim2.new(1, -10, 0, 80),
                            Title = v7.DisplayName or v6,
                            Description = v7.Description or "Unknown...",
                            Icon = v7.Icon or 2119177887,
                            Ability = Type == "AbilityHotkey",
                            LayoutOrder = m,
                            Value = {
                                Name = v6,
                                Type = v7.Type,
                                Properties = v7,
                                Current = Default,
                                Values = Settings,
                                UpdateSetting = UpdateSetting,
                            },
                        }
                        v1[v6] = (createElement(if Type ~= "AbilityHotkey" then if Type ~= "Hotkey" then Setting else Keybind else AbilityKeybind, v8))
                    end
                elseif v6 ~= "Equip Tower Pets" then
                    if v6 ~= "Low Quality Paths" then
                        if Type ~= "Switch"
                            and Type ~= "AutoSkip"
                            and Type ~= "EquipTowerPets"
                            and Type ~= "SkillsEnabled" then
                            v2 = false
                        end
                        v8 = {
                            Size = UDim2.new(1, -10, 0, 80),
                            Title = v7.DisplayName or v6,
                            Description = v7.Description or "Unknown...",
                            Icon = v7.Icon or 2119177887,
                            Ability = Type == "AbilityHotkey",
                            LayoutOrder = m,
                            Value = {
                                Name = v6,
                                Type = v7.Type,
                                Properties = v7,
                                Current = Default,
                                Values = Settings,
                                UpdateSetting = UpdateSetting,
                            },
                        }
                        v1[v6] = (createElement(if Type ~= "AbilityHotkey" then if Type ~= "Hotkey" then Setting else Keybind else AbilityKeybind, v8))
                    end
                elseif v13 then
                    if Type ~= "Switch"
                        and Type ~= "AutoSkip"
                        and Type ~= "EquipTowerPets"
                        and Type ~= "SkillsEnabled" then
                        v2 = false
                    end
                    v8 = {
                        Size = UDim2.new(1, -10, 0, 80),
                        Title = v7.DisplayName or v6,
                        Description = v7.Description or "Unknown...",
                        Icon = v7.Icon or 2119177887,
                        Ability = Type == "AbilityHotkey",
                        LayoutOrder = m,
                        Value = {
                            Name = v6,
                            Type = v7.Type,
                            Properties = v7,
                            Current = Default,
                            Values = Settings,
                            UpdateSetting = UpdateSetting,
                        },
                    }
                    v1[v6] = (createElement(if Type ~= "AbilityHotkey" then if Type ~= "Hotkey" then Setting else Keybind else AbilityKeybind, v8))
                end
            end
            name = n.name
            if next(v1) then
                v5 = {Title = not (name == "Unknown") and n.name or nil, UseGrid = v2}
                v5.LayoutOrder = if name ~= "Abilities" then if name ~= "Unknown" then k else -1 else 9
                v14[name] = (createElement(v15 and Keybinds or WindowSection, v5, {children = React.createElement(React.Fragment, {}, v1)}))
            end
        end
    end
    if v15 then
        v14["Reset Keybinds"] = createElement("Frame", {BackgroundTransparency = 1, LayoutOrder = 10, Size = UDim2.new(1, 0, 0, 60)}, {
            button = createElement(Button, {
                Text = "Reset Keybinds",
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.new(0, 250, 1, -10),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = function() -- Line: 412 -- upvalues: u571 (val)
                    u571(true)
                end,
            }),
        })
    end
    return React.createElement(React.Fragment, {}, {
        prompt = createElement(Prompt, {
            Icon = 13316489936,
            Title = "Reset Keybinds",
            Description = "Would you like to reset all keybinds to their default values?",
            Visible = u565,
            SetVisible = u571,
        }, {
            yes = createElement(Button, {
                Text = "Yes",
                TextFontSize = math.floor(24 * v10),
                Size = UDim2.fromOffset(220 * v10, 44 * v10),
                Clicked = function() -- Line: 432 -- upvalues: u571 (val), u565 (val), group (upval), u583 (val), UpdateSetting (val)
                    local v1, v2
                    u571(false)
                    if not u565 then
                        return
                    end
                    for i, j in group(u583) do
                        for k, n in j.children do
                            v1, v2 = unpack(n)
                            if v2.Type == "Hotkey" then
                                UpdateSetting(v1, v2.Default)
                            end
                        end
                    end
                end,
            }),
            no = createElement(Button, {
                Text = "No",
                TextFontSize = math.floor(24 * v10),
                Size = UDim2.fromOffset(220 * v10, 44 * v10),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = function() -- Line: 457 -- upvalues: u571 (val)
                    u571(false)
                end,
            }),
        }),
        window = createElement(Window, {
            Visible = not u565 and v16.Visible,
            Leave = v16.Close,
            Sections = {
                "Gameplay",
                "Graphics",
                "Sound",
                if not UserInputService.KeyboardEnabled then nil else "Keybinds",
            },
            SetSection = Gameplay_2,
            Section = Gameplay,
            Scale = v9,
        }, {content = React.createElement(React.Fragment, {}, v14)}),
    })
end