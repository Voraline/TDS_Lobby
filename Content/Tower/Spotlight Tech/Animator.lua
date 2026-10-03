-- Script path: ReplicatedStorage.Content.Tower.Spotlight Tech.Animator
-- Decompile time: 19.08 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local BoneUtil = require(ReplicatedStorage.Shared.Modules.BoneUtil)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local SpotlightTech = ReplicatedStorage.Assets.Effects.Misc.SpotlightTech
local v1 = {}
v1.__index = v1

local function makeMotorC0AxisAimer(a1, a2, a3) -- Line: 17 -- types: a1: userdata, a2: vector, a3: vector?
    local Unit = (a3 or Vector3.new(0, 0, 1)).Unit
    local Unit_2 = a2.Unit
    local Part0 = a1.Part0
    assert(Part0, "Motor6D has no Part0")
    local C0 = a1.C0

    local function projectOntoPlane(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
        return a1 - a2 * a1:Dot(a2)
    end

    return function(a1) -- Line: 30 -- upvalues: Part0 (val), C0 (val), Unit_2 (ref), Unit (val) -- types: a1: vector
        local v1 = Part0.CFrame * C0
        local v2 = v1:VectorToObjectSpace(a1 - v1.Position)
        if v2.Magnitude < 1e-06 then
            return
        end
        local v3 = Unit_2
        local v4 = v2 - v3 * v2:Dot(v3)
        local v5 = Unit
        local v6 = Unit_2
        v3 = v5 - v6 * v5:Dot(v6)
        if not (v4.Magnitude < 1e-06) and not (v3.Magnitude < 1e-06) then
            local Unit_3 = v4.Unit
            local Unit_4 = v3.Unit
            local v7 = math.atan2(Unit_2:Dot((Unit_4:Cross(Unit_3))), (Unit_4:Dot(Unit_3)))
            return C0 * (CFrame.fromAxisAngle(Unit_2, v7))
        end
    end
end

local function findAnimation(a1, a2, a3) -- Line: 57
    local v1 = a1:FindFirstChild(a2)
    if not v1 then
        return nil
    end
    local v2 = v1:IsA("Animation") and v1
    local v3 = v1:IsA("Folder") and v1
    if v2 then
        return v2
    end
    if v3 then
        local v4 = v3:FindFirstChild((tostring(a3 or 0)))
        if not v4 then
            return nil
        end
        local v5 = v4:IsA("Animation") and v4
        local v6 = v4:IsA("Folder") and v4
        if v5 then
            return v5
        end
        if v6 then
            return v6:FindFirstChildOfClass("Animation")
        end
    end
    return nil
end

function v1.Initialize(a1) -- Line: 92
    -- upvalues: SpotlightTech (val), EasySound (val), Animation (val), findAnimation (val), BoneUtil (val), Enum (val)
    -- upvalues: RunService (val), GameState (val), EmitterManager (val)
    local u8 = SpotlightTech:FindFirstChild("SpotlightFloor"):Clone()
    local Attachment = Instance.new("Attachment")
    Attachment.Parent = workspace.CurrentCamera
    local Sounds = a1.Model.Sounds
    local v1 = {}
    for i, j in Sounds:GetChildren() do
        table.insert(v1, j.Value)
    end
    EasySound.Preload(v1)
    local u43 = EasySound.Create({
        volume = 0.2,
        audioGroup = "Towers",
        looped = true,
        timeScaled = true,
        id = Sounds.BeamLoop.Value,
        parent = a1.Model.PrimaryPart,
    })
    local u55 = Animation.new({
        Track = findAnimation(a1.Model.Animations, "Attack", 0),
        Target = a1.Model.AnimationController,
    })
    a1._activated = false

    local function updateSpotlightModel(a1_2, a2) -- Line: 121 -- upvalues: a1 (val), BoneUtil (upval)
        if a1._currentWeapon ~= a1.Model.Weapon then
            a1._currentWeapon = a1.Model.Weapon
        end
        local Base = a1.Model.Weapon:FindFirstChild("Base", true)
        local Base_2 = Base and Base:FindFirstChild("Base")
        local Hinge = Base and Base:FindFirstChild("Hinge")
        if a1._goalPosition then
            local Configuration = a1.Model.Weapon:FindFirstChild("Configuration", true)
            if not Base_2 and not Hinge then
                local Arms = Configuration and Configuration:FindFirstChild("Arms")
                if Arms then
                    local Value
                    for i, j in Arms:GetChildren() do
                        if j:IsA("ObjectValue") then
                            Value = j.Value
                            if Value then
                                Value.CFrame = BoneUtil.faceWorldPositionLockAxis(
                                    Value,
                                    a1._goalPosition,
                                    Vector3.new(-1, -0, -0),
                                    CFrame.Angles(1.5707963267948966, -1.5707963267948966, 0)
                                )
                            end
                        end
                    end
                end
                a1:Face(a1._goalPosition)
                return
            end
            if Base_2 then
                if not a1_2 then
                    local C0_5 = Base_2.C0
                    local Unit_3 = Vector3.new(-0, -0, -1).Unit
                    local Unit_4 = Vector3.new(1, 0, 0).Unit
                    local Part0_2 = Base_2.Part0
                    assert(Part0_2, "Motor6D has no Part0")
                    local C0_2 = Base_2.C0

                    local function projectOntoPlane_2(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
                        return a1 - a2 * a1:Dot(a2)
                    end

                    Base_2.C0 = C0_5:Lerp((function(a1) -- Line: 30 -- upvalues: Part0_2 (val), C0_2 (val), Unit_4 (ref), Unit_3 (val) -- types: a1: vector
                        local v1 = Part0_2.CFrame * C0_2
                        local v2 = v1:VectorToObjectSpace(a1 - v1.Position)
                        if v2.Magnitude < 1e-06 then
                            return
                        end
                        local v3 = Unit_4
                        local v4 = v2 - v3 * v2:Dot(v3)
                        local v5 = Unit_3
                        local v6 = Unit_4
                        v3 = v5 - v6 * v5:Dot(v6)
                        if not (v4.Magnitude < 1e-06) and not (v3.Magnitude < 1e-06) then
                            local Unit = v4.Unit
                            local Unit_2 = v3.Unit
                            local v7 = math.atan2(Unit_4:Dot((Unit_2:Cross(Unit))), (Unit_2:Dot(Unit)))
                            return C0_2 * (CFrame.fromAxisAngle(Unit_4, v7))
                        end
                    end)(a1._goalPosition), a2 * 5)
                else
                    local Unit = Vector3.new(-0, -0, -1).Unit
                    local Unit_2 = Vector3.new(1, 0, 0).Unit
                    local Part0 = Base_2.Part0
                    assert(Part0, "Motor6D has no Part0")
                    local C0 = Base_2.C0

                    local function projectOntoPlane(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
                        return a1 - a2 * a1:Dot(a2)
                    end

                    Base_2.C0 = (function(a1) -- Line: 30 -- upvalues: Part0 (val), C0 (val), Unit_2 (ref), Unit (val) -- types: a1: vector
                        local v1 = Part0.CFrame * C0
                        local v2 = v1:VectorToObjectSpace(a1 - v1.Position)
                        if v2.Magnitude < 1e-06 then
                            return
                        end
                        local v3 = Unit_2
                        local v4 = v2 - v3 * v2:Dot(v3)
                        local v5 = Unit
                        local v6 = Unit_2
                        v3 = v5 - v6 * v5:Dot(v6)
                        if not (v4.Magnitude < 1e-06) and not (v3.Magnitude < 1e-06) then
                            local Unit_3 = v4.Unit
                            local Unit_4 = v3.Unit
                            local v7 = math.atan2(Unit_2:Dot((Unit_4:Cross(Unit_3))), (Unit_4:Dot(Unit_3)))
                            return C0 * (CFrame.fromAxisAngle(Unit_2, v7))
                        end
                    end)(a1._goalPosition)
                end
            end
            if Hinge then
                if a1_2 then
                    local Unit_5 = Vector3.new(-0, -0, -1).Unit
                    local Unit_6 = Vector3.new(0, 1, 0).Unit
                    local Part0_3 = Hinge.Part0
                    assert(Part0_3, "Motor6D has no Part0")
                    local C0_3 = Hinge.C0

                    local function projectOntoPlane_3(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
                        return a1 - a2 * a1:Dot(a2)
                    end

                    Hinge.C0 = (function(a1) -- Line: 30 -- upvalues: Part0_3 (val), C0_3 (val), Unit_6 (ref), Unit_5 (val) -- types: a1: vector
                        local v1 = Part0_3.CFrame * C0_3
                        local v2 = v1:VectorToObjectSpace(a1 - v1.Position)
                        if v2.Magnitude < 1e-06 then
                            return
                        end
                        local v3 = Unit_6
                        local v4 = v2 - v3 * v2:Dot(v3)
                        local v5 = Unit_5
                        local v6 = Unit_6
                        v3 = v5 - v6 * v5:Dot(v6)
                        if not (v4.Magnitude < 1e-06) and not (v3.Magnitude < 1e-06) then
                            local Unit = v4.Unit
                            local Unit_2 = v3.Unit
                            local v7 = math.atan2(Unit_6:Dot((Unit_2:Cross(Unit))), (Unit_2:Dot(Unit)))
                            return C0_3 * (CFrame.fromAxisAngle(Unit_6, v7))
                        end
                    end)(a1._goalPosition)
                    return
                end
                local C0_6 = Hinge.C0
                local Unit_7 = Vector3.new(-0, -0, -1).Unit
                local Unit_8 = Vector3.new(0, 1, 0).Unit
                local Part0_4 = Hinge.Part0
                assert(Part0_4, "Motor6D has no Part0")
                local C0_4 = Hinge.C0

                local function projectOntoPlane_4(a1, a2) -- Line: 26 -- types: a1: vector, a2: vector
                    return a1 - a2 * a1:Dot(a2)
                end

                Hinge.C0 = C0_6:Lerp((function(a1) -- Line: 30 -- upvalues: Part0_4 (val), C0_4 (val), Unit_8 (ref), Unit_7 (val) -- types: a1: vector
                    local v1 = Part0_4.CFrame * C0_4
                    local v2 = v1:VectorToObjectSpace(a1 - v1.Position)
                    if v2.Magnitude < 1e-06 then
                        return
                    end
                    local v3 = Unit_8
                    local v4 = v2 - v3 * v2:Dot(v3)
                    local v5 = Unit_7
                    local v6 = Unit_8
                    v3 = v5 - v6 * v5:Dot(v6)
                    if not (v4.Magnitude < 1e-06) and not (v3.Magnitude < 1e-06) then
                        local Unit = v4.Unit
                        local Unit_2 = v3.Unit
                        local v7 = math.atan2(Unit_8:Dot((Unit_2:Cross(Unit))), (Unit_2:Dot(Unit)))
                        return C0_4 * (CFrame.fromAxisAngle(Unit_8, v7))
                    end
                end)(a1._goalPosition), a2 * 5)
                return
            end
        end
    end

    local function isJailed() -- Line: 191 -- upvalues: a1 (val), Enum (upval)
        if a1.Model:GetAttribute("Ignore") == true then
            return true
        end
        local StatusEffectRenderer = a1.StatusEffectRenderer
        if StatusEffectRenderer and StatusEffectRenderer:has(Enum.StatusEffect.Jailed) then
            return true
        end
        return false
    end

    local u59 = nil
    local v2 = RunService.PreSimulation:Connect(function(a1_2) -- Line: 205
        -- upvalues: GameState (upval), a1 (val), Enum (upval), u59 (ref), u8 (val), Attachment (val)
        -- upvalues: updateSpotlightModel (val)
        local v1
        local v2 = a1_2 * GameState.TimeScale
        if a1.Model:GetAttribute("Ignore") ~= true then
            local StatusEffectRenderer = a1.StatusEffectRenderer
            v1 = if not StatusEffectRenderer then false else not not StatusEffectRenderer:has(Enum.StatusEffect.Jailed)
        else
            v1 = true
        end
        if v1 then
            if a1._activated then
                u59(false)
            end
            a1._goalPosition = nil
            a1._spotlightTargetPosition = nil
            u8:PivotTo((CFrame.new(0, -5000, 0)))
            return
        end
        if not a1._activated then
            u8:PivotTo((CFrame.new(0, -5000, 0)))
            return
        end
        if a1._spotlightTargetPosition then
            v1 = (u8:GetPivot()):Lerp(CFrame.new(a1._spotlightTargetPosition), v2 * 5)
            Attachment.WorldCFrame = v1
            u8:PivotTo(v1)
        end
        updateSpotlightModel(false, v2)
    end)
    local u68 = true
    local u69 = 0

    function u59(a1_2) -- Line: 237
        -- upvalues: u69 (ref), a1 (val), u55 (ref), EasySound (upval), Sounds (val), u43 (val), u8 (val)
        -- upvalues: Attachment (val), u68 (ref), EmitterManager (upval)
        u69 = u69 + 1
        local u140 = u69
        local _activated = a1._activated
        a1._activated = a1_2
        if not a1_2 then
            if not u68 and a1_2 ~= _activated then
                EasySound.Play({
                    audioGroup = "Towers",
                    playbackSpeed = 1,
                    timeScaled = true,
                    destroyOnEnd = true,
                    id = Sounds.Deactivate.Value,
                    parent = a1.Model.PrimaryPart,
                })
                a1:Delay(0.2, function() -- Line: 284 -- upvalues: u43 (upval)
                    u43:Stop()
                end)
            end
            u68 = false
            u8:PivotTo((CFrame.new(0, -5000, 0)))
        elseif _activated == a1_2 then
            u8:ScaleTo(a1.Stats.Attributes.SpotlightRadius * 2)
            if a1._spotlightTargetPosition then
                Attachment.WorldCFrame = CFrame.new(a1._spotlightTargetPosition)
                u8:PivotTo((CFrame.new(a1._spotlightTargetPosition)))
            end
        else
            u55:Play()
            EasySound.Play({
                audioGroup = "Towers",
                playbackSpeed = 1,
                timeScaled = true,
                destroyOnEnd = true,
                id = Sounds.Activate.Value,
                parent = a1.Model.PrimaryPart,
            })
            a1:Delay(0.5, function() -- Line: 255 -- upvalues: u140 (val), u69 (upval), a1 (upval), u43 (upval), u8 (upval), Attachment (upval)
                if u140 == u69 and a1._activated then
                    u43:Play()
                    u8:ScaleTo(a1.Stats.Attributes.SpotlightRadius * 2)
                    if a1._spotlightTargetPosition then
                        Attachment.WorldCFrame = CFrame.new(a1._spotlightTargetPosition)
                        u8:PivotTo((CFrame.new(a1._spotlightTargetPosition)))
                    end
                    return
                end
            end)
        end
        local Configuration = a1.Model.Weapon:FindFirstChild("Configuration", true)
        if not Configuration then
            return
        end
        local Neons = Configuration:FindFirstChild("Neons")
        local VFX = Configuration:FindFirstChild("VFX")
        if Neons then
            for i, j in Neons:GetChildren() do
                if j:IsA("ObjectValue") then
                    local Value = j.Value
                    if Value then
                        if not a1_2 then
                            if not a1_2 or a1_2 ~= _activated then
                                Value.Color = Color3.new(0.2, 0.2, 0.2)
                            else
                                Value.Color = Color3.fromRGB(211, 190, 150)
                            end
                        elseif a1_2 ~= _activated then
                            a1:Delay(0.5, function() -- Line: 313 -- upvalues: u140 (val), u69 (upval), a1 (upval), Value (val)
                                if u140 == u69 and a1._activated then
                                    Value.Color = Color3.fromRGB(211, 190, 150)
                                    return
                                end
                            end)
                        elseif not a1_2 or a1_2 ~= _activated then
                            Value.Color = Color3.new(0.2, 0.2, 0.2)
                        else
                            Value.Color = Color3.fromRGB(211, 190, 150)
                        end
                    end
                end
            end
        end
        if VFX then
            local Beam, Value_2
            for k, n in VFX:GetChildren() do
                if n:IsA("ObjectValue") then
                    Value_2 = n.Value
                    if Value_2 then
                        Beam = Value_2:FindFirstChildWhichIsA("Beam")
                        if Beam then
                            if a1_2 then
                                Beam.Width0 = 0.5
                                Beam.Width1 = a1.Stats.Attributes.SpotlightRadius * 2
                            end
                            Beam.Attachment1 = if not a1_2 then nil else Attachment
                            Beam.Enabled = a1_2
                        end
                        EmitterManager.toggle(Value_2, a1_2)
                        for m, i5 in Value_2:GetChildren() do
                            if i5:IsA("ParticleEmitter") then
                                i5:Clear()
                            end
                        end
                    end
                end
            end
        end
    end

    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 362 -- upvalues: a1 (val), u59 (ref)
        a1._goalPosition = nil
        a1._spotlightTargetPosition = nil
        u59(false)
    end)))
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 368
        -- upvalues: u8 (val), a1 (val), u55 (ref), findAnimation (upval), Animation (upval), updateSpotlightModel (val)
        -- upvalues: u59 (ref)
        u8:ScaleTo(a1.Stats.Attributes.SpotlightRadius * 2)
        local IsPlaying = false
        local TimePosition = 0
        local Speed = 1
        if u55.Controller then
            IsPlaying = u55.Controller.IsPlaying
            TimePosition = u55.Controller.TimePosition
            Speed = u55.Controller.Speed
        end
        local v1 = findAnimation(a1.Model.Animations, "Attack", a1_2)
        if v1 then
            u55:Stop(0)
            u55 = nil
            u55 = Animation.new({Track = v1, Target = a1.Model.AnimationController})
            if IsPlaying then
                u55:Play()
                u55.Controller.TimePosition = TimePosition
                u55.Controller.Speed = Speed
            end
        end
        updateSpotlightModel(true)
        u59(a1._activated)
    end)
    u8:PivotTo((CFrame.new(0, -5000, 0)))
    u8.Parent = workspace.CurrentCamera
    u8:ScaleTo(a1.Stats.Attributes.SpotlightRadius * 2)
    a1.Maid:Mark(u8)
    a1.Maid:Mark(Attachment)
    a1.Maid:Mark(function() -- Line: 405 -- upvalues: EasySound (upval), u43 (val)
        EasySound.Destroy(u43)
    end)
    a1.Executables = {
        ActivateSpotlight = function() -- Line: 410 -- upvalues: u59 (ref)
            u59(true)
        end,
        DeactivateSpotlight = function() -- Line: 413 -- upvalues: u59 (ref)
            u59(false)
        end,
        TriggerConfusionSpotlight = function() -- Line: 416 -- upvalues: EasySound (upval), Sounds (val), a1 (val)
            EasySound.Play({
                audioGroup = "Towers",
                playbackSpeed = 1,
                volume = 0.8,
                timeScaled = true,
                destroyOnEnd = true,
                id = Sounds.Confusion.Value,
                parent = a1.Model.PrimaryPart,
            })
        end,
    }
    u59(false)
    a1:Thread(function() -- Line: 431 -- upvalues: a1 (val), Enum (upval)
        local v1
        if a1.Model:GetAttribute("Ignore") ~= true then
            local StatusEffectRenderer = a1.StatusEffectRenderer
            v1 = if not StatusEffectRenderer then false else not not StatusEffectRenderer:has(Enum.StatusEffect.Jailed)
        else
            v1 = true
        end
        if v1 then
            a1._goalPosition = nil
            a1._spotlightTargetPosition = nil
            return
        end
        v1 = a1:FindTarget()
        if not v1 then
            return
        end
        local PrimaryPart = v1.PrimaryPart
        if not PrimaryPart then
            return
        end
        a1._goalPosition = PrimaryPart.Position
        a1._spotlightTargetPosition = v1.PrimaryPart.Node.WorldPosition
    end)
    a1.Maid:Mark(v2)
end

return v1