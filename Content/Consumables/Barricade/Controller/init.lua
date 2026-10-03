-- Script path: ReplicatedStorage.Content.Consumables.Barricade.Controller
-- Decompile time: 2.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local BarricadeClass = require(script.BarricadeClass)
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local PlayerService = require(ServerStorage.Server.Services.Shared.PlayerService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u35 = {}
local u36 = 0
local u37 = nil

local function stepBarricades() -- Line: 17 -- upvalues: u35 (val)
    for k, v in pairs(u35) do
        v:step()
    end
end

local function addBarricade(a1) -- Line: 23
    -- upvalues: u36 (ref), u35 (val), u37 (ref), TypedPromise (val), TimescaleUtilities (val)
    u36 = u36 + 1
    u35[a1] = a1
    if u37 == nil then
        u37 = TypedPromise.new(function(a1, a2, a3) -- Line: 28 -- upvalues: u37 (upval), u36 (upval), u35 (upval), TimescaleUtilities (upval)
            a3(function() -- Line: 29 -- upvalues: u37 (upval)
                u37 = nil
            end)
            while u36 > 0 do
                for k, v in pairs(u35) do
                    v:step()
                end
                TimescaleUtilities.Wait(0.1)
            end
            u37 = nil
            a1()
        end)
    end
end

local function removeBarricade(a1) -- Line: 44 -- upvalues: u36 (ref), u35 (val)
    a1:Destroy()
    u36 = u36 - 1
    u35[a1] = nil
end

return {
    CreateContext = function(a1) -- Line: 51
        a1.health = 300
        a1.maxHealth = 300
        a1.radius = 1.25
    end,
    OnUse = function(a1) -- Line: 57
        -- upvalues: TypedPromise (val), PlayerService (val), BarricadeClass (val), u36 (ref), u35 (val), u37 (ref)
        -- upvalues: TimescaleUtilities (val)
        local Context = a1.Context
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 60
            -- upvalues: PlayerService (upval), a1 (val), BarricadeClass (upval), Context (val), u36 (upval)
            -- upvalues: u35 (upval), u37 (upval), TypedPromise (upval), TimescaleUtilities (upval)
            local v1 = PlayerService.GetEntityFromPlayer(a1.Executor)
            local u20 = BarricadeClass.new(a1, {
                health = Context.health,
                maxHealth = Context.maxHealth,
                position = Context.position,
                radius = Context.radius,
                owner = v1,
            })
            u36 = u36 + 1
            u35[u20] = u20
            if u37 == nil then
                u37 = TypedPromise.new(function(a1, a2, a3) -- Line: 28 -- upvalues: u37 (upval), u36 (upval), u35 (upval), TimescaleUtilities (upval)
                    a3(function() -- Line: 29 -- upvalues: u37 (upval)
                        u37 = nil
                    end)
                    while u36 > 0 do
                        for k, v in pairs(u35) do
                            v:step()
                        end
                        TimescaleUtilities.Wait(0.1)
                    end
                    u37 = nil
                    a1()
                end)
            end
            u20.onDeath:Connect(function() -- Line: 70 -- upvalues: u20 (val), u36 (upval), u35 (upval), a1_2 (val)
                local v1 = u20
                v1:Destroy()
                u36 = u36 - 1
                u35[v1] = nil
                a1_2()
            end)
            a3(function() -- Line: 74 -- upvalues: u20 (val), u36 (upval), u35 (upval)
                local v1 = u20
                v1:Destroy()
                u36 = u36 - 1
                u35[v1] = nil
            end)
        end)
    end,
}