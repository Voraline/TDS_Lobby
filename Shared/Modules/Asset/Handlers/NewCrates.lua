-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewCrates
-- Decompile time: 0.75 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local ContentAssets = require(ReplicatedStorage.Shared.Modules.ContentAssets)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Crates = ContentAssets("Crates")
local Crate = Content("Crate")
local u32 = {}
return function(a1) -- Line: 50 -- upvalues: u32 (val), Crates (val), Crate (val), table (val), Icons (val)
    local v1 = u32[a1]
    if v1 then
        return v1
    end
    local v2 = Crates:WaitForChild(a1)
    local v3 = require(Crate:WaitForChild(a1))
    local Model = v2:WaitForChild("Model")
    local VFX = v2:FindFirstChild("VFX")
    local v4 = table.merge({
        Model = Model,
        Animated = Model:FindFirstChild("AnimationController") ~= nil,
        VFX = VFX,
        Icon = Icons.Crates[a1],
    }, v3)
    v4.Preview.Icon = v4.Icon
    u32[a1] = v4
    return v4
end