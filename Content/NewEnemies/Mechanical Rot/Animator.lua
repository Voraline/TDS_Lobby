-- Script path: ReplicatedStorage.Content.NewEnemies.Mechanical Rot.Animator
-- Decompile time: 8.95 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local JackoBot = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Mob"):WaitForChild("JackoBot")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local Children = JackoBot:WaitForChild("Pumpkins"):GetChildren()

local function lerp(a1, a2, a3) -- Line: 28
    return a1 + (a2 - a1) * a3
end

function v1.Initialize(a1) -- Line: 32
    -- upvalues: Animation (val), TimescaleUtilities (val), JackoBot (val), GameState (val), TweenService (val)
    -- upvalues: Children (val), ItemDrop (val), EmitterManager (val), Shaker (val)
    local new_2, new_3, v1
    local u1 = {
        minigunStart = a1.Model.Animations.MinigunStart,
        minigunLoop = a1.Model.Animations.MinigunLoop,
        minigunEnd = a1.Model.Animations.MinigunEnd,
    }
    local u11 = {
        cannonStart = a1.Model.Animations.CannonIntro,
        cannonIdle = a1.Model.Animations.CannonIdle,
        cannonEnd = a1.Model.Animations.CannonEnd,
        cannonFire = a1.Model.Animations.CannonFire,
    }
    for k, v in pairs(u1) do
        new_3 = Animation.new
        v1 = {Track = v, Target = a1.Model.AnimationController}
        u1[k] = (new_3(v1))
    end
    for k2, i in pairs(u11) do
        new_2 = Animation.new
        v1 = {Track = i, Target = a1.Model.AnimationController}
        u11[k2] = (new_2(v1))
    end
    local u58 = Animation.new({
        Track = a1.Model.Animations.LaughLoop,
        Target = a1.Model.AnimationController,
    })
    local u60 = 0
    local u61 = 0
    local u62 = 0
    local u63 = Vector3.new(0, 0, 0)
    local u64 = 1
    local u65 = 1
    local u66 = 0.2
    a1.bulletEffect = nil
    a1.gunFiring = false
    a1.minigunRadius = 3
    local Model = a1.Model
    local HumanoidRootPart = Model.HumanoidRootPart
    for j, k3 in Model.Minigun:GetChildren() do
        if k3:IsA("Attachment") then
            table.insert({}, k3)
        end
    end
    a1.Maid:Mark(function() -- Line: 130 -- upvalues: a1 (val), TimescaleUtilities (upval)
        if a1.bulletEffect then
            task.spawn(function() -- Line: 135 -- upvalues: TimescaleUtilities (upval), a1 (upval)
                TimescaleUtilities.Wait(1)
                a1.bulletEffect:Destroy()
            end)
        end
    end)

    function a1.MinigunVisuals() -- Line: 142
        -- upvalues: a1 (val), JackoBot (upval), u64 (ref), u66 (ref), u65 (ref), u63 (ref), Model (val)
        local RightLowerArm = a1.Model:WaitForChild("RightLowerArm")
        local End = RightLowerArm:WaitForChild("End")
        for k, v in pairs(RightLowerArm.Start:GetChildren()) do
            if v:IsA("ParticleEmitter") or v:IsA("Beam") then
                v.Enabled = a1.gunFiring
            end
        end
        if a1.gunFiring then
            local ServerTimeNow = workspace:GetServerTimeNow()
            local Position = a1.Model.HumanoidRootPart.Position
            if a1.bulletEffect == nil then
                a1.bulletEffect = JackoBot:WaitForChild("BulletRain"):Clone()
                a1.bulletEffect.Size = Vector3.new(0.2, a1.minigunRadius * 1.8, a1.minigunRadius * 1.8)
                a1.bulletEffect.Parent = workspace.CurrentCamera
            end
            local v1 = (math.sin(ServerTimeNow * u64)) * u66
            local v2 = (math.cos(ServerTimeNow * u65)) * u66
            local v3 = Vector3.new(Position.X, u63.Y, Position.Z)
            local v4 = CFrame.lookAt(v3, u63)
            local Magnitude = (u63 - v3).Magnitude
            local v5 = 1 + u66 / Magnitude
            local v6 = v3 + (v4 * CFrame.Angles(0, v1 * v5, v2 * v5)).LookVector * Magnitude
            if a1.bulletEffect then
                local Attribute
                a1.bulletEffect.CFrame = (CFrame.new(v6)) * CFrame.Angles(0, 1.5707963267948966, -1.5707963267948966)
                End.WorldPosition = v6
                ;(Model.HumanoidRootPart.CFrame:PointToWorldSpace((Vector3.new(2.2305374145507812, -1.1304049491882324, -1.2862157821655273)))):Lerp(
                    v6,
                    0.1
                )
                for k2, i in pairs(a1.bulletEffect:GetChildren()) do
                    if i:IsA("ParticleEmitter") then
                        Attribute = i:GetAttribute("EmitCount")
                        if Attribute then
                            i:Emit(Attribute)
                        end
                    end
                end
            end
        end
    end

    function a1.OnStepFunction(a1_2) -- Line: 197
        -- upvalues: u61 (ref), u60 (ref), Model (val), GameState (upval), a1 (val)
        local v1 = u61
        local v2 = u60
        local v3 = a1_2 * 10
        u61 = v1 + (v2 - v1) * v3
        Model.Minigun.Spin.PlaybackSpeed = (math.clamp(u61 / 50, 0.2, 1)) * GameState.TimeScale
        Model.Minigun.Spin.Volume = math.clamp(u61 / 50, 0, 1)
        a1.MinigunVisuals()
    end

    function a1.StepAnimations(a1) -- Line: 215 -- upvalues: u62 (ref), u61 (ref), Model (val)
        u62 = u62 + u61 * a1
        u62 = u62 % 6.283185307179586
        Model.RightLowerArm.Minigun.Transform = CFrame.Angles(0, 0, u62)
    end

    a1.Executables = {
        Gun = function(a1_2, a2, a3, a4, a5, a6, a7) -- Line: 224
            -- upvalues: a1 (val), u63 (ref), u64 (ref), u65 (ref), u66 (ref), u1 (val), u60 (ref), Model (val)
            -- upvalues: TimescaleUtilities (upval)
            if a3 then
                a1.minigunRadius = a3
            end
            if a2 then
                u63 = a2
            end
            if a5 and a6 and a7 then
                u64 = a5
                u65 = a6
                u66 = a7
            end
            if not a1_2 then
                a1.gunFiring = false
                u1.minigunLoop:Stop()
                u1.minigunEnd:Play()
                u60 = 0
                Model.Minigun.Slow:Play()
                Model.Minigun.Spin:Stop()
                Model.Minigun.Fire:Stop()
                return
            end
            u1.minigunStart:Play()
            u1.minigunStart.Controller.Stopped:Once(function() -- Line: 247 -- upvalues: u1 (upval)
                u1.minigunLoop:Play()
            end)
            u60 = 50
            Model.Minigun.Start:Play()
            Model.Minigun.Spin:Play()
            if a4 then
                TimescaleUtilities.Wait(a4)
            end
            a1.gunFiring = true
            Model.Minigun.Fire:Play()
        end,
        Summon = function() -- Line: 284 -- upvalues: u58 (val), Model (val)
            u58:Play()
            Model.Head.Laugh:Play()
        end,
        Unsummon = function() -- Line: 288 -- upvalues: u58 (val)
            u58:Stop()
        end,
        LookAt = function(a1_2, a2) -- Line: 292 -- upvalues: HumanoidRootPart (val), a1 (val), TweenService (upval)
            local v1 = a2 or 0.5
            if a1_2 then
                local v2 = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a1_2.X, HumanoidRootPart.Position.Y, a1_2.Z)))
                a1.oldDir = HumanoidRootPart.CFrame
                TweenService:Create(
                    a1.Model.HumanoidRootPart,
                    TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                    {CFrame = v2}
                ):Play()
                return
            end
            if a1.oldDir ~= nil then
                TweenService:Create(
                    a1.Model.HumanoidRootPart,
                    TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0),
                    {CFrame = a1.oldDir}
                ):Play()
                a1.oldDir = nil
            end
        end,
        ShootState = function(a1) -- Line: 327 -- upvalues: u11 (val) -- types: a1: boolean
            if a1 then
                u11.cannonStart:Play()
                u11.cannonStart.Controller.Stopped:Once(function() -- Line: 330 -- upvalues: u11 (upval)
                    u11.cannonIdle:Play()
                end)
                return
            end
            u11.cannonIdle:Stop()
            u11.cannonEnd:Play()
        end,
        Shoot = function(a1_2, a2, a3, a4) -- Line: 343
            -- upvalues: a1 (val), TimescaleUtilities (upval), u11 (val), Children (upval), ItemDrop (upval)
            -- upvalues: EmitterManager (upval), Shaker (upval)
            local Attribute
            local Start = a1.Model:WaitForChild("LeftLowerArm"):WaitForChild("Start")
            TimescaleUtilities.Wait(a4)
            u11.cannonFire:Play()
            for k, v in pairs(Start:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                elseif v:IsA("Sound") then
                    v:Play()
                end
            end
            local u49 = Children[(Random.new()):NextInteger(1, #Children)]:Clone()
            u49.Anchored = true
            u49.Parent = workspace.CurrentCamera
            local u57 = Random.new():NextNumber()
            ;(ItemDrop.Drop(Start.WorldPosition, a1_2, u49, a3.dtMultiplier, a3.gravity, a3.velocity, function(a1, a2, a3) -- Line: 379 -- upvalues: u57 (val)
                local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u57 + a1, 0, 0)
                return v1 - v1.Position
            end)):andThen(function(a1) -- Line: 383 -- upvalues: u49 (val), a1_2 (val), EmitterManager (upval), a2 (val), Shaker (upval)
                u49:Destroy()
                EmitterManager.Emit("BileExplosion", CFrame.new(a1 or a1_2), a2)
                Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
            end)
        end,
        Death = function() -- Line: 392
            -- upvalues: Animation (upval), a1 (val), TimescaleUtilities (upval), EmitterManager (upval), Shaker (upval)
            local u10 = Animation.new({
                Track = a1.Model.Animations.Death,
                Target = a1.Model.AnimationController,
            })
            u10:Play()
            local Smoke = a1.Model.Torso:WaitForChild("Smoke")
            local Spread = a1.Model.Torso:WaitForChild("Spread")
            Smoke.Enabled = true
            Spread.Enabled = true
            task.spawn(function() -- Line: 405
                -- upvalues: a1 (upval), TimescaleUtilities (upval), Spread (val), EmitterManager (upval)
                -- upvalues: Shaker (upval)
                local v1, v2, v3
                local v4 = {}
                local v5 = 0
                local v6 = 0
                for k, v in pairs(a1.Model:GetDescendants()) do
                    if v:IsA("BasePart") and v.Material == Enum.Material.Neon then
                        v4[v] = v.Color
                    end
                end
                repeat
                    v1 = Random.new():NextNumber(0.05, 0.15)
                    for k2, i in pairs(v4) do
                        if v6 % 2 ~= 0 then
                            k2.Color = i
                        else
                            k2.Color = Color3.new(0.1843137254901961, 0.13333333333333333, 0.15294117647058825)
                        end
                    end
                    TimescaleUtilities.Wait(v1)
                    v5 = v5 + v1
                    v6 = v6 + 1
                until v5 >= 4 and v6 % 2 ~= 0
                Spread.Enabled = false
                local ExtentsSize = a1.Model:GetExtentsSize()
                for j = 1, (Random.new():NextInteger(8, 12)) do
                    v2 = Vector3.new(
                        (Random.new()):NextNumber(-ExtentsSize.X / 2, ExtentsSize.X / 2),
                        (Random.new()):NextNumber(-ExtentsSize.Y / 3, ExtentsSize.Y / 3),
                        ((Random.new()):NextNumber(-ExtentsSize.Z / 2, ExtentsSize.Z / 2))
                    )
                    v3 = a1.Model.HumanoidRootPart.Position + v2
                    EmitterManager.Emit("ImpactExplosion", CFrame.new(v3), Random.new():NextNumber(2, 3))
                    Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
                    TimescaleUtilities.Wait(Random.new():NextNumber(0.1, 0.25))
                end
            end)
            task.defer(function() -- Line: 458 -- upvalues: u10 (val), TimescaleUtilities (upval)
                while u10.Controller.Length == 0 do
                    task.wait()
                end
                TimescaleUtilities.Wait(u10.Controller.Length * 0.95)
                u10.Controller:AdjustSpeed(0)
            end)
        end,
    }
end

return v1