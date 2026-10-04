-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.Sandbox.QuickCmds.QuickCmdsContent
-- Decompile time: 6.33 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local QuickCmdButton = require(script.Parent.QuickCmdButton)
local QuickCmdInput = require(script.Parent.QuickCmdInput)
local createElement = React.createElement
local u32 = {}
u32[1] = {
    name = "Time Scale",
    type = "input",
    withState = function() -- Line: 22 -- upvalues: useGameStateValue (val)
        return useGameStateValue("TimeScale", 1), function(a1) -- Line: 25 -- types: a1: string
            local v1 = tonumber(a1)
            if v1 and v1 == v1 and not (v1 < 0) then
                executeCmd("SetOption", "Timescale", v1)
                return
            end
        end
    end,
}
u32[2] = {
    name = "God",
    type = "action",
    withState = function() -- Line: 39
        local u3 = useSandboxOption("Invincible", false)
        return u3, function() -- Line: 43 -- upvalues: u3 (val)
            executeCmd("ToggleOption", "Invincible", not u3)
        end
    end,
}
u32[3] = {
    name = "Inf Money",
    type = "action",
    withState = function() -- Line: 52
        local u3 = useSandboxOption("InfiniteCash", false)
        return u3, function() -- Line: 56 -- upvalues: u3 (val)
            executeCmd("ToggleOption", "InfiniteCash", not u3)
        end
    end,
}
u32[4] = {
    name = "Sell All",
    type = "action",
    withState = function() -- Line: 65
        return nil, function() -- Line: 66
            executeCmd("SellTowers")
        end
    end,
}
u32[5] = {
    name = "Toggle Music",
    type = "action",
    withState = function() -- Line: 75
        local u3 = useSandboxOption("MusicEnabled", false)
        return u3, function() -- Line: 79 -- upvalues: u3 (val)
            executeCmd("ToggleOption", "MusicEnabled", not u3)
        end
    end,
}
u32[6] = {
    name = "Cancel Timer",
    type = "action",
    withState = function() -- Line: 88
        return nil, function() -- Line: 89
            executeCmd("CancelTimer")
        end
    end,
}

local function convertValue(a1) -- Line: 96
    if typeof(a1) ~= "boolean" then
        return a1
    end
    if a1 then
        return "ON"
    end
    return "OFF"
end

function executeCmd(a1, ...) -- Line: 106 -- upvalues: NewNetwork (val) -- types: a1: string
    NewNetwork.Channel("Sandbox"):fireServer(a1, ...)
end

function useSandboxOption(a1, a2) -- Line: 111 -- upvalues: useGameStateValue (val) -- types: a1: string
    local v1 = useGameStateValue("SandboxOptions", {})[a1]
    if v1 == nil then
        v1 = a2
    end
    return v1
end

return function() -- Line: 122
    -- upvalues: u32 (val), createElement (val), QuickCmdButton (val), QuickCmdInput (val), React (val)
    local name_2, v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = nil
    local v8 = nil
    for i, j in u32, v7, v8 do
        v4, u64 = j.withState()
        if j.type ~= "action" then
            v3 = createElement(QuickCmdInput, {
                layoutOrder = i,
                displayText = ("%*:"):format(j.name),
                state = if typeof(v4) ~= "boolean" then v4 else if not v4 then "OFF" else "ON",
                changed = function(a1) -- Line: 150 -- upvalues: u64 (val)
                    u64(a1)
                end,
            })
        else
            v1 = typeof(if typeof(v4) ~= "boolean" then v4 else if not v4 then "OFF" else "ON")
            if v1 ~= "string" and v5 ~= nil then
                assert(
                    false,
                    (("Unexpected value for quick-action: expected \"string?\" got \"%*\". Try a quick-input instead!"):format(v1))
                )
            end
            v2 = {layoutOrder = i, clicked = u64}
            name_2 = if v4 == nil then j.name else ("%*: %*"):format(j.name, v5)
            v2.displayText = name_2
            v3 = createElement(QuickCmdButton, v2)
        end
        v6[j.name] = v3
    end
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 1),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(1, -8, 1, -8),
        Size = UDim2.new(0.25, 0, 0, 256),
    }, {
        list = createElement("UIListLayout", {
            Wraps = true,
            FillDirection = Enum.FillDirection.Horizontal,
            Padding = UDim.new(0, 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Bottom,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
        }),
        content = createElement(React.Fragment, {}, v6),
    })
end