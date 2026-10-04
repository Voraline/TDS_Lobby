-- Script path: ReplicatedStorage.Content.NewEnemies.Frost Champion.Animator.FrostChampionAnimatorStates
-- Decompile time: 7.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Modules = ReplicatedStorage.Shared.Modules
local Modules_2 = ReplicatedStorage.Client.Modules
local Bezier = require(Modules.Bezier)
local EasySound = require(Modules.EasySound)
local EmitterManager = require(Modules.EmitterManager)
local GameState = require(Modules.GameState)
local NewTween = require(Modules.NewTween)
local Shaker = require(Modules_2.Shaker)
require(Modules_2.StateManager)
local FrostChampion = ReplicatedStorage.Assets.Effects.Mob.FrostChampion

local function setupThrownBannerCollision(a1) -- Line: 20 -- types: a1: userdata
    if a1:IsA("BasePart") then
        a1.Anchored = true
        a1.CanCollide = false
        a1.CanQuery = false
        a1.CanTouch = false
    end
    for i, j in a1:GetDescendants() do
        if j:IsA("BasePart") then
            j.Anchored = true
            j.CanCollide = false
            j.CanQuery = false
            j.CanTouch = false
        end
    end
end

local function getBeamTransparencies(a1) -- Line: 40 -- types: a1: userdata
    local v1 = {}
    for i, j in a1:GetDescendants() do
        if j:IsA("Beam") then
            v1[j] = j.Transparency
        end
    end
    return v1
end

local function setBeamTransparency(a1, a2, a3) -- Line: 50 -- types: a1: userdata, a2: number, a3: table
    local Time, new, v1, v2, v3
    local v4 = math.clamp(a2, 0, 1)
    for i, j in a1:GetDescendants() do
        if j:IsA("Beam") then
            v2 = a3[j]
            v3 = table.create(#v2.Keypoints)
            for k, n in v2.Keypoints do
                new = NumberSequenceKeypoint.new
                Time = n.Time
                v1 = math.lerp(n.Value, 1, v4)
                v3[k] = (new(Time, v1, n.Envelope * (1 - v4)))
            end
            j.Transparency = NumberSequence.new(v3)
        end
    end
end

local function getBannerApex(a1, a2, a3, a4) -- Line: 72 -- types: a1: vector, a2: vector, a3: number, a4: number
    return (a1:Lerp(a2, 0.5)) + Vector3.new(0, 1, 0) * a4 * a3
end

local v1 = {
    name = "FrozenBanner",
    onEnter = function(a1, a2, a3) -- Line: 90
        -- upvalues: GameState (val), EasySound (val), setupThrownBannerCollision (val), Bezier (val), RunService (val)
        -- upvalues: TweenService (val), Shaker (val), FrostChampion (val), getBeamTransparencies (val)
        -- upvalues: setBeamTransparency (val), EmitterManager (val), NewTween (val)
        local v1, v2, v3, v4, v5
        local FrozenBanner = a1.Stats.Moveset.FrozenBanner
        local PrimaryPart = a1.Model.PrimaryPart
        local Value = a1.Model.BannerBone.Value
        local v6 = a2 + Vector3.new(0, 3, 0)
        local Position = Value.TransformedWorldCFrame.Position
        local ThrowPower = FrozenBanner.ThrowPower
        local v7 = (Position:Lerp(v6, 0.5)) + Vector3.new(0, 1, 0) * ThrowPower * a3
        local v8 = v7 - a1._upperTorsoBone.TransformedWorldCFrame.Position
        a1._bannerAimSpring:setGoal((CFrame.Angles(math.atan2(v8.Y, (Vector3.new(v8.X, 0, v8.Z)).Magnitude), 0, 0)))
        a1._animations.Walk:Stop(0.3)
        a1:Face(a2, (TweenInfo.new(0.5)))
        local BannerWindUp = a1._animations.BannerWindUp
        BannerWindUp:AdjustSpeed(BannerWindUp.Controller.Length / FrozenBanner.BannerWindupTime * GameState.TimeScale)
        BannerWindUp:Play()
        a1:Delay(FrozenBanner.BannerWindupTime)
        a1._animations.BannerThrow:Play()
        EasySound.Play({id = 81283152768143, destroyOnEnd = true, soundGroupName = "Enemies", parent = PrimaryPart})
        a1:Delay(FrozenBanner.BannerThrowDelay)
        a1._bannerAimSpring:setGoal(CFrame.identity)
        local Banner = a1.Model:WaitForChild("Banner")
        local TransformedWorldCFrame_2 = Value.TransformedWorldCFrame
        local Position_2 = TransformedWorldCFrame_2.Position
        local v9 = Banner:Clone()
        local Motor6D = v9:FindFirstChildOfClass("Motor6D")
        if Motor6D then
            Motor6D:Destroy()
        end
        setupThrownBannerCollision(v9)
        v9.CFrame = TransformedWorldCFrame_2
        v9.Transparency = 0
        v9.Parent = workspace.CurrentCamera
        a1.Maid:Mark(v9)
        Banner.Transparency = 1
        local v10 = Bezier.new(Position_2, v7, v6)
        local v11 = 0
        local v12 = 0
        local v13 = Position_2
        local v14 = 0
        local v15 = math.max(a3, 0.016666666666666666)
        local v16 = a2
        while v12 < 1 do
            v1 = RunService.RenderStepped:Wait()
            if not v9.Parent then
                return
            end
            v2 = v1 * GameState.TimeScale
            v11 = v11 + v2
            v12 = math.min(v11 / v15, 1)
            v3 = 1 - (TweenService:GetValue(v12, Enum.EasingStyle.Sine, Enum.EasingDirection.Out))
            v14 = v14 + 12.566370614359172 * v2 * v3
            v4 = v10:Get(v12)
            if v4 ~= v13 then
                v5 = CFrame.Angles(v14, 0, 0)
                v9:PivotTo(((CFrame.lookAt(v13, v4)) * (CFrame.fromEulerAnglesYXZ(1.5707963267948966, 1.5707963267948966, 0)) * v5).Rotation + v4)
            end
        end
        EasySound.Play({id = 115069517614734, destroyOnEnd = true, soundGroupName = "Enemies", parent = v9})
        Shaker:Shake({0.8, 10, 0.05, 1.5}, 0.35, 1, {radius = 90, position = v16})
        Banner.Transparency = 0
        v1 = FrostChampion.FlagArea:Clone()
        local Model = Instance.new("Model")
        Model.Name = "FlagArea"
        v1.Anchored = true
        v1.CanCollide = false
        v1.CanQuery = false
        v1.CanTouch = false
        v1.Parent = Model
        Model.PrimaryPart = v1
        local u254 = getBeamTransparencies(Model)
        local BeamTop = v1:FindFirstChild("BeamTop")
        local X_2 = if not BeamTop then nil else BeamTop.Position.X
        Model:ScaleTo(FrozenBanner.BannerRadius * 2 * 0.05)
        if BeamTop and X_2 then
            BeamTop.Position = Vector3.new(X_2, BeamTop.Position.Y, BeamTop.Position.Z)
        end
        Model:PivotTo((CFrame.new(v16.X, v16.Y + 0.001, v16.Z)) * v1.CFrame.Rotation)
        setBeamTransparency(Model, 1, u254)
        EmitterManager.toggle(Model, false, "ParticleEmitter")
        Model.Parent = workspace.CurrentCamera
        EmitterManager.toggle(Model, true, "ParticleEmitter")
        NewTween(Model, TweenInfo.new(0.5), function(a1) -- Line: 220 -- upvalues: setBeamTransparency (upval), Model (val), u254 (val)
            setBeamTransparency(Model, 1 - a1, u254)
        end)
        local u332 = EasySound.Play({
            id = 76505350284876,
            looped = true,
            soundGroupName = "Enemies",
            volume = 0.25,
            parent = Model.PrimaryPart,
        })
        local u333 = false

        local function cleanupBannerVFX() -- Line: 232
            -- upvalues: u333 (ref), u332 (val), EmitterManager (upval), Model (val), getBeamTransparencies (upval)
            -- upvalues: NewTween (upval), setBeamTransparency (upval), a1 (val)
            if u333 then
                return
            end
            u333 = true
            u332:Destroy()
            EmitterManager.toggle(Model, false, "ParticleEmitter")
            local u14 = getBeamTransparencies(Model)
            NewTween(Model, TweenInfo.new(2), function(a1) -- Line: 241 -- upvalues: setBeamTransparency (upval), Model (upval), u14 (val)
                setBeamTransparency(Model, a1, u14)
            end)
            a1:Delay(2)
            Model:Destroy()
        end

        a1.Maid:Mark(cleanupBannerVFX)
        task.spawn(function() -- Line: 249 -- upvalues: a1 (val), FrozenBanner (val), cleanupBannerVFX (val)
            a1:Delay(FrozenBanner.BannerLifetime)
            cleanupBannerVFX()
        end)
    end,
}
local v2 = {
    name = "Summon",
    onEnter = function(a1) -- Line: 258 -- upvalues: EasySound (val), EmitterManager (val)
        a1._animations.Walk:Stop(0.3)
        a1._animations.Summon:Play()
        EasySound.Play({
            id = 113231626975707,
            name = "Summon",
            volume = 1,
            destroyOnEnd = true,
            soundGroupName = "Enemies",
            parent = a1.Model.PrimaryPart,
        })
        a1:Wait(a1.Stats.Moveset.Summon.Delay)
        EmitterManager.manualEmit(a1.Model.SpawnEffect)
    end,
}
local v3 = {
    name = "SpearThrust",
    onEnter = function(a1, a2) -- Line: 278
        -- upvalues: EasySound (val), FrostChampion (val), getBeamTransparencies (val), setBeamTransparency (val)
        -- upvalues: NewTween (val), Shaker (val)
        local SpearThrust = a1.Stats.Moveset.SpearThrust
        local PrimaryPart = a1.Model.PrimaryPart
        local IntroTime = SpearThrust.IntroTime
        a1._animations.Walk:Stop(0.3)
        a1:Face(a2, (TweenInfo.new(0.5)))
        local SpearWindUp = a1._animations.SpearWindUp
        SpearWindUp:AdjustSpeed(SpearWindUp.Controller.Length / IntroTime)
        SpearWindUp:Play()
        EasySound.Play({id = 88251306556118, destroyOnEnd = true, soundGroupName = "Enemies", parent = PrimaryPart})
        local HitboxSize = SpearThrust.HitboxSize
        local u41 = FrostChampion.SpearIndicator:Clone()
        u41.Anchored = true
        u41.CanCollide = false
        u41.CanQuery = false
        u41.CanTouch = false
        u41.Size = Vector3.new(HitboxSize.X, 0.001, HitboxSize.Z)
        local v1 = u41["1"]
        local v2 = u41["2"]
        v1.CFrame = (CFrame.new(0, 0, -HitboxSize.Z / 2)) * v1.CFrame.Rotation
        v2.CFrame = (CFrame.new(0, 0, HitboxSize.Z / 2)) * v2.CFrame.Rotation
        u41.CFrame = (CFrame.lookAlong(PrimaryPart.Position, (a2 - PrimaryPart.Position) * Vector3.new(1, 0, 1))) * CFrame.new(0, PrimaryPart.Node.CFrame.Y + 0.1, -HitboxSize.Z / 2)
        u41.Parent = workspace.CurrentCamera
        local u95 = getBeamTransparencies(u41)
        setBeamTransparency(u41, 1, u95)
        NewTween(u41, TweenInfo.new(IntroTime), function(a1) -- Line: 320 -- upvalues: setBeamTransparency (upval), u41 (val), u95 (val)
            setBeamTransparency(u41, 1 - a1, u95)
        end)
        a1:Delay(IntroTime)
        a1._animations.SpearStab:Play()
        EasySound.Play({id = 135833058688585, destroyOnEnd = true, soundGroupName = "Enemies", parent = PrimaryPart})
        Shaker:Shake({0.5, 12, 0.05, 1.5}, 0.25, 1, {radius = 95, position = PrimaryPart.Position})
        task.spawn(function() -- Line: 340
            -- upvalues: a1 (val), SpearThrust (val), NewTween (upval), u41 (val), setBeamTransparency (upval)
            -- upvalues: u95 (val)
            a1:Delay(SpearThrust.MoveDuration)
            NewTween(u41, TweenInfo.new(SpearThrust.OutroTime), function(a1) -- Line: 344 -- upvalues: setBeamTransparency (upval), u41 (upval), u95 (upval)
                setBeamTransparency(u41, a1, u95)
            end, function() -- Line: 346 -- upvalues: u41 (upval)
                u41:Destroy()
            end)
        end)
    end,
}
return {
    Walking = {
        name = "Walking",
        onEnter = function(a1) -- Line: 83
            a1._animations.Walk:Play()
        end,
    },
    FrozenBanner = v1,
    Summon = v2,
    SpearThrust = v3,
    Death = {
        name = "Death",
        onEnter = function(a1) -- Line: 355
            a1._animations.Walk:Stop(0.3)
            a1._animations.Death:Play()
        end,
    },
}