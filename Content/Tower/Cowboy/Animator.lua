-- Script path: ReplicatedStorage.Content.Tower.Cowboy.Animator
-- Decompile time: 13.67 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local u51 = {
    ["Spring Time"] = true,
    ["Mecha Bunny"] = true,
    ["Vampire Hunter"] = true,
    Shamrock = true,
    Patriotic = true,
    ["Most Wanted"] = true,
}
local v1 = {}
v1.__index = v1
local u60 = Random.new()

function v1.Initialize(a1) -- Line: 28
    -- upvalues: u51 (val), SharedControllerFunctions (val), Animation (val), EasySound (val), GameState (val)
    local Name = a1.Model.Name
    local Weapon = a1.Model.Weapon
    a1.left = false
    a1.spinning = false
    a1.shootCount = 0
    a1.outroTickStart = tick()
    a1.canOutro = false
    a1.hasOutro = false
    if not u51[Name] then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.PrimaryPart.LeftHandle,
            a1.Model.PrimaryPart.RightHandle,
        })
    end
    if a1.Model.Name == "Patriotic" then
        a1:Animate("Horse_Idle")
    end
    a1.Executables = {
        Cash = function(a1_2, a2) -- Line: 53
            -- upvalues: a1 (val), Animation (upval), Weapon (val), EasySound (upval), GameState (upval)
            local Configuration, Handle, Spin, Spin_2, Value, Value_2, v1, v2
            if not a1.Model:FindFirstChild("Owner") then
                return
            end
            a1:_rewardCash(a1_2)
            a1.spinning = true
            local Fire = a1.Model.Animations.Fire
            local Level = a1:GetLevel()
            local v3 = if not (Level >= 4) then if not (Level >= 3) then Fire["0"]:FindFirstChild("Spin") else if not Fire:FindFirstChild("3") then Fire["0"]:FindFirstChild("Spin") else Fire["3"]:FindFirstChild("Spin") else if not Fire:FindFirstChild("4") then if not (Level >= 3) then Fire["0"]:FindFirstChild("Spin") else if not Fire:FindFirstChild("3") then Fire["0"]:FindFirstChild("Spin") else Fire["3"]:FindFirstChild("Spin") else Fire["4"]:FindFirstChild("Spin")
            local SpinDuration = a1.Stats.Attributes.SpinDuration
            if v3 then
                local v4 = Animation.new({Track = v3, Target = a1.Model.AnimationController})
                v4:Play()
                local Length = v4.Controller.Length
                local v5 = Length > 0 and Length or 1
                if SpinDuration < v5 then
                    v4:AdjustSpeed(1 / (SpinDuration / v5))
                end
            end
            for i, j in Weapon:GetChildren() do
                Configuration = j:FindFirstChild("Configuration")
                if not Configuration then
                    v1 = 1 / (SpinDuration / Weapon.Gun1.Handle.Effect.Spin.Lifetime.Min)
                    for k, n in Weapon:GetChildren() do
                        Handle = n:FindFirstChild("Handle")
                        if Handle then
                            Handle.Effect.Spin.Lifetime = NumberRange.new(v1)
                            Handle.Effect.Spin:Emit(2)
                        end
                    end
                    a1.Model.Head.Spin:Play()
                else
                    if j.Name == "Gun1" then
                        Spin = Configuration.Sounds:FindFirstChild("Spin")
                        if Spin then
                            Value = Spin.Value
                            if Value and Value:IsA("Sound") then
                                EasySound.Play({
                                    audioGroup = "Towers",
                                    destroyOnEnd = true,
                                    id = Value.SoundId,
                                    parent = Value.Parent,
                                    playbackSpeed = GameState.TimeScale,
                                })
                            end
                        end
                    end
                    Spin_2 = Configuration.Attachments:FindFirstChild("Spin")
                    if Spin_2 then
                        Value_2 = Spin_2.Value
                        v2 = 1 / (SpinDuration / Value_2:FindFirstChildOfClass("ParticleEmitter").Lifetime.Min)
                        for m, i5 in Value_2:GetChildren() do
                            if i5:IsA("ParticleEmitter") then
                                i5.Lifetime = NumberRange.new(v2)
                                i5:Emit()
                            end
                        end
                    end
                end
            end
            a1:Delay(a2)
            a1.spinning = false
            a1.outroTickStart = tick()
        end,
    }
    a1:Thread(function() -- Line: 149 -- upvalues: a1 (val), GameState (upval)
        local v1 = a1:FindTarget()
        if v1 and not a1.spinning then
            a1.canOutro = false
            a1:Fire(v1)
            a1.canOutro = true
            a1.outroTickStart = tick()
            return
        end
        if a1.canOutro and not a1.spinning then
            local v2 = tick() - a1.outroTickStart
            if 0.5 * GameState.TimeScale < v2 then
                a1.canOutro = false
                a1:Outro()
            end
        end
    end)
    a1.Maid:Mark(function() -- Line: 168 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            a1._fireSoundPools = nil
        end
    end)
    a1.OnUpgrade:Connect(function() -- Line: 177 -- upvalues: a1 (val)
        if a1._fireSoundPools then
            for i, j in a1._fireSoundPools do
                j:destroy()
            end
            table.clear(a1._fireSoundPools)
        end
    end)
end

function v1:Fire(a2) -- Line: 187
    -- upvalues: u51 (val), SharedControllerFunctions (val), Animation (val), SoundPool (val), u60 (val)
    -- upvalues: EmitterManager (val)
    local Fire_2, Position, v1, v2, v3, v4, v5
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso")
    local Head = a2:FindFirstChild("Head")
    if not Torso then
        Position = PrimaryPart.Position
    else
        Position = Torso.Position
        if not Position then
            Position = PrimaryPart.Position
        end
    end
    local Level = self:GetLevel()
    local Weapon = self.Model.Weapon
    local Name = self.Model.Name
    local v6 = Weapon:FindFirstChild("Gun2") ~= nil
    self:Face(Position)
    if not u51[Name] then
        local Position_2 = Head and Head.Position or Position
        SharedControllerFunctions.AimArmsAt(self, Position)
        SharedControllerFunctions.AimHeadAt(self, Position_2)
    end
    local Gun1 = Weapon:FindFirstChild(if not self.left then "Gun1" else if not (Level >= 4) then "Gun1" else if not v6 then "Gun1" else "Gun2") or Weapon:FindFirstChild("Gun1")
    if not Gun1 then
        return
    end
    local Fire = self.Model.Animations.Fire
    if not (Level >= 4) then
        if Level ~= 5 then
            if not (Level >= 3) or not Fire:FindFirstChild("3") then
                Fire_2 = Fire["0"].Fire
                v1 = Fire["0"]:FindFirstChild("Idle")
            else
                Fire_2 = Fire["3"].Fire
                v1 = Fire["3"]:FindFirstChild("Idle")
            end
        elseif Fire:FindFirstChild("5") then
            v2 = Fire["5"]
            Fire_2 = self.left and v2:FindFirstChild("FireL") or v2:FindFirstChild("FireR") or v2.Fire
            v1 = v2:FindFirstChild("Idle")
        elseif not (Level >= 3) or not Fire:FindFirstChild("3") then
            Fire_2 = Fire["0"].Fire
            v1 = Fire["0"]:FindFirstChild("Idle")
        else
            Fire_2 = Fire["3"].Fire
            v1 = Fire["3"]:FindFirstChild("Idle")
        end
    elseif Fire:FindFirstChild("4") then
        v2 = Fire["4"]
        Fire_2 = self.left and v2:FindFirstChild("FireL") or v2:FindFirstChild("FireR") or v2.Fire
        v1 = v2:FindFirstChild("Idle")
    elseif Level ~= 5 then
        if not (Level >= 3) or not Fire:FindFirstChild("3") then
            Fire_2 = Fire["0"].Fire
            v1 = Fire["0"]:FindFirstChild("Idle")
        else
            Fire_2 = Fire["3"].Fire
            v1 = Fire["3"]:FindFirstChild("Idle")
        end
    elseif Fire:FindFirstChild("5") then
        v2 = Fire["5"]
        Fire_2 = self.left and v2:FindFirstChild("FireL") or v2:FindFirstChild("FireR") or v2.Fire
        v1 = v2:FindFirstChild("Idle")
    elseif not (Level >= 3) or not Fire:FindFirstChild("3") then
        Fire_2 = Fire["0"].Fire
        v1 = Fire["0"]:FindFirstChild("Idle")
    else
        Fire_2 = Fire["3"].Fire
        v1 = Fire["3"]:FindFirstChild("Idle")
    end
    if v1 and not self._idleADSAnim then
        v2 = Animation.new({
            IgnorePriority = true,
            Preload = true,
            Track = v1,
            Target = self.Model.AnimationController,
        })
        v2:Play(0)
        self._idleADSAnim = v2
    end
    Animation.new({
        IgnorePriority = true,
        Preload = true,
        Track = Fire_2,
        Target = self.Model.AnimationController,
    }):Play(0)
    local Configuration = Gun1:FindFirstChild("Configuration")
    if not Configuration then
        local Handle = Gun1:FindFirstChild("Handle")
        if not Handle then
            return
        end
        local Start = Handle.Start
        local Fire_4 = Handle:FindFirstChild("Fire")
        if Fire_4 and Fire_4:IsA("Sound") then
            v3 = string.match(Fire_4.SoundId or "", "%d+")
            v4 = v3 and tonumber(v3)
            if v4 then
                local _fireSoundPools_2 = self._fireSoundPools or {}
                self._fireSoundPools = _fireSoundPools_2
                v5 = self._fireSoundPools[Fire_4]
                if not v5 then
                    v5 = SoundPool.new({
                        size = 4,
                        audioGroup = "Towers",
                        id = v4,
                        parent = Handle,
                        volume = Fire_4.Volume,
                    })
                    self._fireSoundPools[Fire_4] = v5
                end
                v5:play({playbackSpeed = u60:NextNumber(0.8, 1.2), volume = Fire_4.Volume})
            end
        end
        EmitterManager.manualEmit(Start)
        self:ClearOutro()
        self:_bullet(Start.WorldPosition, Position, Level, Name)
        if Level >= 4 and v6 then
            self.left = not self.left
        end
        self:Delay((self.Replicator:Get("Cooldown")))
        return
    end
    local Fire_3 = Configuration.Sounds.Fire
    local Value = Fire_3 and Fire_3.Value
    if Value and Value:IsA("Sound") then
        local v7 = string.match(Value.SoundId or "", "%d+")
        v3 = v7 and tonumber(v7)
        if v3 then
            local _fireSoundPools = self._fireSoundPools or {}
            self._fireSoundPools = _fireSoundPools
            v4 = self._fireSoundPools[Value]
            if not v4 then
                v4 = SoundPool.new({
                    size = 4,
                    audioGroup = "Towers",
                    id = v3,
                    parent = Value.Parent,
                    volume = Value.Volume,
                })
                self._fireSoundPools[Value] = v4
            end
            v4:play({playbackSpeed = u60:NextNumber(0.8, 1.2), volume = Value.Volume})
        end
    end
    local Attribute_2 = Configuration:GetAttribute("FireDelay")
    local Attribute = Configuration:GetAttribute("CustomBullet")
    v5 = Attribute
    if typeof(v5) ~= "string" then
        Attribute = nil
    end
    local Starts = Configuration.Attachments:FindFirstChild("Starts")
    local Children = Starts
    if Children then
        Children = Starts:GetChildren()
    end
    if not Children then
        Children = {Configuration.Attachments.Start}
    end

    local function fireBullet() -- Line: 309
        -- upvalues: Children (ref), EmitterManager (upval), self (val), Position (val), Level (val), Name (val)
        -- upvalues: Attribute (ref)
        local Value
        for i, j in Children do
            Value = j.Value
            EmitterManager.manualEmit(Value)
            self:_bullet(Value.WorldPosition, Position, Level, Name, Attribute)
        end
    end

    if not Attribute_2 then
        fireBullet()
    else
        task.delay(Attribute_2, fireBullet)
    end
    if Level >= 4 and v6 then
        self.left = not self.left
    end
    self:Delay((self.Replicator:Get("Cooldown")))
end

function v1:Outro() -- Line: 368 -- upvalues: Animation (val), EasySound (val), GameState (val), EmitterManager (val)
    local Configuration, Handle, Outro, Spin, Value, v1
    if self._idleADSAnim then
        self._idleADSAnim:Stop()
        self._idleADSAnim = nil
    end
    local Fire = self.Model.Animations.Fire
    local Level = self:GetLevel()
    if not (if not (Level >= 4) then if not (Level >= 3) then Fire["0"]:FindFirstChild("Outro") else if not Fire:FindFirstChild("3") then Fire["0"]:FindFirstChild("Outro") else Fire["3"]:FindFirstChild("Outro") else if not Fire:FindFirstChild("4") then if not (Level >= 3) then Fire["0"]:FindFirstChild("Outro") else if not Fire:FindFirstChild("3") then Fire["0"]:FindFirstChild("Outro") else Fire["3"]:FindFirstChild("Outro") else Fire["4"]:FindFirstChild("Outro")) then
        return
    end
    local v2 = Animation.new({Preload = true, Track = v1, Target = self.Model.AnimationController})
    v2:Play()
    for i, j in self.Model.Weapon:GetChildren() do
        Configuration = j:FindFirstChild("Configuration")
        if not Configuration then
            Handle = j.Handle
            Handle.Effect.Spin.Lifetime = NumberRange.new(v2.Controller.Length)
            Handle.Effect.Spin:Emit(2)
        else
            if j.Name == "Gun1" then
                Outro = Configuration.Sounds:FindFirstChild("Outro") or Configuration.Sounds:FindFirstChild("Spin")
                if Outro then
                    Value = Outro.Value
                    if Value and Value:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            id = Value.SoundId,
                            parent = Value.Parent,
                            playbackSpeed = GameState.TimeScale,
                        })
                    end
                end
            end
            Spin = Configuration.Attachments:FindFirstChild("Spin")
            if Spin then
                EmitterManager.manualEmit(Spin.Value)
            end
        end
    end
end

function v1:ClearOutro() -- Line: 431
    local Configuration, Outro, Outro_2, Spin
    for i, j in self.Model.Weapon:GetChildren() do
        Configuration = j:FindFirstChild("Configuration")
        if not Configuration then
            j.Handle.Effect.Spin:Clear()
            Outro_2 = self.Model.Head:FindFirstChild("Outro")
            if Outro_2 then
                Outro_2:Stop()
            end
        else
            Outro = Configuration.Sounds:FindFirstChild("Outro") or Configuration.Sounds:FindFirstChild("Spin")
            if Outro and Outro.Value.IsPlaying then
                Outro.Value:Stop()
            end
            Spin = Configuration.Attachments:FindFirstChild("Spin")
            if Spin then
                for k, n in Spin.Value:GetChildren() do
                    if n:IsA("ParticleEmitter") then
                        n:Clear()
                    end
                end
            end
        end
    end
end

function v1:_bullet(a2, a3, a4, a5, a6) -- Line: 462
    -- upvalues: 
    local v1 = nil
    local v2 = nil
    local v3 = false
    if a5 == "Spring Time" then
        v1 = if not (a4 >= 4) then "SpringTimeCowboyBase" else "SpringTimeCowboyMax"
    elseif a5 == "Mecha Bunny" then
        v2 = a4 >= 4 and Color3.fromRGB(255, 0, 0) or nil
    end
    if a5 == "Patriotic" then
        local v4 = {"Blue", "Red", "White"}
        v1 = v4[math.random(1, 3)] .. "Patriotic"
        v3 = true
    end
    if a6 then
        v1 = a6
    end
    self:Bullet({
        Start = a2,
        End = a3,
        Spread = 50,
        Speed = 140,
        Color = v2,
        NoColor = v3,
        Bullet = v1,
    })
end

function v1:_rewardCash(a2) -- Line: 500
    -- upvalues: Players (val), u60 (val), EffectsController (val), TimescaleUtilities (val)
    local PlayerByUserId = Players:GetPlayerByUserId(self.Model.Owner.Value)
    local Character = PlayerByUserId and PlayerByUserId.Character and PlayerByUserId.Character:FindFirstChild("HumanoidRootPart")
    if PlayerByUserId and Character and a2 > 0 then
        local Attribute
        local u53 = Character.CFrame * CFrame.new(
            Character.Size.X / 2 * u60:NextNumber(-1, 1),
            Character.Size.Y / 2 * u60:NextNumber(-1, 1),
            Character.Size.Z / 2 * u60:NextNumber(-1, 1)
        )
        local CashParticle = self.Model.PrimaryPart:FindFirstChild("CashParticle")
        if not CashParticle then
            Attribute = 1
        else
            Attribute = CashParticle:GetAttribute("AmountSpawn")
            if not Attribute then
                Attribute = 1
            end
        end
        task.spawn(function() -- Line: 514
            -- upvalues: Attribute (val), CashParticle (val), EffectsController (upval), self (val), u53 (val)
            -- upvalues: TimescaleUtilities (upval)
            local v1
            for i = 1, Attribute do
                v1 = CashParticle
                if v1 and v1:IsA("Folder") then
                    v1 = (v1:GetChildren())[math.random(1, #v1:GetChildren())]
                end
                EffectsController.Cash(self.Model.PrimaryPart.Position, u53.p, v1)
                TimescaleUtilities.Wait(math.random(1, 2) / 15)
            end
        end)
    end
end

return v1