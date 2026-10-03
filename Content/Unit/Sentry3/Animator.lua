-- Script path: ReplicatedStorage.Content.Unit.Sentry3.Animator
-- Decompile time: 9.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1
local u63 = Random.new()
local u64 = {}

function u64.Fallen(a1, a2) -- Line: 28 -- upvalues: u63 (val), Laser (val)
    Laser:Lightning({
        Lifetime = 0.25,
        minWidth = 0.06,
        maxWidth = 0.07,
        Bursts = 2,
        Color = Color3.fromRGB(0, 225, 255),
        Start = a1,
        End = a2,
        Offset = u63:NextNumber(0.25, 0.5),
    })
end

function u64.Beach(a1, a2, a3) -- Line: 42 -- upvalues: TweenService (val), TimescaleUtilities (val)
    local u7 = a3.Model.Bullet:Clone()
    local u10 = (a1 - a2).Magnitude * 0.02
    u7.Front.Beam.Enabled = true
    u7.CFrame = (CFrame.new(a1, a2)) * CFrame.Angles(0, 0, 3.141592653589793)
    TweenService:Create(u7.Front, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    TimescaleUtilities.Delay(0.01, function() -- Line: 52 -- upvalues: TweenService (upval), u7 (val), u10 (val), a2 (val)
        TweenService:Create(u7.Back, TweenInfo.new(u10, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    end)
    TimescaleUtilities.CleanUp(u7, u10 * 2)
    u7.Parent = workspace.Trash
end

function u64.Bunny(a1, a2, a3) -- Line: 63
    -- upvalues: EmitterManager (val), TweenService (val), TimescaleUtilities (val)
    local u7 = a3.Model.Bullet:Clone()
    local u10 = (a1 - a2).Magnitude * 0.02
    EmitterManager.toggle(u7, true)
    u7.CFrame = (CFrame.new(a1, a2)) * CFrame.Angles(0, 0, 3.141592653589793)
    TweenService:Create(u7.Front, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    TimescaleUtilities.Delay(0.01, function() -- Line: 73 -- upvalues: TweenService (upval), u7 (val), u10 (val), a2 (val)
        TweenService:Create(u7.Back, TweenInfo.new(u10, Enum.EasingStyle.Linear), {WorldPosition = a2}):Play()
    end)
    TimescaleUtilities.CleanUp(u7, u10 * 2)
    u7.Parent = workspace:FindFirstChild("Trash") or workspace
end

function lookAt(self, a2, a3, a4, a5) -- Line: 86
    local v1, v2 = CFrame.new((self.Part0.CFrame * self.C0).Position, a3):ToEulerAnglesYXZ()
    local fromEulerAnglesYXZ = CFrame.fromEulerAnglesYXZ
    local v3 = a4 and math.clamp(v2, -3.141592653589793, 3.141592653589793) or 0
    local v4 = fromEulerAnglesYXZ(a5 and math.clamp(v1, -1.0471975511965976, 1.3089969389957472) or 0, v3, 0)
    self.C0 = CFrame.new(a2.p) * v4
end

function v1:DecayBar() -- Line: 107 -- upvalues: TweenService (val)
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

function v1:Fire(a2) -- Line: 136 -- upvalues: EmitterManager (val), u64 (val)
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
    if not u64[self.Model.Name] then
        self:Bullet({Start = Start.WorldPosition, End = Position, Target = a2, Spread = 50})
    else
        u64[self.Model.Name](Start.WorldPosition, Position, self)
    end
    self:Delay(self.Cooldown)
end

function v1:BuildEffects(a2) -- Line: 193
    if self.FBXModel then
        return
    end
    local PrimaryPart = self.Model.PrimaryPart
    PrimaryPart.DustEmitter.Enabled = a2
    PrimaryPart.SparkEmitter.Enabled = a2
end

function v1:BuildUp() -- Line: 204 -- upvalues: EmitterManager (val)
    if self.FBXModel then
        task.defer(function() -- Line: 206 -- upvalues: EmitterManager (upval), self (val)
            EmitterManager.manualEmit(self.Model.Build)
        end)
        return
    end
    self.Model.PrimaryPart.Build:Play()
    self:BuildEffects(true)
end

function v1:Initialize() -- Line: 217
    -- upvalues: SoundPool (val), Animation (val), SpringClass (val), EasySound (val), EmitterManager (val)
    -- upvalues: TweenService (val), NewTween (val), GameState (val)
    self.lastFire = tick()
    self.slowing = true
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
    self.depthSpring = SpringClass.new(0, 0.5, 20)
    self.baseDepthSpring = SpringClass.new(0, 0.5, 15)
    if not self.FBXModel then
        if not self.Model:FindFirstChild("Spin") then
            self.barrelMotor = self.Model.Head.Barrel
        else
            self.barrelMotor = self.Model.Spin.Barrel
        end
        self.barrelBaseC1 = self.barrelMotor.C1
        self.torsoMotor = self.Model.PrimaryPart.Torso
        self.torsoBaseC1 = self.torsoMotor.C1
    end
    local u125 = nil
    local u126 = 0
    local u127 = 0
    local u128 = 0
    self.RevTime = 1.4

    function self.OnStepFunction(a1) -- Line: 289 -- upvalues: self (val), u127 (ref), u128 (ref)
        if self.FBXModel then
            return
        end
        local p = self.depthSpring.p
        if self.barrelMotor then
            if 0.001 < (math.abs(p)) or 0.001 < (math.abs(u127)) then
                if (math.abs(p)) <= 0.001 then
                    p = 0
                end
                if 0.001 < (math.abs(p - u127)) then
                    self.barrelMotor.C1 = self.barrelBaseC1 * CFrame.new(0, 0, p)
                    u127 = p
                end
            end
        end
        local p_2 = self.baseDepthSpring.p
        if 0.001 < (math.abs(p_2)) or 0.001 < (math.abs(u128)) then
            if (math.abs(p_2)) <= 0.001 then
                p_2 = 0
            end
            if 0.001 < (math.abs(p_2 - u128)) then
                self.torsoMotor.C1 = self.torsoBaseC1 * CFrame.new(0, 0, p_2)
                u128 = p_2
            end
        end
    end

    self.Executables = {
        Shield = function(a1) -- Line: 330 -- upvalues: self (val), EasySound (upval), EmitterManager (upval), TweenService (upval)
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
        self:Thread(function() -- Line: 421
            -- upvalues: self (val), u126 (ref), u125 (ref), NewTween (upval), GameState (upval), TweenService (upval)
            local v1 = self:FindTarget()
            local v2 = tick()
            if v1 and self.Dead == false then
                if self.slowing then
                    u126 = v2
                    self.slowing = false
                    if self.Model.Head:FindFirstChild("Rev") then
                        self.Model.Head.Rev:Play()
                        u125 = self.Model.Head.Rev.Ended:Connect(function() -- Line: 432 -- upvalues: self (upval)
                            self.Model.Head.SpinSound:Play()
                        end)
                    end
                    if self.Model.Head:FindFirstChild("Spin") then
                        local MaxVelocity = self.Model.Head.Spin.MaxVelocity
                        NewTween(self.Model.Head.Spin, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0), function(a1) -- Line: 451 -- upvalues: self (upval), MaxVelocity (val)
                            self.Model.Head.Spin.MaxVelocity = MaxVelocity * (1 - a1) + 0.3 * a1
                        end)
                    end
                end
                if self.slowing == false then
                    local v3 = (v2 - u126) * GameState.TimeScale
                    if self.RevTime <= v3 then
                        self:Fire(v1)
                        self.lastFire = v2
                        return
                    end
                end
                local Head_3 = v1:FindFirstChild("Head")
                if not Head_3 then
                    return
                end
                local Position = v1.PrimaryPart.Position
                local Position_2 = Head_3.Position
                if self.FBXModel then
                    return
                end
                lookAt(self.torsoMotor, self.torsoOrigin, Position, true, false)
                lookAt(self.neckMotor, self.neckOrigin, Position_2, false, true)
                return
            end
            if self.Dead == false
                and self.slowing == false
                and 0.5 <= tick() - self.lastFire
                and self.Dead == false
                and self.slowing == false
                and 0.5 <= (tick() - self.lastFire) * GameState.TimeScale then
                self.slowing = true
                if u125 then
                    u125:Disconnect()
                    u125 = nil
                end
                if self.Model.Head:FindFirstChild("Spin") then
                    self.Model.Head.SpinSound:Stop()
                    self.Model.Head.Rev:Stop()
                    self.Model.Head.Slow:Play()
                    TweenService:Create(
                        self.Model.Head.Spin,
                        TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0),
                        {MaxVelocity = 0}
                    ):Play()
                end
            end
        end)
    end
end

return v1