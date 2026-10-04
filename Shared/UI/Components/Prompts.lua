-- Script path: ReplicatedStorage.Shared.UI.Components.Prompts
-- Decompile time: 0.74 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
ReplicatedStorage:WaitForChild("Client")
if RunService:IsRunning() then
    require(ReplicatedStorage.Shared.Modules.Utils.table)
    require(ReplicatedStorage.Shared.Modules.Utils.math)
    return (require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Prompts))
end

local function u36() end

local v1 = {
    __index = function(a1, a2) -- Line: 17 -- upvalues: u36 (val)
        return u36
    end,
    __call = function() end,
}
local u42 = setmetatable({}, v1)
return (setmetatable({}, {
    __index = function(a1, a2) -- Line: 25 -- upvalues: u42 (val)
        return u42
    end,
}))