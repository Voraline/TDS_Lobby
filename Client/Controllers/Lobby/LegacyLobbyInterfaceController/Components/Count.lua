-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Components.Count
-- Decompile time: 1.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u32 = {Default = 86400, Functions = {}}

function u32:Add(a2) -- Line: 15 -- upvalues: table (val)
    table.insert(self.Functions, a2)
end

function u32.Refresh(a1) -- Line: 19 -- upvalues: Cache (val), u32 (val)
    (Cache("Login"):Get()):andThen(function(a1_2) -- Line: 22 -- upvalues: a1 (val), u32 (upval)
        local Time = a1_2.Time
        if Time then
            a1.Time = Time
            u32.Default = u32.Default + a1.Time
        end
    end)
end

function u32.Update() -- Line: 32 -- upvalues: u32 (val), RunService (val)
    local result, success
    local v1 = os.time()
    for k, v in pairs(u32.Functions) do
        success, result = pcall(v, v1)
        if not success and RunService:IsStudio() then
            warn(result)
        end
    end
end

Render:Add("Count", Enum.RenderPriority.Last, u32.Update)
return u32