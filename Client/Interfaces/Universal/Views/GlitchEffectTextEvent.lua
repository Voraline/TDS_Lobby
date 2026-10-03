-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.GlitchEffectTextEvent
-- Decompile time: 2.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local GlitchEventText = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.GlitchEventText)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local u38 = {
    EVENT_START = {
        id = 130156920409383,
        timeStamps = {
            {time = 0.111, text = "Paradise was created to imprison growth."},
            {time = 4.5, text = "Only a coward would snuff out something greater before it could grow."},
            {time = 10.846, text = "Let him hide behind the roots of his creation."},
            {time = 15, text = "Soon, I will be there to tear them out with my own hands."},
        },
    },
    EVENT_END = {
        id = 135450983437404,
        timeStamps = {
            {time = 0, text = "Do not fear the inevitability of death."},
            {time = 3.923, text = "Fear the moment I stand before the gate,"},
            {time = 7.385, text = "prepared to destroy what you struggled so desperately to preserve."},
            {time = 12.981, text = "Every decision led to this,"},
            {time = 15.692, text = "and watching you realize you failed from the start"},
            {time = 19.01, text = "will be better than any victory."},
        },
    },
}

local function render(a1) -- Line: 41 -- upvalues: createElement (val), GlitchEventText (val)
    return a1.enabled and createElement(GlitchEventText, {text = a1.text})
end

return function(a1) -- Line: 47
    -- upvalues: React (val), GameState (val), u38 (val), EasySound (val), RunService (val), GameType (val)
    -- upvalues: ReplicatedStorage (val), createElement (val), render (val)
    a1.setDisplayOrder(99999999)
    a1.setIgnoreGuiInset(true)
    local u10, u11 = React.useState(false)
    local v1, u16 = React.useState("")
    local v2 = u10 ~= false
    React.useEffect(function() -- Line: 56 -- upvalues: GameState (upval), u11 (val)
        local u9 = (GameState.Replicator:GetStateChangedSignal("TextGlitchEffectEvent")):Connect(function() -- Line: 59 -- upvalues: GameState (upval), u11 (upval)
            local v1 = GameState.Replicator:Get("TextGlitchEffectEvent")
            u11(v1)
        end)
        return function() -- Line: 64 -- upvalues: u9 (val)
            u9:Disconnect()
        end
    end, {})
    local v3 = {v2}
    React.useEffect(function() -- Line: 69
        -- upvalues: u38 (upval), u10 (val), EasySound (upval), RunService (upval), u16 (val), GameType (upval)
        -- upvalues: ReplicatedStorage (upval)
        local u2 = u38[u10]
        if not u2 then
            return
        end
        local u7 = EasySound.Create({volume = 0.5, id = u2.id})
        u7:Play()
        local u16_2 = RunService.Heartbeat:Connect(function() -- Line: 83 -- upvalues: u7 (val), u2 (val), u16 (upval)
            for i, j in u2.timeStamps do
                if j.time <= u7.TimePosition then
                    u16(j.text)
                end
            end
        end)
        u7.Ended:Once(function() -- Line: 92 -- upvalues: u16_2 (val), u16 (upval), GameType (upval), ReplicatedStorage (upval)
            u16_2:Disconnect()
            u16("")
            if GameType:IsA("Lobby") then
                task.spawn((require(ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController)).OnSequenceComplete)
            end
        end)
        return function() -- Line: 104 -- upvalues: u16_2 (val)
            u16_2:Disconnect()
        end
    end, v3)
    return createElement(render, {enabled = v2, text = v1})
end