-- Script path: ReplicatedStorage.Content.Tower.Necromancer.Animator
-- Decompile time: 13.72 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GraveStoneAnimator = require(script.GraveStoneAnimator)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local v1 = {}
v1.__index = v1

function v1:CreateGravestone(a2, a3, a4) -- Line: 19
    -- upvalues: GraveStoneAnimator (val)
    return GraveStoneAnimator.new(a2, a3, a4, self.Stats.Attributes.BuildTime - self.Stats.Attributes.BuildDelay, self)
end

function v1:HookGraveReplicator() -- Line: 24
    local function onStateChanged(a1, a2) -- Line: 25 -- upvalues: self (val) -- types: a1: string
        local v1 = a2[1]
        if v1 == "Create" then
            local v2, v3, v4
            local v5 = self.graves[a1]
            _, v2, v3, v4 = unpack(a2)
            if v5 then
                return
            end
            self.graves[a1] = (self:CreateGravestone(v3, v4, v2))
            return
        end
        if v1 ~= "Destroy" then
            if self.graves[a1] then
                self.graves[a1]:ReplicateAction((unpack(a2)))
            end
            return
        end
        if not self.graves[a1] then
            return
        end
        self.graves[a1]:Destroy()
        self.graves[a1] = nil
    end

    self.graveReplicator.Changed:Connect(onStateChanged)
    for i, j in self.graveReplicator:GetAllStates() do
        task.spawn(onStateChanged, i, j)
    end
end

function v1:SetStanceAnimation(a2, a3, a4) -- Line: 56 -- upvalues: GameState (val)
    local v1 = a4 * GameState.TimeScale
    local v2 = self.animationStances[a2][a3]
    local v3 = 0
    if v2 then
        if self.currentAnimation == v2 then
            return
        end
        v2:Play()
        if v1 then
            if v2.Looped then
                v1 = math.clamp(v1 - 0.1, 0, (1 / 0))
            end
            v2:AdjustSpeed(v1)
        end
    end
    for k, v in pairs(self.animationStances) do
        for k2, i in pairs(v) do
            if i.IsPlaying and k2 == a3 then
                v3 = v2.Length * (i.TimePosition / i.Length * GameState.TimeScale)
            end
            if i ~= v2 then
                i:Stop()
            end
        end
    end
    if v2 then
        v2.TimePosition = v3
        self.currentAnimation = v2
    end
    self.currentStance = a3
end

function v1:StopAllAninmations() -- Line: 102
    for k, v in pairs(self.animationStances) do
        for k2, i in pairs(v) do
            i:Stop()
        end
    end
end

function v1:CheckDist(a2) -- Line: 110
    if (self.Model.PrimaryPart.Position - a2).Magnitude <= self:GetRange() then
        return true
    end
    return false
end

function v1:UpdateEnemyBeams() -- Line: 118
    local PrimaryPart, PrimaryPart_2
    local v1 = if self.summoning ~= false then false else if self.raising ~= false then false else not (self.firing ~= true)
    for k, v in pairs(self.beams) do
        if not v:IsA("Model") then
            PrimaryPart_2 = k.PrimaryPart
            if PrimaryPart_2 == nil or v.Attachment1 == nil or k.Parent == nil then
                v:Destroy()
                self.beams[k] = nil
            elseif not PrimaryPart_2 or self:CheckDist(PrimaryPart_2.Position) ~= false then
                v.Enabled = v1
            else
                v:Destroy()
                self.beams[k] = nil
            end
        else
            PrimaryPart = k.PrimaryPart
            if PrimaryPart == nil or v.Parent == nil or k.Parent == nil then
                v:Destroy()
                self.beams[k] = nil
            elseif not PrimaryPart then
                for i, j in v:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Beam") or j:IsA("Trail") then
                        j.Enabled = v1
                    end
                end
            elseif self:CheckDist(PrimaryPart.Position) ~= false then
                for k2, n in v:GetDescendants() do
                    if n:IsA("ParticleEmitter") or n:IsA("Beam") or n:IsA("Trail") then
                        n.Enabled = v1
                    end
                end
            else
                v:Destroy()
                self.beams[k] = nil
            end
        end
    end
end

function v1:CreateEnemyBeams() -- Line: 161 -- upvalues: Create (val)
    local Attachment, Attachment_2, Tome, Torso, Torso_2, v1, v2
    local v3 = nil
    local v4 = nil
    local v5 = self
    for i, j in self.targets, v3, v4 do
        if v5.beams[j] == nil then
            if v5.Model.Name == "Duck" then
                v1 = v5.Model.Beam:Clone()
                v1.Start.CFrame = v5.Model.BeamStart.CFrame
                for k, n in v1:GetDescendants() do
                    if n:IsA("ParticleEmitter") or n:IsA("Beam") or n:IsA("Trail") then
                        n.Enabled = true
                    end
                end
                Torso_2 = j:FindFirstChild("Torso") or j:FindFirstChild("Upper Torso") or j.PrimaryPart
                if Torso_2 then
                    if not Torso_2:FindFirstChild("Center") then
                        Attachment_2 = Instance.new("Attachment")
                        Attachment_2.Name = "Center"
                        Attachment_2.Parent = Torso_2
                    end
                    v1.End.Position = Torso_2.Center.WorldPosition
                    v1.Start.Anchored = false
                    v1.End.Anchored = false
                    Create("WeldConstraint", {Part0 = v1.End, Part1 = Torso_2, Parent = v1.End})
                    Create("WeldConstraint", {
                        Part0 = v1.Start,
                        Part1 = v5.Model.BeamStart,
                        Parent = v1.Start,
                    })
                    v1.Parent = workspace.Trash
                end
                v5.beams[j] = v1
            elseif v5.Model.Name == "Creepy Santa" then
                v1 = v5.Model.Beam:Clone()
                v1.Start.CFrame = v5.Model.BeamStart.CFrame
                for m, i5 in v1:GetDescendants() do
                    if i5:IsA("ParticleEmitter") or i5:IsA("Beam") or i5:IsA("Trail") then
                        i5.Enabled = true
                    end
                end
                Torso_2 = j:FindFirstChild("Torso") or j:FindFirstChild("Upper Torso") or j.PrimaryPart
                if Torso_2 then
                    if not Torso_2:FindFirstChild("Center") then
                        Attachment_2 = Instance.new("Attachment")
                        Attachment_2.Name = "Center"
                        Attachment_2.Parent = Torso_2
                    end
                    v1.End.Position = Torso_2.Center.WorldPosition
                    v1.Start.Anchored = false
                    v1.End.Anchored = false
                    Create("WeldConstraint", {Part0 = v1.End, Part1 = Torso_2, Parent = v1.End})
                    Create("WeldConstraint", {
                        Part0 = v1.Start,
                        Part1 = v5.Model.BeamStart,
                        Parent = v1.Start,
                    })
                    v1.Parent = workspace.Trash
                end
                v5.beams[j] = v1
            elseif v5.Upgrade == 4 then
                Tome = v5.Model.Weapon:FindFirstChild("Tome")
                if Tome then
                    v2 = v5.Model.PrimaryPart:WaitForChild("Beam"):Clone()
                    v2.Name = "BeamClone"
                    v2.Parent = v5.Model.PrimaryPart
                    v2.Attachment0 = Tome.Book.Start
                    Torso = j:FindFirstChild("Torso") or j:FindFirstChild("Upper Torso") or j.PrimaryPart
                    if Torso then
                        if not Torso:FindFirstChild("Center") then
                            Attachment = Instance.new("Attachment")
                            Attachment.Name = "Center"
                            Attachment.Parent = Torso
                        end
                        v2.Attachment1 = Torso.Center
                        v2.Enabled = true
                        v2.CurveSize0 = Random.new():NextNumber(-2, 2)
                        v2.CurveSize1 = Random.new():NextNumber(-2, 2)
                    end
                    v5.beams[j] = v2
                end
            end
        end
    end
end

function v1:EnableBook(a2) -- Line: 240 -- types: self: table, a2: boolean
    local Tome = self.Model.Weapon:FindFirstChild("Tome")
    if Tome then
        for k, v in pairs(Tome.Book.Start:GetChildren()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = a2
            end
        end
    end
end

function v1.Initialize(a1) -- Line: 251
    -- upvalues: SharedControllerFunctions (val), TagReplicator (val), RunService (val), Maid (val), EasySound (val)
    -- upvalues: EmitterManager (val), Projectile (val), GameState (val)
    local v1, v2
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1.units = {}
    a1.graves = {}
    a1.targets = {}
    a1.beams = {}
    a1.summoning = false
    a1.firing = false
    a1.raising = false
    a1.FBXModel = a1.Model.PrimaryPart:FindFirstChildOfClass("Bone")
    a1.right = false
    a1.currentStance = ""
    a1.currentAnimation = nil
    a1.animationStances = {}
    for k, v in pairs(a1.Model.Animations:WaitForChild("Fire"):GetChildren()) do
        v2 = tonumber(v.Name)
        a1.animationStances[v2] = {}
        for k2, i in pairs(v:GetChildren()) do
            v1 = a1.animationStances[v2]
            v1[i.Name] = (AnimationController:LoadAnimation(i))
        end
    end
    if a1.Model:FindFirstChild("Torso") then
        SharedControllerFunctions.RegisterJoints(a1, {a1.Model.Torso["Left Shoulder"], a1.Model.Torso["Right Shoulder"]})
    end
    a1.graveReplicator = TagReplicator.getReplicatorEntityFromFolder(a1.Replicator.Folder:WaitForChild("GraveStone"))
    a1:HookGraveReplicator()
    a1.Maid:Mark(a1.graveReplicator)
    a1.Maid:Mark(function() -- Line: 293 -- upvalues: a1 (val)
        for i, j in a1.graves do
            a1.graves[i] = nil
            task.spawn(j.Destroy, j)
        end
        table.clear(a1.graves)
    end)
    a1.lastAimed = tick()
    a1.lastTargeted = tick()
    a1.aiming = false
    a1.Maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 307 -- upvalues: a1 (val)
        a1:UpdateEnemyBeams()
    end)))
    a1._soundLoopMaid = Maid.new()
    a1:Thread(function() -- Line: 313 -- upvalues: a1 (val)
        local v1 = a1:FindTarget()
        if not a1.raising and not a1.summoning then
            if v1 and 4 <= (a1:GetLevel()) then
                local PrimaryPart = v1.PrimaryPart
                if not a1.aiming then
                    a1.aiming = true
                    a1.lastAimed = tick()
                    if a1.Model.PrimaryPart:FindFirstChild("Intro") then
                        a1.Model.PrimaryPart.Intro:Play()
                        a1._soundLoopMaid:Mark((a1.Model.PrimaryPart.Intro.Ended:Once(function() -- Line: 325 -- upvalues: a1 (upval)
                            a1.Model.PrimaryPart.Loop:Play()
                        end)))
                    end
                    local Length = a1.animationStances[4].BookIntro.Length
                    local v2 = 1 / (a1.Stats.Attributes.BookAim / (Length or 1))
                    a1:SetStanceAnimation(4, "BookIntro", v2)
                    a1:EnableBook(true)
                end
                if a1.aiming then
                    local v3 = tick() - a1.lastAimed
                    if a1.Stats.Attributes.BookAim <= v3 then
                        a1.firing = true
                        a1:SetStanceAnimation(4, "BookLoop", 1)
                    end
                end
                if PrimaryPart then
                    a1:Face(PrimaryPart.Position)
                end
                a1:Delay((a1:GetCooldown()))
                a1.lastTargeted = tick()
                return
            end
            if a1.aiming then
                local v4 = tick() - a1.lastTargeted
                if a1.Stats.Attributes.SlowTime <= v4 then
                    if a1.Model.PrimaryPart:FindFirstChild("Loop") then
                        a1._soundLoopMaid:Sweep()
                        a1.Model.PrimaryPart.Loop:Stop()
                        a1.Model.PrimaryPart.Intro:Stop()
                        if a1.Model.PrimaryPart:FindFirstChild("Outro") then
                            a1.Model.PrimaryPart.Outro:Play()
                        end
                    end
                    a1.aiming = false
                    a1.firing = false
                    a1:SetStanceAnimation(4, "BookOutro", 1)
                    a1:EnableBook(false)
                    return
                end
            end
            return
        end
        if 4 <= (a1:GetLevel()) and a1.Model.PrimaryPart:FindFirstChild("Loop") then
            a1._soundLoopMaid:Sweep()
            a1.Model.PrimaryPart.Loop:Stop()
            a1.Model.PrimaryPart.Intro:Stop()
        end
        a1.aiming = false
        a1.firing = false
        a1:EnableBook(false)
    end)
    a1.Executables = {
        Summon = function() -- Line: 382 -- upvalues: a1 (val), EasySound (upval), EmitterManager (upval)
            local Attribute
            a1.summoning = true
            local Summon_Debounce = a1.Stats.Attributes.Summon_Debounce
            local v1 = 0
            if a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) then
                v1 = a1:GetLevel()
            end
            if a1.Model.PrimaryPart:FindFirstChild("Summon") then
                local SummonMax = if v1 ~= 4 then a1.Model.PrimaryPart.Summon else if not a1.Model.PrimaryPart:FindFirstChild("SummonMax") then a1.Model.PrimaryPart.Summon else a1.Model.PrimaryPart.SummonMax
                if SummonMax and SummonMax:IsA("Sound") then
                    EasySound.Play({
                        audioGroup = "Towers",
                        destroyOnEnd = true,
                        timeScaled = true,
                        id = SummonMax.SoundId,
                        parent = a1.Model.PrimaryPart,
                        playbackSpeed = (Random.new()):NextNumber(SummonMax.PlaybackSpeed * 0.9, SummonMax.PlaybackSpeed * 1.2),
                    })
                end
            end
            if a1.Model:FindFirstChild("AbilityUseVFX") then
                EmitterManager.manualEmit(a1.Model.AbilityUseVFX)
            end
            a1:StopAllAninmations()
            a1:SetStanceAnimation(v1, "Summon", 1)
            a1:Delay(a1.Stats.Attributes.Summon_Delay)
            for k, v in pairs(a1.Model.PrimaryPart.SpawnEffect:GetChildren()) do
                if v:IsA("ParticleEmitter") then
                    Attribute = v:GetAttribute("EmitCount")
                    if Attribute then
                        v:Emit(Attribute)
                    end
                end
            end
            local Head = a1.Model:FindFirstChild("Head") and a1.Model.Head or a1.Model.PrimaryPart
            if Head:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = Head.SoundId,
                    parent = a1.Model.Head,
                    playbackSpeed = (Random.new()):NextNumber(Head.PlaybackSpeed * 0.9, Head.PlaybackSpeed * 1.2),
                })
            end
            a1:Delay(Summon_Debounce)
            a1.summoning = false
        end,
        CreateGrave = function() -- Line: 450 -- upvalues: a1 (val), EasySound (upval)
            a1.raising = true
            local BuildTime = a1.Stats.Attributes.BuildTime
            local v1 = 0
            if a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) then
                v1 = a1:GetLevel()
            end
            a1:StopAllAninmations()
            a1:SetStanceAnimation(v1, "Spawn", 1)
            a1:Delay(a1.Stats.Attributes.BuildDelay)
            local PrimaryPart = nil
            local Raise = nil
            if a1.Model.Name == "Duck" then
                if a1.Model.PrimaryPart:FindFirstChild("Raise") then
                    PrimaryPart = a1.Model.PrimaryPart
                    Raise = a1.Model.PrimaryPart.Raise
                elseif a1.Model:FindFirstChild("Head") and a1.Model.Head:FindFirstChild("Raise") then
                    PrimaryPart = a1.Model.Head
                    Raise = a1.Model.Head.Raise
                end
            elseif a1.Model.Name ~= "Creepy Santa" then
                if a1.Model:FindFirstChild("Head") and a1.Model.Head:FindFirstChild("Raise") then
                    PrimaryPart = a1.Model.Head
                    Raise = a1.Model.Head.Raise
                end
            elseif a1.Model.PrimaryPart:FindFirstChild("Raise") then
                PrimaryPart = a1.Model.PrimaryPart
                Raise = a1.Model.PrimaryPart.Raise
            elseif a1.Model:FindFirstChild("Head") and a1.Model.Head:FindFirstChild("Raise") then
                PrimaryPart = a1.Model.Head
                Raise = a1.Model.Head.Raise
            end
            if PrimaryPart and Raise and Raise:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    destroyOnEnd = true,
                    timeScaled = true,
                    id = Raise.SoundId,
                    parent = PrimaryPart,
                    playbackSpeed = (Random.new()):NextNumber(Raise.PlaybackSpeed * 0.9, Raise.PlaybackSpeed * 1.2),
                })
            end
            a1:Delay(BuildTime - a1.Stats.Attributes.BuildDelay)
            a1.raising = false
        end,
        UpdateTargets = function(a1_2) -- Line: 498 -- upvalues: a1 (val)
            a1.targets = a1_2
            a1:CreateEnemyBeams()
        end,
        Projectile = function(a1_2, a2, a3) -- Line: 503
            -- upvalues: a1 (val), EasySound (upval), Projectile (upval), GameState (upval), EmitterManager (upval)
            local v1
            local Spell = a1.Model:WaitForChild("Spell")
            a1_2.Projectile = Spell
            a1_2.Decay = 0.75
            local v2 = if not a1.right then 2 else 1
            a1.right = not a1.right
            local v3 = "Fire" .. v2
            local v4 = a1.animationStances[0][v3].Length or 1
            local v5 = 1
            if v4 then
                v5 = 1 / (a1.State.Cooldown / v4)
            end
            local v6 = 0
            if a1.Model.Animations.Fire:FindFirstChild((a1:GetLevel())) then
                v6 = a1:GetLevel()
            end
            a1:SetStanceAnimation(v6, "Fire" .. v2, v5)
            a1:Face(a1_2.End)
            if a1.Stats.Attributes.MustAim then
                v1 = math.clamp(a2 - ((workspace:GetServerTimeNow()) - a3), 0, (1 / 0))
                a1:Delay(v1)
            end
            local v7 = ""
            if v6 >= 3 and a1.Model.Name == "Duck" then
                v7 = "2"
            end
            if not a1.Model.PrimaryPart then
                return
            end
            v1 = if a1.Model.Name ~= "Creepy Santa" then a1.Model["Right Arm" .. v7]:FindFirstChild("Start") else a1.Model.PrimaryPart.Root.Torso.LeftArm:FindFirstChild("Start")
            if v2 == 2
                and a1.Model.Name ~= "Creepy Santa"
                and a1.Model:FindFirstChild("Left Arm" .. v7)
                and a1.Model["Left Arm" .. v7]:FindFirstChild("Start") then
                v1 = a1.Model["Left Arm" .. v7]:FindFirstChild("Start")
            end
            if v1 then
                local v8
                if v1:FindFirstChild("Fire") and v1.Fire:IsA("Sound") then
                    local Fire_2 = v1.Fire
                    EasySound.Play({
                        audioGroup = "Towers",
                        destroyOnEnd = true,
                        timeScaled = true,
                        id = Fire_2.SoundId,
                        parent = v1,
                        playbackSpeed = (Random.new()):NextNumber(Fire_2.PlaybackSpeed * 0.9, Fire_2.PlaybackSpeed * 1.2),
                    })
                end
                for k, v in pairs(v1:GetChildren()) do
                    if v:IsA("ParticleEmitter") then
                        v8 = v:GetAttribute("EmitCount") or 1
                        if v8 then
                            v:Emit(v8)
                        end
                    end
                end
                Spell.Position = v1.WorldPosition
                a1_2.Start = v1.WorldPosition
            end
            Projectile:Pierce(a1_2, function(a1_2) -- Line: 594 -- upvalues: a1 (upval), EasySound (upval), GameState (upval), EmitterManager (upval)
                local Position = a1_2.PrimaryPart.Position
                if a1.Model.PrimaryPart and a1.Model.PrimaryPart:FindFirstChild("ProjectileHit") then
                    local ProjectileHit = a1.Model.PrimaryPart.ProjectileHit
                    if ProjectileHit:IsA("Sound") then
                        EasySound.Play({
                            audioGroup = "Towers",
                            destroyOnEnd = true,
                            timeScaled = true,
                            id = ProjectileHit.SoundId,
                            parent = a1_2.PrimaryPart,
                            playbackSpeed = ((Random.new()):NextNumber(ProjectileHit.PlaybackSpeed * 0.9, ProjectileHit.PlaybackSpeed * 1.2)) * GameState.TimeScale,
                        })
                    end
                end
                if a1.Model.Name == "Duck" then
                    EmitterManager.Emit("DuckSplash", CFrame.new(Position))
                    return
                end
                EmitterManager.Emit("MagicHit", CFrame.new(Position))
            end)
        end,
    }
end

return v1