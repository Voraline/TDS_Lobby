-- Script path: ReplicatedStorage.Client.Controllers.Lobby.LegacyLobbyInterfaceController.Count
-- Decompile time: 0.88 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Cache = require(ReplicatedStorage.Client.Modules.Cache)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u26 = {Default = 86400, Functions = {}}

function u26:Add(a2) -- Line: 14 -- upvalues: table (val)
    table.insert(self.Functions, a2)
end

function u26.Refresh(a1) -- Line: 18 -- upvalues: Cache (val), u26 (val)
    (Cache("Login"):Get()):andThen(function(a1_2) -- Line: 21 -- upvalues: a1 (val), u26 (upval)
        local Time = a1_2.Time
        if Time then
            a1.Time = Time
            u26.Default = u26.Default + a1.Time
        end
    end)
end

function u26.Update() -- Line: 31 -- upvalues: u26 (val), RunService (val)
    local result, success
    local v1 = os.time()
    for k, v in pairs(u26.Functions) do
        success, result = pcall(v, v1)
        if not success and RunService:IsStudio() then
            warn(result)
        end
    end
end

Render:Add("Count", Enum.RenderPriority.Last, u26.Update)
return u26