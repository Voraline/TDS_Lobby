-- Script path: ReplicatedStorage.Content.NewEnemies.Molten Warlord.Animator
-- Decompile time: 9.13 ms

local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local AreaIndicatorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AreaIndicatorStore)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local CurrentCamera = workspace.CurrentCamera
local u76 = Random.new()
local v1 = {}
v1.__index = v1

local function toggleParticles(a1, a2) -- Line: 24 -- types: a2: boolean
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = a2
        end
    end
end

local function createFireball(a1, a2) -- Line: 32
    -- upvalues: ReplicatedStorage (val), CurrentCamera (val), spr (val), ItemDrop (val), EmitterManager (val)
    -- upvalues: Shaker (val)
    local u20
    if not (a2 >= 10) then
        u20 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.SmallFireball:Clone()
    else
        u20 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.Fireball:Clone()
        if not u20 then
            u20 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.SmallFireball:Clone()
        end
    end
    u20:ScaleTo(0.1)
    u20.Parent = CurrentCamera
    spr.target(u20, 0.6, 1, {Scale = a2 * 1.5})
    ;(ItemDrop.Drop(a1.startPosition, a1.endPosition, u20, a1.dtMultiplier, a1.gravity, a1.velocity, function(a1, a2, a3) -- Line: 47
        return CFrame.lookAt(a3, a2).Rotation
    end)):andThen(function() -- Line: 50
        -- upvalues: u20 (val), a2 (val), ReplicatedStorage (upval), a1 (val), CurrentCamera (upval)
        -- upvalues: EmitterManager (upval), Shaker (upval)
        u20:Destroy()
        local v1 = a2 >= 10 and ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.FireballExplosion:Clone() or ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.SmallFireballExplosion:Clone()
        v1:ScaleTo(a1.radius * 2)
        v1:PivotTo((CFrame.new(a1.endPosition)))
        v1.Parent = CurrentCamera
        EmitterManager.manualEmit(v1)
        Shaker:Shake({1, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = a1.endPosition})
    end)
end

function v1.Initialize(a1) -- Line: 68
    -- upvalues: StateManager (val), Shaker (val), EffectsController (val), u76 (val), TweenService (val)
    -- upvalues: Projectile (val), Animation (val), ReplicatedStorage (val), CurrentCamera (val), EmitterManager (val)
    -- upvalues: createFireball (val), toggleParticles (val), HttpService (val), AreaIndicatorStore (val)
    -- upvalues: TimescaleUtilities (val)
    local v1
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local HumanoidRootPart = a1.Model:WaitForChild("HumanoidRootPart")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    a1._effects = {
        CameraShake = function() -- Line: 76 -- upvalues: Shaker (upval), HumanoidRootPart (val), a1 (val)
            Shaker:Shake({0.2, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = HumanoidRootPart.Position})
            a1:_playSound("Step", 0.8, 1.2)
        end,
        ExplodeLimbs = function() -- Line: 83
            -- upvalues: EffectsController (upval), HumanoidRootPart (val), a1 (val), u76 (upval), TweenService (upval)
            -- upvalues: Projectile (upval)
            local v1, v2, v3, v4
            EffectsController.Explosion({Radius = 15, Position = HumanoidRootPart.Position})
            local Position = a1.Model:GetPivot().Position
            a1.Model:BreakJoints()
            for i, v in ipairs(a1.Model:GetChildren()) do
                if not v:IsA("BasePart") then
                    v:Destroy()
                elseif not string.match(v.Name, "Neon$") then
                    if not (v.Transparency < 1) then
                        v:Destroy()
                    else
                        v3 = v.Position - Position
                        v.Anchored = true
                        v.CanQuery = false
                        v.CanCollide = false
                        v.CanTouch = false
                        v.CollisionGroup = "Players"
                        local u57 = 0
                        local u61 = u76:NextNumber()
                        v4 = TweenService
                        v1 = TweenInfo.new(1)
                        v2 = {Transparency = 0, Color = Color3.fromRGB(78, 33, 35)}
                        v4:Create(v, v1, v2)
                        if v:IsA("MeshPart") and v.TextureID == "" then
                            v.Material = Enum.Material.Basalt
                        end
                        ;((Projectile:throwWithPhysics({
                            gravity = Vector3.new(-0, -30, -0),
                            start = v.Position,
                            velocity = v3 * u76:NextNumber(10, 20),
                            asset = v,
                            include = {
                                workspace:FindFirstChild("Map"),
                                workspace:FindFirstChild("Ground"),
                                (workspace:FindFirstChild("Cliff")),
                            },
                            rotation = function(a1) -- Line: 128 -- upvalues: u57 (ref), u61 (val) -- types: a1: vector
                                u57 = u57 + 0.1 * a1.Magnitude / 10
                                return CFrame.Angles(u61 + u57, u61 + u57, 0)
                            end,
                        })):andThen(function() -- Line: 133 -- upvalues: v (val)
                            v.CanCollide = true
                            v.Anchored = false
                        end)):catch(function() end)
                    end
                elseif string.match(v.Name, "^Fake") or not (v.Transparency < 1) then
                    v:Destroy()
                else
                    v3 = v.Position - Position
                    v.Anchored = true
                    v.CanQuery = false
                    v.CanCollide = false
                    v.CanTouch = false
                    v.CollisionGroup = "Players"
                    local u57 = 0
                    local u61 = u76:NextNumber()
                    v4 = TweenService
                    v1 = TweenInfo.new(1)
                    v2 = {Transparency = 0, Color = Color3.fromRGB(78, 33, 35)}
                    v4:Create(v, v1, v2)
                    if v:IsA("MeshPart") and v.TextureID == "" then
                        v.Material = Enum.Material.Basalt
                    end
                    ;((Projectile:throwWithPhysics({
                        gravity = Vector3.new(-0, -30, -0),
                        start = v.Position,
                        velocity = v3 * u76:NextNumber(10, 20),
                        asset = v,
                        include = {
                            workspace:FindFirstChild("Map"),
                            workspace:FindFirstChild("Ground"),
                            (workspace:FindFirstChild("Cliff")),
                        },
                        rotation = function(a1) -- Line: 128 -- upvalues: u57 (ref), u61 (val) -- types: a1: vector
                            u57 = u57 + 0.1 * a1.Magnitude / 10
                            return CFrame.Angles(u61 + u57, u61 + u57, 0)
                        end,
                    })):andThen(function() -- Line: 133 -- upvalues: v (val)
                        v.CanCollide = true
                        v.Anchored = false
                    end)):catch(function() end)
                end
            end
        end,
    }
    for i, v in ipairs(Animations:GetChildren()) do
        v1 = Animation.new({Track = v, Target = AnimationController})
        a1._animations[v.Name] = v1
    end
    a1._stateManager:addStates({
        {
            name = "Walk",
            onEnter = function() -- Line: 155 -- upvalues: a1 (val)
                a1:_trackAnimationEvents(a1.Replicator:Get("RageWalk") and a1._animations.RageWalk:Play() or a1._animations.Walk:Play())
            end,
        },
        {
            name = "HammerSlam",
            onEnter = function(a1_2, a2) -- Line: 163
                -- upvalues: a1 (val), HumanoidRootPart (val), EffectsController (upval), Shaker (upval)
                local v1
                local v2 = {0.6, 0.73, 0.67}
                local v3 = 0
                a1._animations.HammerSlam:Play()
                local v4 = HumanoidRootPart.CFrame - Vector3.new(0, a1.Height, 0)
                local v5 = a1_2 and Vector3.new(a1_2.X, v4.Position.Y, a1_2.Z)
                local v6 = v5 and CFrame.lookAt(v4.Position, v5) or v4
                local v7 = nil
                local v8 = a2
                for i = 1, 3 do
                    v1 = v6 * CFrame.Angles(0, math.rad(v3), 0) * CFrame.new(0, 0, -v8)
                    v7 = a1:_face(v1.Position, 0.5)
                    a1:_playSound("HammerSwing")
                    if a1:Wait(v2[i]) and not a1:IsAlive() then
                        return
                    end
                    a1:_playSound("HammerImpact")
                    EffectsController.GroundSmash(v1, v8 * 5)
                    Shaker:Shake({1.5, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = v5})
                    v3 = v3 + 120
                end
                a1:Wait(0.25)
                a1.Rotation = CFrame.new() * v7.Rotation
            end,
        },
        {
            name = "Fireball",
            onEnter = function(a1_2) -- Line: 206
                -- upvalues: a1 (val), ReplicatedStorage (upval), CurrentCamera (upval), EmitterManager (upval)
                -- upvalues: createFireball (upval)
                local Torso = a1.Model.Torso
                local v1 = a1:_face(a1_2.endPosition, 1)
                a1._animations.Fireball:Play()
                a1_2.startPosition = Torso.Position
                local v2 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.Charge:Clone()
                v2.Parent = CurrentCamera
                v2.Motor6D.Part0 = Torso
                EmitterManager.manualEmit(v2)
                a1:_playSound("FireballChargeUp")
                if a1:Wait(1) and not a1:IsAlive() then
                    return
                end
                a1:_playSound("FireballLaunch")
                createFireball(a1_2, 2)
                a1:Wait(0.5)
                v2:Destroy()
                a1.Rotation = CFrame.new() * v1.Rotation
            end,
        },
        {
            name = "EruptionSlam",
            onEnter = function(a1_2) -- Line: 236 -- upvalues: a1 (val) -- types: a1_2: vector
                local v1 = a1:_face(a1_2)
                a1._animations.EruptionSlam:Play()
                a1:_playSound("EruptionScream")
                a1:Wait(2.25)
                a1.Rotation = CFrame.new() * v1.Rotation
            end,
        },
        {
            name = "MoltenRain",
            onEnter = function(a1_2) -- Line: 246 -- upvalues: a1 (val)
                a1:_playSound("Scream")
                a1._animations.MoltenRain:Play()
            end,
        },
        {
            name = "WarCry",
            onEnter = function() -- Line: 253 -- upvalues: a1 (val), Shaker (upval), toggleParticles (upval)
                a1._animations.WarCry:Play()
                a1:Wait(1)
                a1:_playSound("Scream")
                Shaker:Shake({3, 10, 0, 1.5}, 1, 1, {radius = 100, position = a1.Model.PrimaryPart.Position})
                toggleParticles(a1.Model.Head.Scream, true)
                a1:Wait(2)
                toggleParticles(a1.Model.Head.Scream, false)
            end,
        },
        {
            name = "RageMode",
            onEnter = function() -- Line: 268 -- upvalues: a1 (val), Shaker (upval), toggleParticles (upval)
                a1._animations.RageMode:Play()
                a1:Wait(2.5)
                a1:_playSound("Rage")
                Shaker:Shake({3, 10, 0, 1.5}, 1, 1, {radius = 100, position = a1.Model.PrimaryPart.Position})
                toggleParticles(a1.Model.Head.Scream, true)
                a1:Wait(2.5)
                toggleParticles(a1.Model.Head.Scream, false)
                a1.Model.Mask.Transparency = 1
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 284 -- upvalues: a1 (val), u76 (upval), EffectsController (upval), HumanoidRootPart (val)
                local v1
                a1:_trackAnimationEvents((a1._animations.Death:Play()))
                a1:_playSound("Death")
                a1:Wait(1.5)
                for i = 1, 5 do
                    v1 = Vector3.new(u76:NextNumber(-4, 4), u76:NextNumber(-4, 4), (u76:NextNumber(-4, 4)))
                    EffectsController.Explosion({
                        Sound = 72893177488770,
                        Position = HumanoidRootPart.Position + v1,
                        Radius = u76:NextNumber(5, 7),
                    })
                    a1:Wait(0.25)
                end
            end,
        },
    })
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 309 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        AreaIndicator = function(a1, a2, a3, a4) -- Line: 312
            -- upvalues: HttpService (upval), AreaIndicatorStore (upval), TimescaleUtilities (upval)
            local v1 = HttpService:GenerateGUID(false)
            local v2 = a4 or Color3.fromRGB(255, 0, 64)
            AreaIndicatorStore.create(v1, {
                type = "full",
                fadeInTime = 0.5,
                radius = a1,
                color3 = v2,
                position = a2,
                tweenInfo = TweenInfo.new(a3),
                lifeTime = a3,
            })
            TimescaleUtilities.Wait(a3 + 0.25)
            AreaIndicatorStore.remove(v1)
        end,
        Eruption = function(a1, a2) -- Line: 335
            -- upvalues: ReplicatedStorage (upval), CurrentCamera (upval), EffectsController (upval)
            -- upvalues: EmitterManager (upval), Shaker (upval), TimescaleUtilities (upval)
            local v1 = CFrame.new(a1)
            local v2 = ReplicatedStorage.Assets.Effects.Mob.MoltenWarlord.Eruption:Clone()
            v2:ScaleTo(a2 * 1.75)
            v2:PivotTo(v1)
            v2.Parent = CurrentCamera
            EffectsController.GroundSmash(v1, a2 * 7.5)
            EmitterManager.manualEmit(v2)
            Shaker:Shake({1.5, 7, 0, 1.5}, 0.5, 1, {radius = 100, position = v1.Position})
            TimescaleUtilities.Wait(4)
            v2:Destroy()
        end,
        MoltenRain = function(a1) -- Line: 354 -- upvalues: TimescaleUtilities (upval), createFireball (upval)
            for i, v in ipairs(a1) do
                TimescaleUtilities.Delay(v.delay, function() -- Line: 356 -- upvalues: createFireball (upval), v (val)
                    createFireball(v, 1)
                end)
            end
        end,
    }
    a1._stateManager:changeState("Walk")
end

function v1._trackAnimationEvents(a1, a2) -- Line: 366 -- types: a1: table, a2: userdata
    local u11 = (a2:GetMarkerReachedSignal("Effect")):Connect(function(a1_2) -- Line: 368 -- upvalues: a1 (val) -- types: a1_2: string
        local v1 = a1._effects[a1_2]
        if v1 then
            v1()
        end
    end)
    a2.Ended:Connect(function() -- Line: 374 -- upvalues: u11 (ref)
        u11:Disconnect()
    end)
end

function v1:_face(a2, a3) -- Line: 379 -- upvalues: TweenService (val) -- types: self: table, a2: vector, a3: number
    local Position = self.Model.PrimaryPart.Position
    local v1 = CFrame.new(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
    TweenService:Create(self.Model.PrimaryPart, TweenInfo.new(a3 or 0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {CFrame = v1}):Play()
    return v1
end

function v1:_playSound(a2, a3, a4) -- Line: 397
    -- upvalues: u76 (val), GameState (val)
    local v1 = self.Model.PrimaryPart:FindFirstChild(a2)
    if v1 then
        v1.PlaybackSpeed = (a3 and a4 and u76:NextNumber(a3, a4) or 1) * GameState.TimeScale
        v1:Play()
    end
end

return v1