-- Script path: ReplicatedStorage.Client.Controllers.Game.ClientMapController
-- Decompile time: 1.26 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
game:GetService("TweenService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local MapManager = require(ReplicatedStorage.Shared.Modules.MapManager)
local u32 = Maid.new()

local function refreshMap(a1) -- Line: 13 -- upvalues: u32 (val), Asset (val)
    u32:Sweep()
    local Attribute = workspace:GetAttribute("Map")
    local v1 = script:FindFirstChild(Attribute)
    if v1 then
        require(v1)(a1, u32)
        return
    end
    local v2 = Asset("NewMaps", Attribute)
    if v2 and v2.Animator then
        v2.Animator(a1, u32)
    end
end

local v1 = MapManager.GetLoadedMapRaw()
if v1 then
    refreshMap(v1)
end
MapManager.MapChanged:Connect(refreshMap)
return {}