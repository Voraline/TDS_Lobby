-- Script path: ReplicatedStorage.Shared.Modules.CrateData
-- Decompile time: 0.37 ms

local Name, v1
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local v2 = {}
for k, v in pairs(Content("Crate"):GetChildren()) do
    Name = v.Name
    v1 = Asset("NewCrates", Name)
    if v1 then
        v1.Backup = table.freeze(table.deepClone(v1))
        v1.Name = Name
        v2[Name] = v1
    end
end
return v2