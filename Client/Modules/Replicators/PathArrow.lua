-- Script path: ReplicatedStorage.Client.Modules.Replicators.PathArrow
-- Decompile time: 5.03 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local u15 = {}
u15.__index = u15
local u20 = CFrame.Angles(0, 3.141592653589793, 0)
local u25 = Color3.fromRGB(103, 248, 125)
local u30 = Color3.fromRGB(248, 103, 103)
require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local PathArrow = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Client")):WaitForChild("PathArrow")
local Folder = Instance.new("Folder")
Folder.Name = "PathArrows"
Folder.Parent = workspace
local u77 = 0
local u78 = false
local u79 = {}

function u15.new(a1, a2, a3) -- Line: 45
    -- upvalues: u15 (val), Maid (val), PathArrow (val), Folder (val), TweenService (val), u79 (val)
    if workspace:GetAttribute("ArrowsDisabled") then
        return
    end
    local u11 = setmetatable({}, u15)
    u11.Team = a1
    u11.Maid = Maid.new()
    u11.Model = PathArrow:Clone()
    u11.ArrowPart = u11.Model.PrimaryPart
    u11.ArrowPart.CFrame = CFrame.new(0, 9999999, 0)
    u11.Model.PrimaryPart.Transparency = 1
    u11.Model.Parent = Folder
    TweenService:Create(u11.ArrowPart, TweenInfo.new(0.25), {Transparency = 0}):Play()
    u11.Path = a2
    u11.PathDistance = a3
    u11.LastPathDistance = u11.PathDistance
    u11.Lifetime = 0.8
    u11.Maid:Mark(function() -- Line: 68 -- upvalues: u79 (upval), u11 (val), TweenService (upval)
        u79[u11] = nil
        task.spawn(function() -- Line: 71 -- upvalues: TweenService (upval), u11 (upval)
            local v1 = TweenService:Create(u11.ArrowPart, TweenInfo.new(0.25), {Transparency = 1})
            v1:Play()
            v1.Completed:Wait()
            u11.Model:Destroy()
        end)
    end)
    u79[u11] = u11
    return u11
end

function u15:Step(a2) -- Line: 84 -- upvalues: u25 (val), u30 (val), u20 (val)
    local PathDistance_2 = self.Path.PathDistance
    self.Lifetime = self.Lifetime - a2
    if PathDistance_2 <= self.PathDistance then
        self:Destroy()
        return CFrame.identity
    end
    self.PathDistance = self.PathDistance + a2 * 16
    if 0.8 <= self.PathDistance / PathDistance_2 then
        self.ArrowPart.Transparency = (self.PathDistance / PathDistance_2 - 0.8) / (PathDistance_2 - 0.8)
    end
    local Scalar = self.Path:GetScalar(self.PathDistance)
    self.ArrowPart.Color = u25:Lerp(u30, self.PathDistance / PathDistance_2)
    if self.LastPosition and self.LastPathDistance < self.PathDistance and self.LastPosition ~= Scalar then
        local v1 = CFrame.lookAt(self.LastPosition, Scalar)
        if not self.Rotation then
            self.Rotation = v1 - v1.Position
        else
            self.Rotation = self.Rotation:Lerp(v1 - v1.Position, a2 * 16)
        end
    end
    self.LastPosition = Scalar
    local v2 = CFrame.new(Scalar)
    local Rotation_2 = self.Rotation or CFrame.identity
    return v2 * Rotation_2 * u20
end

function u15:Destroy() -- Line: 132
    if self.Maid then
        self.Maid:Sweep()
        self.Maid = nil
    end
end

task.spawn(function() -- Line: 139
    -- upvalues: GameState (val), u78 (ref), u15 (val), Scheduler (val), RunService (val), u77 (ref), u79 (val)
    (GameState.GetState()):andThen(function(a1) -- Line: 140
        -- upvalues: u78 (upval), u15 (upval), Scheduler (upval), RunService (upval), GameState (upval), u77 (upval)
        -- upvalues: u79 (upval)
        if a1.GameStarted then
            return
        end
        u78 = true
        u15.RunConnection = Scheduler.add("PathArrowReplicator", RunService.Heartbeat, function(a1) -- Line: 150 -- upvalues: GameState (upval), u77 (upval), u15 (upval)
            if GameState.HideArrows then
                return
            end
            local v1 = tick() - u77
            if 1 / GameState.TimeScale < v1 then
                u77 = tick()
                for k, v in pairs(GameState.Paths) do
                    for k2, i in pairs(v) do
                        if tonumber(k2) then
                            task.spawn(function() -- Line: 164 -- upvalues: u15 (upval), k (val), i (val)
                                u15.new(k, i, -0)
                                u15.new(k, i, -0.9)
                                u15.new(k, i, -1.8)
                            end)
                        end
                    end
                end
            end
        end)
        ;(a1:GetStateChangedSignal("GameStarted")):Connect(function(a1) -- Line: 175 -- upvalues: u78 (upval), u15 (upval)
            if a1 then
                u78 = false
                u15.Stop()
            end
        end)
        ;(a1:GetStateChangedSignal("HideArrows")):Connect(function(a1) -- Line: 182 -- upvalues: u79 (upval)
            if a1 then
                for k, v in pairs(u79) do
                    v:Destroy()
                end
            end
        end)
    end)
end)
Scheduler.add("PathArrowStep", RunService.Heartbeat, function(a1) -- Line: 192 -- upvalues: GameState (val), u79 (val)
    local ArrowPart, v1, v2
    local v3 = a1 * GameState.TimeScale
    local v4 = {}
    local v5 = {}
    debug.profilebegin("UpdateArrows")
    for k, v in pairs(u79) do
        ArrowPart = v.ArrowPart
        v2 = v:Step(v3)
        v1 = #v4 + 1
        v4[v1] = ArrowPart
        v5[v1] = v2
    end
    debug.profileend()
    workspace:BulkMoveTo(v4, v5, Enum.BulkMoveMode.FireCFrameChanged)
end)

function u15.Stop() -- Line: 213 -- upvalues: u79 (val), u15 (val)
    for k, v in pairs(u79) do
        v:Destroy()
    end
    if u15.RunConnection then
        u15.RunConnection()
        u15.RunConnection = nil
    end
end

;(Network.Channel("PathArrow")):On("Spawn", function() -- Line: 223 -- upvalues: u78 (ref), GameState (val), u15 (val)
    if u78 then
        return
    end
    local v1 = nil
    local v2 = nil
    for i, j in GameState.Paths, v1, v2 do
        for k, n in j do
            if tonumber(k) then
                task.spawn(function() -- Line: 235 -- upvalues: u15 (upval), i (val), n (val)
                    u15.new(i, n, -0)
                    u15.new(i, n, -0.9)
                    u15.new(i, n, -1.8)
                end)
            end
        end
    end
end)
;(Network.Channel("PathArrow")):On("Clear", function() -- Line: 244 -- upvalues: u15 (val)
    u15.Stop()
end)
return u15