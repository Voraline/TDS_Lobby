-- Script path: ReplicatedStorage.Content.Tower.Biologist.Animator
-- Decompile time: 2.99 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Biologist = ReplicatedStorage.Assets.Effects.Projectile.Biologist
local v1 = {}
v1.__index = v1

local function stepProjectile(a1) -- Line: 17
    local alpha = a1.alpha
    local elapsedTime = a1.elapsedTime
    local start = a1.start
    local goal = a1.goal
    local Magnitude = (start - goal).Magnitude
    local v1 = start:Lerp(goal, alpha)
    local v2 = alpha * 3.141592653589793
    local v3 = v1 + Vector3.new(0, 1, 0) * (math.sin(v2) * Magnitude / 2)
    local v4 = a1.originalRotation * CFrame.Angles(elapsedTime * 4, elapsedTime * 4, 0)
    return CFrame.new(v3) * v4
end

function v1.Initialize(a1) -- Line: 32
    -- upvalues: Biologist (val), TimescaleUtilities (val), CustomProjectile (val), stepProjectile (val)
    -- upvalues: EasySound (val), EmitterManager (val)
    local Name = a1.Model.Name
    local PrimaryPart = a1.Model.PrimaryPart
    local ROOT = PrimaryPart:WaitForChild("ROOT")
    a1._originalDirection = a1.Model.PrimaryPart.CFrame.LookVector
    a1.Executables = {
        Throw = function(a1_2, a2, a3, a4, a5) -- Line: 40
            -- upvalues: ROOT (val), Biologist (upval), Name (val), a1 (val), TimescaleUtilities (upval)
            -- upvalues: CustomProjectile (upval), stepProjectile (upval), PrimaryPart (val), EasySound (upval)
            -- upvalues: EmitterManager (upval)
            local u5 = a4 + a3
            local Start = ROOT["MCH_INT_SHOULDER_SOCKET.R"]["ARM.R"]["DEF_ARM.R"].Start
            local DEF_CANISTER_1 = ROOT["MCH_INT_SHOULDER_SOCKET.L"]["ARM.L"]["DEF_ARM.L"].DEF_CANISTER_1
            local u34 = (a5 and Biologist[("%*MaxCanister"):format(Name)] or Biologist[("%*BaseCanister"):format(Name)]):Clone()
            u34.Parent = workspace.CurrentCamera
            a1:Face(a2)
            local u48 = a1:Animate("Throw")
            u48:AdjustSpeed(1 / (a3 * 3.2 / u48.Length))
            a1.Model.PrimaryPart.Summon:Play()
            TimescaleUtilities.Delay(u5 / 2, function() -- Line: 64 -- upvalues: u48 (val), a1 (upval), u5 (val)
                u48:Stop()
                local v1 = a1:Animate("Fire")
                v1:AdjustSpeed(1 / (u5 / v1.Length))
            end)
            a1:Wait(a3)
            if not a1:IsAlive() then
                return
            end
            local WorldCFrame = DEF_CANISTER_1.WorldCFrame
            local v1 = CustomProjectile
            local Position = WorldCFrame.Position
            local PrimaryPart_2 = u34.PrimaryPart
            local v2 = stepProjectile
            local v3 = {originalRotation = WorldCFrame.Rotation}
            v1:ThrowProjectile(Position, a2, a4, PrimaryPart_2, v2, function() -- Line: 83
                -- upvalues: u34 (ref), a1 (upval), PrimaryPart (upval), EasySound (upval), a2 (val)
                -- upvalues: EmitterManager (upval), Start (val)
                u34:Destroy()
                if not a1:IsAlive() then
                    return
                end
                local SoundId = PrimaryPart.Shatter.SoundId
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    id = SoundId,
                    position = a2,
                    volume = PrimaryPart.Shatter.Volume,
                })
                EmitterManager.Emit("PlantGrow", CFrame.new(a2 - Vector3.new(0, 0.5, 0)))
                a1:_createBeam(Start.WorldPosition, a2)
            end, v3)
        end,
    }
end

function v1:_createBeam(a2, a3) -- Line: 110
    -- upvalues: Create (val), TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart
    local Magnitude = (a3 - a2).Magnitude
    local u12 = Create("Attachment", {Name = "BeamEnd", WorldPosition = a3, Parent = workspace.Terrain})
    local u16 = PrimaryPart.BeamStart:Clone()
    for i, j in u16:GetChildren() do
        if j:IsA("Beam") then
            j.Attachment1 = u12
            j.Enabled = true
        end
    end
    u16.WorldPosition = a2
    u16.Parent = workspace.Terrain
    local v1 = Magnitude / 15
    local v2 = TweenService:Create(u16, TweenInfo.new(v1), {WorldPosition = a3})
    v2:Play()
    v2.Completed:Once(function() -- Line: 135 -- upvalues: u16 (val), u12 (val)
        u16:Destroy()
        u12:Destroy()
    end)
end

return v1