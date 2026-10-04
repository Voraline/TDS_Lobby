-- Script path: ReplicatedStorage.Client.Interfaces.Components.Settings.AbilityKeybind
-- Decompile time: 4.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local useSelectionList = require(ReplicatedStorage.Client.Interfaces.Hooks.useSelectionList)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local TowerAbilities = require(ReplicatedStorage.Shared.Data.SharedData.TowerAbilities)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local Event = React.Event
local u39 = table.clone(TowerAbilities)
table.insert(u39, 1, "Automatic")
local Keybind = require(script.Parent.Keybind)

local function hasPriority(a1, a2) -- Line: 20 -- types: a1: table, a2: string
    for i = 1, 6 do
        if (a1[("Ability %* Priority"):format(i)] or "Automatic") == a2 then
            return true
        end
    end
end

local function getDisabledPriorities(a1, a2) -- Line: 29
    -- upvalues: u39 (val), hasPriority (val), table (val)
    local v1
    local v2 = {}
    local v3, v4 = a1, a2
    for i = #u39, 2, -1 do
        v1 = u39[i]
        if hasPriority(v3, v1) and v4 ~= v1 then
            table.insert(v2, v1)
        end
    end
    return v2
end

return function(a1) -- Line: 42
    -- upvalues: useSound (val), useRef (val), table (val), u39 (val), useSelectionList (val)
    -- upvalues: getDisabledPriorities (val), createElement (val), Keybind (val), Event (val)
    local Value = a1.Value or {}
    local Values = Value.Values or {}
    local UpdateSetting = Value.UpdateSetting
    local u12 = ("%* Priority"):format(Value.Name)
    local v1 = Value.Values[u12] or "Automatic"
    local Equip = useSound("Equip")
    local v2, u38 = useSelectionList(v1, {
        Title = "Set Priority",
        Values = (useRef(table.clone(u39))).current,
        Highlight = {"Automatic"},
        Disabled = getDisabledPriorities(Values, v1),
        OnUpdate = function(a1) -- Line: 59 -- upvalues: UpdateSetting (val), u12 (val), Equip (val)
            UpdateSetting(u12, a1)
            Equip()
        end,
    })
    local v3 = table.merge({}, a1, {KeybindOffset = UDim2.new(1, -272, 0.5, 0)})
    local v4 = createElement
    local v5 = Keybind
    local v6 = {}
    local v7 = createElement
    local v8 = {
        Text = "",
        AnchorPoint = Vector2.new(1, 0.5),
        BackgroundColor3 = Color3.fromRGB(63, 63, 63),
        Position = UDim2.new(1, -16, 0.5, 0),
        Selectable = false,
        Size = UDim2.fromOffset(224, 48),
    }

    v8[Event.MouseButton1Up] = function() -- Line: 78 -- upvalues: u38 (val)
        u38()
    end

    v6.priority = v7("TextButton", v8, {
        bind = createElement("TextLabel", {
            TextSize = 20,
            BackgroundTransparency = 1,
            ZIndex = 3,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = v2,
            TextColor3 = Color3.fromRGB(185, 185, 185),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 0, 0, 32),
        }),
        uIStroke = createElement("UIStroke", {
            Thickness = 2,
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = Color3.fromRGB(189, 189, 189),
            LineJoinMode = Enum.LineJoinMode.Bevel,
        }),
    })
    return v4(v5, v3, v6)
end