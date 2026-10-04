-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useConsumableCooldown
-- Decompile time: 5.77 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Consumables = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Consumables)
require(ReplicatedStorage.Shared.Modules.GameState)
local React = require(ReplicatedStorage.Shared.UI.React)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local useReactBinding = require(script.Parent.useReactBinding)
local useEffect = React.useEffect
local LocalPlayer = Players.LocalPlayer
local u64 = nil
if workspace.Type.Value == "Game" then
    u64 = TagReplicator.getReplicatorEntityFromFolder(((ReplicatedStorage:WaitForChild("StateReplicators")):WaitForChild("ConsumableCooldownReplicator")))
end

local function stepEvent(a1, a2) -- Line: 24
    -- upvalues: RunService (val), ServerTicks (val)
    local u2 = nil
    u2 = (RunService.Heartbeat:Connect(function(a1_2) -- Line: 26 -- upvalues: a1 (val), ServerTicks (upval), u2 (ref), a2 (val)
        local v1 = a1 - ServerTicks.getTime()
        if v1 <= 0 then
            u2:Disconnect()
            return
        end
        a2(v1)
    end))
    return u2
end

return function(a1) -- Line: 40
    -- upvalues: useReactBinding (val), Consumables (val), useEffect (val), u64 (ref), LocalPlayer (val)
    -- upvalues: ServerTicks (val), RunService (val)
    local u3, u4 = useReactBinding(false)
    local v1, u8 = useReactBinding(0)
    local v2 = 1
    local u14 = nil
    if a1 and a1 ~= "" then
        u14 = Consumables(a1)
        v2 = u14.Cooldown or 1
    end
    local v3 = {a1}
    useEffect(function() -- Line: 52
        -- upvalues: u14 (ref), u64 (upval), u4 (val), u8 (val), a1 (val), LocalPlayer (upval), u3 (val)
        -- upvalues: ServerTicks (upval), RunService (upval)
        if u14 and u64 then
            local u7 = a1:gsub(" ", "")
            local State = u64.State
            local u11 = nil
            local u18 = u64.Changed:Connect(function(a1, a2) -- Line: 66
                -- upvalues: u7 (val), LocalPlayer (upval), u11 (ref), u4 (upval), u8 (upval), u3 (upval)
                -- upvalues: ServerTicks (upval), RunService (upval)
                local v1 = true
                if a1 ~= u7 then
                    v1 = a1 == ("%*_%*"):format(LocalPlayer.UserId, u7)
                end
                if not v1 then
                    return
                end
                if a2 == nil then
                    if u11 and u11.Connected then
                        u11:Disconnect()
                    end
                    u4(false)
                    u8(0)
                    return
                end
                if u3:getValue() ~= true then
                    u4(true)
                end
                if typeof(a2) ~= "number" then
                    u8(0)
                    return
                end
                u8(ServerTicks.getTime() - a2)
                if u11 and u11.Connected then
                    return
                end
                local u48 = u8
                local u49 = nil
                u49 = (RunService.Heartbeat:Connect(function(a1) -- Line: 26 -- upvalues: a2 (val), ServerTicks (upval), u49 (ref), u48 (val)
                    local v1 = a2 - ServerTicks.getTime()
                    if v1 <= 0 then
                        u49:Disconnect()
                        return
                    end
                    u48(v1)
                end))
                u11 = u49
            end)
            local v1 = State[u7] or State[("%*_%*"):format(LocalPlayer.UserId, u7)]
            u4(v1 ~= nil)
            if typeof(v1) ~= "number" then
                u8(0)
            else
                u8(ServerTicks.getTime() - v1)
            end
            return function() -- Line: 105 -- upvalues: u11 (ref), u18 (ref)
                if u11 and u11.Connected then
                    u11:Disconnect()
                end
                u18:Disconnect()
            end
        end
        u4(false)
        u8(0)
    end, v3)
    return {queued = u3, cooldown = v1, maxCooldown = v2}
end