-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.Crates
-- Decompile time: 0.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Crates = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Crates")
local u25 = {}
return function(a1) -- Line: 10 -- upvalues: u25 (val), Crates (val), table (val)
    local v1 = u25[a1]
    if not v1 then
        local v2 = Crates:WaitForChild(a1)
        local Model = v2:WaitForChild("Model")
        local Data = require(v2:WaitForChild("Data"))
        local Animation_2 = Instance.new("Animation")
        Animation_2.AnimationId = "rbxassetid://" .. tostring(Data.Animation)
        v1 = table.merge({Model = Model, Animation = Animation_2}, Data)
    end
    return v1
end