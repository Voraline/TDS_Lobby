-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Preview
-- Decompile time: 2.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
local u38 = {}
u38.__index = u38

function u38.new(a1) -- Line: 14 -- upvalues: u38 (val), Maid (val), Create (val)
    local v1 = {Viewport = a1}
    local v2 = setmetatable(v1, u38)
    v2.Connections = Maid.new()
    v2.WorldModel = a1:FindFirstChild("WorldModel")
    local v3 = {}
    local WorldModel = v2.WorldModel or v2.Viewport
    v3.Parent = WorldModel
    v2.Camera = Create("Camera", v3)
    v2.Viewport.CurrentCamera = v2.Camera
    return v2
end

function u38.Start(a1, a2, a3) -- Line: 32 -- upvalues: Render (val)
    a1:Stop()
    a1.Target = a2:Clone()
    local Target = a1.Target
    local WorldModel = a1.WorldModel or a1.Viewport
    Target.Parent = WorldModel
    a1.Connections:Mark(a1.Target)
    local Initialize = a3.Initialize
    local Update = a3.Update
    if Initialize then
        Initialize(a1)
    end
    if Update then
        a1.Connection = Render:Add(nil, nil, function(a1_2) -- Line: 48 -- upvalues: a1 (val), Update (val)
            a1.Delta = a1_2
            Update(a1)
        end)
    end
    return a1
end

function u38:Stop() -- Line: 58 -- upvalues: Render (val)
    if self.Connection then
        Render:Remove(self.Connection)
    end
    return self.Connections:Sweep() and self
end

return u38