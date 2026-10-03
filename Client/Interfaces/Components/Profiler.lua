-- Script path: ReplicatedStorage.Client.Interfaces.Components.Profiler
-- Decompile time: 1.64 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local ProfilerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ProfilerStore)

local function abbreviateSeconds(a1) -- Line: 11 -- types: a1: number
    if a1 < 1e-06 then
        return ("%dns"):format(a1 * 1000000000)
    end
    if a1 < 0.001 then
        return ("%dus"):format(a1 * 1000000)
    end
    if a1 < 1 then
        return ("%dms"):format(a1 * 1000)
    end
    return ("%ds"):format(a1)
end

local function abbreviateMiliseconds(a1) -- Line: 24 -- types: a1: number
    if a1 < 0.001 then
        return ("%dns"):format(a1 * 1000000)
    end
    if a1 < 1 then
        return ("%dus"):format(a1 * 1000)
    end
    if a1 < 1000 then
        return ("%dms"):format(a1)
    end
    return ("%ds"):format(a1 / 1000)
end

if not _G.__PROFILE__ then
    return function(a1) -- Line: 38 -- upvalues: React (val)
        return React.createElement(React.Fragment, {}, a1.children or {})
    end
end
return function(a1) -- Line: 42 -- upvalues: createElement (val), ProfilerStore (val)
    local Id = a1.Id
    if not Id then
        return
    end
    return createElement(60114, {
        id = Id,
        onRender = function(a1, a2, a3, a4, a5, a6) -- Line: 50 -- upvalues: ProfilerStore (upval), Id (val)
            local v1 = a3
            local v2 = if v1 < 0.001 then ("%dns"):format(v1 * 1000000) else if v1 < 1 then ("%dus"):format(v1 * 1000) else if not (v1 < 1000) then ("%ds"):format(v1 / 1000) else ("%dms"):format(v1)
            v1 = a4
            local v3 = if v1 < 0.001 then ("%dns"):format(v1 * 1000000) else if v1 < 1 then ("%dus"):format(v1 * 1000) else if not (v1 < 1000) then ("%ds"):format(v1 / 1000) else ("%dms"):format(v1)
            v1 = a6 - a5
            local v4 = if v1 < 0.001 then ("%dns"):format(v1 * 1000000) else if v1 < 1 then ("%dus"):format(v1 * 1000) else if not (v1 < 1000) then ("%ds"):format(v1 / 1000) else ("%dms"):format(v1)
            ProfilerStore.update(Id, {a2, v2, v3, v4})
        end,
    }, a1.children or {})
end