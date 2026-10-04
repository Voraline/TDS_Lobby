-- Script path: ReplicatedStorage.Shared.UI.Network
-- Decompile time: 0.45 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage:WaitForChild("Shared")
if RunService:IsRunning() then
    return require(Shared.Modules.Network)
end
local v1 = {}
local u22 = {}

local function u23() end

v1.Emit = u23

function v1.Channel(a1) -- Line: 17 -- upvalues: u22 (val), u23 (val)
    local v1 = u22[a1]
    if not v1 then
        local v2 = {Channel = a1}
        local v3 = {
            __index = function() -- Line: 21 -- upvalues: u23 (upval)
                return u23
            end,
        }
        u22[a1] = (setmetatable(v2, v3))
    end
    return v1
end

return v1