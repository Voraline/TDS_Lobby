-- Script path: ReplicatedStorage.Shared.Modules.Asset.Handlers.NewTotems
-- Decompile time: 0.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local ContentAssets = require(ReplicatedStorage.Shared.Modules.ContentAssets)
local Totem = Content("Totem")
local Totems = ContentAssets("Totems")
local u21 = {}
return function(a1) -- Line: 17 -- upvalues: u21 (val), Totem (val), Totems (val) -- types: a1: string
    local v1 = u21[a1]
    if v1 then
        return v1
    end
    local v2 = require(Totem:WaitForChild(a1))
    v2.Model = Totems:WaitForChild(a1)
    u21[a1] = v2
    return v2
end