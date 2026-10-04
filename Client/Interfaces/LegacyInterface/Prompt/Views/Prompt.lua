-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Prompt.Views.Prompt
-- Decompile time: 11.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Client.Interfaces.Stores.Shared
local Controllers = script.Parent.Parent.Parent.Controllers
local Icons = require(script.Parent.Parent.Icons)
local PromptModal = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local ScreenStore = require(Shared.ScreenStore)
local ViewController = require(Controllers.ViewController)
local ViewStateStore = require(Shared.ViewStateStore)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local useEffect = React.useEffect

local function asText(a1) -- Line: 23
    if a1 == nil then
        return nil
    end
    if type(a1) == "string" then
        return a1
    end
    return (tostring(a1))
end

local function asColor(a1) -- Line: 35
    if typeof(a1) == "Color3" then
        return a1
    end
    return nil
end

local function asUDim2(a1) -- Line: 39
    if typeof(a1) == "UDim2" then
        return a1
    end
    return nil
end

local function asVector2(a1) -- Line: 43
    if typeof(a1) == "Vector2" then
        return a1
    end
    return nil
end

local function resolveIcon(a1) -- Line: 47 -- upvalues: Icons (val)
    if a1 == nil then
        return nil
    end
    if type(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    if type(a1) ~= "string" then
        return (tostring(a1))
    end
    return Icons[a1] or a1
end

local function normalizeActions(a1) -- Line: 63 -- upvalues: Icons (val)
    local Color, Icon, Size, Text, TextColor, TextStrokeColor, v1
    local v2 = {}
    if type(a1) ~= "table" then
        return v2
    end
    for i, v in ipairs(a1) do
        if type(v) == "table" then
            v1 = {key = ("button%*"):format(i)}
            Text = v.Text
            v1.text = if Text ~= nil then if type(Text) ~= "string" then tostring(Text) else Text else nil
            Color = v.Color
            v1.color = if typeof(Color) ~= "Color3" then nil else Color
            TextColor = v.TextColor
            v1.textColor = if typeof(TextColor) ~= "Color3" then nil else TextColor
            TextStrokeColor = v.TextStrokeColor
            v1.textStrokeColor = if typeof(TextStrokeColor) ~= "Color3" then nil else TextStrokeColor
            v1.textStrokeTransparency = if type(v.TextStrokeTransparency) ~= "number" then nil else v.TextStrokeTransparency
            Icon = v.Icon
            v1.icon = if Icon ~= nil then if type(Icon) ~= "number" then if type(Icon) == "string" then Icons[Icon] or Icon else tostring(Icon) else ("rbxassetid://%*"):format(Icon) else nil
            Size = v.Size
            v1.size = if typeof(Size) ~= "UDim2" then nil else Size
            v1.layoutOrder = if type(v.LayoutOrder) ~= "number" then i else v.LayoutOrder
            v1.visible = v.Visible ~= false
            v1.richText = v.RichText == true
            v1.onClick = if type(v.Clicked) ~= "function" then nil else v.Clicked
            v2[i] = v1
        end
    end
    return v2
end

local function normalizeStats(a1) -- Line: 98 -- upvalues: Icons (val)
    local AnchorPoint, Icon, Position, Size, Value, v1
    local v2 = {}
    if type(a1) ~= "table" then
        return v2
    end
    for i, v in ipairs(a1) do
        if type(v) == "table" then
            v1 = {key = ("stat%*"):format(i)}
            Icon = v.Icon
            v1.icon = if Icon ~= nil then if type(Icon) ~= "number" then if type(Icon) == "string" then Icons[Icon] or Icon else tostring(Icon) else ("rbxassetid://%*"):format(Icon) else nil
            Value = v.Value
            v1.value = if Value ~= nil then if type(Value) ~= "string" then tostring(Value) else Value else nil
            Size = v.Size
            v1.size = if typeof(Size) ~= "UDim2" then nil else Size
            Position = v.Position
            v1.position = if typeof(Position) ~= "UDim2" then nil else Position
            AnchorPoint = v.AnchorPoint
            v1.anchorPoint = if typeof(AnchorPoint) ~= "Vector2" then nil else AnchorPoint
            v1.layoutOrder = if type(v.LayoutOrder) ~= "number" then i else v.LayoutOrder
            v2[i] = v1
        end
    end
    return v2
end

local function getPromptScale(a1) -- Line: 124 -- types: a1: string?
    if a1 == "Phone" then
        return 0.6
    end
    if a1 == "Tablet" then
        return 0.8
    end
    return 1
end

local function syncInputSink(a1, a2) -- Line: 134 -- types: a1: userdata?, a2: boolean
    local Active
    if not a1 then
        return
    end
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("GuiObject") then
            if a2 then
                if v:GetAttribute("InitialActive") == nil then
                    Active = v.Active
                    v:SetAttribute("InitialActive", Active)
                end
                v.Active = false
            elseif v:GetAttribute("InitialActive") ~= nil then
                v.Active = v:GetAttribute("InitialActive")
                v:SetAttribute("InitialActive", nil)
            end
        end
    end
end

local function PromptContainer(a1) -- Line: 157
    -- upvalues: ReactCharm (val), ScreenStore (val), ViewStateStore (val), useSound (val), useEffect (val)
    -- upvalues: syncInputSink (val), createElement (val), PromptModal (val), Icons (val), normalizeActions (val)
    -- upvalues: normalizeStats (val)
    local v1 = ReactCharm.useSignalState(ScreenStore.getState)
    local v2 = ReactCharm.useSignalState(ViewStateStore.getState)
    local Click = useSound("Click")
    local v3 = v2.prompts[1]
    local u17 = v3 ~= nil
    local v4 = useEffect
    local v5 = {a1.inputRoot, u17}
    v4(function() -- Line: 165 -- upvalues: syncInputSink (upval), a1 (val), u17 (val)
        syncInputSink(a1.inputRoot, u17)
        return function() -- Line: 168 -- upvalues: syncInputSink (upval), a1 (upval)
            syncInputSink(a1.inputRoot, false)
        end
    end, v5)
    if not v3 then
        return nil
    end
    v5 = {visible = v3.Visible ~= false, noBackground = v3.NoBackground == true}
    local Icon = v3.Icon
    v5.icon = if Icon ~= nil then if type(Icon) ~= "number" then if type(Icon) == "string" then Icons[Icon] or Icon else tostring(Icon) else ("rbxassetid://%*"):format(Icon) else nil
    local Subject = v3.Subject
    v5.subject = if Subject ~= nil then if type(Subject) ~= "string" then tostring(Subject) else Subject else nil
    local Description = v3.Description
    v5.description = if Description ~= nil then if type(Description) ~= "string" then tostring(Description) else Description else nil
    v5.actions = normalizeActions(v3.Buttons)
    v5.stats = normalizeStats(v3.Stats)
    local Size = v3.Size
    v5.size = if typeof(Size) ~= "UDim2" then nil else Size
    local Position = v3.Position
    v5.position = if typeof(Position) ~= "UDim2" then nil else Position
    local AnchorPoint = v3.AnchorPoint
    v5.anchorPoint = if typeof(AnchorPoint) ~= "Vector2" then nil else AnchorPoint
    v5.layoutOrder = if type(v3.LayoutOrder) ~= "number" then nil else v3.LayoutOrder
    local deviceType = v1.deviceType
    v5.scale = if deviceType ~= "Phone" then if deviceType ~= "Tablet" then 1 else 0.8 else 0.6
    v5.playClick = Click
    return createElement(PromptModal, v5)
end

return function(a1) -- Line: 196
    -- upvalues: ViewController (val), ReactRoblox (val), createElement (val), PromptContainer (val)
    ViewController:init()
    local Frame = Instance.new("Frame")
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.fromScale(1, 1)
    local u16 = ReactRoblox.createRoot(Frame)
    u16:render((createElement(PromptContainer, {inputRoot = a1.Root})))
    Frame.Destroying:Once(function() -- Line: 208 -- upvalues: u16 (val)
        u16:unmount()
    end)
    return Frame
end