-- Script path: ReplicatedStorage.Content.Tower.Engineer.Animator
-- Decompile time: 11.83 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local u52 = Random.new()
local Children = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Client")):WaitForChild("ScrapMetal"):GetChildren()

local function getImpactPosition(a1, a2) -- Line: 21
    if typeof(a2) == "Vector3" then
        return a2
    end
    if typeof(a1) ~= "Instance" then
        return (Vector3.new(0, 0, 0))
    end
    if a1:IsA("BasePart") then
        return a1.Position
    end
    if not a1:IsA("Model") then
        return (Vector3.new(0, 0, 0))
    end
    local PrimaryPart = a1.PrimaryPart or a1:FindFirstChild("Part")
    if PrimaryPart and PrimaryPart:IsA("BasePart") then
        return PrimaryPart.Position
    end
    return a1:GetPivot().Position
end

local v1 = {}
v1.__index = v1

function v1:FaceWithTween(a2) -- Line: 49 -- upvalues: TweenService (val)
    local PrimaryPart = self.Model.PrimaryPart
    local v1 = self:Face(a2, nil, false)
    TweenService:Create(PrimaryPart, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {CFrame = v1}):Play()
end

function v1:Fire(a2) -- Line: 62
    -- upvalues: SharedControllerFunctions (val), Animation (val), EasySound (val), u52 (val), EmitterManager (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Handle = self.Model.Weapon.Gun:FindFirstChild("Handle")
    if not Handle then
        Handle = self.Model.Weapon.Gun
    end
    local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("UpperTorso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    local Ammo = self.Model.Weapon.Gun.Ammo
    self:Face(Position)
    if not self.FBXModel then
        SharedControllerFunctions.AimArmsAt(self, Position)
        SharedControllerFunctions.AimHeadAt(self, Position_2)
    end
    local v1 = self.Model.Animations.Fire:FindFirstChild((self:GetLevel())) or self.Model.Animations.Fire[0]
    self.CancelFireAnim()
    self.fireAnim = Animation.new({Track = v1.Fire, Target = self.Model.AnimationController})
    local Fire_2 = Handle:FindFirstChild("Fire") or self.Model.PrimaryPart:FindFirstChild("Fire")
    if Fire_2 and Fire_2:IsA("Sound") then
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = Fire_2.SoundId,
            parent = Handle,
            playbackSpeed = u52:NextNumber(0.8, 1.2),
        })
    end
    local HandleStart = if not self.Model:FindFirstChild("HandleStart") then self.Model.Weapon:FindFirstChild("HandleStart", true) else self.Model.HandleStart
    if not HandleStart then
        EmitterManager.manualEmit(Handle.Start)
    else
        EmitterManager.manualEmit(HandleStart)
    end
    self.fireAnim:Play()
    local Length = self.fireAnim.Controller.Length
    if Length then
        local Cooldown = self.State.Cooldown
        if Cooldown < Length then
            self.fireAnim.Controller:AdjustSpeed(1 / (Cooldown / Length))
        end
    end
    ;(self.fireAnim.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1) -- Line: 132 -- upvalues: Handle (val), EasySound (upval), u52 (upval)
        local v1 = Handle:FindFirstChild(a1)
        if v1 and v1:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                id = v1.SoundId,
                parent = Handle,
                playbackSpeed = u52:NextNumber(0.8, 1.2),
            })
        end
    end)
    ;(self.fireAnim.Controller:GetMarkerReachedSignal("Toggle")):Connect(function(a1) -- Line: 145 -- upvalues: Ammo (val)
        if a1 == "Hide" then
            Ammo.Transparency = 1
            return
        end
        Ammo.Transparency = 0
    end)
    local FireOutro = v1:FindFirstChild("FireOutro")
    if FireOutro then
        self.outroThread = task.spawn(function() -- Line: 155 -- upvalues: self (val), Animation (upval), FireOutro (val)
            if self.fireAnim then
                self.fireAnim.Controller.Stopped:Wait()
                if self.fireAnim.Controller.IsPlaying == false then
                    self.fireOutro = Animation.new({Track = FireOutro, Target = self.Model.AnimationController})
                    self.fireOutro:Play(0)
                end
            end
        end)
    end
    self:Delay(self.State.Cooldown)
end

function v1.Initialize(a1) -- Line: 172
    -- upvalues: SharedControllerFunctions (val), ReplicatedStorage (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: EmitterManager (val), Animation (val), EasySound (val), u52 (val), EffectsController (val)
    -- upvalues: Children (val), Projectile (val), getImpactPosition (val), Debris (val)
    local u1 = false
    a1.AmmoModel = a1.Model.Weapon.Gun.Ammo:Clone()
    a1.AmmoModel.Transparency = 0
    a1.AmmoModel.Anchored = false
    a1.AmmoModel.Ammo:Destroy()
    a1.fireAnim = nil
    a1.fireOutro = nil
    a1.outroThread = nil
    local u21 = {}
    for i, v in ipairs(a1.Model.Weapon.Gun:GetChildren()) do
        if v:IsA("BasePart") then
            table.insert(u21, v)
        end
    end

    local function setGunTransparency(a1_2) -- Line: 191 -- upvalues: u21 (val), a1 (val)
        for i, v in ipairs(u21) do
            v.Transparency = a1_2
        end
        if a1.Model.Weapon.Gun:IsA("BasePart") then
            a1.Model.Weapon.Gun.Transparency = a1_2
        end
    end

    if not a1.FBXModel then
        SharedControllerFunctions.RegisterJoints(a1, {
            a1.Model.Torso["Left Shoulder"],
            a1.Model.Torso["Right Shoulder"],
            a1.Model.PrimaryPart.Handle,
        })
    end

    function a1.CancelFireAnim() -- Line: 208 -- upvalues: a1 (val)
        if a1.fireAnim ~= nil and a1.fireAnim.Controller.IsPlaying then
            a1.fireAnim:Stop(0)
            a1.fireAnim = nil
        end
        if a1.fireOutro ~= nil and a1.fireOutro.Controller.IsPlaying then
            a1.fireOutro:Stop(0)
            a1.fireOutro = nil
            if a1.outroThread ~= nil then
                task.cancel(a1.outroThread)
                a1.outroThread = nil
            end
        end
    end

    a1:Thread(function() -- Line: 223 -- upvalues: a1 (val), u1 (ref)
        local v1 = a1:FindTarget()
        if v1 and u1 == false then
            a1:Fire(v1)
        end
    end)
    a1.Executables = {
        Build = function(a1_2, a2) -- Line: 234
            -- upvalues: u1 (ref), a1 (val), ReplicatedStorage (upval), TweenService (upval), TimescaleUtilities (upval)
            -- upvalues: EmitterManager (upval), Animation (upval), EasySound (upval), u52 (upval)
            -- upvalues: SharedControllerFunctions (upval), u21 (val), EffectsController (upval), Children (upval)
            local Handle, v1, v2
            u1 = true
            if a1.Model.Name == "Ghost" then
                local u11 = ReplicatedStorage.Assets.GhostTombstone:Clone()
                u11.Transparency = 1
                u11.CFrame = (CFrame.new(a2)) * CFrame.new(0, 4, 0) * CFrame.Angles(0, 1.5707963267948966, 0)
                local Size = u11.Size
                TweenService:Create(u11, TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Transparency = 0}):Play()
                TweenService:Create(u11, TweenInfo.new(1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out), {
                    Transparency = 0,
                    CFrame = (CFrame.new(a2)) * CFrame.new(0, Size.Y / 2, 0),
                }):Play()
                TimescaleUtilities.Delay(0.5, function() -- Line: 263 -- upvalues: u11 (val)
                    for i, j in u11:GetDescendants() do
                        if j:IsA("ParticleEmitter") then
                            j.Enabled = true
                        end
                    end
                end)
                TimescaleUtilities.Delay(1.1, function() -- Line: 271 -- upvalues: u11 (val), EmitterManager (upval), TimescaleUtilities (upval)
                    u11.Transparency = 1
                    EmitterManager.manualEmit(u11.Explosion)
                    TimescaleUtilities.CleanUp(u11, 2)
                end)
                u11.Parent = workspace.Terrain
                a1.CancelFireAnim()
                v1 = a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) or a1.Model.Animations.Fire[0]
                v2 = Animation.new({Track = v1.Build, Target = a1.Model.AnimationController})
                v2:Play(0)
                v2.Controller:AdjustSpeed(1)
                a1:FaceWithTween(a2)
                a1:Delay(a1_2)
                v2:Stop(0)
                u1 = false
                return
            end
            if a1.Model.Name == "Bunny" then
                local EggThrow = a1.Model.Weapon.Gun:FindFirstChild("EggThrow")
                if EggThrow and EggThrow:IsA("BasePart") then
                    a1.CancelFireAnim()
                    EggThrow.Transparency = 0
                    local v3 = a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) or a1.Model.Animations.Fire[0]
                    v1 = Animation.new({Track = v3.Build, Target = a1.Model.AnimationController})
                    v1:Play(0)
                    v1.Controller:AdjustSpeed(1)
                    local Build = a1.Model.PrimaryPart:FindFirstChild("Build")
                    if Build and Build:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            id = Build.SoundId,
                            parent = a1.Model.PrimaryPart,
                            playbackSpeed = u52:NextNumber(0.8, 1.2),
                            volume = Build.Volume,
                        })
                    end
                    a1:FaceWithTween(a2)
                    a1:Delay(a1_2)
                    v1:Stop(0)
                    EggThrow.Transparency = 1
                    u1 = false
                    return
                end
            end
            local Wrench = a1.Model.Weapon:FindFirstChild("Wrench")
            if not Wrench then
                Handle = Wrench
            else
                Handle = Wrench:FindFirstChild("Handle")
                if not Handle then
                    Handle = Wrench
                end
            end
            if not a1.FBXModel then
                SharedControllerFunctions.ResetJoints(a1)
            end
            if Handle and Handle:IsA("BasePart") then
                Handle.Transparency = 0
            end
            for i, v in ipairs(u21) do
                v.Transparency = 1
            end
            if a1.Model.Weapon.Gun:IsA("BasePart") then
                a1.Model.Weapon.Gun.Transparency = 1
            end
            a1.CancelFireAnim()
            v1 = a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) or a1.Model.Animations.Fire[0]
            v2 = Animation.new({Track = v1.Build, Target = a1.Model.AnimationController})
            v2:Play(0)
            v2.Controller:AdjustSpeed(1)
            local Build_2 = a1.Model.PrimaryPart:FindFirstChild("Build")
            if Build_2 and Build_2:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    id = Build_2.SoundId,
                    parent = a1.Model.PrimaryPart,
                    playbackSpeed = u52:NextNumber(0.8, 1.2),
                    volume = Build_2.Volume,
                })
            end
            local v4 = (v2.Controller:GetMarkerReachedSignal("Sound")):Connect(function(a1_2) -- Line: 373
                -- upvalues: Handle (val), EmitterManager (upval), EasySound (upval), u52 (upval)
                -- upvalues: EffectsController (upval), a1 (upval), a2 (val), Children (upval)
                if not Handle then
                    return
                end
                local v1 = Handle:FindFirstChild(a1_2)
                if Handle:FindFirstChild("Hit") then
                    EmitterManager.manualEmit(Handle.Hit)
                end
                if v1 then
                    if v1:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            id = v1.SoundId,
                            parent = Handle,
                            playbackSpeed = u52:NextNumber(0.8, 1.2),
                            volume = v1.Volume,
                        })
                    end
                    if a1_2 == "Hit" then
                        EffectsController.Cash(a1.Model.PrimaryPart.Position, a2, Children[u52:NextInteger(1, #Children)])
                        if Handle:FindFirstChild("Effect") then
                            EmitterManager.manualEmit(Handle.Effect)
                        end
                    end
                end
            end)
            a1:FaceWithTween(a2)
            a1:Delay(a1_2)
            v2:Stop(0)
            if Handle and Handle:IsA("BasePart") then
                Handle.Transparency = 1
            end
            for i2, i3 in ipairs(u21) do
                i3.Transparency = 0
            end
            if a1.Model.Weapon.Gun:IsA("BasePart") then
                a1.Model.Weapon.Gun.Transparency = 0
            end
            u1 = false
            v4:Disconnect()
        end,
        Projectile = function(a1_2, a2) -- Line: 419
            -- upvalues: a1 (val), EmitterManager (upval), Projectile (upval), getImpactPosition (upval), Debris (upval)
            -- upvalues: EasySound (upval), u52 (upval)
            local HandleStart, WorldPosition
            a2.Projectile = a1.AmmoModel
            a2.Decay = 0.75
            if not a1.FBXModel then
                WorldPosition = a1.Model.Weapon.Gun.Handle.Start.WorldPosition
                a2.Start = WorldPosition
                Projectile:Pierce(a2, function(a1_3, a2) -- Line: 448
                    -- upvalues: a1_2 (val), a1 (upval), getImpactPosition (upval), WorldPosition (ref)
                    -- upvalues: EmitterManager (upval), Debris (upval), EasySound (upval), u52 (upval)
                    local Attribute, v1
                    if not a1_2 then
                        return
                    end
                    if a1.FBXModel then
                        local PrimaryPart = a1_2.PrimaryPart or a1_2:FindFirstChild("Part") or a1_2
                        local v2 = getImpactPosition(PrimaryPart, a2)
                        v1 = a1.Model.PrimaryPart.Hit:Clone()
                        v1.Parent = workspace.Terrain
                        if not v1:IsA("BasePart") then
                            v1.WorldPosition = v2
                        else
                            v1.Position = v2
                        end
                        EmitterManager.manualEmit(v1)
                        game.Debris:AddItem(v1, 2)
                        return
                    end
                    local v3 = getImpactPosition(a1_3, a2)
                    local ExtentsSize = a1_3:IsA("Model") and a1_3:GetExtentsSize() or Vector3.new(0, 0, 0)
                    v1 = a1.Model.PrimaryPart.Hit:Clone()
                    if v1:IsA("BasePart") then
                        v1.CFrame = CFrame.lookAt(v3, WorldPosition)
                        v1.Parent = workspace.Terrain
                        EmitterManager.manualEmit(v1)
                        Debris:AddItem(v1, 1)
                        return
                    end
                    v1.Parent = workspace.Terrain
                    v1.WorldPosition = v3
                    for k, v in pairs(v1:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            v.ZOffset = ExtentsSize.X + ExtentsSize.Z
                            Attribute = v:GetAttribute("EmitCount")
                            if Attribute then
                                v:Emit(Attribute)
                            end
                        elseif v:IsA("Sound") then
                            EasySound.Play({
                                audioGroup = "Towers",
                                destroyOnEnd = true,
                                id = v.SoundId,
                                parent = v1,
                                playbackSpeed = v.PlaybackSpeed * u52:NextNumber(0.8, 1.1),
                                volume = v.Volume,
                            })
                            v.PlaybackSpeed = v.PlaybackSpeed * u52:NextNumber(0.8, 1.1)
                        end
                    end
                    Debris:AddItem(v1, 1)
                end)
                return
            end
            if not (if not a1.Model:FindFirstChild("HandleStart") then a1.Model.Weapon:FindFirstChild("HandleStart", true) else a1.Model.HandleStart) then
                return
            end
            WorldPosition = HandleStart.Value.WorldPosition
            EmitterManager.manualEmit(HandleStart.Value)
            a2.Start = WorldPosition
            Projectile:Pierce(a2, function(a1_3, a2) -- Line: 448
                -- upvalues: a1_2 (val), a1 (upval), getImpactPosition (upval), WorldPosition (ref)
                -- upvalues: EmitterManager (upval), Debris (upval), EasySound (upval), u52 (upval)
                local Attribute, v1
                if not a1_2 then
                    return
                end
                if a1.FBXModel then
                    local PrimaryPart = a1_2.PrimaryPart or a1_2:FindFirstChild("Part") or a1_2
                    local v2 = getImpactPosition(PrimaryPart, a2)
                    v1 = a1.Model.PrimaryPart.Hit:Clone()
                    v1.Parent = workspace.Terrain
                    if not v1:IsA("BasePart") then
                        v1.WorldPosition = v2
                    else
                        v1.Position = v2
                    end
                    EmitterManager.manualEmit(v1)
                    game.Debris:AddItem(v1, 2)
                    return
                end
                local v3 = getImpactPosition(a1_3, a2)
                local ExtentsSize = a1_3:IsA("Model") and a1_3:GetExtentsSize() or Vector3.new(0, 0, 0)
                v1 = a1.Model.PrimaryPart.Hit:Clone()
                if v1:IsA("BasePart") then
                    v1.CFrame = CFrame.lookAt(v3, WorldPosition)
                    v1.Parent = workspace.Terrain
                    EmitterManager.manualEmit(v1)
                    Debris:AddItem(v1, 1)
                    return
                end
                v1.Parent = workspace.Terrain
                v1.WorldPosition = v3
                for k, v in pairs(v1:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v.ZOffset = ExtentsSize.X + ExtentsSize.Z
                        Attribute = v:GetAttribute("EmitCount")
                        if Attribute then
                            v:Emit(Attribute)
                        end
                    elseif v:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            id = v.SoundId,
                            parent = v1,
                            playbackSpeed = v.PlaybackSpeed * u52:NextNumber(0.8, 1.1),
                            volume = v.Volume,
                        })
                        v.PlaybackSpeed = v.PlaybackSpeed * u52:NextNumber(0.8, 1.1)
                    end
                end
                Debris:AddItem(v1, 1)
            end)
        end,
    }
end

return v1