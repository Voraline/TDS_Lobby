-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.EventDirector.LiveMessagePanel
-- Decompile time: 4.44 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controls = require(script.Parent.Controls)
local LiveMessage = require(ReplicatedStorage.Shared.Modules.LiveEvents.LiveMessage)
local React = require(ReplicatedStorage.Shared.UI.React)
local Theme = require(script.Parent.Theme)
local createElement = React.createElement
return function(a1) -- Line: 18
    -- upvalues: React (val), LiveMessage (val), createElement (val), Controls (val), Theme (val)
    local u8, u9 = React.useState(a1.initialOpen == true)
    local u13, v1 = React.useState("")
    local u18 = LiveMessage.validate(u13)
    local v2 = {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        AutomaticSize = Enum.AutomaticSize.Y,
        Size = UDim2.fromScale(1, 0),
    }
    local v3 = {
        Layout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    local Button = Controls.Button
    local v4 = {
        order = 1,
        text = if not u8 then "Send Live Message" else "Close live message",
        selected = u8,
        onActivated = function() -- Line: 36 -- upvalues: u9 (val), u8 (val)
            u9(not u8)
        end,
    }
    v3.Toggle = createElement(Button, v4)
    local v5 = u8 and createElement(Controls.Text, {
        order = 2,
        text = if a1.canSend then if not a1.canBroadcast then "Studio preview: only this server will see the message." else "Broadcasts to every lobby and every live-event match." else "Live messages are unavailable in this server.",
        color = Theme.muted,
    })
    v3.Audience = v5
    v5 = u8
    if v5 then
        local Input = Controls.Input
        v4 = {
            order = 3,
            label = ("Message (up to %* characters)"):format(LiveMessage.MaxLength),
            value = u13,
            error = if u13 == "" then nil else u18,
        }
        local busy = a1.busy or not a1.canSend
        v4.disabled = busy
        v4.onChanged = v1
        v5 = createElement(Input, v4)
    end
    v3.Message = v5
    v5 = u8
    if v5 then
        local Button_2 = Controls.Button
        v4 = {
            primary = true,
            order = 4,
            text = if not a1.busy then if not a1.canBroadcast then "Preview message" else "Send to lobbies and event matches" else "Sending...",
        }
        local busy_2 = a1.busy or not a1.canSend or u18 ~= nil
        v4.disabled = busy_2

        function v4.onActivated() -- Line: 66 -- upvalues: a1 (val), u18 (val), u13 (val)
            if not a1.busy and a1.canSend and not u18 then
                a1.onSend(u13)
            end
        end

        v5 = createElement(Button_2, v4)
    end
    v3.Send = v5
    return createElement("Frame", v2, v3)
end