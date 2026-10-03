-- Script path: ReplicatedStorage.Shared.Modules.NewThread
-- Decompile time: 0.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    Run = function(a1, a2, a3) -- Line: 16
        -- upvalues: TypedPromise (val), RunService (val), GameState (val)
        return TypedPromise.new(function(a1, a2_2, a3_2) -- Line: 17 -- upvalues: RunService (upval), GameState (upval), a2 (val), a3 (val)
            local u3 = nil
            a3_2(function() -- Line: 20 -- upvalues: u3 (ref)
                if u3 then
                    u3:Disconnect()
                    u3 = nil
                end
            end)
            local u8 = 0
            local v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 30 -- upvalues: u8 (ref), GameState (upval), a2 (upval), u3 (ref), a1 (val), a3 (upval)
                u8 = u8 + a1_2 * GameState.TimeScale
                if not (a2 <= u8) then
                    a3()
                    return
                end
                if u3 then
                    u3:Disconnect()
                    u3 = nil
                end
                a1()
            end)
        end)
    end,
}