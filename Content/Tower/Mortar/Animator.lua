-- Script path: ReplicatedStorage.Content.Tower.Mortar.Animator
-- Decompile time: 5.20 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local v1 = {}
v1.__index = v1
local Projectile = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects"):WaitForChild("Projectile")

function v1:getWeaponConfig() -- Line: 15
    return (self.Model.Weapon.Mortar:FindFirstChildWhichIsA("Configuration", true))
end

function v1.Initialize(a1) -- Line: 20
    -- upvalues: EmitterManager (val), ItemDrop (val), EasySound (val), EffectsController (val)
    a1._hasCustomProjectiles = a1.Model:FindFirstChild("Projectiles") ~= nil
    a1._prevLevel = nil
    a1._shellRef = nil
    a1._clusterRef = nil
    local u14 = RaycastParams.new()
    u14.FilterType = Enum.RaycastFilterType.Include
    u14.FilterDescendantsInstances = {
        workspace:WaitForChild("Ground"),
        workspace:WaitForChild("Cliff"),
        workspace:WaitForChild("Boundaries"),
        ((workspace:WaitForChild("Map")):WaitForChild("Environment")),
    }
    a1:_updateProjectile(a1.Upgrade)
    a1:_updateFace(a1.Upgrade)
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 36 -- upvalues: a1 (val) -- types: a1_2: number
        a1:_updateProjectile(a1_2)
        a1:_updateFace(a1_2)
    end)
    a1.Executables = {
        Projectile = function(a1_2, a2) -- Line: 42
            -- upvalues: a1 (val), EmitterManager (upval), ItemDrop (upval), u14 (val), EasySound (upval)
            -- upvalues: EffectsController (upval)
            local Mortar = a1.Model.Weapon.Mortar
            local u13 = (if a1_2 ~= "Cluster" then a1._shellRef else a1._clusterRef):Clone()
            local _clusterRefEmitter = if a1_2 ~= "Cluster" then a1._shellRefEmitter else a1._clusterRefEmitter
            local u28 = nil
            if _clusterRefEmitter and _clusterRefEmitter:IsA("BasePart") then
                u28 = _clusterRefEmitter:Clone()
                u28.CanCollide = false
                u28.Parent = workspace.CurrentCamera
            end
            local PrimaryPart = u13:IsA("Model") and u13.PrimaryPart or u13
            for i, j in u13:GetChildren() do
                if j:IsA("BasePart") then
                    j.Transparency = 0
                end
            end
            if PrimaryPart:IsA("BasePart") then
                PrimaryPart.Transparency = 0
            end
            u13.Parent = workspace.CurrentCamera
            EmitterManager.toggle(u13, true)
            if a1_2 == "Shell" then
                a1:_fire()
                a1:Face(a2.goal)
                local v1 = a1:getWeaponConfig()
                if not a1.FBXModel or not v1 then
                    a2.start = Mortar.Cannon.Start.WorldPosition
                else
                    a2.start = v1.Start.Value.WorldPosition
                    EmitterManager.manualEmit(v1.Start.Value)
                end
            end
            local u107 = Random.new():NextNumber()
            ;(ItemDrop.Drop(a2.start, a2.goal, PrimaryPart, a2.dtMultiplier, a2.gravity, a2.velocity, function(a1, a2, a3) -- Line: 89 -- upvalues: a1_2 (val), u107 (val)
                CFrame.new()
                local v1 = if a1_2 ~= "Cluster" then CFrame.lookAt(a3, a2) else (CFrame.lookAt(a2, a3)) * CFrame.Angles(u107 + a1, u107 + a1, 0)
                return v1 - v1.Position
            end)):andThen(function(a1_2) -- Line: 101
                -- upvalues: u13 (val), u28 (ref), a2 (val), u14 (upval), EmitterManager (upval), EasySound (upval)
                -- upvalues: a1 (upval), EffectsController (upval)
                u13:Destroy()
                if not u28 then
                    EffectsController.Explosion({Position = a2.goal, Radius = a2.radius})
                    return
                end
                local goal = a2.goal
                if u28:GetAttribute("LandOnGround") == true then
                    local v1 = workspace
                    local v2 = a2.goal + Vector3.new(0, 100, 0)
                    local v3 = u14
                    v1 = v1:Raycast(v2, Vector3.new(-0, -200, -0), v3)
                    goal = v1 and v1.Position + Vector3.new(0, 1, 0) * (u28.Size.Y / 2) or goal
                end
                u28.Position = goal
                EmitterManager.manualEmit(u28)
                ;(EasySound.Play({
                    volume = 0.5,
                    soundGroupName = "Towers",
                    destroyOnEnd = true,
                    id = u28.Explosion.SoundId,
                    parent = a1.Model.PrimaryPart,
                })).Ended:Once(function() -- Line: 124 -- upvalues: u28 (upval)
                    u28:Destroy()
                end)
            end)
        end,
    }
end

function v1:_updateFace(a2) -- Line: 138
    local Face = self.Model.Upgrades[a2]:FindFirstChild("Face")
    if Face then
        if self._currentFace then
            self._currentFace:Destroy()
        end
        self._currentFace = Face
        local Decal = Face:FindFirstChildWhichIsA("Decal")
        if Decal then
            Decal.Transparency = 0
        end
    end
end

function v1:_updateProjectile(a2) -- Line: 152 -- upvalues: Projectile (val)
    local _hasCustomProjectiles = self._hasCustomProjectiles and self.Model.Projectiles:FindFirstChild(a2)
    local Shell = _hasCustomProjectiles and _hasCustomProjectiles:FindFirstChild("Shell")
    self._shellRef = _hasCustomProjectiles and Shell or self._shellRef or a2 >= 3 and Projectile.PlaneBomb or Projectile.MortarShell
    local Cluster = _hasCustomProjectiles and _hasCustomProjectiles:FindFirstChild("Cluster") or self._clusterRef or Projectile.ClusterBomb
    self._clusterRef = Cluster
    local CustomEmitterCluster = _hasCustomProjectiles and _hasCustomProjectiles:FindFirstChild("CustomEmitterCluster") or self._clusterRefEmitter
    self._clusterRefEmitter = CustomEmitterCluster
    local CustomEmitterShell = _hasCustomProjectiles and _hasCustomProjectiles:FindFirstChild("CustomEmitterShell") or self._shellRefEmitter
    self._shellRefEmitter = CustomEmitterShell
end

function v1:_getFireAnimation(a2) -- Line: 173 -- upvalues: Animation (val)
    if a2 >= 3 and a2 < 5 then
        return (Animation.new({
            Track = self.Model.Animations.Fire[3].Fire,
            Target = self.Model.AnimationController,
        }):Play())
    end
    if a2 >= 5 then
        return (Animation.new({
            Track = self.Model.Animations.Fire[5].Fire,
            Target = self.Model.AnimationController,
        }):Play())
    end
    return (Animation.new({
        Track = self.Model.Animations.Fire[0].Fire,
        Target = self.Model.AnimationController,
    }):Play())
end

function v1:_fire() -- Line: 196 -- upvalues: EasySound (val)
    local v1 = self:_getFireAnimation((self:GetLevel()))
    local Mortar = self.Model.Weapon.Mortar
    if Mortar:FindFirstChild("Ammo") then
        (v1:GetMarkerReachedSignal("Hide")):Connect(function(a1) -- Line: 201 -- upvalues: Mortar (val)
            local v1 = Mortar:FindFirstChild(a1)
            if v1 then
                v1.Transparency = 1
                for i, v in ipairs(v1:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 1
                    end
                end
            end
        end)
        ;(v1:GetMarkerReachedSignal("Appear")):Connect(function(a1) -- Line: 213 -- upvalues: Mortar (val)
            local v1 = Mortar:FindFirstChild(a1)
            if v1 then
                v1.Transparency = 0
                for i, v in ipairs(v1:GetDescendants()) do
                    if v:IsA("BasePart") then
                        v.Transparency = 0
                    end
                end
            end
        end)
    end
    ;(v1:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 226 -- upvalues: self (val), EasySound (upval)
        local v1 = self.Model.Head:FindFirstChild(a1)
        if v1 and v1:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = v1.SoundId,
                parent = v1.Parent,
                playbackSpeed = v1.PlaybackSpeed,
            })
        end
    end)
    local Cannon = Mortar:FindFirstChild("Cannon") or self.Model.PrimaryPart
    local Fire = Cannon and Cannon:FindFirstChild("Fire")
    if Fire and Fire:IsA("Sound") then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            timeScaled = true,
            id = Fire.SoundId,
            parent = Cannon or self.Model.PrimaryPart,
            playbackSpeed = (Random.new()):NextNumber(Fire.PlaybackSpeed * 0.9, Fire.PlaybackSpeed * 1.2),
        })
    end
    local Start = Cannon and Cannon:FindFirstChild("Start")
    if Start then
        Start.Smoke:Emit(35)
    end
end

return v1