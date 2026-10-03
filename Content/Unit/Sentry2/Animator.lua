-- Script path: ReplicatedStorage.Content.Unit.Sentry2.Animator
-- Decompile time: 7.59 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u53 = Random.new()
local u54 = {}

function u54.Fallen(a1, a2) -- Line: 31 -- upvalues: u53 (val), Laser (val)
    Laser:Lightning({
        Lifetime = 0.25,
        minWidth = 0.06,
        maxWidth = 0.07,
        Bursts = 2,
        Color = Color3.fromRGB(0, 225, 255),
        Start = a1,
        End = a2,
        Offset = u53:NextNumber(0.25, 0.5),
    })
end

function u54.Beach(a1, a2, a3) -- Line: 45 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local u7 = a3.Model.Bullet:Clone()
    local u10 = (a1 - a2).Magnitude * 0.02
    u7.Front.Beam.Enabled = true
    u7.CFrame = (CFrame.new(a1, a2)) * CFrame.Angles(0, 0, 3.141592653589793)
    TweenService:Create(u7.Front, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    TimescaleUtilities.Delay(0.01, function() -- Line: 55 -- upvalues: TweenService (upval), u7 (val), u10 (val), a2 (val)
        TweenService:Create(u7.Back, TweenInfo.new(u10, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    end)
    TimescaleUtilities.CleanUp(u7, u10 * 2)
    u7.Parent = workspace:FindFirstChild("Trash") or workspace
end

function u54.Bunny(a1, a2, a3) -- Line: 67
    -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val)
    local u7 = a3.Model.Bullet:Clone()
    local u10 = (a1 - a2).Magnitude * 0.02
    EmitterManager.toggle(u7, true)
    u7.CFrame = (CFrame.new(a1, a2)) * CFrame.Angles(0, 0, 3.141592653589793)
    TweenService:Create(u7.Front, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    TimescaleUtilities.Delay(0.01, function() -- Line: 77 -- upvalues: TweenService (upval), u7 (val), u10 (val), a2 (val)
        TweenService:Create(u7.Back, TweenInfo.new(u10, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    end)
    TimescaleUtilities.CleanUp(u7, u10 * 2)
    u7.Parent = workspace:FindFirstChild("Trash") or workspace
end

function lookAt(self, a2, a3, a4, a5) -- Line: 90
    local v1, v2 = CFrame.new((self.Part0.CFrame * self.C0).Position, a3):ToEulerAnglesYXZ()
    local fromEulerAnglesYXZ = CFrame.fromEulerAnglesYXZ
    local v3 = a4 and math.clamp(v2, -3.141592653589793, 3.141592653589793) or 0
    local v4 = fromEulerAnglesYXZ(a5 and math.clamp(v1, -1.0471975511965976, 1.3089969389957472) or 0, v3, 0)
    self.C0 = CFrame.new(a2.p) * v4
end

function v1:DecayBar() -- Line: 111 -- upvalues: TweenService (val)
    if self.FBXModel then
        return
    end
    local DecayTime = self.Model.Head:WaitForChild("DecayTime")
    local Bar = DecayTime:WaitForChild("Progress"):WaitForChild("Bar")
    DecayTime.Enabled = true
    TweenService:Create(
        Bar,
        TweenInfo.new(self.Stats.Lifespan, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0),
        {Size = UDim2.new(0, 0, 1, 0), BackgroundColor3 = Color3.fromRGB(255, 66, 66)}
    ):Play()
end

function v1:Fire(a2) -- Line: 140 -- upvalues: EmitterManager (val), u54 (val)
    local PrimaryPart = a2.PrimaryPart
    if not PrimaryPart then
        return
    end
    local Torso = a2:FindFirstChild("Torso") or a2:FindFirstChild("Upper Torso")
    local Head = a2:FindFirstChild("Head")
    local Position = Torso and Torso.Position or PrimaryPart.Position
    local Position_2 = Head and Head.Position or Position
    local Start = self.Model.Head:FindFirstChild("Start") or self.right and self.Model.Head.Start1 or self.Model.Head.Start2
    self.right = not self.right
    if self.torsoMotor then
        lookAt(self.torsoMotor, self.torsoOrigin, Position, true, false)
    end
    if self.neckMotor then
        lookAt(self.neckMotor, self.neckOrigin, Position_2, false, true)
    end
    if not self.ogPosition and self.FBXModel then
        self.ogPosition = self.Model.NeckBone.Value.WorldPosition
    end
    if self.FBXModel then
        self.Model.NeckBone.Value.WorldCFrame = CFrame.lookAt(self.ogPosition, Position_2)
        self.animations.Fire["0"]:Play(0)
    end
    if self._fireSoundPool then
        self._fireSoundPool:play()
    end
    EmitterManager.manualEmit(Start)
    if not u54[self.Model.Name] then
        self:Bullet({Start = Start.WorldPosition, End = Position, Spread = 50, Speed = 140})
    else
        u54[self.Model.Name](Start.WorldPosition, Position, self)
    end
    self:Delay(self.Cooldown)
end

function v1:BuildEffects(a2) -- Line: 197
    if self.FBXModel then
        return
    end
    local PrimaryPart = self.Model.PrimaryPart
    PrimaryPart.DustEmitter.Enabled = a2
    PrimaryPart.SparkEmitter.Enabled = a2
end

function v1:BuildUp() -- Line: 208 -- upvalues: EmitterManager (val), EasySound (val)
    if self.FBXModel then
        task.defer(function() -- Line: 210 -- upvalues: EmitterManager (upval), self (val)
            EmitterManager.manualEmit(self.Model.Build)
        end)
        return
    end
    local PrimaryPart = self.Model.PrimaryPart
    local Build = PrimaryPart:FindFirstChild("Build")
    if Build and Build:IsA("Sound") then
        EasySound.Play({
            destroyOnEnd = true,
            audioGroup = "Towers",
            id = Build.SoundId,
            parent = PrimaryPart,
            volume = Build.Volume,
        })
    end
    self:BuildEffects(true)
end

function v1:Initialize() -- Line: 230
    -- upvalues: SoundPool (val), Animation (val), SpringClass (val), EasySound (val), EmitterManager (val)
    -- upvalues: TweenService (val)
    self.Replicator:Set("DisplayName", "Sentry")
    if script.Parent.CustomLogicAnimator:FindFirstChild(self.Model.Name) then
        self.CustomLogicAnimator = require(script.Parent.CustomLogicAnimator:FindFirstChild(self.Model.Name))
        self.CustomLogicAnimator:Initialize(self)
        return
    end
    local Fire = self.Model.Head:FindFirstChild("Fire")
    if Fire and Fire:IsA("Sound") then
        self._fireSoundPool = SoundPool.new({
            audioGroup = "Towers",
            id = Fire.SoundId,
            parent = self.Model.Head,
            volume = Fire.Volume,
        })
        self.Maid:Mark(self._fireSoundPool)
    end
    if self.FBXModel then
        local v1
        self.animations = {}
        for i, j in self.Model.Animations:GetChildren() do
            if not self.animations[j.Name] then
                self.animations[j.Name] = {}
            end
            for k, n in j:GetChildren() do
                v1 = self.animations[j.Name]
                v1[n.Name] = (Animation.new({
                    IgnorePriority = true,
                    Track = n,
                    Target = (self.Model:WaitForChild("AnimationController")):WaitForChild("Animator"),
                }))
            end
        end
    else
        self.neckMotor = self.Model.Torso:WaitForChild("Neck")
        self.neckOrigin = self.neckMotor.C0
        self.torsoMotor = self.Model.PrimaryPart:WaitForChild("Torso")
        self.torsoOrigin = self.torsoMotor.C0
    end
    local u91 = SpringClass.new(0, 0.5, 20)
    local u97 = SpringClass.new(0, 0.5, 15)
    local u98 = 0
    local u99 = 0
    local u100 = 0
    local Barrel = nil
    local C1 = nil
    local Torso = nil
    local C1_2 = nil
    if not self.FBXModel then
        Barrel = self.Model.Head.Barrel
        C1 = Barrel.C1
        Torso = self.Model.PrimaryPart.Torso
        C1_2 = Torso.C1
    end

    function self.OnStepFunction(a1) -- Line: 298
        -- upvalues: self (val), u98 (ref), u97 (val), u91 (val), u99 (ref), Barrel (ref), C1 (ref), u100 (ref)
        -- upvalues: Torso (ref), C1_2 (ref)
        if self.FBXModel then
            return
        end
        if u98 > 0 then
            u98 = u98 - a1
            if u98 <= 0 then
                u97.p = -0.3
            end
        end
        local p = u91.p
        if 0.001 < (math.abs(p)) or 0.001 < (math.abs(u99)) then
            if (math.abs(p)) <= 0.001 then
                p = 0
            end
            if 0.001 < (math.abs(p - u99)) then
                Barrel.C1 = C1 * CFrame.new(0, 0, p)
                u99 = p
            end
        end
        local p_2 = u97.p
        if 0.001 < (math.abs(p_2)) or 0.001 < (math.abs(u100)) then
            if (math.abs(p_2)) <= 0.001 then
                p_2 = 0
            end
            if 0.001 < (math.abs(p_2 - u100)) then
                Torso.C1 = C1_2 * CFrame.new(0, 0, p_2)
                u100 = p_2
            end
        end
    end

    self.Executables = {
        Shield = function(a1) -- Line: 343 -- upvalues: self (val), EasySound (upval), EmitterManager (upval), TweenService (upval)
            local Shield = self.Model:WaitForChild("Shield")
            local Mesh = Shield:FindFirstChild("Mesh")
            local Decal = Shield:FindFirstChild("Decal")
            local Effect = Shield:FindFirstChild("Effect")
            local VFX = Shield:FindFirstChild("VFX")
            if not a1 then
                local Pop = Shield:FindFirstChild("Pop")
                if Pop and Pop:IsA("Sound") then
                    EasySound.Play({
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = Pop.SoundId,
                        parent = Shield,
                        volume = Pop.Volume,
                    })
                end
                if Effect then
                    local Attribute
                    for k, v in pairs(Effect:GetChildren()) do
                        if v:IsA("ParticleEmitter") then
                            Attribute = v:GetAttribute("EmitCount")
                            if Attribute then
                                v:Emit(Attribute)
                            end
                        end
                    end
                end
            end
            if VFX then
                EmitterManager.toggle(VFX, a1 == true)
            end
            if Mesh then
                local Scale = Mesh and Mesh.Scale
                local v1 = a1 and Scale or Vector3.new(0, 0, 0)
                TweenService:Create(Mesh, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0), {Scale = v1}):Play()
            end
            TweenService:Create(
                Decal or Shield,
                TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                {Transparency = if not a1 then 1 else 0.8}
            ):Play()
        end,
    }
    local Shield = self.Model:WaitForChild("Shield")
    local Mesh = Shield:FindFirstChild("Mesh")
    local Decal = Shield:FindFirstChild("Decal")
    if not Decal then
        Shield.Transparency = 1
    else
        Decal.Transparency = 1
    end
    if Mesh then
        Mesh.Scale = Vector3.new(0, 0, 0)
    end
    self:BuildUp()
    self:Delay(self.Stats.Attributes.SendTime)
    if self.Maid then
        self:BuildEffects(false)
        self:DecayBar()
        self:Thread(function() -- Line: 435 -- upvalues: self (val), u91 (val), u98 (ref)
            local v1 = self:FindTarget()
            if v1 and self.Dead == false then
                u91.p = -0.6
                u98 = 0.05
                self:Fire(v1)
            end
        end)
    end
end

return v1