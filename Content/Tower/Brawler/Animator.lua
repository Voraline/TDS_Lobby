-- Script path: ReplicatedStorage.Content.Tower.Brawler.Animator
-- Decompile time: 11.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1

local function emitParticles(a1, a2) -- Line: 23
    local Attribute
    local v1 = a2
    for k, v in pairs(a1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            if v1 then
                v.ZOffset = v.ZOffset + v1
            end
            Attribute = v:GetAttribute("EmitCount")
            v:Emit(Attribute)
        end
    end
end

function v1.Initialize(a1) -- Line: 34
    -- upvalues: Animation (val), Maid (val), ClientAtoms (val), EasySound (val), emitParticles (val)
    -- upvalues: TimescaleUtilities (val), EmitterManager (val), ItemDrop (val), ReplicatedStorage (val)
    -- upvalues: EffectsController (val), Shaker (val), RunService (val), PathPlacementCursorController (val)
    -- upvalues: SharedControllerFunctions (val)
    local PrimaryPart = a1.Model.PrimaryPart
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    a1.currentState = nil
    a1.prevState = nil
    a1.prevAnimLevel = 0
    a1.animations = {}
    local u17 = true
    a1.Y = PrimaryPart.Position.Y
    local u21 = RaycastParams.new()
    u21.FilterType = Enum.RaycastFilterType.Include
    u21.FilterDescendantsInstances = {workspace:WaitForChild("Ground")}
    local Jump = Animations:FindFirstChild("Jump")
    if Jump:IsA("Animation") then
        a1._jumpAnimation = Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Target = AnimationController,
            Track = Animations:WaitForChild("Jump"),
        })
    elseif Jump:IsA("Folder") and Jump:FindFirstChild("Loop") then
        a1._jumpIntro = Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Target = AnimationController,
            Track = Jump:WaitForChild("Intro"),
        })
        a1._jumpLoop = Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Target = AnimationController,
            Track = Jump:WaitForChild("Loop"),
        })
        a1._jumpOutro = Animation.new({
            Preload = true,
            IgnorePriority = true,
            IsPersistent = true,
            Target = AnimationController,
            Track = Jump:WaitForChild("Outro"),
        })
    end
    local u79 = Maid.new()

    local function setAbilityActivationBlocked(a1) -- Line: 87 -- upvalues: ClientAtoms (upval) -- types: a1: boolean
        ClientAtoms.cloneTowerAtom(function(a1_2) -- Line: 88 -- upvalues: a1 (val)
            if a1_2.blockOtherAbilities == a1 then
                return a1_2
            end
            local v1 = table.clone(a1_2)
            v1.blockOtherAbilities = a1
            return v1
        end)
    end

    a1.Maid:Mark(function() -- Line: 99 -- upvalues: ClientAtoms (upval)
        local cloneTowerAtom = ClientAtoms.cloneTowerAtom
        local u2 = false
        cloneTowerAtom(function(a1) -- Line: 88 -- upvalues: u2 (val)
            if a1.blockOtherAbilities == u2 then
                return a1
            end
            local v1 = table.clone(a1)
            v1.blockOtherAbilities = u2
            return v1
        end)
    end)

    local function u87() -- Line: 103 -- upvalues: a1 (val), u79 (val)
        a1:ToggleReposition({enabled = false, range = 2})
        if a1.crossHair then
            a1.crossHair:Destroy()
            a1.crossHair = nil
        end
        u79:Sweep()
    end

    local function adjustLvl(a1_2) -- Line: 117 -- upvalues: a1 (val) -- types: a1_2: number
        if a1.Model.Animations.Attack:FindFirstChild(a1_2) then
            return a1_2
        end
        if a1_2 >= 1 then
            return 1
        end
        return 0
    end

    function a1:_loadAnimations(a2) -- Line: 125
        -- upvalues: Animations (val), Animation (upval), AnimationController (val)
        for k, v in pairs(self.animations) do
            v:Stop(0)
        end
        table.clear(self.animations)
        local v1 = 0
        for i = 1, a2 do
            if (Animations:WaitForChild("Attack")):FindFirstChild(i) then
                v1 = i
            end
        end
        for i2, j in ipairs(Animations:WaitForChild("Attack")[v1]:GetChildren()) do
            v2.animations[j.Name] = (Animation.new({
                Preload = true,
                IgnorePriority = true,
                IsPersistent = true,
                Target = AnimationController,
                Track = j,
            }))
        end
        if v2.Model.Name == "Jordan" and 5 <= (v2:GetLevel()) then
            v2.Model:PivotTo((v2.Model:GetPivot()) * (CFrame.new(0, 0.5, 0)))
        end
        if v3 >= 5 then
            for k2, n in v2.Model:GetDescendants() do
                if n:GetAttribute("EFFECT") then
                    n.Enabled = true
                end
            end
        end
    end

    function a1:_face(a2) -- Line: 163 -- upvalues: PrimaryPart (val)
        local v1 = CFrame.new()
        if self.Model.Name == "Jordan" and 5 <= (self:GetLevel()) then
            v1 = CFrame.new(0, 0.5, 0)
        end
        return CFrame.new(Vector3.new(PrimaryPart.CFrame.Position.X, self.Y, PrimaryPart.CFrame.Position.Z), (Vector3.new(a2.X, self.Y, a2.Z))) * v1
    end

    function a1._attackTarget(a1, a2, a3) -- Line: 180
        -- upvalues: PrimaryPart (val), EasySound (upval), emitParticles (upval), TimescaleUtilities (upval)
        -- upvalues: EmitterManager (upval)
        local v1
        local v2 = not not a1.Stats.Attributes.KnockbackForce
        local v3 = not not a1.Stats.Attributes.FinalHitDmg
        local FinalHitCD = a3 == a1.Stats.Attributes.MaxCombo and a1.Stats.Attributes.FinalHitCD or a1.Stats.Cooldown
        if v3 and v1 and v2 then
            local v4 = PrimaryPart:FindFirstChild("Brawler Knockback")
            if v4 and v4:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = v4.SoundId,
                    parent = PrimaryPart,
                    playbackSpeed = 1 + Random.new():NextNumber(-0.1, 0.1),
                })
            end
        end
        if a2 and a2.PrimaryPart then
            PrimaryPart.CFrame = a1:_face(a2.PrimaryPart.Position)
        end
        local BrawlerHit = PrimaryPart:FindFirstChild("BrawlerHit")
        if BrawlerHit and BrawlerHit:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = BrawlerHit.SoundId,
                parent = PrimaryPart,
                playbackSpeed = 1 + Random.new():NextNumber(-0.1, 0.1),
            })
        end
        local Name = a1.Model.Name
        if a2 and a2.Parent ~= nil then
            local Hit, v5
            if a1.FBXModel then
                local v6 = a1.Model.HitEffects:FindFirstChild(a1.Upgrade) or a1.Model.HitEffects:FindFirstChild("0")
                Hit = v6 and v6:Clone()
            else
                Hit = a1.Model["Right Arm"].Hit
                if Name == "Jordan" then
                    if 5 <= (a1:GetLevel()) then
                        Hit = a1.Model["Right Arm"].Hit2
                    end
                elseif Name == "Lovestriker" and 5 <= (a1:GetLevel()) then
                    Hit = a1.Model["Right Arm"].Hit2
                end
            end
            if Hit:IsA("BasePart") then
                Hit.Position = a2.PrimaryPart.Position
                Hit.Parent = workspace.Terrain
                v5 = Hit:FindFirstChild((("Attack_%*"):format(a3)))
                if not v5 then
                    EmitterManager.manualEmit(Hit)
                else
                    EmitterManager.manualEmit(v5)
                end
                TimescaleUtilities.CleanUp(Hit, 1)
            else
                v5 = Hit:Clone()
                local X = a2:GetExtentsSize().X
                local v7 = X / 4
                local v8 = Vector3.new((Random.new()):NextNumber(-v7, v7), (Random.new()):NextNumber(-v7, v7), ((Random.new()):NextNumber(-v7, v7)))
                v5.Parent = workspace.Terrain
                v5.WorldPosition = a2.PrimaryPart.Position + v8
                emitParticles(v5, X)
                TimescaleUtilities.CleanUp(v5, 1)
            end
        end
        if a1._previousAnimation then
            a1._previousAnimation:Stop(0)
        end
        local BrawlerSwing = PrimaryPart:FindFirstChild((("BrawlerSwing%*"):format(a3))) or PrimaryPart:FindFirstChild("BrawlerSwing")
        if BrawlerSwing and BrawlerSwing:IsA("Sound") then
            EasySound.Play({
                audioGroup = "Towers",
                destroyOnEnd = true,
                timeScaled = true,
                id = BrawlerSwing.SoundId,
                parent = PrimaryPart,
                playbackSpeed = 1 + Random.new():NextNumber(-0.1, 0.1),
            })
        end
        local animations = a1.animations
        local Attack1 = animations[("Attack%*"):format(if not ((a1:GetLevel()) < 2) then a3 else math.random(1, 2))] or a1.animations.Attack1
        Attack1:Play(0.02)
        a1._previousAnimation = Attack1
        a1:Delay(FinalHitCD)
    end

    a1.states = {attack = {onEnter = a1._attackTarget}}

    function a1:_changeState(a2, ...) -- Line: 298 -- types: self: table, a2: string
        local v1 = {...}
        local v2 = self.states[self.prevState]
        if v2 then
            local onLeave = v2.onLeave
            if onLeave then
                onLeave()
            end
        end
        local v3 = self.states[a2]
        if v3 then
            local onEnter = v3.onEnter
            self.currentState = a2
            if onEnter then
                onEnter(self, table.unpack(v1))
            end
        end
    end

    a1.Executables = {
        RepositionEffect = function(a1_2) -- Line: 321
            -- upvalues: PrimaryPart (val), EasySound (upval), a1 (val), ItemDrop (upval), TimescaleUtilities (upval)
            -- upvalues: EmitterManager (upval), ReplicatedStorage (upval), EffectsController (upval), Shaker (upval)
            PrimaryPart.CFrame = CFrame.new(PrimaryPart.Position, (Vector3.new(a1_2.X, PrimaryPart.Position.Y, a1_2.Z)))
            if PrimaryPart:FindFirstChild("JumpSoundReplacement")
                and PrimaryPart.JumpSoundReplacement:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = PrimaryPart.JumpSoundReplacement.SoundId,
                    parent = PrimaryPart,
                    playbackSpeed = PrimaryPart.JumpSoundReplacement.PlaybackSpeed,
                })
            end
            local Rotation = PrimaryPart.CFrame.Rotation
            local v1 = PrimaryPart:FindFirstChild("Brawler Jump Up")
            if v1 and v1:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    playbackSpeed = 1,
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = v1.SoundId,
                    parent = PrimaryPart,
                })
            end
            if a1._jumpAnimation then
                a1._jumpAnimation:Play(0.1)
            elseif not a1._jumpIntro or not a1._jumpLoop then
                a1:Animate("Jump", nil, {0.1})
            else
                a1._jumpIntro:Play()
                a1._jumpLoop:Play()
            end
            a1:Delay(0.25)
            local Position_3 = a1.Model:GetPivot().Position
            local v2 = ItemDrop.GetTimeToDestinationWithGV(Position_3, a1_2, -3, 6) / 6
            TimescaleUtilities.Delay(v2 - 0.15, function() -- Line: 379 -- upvalues: PrimaryPart (upval), EasySound (upval)
                local v1 = PrimaryPart:FindFirstChild("Brawler Jump Down")
                if v1 and v1:IsA("Sound") then
                    EasySound.Play({
                        audioGroup = "Towers",
                        playbackSpeed = 1,
                        destroyOnEnd = true,
                        timeScaled = true,
                        id = v1.SoundId,
                        parent = PrimaryPart,
                    })
                end
            end)
            local Trail = a1.Model:FindFirstChild("Trail", true)
            if Trail and Trail:IsA("Attachment") then
                for i, j in Trail:GetDescendants() do
                    if j:IsA("Trail") then
                        j.Enabled = true
                    end
                end
            end
            ;(ItemDrop.Drop(Position_3, a1_2, a1.Model, 6, -3, 6, function(a1, a2, a3) -- Line: 410
                return CFrame.new(a3, a2).Rotation
            end)):andThen(function() -- Line: 416
                -- upvalues: a1 (upval), a1_2 (val), EmitterManager (upval), ReplicatedStorage (upval)
                -- upvalues: TimescaleUtilities (upval), EffectsController (upval), PrimaryPart (upval), Trail (val)
                -- upvalues: Shaker (upval), Rotation (val)
                local v1
                if a1.Model.PrimaryPart:FindFirstChild("GroundSmash") then
                    a1.Model.PrimaryPart.GroundSmash.CFrame = CFrame.new(a1_2)
                    EmitterManager.manualEmit(a1.Model.PrimaryPart.GroundSmash)
                end
                if a1.Model:FindFirstChild("LandEffect") then
                    v1 = a1.Model.LandEffect:Clone()
                    v1:PivotTo((CFrame.new(a1_2)))
                    v1.Parent = workspace.Terrain
                    EmitterManager.manualEmit(v1.Attachment)
                    TimescaleUtilities.CleanUp(v1, 6)
                elseif a1.Model.Name == "Jordan" then
                    v1 = ReplicatedStorage.Assets.Effects.Particles["32GroundSmash"]:Clone()
                    v1:PivotTo((CFrame.new(a1_2)))
                    EmitterManager.manualEmit(v1.Attachment)
                    if (Random.new():NextNumber()) <= 0.05 then
                        EmitterManager.manualEmit(v1.Warning)
                    end
                    v1.Parent = workspace
                    TimescaleUtilities.CleanUp(v1, 3)
                elseif a1.Model.Name ~= "Lovestriker" then
                    EffectsController.GroundSmash((CFrame.new(PrimaryPart.HeightOffset.WorldPosition)) * CFrame.new(0, 0.1, 0), 25)
                else
                    EmitterManager.Emit("LovestrikerCrashdown", CFrame.new(a1_2))
                    a1._jumpIntro:Stop()
                    a1._jumpLoop:Stop()
                    a1._jumpOutro:Play()
                end
                if Trail and Trail:IsA("Attachment") then
                    for i, j in Trail:GetDescendants() do
                        if j:IsA("Trail") then
                            j.Enabled = false
                        end
                    end
                end
                Shaker:Shake({8, 30, 0.1, 1}, 0.1, 0.5)
                a1.Model:PivotTo((CFrame.new(a1_2)) * Rotation)
                if a1.Model.Name == "Jordan" and 5 <= (a1:GetLevel()) then
                    task.defer(function() -- Line: 467 -- upvalues: a1 (upval)
                        a1.Model:PivotTo((a1.Model:GetPivot()) * (CFrame.new(0, 0.5, 0)))
                    end)
                end
            end)
        end,
        Attack = function(a1_2, a2) -- Line: 474 -- upvalues: a1 (val) -- types: a2: number
            a1:_changeState("attack", a1_2, a2)
        end,
    }
    a1.AbilityCallbacks = {
        Reposition = function() -- Line: 480
            -- upvalues: ClientAtoms (upval), u17 (ref), u87 (val), a1 (val), ReplicatedStorage (upval), u79 (val)
            -- upvalues: RunService (upval), PathPlacementCursorController (upval), u21 (val)
            -- upvalues: SharedControllerFunctions (upval)
            local cloneTowerAtom = ClientAtoms.cloneTowerAtom
            local u2 = true
            cloneTowerAtom(function(a1) -- Line: 88 -- upvalues: u2 (val)
                if a1.blockOtherAbilities == u2 then
                    return a1
                end
                local v1 = table.clone(a1)
                v1.blockOtherAbilities = u2
                return v1
            end)
            local success, result = pcall(function() -- Line: 483
                -- upvalues: u17 (upval), u87 (upval), a1 (upval), ReplicatedStorage (upval), u79 (upval)
                -- upvalues: RunService (upval), PathPlacementCursorController (upval), u21 (upval)
                -- upvalues: SharedControllerFunctions (upval)
                u17 = false
                task.defer(function() -- Line: 486 -- upvalues: u17 (upval)
                    u17 = true
                end)
                u87()
                a1.crossHair = ReplicatedStorage.Assets.Effects.Client.Reposition_Crosshair:Clone()
                a1.crossHair.Parent = workspace.Terrain
                a1.crossHair.OuterRing.OuterTarget.Size = Vector3.new(4, 0.02199999988079071, 4)
                local u24 = nil
                local OuterTarget = a1.crossHair.OuterRing.OuterTarget
                local FillColor = a1.crossHair.Highlight.FillColor
                u79:Mark((RunService.Heartbeat:Connect(function(a1_2) -- Line: 503
                    -- upvalues: u24 (ref), PathPlacementCursorController (upval), a1 (upval), u21 (upval)
                    -- upvalues: OuterTarget (val), FillColor (val)
                    u24 = PathPlacementCursorController.CurrentPosition
                    local Cross = a1.crossHair.OuterRing.Cross
                    Cross.CFrame = Cross.CFrame * CFrame.Angles(0, math.rad(90 * a1_2), 0)
                    local v1 = workspace
                    local v2 = u24 + Vector3.new(0, 100, 0)
                    local v3 = u21
                    v1 = v1:Raycast(v2, Vector3.new(0, -1000, 0), v3)
                    v2 = if not v1 then CFrame.new(u24) else CFrame.new(v1.Position)
                    OuterTarget.CFrame = v2
                    a1.crossHair:PivotTo((CFrame.new(u24)) * (CFrame.new(0, 0.025, 0)))
                    a1.crossHair.Highlight.FillColor = if not PathPlacementCursorController.CantPlace then FillColor else Color3.fromRGB(255, 0, 0)
                end)))
                a1:ToggleReposition({enabled = true, range = 2})
                local v1 = SharedControllerFunctions.getPlacement():await()
                if u17 then
                    u87()
                end
                if not v1 then
                    return false
                end
                return {position = u24}
            end)
            local cloneTowerAtom_2 = ClientAtoms.cloneTowerAtom
            local u11 = false
            cloneTowerAtom_2(function(a1) -- Line: 88 -- upvalues: u11 (val)
                if a1.blockOtherAbilities == u11 then
                    return a1
                end
                local v1 = table.clone(a1)
                v1.blockOtherAbilities = u11
                return v1
            end)
            if success then
                return result
            end
            warn("[Brawler.Animator] Reposition selection failed", result)
            return false
        end,
    }
    a1:_loadAnimations((a1:GetLevel()))
    ;(a1.Replicator:GetStateChangedSignal("Upgrade")):Connect(function(a1_2) -- Line: 559 -- upvalues: a1 (val)
        local v1
        if a1.prevAnimLevel == (if not a1.Model.Animations.Attack:FindFirstChild(a1_2) then if not (a1_2 >= 1) then 0 else 1 else a1_2) then
            return
        end
        a1:_loadAnimations(v1)
        a1.prevAnimLevel = v1
    end)
end

return v1