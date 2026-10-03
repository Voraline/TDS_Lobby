-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSandboxWhitelist
-- Decompile time: 0.93 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SandboxWhitelistHandler = require(ReplicatedStorage.Shared.Data.SharedData.SandboxWhitelistHandler)
local useAtomBinding = require(script.Parent.useAtomBinding)
local useReactBindings = require(script.Parent.useReactBindings)
local React = require(ReplicatedStorage.Shared.UI.React)

local function convert(a1) -- Line: 10
    local v1 = {}
    for i, j in a1 do
        v1[j] = true
    end
    return v1
end

return function(a1) -- Line: 20
    -- upvalues: React (val), SandboxWhitelistHandler (val), useAtomBinding (val), useReactBindings (val)
    local u14
    local v1 = {a1}
    local u9 = useAtomBinding((React.useMemo(function() -- Line: 21 -- upvalues: SandboxWhitelistHandler (upval), a1 (val)
        return SandboxWhitelistHandler(a1)
    end, v1)))
    v1, u14 = React.useState(function() -- Line: 26 -- upvalues: u9 (val)
        local v1 = {}
        for i, j in (u9:getValue()) do
            v1[j] = true
        end
        return v1
    end)
    local v2 = {u9}
    useReactBindings(function(a1) -- Line: 30 -- upvalues: u14 (val)
        local v1 = {}
        for i, j in a1 do
            v1[j] = true
        end
        u14(v1)
    end, v2)
    return v1
end