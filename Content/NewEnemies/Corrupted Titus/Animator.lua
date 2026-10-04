-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Titus.Animator
-- Decompile time: 6.13 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: GameState (val), ServerTicks (val), RunService (val), TweenService (val), Shaker (val), Animation (val)
    -- upvalues: TimescaleUtilities (val)
    local DifficultyIntro = a1.Stats.DifficultyIntro
    if DifficultyIntro then
        DifficultyIntro = a1.Stats.DifficultyIntro[GameState.Difficulty]
    end
    if DifficultyIntro then
        local v1 = a1.Replicator:Get("CreatedAt")
        if v1 then
            local u17 = 1 / (a1.StateScale or 1)
            local u23 = ServerTicks.getTime() - (v1 + DifficultyIntro.GrowDelay)
            if u23 < DifficultyIntro.GrowDuration and u17 < 1 then
                local u26 = nil
                local u27 = nil
                local u28 = nil
                u28 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 27
                    -- upvalues: a1 (val), u28 (ref), u26 (ref), u27 (ref), u23 (ref), GameState (upval)
                    -- upvalues: DifficultyIntro (val), TweenService (upval), u17 (val)
                    if not a1.Model.Parent then
                        u28:Disconnect()
                        return
                    end
                    if not u26 then
                        u26 = a1.Model:GetScale()
                        u27 = a1.ScalePositionOffset.Y
                    end
                    u23 = u23 + a1_2 * GameState.TimeScale
                    local v1 = math.clamp(u23 / DifficultyIntro.GrowDuration, 0, 1)
                    local Value = TweenService:GetValue(v1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
                    local v2 = u17 + (1 - u17) * Value
                    a1.Model:ScaleTo(u26 * v2)
                    a1.ScalePositionOffset = Vector3.new(1, u27 * v2, 1)
                    if v1 >= 1 then
                        a1.Model:ScaleTo(u26)
                        a1.ScalePositionOffset = Vector3.new(1, u27, 1)
                        u28:Disconnect()
                    end
                end)
                a1.Maid:Mark(u28)
            end
        end
        if DifficultyIntro.FootstepShake then
            local FootstepShake = DifficultyIntro.FootstepShake
            local u51 = v1
            if u51 then
                u51 = v1 + DifficultyIntro.GrowDelay + DifficultyIntro.GrowDuration
            end
            local u54 = u51 == nil
            local u55 = nil
            local u56 = nil
            local u57 = nil
            u57 = RunService.RenderStepped:Connect(function() -- Line: 68
                -- upvalues: a1 (val), u57 (ref), u54 (ref), ServerTicks (upval), u51 (val), u56 (ref), u55 (ref)
                -- upvalues: FootstepShake (val), Shaker (upval)
                if a1.Model.Parent and a1.Model.PrimaryPart then
                    if not u54 then
                        if not (u51 <= (ServerTicks.getTime())) then
                            return
                        else
                            u54 = true
                        end
                    end
                    local WalkTrack = a1.WalkTrack
                    if WalkTrack and WalkTrack.IsPlaying and not (WalkTrack.Length <= 0) then
                        local v1 = WalkTrack.TimePosition / WalkTrack.Length
                        if WalkTrack ~= u55 then
                            u55 = WalkTrack
                            u56 = v1
                            return
                        end
                        if u56 then
                            local v2 = false
                            local v3 = nil
                            local v4 = nil
                            for i, j in FootstepShake.StepPhases, v3, v4 do
                                if not (u56 <= v1) then
                                    if not (u56 < j) and not (j <= v1) then
                                        continue
                                    end
                                    v2 = true
                                    break
                                elseif u56 < j and j <= v1 then
                                    v2 = true
                                    break
                                end
                            end
                            if v2 then
                                Shaker:Shake({FootstepShake.Intensity, 10, 0.1, 1}, 0.1, 0.25, {
                                    position = a1.Model.PrimaryPart.Position,
                                    radius = FootstepShake.Radius,
                                })
                            end
                        end
                        u56 = v1
                        return
                    end
                    u56 = nil
                    return
                end
                u57:Disconnect()
            end)
            a1.Maid:Mark(u57)
        end
    end
    a1._animations = {}
    a1._beams = {}
    a1._animationFunctions = {
        VoidStream = function() -- Line: 130 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Laser:Play()
            a1._animations.VoidStreamIntro:Play()
            a1._animations.VoidStreamLoop:Play()
        end,
        VoidStreamStop = function() -- Line: 136 -- upvalues: a1 (val)
            a1._animations.VoidStreamOutro:Play()
            a1._animations.VoidStreamLoop:Stop()
        end,
        DarkDecoy = function() -- Line: 141 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Summon:Play()
            a1._animations.SummonIntro:Play()
            a1._animations.SummonLoop:Play()
        end,
        DarkDecoyStop = function() -- Line: 146 -- upvalues: a1 (val)
            a1._animations.SummonOutro:Play()
            a1._animations.SummonLoop:Stop()
        end,
    }
    local Animator = a1.Model.AnimationController.Animator
    for i, j in a1.Model.Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({
            IgnorePriority = true,
            IsPersistent = true,
            Preload = true,
            Track = j,
            Target = Animator,
        }))
    end
    local u108 = a1.Replicator:Get("Health")
    local u109 = nil
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Health")):Connect(function(a1_2) -- Line: 167 -- upvalues: u108 (ref), u109 (ref), a1 (val), TimescaleUtilities (upval)
        if u108 < a1_2 then
            if u109 then
                task.cancel(u109)
            end
            u109 = task.spawn(function() -- Line: 172 -- upvalues: a1 (upval), TimescaleUtilities (upval)
                for i, j in a1.Model.BossHeal:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = true
                    end
                end
                TimescaleUtilities.Wait(2)
                for k, n in a1.Model.BossHeal:GetDescendants() do
                    if n:IsA("ParticleEmitter") then
                        n.Enabled = false
                    end
                end
            end)
        end
        u108 = a1_2
    end)))
    a1.Executables = {
        Death = function() -- Line: 192 -- upvalues: a1 (val)
            a1.Model.HumanoidRootPart.Death:Play()
            for i, j in a1._animations do
                j:Stop()
            end
            a1._animations.Death:Play()
        end,
        CleanBeams = function() -- Line: 200 -- upvalues: a1 (val)
            for i, j in a1._beams do
                j:Destroy()
            end
            table.clear(a1._beams)
        end,
        Face = function(a1_2) -- Line: 207 -- upvalues: a1 (val), TweenService (upval)
            local v1 = CFrame.new(a1.Model.HumanoidRootPart.Position, (Vector3.new(a1_2.X, a1.Model.HumanoidRootPart.Position.Y, a1_2.Z)))
            TweenService:Create(
                a1.Model.HumanoidRootPart,
                TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                {CFrame = v1}
            ):Play()
        end,
        MainEffect = function(a1_2) -- Line: 220 -- upvalues: a1 (val)
            for i, j in a1.Model.MainEffect:GetDescendants() do
                if j:IsA("ParticleEmitter") or j:IsA("Light") then
                    j.Enabled = a1_2
                end
            end
        end,
        Flash = function() -- Line: 228 -- upvalues: a1 (val), TimescaleUtilities (upval), TweenService (upval)
            local Attribute, Attribute_2
            for i, j in a1.Model.Hand.Activate:GetDescendants() do
                if j:IsA("Light") then
                    j.Brightness = 16
                    TimescaleUtilities.Delay(0.1, function() -- Line: 232 -- upvalues: TweenService (upval), j (val)
                        TweenService:Create(j, TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Brightness = 0}):Play()
                    end)
                elseif j:IsA("ParticleEmitter") then
                    Attribute = j:GetAttribute("EmitDelay")
                    if Attribute then
                        TimescaleUtilities.Delay(Attribute, function() -- Line: 248 -- upvalues: j (val)
                            j:Emit((j:GetAttribute("EmitCount")))
                        end)
                    else
                        Attribute_2 = j:GetAttribute("EmitCount")
                        j:Emit(Attribute_2)
                    end
                end
            end
        end,
        AddBeam = function(a1_2) -- Line: 256 -- upvalues: a1 (val), TweenService (upval)
            local v1
            local Attachment = Instance.new("Attachment")
            Attachment.Parent = a1_2.PrimaryPart
            Attachment.WorldCFrame = a1.Model.Hand.CFrame
            TweenService:Create(
                Attachment,
                TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {WorldCFrame = a1_2.PrimaryPart.CFrame}
            ):Play()
            for i, j in a1.Model.Hand.Beam:GetChildren() do
                v1 = j:Clone()
                v1.Parent = a1.Model.Hand
                v1.Attachment0 = a1.Model.Hand.Activate
                v1.Attachment1 = Attachment
                v1.Enabled = true
                v1.Parent = a1.Model.Hand
                table.insert(a1._beams, v1)
            end
        end,
        Animation = function(a1_2) -- Line: 282 -- upvalues: a1 (val)
            if a1._animationFunctions[a1_2] then
                a1._animationFunctions[a1_2]()
                return
            end
            a1._animations[a1_2]:Play()
        end,
    }
end

return v1