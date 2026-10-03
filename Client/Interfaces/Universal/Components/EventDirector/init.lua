-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector
-- Decompile time: 2.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CommandsPanel = require(script.CommandsPanel)
local Controls = require(script.Controls)
local React = require(ReplicatedStorage.Shared.UI.React)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
require(script.Types)
local WindowFrame = require(script.Parent.Inventory.WindowFrame)
local createElement = React.createElement
local u35 = {phase = "Idle", environment = "Not connected"}
local u36 = {}
return function(a1) -- Line: 27
    -- upvalues: u35 (val), u36 (val), createElement (val), WindowFrame (val), TextLabel (val), Controls (val)
    -- upvalues: CommandsPanel (val)
    local status = a1.status or u35
    local capabilities = a1.capabilities or u36
    local v1 = true
    if a1.busy ~= true then
        v1 = a1.retryable == true
    end
    local v2 = (if not a1.retryable then 0 else 56) + 72
    local v3 = {
        BackgroundTransparency = 1,
        Active = true,
        SelectionGroup = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, -32, 1, -32),
    }
    local v4 = {Constraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(1320, 940)})}
    local v5 = {
        filterBackgroundTransparency = 0.12,
        size = UDim2.fromScale(1, 1),
        position = UDim2.new(),
        anchorPoint = Vector2.zero,
        filterSize = UDim2.new(1, 0, 0, 64),
    }
    local v6 = {
        Title = createElement(TextLabel, {
            Text = "EVENT DIRECTOR",
            TextSize = 24,
            TextScaled = false,
            Font = "GothamSSm",
            FontWeight = "Bold",
            StrokeTransparency = 0.35,
            StrokeThickness = 2,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.zero,
            Position = UDim2.fromOffset(18, 0),
            Size = UDim2.new(1, -112, 1, 0),
            StrokeColor = Color3.new(),
        }),
    }
    local onClose = a1.onClose and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.new(1, -80, 0, 8),
        Size = UDim2.fromOffset(68, 48),
    }, {
        Button = createElement(Controls.Button, {text = "Close", onActivated = a1.onClose}),
    })
    v6.Close = onClose
    local v7 = {}
    local retryable = a1.retryable and a1.onRetry and createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, 72),
        Size = UDim2.new(1, -32, 0, 48),
    }, {
        Button = createElement(Controls.Button, {text = "Retry unconfirmed request", disabled = a1.busy, onActivated = a1.onRetry}),
    })
    v7.Retry = retryable
    v7.Body = createElement("Frame", {
        BackgroundTransparency = 1,
        Position = UDim2.fromOffset(16, v2),
        Size = UDim2.new(1, -32, 1, -v2 - 18),
    }, {
        Commands = createElement(CommandsPanel, {
            actions = a1.actions,
            status = status,
            capabilities = capabilities,
            busy = v1,
            onRunCommand = a1.onRunCommand,
            onSendLiveMessage = function(a1_2) -- Line: 97 -- upvalues: a1 (val)
                a1.onAction("send-live-message", {message = a1_2})
            end,
            onStop = function() -- Line: 100 -- upvalues: a1 (val)
                a1.onAction("stop")
            end,
        }),
    })
    v6.otherChildren = v7
    v4.Window = createElement(WindowFrame, v5, v6)
    return createElement("Frame", v3, v4)
end