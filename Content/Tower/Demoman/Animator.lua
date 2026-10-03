-- Script path: ReplicatedStorage.Content.Tower.Demoman.Animator
-- Decompile time: 7.60 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local InstanceUtil = require(ReplicatedStorage.Shared.Modules.InstanceUtil)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 26
    -- upvalues: SharedControllerFunctions (val), Animation (val), EasySound (val), TweenService (val)
    -- upvalues: EmitterManager (val), InstanceUtil (val), ItemDrop (val), EffectsController (val)
    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Arm"], a1.Model.Torso["Right Arm"]})
    end
    local Model = a1.Model
    local PrimaryPart = Model.PrimaryPart
    local AnimationController = Model:WaitForChild("AnimationController")
    local Fire = Model:WaitForChild("Animations"):WaitForChild("Fire")
    local u29 = RaycastParams.new()
    u29.FilterType = Enum.RaycastFilterType.Include
    u29.FilterDescendantsInstances = {
        workspace:WaitForChild("Ground"),
        workspace:WaitForChild("Cliff"),
        workspace:WaitForChild("Boundaries"),
        ((workspace:WaitForChild("Map")):WaitForChild("Environment")),
    }
    local u56 = nil

    local function getWeapon() -- Line: 49 -- upvalues: Model (val)
        local Weapon = Model:FindFirstChild("Weapon")
        return Weapon and Weapon:FindFirstChild("Weapon")
    end

    local function getWeaponConfig() -- Line: 54 -- upvalues: Model (val)
        local Weapon = Model:FindFirstChild("Weapon")
        local v1 = Weapon and Weapon:FindFirstChild("Weapon")
        return v1 and v1:FindFirstChild("Configuration")
    end

    local function getProjectileMdl() -- Line: 59 -- upvalues: a1 (val), Model (val)
        local Level = a1:GetLevel()
        local Weapon = Model:FindFirstChild("Weapon")
        local v1 = Weapon and Weapon:FindFirstChild("Weapon")
        local Weapon_2 = Model:FindFirstChild("Weapon")
        local v2 = Weapon_2 and Weapon_2:FindFirstChild("Weapon")
        local v3 = v2 and v2:FindFirstChild("Configuration")
        if v3 and v3:FindFirstChild("Shell") then
            return v3.Shell.Value
        end
        return Level >= 3 and v1:FindFirstChild("Shell") or v1:FindFirstChild("Handle")
    end

    local function getProjectileDelay() -- Line: 69 -- upvalues: Model (val)
        local Weapon = Model:FindFirstChild("Weapon")
        local v1 = Weapon and Weapon:FindFirstChild("Weapon")
        local v2 = v1 and v1:FindFirstChild("Configuration")
        if not v2 then
            return 0
        end
        local Shell = v2:FindFirstChild("Shell")
        if not Shell then
            return 0
        end
        local Attribute = Shell:GetAttribute("ProjectileDelay")
        if type(Attribute) == "number" then
            return Attribute
        end
        return 0
    end

    local function getCustomExplosion() -- Line: 88 -- upvalues: Model (val)
        local Weapon = Model:FindFirstChild("Weapon")
        local v1 = Weapon and Weapon:FindFirstChild("Weapon")
        local v2 = v1 and v1:FindFirstChild("Configuration")
        local Explosion = v2 and v2:FindFirstChild("Explosion")
        return Explosion and Explosion.Value
    end

    local function getFireAnimation(a1) -- Line: 94 -- upvalues: Fire (val) -- types: a1: number
        local Fire_2, v1
        local v2 = nil
        for i = 0, a1 do
            v1 = Fire:FindFirstChild((tostring(i)))
            Fire_2 = v1 and v1:FindFirstChild("Fire")
            if Fire_2 and Fire_2:IsA("Animation") then
                v2 = Fire_2
            end
        end
        return v2
    end

    local function fire() -- Line: 108
        -- upvalues: a1 (val), Model (val), u56 (ref), getFireAnimation (val), Animation (upval)
        -- upvalues: AnimationController (val), EasySound (upval), TweenService (upval), EmitterManager (upval)
        local Level = a1:GetLevel()
        local Weapon = Model:FindFirstChild("Weapon")
        local v1 = Weapon and Weapon:FindFirstChild("Weapon")
        local Weapon_2 = Model:FindFirstChild("Weapon")
        local v2 = Weapon_2 and Weapon_2:FindFirstChild("Weapon")
        local v3 = v2 and v2:FindFirstChild("Configuration")
        local Handle = v1:FindFirstChild("Handle")
        if not Handle then
            warn("No Handle found")
            return
        end
        local Value = v3 and v3.Start.Value or Handle:FindFirstChild("Start")
        if u56 then
            u56:Stop()
            u56 = nil
        end
        local v4 = getFireAnimation(Level)
        if not v4 then
            return
        end
        local v5 = Animation.new({Target = AnimationController, Track = v4}):Play()
        ;(v5:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 135 -- upvalues: a1 (upval), Model (upval), Handle (val), EasySound (upval)
            local v1 = a1.FBXModel and Model.PrimaryPart:FindFirstChild(a1_2) or Handle:FindFirstChild(a1_2)
            if v1 and v1:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = v1.SoundId,
                    parent = Handle,
                    playbackSpeed = Random.new():NextNumber(0.9, 1),
                })
            end
        end)
        ;(v5:GetMarkerReachedSignal("BallTransparency")):Connect(function(a1) -- Line: 151 -- upvalues: TweenService (upval), Handle (val)
            if a1 == 0 then
                TweenService:Create(Handle, TweenInfo.new(0.5), {Transparency = 0}):Play()
                return
            end
            Handle.Transparency = a1
        end)
        if Level < 3 then
            Handle.Transparency = 1
            v5.Ended:Once(function() -- Line: 161 -- upvalues: Handle (val)
                Handle.Transparency = 0
            end)
        end
        if Value then
            EmitterManager.manualEmit(Value)
        end
        local Value_2 = v3 and v3:FindFirstChild("Fire") and v3.Fire.Value or Handle:FindFirstChild("Fire")
        if Value_2 and Value_2:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = Value_2.SoundId,
                parent = Handle,
                playbackSpeed = (Random.new()):NextNumber(Value_2.PlaybackSpeed * 0.9, Value_2.PlaybackSpeed * 1.2),
            })
        end
    end

    local function aimAt(a1_2, a2) -- Line: 189
        -- upvalues: PrimaryPart (val), a1 (val), SharedControllerFunctions (upval)
        local Position = PrimaryPart.Position
        local v1 = (Position - a1_2).Magnitude / (a2 * 3)
        local v2 = (Position:lerp(a1_2, 0.5)) + Vector3.new(0, -v1, 0)
        a1:Face(a1_2)
        if not a1.FBXModel then
            SharedControllerFunctions.AimArmsAt(a1, v2)
            SharedControllerFunctions.AimHeadAt(a1, v2)
        end
    end

    a1.Executables = {
        Aim = function(a1_2, a2) -- Line: 204
            -- upvalues: a1 (val), Model (val), u56 (ref), Fire (val), Animation (upval), AnimationController (val)
            -- upvalues: aimAt (val), EasySound (upval)
            local Level = a1:GetLevel()
            local Weapon = Model:FindFirstChild("Weapon")
            local Handle = (Weapon and Weapon:FindFirstChild("Weapon")):FindFirstChild("Handle")
            if not Handle then
                warn("No Handle found")
                return
            end
            if u56 then
                u56:Stop()
                u56 = nil
            end
            if Handle then
                Handle.Transparency = 0
            end
            local Aim = (Level >= 2 and Fire:FindFirstChild("2") and Fire["2"] or Fire["0"]):FindFirstChild("Aim")
            if Aim then
                local v1 = Animation.new({Track = Aim, Target = AnimationController}):Play()
            end
            aimAt(a1_2, a2)
            if u56 then
                (u56:GetMarkerReachedSignal("Pause")):Connect(function() -- Line: 237 -- upvalues: u56 (upval)
                    u56:AdjustSpeed(0)
                end)
                ;(u56:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 242 -- upvalues: Handle (val), EasySound (upval)
                    local v1 = Handle:FindFirstChild(a1)
                    if v1 and v1:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            timeScaled = true,
                            id = v1.SoundId,
                            parent = Handle,
                            playbackSpeed = v1.PlaybackSpeed or 1,
                        })
                    end
                end)
            end
        end,
        Projectile = function(a1_2) -- Line: 258
            -- upvalues: Model (val), getProjectileMdl (val), a1 (val), aimAt (val), fire (val), InstanceUtil (upval)
            -- upvalues: ItemDrop (upval), u29 (val), EmitterManager (upval), EasySound (upval)
            -- upvalues: EffectsController (upval)
            local v1
            local Weapon = Model:FindFirstChild("Weapon")
            local v2 = Weapon and Weapon:FindFirstChild("Weapon")
            local Handle = v2:FindFirstChild("Handle")
            if not Handle then
                warn("No Handle found")
                return
            end
            local u21 = getProjectileMdl()
            if not u21 then
                return
            end
            local Value = if not a1.FBXModel then Handle:FindFirstChild("Start") else v2.Configuration.Start.Value
            local WorldPosition = Value and Value.WorldPosition or Handle.Position
            a1_2.start = WorldPosition
            if Value then
                aimAt(a1_2.goal, a1_2.gravity)
            end
            fire()

            local function launchProjectile() -- Line: 283
                -- upvalues: u21 (val), InstanceUtil (upval), ItemDrop (upval), a1_2 (val), Value (val), Model (upval)
                -- upvalues: u29 (upval), EmitterManager (upval), EasySound (upval), EffectsController (upval)
                local u3 = u21:Clone()
                u3.Anchored = true
                u3.Parent = workspace.CurrentCamera
                u3.Transparency = 0
                InstanceUtil.clearDescendantsByType(u3, {"Weld", "WeldConstraint"})
                local u19 = Random.new():NextNumber()
                ;(ItemDrop.Drop(a1_2.start, a1_2.goal, u3, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 299 -- upvalues: Value (upval), u19 (val)
                    return (if Value ~= nil then CFrame.lookAt(a3, a2) else (CFrame.lookAt(a2, a3)) * CFrame.Angles(u19 + a1, 0, 0)).Rotation
                end)):andThen(function() -- Line: 311
                    -- upvalues: u3 (val), Model (upval), a1_2 (upval), u29 (upval), EmitterManager (upval)
                    -- upvalues: EasySound (upval), EffectsController (upval)
                    u3:Destroy()
                    local Weapon = Model:FindFirstChild("Weapon")
                    local v1 = Weapon and Weapon:FindFirstChild("Weapon")
                    local v2 = v1 and v1:FindFirstChild("Configuration")
                    local Explosion = v2 and v2:FindFirstChild("Explosion")
                    local Value = Explosion and Explosion.Value
                    if not Value then
                        EffectsController.Explosion({Position = a1_2.goal, Radius = a1_2.radius, Sound = 4725504496})
                        return
                    end
                    v2 = Value:Clone()
                    v2.CanCollide = false
                    local goal = a1_2.goal
                    if Value:GetAttribute("LandOnGround") == true then
                        local v3 = workspace
                        local v4 = a1_2.goal + Vector3.new(0, 100, 0)
                        local v5 = u29
                        v3 = v3:Raycast(v4, Vector3.new(-0, -200, -0), v5)
                        goal = v3 and v3.Position + Vector3.new(0, 1, 0) * (v2.Size.Y / 2) or goal
                    end
                    v2.Position = goal
                    v2.Parent = workspace
                    v2.Anchored = true
                    EmitterManager.manualEmit(v2)
                    EasySound.Play({
                        id = 4725504496,
                        audioGroup = "Towers",
                        destroyOnEnd = true,
                        volume = 0.5,
                        parent = v2,
                    })
                    game.Debris:AddItem(v2, 2)
                end)
            end

            local Weapon_2 = Model:FindFirstChild("Weapon")
            local v3 = Weapon_2 and Weapon_2:FindFirstChild("Weapon")
            local v4 = v3 and v3:FindFirstChild("Configuration")
            if v4 then
                local Shell = v4:FindFirstChild("Shell")
                if Shell then
                    local Attribute = Shell:GetAttribute("ProjectileDelay")
                    v1 = if type(Attribute) ~= "number" then 0 else Attribute
                else
                    v1 = 0
                end
            else
                v1 = 0
            end
            if v1 > 0 then
                task.delay(v1, launchProjectile)
                return
            end
            launchProjectile()
        end,
    }
end

return v1