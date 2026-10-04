-- Script path: ReplicatedStorage.Client.Interfaces.Game.Views.RadioInput
-- Decompile time: 2.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Radio = require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio)
local React = require(ReplicatedStorage.Shared.UI.React)
local useNetworkCall = require(Hooks.useNetworkCall)
local useNetworkEvent = require(Hooks.useNetworkEvent)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local createElement = React.createElement
local useState = React.useState
local u37 = React.memo(function() -- Line: 15
    -- upvalues: useState (val), useSound (val), useNetworkEvent (val), useNetworkCall (val), createElement (val)
    -- upvalues: Radio (val)
    local v1, u3 = useState(false)
    local v2, u7 = useState(nil)
    local u10, u11 = useState(true)
    local u14 = useSound("Radio Correct")
    local u17 = useSound("Radio Incorrect")

    local function u18() -- Line: 23 -- upvalues: u7 (val), u3 (val)
        u7(UDim2.fromScale(0.5, 1.5))
        task.delay(0.5, function() -- Line: 25 -- upvalues: u3 (upval)
            u3(false)
        end)
    end

    useNetworkEvent("Outpost32Map", "PromptRadio", function() -- Line: 30 -- upvalues: u3 (val)
        u3(true)
    end)
    local Outpost32Map = useNetworkCall("Outpost32Map")
    if not v1 then
        return nil
    end
    return createElement(Radio, {
        Position = v2,
        onClose = function() -- Line: 43 -- upvalues: u7 (val), u3 (val), Outpost32Map (val)
            u7(UDim2.fromScale(0.5, 1.5))
            task.delay(0.5, function() -- Line: 25 -- upvalues: u3 (upval)
                u3(false)
            end)
            Outpost32Map("CloseRadio")
        end,
        onSend = function(a1, a2, a3) -- Line: 47 -- upvalues: u10 (val), u17 (val), Outpost32Map (val), u11 (val), u14 (val), u18 (val)
            if not u10 then
                return
            end
            local v1 = (a1:gsub("%s+", "")):gsub("%W", ""):lower()
            if v1 == "" or v1 ~= "operationice" then
                u17()
                a2()
                return
            end
            Outpost32Map("RadioPassword", a1)
            a3()
            u11(false)
            u14()
            task.delay(2.9, u18)
        end,
    })
end)
return function(a1) -- Line: 74 -- upvalues: createElement (val), u37 (val)
    if workspace.Type.Value ~= "Game" then
        return nil
    end
    return createElement(u37)
end