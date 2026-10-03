-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.Keybind
-- Decompile time: 4.81 ms

local ContextActionService = game:GetService("ContextActionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local KeyCode = require(ReplicatedStorage.Shared.Modules.KeyCode)
local TowerAbilities = require(ReplicatedStorage.Shared.Data.SharedData.TowerAbilities)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local createContext = React.createContext
local useContext = React.useContext
local useEffect = React.useEffect
local useRef = React.useRef
local Event = React.Event
local u60 = createContext({})
table.insert(table.clone(TowerAbilities), 1, "Automatic")

local function useKeybindUpdate(a1, a2) -- Line: 26
    -- upvalues: useContext (val), u60 (val), useRef (val), useEffect (val), ContextActionService (val)
    local u4 = useContext(u60)
    local u7 = useRef({})
    useEffect(function() -- Line: 30 -- upvalues: u4 (val), u7 (val), ContextActionService (upval), a2 (val)
        return function() -- Line: 31 -- upvalues: u4 (upval), u7 (upval), ContextActionService (upval), a2 (upval)
            if u4.current == u7.current then
                ContextActionService:UnbindAction("UPDATE_KEYBIND")
            end
            if a2 then
                a2()
            end
        end
    end, {})
    return function() -- Line: 42 -- upvalues: u4 (val), u7 (val), a2 (val), ContextActionService (upval), a1 (val)
        if u4.current == u7.current then
            return
        end
        if u4.cancel then
            u4.cancel()
            u4.cancel = nil
        end
        u4.current = u7.current
        u4.cancel = a2
        ContextActionService:UnbindAction("UPDATE_KEYBIND")
        local v1 = ContextActionService
        local Keyboard = Enum.UserInputType.Keyboard
        v1:BindAction("UPDATE_KEYBIND", function(a1_2, a2, a3) -- Line: 56
            -- upvalues: ContextActionService (upval), u4 (upval), a1 (upval)
            if a3.KeyCode == Enum.KeyCode.Unknown then
                return
            end
            if a3.UserInputState == Enum.UserInputState.End then
                ContextActionService:UnbindAction("UPDATE_KEYBIND")
                u4.current = nil
                u4.cancel = nil
                if a1 then
                    a1(a3)
                end
            end
            return Enum.ContextActionResult.Sink
        end, false, Keyboard)
    end
end

local function hasKeyCode(a1, a2) -- Line: 76 -- types: a1: table
    for k, v in pairs(a1) do
        if v == a2.Name then
            return true, k
        end
    end
    return false
end

return function(a1) -- Line: 86
    -- upvalues: useSpring (val), useSound (val), React (val), useKeybindUpdate (val), Notification (val)
    -- upvalues: createElement (val), Event (val), KeyCode (val)
    local u15, v1
    local Value = a1.Value
    if not Value then
        Value = {}
    end
    local Values = Value.Values
    if not Values then
        Values = {}
    end
    local UpdateSetting = Value.UpdateSetting
    v1, _, u15 = useSpring(0, 1, 10, true)
    local Click = useSound("Click")
    local Equip = useSound("Equip")
    local v2, u26 = React.useBinding("")
    local u31 = useKeybindUpdate(function(a1) -- Line: 98
        -- upvalues: Values (val), u26 (val), Value (val), Equip (val), UpdateSetting (val), Notification (upval)
        -- upvalues: u15 (val)
        local v1
        for k, v in pairs(Values) do
            if v == a1.KeyCode.Name then
                v1 = k
                u26("")
                if v1 and v1 == Value.Name then
                    Equip()
                    return
                end
                if false then
                    UpdateSetting(Value.Name, a1.KeyCode.Name)
                    Equip()
                    return
                end
                Notification.Create({
                    Text = string.format("Keybind already in use by %q", v1),
                    Color = Color3.fromRGB(255, 0, 0),
                })
                u15(1)
                return
            end
        end
        v1 = nil
        u26("")
        if v1 and v1 == Value.Name then
            Equip()
            return
        end
        if true then
            UpdateSetting(Value.Name, a1.KeyCode.Name)
            Equip()
            return
        end
        Notification.Create({
            Text = string.format("Keybind already in use by %q", v1),
            Color = Color3.fromRGB(255, 0, 0),
        })
        u15(1)
    end, function() -- Line: 119 -- upvalues: u26 (val)
        u26("")
    end)
    local v3 = {
        BackgroundTransparency = 0,
        LayoutOrder = a1.LayoutOrder,
        BackgroundColor3 = Color3.fromRGB(121, 121, 121),
        Size = UDim2.new(0.5, 0, 0, 64),
    }
    local v4 = {
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
        title = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.Title,
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.new(1, 1, 1),
            Position = UDim2.new(0, 16, 0.5, 0),
            Size = UDim2.new(1, -176, 0, 28),
        }, {uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
    }
    local v5 = {
        Text = "",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(63, 63, 63),
    }
    local KeybindOffset = a1.KeybindOffset or UDim2.new(1, -16, 0.5, 0)
    v5.Position = KeybindOffset
    v5.Selectable = false
    v5.Size = UDim2.fromOffset(112, 48)

    v5[Event.MouseButton1Up] = function() -- Line: 165 -- upvalues: u26 (val), Click (val), u31 (val)
        u26("...")
        Click()
        u31()
    end

    v4.keybind = createElement("TextButton", v5, {
        uIStroke1 = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = v1:map(function(a1) -- Line: 173
                return (Color3.fromRGB(189, 189, 189)):Lerp(Color3.new(1, 0, 0), a1)
            end),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
        bind = createElement("TextLabel", {
            TextSize = 20,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = v2:map(function(a1) -- Line: 186 -- upvalues: Value (val), KeyCode (upval)
                return not (a1 == "") and a1 or Value.Current and KeyCode(Value.Current) or ""
            end),
            TextColor3 = Color3.fromRGB(156, 156, 156),
            AnchorPoint = Vector2.new(0.5, 0.5),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = v1:map(function(a1) -- Line: 196
                return (Color3.new(1, 1, 1)):Lerp(Color3.new(1, 0, 0), a1)
            end),
            BackgroundTransparency = v2:map(function(a1) -- Line: 199
                if a1 == "..." then
                    return 1
                end
                return 0
            end),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(0, 32),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 4)}),
            uIStroke2 = createElement("UIStroke", {
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Transparency = v2:map(function(a1) -- Line: 213
                    if a1 == "..." then
                        return 1
                    end
                    return 0
                end),
                Color = v1:map(function(a1) -- Line: 216
                    return (Color3.fromRGB(156, 156, 156)):Lerp(Color3.fromRGB(168, 58, 58), a1)
                end),
            }),
            uIPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 16), PaddingRight = UDim.new(0, 16)}),
        }),
    })
    v4.children = React.createElement(React.Fragment, {}, a1.children or {})
    return createElement("Frame", v3, v4)
end