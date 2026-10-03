-- Script path: ReplicatedStorage.Content.Tower.Commando.Animator
-- Decompile time: 9.79 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local AbilityAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.AbilityAmmoStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local u64 = {}
u64.Trooper = BrickColor.new("Cyan").Color
local u69 = {}
u69[true] = (Color3.fromRGB(12, 239, 255))
u69[false] = (Color3.fromRGB(255, 22, 138))

local function watchValue(a1, a2) -- Line: 30 -- upvalues: RunService (val)
    local u2 = nil
    local u3 = false
    local u4 = false
    local u5 = nil

    local function disconnect() -- Line: 36 -- upvalues: u4 (ref), u5 (ref)
        u4 = true
        if u5 then
            u5:Disconnect()
        end
    end

    local function update() -- Line: 43 -- upvalues: u4 (ref), a1 (val), u3 (ref), u2 (ref), a2 (val), disconnect (val)
        if u4 then
            return
        end
        local v1 = a1()
        if u3 and v1 == u2 then
            return
        end
        u3 = true
        u2 = v1
        a2(v1, disconnect)
    end

    task.defer(update)
    local v1 = RunService.Heartbeat:Connect(update)
    return disconnect
end

function v1:_playSound(a2) -- Line: 64 -- upvalues: SoundPool (val)
    local v1 = self.Model.HumanoidRootPart:FindFirstChild(a2)
    if v1 and v1:IsA("Sound") then
        local v2 = string.match(v1.SoundId or "", "%d+")
        local v3 = v2 and tonumber(v2)
        if v3 then
            local _fireSoundPools = self._fireSoundPools or {}
            self._fireSoundPools = _fireSoundPools
            local v4 = self._fireSoundPools[v3]
            if not v4 then
                v4 = SoundPool.new({
                    size = 8,
                    audioGroup = "Towers",
                    id = v3,
                    parent = v1.Parent,
                    volume = v1.Volume,
                })
                self._fireSoundPools[v3] = v4
            end
            v4:play({playbackSpeed = v1.PlaybackSpeed, volume = v1.Volume})
        end
    end
    return v1
end

function v1:_playAnimation(a2, a3) -- Line: 91 -- types: self: table, a2: string
    return self:Animate(a2, nil, {a3 or 0.1})
end

function v1:_fireTarget(a2) -- Line: 95 -- upvalues: SharedControllerFunctions (val), u64 (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    self:Face(Position)
    SharedControllerFunctions.AimArmsAt(self, Position)
    SharedControllerFunctions.AimHeadAt(self, Position_2)
    self:_playSound(if not ((self:GetLevel()) < self._maxUpgrades) then "MaxFire" else "Fire")
    local v1 = u64[self.Model.Name] or nil
    for i = 1, 2 do
        self:Bullet({
            Size = 0.05,
            Spread = 20,
            Start = self.Model.Weapon["Gun" .. i].Handle.Attachment.WorldPosition,
            End = Position,
            Color = v1,
        })
        EmitterManager.manualEmit(self.Model.Weapon["Gun" .. i].Handle.Attachment)
    end
end

function v1:_pathPlacement() -- Line: 127
    -- upvalues: TypedPromise (val), Maid (val), ReplicatedStorage (val), spr (val), RunService (val)
    -- upvalues: PathPlacementCursorController (val), u69 (val)
    if self._currentPromise then
        self._currentPromise:cancel()
        self._currentPromise = nil
    end
    self._currentPromise = TypedPromise.new(function(a1, a2, a3) -- Line: 133
        -- upvalues: Maid (upval), self (val), ReplicatedStorage (upval), spr (upval), RunService (upval)
        -- upvalues: PathPlacementCursorController (upval), u69 (upval)
        local u5 = Maid.new()
        a3(function() -- Line: 143 -- upvalues: self (upval), u5 (val)
            self._currentPromise = nil
            u5:Sweep()
        end)
        local u20 = (self:GetRange()) * self.Replicator:Get("MissileRangeMultiplier")
        local v1 = ReplicatedStorage.Assets.Effects.Client.Circle:Clone()
        v1.Size = Vector3.new(0, 0, 0)
        spr.target(v1, 0.6, 4, {Size = Vector3.new(u20 * 2, 0, u20 * 2)})
        v1.Position = self.BottomPosition
        local Trash = workspace:FindFirstChild("Trash") or workspace
        v1.Parent = Trash
        u5:Mark(v1)
        local u64 = ReplicatedStorage.Assets.Effects.Client.Airstrike_Crosshair:Clone()
        u5:Mark(u64)
        u64.Arrow:Destroy()
        u64.Parent = workspace
        u5:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 166
            -- upvalues: PathPlacementCursorController (upval), u64 (val), self (upval), u20 (val), u69 (upval)
            local CurrentPosition = PathPlacementCursorController.CurrentPosition
            local Outer = u64.OuterRing.Outer
            Outer.CFrame = Outer.CFrame * CFrame.Angles(0, math.rad(90 * a1), 0)
            u64:PivotTo((CFrame.new(CurrentPosition)) * (CFrame.new(0, 0, 0.025)))
            local v1 = (CurrentPosition - self.BottomPosition).Magnitude <= u20
            local v2 = u69[v1]
            u64.Highlight.FillColor = v2
        end)))
        PathPlacementCursorController:Start({constrainToPath = true, uiEnabled = false})
        u5:Mark((PathPlacementCursorController.OnClicked:Connect(function(...) -- Line: 136 -- upvalues: u5 (val), self (upval), a1 (val)
            u5:Sweep()
            self._currentPromise = nil
            a1(...)
        end)))
        u5:Mark((PathPlacementCursorController.Canceled:Connect(function() -- Line: 182 -- upvalues: self (upval), u5 (val), a2 (val)
            self._currentPromise = nil
            u5:Sweep()
            a2("cancelled")
        end)))
    end)
    return self._currentPromise
end

function v1:_getMissileAmmo() -- Line: 192 -- upvalues: AbilityAmmoStore (val)
    local Replicator = self.Replicator and self.Replicator:Get("UID")
    if Replicator ~= nil then
        local v1 = AbilityAmmoStore.getState()["Missile" .. tostring(Replicator)]
        if v1 and v1.ammo ~= nil then
            return v1.ammo
        end
    end
    local AbilityDataReplicator = self.AbilityDataReplicator and self.AbilityDataReplicator:Get("Missile")
    return AbilityDataReplicator and AbilityDataReplicator.Ammo or nil
end

function v1:_updateAmmoVisuals() -- Line: 205
    local v1
    if not self.Model.Weapon:FindFirstChild("Pack") then
        return
    end
    local Launcher = self.Model.Weapon.Pack.Launcher
    local v2 = self:_getMissileAmmo() or 0
    for i, j in Launcher:GetChildren() do
        if tonumber(j.Name) then
            j.Transparency = 1
        end
    end
    for k = 1, v2 do
        if Launcher:FindFirstChild((tostring(k))) then
            v1 = Launcher[tostring(k)]
            v1.Transparency = 0
        end
    end
end

function v1.Initialize(a1) -- Line: 226
    -- upvalues: GameState (val), EasySound (val), EmitterManager (val), RunService (val), spr (val), watchValue (val)
    -- upvalues: AbilityAmmoStore (val), SharedControllerFunctions (val)
    a1._fireAnim = "Left"
    a1._maxUpgrades = #a1.Model.Upgrades:GetChildren() - 1
    a1._missileObjects = {}
    a1.AbilityCallbacks = {
        Missile = function() -- Line: 232 -- upvalues: a1 (val)
            local v1 = a1:_getMissileAmmo()
            if v1 ~= nil and v1 <= 0 then
                return {}
            end
            local v2, v3, v4 = a1:_pathPlacement():await()
            if not v2 then
                return false
            end
            return {pathName = v3, pathToEnd = v4}
        end,
    }
    a1.Executables = {
        Reload = function() -- Line: 252 -- upvalues: a1 (val), GameState (upval), EasySound (upval)
            local v1 = a1:_playAnimation("Reload")
            local v2 = v1.Length / (a1.Replicator:Get("ReloadTime"))
            v1:AdjustSpeed(v2 * GameState.TimeScale)
            local v3 = a1.Model.HumanoidRootPart:FindFirstChild(if not ((a1:GetLevel()) < a1._maxUpgrades) then "4_Reload" else "0_Reload")
            if v3 and v3:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    volume = 0.7,
                    destroyOnEnd = true,
                    id = v3.SoundId,
                    parent = v3.Parent,
                    playbackSpeed = v2 * GameState.TimeScale,
                })
            end
        end,
        MissileHit = function(a1_2) -- Line: 272 -- upvalues: a1 (val), EmitterManager (upval) -- types: a1_2: table
            local v1 = a1._missileObjects[a1_2.id]
            if v1 then
                local Position = v1.Position
                v1:Destroy()
                a1._missileObjects[a1_2.id] = nil
                EmitterManager.Emit("BigExplosion", CFrame.new(Position), a1_2.raidus)
            end
        end,
        MissileVisual = function(a1_2) -- Line: 282
            -- upvalues: a1 (val), EasySound (upval), EmitterManager (upval), RunService (upval), GameState (upval)
            -- upvalues: spr (upval)
            local Launcher = a1.Model.Weapon.Pack.Launcher
            local v1 = Launcher:FindFirstChild((tostring(a1_2.missile)))
            if not v1 then
                local missile_2 = a1_2.missile
                for i = 1, missile_2 do
                    if (Launcher:FindFirstChild((tostring(i)))) then
                        break
                    end
                end
            end
            if Launcher:FindFirstChild("Fire") and Launcher.Fire:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    id = Launcher.Fire.SoundId,
                    parent = Launcher,
                    playbackSpeed = Launcher.Fire.PlaybackSpeed,
                })
            end
            EmitterManager.manualEmit(Launcher.Start)
            local v2 = v1
            if not v2 then
                return
            end
            local u58 = v2:Clone()
            for j, k in u58:GetDescendants() do
                if k:IsA("Trail") then
                    k.Enabled = true
                end
            end
            ;(u58:FindFirstChildWhichIsA("WeldConstraint") or u58:FindFirstChildWhichIsA("Weld")):Destroy()
            u58.Anchored = true
            u58.Transparency = 0
            for n, m in u58:GetChildren() do
                if m:IsA("Trail") then
                    m.Enabled = true
                end
            end
            local u101 = u58.Size * 5
            u58.Size = u58.Size * 3
            u58.Parent = workspace
            a1._missileObjects[a1_2.id] = u58
            local u109 = 0
            local duration = a1_2.duration
            local Position = v1.Position
            local u115 = v1.CFrame.UpVector * 15
            local u120 = v1.Position + v1.CFrame.UpVector * 2
            local u121 = u120
            local u122 = nil
            local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 352
                -- upvalues: u109 (ref), GameState (upval), duration (val), u58 (val), a1_2 (val), u101 (val)
                -- upvalues: spr (upval), u122 (ref), Position (val), u115 (val), u120 (ref), u121 (ref)
                u109 = u109 + a1 * GameState.TimeScale / duration
                if not (u109 > 1) then
                    local v1 = math.sin(u109 * 3.141592653589793)
                    local v2 = math.cos(u109 * 3.141592653589793 / 2)
                    local v3 = Position + (a1_2.endPosition - Position) * u109 + u115 * v1
                    local v4 = CFrame.new(u120, v3) * CFrame.Angles(0, 0, 3.141592653589793 * u109 * 2) * CFrame.new(v1 * v2 * 5, 0, 0)
                    u58.CFrame = (CFrame.new(u121, v4.Position)) * CFrame.Angles(-1.5707963267948966, 0, 0)
                    u120 = v3
                    u121 = v4.Position
                    return
                end
                local Sound_2 = Instance.new("Sound")
                Sound_2.SoundId = "rbxassetid://95646540843028"
                Sound_2.Volume = 1.1
                Sound_2.Parent = u58
                Sound_2.PlayOnRemove = true
                local Sound = Instance.new("Sound")
                Sound.SoundId = "rbxassetid://101356378534341"
                Sound.Volume = 1.1
                Sound.Parent = u58
                Sound:Play()
                Sound.Ended:Connect(function() -- Line: 367 -- upvalues: Sound (val)
                    Sound:Destroy()
                end)
                u58.CFrame = CFrame.new(a1_2.endPosition) * u58.CFrame.Rotation * CFrame.Angles(math.rad((math.random(-20, 20))), 0, (math.rad((math.random(-20, 20)))))
                local Size = u58.Size
                u58.Size = u101
                spr.target(u58, 0.3, 2.5, {Size = Size})
                u122:Disconnect()
            end)
        end,
    }
    a1.OnUpgrade:Connect(function() -- Line: 409 -- upvalues: a1 (val)
        a1:_updateAmmoVisuals()
    end)
    a1.Maid:Mark(function() -- Line: 413 -- upvalues: a1 (val)
        for i, j in a1._missileObjects do
            j:Destroy()
        end
    end)
    a1.Maid:Mark(((a1.AbilityDataReplicator:GetStateChangedSignal("Missile")):Connect(function() -- Line: 419 -- upvalues: a1 (val)
        a1:_updateAmmoVisuals()
    end)))
    local u47 = "Missile" .. tostring((a1.Replicator:Get("UID")))
    local u50 = a1:_getMissileAmmo()
    a1.Maid:Mark((watchValue(AbilityAmmoStore.getState, function(a1_2) -- Line: 425 -- upvalues: u47 (val), u50 (ref), a1 (val)
        local v1 = a1_2[u47]
        local ammo = v1 and v1.ammo
        if ammo == u50 then
            return
        end
        u50 = ammo
        a1:_updateAmmoVisuals()
    end)))
    a1.Maid:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 436 -- upvalues: a1 (val), GameState (upval)
        if not a1._tick then
            return
        end
        if 0 < a1._tick then
            local v1 = a1
            v1._tick = v1._tick - a1_2 * GameState.TimeScale
        end
        if a1._tick <= 0 and a1._inADS then
            a1._inADS = false
            a1:_playSound("AdsIdle")
            a1:_playAnimation("Holster")
            a1._currentADS:Stop()
        end
    end)))
    a1:Thread(function() -- Line: 453 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if v1 then
            a1:_fireTarget(v1)
            if not a1._inADS then
                a1._inADS = true
                a1._currentADS = a1:_playAnimation("Ads")
            end
            a1._tick = 3
            a1._currentFire = a1:_playAnimation("Fire", 0)
            a1:Delay((a1:GetCooldown()))
            a1._currentFire:Stop()
        end
    end)
    SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Right Shoulder"], a1.Model.Torso["Left Shoulder"]})
    a1.Maid:Mark(function() -- Line: 476 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            a1._fireSoundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 485 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            table.clear(a1._fireSoundPools)
        end
    end)
end

return v1