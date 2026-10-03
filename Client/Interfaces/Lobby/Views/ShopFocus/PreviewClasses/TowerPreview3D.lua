-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.TowerPreview3D
-- Decompile time: 18.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Shared = ReplicatedStorage.Shared
local Modules = Shared.Modules
local Packages = ReplicatedStorage.Packages
local Animation = require(Modules.Animation)
local Content = require(ReplicatedStorage.Shared.Modules.Content)
local EasySound = require(Modules.EasySound)
local EmitterManager = require(Modules.EmitterManager)
local PreviewBase = require(script.Parent.PreviewBase)
local Promise = require(Packages.Promise)
local Sift = require(Packages.Sift)
local ItemPresentations = require(Shared.UI.ItemPresentations)
local Upgrades = require(Modules.Upgrades)
local u43 = setmetatable({}, PreviewBase)
u43.__index = u43

function u43.new(a1, a2) -- Line: 59
    -- upvalues: Content (val), Sift (val), PreviewBase (val), u43 (val)
    a1:SetAttribute("Level", 0)
    local Name = a2 or a1.Name
    local v1 = Content("Tower"):FindFirstChild(Name)
    local Upgrade = v1 and v1:FindFirstChild("Upgrade")
    local v2 = if not Upgrade then nil else if not Upgrade:IsA("ModuleScript") then nil else require(Upgrade)
    local v3 = Sift.Dictionary.join(PreviewBase.new(a1), {
        destroyed = false,
        path = 1,
        upgradeLevel = 0,
        baseModel = a1:Clone(),
        legacyUpgrades = v2,
        name = Name,
        preparePresentation = u43.preparePresentation,
        prepareUpgradePresentation = u43.prepareUpgradePresentation,
        setupAnimations = u43.setupAnimations,
        playIdleAnimation = u43.playIdleAnimation,
        playPreviewMusic = u43.playPreviewMusic,
        playUpgradePresentation = u43.playUpgradePresentation,
        stopPreviewMusic = u43.stopPreviewMusic,
        Spawn = u43.Spawn,
        SetUpgrade = u43.SetUpgrade,
        StepPresentation = u43.StepPresentation,
    })
    v3:preparePresentation()
    return (setmetatable(v3, u43))
end

local function resolveBone(a1) -- Line: 96 -- types: a1: userdata?
    if a1 and a1:IsA("ObjectValue") then
        local Value = a1.Value
        if Value and Value:IsA("Bone") then
            return Value
        end
        return nil
    end
    return nil
end

local function prepareWorkspacePhysics(a1, a2) -- Line: 105 -- types: a1: userdata, a2: userdata
    local v1 = {[a2] = true}
    for i, j in a2:GetConnectedParts(true) do
        v1[j] = true
    end
    for k, n in a1:GetDescendants() do
        if n:IsA("BasePart") then
            n.CanCollide = false
            n.CanQuery = false
            n.CanTouch = false
            if not v1[n] then
                n.Anchored = true
            end
        end
    end
    a2.Anchored = true
end

function u43:preparePresentation() -- Line: 131
    local v1, v2
    local model = self.model
    self.presentationState = nil
    if self.name ~= "Pursuit" then
        if self.name == "Ace Pilot" then
            local Weapon_2 = model:FindFirstChild("Weapon")
            local Main = Weapon_2 and Weapon_2:FindFirstChild("Main")
            if Main and Main:IsA("BasePart") then
                local HumanoidRootPart = model:FindFirstChild("HumanoidRootPart")
                if HumanoidRootPart then
                    HumanoidRootPart:Destroy()
                end
                local Propeller = Weapon_2:FindFirstChild("Propeller")
                local Motor = Propeller and Propeller:FindFirstChild("Motor")
                model.PrimaryPart = Main
                local v3 = {
                    kind = "Ace Pilot",
                    elapsed = 0,
                    scaleMultiplier = 1,
                    propellerMotor = if not Motor then nil else if not Motor:IsA("Motor6D") then nil else Motor,
                    propellerRotation = CFrame.identity,
                }
                v3.rotationOffset = (CFrame.Angles(0, 3.141592653589793, 0):Inverse()) * CFrame.Angles(0, -0.3490658503988659, 3.141592653589793)
                self.presentationState = v3
                return
            end
            return
        end
        return
    end
    local Weapon = model:FindFirstChild("Weapon")
    local Heli = Weapon and Weapon:FindFirstChild("Heli")
    if not Heli then
        return
    end
    local PrimaryPart = nil
    if Heli:IsA("Folder") then
        local RootPart = model:FindFirstChild("RootPart")
        PrimaryPart = if not RootPart then nil else if not RootPart:IsA("BasePart") then nil else RootPart
    elseif Heli:IsA("Model") then
        PrimaryPart = Heli.PrimaryPart
    elseif Heli:IsA("BasePart") then
        PrimaryPart = Heli
    end
    if not PrimaryPart then
        return
    end
    local v4 = 1
    if model.Name ~= "Dragon" then
        local Upgrades = model:FindFirstChild("Upgrades")
        local v5 = Upgrades and Upgrades:FindFirstChild("0")
        v2 = v5 and v5:FindFirstChild("BasePad")
    else
        v2 = model:FindFirstChild("BasePad")
        v4 = 0.8
    end
    if v2 then
        v2:Destroy()
    end
    local Configuration = Heli:FindFirstChild("Configuration")
    local Bones = Configuration and Configuration:FindFirstChild("Bones")
    model.PrimaryPart = PrimaryPart
    local v6 = {
        kind = "Pursuit",
        elapsed = 0,
        propellerRotation = CFrame.identity,
        rotationOffset = CFrame.Angles(0, 0.3490658503988659, 0),
        scaleMultiplier = v4,
    }
    local TailRotor = Bones and Bones:FindFirstChild("TailRotor")
    if not TailRotor then
        v1 = nil
    elseif TailRotor:IsA("ObjectValue") then
        local Value = TailRotor.Value
        v1 = if not Value then nil else if not Value:IsA("Bone") then nil else Value
    else
        v1 = nil
    end
    v6.tailRotorBone = v1
    local TopRotor = Bones and Bones:FindFirstChild("TopRotor")
    if not TopRotor then
        v1 = nil
    elseif TopRotor:IsA("ObjectValue") then
        local Value_2 = TopRotor.Value
        v1 = if not Value_2 then nil else if not Value_2:IsA("Bone") then nil else Value_2
    else
        v1 = nil
    end
    v6.topRotorBone = v1
    self.presentationState = v6
end

local function getAnimationTarget(a1, a2) -- Line: 215 -- types: a1: userdata, a2: userdata
    local Parent = a2.Parent
    local v1 = Parent and (Parent:FindFirstChild("AnimationController") or Parent:FindFirstChildOfClass("Humanoid")) or a1:FindFirstChild("AnimationController", true) or a1:FindFirstChildWhichIsA("Humanoid", true)
    if not v1 then
        return nil
    end
    local Animator = v1:FindFirstChildOfClass("Animator")
    if not Animator then
        Animator = Instance.new("Animator")
        Animator.Parent = v1
    end
    return Animator
end

local function getAnimationKey(a1, a2) -- Line: 235 -- types: a1: userdata, a2: userdata
    local Parent = a2
    while Parent.Parent do
        if Parent.Parent == a1 then
            break
        end
        Parent = Parent.Parent
    end
    if Parent.Parent ~= a1 then
        return nil
    end
    if Parent == a2 then
        return a2.Name, "0"
    end
    local Parent_2 = a2
    while Parent_2.Parent do
        if Parent_2.Parent == Parent then
            break
        end
        Parent_2 = Parent_2.Parent
    end
    return Parent.Name, Parent_2.Name
end

function u43.setupAnimations(a1) -- Line: 260
    -- upvalues: Promise (val), getAnimationTarget (val), getAnimationKey (val), Animation (val)
    return Promise.new(function(a1_2) -- Line: 261
        -- upvalues: a1 (val), getAnimationTarget (upval), getAnimationKey (upval), Animation (upval)
        local v1 = {}
        local model = a1.model
        local Animations = model:FindFirstChild("Animations", true)
        if Animations then
            local v2 = getAnimationTarget(model, Animations)
            if v2 then
                local v3, v4, v5
                for i, j in Animations:GetDescendants() do
                    if j:IsA("Animation") then
                        v3, v4 = getAnimationKey(Animations, j)
                        if v3 and v4 then
                            v5 = v1[v3] or {}
                            v1[v3] = v5
                            v5 = v1[v3]
                            v5[v4] = (Animation.new({
                                IgnorePriority = true,
                                IsPersistent = true,
                                Preload = true,
                                Track = j,
                                Target = v2,
                                Entity = a1,
                            }))
                        end
                    end
                end
            end
        end
        a1.animations = v1
        a1_2()
    end)
end

local function enableContinuousVfx(a1) -- Line: 297 -- types: a1: userdata
    local v1
    for i, j in a1:GetDescendants() do
        if j:GetAttribute("EmitCount") == nil then
            if j:IsA("ParticleEmitter") then
                v1 = 0 < j.Rate
                j.Enabled = v1
            elseif j:IsA("Beam") or j:IsA("Trail") then
                j.Enabled = true
            end
        end
    end
end

local function enableTaggedVfx(a1, a2) -- Line: 311 -- types: a1: userdata, a2: string
    for i, j in a1:GetDescendants() do
        if j:GetAttribute(a2) then
            if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                j.Enabled = true
            end
        end
    end
end

local function disableEffects(a1) -- Line: 327 -- types: a1: userdata
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
            j.Enabled = false
        end
    end
end

local function revealUpgradeFaces(a1, a2, a3) -- Line: 339 -- types: a1: userdata, a2: string, a3: number
    local v1, v2
    local Upgrades = a1:FindFirstChild("Upgrades")
    if not Upgrades then
        return
    end
    for i = 0, a3 do
        v2 = Upgrades:FindFirstChild((tostring(i)))
        if v2 then
            for j, k in v2:GetDescendants() do
                v1 = false
                if a2 == "Medic" then
                    v1 = false
                    if i == 5 then
                        v1 = k:IsA("Decal") and k.Name == "Face"
                    end
                end
                if k:GetAttribute("Face") or v1 then
                    if k:IsA("BasePart") or k:IsA("Decal") or k:IsA("Texture") then
                        k.Transparency = 0
                    end
                end
            end
        end
    end
end

local function attachAssassinEffects(a1, a2) -- Line: 370
    -- upvalues: disableEffects (val)
    local Attachment, Effects, ParentBone, Value, v1, v2
    local Upgrades = a1:FindFirstChild("Upgrades")
    if not Upgrades then
        return
    end
    for i = 0, a2 do
        v2 = Upgrades:FindFirstChild((tostring(i)))
        Effects = v2 and v2:FindFirstChild("Effects")
        if Effects then
            for j, k in Effects:GetChildren() do
                ParentBone = k:FindFirstChild("ParentBone")
                Attachment = k:FindFirstChildOfClass("Attachment")
                Value = if not ParentBone then nil else if not ParentBone:IsA("ObjectValue") then nil else ParentBone.Value
                if Attachment and Value then
                    v1 = Value:FindFirstChild(Attachment.Name, true)
                    if v1 then
                        v1:Destroy()
                    end
                    Attachment:Clone().Parent = Value
                    disableEffects(k)
                end
            end
        end
    end
end

local function createJesterBomb(a1, a2, a3) -- Line: 404
    -- upvalues: EmitterManager (val)
    local Bombs = a1:FindFirstChild("Bombs")
    local Weapon = a1:FindFirstChild("Weapon")
    local GunRig = a1:FindFirstChild("GunRig")
    local v1 = Bombs and Bombs:FindFirstChild(a2)
    local v2 = GunRig and GunRig:FindFirstChild(a3)
    if v1 and v1:IsA("Model") and Weapon and v2 and v2:IsA("BasePart") then
        local v3 = v1:Clone()
        if not v3.PrimaryPart then
            v3:Destroy()
            return nil
        end
        v3.Name = ("ShopFocus%*%*"):format(a2, a3)
        v3.Parent = Weapon
        v3:PivotTo(v2.CFrame * (CFrame.Angles(0, -1.5707963267948966, 0)))
        for i, j in v3:GetDescendants() do
            if j:IsA("BasePart") then
                j.Anchored = false
                j.Transparency = 0
            end
        end
        local WeldConstraint = Instance.new("WeldConstraint")
        WeldConstraint.Part0 = v3.PrimaryPart
        WeldConstraint.Part1 = v2
        WeldConstraint.Parent = v3.PrimaryPart
        EmitterManager.toggle(v3, true)
        return v3
    end
    return nil
end

local function showJesterBombs(a1, a2) -- Line: 441
    -- upvalues: createJesterBomb (val)
    if a2 < 4 then
        return
    end
    local Weapon = a1:FindFirstChild("Weapon")
    if not Weapon then
        return
    end
    local Fire = Weapon:FindFirstChild("Fire")
    if Fire then
        Fire:Destroy()
    end
    createJesterBomb(a1, "Fire", "BombRight")
    createJesterBomb(a1, "Fire", "BombLeft")
end

function u43:prepareUpgradePresentation() -- Line: 460
    -- upvalues: revealUpgradeFaces (val), EmitterManager (val), enableTaggedVfx (val), attachAssassinEffects (val)
    -- upvalues: showJesterBombs (val), disableEffects (val)
    local model = self.model
    revealUpgradeFaces(model, self.name, self.upgradeLevel)
    if self.name == "Medic" and 5 <= self.upgradeLevel then
        local Upgrades = model:FindFirstChild("Upgrades")
        local v1 = Upgrades and Upgrades:FindFirstChild("5")
        if v1 then
            EmitterManager.toggle(v1, true)
        end
    end
    if self.name == "Brawler" and model.Name == "Blazing" and 5 <= self.upgradeLevel then
        enableTaggedVfx(model, "EFFECT")
    end
    if self.name == "Assassin" then
        attachAssassinEffects(model, self.upgradeLevel)
        return
    end
    if self.name == "Jester" then
        showJesterBombs(model, self.upgradeLevel)
        return
    end
    if self.name == "Rocketeer" and model.Name == "Tiderunner" then
        local Weapon = model:FindFirstChild("Weapon")
        local Weapon_2 = Weapon and Weapon:FindFirstChild("Weapon")
        if not Weapon_2 then
            return
        end
        disableEffects(Weapon_2)
        return
    end
    if self.name == "Commando" then
        for i, j in model:GetDescendants() do
            if j:IsA("Light") then
                j.Enabled = false
            end
        end
    end
end

function u43:playUpgradePresentation() -- Line: 501 -- upvalues: Animation (val)
    if self.name == "DJ Booth" and self.model.Name == "Mako" and 5 <= self.upgradeLevel then
        local Upgrades = self.model:FindFirstChild("Upgrades")
        local v1 = Upgrades and Upgrades:FindFirstChild("5")
        local Holo = v1 and v1:FindFirstChild("Holo")
        local AnimationController = Holo and Holo:FindFirstChild("AnimationController")
        local Animation_2 = Holo and Holo:FindFirstChild("Animation")
        if AnimationController and Animation_2 and Animation_2:IsA("Animation") then
            local Animator = AnimationController:FindFirstChildOfClass("Animator")
            if not Animator then
                Animator = Instance.new("Animator")
                Animator.Parent = AnimationController
            end
            local v2 = Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Target = Animator,
                Track = Animation_2,
                Entity = self,
            })
            self.animations.Hologram = {["5"] = v2}
            local v3 = v2:Play(0)
            local Idle = self.animations.Idle and self.animations.Idle["5"]
            local Controller = Idle and Idle.Controller
            if v3 and Controller and 0 < Controller.Length and 0 < v3.Length then
                v3.TimePosition = Controller.TimePosition / Controller.Length * v3.Length
            end
            return
        end
        return
    end
end

function u43:playIdleAnimation(a2) -- Line: 537 -- types: a2: number
    local v1
    local animations = self.animations and (not (self.name ~= "Pursuit") and self.animations.Fly or self.animations.Idle)
    if not animations then
        return
    end
    local v2 = nil
    local v3 = if not self.path or not (0 < self.path) then nil else string.char(96 + self.path)
    for i = 0, a2 do
        if not v3 then
            if animations[tostring(i)] then
                v2 = animations[tostring(i)]
            end
        elseif animations[("%*%*"):format(i, v3)] then
            v2 = animations[("%*%*"):format(i, v3)]
        elseif animations[tostring(i)] then
            v2 = animations[tostring(i)]
        end
    end
    if v2 then
        v2:Play()
        return
    end
    _, v1 = next(animations)
    if v1 then
        v1:Play()
    end
end

function u43:playPreviewMusic(a2) -- Line: 566 -- upvalues: EasySound (val) -- types: a2: userdata
    if self.name == "DJ Booth" and not self.previewMusic then
        local PrimaryPart = self.model.PrimaryPart
        local Music = PrimaryPart and PrimaryPart:FindFirstChild("Music")
        if Music and Music:IsA("Sound") then
            self.previewMusic = EasySound.Play({
                name = "ShopFocusDJMusic",
                volume = 0.5,
                looped = true,
                audioGroup = "DJ",
                timeScaled = false,
                id = Music.SoundId,
                parent = a2,
                playbackSpeed = Music.PlaybackSpeed,
            })
            return
        end
        return
    end
end

function u43:stopPreviewMusic() -- Line: 589 -- upvalues: EasySound (val)
    if self.previewMusic then
        EasySound.Destroy(self.previewMusic)
        self.previewMusic = nil
    end
end

function u43.Spawn(a1, a2) -- Line: 596
    -- upvalues: Promise (val), ItemPresentations (val), prepareWorkspacePhysics (val), PreviewBase (val)
    return ((Promise.new(function(a1_2, a2_2) -- Line: 598
        -- upvalues: a1 (val), ItemPresentations (upval), prepareWorkspacePhysics (upval), a2 (val), PreviewBase (upval)
        local WorldPosition, result, success, u127, v1, v2, v3
        local Lobby = workspace:FindFirstChild("Lobby")
        local ShopFocus = Lobby and Lobby:FindFirstChild("ShopFocus")
        if not ShopFocus then
            a2_2("'ShopFocus' not found in workspace.Lobby for ShopFocus")
            return false
        end
        local Main = ShopFocus:FindFirstChild("Main")
        if not Main then
            a2_2("Spawn part not found in 'ShopFocus' for ShopFocus")
            return false
        end
        local model = a1.model
        local PrimaryPart = model.PrimaryPart
        if not PrimaryPart then
            a2_2("Model has no PrimaryPart for ShopFocus")
            return false
        end
        local HeightOffset = model:FindFirstChild("HeightOffset", true)
        if HeightOffset and HeightOffset:IsA("Attachment") then
            model:ScaleTo(1.75 * (if not a1.presentationState then 1 else a1.presentationState.scaleMultiplier))
            v3 = 0
            if model:FindFirstChild("FlightPos", true) then
                v3 = 2
            end
            v1 = Main.Position + Vector3.new(0, Main.Size.Y / 2, 0) + Vector3.new(0, v3, 0)
            WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
            v2 = v1 - WorldPosition
            model:PivotTo((model:GetPivot()) + v2)
            model.Parent = workspace
            if a1.name == "Gatling Gun" then
                u127 = ItemPresentations("Towers", a1.name)
                if u127 and u127.Init then
                    success, result = pcall(function() -- Line: 653 -- upvalues: u127 (val), model (val)
                        u127.Init(model, {Offset = Vector3.new(0, 0, 0)}, false)
                    end)
                    if not success then
                        warn((("Error applying ShopFocus presentation for \"%*\" \"%*\":\n\n%*"):format(a1.name, model.Name, result)))
                    end
                end
            end
            a1:prepareUpgradePresentation()
            prepareWorkspacePhysics(model, PrimaryPart)
            if not a2 then
                PreviewBase.TurnTowardsCamera(a1)
                if a1.presentationState then
                    model:PivotTo((model:GetPivot()) * a1.presentationState.rotationOffset)
                end
            else
                model:PivotTo((CFrame.new((model:GetPivot()).Position)) * a2)
            end
            a1:playPreviewMusic(Main)
            a1_2(model)
            return
        end
        if not a1.presentationState then
            a2_2("PrimaryPart has no HeightOffset for ShopFocus")
            return false
        end
        model:ScaleTo(1.75 * (if not a1.presentationState then 1 else a1.presentationState.scaleMultiplier))
        v3 = 0
        if model:FindFirstChild("FlightPos", true) then
            v3 = 2
        end
        v1 = Main.Position + Vector3.new(0, Main.Size.Y / 2, 0) + Vector3.new(0, v3, 0)
        WorldPosition = if not HeightOffset then PrimaryPart.Position else if not HeightOffset:IsA("Attachment") then PrimaryPart.Position else HeightOffset.WorldPosition
        v2 = v1 - WorldPosition
        model:PivotTo((model:GetPivot()) + v2)
        model.Parent = workspace
        if a1.name == "Gatling Gun" then
            u127 = ItemPresentations("Towers", a1.name)
            if u127 and u127.Init then
                success, result = pcall(function() -- Line: 653 -- upvalues: u127 (val), model (val)
                    u127.Init(model, {Offset = Vector3.new(0, 0, 0)}, false)
                end)
                if not success then
                    warn((("Error applying ShopFocus presentation for \"%*\" \"%*\":\n\n%*"):format(a1.name, model.Name, result)))
                end
            end
        end
        a1:prepareUpgradePresentation()
        prepareWorkspacePhysics(model, PrimaryPart)
        if not a2 then
            PreviewBase.TurnTowardsCamera(a1)
            if a1.presentationState then
                model:PivotTo((model:GetPivot()) * a1.presentationState.rotationOffset)
            end
        else
            model:PivotTo((CFrame.new((model:GetPivot()).Position)) * a2)
        end
        a1:playPreviewMusic(Main)
        a1_2(model)
    end)):andThen(function() -- Line: 682 -- upvalues: a1 (val)
        return a1:setupAnimations()
    end)):andThen(function() -- Line: 685 -- upvalues: a1 (val)
        if a1.destroyed then
            return
        end
        a1:playIdleAnimation(a1.upgradeLevel)
        a1:playUpgradePresentation()
    end)
end

function u43.StepPresentation(a1, a2) -- Line: 695 -- types: a2: number
    local v1
    local presentationState = a1.presentationState
    if not presentationState then
        return CFrame.identity
    end
    if presentationState.kind ~= "Pursuit" then
        presentationState.elapsed = presentationState.elapsed + a2
        v1 = math.sin(presentationState.elapsed * 2) * 0.09
        local v2 = math.cos(presentationState.elapsed * 2) * 0.09
        if presentationState.propellerMotor then
            presentationState.propellerRotation = presentationState.propellerRotation * CFrame.Angles(0, 0, a2 * 31.41592653589793)
            presentationState.propellerMotor.C1 = presentationState.propellerRotation
        end
        return (CFrame.new(v1, v2, 0)) * CFrame.Angles(v1 / 4, 0, v2 / 4)
    end
    v1 = a2 * 17.453292519943297
    if presentationState.topRotorBone then
        local topRotorBone = presentationState.topRotorBone
        topRotorBone.Transform = topRotorBone.Transform * CFrame.Angles(0, v1, 0)
    end
    if presentationState.tailRotorBone then
        local tailRotorBone = presentationState.tailRotorBone
        tailRotorBone.Transform = tailRotorBone.Transform * CFrame.Angles(0, v1 * 1.5, 0)
    end
    return CFrame.identity
end

function u43.SetUpgrade(a1, a2, a3) -- Line: 725
    -- upvalues: Promise (val), Upgrades (val)
    return (Promise.new(function(a1_2, a2_2) -- Line: 730 -- upvalues: a1 (val), a3 (ref), a2 (val), Upgrades (upval)
        if a1.destroyed then
            a2_2("Cannot upgrade a destroyed ShopFocus tower preview")
            return
        end
        a3 = a3 or a1.path or 1
        local model = a1.model
        local Parent = model.Parent
        local animations = a1.animations
        local path = a1.path
        local presentationState = a1.presentationState
        local upgradeLevel = a1.upgradeLevel
        local Rotation = (model:GetPivot()).Rotation
        local u31 = a1.baseModel:Clone()
        local u32 = {}
        u32.Name = a1.name
        u32.Path = a3
        u32.Model = u31
        u32._jointData = {}
        u32.FireAnim = {
            IsPlaying = true,
            Play = function() end,
            Stop = function() end,
        }

        function u32.CreateProjectile() end

        function u32.CreateVisualizer() end

        local success, result = pcall(function() -- Line: 757 -- upvalues: u31 (val), a2 (upval), Upgrades (upval), u32 (val), a1 (upval), a3 (upval)
            local Upgrades_2, v1, v2, v3
            u31:SetAttribute("Level", 0)
            local v4 = a2
            for i = 1, v4 do
                if u31:FindFirstChild("UpgradesModule") then
                    Upgrades.upgrade(u32, i, "tower")
                elseif a1.legacyUpgrades and u31:FindFirstChild("Upgrades") then
                    Upgrades_2 = u31:FindFirstChild("Upgrades")
                    v1 = if not a3 or not (a3 > 0) then nil else string.char(96 + a3)
                    v2 = (if not v1 then nil else Upgrades_2:FindFirstChild((("%*%*"):format(i, v1)))) or Upgrades_2:FindFirstChild((tostring(i)))
                    v3 = a1.legacyUpgrades[i]
                    if v3 then
                        v3(u31, v2, u32)
                    end
                end
            end
            u31:SetAttribute("Level", a2)
        end)
        if not success then
            u31:Destroy()
            a2_2(result)
            return
        end
        if a1.destroyed then
            u31:Destroy()
            a2_2("ShopFocus tower preview was destroyed during an upgrade")
            return
        end
        a1.pendingOldModel = model
        model.Parent = nil
        a1.model = u31
        a1.path = a3
        a1.upgradeLevel = a2
        a1.animations = {}
        a1:preparePresentation()
        ;((a1:Spawn(Rotation)):andThen(function() -- Line: 798 -- upvalues: a1 (upval), model (val), u31 (val), a2_2 (val), a1_2 (val)
            if not a1.destroyed then
                a1.pendingOldModel = nil
                model:Destroy()
                a1_2()
                return
            end
            a1.pendingOldModel = nil
            model:Destroy()
            u31:Destroy()
            a2_2("ShopFocus tower preview was destroyed during an upgrade")
        end)):catch(function(a1_2) -- Line: 811
            -- upvalues: u31 (val), a1 (upval), model (val), a2_2 (val), animations (val), path (val)
            -- upvalues: presentationState (val), upgradeLevel (val), Parent (val)
            u31:Destroy()
            a1.pendingOldModel = nil
            if a1.destroyed then
                model:Destroy()
                a2_2(a1_2)
                return
            end
            a1.model = model
            a1.animations = animations
            a1.path = path
            a1.presentationState = presentationState
            a1.upgradeLevel = upgradeLevel
            model.Parent = Parent
            a2_2(a1_2)
        end)
    end))
end

function u43:Destroy() -- Line: 831 -- upvalues: PreviewBase (val)
    if self.destroyed then
        return
    end
    self.destroyed = true
    self:stopPreviewMusic()
    if self.pendingOldModel then
        self.pendingOldModel:Destroy()
        self.pendingOldModel = nil
    end
    PreviewBase.Destroy(self)
    self.baseModel:Destroy()
end

return u43