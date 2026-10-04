-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.SandboxExitButton
-- Decompile time: 3.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Button = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.Button)
local PromptModal = require(ReplicatedStorage.Client.Interfaces.Universal.Components.PromptModal)
local React = require(ReplicatedStorage.Shared.UI.React)
local useScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useScale)
local createElement = React.createElement
local u36 = Color3.fromRGB(210, 55, 55)
return function(a1) -- Line: 17
    -- upvalues: React (val), useScale (val), createElement (val), Button (val), u36 (val), PromptModal (val)
    local v1, u5 = React.useState(false)
    return createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        ExitButtonContainer = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 1),
            Position = UDim2.new(0, 24, 1, -24),
            Size = UDim2.fromOffset(210, 60),
        }, {
            UIScale = createElement("UIScale", {Scale = useScale(1.5)}),
            ExitButton = createElement(Button, {
                dontScale = true,
                textSize = 20,
                anchorPoint = Vector2.new(0.5, 0.5),
                color = u36,
                loading = a1.exiting,
                onClick = function() -- Line: 40 -- upvalues: a1 (val), u5 (val)
                    if a1.exiting then
                        return
                    end
                    u5(true)
                end,
                position = UDim2.fromScale(0.5, 0.5),
                size = UDim2.fromScale(1, 1),
                text = if not a1.exiting then "Return to Lobby" else "Returning...",
            }),
        }),
        Prompt = createElement(PromptModal, {
            description = "Are you sure you want to return to the lobby?",
            subject = "Leave Sandbox?",
            actions = {
                {
                    key = "returnToLobby",
                    text = "Return to Lobby",
                    color = u36,
                    onClick = function() -- Line: 59 -- upvalues: u5 (val), a1 (val)
                        u5(false)
                        a1.onExit()
                    end,
                },
                {
                    key = "cancel",
                    text = "Cancel",
                    color = Color3.fromRGB(39, 39, 39),
                    onClick = function() -- Line: 68 -- upvalues: u5 (val)
                        u5(false)
                    end,
                },
            },
            visible = v1,
        }),
    })
end