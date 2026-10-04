-- Script path: ReplicatedStorage.Content.Unit.KingpinBodyGuard.Animator
-- Decompile time: 2.18 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local u17 = TweenInfo.new(0.3)
local v1 = {}
v1.__index = v1

local function resolveWeaponConfig(a1) -- Line: 11 -- types: a1: userdata
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    local Gun = Weapon:FindFirstChild("Gun")
    if not Gun then
        return
    end
    return Gun:FindFirstChildOfClass("Configuration")
end

local function resolveAttachment(a1, a2) -- Line: 25 -- types: a1: userdata, a2: string
    local v1
    local Weapon = a1:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if not v1 then
        return
    end
    local Attachments = v1:FindFirstChild("Attachments")
    if not Attachments then
        return
    end
    local v2 = Attachments:FindFirstChild(a2)
    if not v2 then
        return
    end
    return v2.Value
end

function v1.Initialize(a1) -- Line: 44
    a1._animations = {}
    a1:_setupAnimations()
    a1:_playTrack("Idle", Enum.AnimationPriority.Idle)
    a1:Thread(function() -- Line: 50 -- upvalues: a1 (val)
        if not a1:IsAlive() then
            return
        end
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireAt(v1)
        end
    end)
    a1.Executables = {
        Death = function() -- Line: 63 -- upvalues: a1 (val)
            a1:_playTrack("Death", Enum.AnimationPriority.Action2)
        end,
    }
end

function v1:_setupAnimations() -- Line: 69 -- upvalues: Animation (val)
    local Animations = self.Model:WaitForChild("Animations")
    local AnimationController = self.Model:WaitForChild("AnimationController")
    for i, j in Animations:GetChildren() do
        if j:IsA("Animation") then
            self._animations[j.Name] = (Animation.new({
                IsPersistent = true,
                Track = j,
                Target = AnimationController,
                Entity = {TimeScaled = true},
            }))
        end
    end
end

function v1:_playTrack(a2, a3) -- Line: 87 -- types: self: table, a2: string
    local v1 = self._animations[a2]
    if not v1 then
        return nil
    end
    local v2 = v1:Play()
    if a3 then
        v2.Priority = a3
    end
    return v2
end

function v1:_fireAt(a2) -- Line: 101 -- upvalues: u17 (val), EmitterManager (val) -- types: self: table, a2: userdata
    local Value, v1
    if not self:IsAlive() then
        return
    end
    local Position = a2:GetPivot().Position
    self:Face(Position, u17)
    self:_playTrack("Fire", Enum.AnimationPriority.Action)
    local Weapon = self.Model:FindFirstChild("Weapon")
    if Weapon then
        local Gun = Weapon:FindFirstChild("Gun")
        v1 = if Gun then Gun:FindFirstChildOfClass("Configuration") else nil
    else
        v1 = nil
    end
    if v1 then
        local Attachments = v1:FindFirstChild("Attachments")
        if Attachments then
            local Start = Attachments:FindFirstChild("Start")
            Value = if Start then Start.Value else nil
        else
            Value = nil
        end
    else
        Value = nil
    end
    if Value then
        self:Bullet({
            Spread = 50,
            Speed = 140,
            Start = Value.WorldPosition,
            End = Position,
            Color = self.Model:GetAttribute("BulletColor"),
        })
        EmitterManager.manualEmit(Value)
    end
    self:Wait((self.Replicator:Get("Cooldown")))
end

return v1