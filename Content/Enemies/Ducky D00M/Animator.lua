-- Script path: ReplicatedStorage.Content.Enemies.Ducky D00M.Animator
-- Decompile time: 10.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = {}
v1.__index = v1
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u38 = Random.new()

function v1.Initialize(a1) -- Line: 18
    -- upvalues: u38 (val), Shaker (val), GameState (val), TimescaleUtilities (val), Animation (val), Laser (val)
    -- upvalues: EffectsController (val)
    a1._random = u38:NextNumber()
    local root = a1.Model.HumanoidRootPart.root
    local torso = root.torso
    local CFrame = root.CFrame
    local Position = torso.Position
    local u14 = torso.CFrame - torso.CFrame.Position
    local u15 = nil
    local u16 = false
    local u17 = false
    local u18 = Vector3.new(0, 1.7999999523162842, 0)
    local duck = torso.duck
    local CFrame_2 = duck.CFrame
    local HumanoidRootPart = a1.Model.HumanoidRootPart
    HumanoidRootPart.Move:Play()
    HumanoidRootPart.Move2:Play()
    local u31 = u14
    torso.Position = Position - Vector3.new(0, 1.7999999523162842, 0)
    local Flak_L = a1.Model.Flak_L
    local Flak_R = a1.Model.Flak_R
    local Missile_L = a1.Model.Missile_L
    local Missile_R = a1.Model.Missile_R
    local u42 = {Flak_L.Fire1, Flak_L.Fire2, Flak_R.Fire1, Flak_R.Fire2}
    local u47 = {
        Missile_L.Fire1,
        Missile_L.Fire2,
        Missile_L.Fire3,
        Missile_L.Fire4,
        Missile_R.Fire1,
        Missile_R.Fire2,
        Missile_R.Fire3,
        Missile_R.Fire4,
    }
    local u56 = nil

    function a1.Face(a1) -- Line: 60 -- upvalues: torso (val), u31 (ref)
        Vector3.new(a1.X, torso.TransformedWorldCFrame.Position.Y, a1.Z)
        local v1 = Vector3.new(a1.X, torso.TransformedWorldCFrame.Position.Y, a1.Z)
        u31 = (torso.Parent.TransformedWorldCFrame:Inverse()) * CFrame.lookAt(torso.TransformedWorldCFrame.Position, v1)
    end

    local u59 = {HumanoidRootPart.Quack1, HumanoidRootPart.Quack2, HumanoidRootPart.Quack3}

    function a1.Quack() -- Line: 82 -- upvalues: u59 (val), u38 (upval), Shaker (upval)
        u59[u38:NextInteger(1, #u59)]:Play()
        Shaker:Shake({2, 5, 0.25, 0.5}, 1.25, 0.5)
    end

    local u64 = 0
    local u70 = u38:NextNumber(2, 4)
    local u72 = OverlapParams.new()
    u72.FilterType = Enum.RaycastFilterType.Include
    u72.MaxParts = 1
    u72.FilterDescendantsInstances = {workspace.Map:FindFirstChild("Destructibles", true)}
    local DestructibleParticles = game.ReplicatedStorage.Assets.Effects.Particles.DestructibleParticles

    function a1.OnStepFunction(a1_2) -- Line: 98
        -- upvalues: u17 (ref), u64 (ref), a1 (val), GameState (upval), u72 (val), DestructibleParticles (val)
        -- upvalues: u70 (ref), u38 (upval), u15 (ref), u31 (ref), u14 (val), u16 (ref), Position (val), u18 (ref)
        -- upvalues: torso (val), duck (val), CFrame_2 (val)
        local v1, v2
        if u17 then
            return
        end
        u64 = u64 + a1_2 * 2 * a1.Speed * GameState.TimeScale
        local v3 = CFrame.Angles(a1_2 * (a1.Speed * 2), 0, 0)
        local BackWheelsMotor6D = a1.Model.BackWheels.BackWheelsMotor6D
        BackWheelsMotor6D.C1 = BackWheelsMotor6D.C1 * v3
        local FrontWheelsMotor6D = a1.Model.FrontWheels.FrontWheelsMotor6D
        FrontWheelsMotor6D.C1 = FrontWheelsMotor6D.C1 * v3
        local PartBoundsInRadius = workspace:GetPartBoundsInRadius(a1.Model.PrimaryPart.Position, 4, u72)
        if PartBoundsInRadius and PartBoundsInRadius[1] then
            v1 = DestructibleParticles:FindFirstChild(PartBoundsInRadius[1].Parent.Name)
            if v1 then
                local Attribute
                v2 = v1:Clone()
                v2.Size = Vector3.new()
                v2:PivotTo((PartBoundsInRadius[1].Parent:GetModelCFrame()))
                v2.Parent = workspace.Trash
                for i, v in ipairs(v2:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        Attribute = v:GetAttribute("EmitCount")
                        v:Emit(Attribute)
                    elseif v:IsA("Sound") then
                        v:Play()
                    end
                end
                PartBoundsInRadius[1].Parent:Destroy()
                game.Debris:AddItem(v2, 10)
            end
        end
        u70 = u70 - a1_2
        if u70 <= 0 then
            u70 = u38:NextNumber(25, 36)
            a1.Quack()
        end
        if not u15 then
            u31 = u14
        else
            a1.Face(u15)
        end
        v1 = u16 and Position or Position - u18
        v2 = tick() * 3
        torso.CFrame = (torso.CFrame:Lerp(u31 - u31.Position + v1, a1_2 * 5)) * CFrame.new(0, math.abs((math.noise(u64 + a1._random, u64 * 0.5))) * 0.07, 0) * CFrame.Angles(math.noise(u64 + a1._random, u64 * 0.3) * 0.01, 0, math.noise(u64 + a1._random, u64 * 0.5) * 0.01)
        duck.CFrame = CFrame_2 * CFrame.new(0, math.cos(v2) * 0.1, 0) * CFrame.Angles(math.sin(v2) * 0.3, 0, 0)
    end

    local u90 = true
    local u91 = 1
    a1.Executables = {
        DamageBase = function() -- Line: 164 -- upvalues: a1 (val), TimescaleUtilities (upval)
            local Attribute
            game.ReplicatedStorage.Assets.Effects.Particles.CropParticles:FindFirstChild("Wheat"):Clone()
            local u25 = game.ReplicatedStorage.Assets.Effects.Particles.CropParticles:FindFirstChild("Wheat"):Clone()
            u25.Transparency = 1
            u25.CanCollide = false
            u25.CanQuery = false
            u25.Anchored = true
            u25:PivotTo((a1.Model:GetModelCFrame()))
            u25.Parent = workspace
            for k, v in pairs(u25:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    v:Emit(Attribute)
                elseif v:IsA("Sound") then
                    v:Play()
                end
            end
            TimescaleUtilities.Delay(15, function() -- Line: 186 -- upvalues: u25 (val)
                u25:Destroy()
            end)
        end,
        ChainsawStart = function(a1_2) -- Line: 190
            -- upvalues: u18 (ref), u15 (ref), u56 (ref), Animation (upval), a1 (val), HumanoidRootPart (val)
            local v1 = u18
            u18 = Vector3.new()
            u15 = Vector3.new(0.057999998331069946, 5.97599983215332, 0.5099999904632568)
            u56 = Animation.new({
                Track = a1.Model.Animations.Chainsaw,
                Target = a1.Model.AnimationController,
            }):Play()
            local u19 = false
            HumanoidRootPart.ChainsawStart:Play()
            HumanoidRootPart.ChainsawLoop:Play()
            ;(u56:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 207 -- upvalues: u19 (ref), u56 (upval)
                if u19 then
                    return
                end
                u19 = true
                u56:AdjustSpeed(0.005)
            end)
            a1:Delay(a1_2)
            u15 = nil
            u18 = v1
        end,
        ChainsawEnd = function(a1_2) -- Line: 222 -- upvalues: u18 (ref), HumanoidRootPart (val), u56 (ref), a1 (val)
            local v1 = u18
            u18 = Vector3.new()
            HumanoidRootPart.ChainsawLoop:Stop()
            HumanoidRootPart.ChainsawEnd:Play()
            u56:AdjustSpeed(-1)
            a1:Delay(a1_2)
            u18 = v1
        end,
        Rage = function(a1) -- Line: 235 -- upvalues: u16 (ref)
            u16 = true
        end,
        Fire = function(a1_2, a2, a3) -- Line: 238
            -- upvalues: u15 (ref), a1 (val), HumanoidRootPart (val), u42 (val), u38 (upval), Laser (upval)
            local v1
            u15 = a1_2
            local v2 = a3 * 0.5
            a1:Delay(a2 * 0.5)
            local torso = HumanoidRootPart.root.torso
            torso.Position = torso.Position + Vector3.new(0, 0, 0.5)
            a1.Model.Wings.Fire:Play()
            local v3, v4 = a2, a1_2
            for k, v in pairs(u42) do
                v.Flash:Emit(1)
                v.Spark:Emit(1)
                for i = 1, 3 do
                    v1 = {
                        Start = v.WorldPosition,
                        Pos = v4 + Vector3.new(u38:NextNumber(-v2, v2), u38:NextNumber(-v2, v2), (u38:NextNumber(-v2, v2))),
                        Color = BrickColor.new("Cork"),
                        Transparency = 0.1,
                        Size = 0.04,
                        Fade = 90,
                        Type = "Bullet",
                        Bullet = "Normal",
                    }
                    Laser:Cast(v1)
                end
            end
            a1:Delay(v3 * 0.5)
            u15 = nil
        end,
        Death = function() -- Line: 275 -- upvalues: u17 (ref), Animation (upval), a1 (val), HumanoidRootPart (val)
            u17 = true
            local u14 = Animation.new({
                Track = a1.Model.Animations.Die,
                Target = a1.Model.AnimationController,
            }):Play()
            local u15 = false
            ;(u14:GetMarkerReachedSignal("SmallDuck")):Connect(function() -- Line: 284 -- upvalues: u15 (ref), u14 (val), a1 (upval), HumanoidRootPart (upval)
                if u15 then
                    return
                end
                u15 = true
                u14:AdjustSpeed(0.01)
                local v1 = a1.Effect:Clone()
                v1.Parent = a1.Effect.Parent
                a1.Model.SmallDuck.Transparency = 1
                a1.Model.SmallDuckGlasses.Transparency = 1
                v1:PivotTo(HumanoidRootPart.root.torso.duck.TransformedWorldCFrame)
                for k, v in pairs(a1.Particles) do
                    v.Color = ColorSequence.new(Color3.new(245, 205, 48))
                    v:Emit(7)
                end
            end)
        end,
        Missiles = function(a1_2, a2, a3) -- Line: 304
            -- upvalues: u15 (ref), Animation (upval), a1 (val), EffectsController (upval), u47 (val)
            u15 = a3[1]
            local u17 = Animation.new({
                Track = a1.Model.Animations.Missile,
                Target = a1.Model.AnimationController,
            }):Play()
            local u18 = false
            ;(u17:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 313 -- upvalues: u18 (ref), u17 (val)
                if u18 then
                    return
                end
                u18 = true
                u17:AdjustSpeed(0.01)
            end)

            local function launchMissile(a1, a2_2, a3, a4, a5) -- Line: 322
                -- upvalues: EffectsController (upval), a2 (val)
                local p = a1.p
                local u8 = a1.LookVector * (a5 or 50)
                local u9 = a2_2 - p
                local u12 = a1.p - a1.lookVector
                local u13 = u12
                local u14 = 0
                local u23 = game.ReplicatedStorage.Assets.Effects.Projectile.DuckMissile:Clone()
                u23.Parent = workspace.Trash
                u23.Loop:Play()
                u23.Fire:Play()
                local u34 = nil
                local v1 = (game:GetService("RunService")).Heartbeat:connect(function(a1_2) -- Line: 337
                    -- upvalues: u14 (ref), a3 (val), u34 (ref), u23 (val), EffectsController (upval), a2_2 (val)
                    -- upvalues: a2 (upval), a1 (ref), u8 (ref), a5 (val), p (val), u9 (val), u12 (ref), a4 (val)
                    -- upvalues: u13 (ref)
                    u14 = u14 + a1_2
                    local v1 = (u14 / a3) ^ 1.5
                    if v1 >= 1 then
                        u34:disconnect()
                        u23:Destroy()
                        return EffectsController.Explosion({
                            Position = a2_2,
                            Radius = a2,
                            Color = BrickColor.new("Br. yellowish orange"),
                            Sound = 4725504496,
                            Material = Enum.Material.Neon,
                            Particles = true,
                            Visible = true,
                        })
                    end
                    a1 = a1:Lerp(CFrame.lookAt(Vector3.new(), (Vector3.new(0, 1, 0))), a1_2 * 0.5)
                    a1 = a1:Lerp(CFrame.lookAt(Vector3.new(), (Vector3.new(0, 1, 0))), a1_2 * 0.5)
                    u8 = a1.LookVector * (a5 or 50)
                    local v2 = math.sin(v1 * 3.141592653589793)
                    local v3 = math.cos(v1 * 1.8707963267948966 - 0.3)
                    local v4 = p + u9 * v1 + u8 * v2
                    local v5 = CFrame.new(u12, v4)
                    local Position = (v5 * CFrame.Angles(0, 0, 3.141592653589793 * v1 * a4) * CFrame.new(v2 * v3 * 10, 0, 0)).Position
                    local Position_2 = (v5 * CFrame.Angles(0, 0, 3.141592653589793 * v1 * a4) * CFrame.new(v2 * v3 * 10, 0, 0)).Position
                    u23.CFrame = CFrame.new(u13, Position_2)
                    u12 = v4
                    u13 = Position_2
                end)
            end

            a1:Delay(a1_2 * 0.5)
            task.spawn(function() -- Line: 388 -- upvalues: a3 (val), launchMissile (val), u47 (upval), a1 (upval)
                for i, v in ipairs(a3) do
                    launchMissile(u47[i].WorldCFrame, v, 2, 1, 15)
                    a1:Delay(0.1)
                end
            end)
            a1:Delay(a1_2 * 0.5)
            u17:AdjustSpeed(-1)
            u15 = nil
        end,
        Bullet = function(a1_2) -- Line: 400 -- upvalues: u90 (ref), u91 (ref), a1 (val), u15 (ref), Laser (upval)
            u90 = not u90
            u91 = u91 + 1
            if u91 > 4 then
                u91 = 1
            end
            local v1 = (a1.Model:FindFirstChild("Minigun_" .. (if not u90 then "R" else "L"))):FindFirstChild("Fire" .. u91)
            u15 = a1_2
            v1.Flash:Emit(1)
            v1.Smoke:Emit(1)
            local v2 = {
                Start = v1.WorldPosition,
                Pos = a1_2,
                Color = BrickColor.new("Cork"),
                Transparency = 0.1,
                Size = 0.04,
                Fade = 90,
                Type = "Bullet",
                Bullet = "Normal",
            }
            Laser:Cast(v2)
        end,
        Minigun = function(a1_2, a2) -- Line: 428 -- upvalues: u15 (ref), Animation (upval), a1 (val)
            u15 = a2.Position
            local u16 = Animation.new({
                Track = a1.Model.Animations.Missile,
                Target = a1.Model.AnimationController,
            }):Play()
            local u17 = false
            ;(u16:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 437 -- upvalues: u17 (ref), u16 (val)
                if u17 then
                    return
                end
                u17 = true
                u16:AdjustSpeed(0.01)
            end)
            a1:Delay(a1_2 * 0.5)
            a1.Model.HumanoidRootPart.MinigunFire:Play()
            a1:Delay(a1_2 * 0.5)
            a1.Model.HumanoidRootPart.MinigunFire:Stop()
            a1.Model.HumanoidRootPart.MinigunEnded:Play()
            u16:AdjustSpeed(-1)
            u15 = nil
        end,
        Quack = a1.Quack,
    }
end

return v1