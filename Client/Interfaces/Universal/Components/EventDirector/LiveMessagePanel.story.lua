-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.LiveMessagePanel.story
-- Decompile time: 0.81 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local LiveMessagePanel = require(script.Parent.LiveMessagePanel)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)
local Theme = require(script.Parent.Theme)
return {
    react = React,
    reactRoblox = ReactRoblox,
    controls = {smallScreen = false, pending = false, unavailable = false, studio = false},
    story = function(a1) -- Line: 9 -- upvalues: React (val), Controls (val), LiveMessagePanel (val), Theme (val)
        local v1, u5 = React.useState("Preview only. Sending never broadcasts from this story.")
        return React.createElement(Controls.Scroll, {
            size = UDim2.fromOffset(if not a1.controls.smallScreen then 390 else 320, 460),
        }, {
            Panel = React.createElement(LiveMessagePanel, {
                initialOpen = true,
                busy = a1.controls.pending,
                canSend = not a1.controls.unavailable,
                canBroadcast = not a1.controls.studio,
                onSend = function(a1) -- Line: 20 -- upvalues: u5 (val)
                    u5("Preview received: " .. a1)
                end,
            }),
            Result = React.createElement(Controls.Text, {order = 2, text = v1, color = Theme.muted}),
        })
    end,
}