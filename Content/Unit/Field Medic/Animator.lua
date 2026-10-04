-- Script path: ReplicatedStorage.Content.Unit.Field Medic.Animator
-- Decompile time: 8.77 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local NewTween = require(ReplicatedStorage.Shared.Modules.NewTween)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u35 = {Graveyard = "GraveyardShield"}
local v1 = {}
v1.__index = v1

local function toggleParticles(a1, a2) -- Line: 22 -- types: a1: userdata, a2: boolean
    for k, v in pairs(a1:GetDescendants()) do
        if v:IsA("ParticleEmitter") then
            v.Enabled = a2
        end
    end
end

local function convert_rgb_to_vertex(a1) -- Line: 30 -- types: a1: userdata
    return (Vector3.new(a1.R, a1.G, a1.B))
end

function v1.Initialize(a1) -- Line: 34
    -- upvalues: Animation (val), EasySound (val), toggleParticles (val), TimescaleUtilities (val), u35 (val)
    -- upvalues: ReplicatedStorage (val), EmitterManager (val), Debris (val)
    local Name = a1.Model.Name
    local Animations = a1.Model:WaitForChild("Animations")
    a1.animController = a1.Model:WaitForChild("AnimationController")
    a1._walkAnim = Animation.new({IgnorePriority = true, Track = Animations.Walk, Target = a1.animController})
    a1._walkFiringAnim = Animation.new({IgnorePriority = true, Track = Animations.WalkFiring, Target = a1.animController})
    a1._idleAnim = Animation.new({IgnorePriority = true, Track = Animations.Idle, Target = a1.animController})
    a1._moving = true
    a1._firing = false
    a1._firingWeight = 0.0001
    a1._beams = {}
    a1._beamCount = 0
    a1._weaponHandle = a1.Model:WaitForChild("Weapon").Handle
    a1._beamColor = a1.Model:GetAttribute("BeamColor")
    a1.Model.Destroying:Connect(function() -- Line: 63 -- upvalues: a1 (val), EasySound (upval)
        if a1._beamLoopPlayer then
            a1._beamLoopPlayer:Stop()
            EasySound.Destroy(a1._beamLoopPlayer)
            a1._beamLoopPlayer = nil
        end
    end)
    a1.Executables = {
        ShootState = function(a1_2) -- Line: 72 -- upvalues: a1 (val) -- types: a1_2: boolean
            if a1_2 then
                a1:_doIdle()
                return
            end
            a1:_doWalk()
        end,
        Death = function() -- Line: 79 -- upvalues: a1 (val), Animation (upval), Animations (val), EasySound (upval)
            a1.Dead = true
            a1._walkAnim:Stop()
            a1._walkFiringAnim:Stop()
            a1._idleAnim:Stop()
            Animation.new({Track = Animations.Death, Target = a1.animController}):Play()
            if a1._beamLoopPlayer then
                a1._beamLoopPlayer:Stop()
                EasySound.Destroy(a1._beamLoopPlayer)
                a1._beamLoopPlayer = nil
            end
            local Death = a1.Model.HumanoidRootPart:FindFirstChild("Death")
            if Death and Death:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = Death.SoundId,
                    parent = Death.Parent,
                    volume = Death.Volume,
                })
            end
        end,
        UpdateTargets = function(a1_2) -- Line: 110
            -- upvalues: a1 (val), toggleParticles (upval), EasySound (upval), TimescaleUtilities (upval)
            a1:_updateTargets(a1_2)
            local Start = a1.Model.GunRig.Handle.Start
            if a1._beamCount < 1 and a1._firing then
                a1._firing = false
                toggleParticles(Start, false)
                a1._firingWeight = 0.0001
                a1._walkAnim:AdjustWeight(1 - a1._firingWeight)
                a1._walkFiringAnim:AdjustWeight(a1._firingWeight)
                local BeamTrigger = a1._weaponHandle:FindFirstChild("BeamTrigger")
                local BeamLoop = a1._weaponHandle:FindFirstChild("BeamLoop")
                if a1._beamLoopPlayer then
                    a1._beamLoopPlayer:Stop()
                    EasySound.Destroy(a1._beamLoopPlayer)
                    a1._beamLoopPlayer = nil
                end
                if BeamTrigger and BeamTrigger:IsA("Sound") then
                    BeamTrigger:Stop()
                end
                if BeamLoop and BeamLoop:IsA("Sound") then
                    BeamLoop:Stop()
                    return
                end
                return
            end
            if not a1._firing then
                a1._firing = true
                toggleParticles(Start, true)
                a1._firingWeight = 0.9999
                a1._walkAnim:AdjustWeight(1 - a1._firingWeight)
                a1._walkFiringAnim:AdjustWeight(a1._firingWeight)
                local BeamTrigger_2 = a1._weaponHandle:FindFirstChild("BeamTrigger")
                if BeamTrigger_2 and BeamTrigger_2:IsA("Sound") then
                    EasySound.Play({
                        destroyOnEnd = true,
                        audioGroup = "Towers",
                        id = BeamTrigger_2.SoundId,
                        parent = BeamTrigger_2.Parent,
                        volume = BeamTrigger_2.Volume,
                    })
                end
                TimescaleUtilities.ConditionalDelay(0.25, function() -- Line: 153 -- upvalues: a1 (upval)
                    return a1._firing and not a1.Dead
                end, function() -- Line: 155 -- upvalues: a1 (upval), EasySound (upval)
                    local BeamLoop = a1._weaponHandle:FindFirstChild("BeamLoop")
                    if BeamLoop and BeamLoop:IsA("Sound") then
                        if not a1._beamLoopPlayer then
                            a1._beamLoopPlayer = EasySound.Create({
                                looped = true,
                                audioGroup = "Towers",
                                id = BeamLoop.SoundId,
                                parent = BeamLoop.Parent,
                                volume = BeamLoop.Volume,
                            })
                        end
                        a1._beamLoopPlayer:Play()
                    end
                end)
            end
        end,
        Shield = function(a1_2, a2, a3) -- Line: 172
            -- upvalues: u35 (upval), Name (val), ReplicatedStorage (upval), a1 (val), EmitterManager (upval)
            -- upvalues: Debris (upval)
            if not a1_2:IsA("Model") then
                return
            end
            local PrimaryPart = a1_2.PrimaryPart
            if not PrimaryPart then
                return
            end
            if a2 then
                local v1 = u35[Name]
                local v2 = (v1 and ReplicatedStorage.Assets.Effects.Client:FindFirstChild(v1) or ReplicatedStorage.Assets.Effects.Buffs.HexShield):Clone()
                if a1._beamColor then
                    local Mesh = v2.Part.Mesh
                    local _beamColor = a1._beamColor
                    Mesh.VertexColor = Vector3.new(_beamColor.R, _beamColor.G, _beamColor.B)
                    local v3 = ColorSequence.new(a1._beamColor)
                    v2.Part.Hex.Color = v3
                    v2.Part.ShatterFX.Hex.Color = v3
                    v2.Part.ShatterFX.Wave.Color = v3
                end
                v2:PivotTo((a1_2:GetPivot()))
                v2.Parent = a1_2
                local WeldConstraint = v2:FindFirstChild("WeldConstraint", true)
                if WeldConstraint then
                    WeldConstraint.Part1 = PrimaryPart
                    return
                end
                v2.Part.WeldConstraint.Part1 = PrimaryPart
                return
            end
            local v4 = a1_2:FindFirstChild(u35[Name] or "HexShield")
            if v4 then
                if a3 then
                    local PrimaryPart_2 = v4:IsA("BasePart") and v4 or v4.PrimaryPart
                    if not PrimaryPart_2 then
                        v4:Destroy()
                        return
                    end
                    local ShatterFX = PrimaryPart_2:FindFirstChild("ShatterFX")
                    if not ShatterFX then
                        v4:Destroy()
                        return
                    end
                    EmitterManager.manualEmit(ShatterFX)
                    PrimaryPart_2.Anchored = true
                    PrimaryPart_2.Transparency = 1
                    local WeldConstraint_2 = PrimaryPart_2:FindFirstChild("WeldConstraint")
                    if WeldConstraint_2 then
                        WeldConstraint_2:Destroy()
                    end
                    local Sound = PrimaryPart_2:FindFirstChild("Sound")
                    if Sound then
                        Sound:Play()
                    end
                    Debris:AddItem(v4, 0.65)
                    return
                end
                v4:Destroy()
            end
        end,
    }
    local airdropData = a1.Replicator.State.airdropData
    if airdropData then
        a1:spawnAnimation(airdropData)
        return
    end
    a1:_doWalk()
end

function v1:spawnAnimation(a2) -- Line: 255 -- upvalues: Animation (val), EasySound (val), NewTween (val)
    local landTime = a2.landTime
    local Path = self.Path
    local Scalar = Path:GetScalar(self.PathDistance)
    local Scalar_2 = Path:GetScalar(self.PathDistance - 0.1)
    local HumanoidRootPart = self.Model:WaitForChild("HumanoidRootPart")
    local Parachute = false
    if self.Model.Name ~= "Frost Legion" then
        Parachute = self.Model:FindFirstChild("Parachute")
    end
    local v1 = -HumanoidRootPart.HeightOffset.Position
    local u39 = (CFrame.lookAt(Scalar, Scalar_2)) * CFrame.new(v1)
    local Position_2 = u39.Position
    local u50 = CFrame.lookAt(a2.dropPosition, (Vector3.new(Position_2.X, a2.dropPosition.Y, Position_2.Z)))
    self.Model:PivotTo(u50)
    local u73 = Animation.new({
        Track = (self.Model:WaitForChild("Animations")):WaitForChild("Parachute"),
        Target = self.animController,
    }):Play()
    if Parachute then
        Parachute.Transparency = 0
        local Deploy = Parachute:FindFirstChild("Deploy")
        if Deploy and Deploy:IsA("Sound") then
            EasySound.Play({
                destroyOnEnd = true,
                audioGroup = "Towers",
                id = Deploy.SoundId,
                parent = Parachute,
                volume = Deploy.Volume,
            })
        end
    end
    local Magnitude = (u50.Position - u39.Position).Magnitude
    local v2 = (workspace:GetServerTimeNow()) - a2.spawnTime
    NewTween(self.Model, TweenInfo.new(landTime - v2, Enum.EasingStyle.Quad), function(a1) -- Line: 293 -- upvalues: u50 (val), u39 (val), self (val), Magnitude (val)
        local v1 = u50:Lerp(u39, a1)
        local v2 = math.acos((v1.LookVector:Dot(u39.LookVector))) * 0.5
        if v2 ~= v2 then
            v2 = 0
        end
        self.Model:PivotTo(v1 * CFrame.Angles(0, 0, v2) * (CFrame.Angles(math.rad(Magnitude * (1 - a1) * 0.5), 0, 0)))
    end, function() -- Line: 309 -- upvalues: Parachute (val), EasySound (upval), u73 (val)
        if Parachute then
            Parachute.Transparency = 1
            local Land = Parachute:FindFirstChild("Land")
            if Land and Land:IsA("Sound") then
                EasySound.Play({
                    destroyOnEnd = true,
                    audioGroup = "Towers",
                    id = Land.SoundId,
                    parent = Parachute,
                    volume = Land.Volume,
                })
            end
        end
        u73:Stop()
    end)
end

function v1:_doWalk() -- Line: 335
    local v1 = self.Speed / 3.5
    self._idleAnim:Stop()
    self._walkAnim:Play()
    self._walkAnim:AdjustSpeed(v1)
    self._walkAnim:AdjustWeight(1 - self._firingWeight)
    self._walkFiringAnim:Play()
    self._walkFiringAnim:AdjustSpeed(v1)
    self._walkFiringAnim:AdjustWeight(self._firingWeight)
    self._moving = true
end

function v1:_doIdle() -- Line: 351
    self._walkAnim:Stop()
    self._walkFiringAnim:Stop()
    self._idleAnim:Play()
    self._moving = false
end

function v1._face(a1, a2) -- Line: 362 -- upvalues: NewTween (val) -- types: a1: table, a2: vector
    local HumanoidRootPart = a1.Model.HumanoidRootPart
    local u13 = CFrame.new(HumanoidRootPart.CFrame.Position, (Vector3.new(a2.X, HumanoidRootPart.Position.Y, a2.Z)))
    NewTween(a1.Model.HumanoidRootPart, TweenInfo.new(0.3), function(a1) -- Line: 369 -- upvalues: HumanoidRootPart (val), u13 (val)
        HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(u13, a1)
    end)
end

function v1:_createBeam(a2) -- Line: 374 -- types: self: table, a2: userdata
    if self._beams[a2] then
        return
    end
    local HumanoidRootPart = a2:FindFirstChild("HumanoidRootPart")
    local v1 = nil
    if HumanoidRootPart then
        local Handle = self.Model:WaitForChild("GunRig").Handle
        local Start = Handle.Start
        v1 = Handle.Beam:Clone()
        v1.Name = "BeamClone"
        v1.Parent = Handle
        v1.Attachment0 = Start
        v1.Enabled = true
        v1.CurveSize0 = Random.new():NextNumber(-2, 2)
        v1.CurveSize1 = Random.new():NextNumber(-2, 2)
        if self._beamColor then
            v1.Color = ColorSequence.new(self._beamColor)
        end
        local Center = HumanoidRootPart:FindFirstChild("Center")
        if Center == nil then
            Center = Instance.new("Attachment", a2.PrimaryPart)
            Center.Name = "Center"
        end
        v1.Attachment1 = Center
        self._beamCount = self._beamCount + 1
        self._beams[a2] = v1
    end
    return v1
end

function v1:_removeBeam(a2) -- Line: 410 -- types: self: table, a2: userdata
    local v1 = self._beams[a2]
    if v1 == nil then
        return
    end
    self._beamCount = self._beamCount - 1
    v1:Destroy()
    self._beams[a2] = nil
end

function v1:_updateTargets(a2) -- Line: 422
    local v1
    for k, v in pairs(self._beams) do
        if not table.find(a2, k) then
            self:_removeBeam(k)
        end
    end
    for i, i2 in ipairs(a2) do
        if not self._beams[i2] then
            v1 = self:_createBeam(i2)
            self._beams[i2] = v1
        end
    end
end

return v1