-- Script path: ReplicatedStorage.Content.Tower.Rocketeer.Animator
-- Decompile time: 10.90 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ProjectilePool = require(ReplicatedStorage.Shared.Modules.ProjectilePool)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u41 = {Duck = true, Ghost = true}
local v1 = {}
v1.__index = v1
local u46 = Random.new()

local function stepProjDefault(a1) -- Line: 39
    local v1 = a1.elapsedTime / a1.timeToDest
    if v1 > 1 then
        v1 = 1
    end
    local v2 = a1.start:Lerp(a1.goal, v1)
    local v3 = math.sin(v1 * 3.141592653589793)
    local v4 = math.min(v3 * 2, 1)
    local v5 = (a1.elapsedTime + a1._podPow) * 8
    local _peakOffsetX = a1._peakOffsetX
    local _height = a1._height
    local v6 = math.sin(v5 * 1.75)
    local v7 = math.sin(v5)
    local v8 = CFrame.new((v6 + _peakOffsetX) * v4, _height * v3 + v7 * v4, 0)
    local v9 = CFrame.new(v2) * v8
    return CFrame.lookAlong(v9.Position, (v9.Position - a1.lastCFrame.Position).Unit)
end

local function duckStepProj(a1) -- Line: 63
    local v1 = math.min(a1.elapsedTime / a1.timeToDest, 1)
    local v2 = a1.podNumber or 0
    local v3 = a1.start:Lerp(a1.goal, v1)
    local v4 = (a1.start - a1.goal).Magnitude / 8
    local v5 = math.sin(v1 * 3.141592653589793)
    local v6 = CFrame.new(0, (v4 + (if not (v2 > 2) then 1 else 0)) * v5, 0)
    local v7 = CFrame.new(v3) * v6
    return (CFrame.lookAlong(v7.Position, (v7.Position - a1.lastCFrame.Position).Unit)) * CFrame.Angles(math.rad(-1080 * a1.timeToDest * v1), 0, 0)
end

local function defaultOnFinish(a1) -- Line: 77
    -- upvalues: EmitterManager (val), EasySound (val), EffectsController (val)
    local v1
    local skinName = a1.skinName
    local explosionSound = a1.explosionSound
    local upgrade = a1.upgrade
    local explosionRadius = a1.explosionRadius
    if skinName == "Lunar" then
        EmitterManager.Emit("RocketeerLunarExplosion", CFrame.new(a1.goal), explosionRadius, 1, true, "Towers")
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = explosionSound,
            position = a1.goal,
        })
        return
    end
    if skinName == "Lovestriker" then
        if not (upgrade < 4) then
            EmitterManager.Emit("LovestrikerExplosionMax", CFrame.new(a1.goal))
        else
            EmitterManager.Emit("LovestrikerExplosionBase", CFrame.new(a1.goal))
        end
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = explosionSound,
            position = a1.goal,
        })
        return
    end
    if skinName == "Pumpkin" then
        EmitterManager.Emit("PumpkinExplosion", CFrame.new(a1.goal), explosionRadius * 0.5, 1, true, "Towers")
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = explosionSound,
            position = a1.goal,
        })
        return
    end
    if skinName == "Duck" then
        local v2
        if not (upgrade >= 4) then
            v2 = "DuckRocketeerBaseExplosion"
        else
            local podNumber = a1.podNumber
            v2 = ("DuckRocketeerMaxExplosion%*"):format(if podNumber ~= 2 then if podNumber ~= 1 then "Pink" else "Green" else "Blue")
        end
        EmitterManager.Emit(v2, CFrame.new(a1.goal), explosionRadius / 2, 1, true, "Towers")
        return
    end
    if skinName == "Ghost" then
        local Emit_4 = EmitterManager.Emit
        v1 = CFrame.new(a1.goal)
        Emit_4(
            if not (upgrade >= 4) then "GhostRocketeerBaseExplosion" else "GhostRocketeerMaxExplosion",
            v1,
            explosionRadius / 2,
            1,
            true,
            "Towers"
        )
        EasySound.Play({
            soundGroupName = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = explosionSound,
            position = a1.goal,
        })
        return
    end
    if skinName == "Leprechaun" then
        local Emit_5 = EmitterManager.Emit
        v1 = CFrame.new(a1.goal)
        Emit_5(
            if not (upgrade >= 4) then "LeprechaunRocketeerBaseExplosion" else "LeprechaunRocketeerMaxExplosion",
            v1,
            explosionRadius / 2,
            1,
            true,
            "Towers"
        )
        EasySound.Play({
            soundGroupName = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = explosionSound,
            position = a1.goal,
        })
        return
    end
    if skinName ~= "Beach" then
        EffectsController.Explosion({Position = a1.goal, Radius = explosionRadius, Sound = explosionSound})
        return
    end
    local Emit_6 = EmitterManager.Emit
    v1 = CFrame.new(a1.goal)
    Emit_6(
        if not (upgrade >= 4) then "BeachRocketeerBaseExplosion" else "BeachRocketeerMaxExplosion",
        v1,
        explosionRadius / 2,
        1,
        true,
        "Towers"
    )
    EasySound.Play({
        soundGroupName = "Towers",
        destroyOnEnd = true,
        timeScaled = true,
        id = explosionSound,
        position = a1.goal,
    })
end

function v1.Initialize(a1) -- Line: 212
    -- upvalues: u41 (val), EasySound (val), u46 (val), EmitterManager (val), TweenService (val), GameState (val)
    -- upvalues: stepProjDefault (val), duckStepProj (val), ProjectilePool (val), defaultOnFinish (val)
    -- upvalues: CustomProjectile (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local Name = a1.Model.Name
    if not u41[Name] and not a1.FBXModel then
        local RootJoint = PrimaryPart.RootJoint
        local v1 = a1.Model.Torso["Right Hip"]
        local v2 = a1.Model.Torso["Left Hip"]
        local v3 = {}
        v3[RootJoint] = RootJoint.C0
        v3[v1] = v1.C0
        v3[v2] = v2.C0
        a1._motorData = v3
    end
    a1._skinName = Name
    a1._animationEvents = {
        Fire = function() -- Line: 230
            -- upvalues: a1 (val), Name (val), PrimaryPart (val), EasySound (upval), u46 (upval), EmitterManager (upval)
            local Value, v1, v2
            local v3 = a1:_getHandle()
            local Configuration = v3 and v3:FindFirstChild("Configuration")
            local v4 = a1.Replicator:Get("Upgrade")
            if Name == "Duck" then
                v1 = PrimaryPart[("Fire%*"):format(if not (v4 >= 1) then v4 else if not (v4 < 3) then v4 else 1)]
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = v1.SoundId,
                    parent = v3,
                })
                return
            end
            v1 = v4 >= 4 and PrimaryPart:FindFirstChild("FireMax") or PrimaryPart:FindFirstChild("Fire")
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v1.SoundId,
                parent = v3,
                volume = PrimaryPart.Fire.Volume,
                playbackSpeed = u46:NextNumber(0.9, 1.1),
            })
            local Fire2 = PrimaryPart:FindFirstChild("Fire2")
            if Fire2 then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = Fire2.SoundId,
                    parent = v3,
                    volume = Fire2.Volume,
                    playbackSpeed = u46:NextNumber(0.9, 1.1),
                })
            end
            if a1.Replicator:Get("Upgrade") ~= 4 then
                local Value_2 = Configuration and Configuration.Start["1"].Value or v3.Start
                EmitterManager.manualEmit(Value_2)
                return
            end
            for i = 1, 4 do
                v2 = Configuration and Configuration.Start:FindFirstChild((tostring(i)))
                Value = v2 and v2.Value or v3:FindFirstChild((("Start%*"):format(i)))
                if Value then
                    EmitterManager.manualEmit(Value)
                end
            end
        end,
        Reload = function() -- Line: 289
            -- upvalues: a1 (val), u41 (upval), Name (val), EasySound (upval), PrimaryPart (val), u46 (upval)
            local v1 = a1:_getHandle()
            local v2 = a1.Replicator:Get("Upgrade")
            if not u41[Name] then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = PrimaryPart.Reload.SoundId,
                    parent = v1,
                    volume = PrimaryPart.Reload.Volume,
                    playbackSpeed = u46:NextNumber(0.9, 1.1),
                })
                return
            end
            local v3 = PrimaryPart[("Reload%*"):format(if not (v2 >= 1) then v2 else if not (v2 < 3) then v2 else 1)]
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v3.SoundId,
                parent = v1,
                volume = v3.Volume,
                playbackSpeed = u46:NextNumber(0.9, 1.1),
            })
        end,
        ShowAmmo = function() -- Line: 316 -- upvalues: a1 (val), Name (val), TweenService (upval)
            local v1
            local v2 = a1:_getHandle()
            local Configuration = v2 and v2:FindFirstChild("Configuration")
            local Ammo = Configuration and Configuration:FindFirstChild("Ammo")
            if Ammo and Ammo:IsA("ObjectValue") and Ammo.Value and Ammo.Value:IsA("BasePart") then
                Ammo.Value.Transparency = 0
                return
            end
            if Name == "Duck" then
                for j = 1, 4 do
                    v1 = a1.Model.Weapon:FindFirstChild((("Ammo%*"):format(j)))
                    if v1 then
                        v1.Transparency = 0
                    end
                end
                return
            end
            if Name ~= "Ghost" then
                a1.Model.Weapon.Weapon.Ammo.Transparency = 0
                return
            end
            for i = 1, 4 do
                v1 = a1.Model.Weapon:FindFirstChild((("Ammo%*"):format(i)))
                if v1 then
                    v1.Transparency = 0
                    TweenService:Create(v1, TweenInfo.new(1.3), {Transparency = 1}):Play()
                end
            end
        end,
        HideAmmo = function() -- Line: 342 -- upvalues: a1 (val), Name (val)
            local v1
            local v2 = a1:_getHandle()
            local Configuration = v2 and v2:FindFirstChild("Configuration")
            local Ammo = Configuration and Configuration:FindFirstChild("Ammo")
            if Ammo and Ammo:IsA("ObjectValue") and Ammo.Value and Ammo.Value:IsA("BasePart") then
                Ammo.Value.Transparency = 1
                return
            end
            if Name ~= "Duck" and Name ~= "Ghost" then
                a1.Model.Weapon.Weapon.Ammo.Transparency = 1
                return
            end
            for i = 1, 4 do
                v1 = a1.Model.Weapon:FindFirstChild((("Ammo%*"):format(i)))
                if v1 then
                    v1.Transparency = 1
                end
            end
        end,
    }
    for k, v in pairs(a1.Animations.Fire) do
        v:Load()
        ;(v.Controller:GetMarkerReachedSignal("Effect")):Connect(function(a1_2) -- Line: 366 -- upvalues: a1 (val) -- types: a1_2: string
            local v1 = a1._animationEvents[a1_2]
            if v1 then
                v1()
            end
        end)
    end
    a1.Executables = {
        FireMissiles = function(a1_2) -- Line: 375
            -- upvalues: a1 (val), u41 (upval), Name (val), GameState (upval), stepProjDefault (upval)
            -- upvalues: duckStepProj (upval), ProjectilePool (upval), defaultOnFinish (upval), CustomProjectile (upval)
            local Ammo, End, TravelTime, Value, Value_2, WorldPosition, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
            local PrimaryPart = a1.Model.PrimaryPart
            local Weapon = a1.Model.Weapon.Weapon
            local v11 = a1:_getHandle()
            local Configuration = v11 and v11:FindFirstChild("Configuration")
            local v12 = a1.Replicator:Get("Cooldown")
            local v13 = a1.Replicator:Get("Upgrade")
            local TargetPosition = a1_2.TargetPosition
            a1:Face(TargetPosition)
            if not u41[Name] and not a1.FBXModel then
                a1:_aimAt(TargetPosition)
            end
            local v14 = a1:Animate("Fire")
            v14:AdjustSpeed(1 / (v12 / v14.Length) * GameState.TimeScale)
            local Explosion = PrimaryPart:FindFirstChild("Explosion") and PrimaryPart.Explosion.SoundId:gsub("rbxassetid://", "")
            local v15 = #a1_2.Projectiles == 1
            for i, v in ipairs(a1_2.Projectiles) do
                v2 = Configuration and Configuration.Start:FindFirstChild((tostring(i)))
                Value = not (not (#v1.Projectiles > 1) or not v2) and v2.Value or v11:FindFirstChild((("Start%*"):format(i))) or Configuration and Configuration.Start["1"].Value or v11.Start
                WorldPosition = Value.WorldPosition
                End = v.End
                v3 = stepProjDefault
                Value_2 = nil
                if not u41[Name] then
                    Ammo = Configuration and Configuration:FindFirstChild("Ammo")
                    Value_2 = if not Ammo then Weapon.Ammo else if not Ammo:IsA("ObjectValue") then Weapon.Ammo else if not Ammo.Value then Weapon.Ammo else if not Ammo.Value:IsA("BasePart") then Weapon.Ammo else Ammo.Value
                elseif Name == "Duck" then
                    Value_2 = a1.Model.Weapon[("Ammo%*"):format(i)]
                    v3 = duckStepProj
                elseif Name == "Ghost" then
                    Value_2 = a1.Model.Weapon[("Ammo%*"):format(i)]
                end
                local u196 = ProjectilePool.get(Value_2, 8)
                v4 = u196:take()
                v5 = 2 ^ i
                v6 = if v15 then 0 else -1 ^ (i % 2)
                v7 = if not (i > 2) then 1 else 0
                v8 = (WorldPosition - End).Magnitude / 4 + v7
                v4.Transparency = 0
                v9 = CustomProjectile
                TravelTime = v.TravelTime
                v10 = {
                    explosionSound = Explosion,
                    explosionRadius = v1.ExplosionRadius,
                    upgrade = v13,
                    solo = v15,
                    podNumber = i,
                    skinName = Name,
                    _podPow = v5,
                    _peakOffsetX = v6,
                    _height = v8,
                }
                v9:ThrowProjectile(WorldPosition, End, TravelTime, v4, v3, function(a1) -- Line: 439 -- upvalues: defaultOnFinish (upval), u196 (val)
                    defaultOnFinish(a1)
                    u196:release(a1.part)
                end, v10)
            end
        end,
    }
    local PlacementVFX = a1.Model.PrimaryPart:FindFirstChild("PlacementVFX")
    if PlacementVFX then
        EmitterManager.manualEmit(PlacementVFX)
    end
end

function v1:_getHandle() -- Line: 475 -- upvalues: u41 (val)
    local Name = self.Model.Name
    local PrimaryPart = self.Model.PrimaryPart
    local v1 = self.Replicator:Get("Upgrade")
    local Weapon = self.Model.Weapon.Weapon
    local Handle = Weapon:FindFirstChild("Handle") or Weapon:FindFirstChild("Barrel")
    if u41[Name] then
        local DEF_BALLISTA_BODY = nil
        if Name == "Duck" then
            local ROOT = PrimaryPart.ROOT
            DEF_BALLISTA_BODY = if not (v1 >= 3) then if not (v1 >= 1) then ROOT.DEF_SLINGSHOT_01 else ROOT.DEF_CROSSBOW_BODY else ROOT.DEF_BALLISTA_BODY
        elseif Name == "Ghost" then
            DEF_BALLISTA_BODY = PrimaryPart.Root.Torso.RightArm.Rocket_Launcher
        end
        if DEF_BALLISTA_BODY then
            Handle = DEF_BALLISTA_BODY
        end
    end
    return Handle
end

function v1:_aimAt(a2) -- Line: 503 -- upvalues: TweenService (val) -- types: self: table, a2: vector
    local v1, v2
    local PrimaryPart = self.Model.PrimaryPart
    local RootJoint = PrimaryPart.RootJoint
    local v3 = self.Model.Torso["Right Hip"]
    local v4 = self.Model.Torso["Left Hip"]
    local v5 = self.Replicator:Get("Cooldown")
    local v6 = (a2 - PrimaryPart.Position).Magnitude / 4
    if self._currentTween then
        self._currentTween:Cancel()
    end
    local v7 = math.asin(((PrimaryPart.Position:Lerp(a2, 0.5)) + Vector3.new(0, v6 + 1, 0) - self.Model.PrimaryPart.Position).Unit.Y)
    RootJoint.C0 = self._motorData[RootJoint] * CFrame.Angles(-v7, 0, 0)
    v3.C0 = self._motorData[v3] * CFrame.Angles(-v7, 0, 0) * CFrame.Angles(0, 0, -v7)
    v4.C0 = self._motorData[v4] * CFrame.Angles(v7, 0, 0) * CFrame.Angles(0, 0, v7)
    for k, v in pairs(self._motorData) do
        v1 = TweenService
        v2 = TweenInfo.new(v5 * 0.5)
        v1:Create(k, v2, {C0 = v}):Play()
    end
end

return v1