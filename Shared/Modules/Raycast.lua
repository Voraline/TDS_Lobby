-- Script path: ReplicatedStorage.Shared.Modules.Raycast
-- Decompile time: 1.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local CurrentCamera = workspace.CurrentCamera
local u24 = {}
u24.All = workspace.FindPartOnRay
u24.Whitelist = workspace.FindPartOnRayWithWhitelist
u24.Blacklist = workspace.FindPartOnRayWithIgnoreList
local u31 = {}
u31.__index = u31

function u31.new(a1, a2) -- Line: 19 -- upvalues: u31 (val)
    return (setmetatable({Mode = a1 or "All", List = a2 or {}}, u31))
end

function u31:Cast(a2) -- Line: 26 -- upvalues: u24 (val)
    local v1, v2, v3, v4
    local v5 = u24[self.Mode]
    if v5 ~= u24.All then
        v2, v3, v4, v1 = v5(workspace, a2, self.List)
    else
        v2, v3, v4, v1 = v5(workspace, a2)
    end
    return {Hit = v2, Position = v3, Normal = v4, Material = v1}
end

function u31.CastMouse(a1, a2) -- Line: 44 -- upvalues: UserInputService (val), CurrentCamera (val)
    local MouseLocation = UserInputService:GetMouseLocation()
    local v1 = CurrentCamera:ViewportPointToRay(MouseLocation.X, MouseLocation.Y)
    return a1:Cast((Ray.new(v1.Origin, v1.Direction * (a2 or 500))))
end

function u31.Add(a1, a2) -- Line: 53 -- upvalues: table (val)
    table.insert(a1.List, a2)
end

function u31.Remove(a1, a2) -- Line: 57 -- upvalues: table (val)
    table.pull(a1.List, a2)
end

function u31.Clear(a1) -- Line: 61
    a1.List = {}
end

return u31