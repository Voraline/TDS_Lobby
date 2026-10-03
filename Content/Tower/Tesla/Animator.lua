-- Script path: ReplicatedStorage.Content.Tower.Tesla.Animator
-- Decompile time: 10.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local LightningBolt = require(ReplicatedStorage.Shared.Modules.Lightning.LightningBolt)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u47 = Random.new()
local v1 = {}
v1.__index = v1
local u53 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local u58 = TweenInfo.new(1.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local u63 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local u68 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.In)
local u73 = Color3.fromRGB(0, 170, 255)

function v1:_createBeam(a2, a3, a4) -- Line: 25
    -- upvalues: EasySound (val), TimescaleUtilities (val), u73 (val), u47 (val), Laser (val)
    if a2 and a3 then
        if self._currentSound then
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = self._currentSound.SoundId,
                parent = self.Model.PrimaryPart,
                volume = self._currentSound.Volume,
            })
        end
        if self._currentBeam and self._currentBeam:IsA("Attachment") then
            local Folder = Instance.new("Folder")
            Folder.Parent = workspace.Trash
            Folder.Name = "CustomTeslaBeam"
            local Part = Instance.new("Part")
            Part.Parent = Folder
            Part.Size = Vector3.new(1, 1, 1)
            Part.Position = a2
            Part.Anchored = true
            Part.CanCollide = false
            Part.Transparency = 1
            local v1 = self._currentBeam:Clone()
            v1.Parent = Part
            if a4 then
                local RigidConstraint = Instance.new("RigidConstraint")
                RigidConstraint.Parent = Part
                RigidConstraint.Attachment0 = a4
                RigidConstraint.Attachment1 = v1
                Part.Anchored = false
            end
            local Part_2 = Instance.new("Part")
            Part_2.Parent = Folder
            Part_2.Size = Vector3.new(1, 1, 1)
            Part_2.Anchored = true
            Part_2.CanCollide = false
            Part_2.Transparency = 1
            Part_2.Position = a3
            local Attachment = Instance.new("Attachment")
            Attachment.Name = "BeamEnd"
            Attachment.Parent = Part_2
            for i, j in v1:GetChildren() do
                if j:IsA("Beam") then
                    j.Attachment0 = v1
                    j.Attachment1 = Attachment
                    j.Enabled = true
                end
            end
            TimescaleUtilities.CleanUp(Folder, self._currentBeam:GetAttribute("ShootTime") or 0.1)
            return
        end
        Laser:Lightning({
            Lifetime = 0.18,
            minWidth = 0.1,
            maxWidth = 0.2,
            Bursts = 1,
            Color = u73,
            Start = a2,
            End = a3,
            Offset = u47:NextNumber(0.25, 0.5),
        })
        return
    end
end

function v1:_pulse() -- Line: 92 -- upvalues: TweenService (val), u63 (val), u68 (val), u53 (val), u58 (val)
    local v1
    if self._pulseParts then
        for i, v in ipairs(self._pulseParts) do
            if v.CurrentTween then
                v.CurrentTween:Cancel()
            end
            v1 = TweenService:Create(v.Part, u63, {Transparency = math.max(0, v.OriginalTransparency - 0.5)})
            v.CurrentTween = v1
            v1:Play()
            v1.Completed:Once(function(a1) -- Line: 105 -- upvalues: TweenService (upval), v (val), u68 (upval)
                if a1 == Enum.PlaybackState.Completed then
                    local v1 = TweenService:Create(v.Part, u68, {Transparency = v.OriginalTransparency})
                    v.CurrentTween = v1
                    v1:Play()
                end
            end)
        end
    end
    if self._shootPulseParts then
        for i2, i3 in ipairs(self._shootPulseParts) do
            if i3.CurrentTween then
                i3.CurrentTween:Cancel()
            end
            v1 = TweenService:Create(i3.SurfaceAppearance, u53, {EmissiveStrength = 10})
            i3.CurrentTween = v1
            v1:Play()
            v1.Completed:Once(function(a1) -- Line: 129 -- upvalues: TweenService (upval), i3 (val), u58 (upval)
                if a1 == Enum.PlaybackState.Completed then
                    local v1 = TweenService:Create(i3.SurfaceAppearance, u58, {EmissiveStrength = i3.OriginalStrength})
                    i3.CurrentTween = v1
                    v1:Play()
                end
            end)
        end
    end
end

function v1:_face(a2) -- Line: 142 -- types: self: table, a2: vector
    local function checkFakeRoot(a1, a2_2) -- Line: 143
        -- upvalues: self (val), a2 (val)
        local v1 = a2_2 or self.Model:FindFirstChild(a1, true)
        if v1 and v1:IsA("BasePart") then
            local Position = v1.Position
            v1.CFrame = CFrame.lookAt(Position, (Vector3.new(a2.X, Position.Y, a2.Z)))
            return
        end
        if v1 and v1:IsA("Attachment") then
            local WorldPosition = v1.WorldPosition
            v1.WorldCFrame = CFrame.lookAt(WorldPosition, (Vector3.new(a2.X, WorldPosition.Y, a2.Z)))
        end
    end

    if self._doFace then
        checkFakeRoot("NPCRootPart", self._operatorAttachment)
        if self._secondOperator then
            checkFakeRoot("NPC2RootPart")
        end
        if self._rotationBone and self._rotationBone:IsA("Bone") then
            self._rotationBone.WorldCFrame = CFrame.lookAt(self._rotationBone.WorldPosition, a2)
            return
        end
        self:Face(a2)
    end
end

function v1:_fire(a2) -- Line: 167
    -- upvalues: TimescaleUtilities (val), EmitterManager (val)
    if not a2 then
        return
    end
    local Configuration = self.Model.Weapon:FindFirstChild("Tower"):FindFirstChild("Configuration")
    if 3 <= (self:GetLevel()) or self.Model.Animations.Fire:FindFirstChild("0") then
        self:Animate("Fire")
    end
    self:Animate("OperatorFire")
    if self._secondOperator and self._operator2Animations then
        self._operator2Animations.Fire:Play()
    end
    self:_face(a2)
    self:_pulse()
    if Configuration then
        local Value = Configuration.Start.Value
        local Attribute = Configuration.Start:GetAttribute("FireDelay")
        if Attribute then
            TimescaleUtilities.Wait(Attribute)
        end
        self:_createBeam(Value.WorldPosition, a2, Value)
        EmitterManager.manualEmit(Value)
        self:Delay(0.35, function() -- Line: 201 -- upvalues: Configuration (val), EmitterManager (upval)
            local SteamEffect = Configuration:FindFirstChild("SteamEffect")
            if SteamEffect and SteamEffect.Value ~= nil then
                EmitterManager.manualEmit(SteamEffect.Value)
            end
        end)
    end
end

local u81 = NumberRange.new(35, 50)
local u85 = NumberRange.new(5, 10)

function v1:_smite(a2, a3) -- Line: 213
    -- upvalues: u47 (val), u85 (val), u81 (val), u73 (val), LightningBolt (val), TimescaleUtilities (val)
    -- upvalues: EmitterManager (val), Shaker (val)
    local v1 = {}
    local v2 = {}
    v1.WorldPosition = a2 + Vector3.new(u47:NextNumber(u85.Min, u85.Max), u47:NextNumber(u81.Min, u81.Max), (u47:NextNumber(u85.Min, u85.Max)))
    v1.WorldAxis = Vector3.new(0, 0, 1)
    v2.WorldPosition = a2
    v2.WorldAxis = Vector3.new(0, 0, 1)
    local Configuration = self.Model.Weapon:FindFirstChild("Tower"):FindFirstChild("Configuration")
    local Value = u73
    local Value_2 = "ImpactExplosion"
    if Configuration then
        local SmiteColor = Configuration:FindFirstChild("SmiteColor")
        if SmiteColor and SmiteColor:IsA("Color3Value") then
            Value = SmiteColor.Value
        end
        local SmiteExplosion = Configuration:FindFirstChild("SmiteExplosion")
        if SmiteExplosion and SmiteExplosion:IsA("StringValue") then
            Value_2 = SmiteExplosion.Value
        end
    end
    local v3 = LightningBolt.new(v1, v2, 14)
    v3.Color = Value
    v3.PulseSpeed = 20
    v3.Frequency = 2
    v3.AnimationSpeed = 20
    v3.Thickness = 0.35
    TimescaleUtilities.Wait(0.1)
    v3:DestroyDissipate()
    EmitterManager.Emit(Value_2, CFrame.new(a2), self.Stats.Attributes.SmiteRadius * self:GetExplosionRadiusMultiplier())
    Shaker:Shake({1, 10, 0.1, 1}, 0.2, 0.5, {radius = 25, position = a2})
end

function v1.Initialize(a1) -- Line: 266 -- upvalues: EmitterManager (val), Animation (val), TimescaleUtilities (val)
    a1.lastShot = tick() - a1.State.Cooldown + a1.State.Cooldown / 3
    a1.currentTarget = nil
    a1._baseRange = a1:GetRange()
    a1._currentSound = a1.Model.PrimaryPart.Sounds["0"]
    a1.onCooldown = true
    local _originalTransparency = a1._originalTransparency or {}
    a1._originalTransparency = _originalTransparency
    local _originalEmissive = a1._originalEmissive or {}
    a1._originalEmissive = _originalEmissive
    a1._currentBobOffset = CFrame.identity
    a1:Animate("TeslaIdle")
    local NPCRootAttachment = a1.Model.PrimaryPart:FindFirstChild("NPCRootAttachment", true)
    a1._operatorAttachment = NPCRootAttachment

    local function checkLevel(a1_2) -- Line: 282
        -- upvalues: a1 (val), EmitterManager (upval), NPCRootAttachment (val), Animation (upval)
        local SurfaceAppearance, Value
        local Tower = a1.Model.Weapon:FindFirstChild("Tower")
        local Configuration = Tower:FindFirstChild("Configuration")
        if Configuration then
            local ConstantEffect = Configuration:FindFirstChild("ConstantEffect")
            local OperatorPosition = Configuration:FindFirstChild("OperatorPosition")
            if ConstantEffect then
                if a1._currentEffect then
                    EmitterManager.toggle(a1._currentEffect, false)
                end
                a1._currentEffect = ConstantEffect.Value
                EmitterManager.toggle(a1._currentEffect, true)
            end
            if OperatorPosition and OperatorPosition:IsA("CFrameValue") and NPCRootAttachment then
                NPCRootAttachment.CFrame = OperatorPosition.Value
            end
            a1._doFace = (function() -- Line: 302 -- upvalues: Configuration (val), Tower (val)
                local Attribute = Configuration:GetAttribute("DoFace")
                if Attribute ~= nil then
                    return Attribute
                end
                local DoFace = Configuration:FindFirstChild("DoFace")
                if DoFace and DoFace:IsA("BoolValue") then
                    return DoFace.Value
                end
                local Attribute_2 = Tower:GetAttribute("DoFace")
                if Attribute_2 ~= nil then
                    return Attribute_2
                end
                local DoFace_2 = Tower:FindFirstChild("DoFace")
                if DoFace_2 and DoFace_2:IsA("BoolValue") then
                    return DoFace_2.Value
                end
                return false
            end)()
            local RotationBone = Configuration:FindFirstChild("RotationBone")
            if RotationBone
                and RotationBone:IsA("ObjectValue")
                and RotationBone.Value
                and RotationBone.Value:IsA("Bone") then
                a1._rotationBone = RotationBone.Value
            end
        end
        a1._currentSound = a1.Model.PrimaryPart.Sounds[tostring(a1_2)]
        local Effects = a1.Model:FindFirstChild("Effects")
        local v1 = Effects and Effects:FindFirstChild((("Beam%*"):format(a1_2)))
        if v1 then
            a1._currentBeam = v1
        end
        local SecondOperator = a1.Model.Upgrades[a1_2]:FindFirstChild("SecondOperator")
        if a1_2 == 4 and SecondOperator and not a1._secondOperator then
            a1._secondOperator = true
            SecondOperator.Parent = a1.Model
            local v2 = {
                Fire = Animation.new({
                    Preload = true,
                    Track = SecondOperator.Animations.Fire,
                    Target = SecondOperator.AnimationController.Animator,
                }),
                Idle = Animation.new({
                    Preload = true,
                    Track = SecondOperator.Animations.Idle,
                    Target = SecondOperator.AnimationController.Animator,
                }),
            }
            a1._operator2Animations = v2
            v2.Idle:Play()
        end
        a1._pulseParts = {}
        a1._shootPulseParts = {}
        a1._bobParts = {}
        local _originalTransparency = a1._originalTransparency or {}
        a1._originalTransparency = _originalTransparency
        local _originalEmissive = a1._originalEmissive or {}
        a1._originalEmissive = _originalEmissive
        for i, v in ipairs(a1.Model:GetDescendants()) do
            if v:IsA("BasePart") then
                if v:GetAttribute("Pulse") then
                    if a1._originalTransparency[v] == nil then
                        a1._originalTransparency[v] = v.Transparency
                    end
                    table.insert(a1._pulseParts, {Part = v, OriginalTransparency = a1._originalTransparency[v]})
                end
                if v:GetAttribute("PulseOnShoot") then
                    SurfaceAppearance = v:FindFirstChildOfClass("SurfaceAppearance")
                    if SurfaceAppearance then
                        if a1._originalEmissive[SurfaceAppearance] == nil then
                            a1._originalEmissive[SurfaceAppearance] = (math.min(1, SurfaceAppearance.EmissiveStrength))
                        end
                        table.insert(a1._shootPulseParts, {
                            SurfaceAppearance = SurfaceAppearance,
                            OriginalStrength = a1._originalEmissive[SurfaceAppearance],
                        })
                    end
                end
            end
        end
        for i2, i3 in ipairs(a1.Model:GetChildren()) do
            if i3:IsA("ObjectValue") and i3.Name == "SineWaveBob" and i3.Value then
                Value = i3.Value
                if Value:IsA("BasePart") then
                    table.insert(a1._bobParts, {
                        IsBone = false,
                        Object = Value,
                        Offset = (a1.Model.PrimaryPart.CFrame:ToObjectSpace(Value.CFrame)) * (a1._currentBobOffset:Inverse()),
                    })
                elseif Value:IsA("Bone") then
                    table.insert(a1._bobParts, {
                        IsBone = true,
                        Object = Value,
                        Offset = Value.CFrame * a1._currentBobOffset:Inverse(),
                    })
                end
            end
        end
    end

    a1.OnUpgrade:Connect(checkLevel)
    checkLevel(a1:GetLevel())
    a1.Executables = {
        Bolt = function(a1_2) -- Line: 422 -- upvalues: a1 (val), TimescaleUtilities (upval) -- types: a1_2: table
            local v1
            local v2 = {}
            for i, j in a1_2 do
                if j and j.PrimaryPart then
                    table.insert(v2, j.PrimaryPart.Position)
                end
            end
            if #a1_2 <= 0 then
                return
            end
            local v3 = nil
            local v4 = nil
            local v5 = nil
            for k, n in a1_2, v4, v5 do
                v1 = v2[k]
                if k == 1 then
                    a1:_fire(v1)
                elseif v3 then
                    a1:_createBeam(v3, v1)
                end
                TimescaleUtilities.Wait(0.025)
            end
        end,
        Smite = function(a1_2, a2) -- Line: 452 -- upvalues: a1 (val) -- types: a1_2: vector, a2: number
            a1:_smite(a1_2, a2)
        end,
    }
    a1:Thread(function() -- Line: 457 -- upvalues: a1 (val)
        local v1
        while a1.Model do
            if not a1.Model.Parent then
                break
            end
            for i, v in ipairs(a1._bobParts) do
                v1 = tick() * 2.5
                a1._currentBobOffset = CFrame.new(math.cos(v1) * 0.02, math.sin(v1) * 0.05, math.sin(v1) * 0.15)
                if not v.IsBone then
                    v.Object.CFrame = a1.Model.PrimaryPart.CFrame * v.Offset * a1._currentBobOffset
                else
                    v.Object.CFrame = v.Offset * a1._currentBobOffset
                end
            end
            a1:Wait()
        end
    end)
end

return v1