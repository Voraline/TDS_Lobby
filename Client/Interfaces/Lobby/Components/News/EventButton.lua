-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.EventButton
-- Decompile time: 2.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SocialService = game:GetService("SocialService")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local NewsButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.NewsButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEventRsvpStatus = require(Hooks.useEventRsvpStatus)
local createElement = React.createElement
local useBinding = React.useBinding
return React.memo(function(a1) -- Line: 29
    -- upvalues: useBinding (val), useEventRsvpStatus (val), createElement (val), NewsButton (val), RunService (val)
    -- upvalues: SocialService (val)
    local v1 = a1.Visible ~= false
    local v2, u10 = useBinding(useEventRsvpStatus(a1.eventId))
    return createElement(NewsButton, {
        LayoutOrder = a1.LayoutOrder,
        Size = a1.Size,
        AnchorPoint = a1.AnchorPoint,
        Position = a1.Position,
        Text = v2:map(function(a1) -- Line: 39
            if a1 == Enum.RsvpStatus.Going then
                return "NOTIFIED"
            end
            return "NOTIFY ME"
        end),
        Visible = v1,
        Clicked = function() -- Line: 43 -- upvalues: RunService (upval), SocialService (upval), a1 (val), u10 (val)
            if not RunService:IsRunning()
                or (SocialService:GetEventRsvpStatusAsync(a1.eventId)) == Enum.RsvpStatus.Going then
                return
            end
            u10((SocialService:PromptRsvpToEventAsync(a1.eventId)))
        end,
    }, a1.children)
end)