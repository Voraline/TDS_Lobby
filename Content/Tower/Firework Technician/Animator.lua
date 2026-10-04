-- Script path: ReplicatedStorage.Content.Tower.Firework Technician.Animator
-- Decompile time: 5.17 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

local function Rocket(a1, a2) -- Line: 14
    -- upvalues: ReplicatedStorage (val), GameState (val), EmitterManager (val), Debris (val)
    local FireworkRockets = ReplicatedStorage.Assets.Effects.Client.FireworkRockets
    local u7 = nil
    local u8 = 0
    local u22 = (FireworkRockets:GetChildren())[math.random(1, #FireworkRockets:GetChildren())]:Clone()
    u22.Parent = workspace
    local u30 = Random.new():NextNumber(0.2, 0.3)
    local u32 = CFrame.new()
    local v1 = (game:GetService("RunService")).RenderStepped:Connect(function(a1_2) -- Line: 26
        -- upvalues: u8 (ref), GameState (upval), u30 (val), u22 (val), EmitterManager (upval), a2 (val), Debris (upval)
        -- upvalues: u7 (ref), a1 (val), u32 (ref)
        local v1
        u8 = u8 + a1_2 * GameState.TimeScale / u30
        if u22 and u22.Parent and not (u8 >= 1) then
            v1 = CFrame.new(math.noise(u8 * u30) * 8, math.noise(u8 * u30) * 10, 0)
            local v2 = CFrame.new((a1:Lerp(a2, u8))) * v1
            u22:PivotTo((CFrame.new(v2.Position, v2.Position - (u32.Position - v2.Position).Unit * 2)) * (CFrame.Angles(-1.5707963267948966, 0, 0)))
            u32 = v2
            return
        end
        if u22 and u22.Parent then
            v1 = {"Red", "Yellow", "Blue"}
            EmitterManager.Emit(("%*Firework"):format(v1[(math.random(1, #v1))]), CFrame.new(a2), 2)
            for k, v in pairs(u22:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                end
            end
            Debris:AddItem(u22, 2)
        end
        u7:Disconnect()
    end)
end

function v1:_playAnimation(a2, a3) -- Line: 69 -- types: self: table, a2: string, a3: number
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1:_updateTransparency(a2) -- Line: 73 -- types: self: table, a2: number
    local v1
    local v2, v3 = self, a2
    for i, j in self.Model.Weapon:GetChildren() do
        v1 = math.clamp(tonumber((j.Name:match("%d+"))), 0, 2)
        if not (v2:GetLevel() < v1) then
            for k, n in j:GetDescendants() do
                if n:IsA("BasePart") then
                    n.Transparency = v3
                end
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 90
    -- upvalues: Maid (val), EasySound (val), Create (val), TimescaleUtilities (val), EmitterManager (val)
    -- upvalues: RunService (val), GameState (val), Rocket (val)
    local u3 = Maid.new()
    a1.Maid:Mark(u3)
    local u9 = {}

    function u9.Thunk() -- Line: 95 -- upvalues: EasySound (upval), a1 (val)
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = a1.Model.HumanoidRootPart.Thunk.SoundId,
            parent = a1.Model.HumanoidRootPart,
            playbackSpeed = Random.new():NextNumber(0.9, 1.1),
        })
    end

    function u9.Transparency(a1_2) -- Line: 105 -- upvalues: a1 (val)
        a1:_updateTransparency(a1_2)
    end

    function u9.Fire(a1_2) -- Line: 108
        -- upvalues: a1 (val), Create (upval), EasySound (upval), TimescaleUtilities (upval), EmitterManager (upval)
        -- upvalues: RunService (upval), GameState (upval)
        local Position, v1
        local v2 = a1.Model.Weapon[("Firework%*"):format(a1_2)]
        v2.FuseVFX.Value.ParticleEmitter.Enabled = false
        local u130 = v2:Clone()
        u130.Base["1"].Glow.Enabled = true
        if u130:IsA("Folder") then
            v1 = Create("Model", {Name = u130.Name, PrimaryPart = u130.Base})
            for i, j in u130:GetChildren() do
                j.Parent = v1
            end
            u130 = v1
        end
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = a1.Model.HumanoidRootPart.Whistle.SoundId,
            parent = u130.Fuse,
            playbackSpeed = Random.new():NextNumber(0.98, 1.05),
        })
        for k, n in u130:GetDescendants() do
            if n:IsA("BasePart") then
                n.Transparency = 0
                n.Anchored = true
            end
            if n:IsA("WeldConstraint") or n:IsA("Motor6D") then
                n:Destroy()
            end
        end
        u130.Parent = workspace
        v1 = if not ((a1:GetLevel()) < 4) then "MaxLaunch" else "Launch"
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = a1.Model.HumanoidRootPart[v1].SoundId,
            parent = u130.Fuse,
        })
        local Value = v2.Spawn.Value
        if not a1.FBXModel then
            Position = Value.CFrame.Position
        else
            Position = Value.WorldCFrame.Position
            if not Position then
                Position = Value.CFrame.Position
            end
        end
        local u125 = Position + Vector3.new(math.random(-4, 4), Random.new():NextNumber(12, 14), (math.random(-4, 4)))
        local v3 = CFrame.new(Position)
        u130:PivotTo(v3)
        if not ((a1:GetLevel()) < 4) then
            EmitterManager.manualEmit(a1.Model.Effect)
        else
            TimescaleUtilities.Wait(0.5)
        end
        local u149 = 0
        local u150 = nil
        local u152 = CFrame.new()
        local v4 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 179
            -- upvalues: GameState (upval), u149 (ref), u150 (ref), u130 (ref), EmitterManager (upval)
            -- upvalues: EasySound (upval), a1 (upval), TimescaleUtilities (upval), Position (val), u125 (val)
            -- upvalues: u152 (ref)
            local v1 = a1_2 * GameState.TimeScale
            u149 = u149 + v1 / 0.3
            if not (u149 >= 1) then
                local v2 = CFrame.new(math.noise(u149 * 0.3) * 2, 0, math.noise(u149 * 0.3) * 2)
                local v3 = CFrame.new((Position:Lerp(u125, u149))) * v2
                local v4 = (u152.Position - v3.Position).Unit * 2
                u130.Base.CFrame = (CFrame.new(v3.Position, v3.Position - v4)) * CFrame.Angles(-1.5707963267948966, 0, 0)
                u152 = v3
                return
            end
            u150:Disconnect()
            for i, j in u130:GetDescendants() do
                if j:IsA("BasePart") then
                    j.Transparency = 1
                end
            end
            EmitterManager.manualEmit(u130.Base.Explosion)
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                id = a1.Model.HumanoidRootPart.Explosion.SoundId,
                parent = u130.Fuse,
                playbackSpeed = Random.new():NextNumber(0.9, 1.1),
            })
            TimescaleUtilities.CleanUp(u130, 4)
        end)
    end

    function u9.Light(a1_2) -- Line: 218 -- upvalues: EasySound (upval), a1 (val)
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = a1.Model.HumanoidRootPart.LightUp.SoundId,
            parent = a1.Model.Weapon[("Firework%*"):format(a1_2)].Fuse,
            playbackSpeed = Random.new():NextNumber(0.9, 1.1),
        })
        a1.Model.Weapon[("Firework%*"):format(a1_2)].FuseVFX.Value.ParticleEmitter.Enabled = true
    end

    a1.Executables = {
        Fireworks = function() -- Line: 232 -- upvalues: u3 (val), a1 (val), u9 (val)
            u3:Sweep()
            local v1 = a1:_playAnimation("Fire")
            for i, j in u9 do
                u3:Mark(((v1:GetMarkerReachedSignal(i)):Connect(j)))
            end
            u3:Mark((v1.Ended:Connect(function() -- Line: 239 -- upvalues: a1 (upval)
                a1:_playAnimation("Cheer")
            end)))
        end,
        FireworkTrail = function(a1, a2) -- Line: 244 -- upvalues: Rocket (upval)
            Rocket(a1, a2)
        end,
    }
    a1.OnUpgrade:Connect(function() -- Line: 249 -- upvalues: a1 (val)
        a1:_updateTransparency(0)
    end)
    a1:_updateTransparency(0)
end

return v1