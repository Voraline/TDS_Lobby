-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useScale
-- Decompile time: 2.06 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local SettingsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SettingsStore)
local useCharmSelector = require(ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector)
local useViewportSize = require(ReplicatedStorage.Client.Interfaces.Hooks.useViewportSize)
local u39 = {
    [Enum.UIScale.Small] = 0.8,
    [Enum.UIScale.Default] = 1,
    [Enum.UIScale.Large] = 1.1,
    [Enum.UIScale.Huge] = 1.35,
}

local function getScaleFactor(a1, a2) -- Line: 19 -- types: a1: userdata, a2: number?
    return (a2 or 1) * math.min(a1.X, a1.Y) / 1157
end

return function(a1, a2, a3, a4, a5, a6) -- Line: 23
    -- upvalues: useViewportSize (val), React (val), RunService (val), useCharmSelector (val), SettingsStore (val)
    -- upvalues: Enum (val), u39 (val)
    local v1 = useViewportSize()
    local v2 = a6 and (a1 or 1) * math.min(v1.X, v1.Y) / 1157 or math.min(1, (a1 or 1) * (math.min(v1.X, v1.Y)) / 1157)
    if a4 then
        v2 = if v2 ~= 0 then 1 / v2 else 1
        v2 = math.max(1, v2)
    end
    local v3 = nil
    local v4 = a1
    if a5 then
        local v5, v6 = React.useBinding(if not a2 then v2 else UDim2.new(a2.X.Scale, a2.X.Offset * v2, a2.Y.Scale, a2.Y.Offset * v2))
        v4 = v5
        v3 = v6
    end
    if a3 ~= true then
        v2 = v2 * (if RunService:IsRunning() then useCharmSelector(SettingsStore.getState, function(a1) -- Line: 63 -- upvalues: Enum (upval), u39 (upval)
            local Default = a1.Game and a1.Game["UI Scale"] or Enum.UIScale.Default
            return u39[tostring(Default)] or 1
        end) else 1)
        if a5 then
            v3(if not a2 then v2 else UDim2.new(a2.X.Scale, a2.X.Offset * v2, a2.Y.Scale, a2.Y.Offset * v2))
        end
    end
    if a5 then
        return v4
    end
    if a2 then
        return UDim2.new(a2.X.Scale, a2.X.Offset * v2, a2.Y.Scale, a2.Y.Offset * v2)
    end
    return v2
end