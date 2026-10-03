-- Script path: ReplicatedStorage.Client.Modules.Replicators.SpotLightReplicator
-- Decompile time: 4.64 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local u20 = {}
local u21 = {}
u21.__index = u21

function u21.__tostring(a1) -- Line: 9
    return "SpotLight"
end

local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local SpotLight = Network.Channel("SpotLight")
local u56 = RaycastParams.new()
u56.FilterType = Enum.RaycastFilterType.Include

function u21.new(a1) -- Line: 26 -- upvalues: u20 (val), u21 (val), Maid (val), LocalPlayer (val)
    if u20[a1] then
        return u20[a1]
    end
    local u8 = setmetatable({}, u21)
    u8.Model = a1
    u8.Maid = Maid.new()
    u8.Replicate = u8.Model:WaitForChild("Replicate")
    u8.Interaction = (u8.Model:WaitForChild("Interact")):WaitForChild("Prompt")
    u8.Light = u8.Model:WaitForChild("Light")
    u8.MainLight = u8.Light:WaitForChild("MainPart")
    u8.EndLight = u8.MainLight:WaitForChild("A1")
    local Task = ((u8.Model:WaitForChild("Root")):WaitForChild("Counter")):WaitForChild("Task")
    u8.Progress = Task:WaitForChild("Progress")
    u8.ProgressText = Task:WaitForChild("TextLabel")
    u8.Owner = u8.Model:WaitForChild("Owner").Value
    u8.Model.Owner.Changed:Connect(function(a1) -- Line: 48 -- upvalues: u8 (val) -- types: a1: userdata
        u8.Owner = a1
        u8.Interaction.Enabled = a1 == nil
    end)
    u8.Power = u8.Model:WaitForChild("Power").Value
    u8.Model.Power.Changed:Connect(function(a1) -- Line: 54 -- upvalues: u8 (val) -- types: a1: number
        u8.Power = a1
        u8:Toggle(0 < u8.Power)
    end)
    u8.MaxPower = u8.Model.Power:GetAttribute("Max") or 0
    ;(u8.Model.Power:GetAttributeChangedSignal("Max")):Connect(function() -- Line: 60 -- upvalues: u8 (val)
        u8.MaxPower = u8.Model.Power:GetAttribute("Max") or 0
    end)
    u8:Toggle(0 < u8.Power)
    u8.Interaction.Triggered:Connect(function(a1) -- Line: 65 -- upvalues: LocalPlayer (upval), u8 (val)
        if a1 == LocalPlayer then
            u8:Refill()
        end
    end)
    if u20[u8.Model] then
        error("Error: SpotLight entity hs already been made!")
    end
    u20[u8.Model] = u8
    u8.Maid:Mark(function() -- Line: 77 -- upvalues: u20 (upval), u8 (val)
        u20[u8.Model] = nil
    end)
    return u8
end

function u21:Destroy() -- Line: 84
    if self.Maid then
        self.Destroyed = true
        self.Maid:Sweep()
        self.Maid = nil
    end
end

function u21.getEntityFromModel(a1) -- Line: 92 -- upvalues: u20 (val) -- types: a1: userdata
    return u20[a1]
end

function u21:ToggleSparks(a2) -- Line: 96 -- types: self: table, a2: boolean
    if self.LastSparksEnabled == a2 then
        return
    end
    self.LastSparksEnabled = a2
    for i, j in self.EndLight:GetChildren() do
        j.Enabled = a2
    end
end

function u21:Toggle(a2) -- Line: 108 -- types: self: table, a2: boolean
    if self.LastEnabled == a2 then
        return
    end
    self.LastEnabled = a2
    local v1, v2 = self, a2
    for i, j in self.Model:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("SpotLight") then
            j.Enabled = v2
        end
        if j:IsA("Beam") then
            j.FaceCamera = true
        end
    end
    local Neon = v1.Light:WaitForChild("Neon")
    local v3 = v2 and Color3.fromRGB(255, 255, 127) or Color3.fromRGB()
    Neon.Color = v3
    v1.Interaction.Enabled = not v2
    if not v2 then
        v1:ToggleSparks(false)
    end
end

function u21:Refill() -- Line: 134 -- upvalues: SpotLight (val)
    if self.Owner ~= nil then
        return
    end
    SpotLight:FireServer("Refill", self.Model)
end

function u21:Step(a2) -- Line: 142
    -- upvalues: LocalPlayer (val), Mouse (val), u56 (val)
    if self.Destroyed then
        return
    end
    local Replicate = self.Replicate
    local MainLight = self.MainLight
    if self.Owner == LocalPlayer then
        local Rotation = (CFrame.lookAt(MainLight.Position, Mouse.Hit.Position)).Rotation
        local CFrame_2 = Replicate.CFrame
        local v1 = CFrame.new(Replicate.Position) * Rotation
        self.Replicate.CFrame = CFrame_2:Lerp(v1, a2 * 60 * 0.2)
    end
    local v2 = math.round((math.clamp(self.Power / self.MaxPower, 0, 1)) * 100) / 100
    local v3 = math.clamp(v2, 0, 1) - 0.5
    self.Progress.UIGradient.Offset = Vector2.new(v3, 0)
    self.ProgressText.Text = ("BATTERY LEFT (%*%%)"):format((math.round(v2 * 100)))
    local Rotation_2 = self.Replicate.CFrame.Rotation
    local v4 = CFrame.new(MainLight.Position) * Rotation_2 * CFrame.Angles(0, -1.5707963267948966, -1.5707963267948966)
    MainLight.CFrame = v4
    if not (0 < self.Power) then
        return
    end
    if not self._cachedFilter or self._cachedFilter[1] == nil or self._cachedFilter[2] == nil then
        self._cachedFilter = {workspace:FindFirstChild("Map"), (workspace:FindFirstChild("Ground"))}
    end
    u56.FilterDescendantsInstances = self._cachedFilter
    local v5 = workspace:Raycast(v4.Position, Rotation_2.LookVector * 100, u56)
    local Normal = v5 and v5.Normal or Vector3.new(0, 1, 0)
    local Position_4 = (v4 * (CFrame.new(0, -(v5 and (v4.Position - v5.Position).Magnitude or 100), 0))).Position
    self.EndLight.WorldCFrame = (CFrame.new(Position_4)) * CFrame.lookAt(Vector3.new(0, 0, 0), Normal).Rotation * CFrame.Angles(-1.5707963267948966, 0, 0)
    self:ToggleSparks(v5 ~= nil)
end

Scheduler.add("SpotLightReplicator", RunService.Heartbeat, function(a1) -- Line: 205 -- upvalues: u20 (val) -- types: a1: number
    for i, j in u20 do
        j:Step(a1)
    end
end)
local v1 = {Workspace}
TagObserver("SpotLight", function(a1) -- Line: 211 -- upvalues: u21 (val) -- types: a1: userdata
    local u4 = u21.new(a1)
    return function() -- Line: 214 -- upvalues: u4 (val)
        u4:Destroy()
    end
end, v1)
return u21