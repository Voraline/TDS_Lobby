-- Script path: ReplicatedStorage.Client.Controllers.Shared.ABController
-- Decompile time: 2.91 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u25 = {}
local u29 = RunService:IsStudio() and false
local AB = Network.Channel("AB")
local u33 = {}
local u35 = Signal.new()

local function setState(a1) -- Line: 17 -- upvalues: u33 (ref), u35 (val) -- types: a1: table
    local v1 = {}
    for i, j in a1 do
        v1[j] = true
    end
    u33 = v1
    u35:Fire()
end

AB:On("update", function(a1) -- Line: 27 -- upvalues: u33 (ref), u35 (val), u29 (val)
    local v1 = {}
    for i, j in a1 do
        v1[j] = true
    end
    u33 = v1
    u35:Fire()
    if u29 then
        print("experiments updated:", table.concat(a1, ", "))
    end
end)
AB:FireServer("init")

function u25.get(a1) -- Line: 39 -- upvalues: u33 (ref) -- types: a1: string
    return u33[a1] or false
end

function u25.subscribe(a1, a2) -- Line: 43 -- upvalues: u25 (val), u35 (val) -- types: a1: string, a2: function
    local u5 = u25.get(a1)
    local u10 = u35:Connect(function() -- Line: 46 -- upvalues: u25 (upval), a1 (val), u5 (ref), a2 (val)
        local v1 = u25.get(a1)
        if v1 ~= u5 then
            task.spawn(a2, v1)
            u5 = v1
        end
    end)
    return function() -- Line: 54 -- upvalues: u10 (val)
        u10:Disconnect()
    end
end

function u25.binding(a1) -- Line: 59 -- upvalues: React (val), u25 (val) -- types: a1: string
    local v1, v2 = React.useBinding(u25.get(a1))
    return v1, (u25.subscribe(a1, v2))
end

return u25