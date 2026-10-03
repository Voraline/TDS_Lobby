-- Script path: ReplicatedStorage.Content.Tower.Gatling Gun.Animator
-- Decompile time: 20.60 ms

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local UserInputService = game:GetService("UserInputService")
local CameraController = require(script.CameraController)
local CameraSpring = require(script.CameraSpring)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local CrosshairStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.CrosshairStore)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HitmarkerStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.HitmarkerStore)
local KeybindsStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.KeybindsStore)
local LockedAbilties = require(script.LockedAbilties)
local LockedAbilitiesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.LockedAbilitiesStore)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TowerAmmoStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.TowerAmmoStore)
local UpgradesStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.UpgradesStore)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local Keybinds = require(script.Keybinds)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
v1.__index = v1
local u150 = Create("Sound", {SoundId = "rbxassetid://74643671307263", Volume = 0.6})
local u152 = Random.new()
local GatlingGun = NewNetwork.Channel("GatlingGun")

local function lerp(a1, a2, a3) -- Line: 46
    return a1 + (a2 - a1) * a3
end

local function worldCFrameToC0ObjectSpace(a1, a2) -- Line: 50
    local CFrame = a1.Part1.CFrame
    local C1 = a1.C1
    local C0 = a1.C0
    local v1 = C0 * C1:Inverse() * CFrame:Inverse() * a2 * C1
    return v1 - v1.Position + C0.Position
end

function v1._emit(a1, a2) -- Line: 61
    local Attribute
    for i, j in a2:GetChildren() do
        if j:IsA("ParticleEmitter") then
            Attribute = j:GetAttribute("EmitCount")
            j:Emit(Attribute)
        end
    end
end

function v1:_updateHumanRig(a2) -- Line: 69
    if not self.Model.Character:FindFirstChild("HumanoidRootPart") then
        return
    end
    local v1 = self.Model.Character.Torso["Right Shoulder"]
    local v2 = self.Model.Character.Torso["Left Shoulder"]
    local GripL = self.Model.Weapon.Main.Handle.GripL
    local GripR = self.Model.Weapon.Main.Handle.GripR
    local v3 = self.Model.Character["Left Arm"]
    local v4 = self.Model.Character["Right Arm"]
    local v5 = CFrame.lookAt(v3.Position, GripL.WorldPosition, (Vector3.new(0, 1, 0)))
    local CFrame_2 = v2.Part1.CFrame
    local C1 = v2.C1
    local C0 = v2.C0
    local v6 = C0 * C1:Inverse() * CFrame_2:Inverse() * v5 * C1
    v6 = v6 - v6.Position
    v2.C0 = (v6 + C0.Position) * CFrame.Angles(0, 0, -1.5707963267948966)
    local v7 = CFrame.lookAt(v4.Position, GripR.WorldPosition, (Vector3.new(0, 1, 0)))
    local CFrame_3 = v1.Part1.CFrame
    local C1_2 = v1.C1
    local C0_2 = v1.C0
    local v8 = C0_2 * C1_2:Inverse() * CFrame_3:Inverse() * v7 * C1_2
    v8 = v8 - v8.Position
    v1.C0 = (v8 + C0_2.Position) * CFrame.Angles(0, 0, 1.5707963267948966)
    local CFrame_4 = self.Model.Weapon.Goal.CFrame
    local v9 = (CFrame_4.Position - self.Model.Character.HumanoidRootPart.Position).Magnitude * 15
    v6 = self.Model.Character.HumanoidRootPart.CFrame:ToObjectSpace(CFrame_4)
    local v10 = true
    if self._alreadySit then
        v10 = false
        self._characterAnimations.Walk.Left:AdjustWeight(0)
        self._characterAnimations.Walk.Right:AdjustWeight(0)
    else
        self._characterAnimations.Walk.Left:AdjustSpeed((math.clamp(v9, 0, 4)))
        self._characterAnimations.Walk.Right:AdjustSpeed((math.clamp(v9, 0, 4)))
        if not (0 < v6.X) then
            self._characterAnimations.Walk.Left:AdjustWeight(v9)
            self._characterAnimations.Walk.Right:AdjustWeight(0)
        else
            self._characterAnimations.Walk.Left:AdjustWeight(0)
            self._characterAnimations.Walk.Right:AdjustWeight(v9)
        end
    end
    self._characterGoal = if not v10 then CFrame_4 else self._characterGoal:Lerp(CFrame_4, 5 * a2)
    self.Model.Character.HumanoidRootPart.CFrame = self._characterGoal
end

function v1:_wind() -- Line: 133 -- upvalues: GameState (val), RunService (val)
    local u5 = self.Replicator:Get("WindDirection")
    if u5 == self._currentDirection then
        return
    end
    local u11 = self.Replicator:Get("WindDuration")
    self._windPercent = self.Replicator:Get("WindPercent")
    local v1 = ((workspace:GetServerTimeNow()) - self.Replicator:Get("WindStart")) / u11 * GameState.TimeScale
    if u5 == "down" then
        v1 = -v1
    end
    self._windPercent = math.clamp(self._windPercent + v1, 0, 1)
    self._windMaid:Sweep()
    self._currentDirection = u5
    local u47 = self._barrels[self._currentBarrel]
    if u47 and u47:FindFirstChild("Start") then
        if u5 ~= "up" then
            u47.Start:Stop()
            u47.Spin:Stop()
            u47.Slow:Play()
        else
            u47.Start:Play()
            u47.Start.Ended:Connect(function() -- Line: 161 -- upvalues: self (val), u47 (val)
                if not self._allowedToFire then
                    return
                end
                u47.Start:Stop()
                u47.Spin:Play()
            end)
        end
    end
    self._windMaid:Mark((RunService.Stepped:Connect(function(a1, a2) -- Line: 175 -- upvalues: GameState (upval), u5 (val), self (val), u11 (val)
        local v1 = a2 * GameState.TimeScale
        if u5 == "up" then
            local v2 = self:FindTarget()
            if v2 then
                self:_aim(v2.PrimaryPart.Position, true)
            end
        end
        self._windPercent = if u5 ~= "up" then math.clamp(self._windPercent - v1 / u11, 0, 1) else math.clamp(self._windPercent + v1 / u11, 0, 1)
        if self._windPercent == 0 or self._windPercent == 1 then
            self._windMaid:Sweep()
        end
        self._allowedToFire = self._windPercent == 1
    end)))
end

function v1:_fire(a2) -- Line: 201
    -- upvalues: SoundPool (val), u152 (val), EasySound (val), Create (val), spr (val), TimescaleUtilities (val)
    -- upvalues: CrosshairStore (val)
    local v1, v2, v3, v4
    local u252 = self._barrels[self._currentBarrel]
    if not u252 then
        return
    end
    self._fireTick = tick()
    self._currentBarrel = self._currentBarrel + 1
    local _currentBarrel = self._currentBarrel
    if #self._barrels < _currentBarrel then
        self._currentBarrel = 1
    end
    self:_emit(u252.Fire)
    local Sound = u252.Fire:FindFirstChild("Sound")
    local FireLoop = u252:FindFirstChild("FireLoop")
    if Sound and Sound:IsA("Sound") then
        local _soundPools = self._soundPools or {}
        self._soundPools = _soundPools
        v2 = self._soundPools[Sound]
        if not v2 then
            v3 = string.match(Sound.SoundId or "", "%d+")
            v4 = v3 and tonumber(v3)
            if v4 then
                v2 = SoundPool.new({
                    size = 8,
                    audioGroup = "Towers",
                    timeScaled = true,
                    id = v4,
                    parent = u252,
                    volume = Sound.Volume,
                })
                self._soundPools[Sound] = v2
            end
        end
        if v2 then
            v2:play({
                playbackSpeed = Sound.PlaybackSpeed * u152:NextNumber(0.95, 1.05),
                volume = Sound.Volume,
            })
        end
    end
    if FireLoop and FireLoop:IsA("Sound") then
        local _barrelLoopPlayers = self._barrelLoopPlayers or {}
        self._barrelLoopPlayers = _barrelLoopPlayers
        if not self._barrelLoopPlayers[u252] then
            v4 = EasySound.Create({
                audioGroup = "Towers",
                looped = true,
                timeScaled = true,
                id = FireLoop.SoundId,
                parent = u252,
                playbackSpeed = FireLoop:GetAttribute("PlaybackSpeed") or FireLoop.PlaybackSpeed,
            })
            v4:Play()
            self._barrelLoopPlayers[u252] = v4
        end
    end
    v2 = nil
    for i = 0, (self:GetLevel()) do
        if self._characterAnimations.Fire[tostring(i)] then
            v2 = i
        end
    end
    self._characterAnimations.Fire[tostring(v2)]:Play(0)
    v3 = self.Replicator:Get("MaxAmmo") / 2.5
    v4 = self.Replicator:Get("Ammo")
    if v4 <= v3 then
        local v5 = Create
        local v6 = {
            LowGain = 0 + -5 * (1 - v4 / v3),
            HighGain = 0 + 8 * (1 - v4 / v3),
            MidGain = 0 + -5 * (1 - v4 / v3),
            Parent = u252,
        }
        v5("EqualizerSoundEffect", v6)
        local Dry = u252:FindFirstChild("Dry")
        if Dry and Dry:IsA("Sound") then
            local _soundPools_2 = self._soundPools or {}
            self._soundPools = _soundPools_2
            local v7 = self._soundPools[Dry]
            if not v7 then
                v6 = string.match(Dry.SoundId or "", "%d+")
                local v8 = v6 and tonumber(v6)
                if v8 then
                    v7 = SoundPool.new({
                        size = 3,
                        audioGroup = "Towers",
                        timeScaled = true,
                        id = v8,
                        parent = u252,
                        volume = Dry.Volume,
                    })
                    self._soundPools[Dry] = v7
                end
            end
            if v7 then
                local v9 = {playbackSpeed = Dry.PlaybackSpeed}
                local Volume = Dry.Volume
                local v10 = 1 - v4 / v3
                v9.volume = 0 + (Volume - 0) * v10
                v7:play(v9)
            end
        end
    end
    spr.stop(u252.Spring)
    spr.target(u252.Spring, 0.4, 8, {C1 = self._c0s[u252] * CFrame.new(0, 0, 0.4)})
    TimescaleUtilities.Delay(0.05, function() -- Line: 320 -- upvalues: u252 (val), spr (upval), self (val)
        if not u252.Parent then
            return
        end
        spr.target(u252.Spring, 0.4, 8, {C1 = self._c0s[u252]})
    end)
    self:Bullet({
        Start = u252.Fire.WorldPosition,
        End = v1,
        Spread = CrosshairStore.getState().spread,
        Speed = 140,
    })
    self._recoilModelSpring:shove((Vector3.new(u152:NextNumber(-0.3, 0.3), 20, 0)))
end

function v1:_aim(a2, a3) -- Line: 339 -- upvalues: CameraController (val) -- types: self: table, a3: boolean
    local v1, v2
    if not a2 or self._updatingRig then
        return
    end
    self._goalPosition = a2
    local _aimPosition = a3 and self._aimPosition or a2
    local v3 = (CFrame.new((self.Model.Weapon.Main:GetPivot()).Position, _aimPosition)) * CFrame.Angles(0, -math.rad(CameraController.RollValue.X), (math.rad(CameraController.RollValue.X)))
    _, v1 = v3:ToEulerAnglesYXZ()
    _, v2 = self.Model.HumanoidRootPart.CFrame:ToEulerAnglesYXZ()
    local _recoilPosition = self._recoilPosition
    self.Model.Weapon.Main:PivotTo(v3 * (CFrame.Angles(math.rad(_recoilPosition.Y), _recoilPosition.X, 0)))
    if self.Model.Weapon:FindFirstChild("Tilt") then
        local Pivot_2 = self.Model.Weapon.Tilt:GetPivot()
        local tilt = self._cframeData.tilt
        if tilt then
            tilt = (CFrame.new(Pivot_2.Position)) * (tilt - tilt.Position)
        end
        self.Model.Weapon.Tilt:PivotTo(tilt * (CFrame.Angles(0, 0, -v1 + v2)))
    end
    self._lastPosition = _aimPosition
end

function v1._replicatePosition(a1, a2) -- Line: 382 -- upvalues: GatlingGun (val) -- types: a1: table, a2: vector
    GatlingGun:fireUnreliableServer("ReplicateAimPosition", a2)
end

function v1:_toggleFPS(a2) -- Line: 386 -- upvalues: Players (val), UpgradesStore (val)
    local ShoppingGui = Players.LocalPlayer.PlayerGui:FindFirstChild("ShoppingGui")
    if ShoppingGui then
        ShoppingGui.Enabled = false
    end
    if a2 then
        UpgradesStore.reset()
    end
    local v1 = a2
    for i, j in self.Model.Character:GetDescendants() do
        if j:IsA("BasePart") then
            j.LocalTransparencyModifier = if not v1 then 0 else 1
        end
        if j:IsA("Decal") then
            j.Transparency = if not v1 then 0 else 1
        end
    end
end

function v1:_fireGun() -- Line: 407 -- upvalues: CameraController (val), CrosshairStore (val), GatlingGun (val)
    local v1 = self.Replicator:Get("Minigun") and self.Replicator:Get("CanFire")
    if not self.Replicator:Get("Minigun") then
        v1 = true
    end
    if v1 then
        self:_fire(CameraController.position)
        CrosshairStore.addSpread(self.Stats.Attributes.SpreadAdd or 10)
        CameraController.recoil(self.Stats.Attributes.Recoil or 0.03)
    end
    local Position = CameraController.result and CameraController.result.Position or CameraController.position
    if Position then
        GatlingGun:fireServer("Fire", Position, workspace:GetAttribute("Sync"), (workspace:GetServerTimeNow()))
    end
    self:Wait((self:GetCooldown()))
end

function v1:_updateRig() -- Line: 436
    local Level = self:GetLevel()
    if not self.Model.Upgrades:FindFirstChild((tostring(Level))) then
        return
    end
    local v1 = {main = self.Model.Weapon.Main:GetPivot()}
    v1.tilt = self.Model.Weapon:FindFirstChild("Tilt") and self.Model.Weapon.Tilt:GetPivot() or nil
    self._cframeData = v1
    self._barrels = {}
    self._c0s = {}
    self._currentBarrel = 1
    for i, j in self.Model.Weapon:GetDescendants() do
        if j:IsA("BasePart") and string.find(string.lower(j.Name), "barrel") then
            table.insert(self._barrels, j)
            self._c0s[j] = j.Spring.C1
        end
    end
    if self.Model.Weapon.Main.Handle:FindFirstChild("Sit") and not self._alreadySit then
        self._alreadySit = true
    end
    local Goal = self.Model.Weapon:WaitForChild("Goal", 20)
    if Goal then
        Goal.Transparency = 1
    end
    local v2 = 0
    for k = 0, Level do
        if self._characterAnimations.Idle[tostring(k)] then
            v2 = k
        end
    end
    for n, m in self._characterAnimations.Idle do
        m:Stop(0)
    end
    self._characterAnimations.Idle[tostring(v2)]:Play(0)
end

function v1._toggleAmmo(a1, a2) -- Line: 482 -- upvalues: TowerAmmoStore (val)
    TowerAmmoStore.setEnabled(a2)
end

function v1:_toggleBinds(a2) -- Line: 486 -- upvalues: KeybindsStore (val), Keybinds (val)
    if not a2 then
        KeybindsStore.setEnabled(false)
        return
    end
    local v1 = self:_getInputType()
    KeybindsStore.setInputType(v1)
    KeybindsStore.setBinds(Keybinds(v1, self))
    KeybindsStore.setEnabled(true)
end

function v1:_canShoot() -- Line: 499
    local v1 = false
    if 0 < (self.Replicator:Get("Ammo")) then
        v1 = self.Replicator:Get("Reloading") == false
    end
    return v1
end

function v1._getInputType(a1) -- Line: 503 -- upvalues: UserInputService (val)
    local GamepadEnabled = UserInputService.GamepadEnabled
    local TouchEnabled = UserInputService.TouchEnabled
    if GamepadEnabled then
        return "Console"
    end
    if TouchEnabled then
        return "Mobile"
    end
    return not GamepadEnabled and not TouchEnabled and "PC"
end

function v1:_isFirstPerson() -- Line: 511
    if not self._isOwner and self.Replicator:Get("FPS") then
        return true
    end
    return false
end

function v1._toggleLockedAbilities(a1, a2) -- Line: 518
    -- upvalues: LockedAbilties (val), LockedAbilitiesStore (val)
    local v1 = {}
    if a2 then
        for k, v in pairs(LockedAbilties) do
            v1[v] = true
        end
    end
    LockedAbilitiesStore.set(v1)
end

function v1:_updateAmmo() -- Line: 530 -- upvalues: TowerAmmoStore (val)
    if not self._FPSEnabled then
        return
    end
    TowerAmmoStore.setAmmo(self.Replicator:Get("Ammo"))
    TowerAmmoStore.setMaxAmmo(self.Replicator:Get("MaxAmmo"))
    TowerAmmoStore.setReloading(self.Replicator:Get("Reloading"))
end

function v1.Initialize(a1) -- Line: 539
    -- upvalues: Maid (val), RunService (val), Players (val), CameraSpring (val), ClientAtoms (val), GameState (val)
    -- upvalues: CrosshairStore (val), ViewController (val), CameraController (val), GatlingGun (val), SoundPool (val)
    -- upvalues: EasySound (val), EmitterManager (val), u150 (val), SoundService (val), u152 (val), HttpService (val)
    -- upvalues: HitmarkerStore (val)
    local v1
    a1._updatingRig = true
    a1._windPercent = a1.Replicator:Get("WindPercent") or 0
    a1._goalPosition = (a1.Model.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)).Position
    a1._aimPosition = a1._goalPosition
    a1._currentDirection = a1.Replicator:Get("WindDirection")
    a1._windMaid = Maid.new()
    a1._barrelLoopPlayers = {}
    local Character = a1.Model:WaitForChild("Character")
    while true do
        if not (#Character:WaitForChild("Animations"):GetDescendants() < 9) then
            break
        end
        RunService.Heartbeat:Wait()
    end
    a1.Maid:Mark(a1._windMaid)
    a1._isOwner = (a1.Replicator:Get("OwnerId")) == Players.LocalPlayer.UserId
    a1._defaultY = a1.Model:WaitForChild("Character").PrimaryPart.Position.Y
    a1._characterGoal = a1.Model:WaitForChild("Character").PrimaryPart.CFrame
    a1._recoilModelSpring = CameraSpring:new(5, 50, 4, 8)
    a1.AbilityCallbacks = {
        FPS = function(a1_2, a2) -- Line: 564
            -- upvalues: a1 (val), ClientAtoms (upval), GameState (upval), CrosshairStore (upval)
            -- upvalues: ViewController (upval), CameraController (upval)
            local v1 = nil
            if a2 ~= nil then
                v1 = a2
            end
            if v1 == nil then
                v1 = not a1._FPSEnabled
            end
            if v1 and not a1._FPSEnabled and ClientAtoms.cloneTowerAtom().blockOtherAbilities == true then
                return false
            end
            a1._FPSEnabled = v1
            if GameState.Replicator:Get("GameOver") then
                a1._FPSEnabled = false
            end
            a1:_toggleFPS(a1._FPSEnabled)
            CrosshairStore.setForcedModel(a1._FPSEnabled and a1.Model or false)
            CrosshairStore.setEnabled(a1._FPSEnabled)
            task.defer(function() -- Line: 594 -- upvalues: ViewController (upval), a1 (upval)
                ViewController:setView(if not a1._FPSEnabled then "Hotbar" else "Crate")
                a1:StopPlacement()
                task.delay(1, function() -- Line: 597 -- upvalues: a1 (upval), ViewController (upval)
                    if a1._FPSEnabled then
                        ViewController:setView(if not a1._FPSEnabled then "Hotbar" else "Crate")
                    end
                end)
            end)
            a1._firing = false
            a1:_toggleBinds(a1._FPSEnabled)
            a1:_toggleAmmo(a1._FPSEnabled)
            a1:_toggleLockedAbilities(a1._FPSEnabled)
            local v2 = a1
            CameraController:toggle(a1._FPSEnabled, v2)
            a1:_updateAmmo()
            return {enabled = a1._FPSEnabled}
        end,
    }
    a1._inputCallbacks = {
        FIRE = function(a1_2) -- Line: 621 -- upvalues: a1 (val)
            a1._firing = a1_2
        end,
        EXIT = function(a1_2) -- Line: 624 -- upvalues: a1 (val), GatlingGun (upval)
            if a1._FPSEnabled and not a1_2 then
                a1.AbilityCallbacks.FPS()
            end
            GatlingGun:fireServer("FpsEnabled", a1._FPSEnabled)
        end,
        RELOAD = function(a1_2) -- Line: 630 -- upvalues: a1 (val), GatlingGun (upval)
            if a1._FPSEnabled and a1_2 then
                GatlingGun:fireServer("Reload")
            end
        end,
    }

    local function updateStore() -- Line: 637 -- upvalues: a1 (val)
        a1:_updateAmmo()
    end

    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Ammo")):Connect(updateStore)))
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("MaxAmmo")):Connect(updateStore)))
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Reloading")):Connect(updateStore)))
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("WindDirection")):Connect(function() -- Line: 644 -- upvalues: a1 (val)
        a1:_wind()
    end)))
    a1.Maid:Mark(((GameState.Replicator:GetStateChangedSignal("GameOver")):Connect(function(a1_2) -- Line: 647 -- upvalues: a1 (val)
        if a1_2 and a1._FPSEnabled then
            a1.AbilityCallbacks.FPS()
        end
    end)))
    a1:_updateAmmo()
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Reloading")):Connect(function(a1_2) -- Line: 655 -- upvalues: a1 (val), SoundPool (upval)
        local v1 = a1._barrels[a1._currentBarrel]
        if not v1 then
            return
        end
        local ReloadStart = v1:FindFirstChild("ReloadStart")
        local ReloadFinished = v1:FindFirstChild("ReloadFinished")
        if not a1_2 and ReloadStart and ReloadStart:IsA("Sound") then
            ReloadStart:Stop()
        end
        local v2 = a1_2 and ReloadStart or ReloadFinished
        if v2 and v2:IsA("Sound") then
            local _soundPools = a1._soundPools or {}
            a1._soundPools = _soundPools
            local v3 = a1._soundPools[v2]
            if not v3 then
                local v4 = string.match(v2.SoundId or "", "%d+")
                local v5 = v4 and tonumber(v4)
                if v5 then
                    v3 = SoundPool.new({
                        size = 2,
                        audioGroup = "Towers",
                        timeScaled = true,
                        id = v5,
                        parent = v1,
                        volume = v2.Volume,
                    })
                    a1._soundPools[v2] = v3
                end
            end
            if v3 then
                v3:play({playbackSpeed = v2.PlaybackSpeed, volume = v2.Volume})
            end
        end
    end)))
    a1.Maid:Mark((RunService.Stepped:Connect(function(a1_2, a2) -- Line: 697
        -- upvalues: a1 (val), GameState (upval), EasySound (upval), CrosshairStore (upval), CameraController (upval)
        local v1
        if a1.Replicator:Get("WindDuration") and a1._barrels then
            v1 = a1._barrels[a1._currentBarrel]
            if v1 and v1:FindFirstChild("Spring") then
                if GameState.TimeScale ~= 0 then
                    v1.Spring.MaxVelocity = 0.05 / a1:GetCooldown() * a1._windPercent * GameState.TimeScale
                else
                    v1.Spring.MaxVelocity = 0
                end
            end
        end
        if a1._fireTick then
            v1 = tick() - a1._fireTick
            if a1:GetCooldown() + 0.05 < v1 then
                for i, j in a1._barrelLoopPlayers do
                    if j then
                        j:Stop()
                        EasySound.Destroy(j)
                        a1._barrelLoopPlayers[i] = nil
                    end
                end
            end
        end
        a1._aimPosition = a1._aimPosition:Lerp(a1._goalPosition, 10 * a2)
        CrosshairStore.removeSpread(80 * a2 * GameState.TimeScale)
        a1._recoilPosition = a1._recoilModelSpring:update(a2)
        a1:_updateHumanRig(a2)
        if a1:_isFirstPerson() then
            return
        end
        if not CameraController.enabled[a1] and a1.Replicator:Get("CanFire") then
            a1:_aim(a1._currentTargetPosition)
        end
    end)))
    a1.Maid:Mark((GatlingGun:onUnreliableEvent("ReplicateAimPosition", function(a1_2, a2) -- Line: 737 -- upvalues: a1 (val)
        if a2 ~= a1.Replicator:Get("UID") then
            return
        end
        a1:_aim(a1_2, true)
    end)))
    a1.Maid:Mark((GatlingGun:onUnreliableEvent("FireVisual", function(a1_2, a2) -- Line: 745 -- upvalues: a1 (val)
        if a2 ~= a1.Replicator:Get("UID") then
            return
        end
        a1:_fire(a1_2)
    end)))
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("FPS")):Connect(function(a1_2) -- Line: 752 -- upvalues: a1 (val)
        if a1_2 then
            a1._currentTargetPosition = nil
        end
    end)))
    a1.Maid:Mark((GatlingGun:onEvent("KickOut", function() -- Line: 758 -- upvalues: a1 (val)
        a1.AbilityCallbacks.FPS(nil, false)
    end)))
    a1.Maid:Mark((GatlingGun:onUnreliableEvent("BulletHit", function(a1) -- Line: 762 -- upvalues: EmitterManager (upval)
        EmitterManager.Emit("BulletHit", CFrame.new(a1), 2, 1, true)
    end)))
    if a1._isOwner then
        a1.Maid:Mark((GatlingGun:onEvent("Hit", function(a1) -- Line: 767
            -- upvalues: u150 (upval), SoundService (upval), u152 (upval), HttpService (upval), HitmarkerStore (upval)
            local u4 = u150:Clone()
            u4.Parent = SoundService
            u4.PlaybackSpeed = u152:NextNumber(0.9, 1.1)
            u4:Play()
            u4.Ended:Once(function() -- Line: 773 -- upvalues: u4 (val)
                u4:Destroy()
            end)
            local u24 = HttpService:GenerateGUID(false)
            HitmarkerStore.add(u24)
            task.delay(1, function() -- Line: 781 -- upvalues: HitmarkerStore (upval), u24 (val)
                HitmarkerStore.remove(u24)
            end)
        end)))
    end
    a1:Thread(function() -- Line: 787 -- upvalues: a1 (val), GatlingGun (upval)
        if a1._FPSEnabled and a1.Replicator:Get("Ammo") == 0 and not a1.Replicator:Get("Reloading") then
            GatlingGun:fireServer("Reload")
        end
        if a1._FPSEnabled and a1:_canShoot() then
            if a1._firing then
                a1:_fireGun()
                return
            end
            if a1.Replicator:Get("WindDirection") == "up" then
                GatlingGun:fireServer("StopFiring")
            end
            return
        end
        if not a1.Replicator:Get("Reloading") and a1.Replicator:Get("Ammo") ~= 0 then
            if a1.Replicator:Get("FPS") then
                return
            end
            local v1 = a1:FindTarget()
            if v1 and a1.Replicator:Get("CanFire") then
                a1._currentTargetPosition = v1.PrimaryPart.Position
                a1:_fire(v1.PrimaryPart.Position)
                a1:Delay((a1:GetCooldown()))
            end
            return
        end
    end)
    a1.Maid:Mark((a1.OnDestroy:Connect(function() -- Line: 825 -- upvalues: a1 (val), EasySound (upval)
        if a1._FPSEnabled then
            a1.AbilityCallbacks.FPS()
        end
        if a1._barrelLoopPlayers then
            for i, j in a1._barrelLoopPlayers do
                if j then
                    j:Stop()
                    EasySound.Destroy(j)
                end
            end
            a1._barrelLoopPlayers = nil
        end
        if a1._soundPools then
            for k, n in a1._soundPools do
                n:destroy()
            end
            a1._soundPools = nil
        end
    end)))
    a1._characterAnimations = {}
    for i, j in Character.Animations:GetChildren() do
        a1._characterAnimations[j.Name] = {}
        for k, n in j:GetChildren() do
            v1 = a1._characterAnimations[j.Name]
            v1[n.Name] = (a1.Model.Character.Humanoid.Animator:LoadAnimation(n))
        end
    end
    a1:_updateRig()
    a1._updatingRig = false
    a1.OnUpgrade:Connect(function() -- Line: 861 -- upvalues: a1 (val), RunService (upval)
        a1._updatingRig = true
        RunService.Heartbeat:Wait()
        a1:_updateRig()
        a1._updatingRig = false
        if a1._lastPosition then
            a1:_aim(a1._lastPosition, false)
        end
        if a1._soundPools then
            for i, j in a1._soundPools do
                j:destroy()
            end
            for k in a1._soundPools do
                a1._soundPools[k] = nil
            end
        end
    end)
    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 881 -- upvalues: a1 (val), RunService (upval)
        a1._updatingRig = true
        RunService.Heartbeat:Wait()
        a1:_updateRig()
        a1._updatingRig = false
        if a1._lastPosition then
            a1:_aim(a1._lastPosition, false)
        end
    end)))
    a1._characterAnimations.Walk.Left:Play(0)
    a1._characterAnimations.Walk.Right:Play(0)
    a1._characterAnimations.Walk.Left:AdjustWeight(0)
    a1._characterAnimations.Walk.Right:AdjustWeight(0)
end

function v1.PreviewPlacement(a1, a2) -- Line: 899 -- types: a1: table, a2: table
    a2.model.fakeCharacter:Destroy()
end

return v1