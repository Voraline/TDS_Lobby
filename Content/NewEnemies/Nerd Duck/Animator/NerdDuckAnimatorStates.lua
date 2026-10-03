-- Script path: ReplicatedStorage.Content.NewEnemies.Nerd Duck.Animator.NerdDuckAnimatorStates
-- Decompile time: 14.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u55 = ReplicatedStorage.Assets.Effects.Mob["Nerd Duck"]

local function getBone(a1, a2) -- Line: 28
    for i, j in a1.Model.RootPart:GetDescendants() do
        if j.Name == a2 then
            return j
        end
    end
    return nil
end

local v1 = {
    name = "DuckyBlast",
    onEnter = function(a1, a2) -- Line: 63
        -- upvalues: u55 (val), EmitterManager (val), TimescaleUtilities (val), RunService (val), GameState (val)
        -- upvalues: EffectsController (val)
        local v1, v2
        local u120 = {}
        local DuckyBlast = a1.Stats.Moveset.DuckyBlast
        a1.animations.DuckyBlast:Play()
        a1:Face(a2.faceAt)
        a1.sounds.BlastAttack:Play()
        local u126 = nil
        local u129 = {}
        local u132 = {}
        local v3 = {
            {time = 2.2, cannon = "DEF_CANNON_02.R", pod = 3, solo = false},
            {time = 2.37, cannon = "DEF_CANNON_02.L", pod = 4, solo = false},
            {time = 2.53, cannon = "DEF_CANNON_01.R", pod = 5, solo = false},
            {time = 2.7, cannon = "DEF_CANNON_01.L", pod = 6, solo = false},
        }
        local u75 = {}
        local v4 = #v3
        for i = 1, v4 do
            v1 = a2.bulletPositions[i]
            if v1 then
                v2 = u55.Blast:Clone()
                v2.Parent = workspace
                v2.Indicator.Anchored = true
                v2.Indicator.CFrame = (CFrame.new(v1)) * CFrame.new(0, 0.1, 0)
                EmitterManager.manualEmit(v2.Indicator)
                u75[i] = v2.RocketExplosion
                TimescaleUtilities.CleanUp(v2, 10)
            end
        end
        for j, k in v3 do
            if a2.bulletPositions[j] then
                TimescaleUtilities.Delay(k.time, function() -- Line: 127 -- upvalues: a1 (val), k (val), u55 (upval), u120 (val), a2 (val), j (val), DuckyBlast (val)
                    local v1
                    local v2 = a1
                    local cannon = k.cannon
                    for i, j2 in v2.Model.RootPart:GetDescendants() do
                        if j2.Name == cannon then
                            v2 = u55.Rocket:Clone()
                            v2.Parent = workspace
                            v2.CFrame = j2.WorldCFrame
                            u120[v2] = {
                                ElapsedTime = 0,
                                Start = v1.WorldPosition,
                                End = a2.bulletPositions[j],
                                TravelTime = DuckyBlast.ProjectileTime,
                                Part = v2,
                                PodNumber = k.pod,
                                Solo = k.solo,
                                index = j,
                            }
                            return
                        end
                    end
                    v2 = u55.Rocket:Clone()
                    v2.Parent = workspace
                    v2.CFrame = (nil).WorldCFrame
                    u120[v2] = {
                        ElapsedTime = 0,
                        Start = v1.WorldPosition,
                        End = a2.bulletPositions[j],
                        TravelTime = DuckyBlast.ProjectileTime,
                        Part = v2,
                        PodNumber = k.pod,
                        Solo = k.solo,
                        index = j,
                    }
                end)
            end
        end
        local u89 = 0
        local v5 = RunService.Heartbeat:Connect(function(a1) -- Line: 149
            -- upvalues: GameState (upval), u120 (val), u129 (val), u132 (val), TimescaleUtilities (upval), u75 (val)
            -- upvalues: EmitterManager (upval), EffectsController (upval), DuckyBlast (val), u89 (ref), a2 (val)
            -- upvalues: u126 (ref)
            local ElapsedTime, LastPos, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
            local v14 = a1 * GameState.TimeScale
            for k, v in pairs(u120) do
                v.ElapsedTime = v.ElapsedTime + v14
                v11 = math.min(v.ElapsedTime / v.TravelTime, 1)
                LastPos = v.LastPos or v.Start
                v12 = v.Start:Lerp(v.End, v11)
                v1 = v.PodNumber or 1
                ElapsedTime = v.ElapsedTime
                v2 = (v.End - v.Start).Magnitude / 4
                v3 = math.sin(v11 * 3.141592653589793)
                v4 = math.min(math.sin(v11 * 3.141592653589793) * 2, 1)
                v5 = (ElapsedTime + math.pow(2, v1)) * 8
                v6 = v.Solo == false and math.pow(-1, v1 % 2) or 0
                v7 = if not (v1 > 2) then 1 else 0
                v8 = CFrame.new((math.sin(v5 * 1.75) + v6) * v4, v2 * v3 + (math.sin(v5) + v7) * v4, 0)
                v9 = CFrame.new(v12) * v8
                v13 = CFrame.new(v9.Position, v9.Position + (v9.Position - LastPos).Unit)
                table.insert(u129, v13)
                table.insert(u132, v.Part)
                v.LastPos = v13.Position
                if v11 >= 1 then
                    u120[k] = nil
                    k.Transparency = 1
                    TimescaleUtilities.CleanUp(k, 3)
                    v10 = u75[v.index]
                    if v10 then
                        v10.CFrame = CFrame.new(v.End)
                        EmitterManager.manualEmit(v10)
                        v10.Parent = workspace
                    end
                    EffectsController.Explosion({Radius = DuckyBlast.ExplosionRadius, Position = v.End})
                    u89 = u89 + 1
                end
                v10 = u89
                if #a2.bulletPositions <= v10 then
                    u126:Disconnect()
                    u126 = nil
                end
            end
            workspace:BulkMoveTo(u132, u129)
        end)
        return {a1}
    end,
}
local v2 = {
    name = "DuckyReposition",
    onEnter = function(a1, a2) -- Line: 217
        -- upvalues: TimescaleUtilities (val), LightningBolt (val), u55 (val), EmitterManager (val)
        local createBeam, u16, u80, v1
        for i, j in a1.Model.RootPart:GetDescendants() do
            if j.Name == "DEF_FINGERS_B_01.R" then
                u16 = j
                a1.sounds.RepositionIntro:Play()
                TimescaleUtilities.Delay(0.1, function() -- Line: 221 -- upvalues: a1 (val)
                    a1.sounds.RepositionLoop:Play()
                end)

                function createBeam(a1_2, a2) -- Line: 225 -- upvalues: a1 (val), LightningBolt (upval)
                    local Attachment = Instance.new("Attachment")
                    Attachment.Parent = a1_2
                    Attachment.Position = Vector3.new(0.5, 0.5, 0)
                    a1.lightningGoal = {WorldAxis = Vector3.new(0, 0, 1), WorldPosition = a2}
                    local u14 = LightningBolt.new(Attachment, a1.lightningGoal, 25)
                    u14.Thickness = 0.5
                    u14.Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 255, 255))),
                    })
                    u14.MaxRadius = 1
                    u14.PulseSpeed = 2.8
                    u14.AnimationSpeed = 5
                    return {
                        clean = function() -- Line: 242 -- upvalues: Attachment (val), u14 (val)
                            Attachment:Destroy()
                            u14:DestroyDissipate(0.65)
                        end,
                        beam = u14,
                    }
                end

                v1 = u55.Reposition:Clone()
                v1.Parent = workspace
                v1.Tower1.CFrame = (CFrame.new(a2.tower1.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
                v1.Tower2.CFrame = (CFrame.new(a2.tower2.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
                a1.animations.RepositionIntro:Play()
                a1.animations.RepositionLoop:Play()
                a1:Face(a2.tower1.PrimaryPart.Position)
                u80 = {}
                a1:Delay(1.1, function() -- Line: 265 -- upvalues: u80 (val), createBeam (val), u16 (val), a2 (val), a1 (val)
                    table.insert(u80, (createBeam(u16, a2.tower1.PrimaryPart.Position)))
                    a1:Delay(1, function() -- Line: 268 -- upvalues: a2 (upval), u80 (upval), createBeam (upval)
                        if a2.tower2.Parent then
                            table.insert(u80, (createBeam(a2.tower1.PrimaryPart, a2.tower2.PrimaryPart.Position)))
                        end
                    end)
                end)
                a1:Delay(4)
                v1.Reposition1.CFrame = (CFrame.new(a2.tower1.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
                v1.Reposition2.CFrame = (CFrame.new(a2.tower2.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
                EmitterManager.manualEmit(v1.Reposition1)
                EmitterManager.manualEmit(v1.Reposition2)
                v1.Tower1:Destroy()
                v1.Tower2:Destroy()
                TimescaleUtilities.CleanUp(v1, 3)
                a1.sounds.RepositionLoop:Stop()
                if a2.tower2.Parent then
                    u80[2].beam.Attachment1.WorldPosition = a2.tower2.PrimaryPart.Position
                end
                for k, n in u80 do
                    n.clean()
                end
                a1.sounds.RepositionOutro:Play()
                a1.animations.RepositionOutro:Play()
                a1.animations.RepositionLoop:Stop()
                return {a1}
            end
        end
        u16 = nil
        a1.sounds.RepositionIntro:Play()
        TimescaleUtilities.Delay(0.1, function() -- Line: 221 -- upvalues: a1 (val)
            a1.sounds.RepositionLoop:Play()
        end)

        function createBeam(a1_2, a2) -- Line: 225 -- upvalues: a1 (val), LightningBolt (upval)
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = a1_2
            Attachment.Position = Vector3.new(0.5, 0.5, 0)
            a1.lightningGoal = {WorldAxis = Vector3.new(0, 0, 1), WorldPosition = a2}
            local u14 = LightningBolt.new(Attachment, a1.lightningGoal, 25)
            u14.Thickness = 0.5
            u14.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 255, 255))),
            })
            u14.MaxRadius = 1
            u14.PulseSpeed = 2.8
            u14.AnimationSpeed = 5
            return {
                clean = function() -- Line: 242 -- upvalues: Attachment (val), u14 (val)
                    Attachment:Destroy()
                    u14:DestroyDissipate(0.65)
                end,
                beam = u14,
            }
        end

        v1 = u55.Reposition:Clone()
        v1.Parent = workspace
        v1.Tower1.CFrame = (CFrame.new(a2.tower1.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
        v1.Tower2.CFrame = (CFrame.new(a2.tower2.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
        a1.animations.RepositionIntro:Play()
        a1.animations.RepositionLoop:Play()
        a1:Face(a2.tower1.PrimaryPart.Position)
        u80 = {}
        a1:Delay(1.1, function() -- Line: 265 -- upvalues: u80 (val), createBeam (val), u16 (val), a2 (val), a1 (val)
            table.insert(u80, (createBeam(u16, a2.tower1.PrimaryPart.Position)))
            a1:Delay(1, function() -- Line: 268 -- upvalues: a2 (upval), u80 (upval), createBeam (upval)
                if a2.tower2.Parent then
                    table.insert(u80, (createBeam(a2.tower1.PrimaryPart, a2.tower2.PrimaryPart.Position)))
                end
            end)
        end)
        a1:Delay(4)
        v1.Reposition1.CFrame = (CFrame.new(a2.tower1.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
        v1.Reposition2.CFrame = (CFrame.new(a2.tower2.PrimaryPart.Position)) * CFrame.new(0, 0.1, 0)
        EmitterManager.manualEmit(v1.Reposition1)
        EmitterManager.manualEmit(v1.Reposition2)
        v1.Tower1:Destroy()
        v1.Tower2:Destroy()
        TimescaleUtilities.CleanUp(v1, 3)
        a1.sounds.RepositionLoop:Stop()
        if a2.tower2.Parent then
            u80[2].beam.Attachment1.WorldPosition = a2.tower2.PrimaryPart.Position
        end
        for m, i5 in u80 do
            i5.clean()
        end
        a1.sounds.RepositionOutro:Play()
        a1.animations.RepositionOutro:Play()
        a1.animations.RepositionLoop:Stop()
        return {a1}
    end,
}
local v3 = {
    name = "DuckyDischarge",
    onEnter = function(a1, a2) -- Line: 316
        -- upvalues: EmitterManager (val), TimescaleUtilities (val), Shaker (val), EffectsController (val)
        local DuckyDischarge = a1.Stats.Moveset.DuckyDischarge
        if not a2 then
            EmitterManager.manualEmit(a1.Model.ChargeVFX)
            a1.sounds.Discharge:Play()
            a1.animations.DuckyDischarge:Play()
            a1.animations.Idle:Play()
        else
            a1.sounds.CancelDischarge:Play()
            a1.animations.StunIntro:Play()
            a1.animations.StunLoop:Play()
        end
        if not a2 then
            TimescaleUtilities.Delay(5.93, function() -- Line: 331 -- upvalues: Shaker (upval), a1 (val), EffectsController (upval), DuckyDischarge (val)
                local v1
                Shaker:Shake({2, 30, 0.1, 1}, 0.1, 0.5)
                for i, j in a1.Model.RootPart:GetDescendants() do
                    if j.Name == "DEF_FINGERS_B_01.R" then
                        v1 = j
                        EffectsController.GroundSmash(CFrame.new(v1.WorldPosition), DuckyDischarge.ExplosionRadius, 1.4)
                        return
                    end
                end
                EffectsController.GroundSmash(CFrame.new((nil).WorldPosition), DuckyDischarge.ExplosionRadius, 1.4)
            end)
        end
        return {a1}
    end,
    onLeave = function(a1) -- Line: 343
        a1.sounds.CancelStunLoop:Stop()
        a1.sounds.CancelStunOutro:Play()
    end,
}
local v4 = {
    name = "DuckyStampede",
    onEnter = function(a1) -- Line: 351 -- upvalues: u55 (val)
        local Scalar = a1.Path:GetScalar(a1.PathDistance + 2)
        local v1 = u55.SummonEffect:Clone()
        v1.CFrame = CFrame.new((Vector3.new(Scalar.X, a1.Position.Y, Scalar.Z)))
        v1.Parent = workspace
        for i, j in v1:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = true
            end
        end
        a1._summonEffect = v1
        a1.sounds.StampedeIntro:Play()
        a1.animations.StampedIntro:Play()
        a1.animations.StampedIntro.Controller.Stopped:Wait()
        a1.sounds.StampedeLoop:Play()
        a1.animations.StampedLoop:Play()
        return {a1}
    end,
    onLeave = function(a1) -- Line: 376 -- upvalues: TimescaleUtilities (val)
        a1.sounds.StampedeLoop:Stop()
        a1.animations.StampedLoop:Stop()
        a1.animations.StampedOutro:Play()
        a1.sounds.StampedeOutro:Play()
        for i, j in a1._summonEffect:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = false
            end
        end
        TimescaleUtilities.Delay(4, function() -- Line: 388 -- upvalues: a1 (val)
            a1._summonEffect:Destroy()
            a1._summonEffect = nil
        end)
        return {a1}
    end,
}
local v5 = {
    name = "SwitchPath",
    onEnter = function(a1, a2, a3, a4, a5) -- Line: 401
        -- upvalues: GameState (val), TimescaleUtilities (val), ItemDrop (val), Shaker (val), u55 (val)
        -- upvalues: EmitterManager (val)
        local PrimaryPart, Scalar, v1
        a1:Face(a4.endPosition, TweenInfo.new(0.6), true)
        a1.animations.JumpIntro:Play()
        a1.animations.JumpLoop:Play()
        a1.sounds.HopIntro:Play()
        for i, j in a1.Model.RootPart:GetDescendants() do
            if j.Name == "TORSO_PIVOT" then
                for k, n in j.Trail.Top:GetChildren() do
                    n.Enabled = true
                end
                Scalar = GameState.Paths[a1.PathTeam][a2]:GetScalar(a1.PathDistance + 5, 1)
                a1.Rotation = CFrame.new() * CFrame.new(a1.Position, Scalar).Rotation
                v1 = a5 - workspace:GetServerTimeNow()
                TimescaleUtilities.Delay(math.max(v1 - 0.3, 0), function() -- Line: 418 -- upvalues: a1 (val)
                    a1.sounds.HopOutro:Play()
                    a1.animations.JumpOutro:Play()
                end)
                PrimaryPart = a1.Model.PrimaryPart
                TimescaleUtilities.Delay(0.9, function() -- Line: 424
                    -- upvalues: a4 (val), ItemDrop (upval), PrimaryPart (val), a1 (val), Shaker (upval), u55 (upval)
                    -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
                    local Rotation = (CFrame.new(a4.startPosition, a4.endPosition)).Rotation
                    ;(ItemDrop.Drop(a4.startPosition, a4.endPosition, PrimaryPart, a4.dtMultiplier, a4.gravity, a4.velocity, function() -- Line: 433 -- upvalues: Rotation (val)
                        return Rotation
                    end)):andThen(function() -- Line: 436
                        -- upvalues: a1 (upval), Shaker (upval), a4 (upval), u55 (upval), PrimaryPart (upval)
                        -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
                        local v1
                        for i, j in a1.Model.RootPart:GetDescendants() do
                            if j.Name == "TORSO_PIVOT" then
                                for k, n in j.Trail.Top:GetChildren() do
                                    n.Enabled = false
                                end
                                a1.animations.JumpLoop:Stop()
                                Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a4.endPosition})
                                v1 = u55.LandVFX:Clone()
                                v1.Parent = workspace
                                v1.CFrame = (CFrame.new(PrimaryPart.Node.WorldPosition)) * CFrame.new(0, 0.3, 0)
                                EmitterManager.manualEmit(v1)
                                TimescaleUtilities.CleanUp(v1, 3)
                                return
                            end
                        end
                        for m, i5 in (nil).Trail.Top:GetChildren() do
                            i5.Enabled = false
                        end
                        a1.animations.JumpLoop:Stop()
                        Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a4.endPosition})
                        v1 = u55.LandVFX:Clone()
                        v1.Parent = workspace
                        v1.CFrame = (CFrame.new(PrimaryPart.Node.WorldPosition)) * CFrame.new(0, 0.3, 0)
                        EmitterManager.manualEmit(v1)
                        TimescaleUtilities.CleanUp(v1, 3)
                    end)
                end)
                return {a1}
            end
        end
        for m, i5 in (nil).Trail.Top:GetChildren() do
            i5.Enabled = true
        end
        Scalar = GameState.Paths[a1.PathTeam][a2]:GetScalar(a1.PathDistance + 5, 1)
        a1.Rotation = CFrame.new() * CFrame.new(a1.Position, Scalar).Rotation
        v1 = a5 - workspace:GetServerTimeNow()
        TimescaleUtilities.Delay(math.max(v1 - 0.3, 0), function() -- Line: 418 -- upvalues: a1 (val)
            a1.sounds.HopOutro:Play()
            a1.animations.JumpOutro:Play()
        end)
        PrimaryPart = a1.Model.PrimaryPart
        TimescaleUtilities.Delay(0.9, function() -- Line: 424
            -- upvalues: a4 (val), ItemDrop (upval), PrimaryPart (val), a1 (val), Shaker (upval), u55 (upval)
            -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
            local Rotation = (CFrame.new(a4.startPosition, a4.endPosition)).Rotation
            ;(ItemDrop.Drop(a4.startPosition, a4.endPosition, PrimaryPart, a4.dtMultiplier, a4.gravity, a4.velocity, function() -- Line: 433 -- upvalues: Rotation (val)
                return Rotation
            end)):andThen(function() -- Line: 436
                -- upvalues: a1 (upval), Shaker (upval), a4 (upval), u55 (upval), PrimaryPart (upval)
                -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
                local v1
                for i, j in a1.Model.RootPart:GetDescendants() do
                    if j.Name == "TORSO_PIVOT" then
                        for k, n in j.Trail.Top:GetChildren() do
                            n.Enabled = false
                        end
                        a1.animations.JumpLoop:Stop()
                        Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a4.endPosition})
                        v1 = u55.LandVFX:Clone()
                        v1.Parent = workspace
                        v1.CFrame = (CFrame.new(PrimaryPart.Node.WorldPosition)) * CFrame.new(0, 0.3, 0)
                        EmitterManager.manualEmit(v1)
                        TimescaleUtilities.CleanUp(v1, 3)
                        return
                    end
                end
                for m, i5 in (nil).Trail.Top:GetChildren() do
                    i5.Enabled = false
                end
                a1.animations.JumpLoop:Stop()
                Shaker:Shake({1.5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a4.endPosition})
                v1 = u55.LandVFX:Clone()
                v1.Parent = workspace
                v1.CFrame = (CFrame.new(PrimaryPart.Node.WorldPosition)) * CFrame.new(0, 0.3, 0)
                EmitterManager.manualEmit(v1)
                TimescaleUtilities.CleanUp(v1, 3)
            end)
        end)
        return {a1}
    end,
}
local v6 = {
    name = "NerdRage",
    onEnter = function(a1, a2) -- Line: 474 -- upvalues: EmitterManager (val), u55 (val), TimescaleUtilities (val)
        local v1
        EmitterManager.manualEmit(a1.Model.RageCharge)
        a1.animations.NerdRageAttack:Play()
        a1.sounds.StunAttack:Play()
        a1:Delay(1.9)
        for i, j in a1.Model.RootPart:GetDescendants() do
            if j.Name == "DEF_FINGERS_B_02.L" then
                v1 = u55.TowerHit:Clone()
                v1.Parent = workspace
                v1.CFrame = (CFrame.new(j.WorldPosition)) * CFrame.new(0, 0.1, 0)
                EmitterManager.manualEmit(v1)
                TimescaleUtilities.CleanUp(v1, 3)
                return {a1}
            end
        end
        v1 = u55.TowerHit:Clone()
        v1.Parent = workspace
        v1.CFrame = (CFrame.new((nil).WorldPosition)) * CFrame.new(0, 0.1, 0)
        EmitterManager.manualEmit(v1)
        TimescaleUtilities.CleanUp(v1, 3)
        return {a1}
    end,
}
return {
    {
        name = "Idle",
        onEnter = function(a1) -- Line: 39
            a1.animations.Idle:Play()
            return {a1}
        end,
        onLeave = function(a1) -- Line: 45
            a1.animations.Idle:Stop()
        end,
    },
    {
        name = "Walk",
        onEnter = function(a1) -- Line: 52
            a1.animations.Idle:Stop()
            a1.animations.StunLoop:Stop()
            return {a1}
        end,
    },
    v1,
    v2,
    v3,
    v4,
    v5,
    {
        name = "RageMode",
        onEnter = function(a1) -- Line: 462
            a1.sounds.NerdRage:Play()
            a1.animations.NerdRageIntro:Play()
            return {a1}
        end,
    },
    v6,
    {
        name = "Death",
        onEnter = function(a1) -- Line: 497
            a1.sounds.Death:Play()
            a1.animations.Death:Play()
            a1:Delay(1.5)
        end,
    },
}