-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowerLoadouts
-- Decompile time: 0.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local useCache = require(Hooks.useCache)
local useNetworkCall = require(Hooks.useNetworkCall)
local useCallback = React.useCallback

local function withErrorNotification(...) -- Line: 24 -- upvalues: Notification (val)
    local v1, v2 = ...
    if not v1 then
        Notification.Create({
            Text = v2 or "Error occurred while updating loadout.",
            Color = Color3.fromRGB(255, 0, 0),
        })
    end
end

return function() -- Line: 34 -- upvalues: useCache (val), useNetworkCall (val), useCallback (val), withErrorNotification (val)
    local v1 = useCache("Equipped.Loadouts", {})
    local u7 = useNetworkCall("Inventory", true)
    return v1, {
        update = useCallback(function(a1) -- Line: 38 -- upvalues: withErrorNotification (upval), u7 (val) -- types: a1: number
            withErrorNotification(u7("Loadout", "save", a1))
        end, {}),
        rename = useCallback(function(a1, a2) -- Line: 42 -- upvalues: withErrorNotification (upval), u7 (val) -- types: a1: number, a2: string
            withErrorNotification(u7("Loadout", "rename", a1, a2))
        end, {}),
        override = useCallback(function(a1) -- Line: 46 -- upvalues: withErrorNotification (upval), u7 (val) -- types: a1: number
            withErrorNotification(u7("Loadout", "override", a1))
        end, {}),
    }
end