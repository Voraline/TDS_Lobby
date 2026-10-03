-- Script path: ReplicatedStorage.Content.Tower.Pursuit.Animator
-- Decompile time: 20.80 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local CustomProjectile = require(ReplicatedStorage.Shared.Modules.CustomProjectile)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NPCReplicator = require(ReplicatedStorage.Client.Modules.Replicators.NPCReplicator)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local PursuitStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PursuitStore)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TaggedInstances = require(ReplicatedStorage.Shared.Modules.TaggedInstances)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u76 = {Dragon = true}
local u79 = 0
local u80 = {}
local u81 = nil
local u82 = nil
local v1 = {}
v1.__index = v1

local function toVector(a1) -- Line: 77 -- types: a1: vector
    return (vector.create(a1.X, a1.Y, a1.Z))
end

local function flatten(a1) -- Line: 81 -- types: a1: vector
    return (vector.create(a1.x, 0, a1.z))
end

local function stepProjectile(a1) -- Line: 85
    local alpha = a1.alpha
    local start = a1.start
    local goal = a1.goal
    local v1 = CFrame.lookAt(start, goal)
    return (v1:Lerp(CFrame.lookAlong(goal, v1.LookVector), alpha))
end

local function stepPursuits(a1) -- Line: 95
    -- upvalues: u79 (ref), u81 (ref), GameState (val), u80 (ref)
    if u79 == 0 and u81 then
        u81:Disconnect()
        u81 = nil
    end
    local v1 = a1 * GameState.TimeScale
    local v2 = {}
    local v3 = {}
    for i, j in u80 do
        if i and i.Parent then
            table.insert(v2, i)
            table.insert(v3, j)
        end
    end
    workspace:BulkMoveTo(v2, v3)
    u80 = {}
end

local function addToBulkMove(a1, a2) -- Line: 117
    -- upvalues: u80 (ref), u81 (ref), RunService (val), stepPursuits (val)
    u80[a1] = a2
    if not u81 then
        u81 = RunService.RenderStepped:Connect(stepPursuits)
    end
end

local function getPlacement() -- Line: 124 -- upvalues: TypedPromise (val), PathPlacementCursorController (val)
    return TypedPromise.new(function(a1, a2, a3) -- Line: 125 -- upvalues: PathPlacementCursorController (upval)
        local u3 = nil
        local u4 = nil
        PathPlacementCursorController:Start({constrainToGround = true, constrainToPath = false, uiEnabled = false})
        u3 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2_2, a3) -- Line: 140 -- upvalues: u3 (ref), u4 (ref), a2 (val), a1 (val)
            u3:Disconnect()
            u4:Disconnect()
            if a3 == Vector3.new(0, 0, 0) then
                a2("Invalid position")
                return
            end
            a1(a3)
        end)
        local v1 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 149 -- upvalues: u3 (ref), u4 (ref), a2 (val)
            u3:Disconnect()
            u4:Disconnect()
            a2("Canceled")
        end)
        a3(function() -- Line: 129 -- upvalues: u3 (ref), u4 (ref)
            u3:Disconnect()
            u4:Disconnect()
        end)
    end)
end

local function cleanUpAbility() -- Line: 158 -- upvalues: u82 (ref), PursuitStore (val)
    if u82 then
        u82:cancel()
    end
    PursuitStore.setVisible(false)
end

function v1.Initialize(a1) -- Line: 166
    -- upvalues: SpringClass (val), u76 (val), EmitterManager (val), TaggedInstances (val), NPCReplicator (val)
    -- upvalues: EasySound (val), u79 (ref), u82 (ref), PursuitStore (val), TypedPromise (val)
    -- upvalues: PathPlacementCursorController (val), cleanUpAbility (val), CustomProjectile (val), stepProjectile (val)
    -- upvalues: Debris (val), EffectsController (val), RunService (val), GameState (val), u80 (ref), u81 (ref)
    -- upvalues: stepPursuits (val)
    local Replicator = a1.Replicator
    local Name = a1.Model.Name
    local Weapon = a1.Model:WaitForChild("Weapon")
    local FlightPos = a1.Model:WaitForChild("FlightPos")
    local v1 = (Replicator:WaitForState("FlightPos")) + Vector3.new(0, 1, 0) * FlightPos.Position.Y
    local v2 = v1.y + 8
    local u271 = SpringClass.new(v1, 1, a1.Stats.Attributes.Speed)
    u271.p = v1
    u271.t = v1
    local u295 = SpringClass.new(v2, 0.8, 5)
    u295.p = v2
    u295.t = v2
    local u351 = SpringClass.new(0, 0.6, 2)
    local u399 = SpringClass.new(0, 1, 20)
    local u375 = SpringClass.new(0, 0.6, 30)
    local u383 = SpringClass.new(0, 0.6, 30)
    local u311 = CFrame.fromOrientation(0, FlightPos.CFrame.Rotation.Y, 0)
    local u279 = u311
    local u319 = 1
    local u303 = nil
    local u335 = nil
    local u212 = {}
    local u359 = false
    local u343 = false
    local u367 = 0
    local u253 = 0
    a1._specialSkin = u76[Name]
    a1._customEffects = {}
    a1._hasShootingAnimation = a1.Model.Animations:FindFirstChild("Shoot") ~= nil
    a1._shootingTrack = nil
    if a1.Model.PrimaryPart:FindFirstChild("Placement") then
        EmitterManager.manualEmit(a1.Model.PrimaryPart.Placement)
    end
    local u169 = TaggedInstances.getTaggedInstances(a1.Model)
    if u169.UpgradeEffects then
        local Name_2
        local v3 = nil
        local v4 = nil
        for i, j in u169.UpgradeEffects, v3, v4 do
            for k, n in j:GetChildren() do
                Name_2 = n.Name
                if not a1._customEffects[Name_2] then
                    a1._customEffects[Name_2] = {}
                end
                table.insert(a1._customEffects[Name_2], n)
            end
        end
    end
    a1.OnUpgrade:Connect(function(a1_2, a2) -- Line: 224 -- upvalues: a1 (val), EmitterManager (upval), Name (val), u169 (val)
        local v1 = if not a2 or not (a2 > 0) then ("%*"):format(a1_2) else ("%*%*"):format(a1_2, (string.char(96 + a2)))
        local v2 = a1._customEffects[v1] or a1._customEffects[("%*"):format(a1_2)]
        if v2 then
            for i, j in v2 do
                EmitterManager.toggle(j, true)
            end
        end
        if Name == "Dragon" then
            if v1 == "5a" then
                u169.MuzzleFlash[1].Color = ColorSequence.new(Color3.fromRGB(57, 255, 27))
                u169.MuzzleFlash[2].Color = ColorSequence.new(Color3.fromRGB(57, 255, 27))
                return
            end
            if v1 == "5b" then
                u169.MuzzleFlash[1].Color = ColorSequence.new(Color3.fromRGB(152, 27, 255))
                u169.MuzzleFlash[2].Color = ColorSequence.new(Color3.fromRGB(152, 27, 255))
            end
        end
    end)
    if a1.Model.Animations:FindFirstChild("Fly") then
        local v5 = a1:Animate("Fly")
        if v5 then
            (v5:GetMarkerReachedSignal("PlaySound")):Connect(function(a1_2) -- Line: 256 -- upvalues: a1 (val)
                a1:_playOneShot(a1_2)
            end)
        end
    end

    local function getAttackTarget() -- Line: 262 -- upvalues: Replicator (val), NPCReplicator (upval)
        local v1 = Replicator:Get("AttackTarget")
        return v1 and NPCReplicator.GetNPCFromFolder(v1)
    end

    local PursuitSounds = require(script.PursuitSounds)

    local function getSoundId(a1) -- Line: 271 -- upvalues: PursuitSounds (val), Name (val) -- types: a1: string
        local v1, v2 = a1:match("^(.-)(%d+)$")
        local v3 = PursuitSounds[v1 or a1]
        if not v3 then
            return nil
        end
        local Default = v3[Name] or v3.Default
        if typeof(Default) == "table" then
            return Default[tonumber(v2) or 1]
        end
        return Default
    end

    function a1._getLoop(a1, a2) -- Line: 286
        -- upvalues: u212 (val), PursuitSounds (val), Name (val), EasySound (upval), FlightPos (val)
        local v1
        local v2 = u212[a2]
        if v2 then
            return v2
        end
        local v3, v4 = a2:match("^(.-)(%d+)$")
        local v5 = PursuitSounds[v3 or a2]
        if v5 then
            local Default = v5[Name] or v5.Default
            v1 = if typeof(Default) ~= "table" then Default else Default[tonumber(v4) or 1]
        else
            v1 = nil
        end
        if not v1 then
            return nil
        end
        v3 = EasySound.Create({
            volume = 0.5,
            looped = true,
            audioGroup = "Towers",
            id = v1,
            parent = FlightPos,
        })
        u212[a2] = v3
        return v3
    end

    function a1._playOneShot(a1, a2, a3) -- Line: 306
        -- upvalues: PursuitSounds (val), Name (val), EasySound (upval), FlightPos (val)
        local v1
        local v2, v3 = a2:match("^(.-)(%d+)$")
        local v4 = PursuitSounds[v2 or a2]
        if v4 then
            local Default = v4[Name] or v4.Default
            v1 = if typeof(Default) ~= "table" then Default else Default[tonumber(v3) or 1]
        else
            v1 = nil
        end
        if not v1 then
            return
        end
        local Play = EasySound.Play
        v3 = {
            volume = 0.5,
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = v1,
            parent = FlightPos,
        }
        v3.playbackSpeed = a3 and a3.playbackSpeed or nil
        return Play(v3)
    end

    a1._minigunStartPlayer = nil
    a1._minigunSpinLoop = nil
    a1._minigunFireLoop = nil
    a1._minigunSlowTriggered = false

    local function playMinigunSlowOnce() -- Line: 327 -- upvalues: a1 (val)
        if a1._minigunSlowTriggered then
            return
        end
        a1._minigunSlowTriggered = true
        a1:_playOneShot("MinigunSlow")
    end

    u79 = u79 + 1
    a1.Maid:Mark(function() -- Line: 337 -- upvalues: u79 (upval)
        u79 = u79 - 1
    end)
    local v6 = a1:_getLoop("FlightLoop")
    if v6 then
        v6:Play()
    end
    a1.AbilityCallbacks = {
        Patrol = function() -- Line: 349
            -- upvalues: u82 (upval), PursuitStore (upval), a1 (val), TypedPromise (upval)
            -- upvalues: PathPlacementCursorController (upval), cleanUpAbility (upval)
            if u82 then
                u82:cancel()
            end
            PursuitStore.setVisible(false)
            PursuitStore.setVisible(true)
            PursuitStore.setModel(a1.Model)
            local u18 = nil
            u82 = TypedPromise.new(function(a1, a2, a3) -- Line: 125 -- upvalues: PathPlacementCursorController (upval)
                local u3 = nil
                local u4 = nil
                PathPlacementCursorController:Start({constrainToGround = true, constrainToPath = false, uiEnabled = false})
                u3 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2_2, a3) -- Line: 140 -- upvalues: u3 (ref), u4 (ref), a2 (val), a1 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    if a3 == Vector3.new(0, 0, 0) then
                        a2("Invalid position")
                        return
                    end
                    a1(a3)
                end)
                local v1 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 149 -- upvalues: u3 (ref), u4 (ref), a2 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    a2("Canceled")
                end)
                a3(function() -- Line: 129 -- upvalues: u3 (ref), u4 (ref)
                    u3:Disconnect()
                    u4:Disconnect()
                end)
            end)
            ;(u82:andThen(function(a1) -- Line: 358 -- upvalues: u18 (ref) -- types: a1: vector
                u18 = a1
            end)):finally(cleanUpAbility):await()
            if not u18 then
                return false
            end
            local v1 = {}
            local v2 = u18
            v1.position = vector.create(v2.X, v2.Y, v2.Z) + Vector3.new(0, 0.10000000149011612, 0)
            return v1
        end,
    }
    a1.Executables = {
        ReloadAmmo = function() -- Line: 376 -- upvalues: u253 (ref), a1 (val)
            u253 = 0
            local v1 = a1:_playOneShot("ReloadStart")
            if v1 and v1.Ended then
                v1.Ended:Once(function() -- Line: 381 -- upvalues: a1 (upval)
                    a1:_playOneShot("ReloadFinished")
                end)
            end
        end,
        ReloadMissiles = function() -- Line: 386 -- upvalues: u253 (ref), Weapon (val)
            u253 = 0
            local Configuration = Weapon.Heli:FindFirstChild("Configuration")
            if not Configuration then
                return
            end
            local Missiles = Configuration.Bones:FindFirstChild("Missiles")
            if Missiles then
                local Value
                for i, j in Missiles:GetChildren() do
                    Value = j.Value
                    if Value and Value:IsA("Bone") then
                        Value.Transform = CFrame.new()
                    end
                end
            end
        end,
        Radio = function(a1_2, a2) -- Line: 405 -- upvalues: u271 (val), u279 (ref), a1 (val) -- types: a1_2: vector, a2: number
            local v1 = a1_2 - u271.p
            local x = v1.x
            local z = v1.z
            local v2 = vector.create(x, 0, z)
            local v3 = vector.normalize(v2)
            u279 = CFrame.lookAlong(Vector3.new(0, 0, 0), v3)
            a1:_playOneShot((("Ability%*"):format(a2)))
        end,
        Projectile = function(a1_2, a2, a3, a4) -- Line: 411
            -- upvalues: Weapon (val), EmitterManager (upval), a1 (val), CustomProjectile (upval)
            -- upvalues: stepProjectile (upval), Debris (upval), EffectsController (upval)
            local Configuration = Weapon.Heli:FindFirstChild("Configuration")
            if not Configuration then
                return
            end
            local Value = Configuration.Attachments.Missiles:FindFirstChild(a2).Value
            EmitterManager.manualEmit(Value)
            local v1 = Random.new():NextNumber(0.9, 1.1)
            a1:_playOneShot("RocketFire", {playbackSpeed = v1})
            local Missiles = Configuration.Bones:FindFirstChild("Missiles")
            if Missiles then
                local v2 = Missiles:FindFirstChild(a2)
                local Value_2 = v2 and v2.Value
                if Value_2 and Value_2:IsA("Bone") then
                    Value_2.Transform = (Value_2.CFrame:Inverse()) * CFrame.new(0, 0, 50)
                end
            end
            local ExplosionMdl = Configuration:FindFirstChild("ExplosionMdl")
            local u130 = Configuration:FindFirstChild("RocketMdl").Value:Clone()
            u130.Parent = workspace
            u130.Anchored = true
            for k, v in pairs(u130:GetDescendants()) do
                if v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = true
                end
            end
            CustomProjectile:ThrowProjectile(Value.WorldPosition, a1_2, a3, u130, stepProjectile, function() -- Line: 459
                -- upvalues: u130 (val), ExplosionMdl (val), a4 (val), a1_2 (val), EmitterManager (upval), a1 (upval)
                -- upvalues: Debris (upval), EffectsController (upval)
                u130.Transparency = 1
                for i, j in u130:GetDescendants() do
                    if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                        j.Enabled = false
                    end
                end
                if not ExplosionMdl or not ExplosionMdl.Value then
                    EffectsController.Explosion({Position = a1_2, Radius = a4, Sound = 4725504496})
                else
                    local v1
                    ;(if not ExplosionMdl.Value:GetAttribute("Group") then ExplosionMdl.Value:Clone() else (ExplosionMdl.Value:GetChildren())[math.random(1, #ExplosionMdl.Value:GetChildren())]:Clone()):ScaleTo(a4)
                    v1:PivotTo((CFrame.new(a1_2)))
                    v1.Parent = workspace.CurrentCamera
                    EmitterManager.manualEmit(v1)
                    a1:_playOneShot("RocketExplode")
                    Debris:AddItem(v1, 2)
                end
                Debris:AddItem(u130, 1)
            end)
        end,
    }
    local u281 = 0
    local u282 = nil
    a1.Maid:Mark((RunService.PreSimulation:Connect(function(a1_2) -- Line: 500
        -- upvalues: GameState (upval), Replicator (val), Weapon (val), a1 (val), u282 (ref), u295 (val), u271 (val)
        -- upvalues: u303 (ref), u279 (ref), u311 (ref), u319 (ref), u281 (ref), u80 (upval), u81 (upval)
        -- upvalues: RunService (upval), stepPursuits (upval), FlightPos (val)
        local v1, v2, v3, v4
        local v5 = a1_2 * GameState.TimeScale
        local v6 = Replicator:Get("FlightPos")
        if not v6 then
            return
        end
        local Heli = Weapon.Heli
        local RootPart = if not a1._specialSkin then Heli.PrimaryPart else a1.Model.RootPart
        local BaseRootPart = if not a1._specialSkin then a1.Model.PrimaryPart else a1.Model.BaseRootPart
        if not u282 or 0.1 < (u282 - v6).Magnitude then
            local v7 = RaycastParams.new()
            v7.FilterType = Enum.RaycastFilterType.Include
            v7.FilterDescendantsInstances = {
                workspace:FindFirstChild("Cliff"),
                workspace:FindFirstChild("Ground"),
                (workspace:FindFirstChild("Map")),
            }
            v2 = workspace:Raycast(Vector3.new(v6.X, BaseRootPart.Position.Y + 8, v6.Z), Vector3.new(0, -8, 0), v7)
            v3 = v2 and v2.Position.Y + 8 or BaseRootPart.Position.Y + 8
            u295.t = v3
            u282 = v6
        end
        u271.t = v6
        if u303 and u303.PrimaryPart then
            local Position = u303.PrimaryPart.Position
            local X_2 = Position.X
            local Y = Position.Y
            local Z_2 = Position.Z
            v4 = vector.create(X_2, Y, Z_2) - u271.p
            local x = v4.x
            local z = v4.z
            v1 = vector.create(x, 0, z)
            v2 = vector.normalize(v1)
            u279 = CFrame.lookAlong(Vector3.new(0, 0, 0), v2)
        end
        if u279 ~= u311 then
            u311 = u311:Lerp(u279, v5 * 2)
        end
        local p = u271.p
        local p_2 = u295.p
        v3 = p + vector.create(0, p_2, 0)
        u319 = if not (1 < u271.v.magnitude) then math.lerp(u319, 1, v5) else math.lerp(u319, 0, v5)
        local v8 = math.cos(u281 * 1.5)
        local v9 = math.sin(u281 * 2)
        local v10 = math.sin(u281)
        v4 = (vector.create(v8, v9, v10)) * 0.25
        v1 = CFrame.lookAt(v3, v3 + u311.LookVector) + v4
        u80[RootPart] = v1
        if not u81 then
            v10 = stepPursuits
            u81 = RunService.RenderStepped:Connect(v10)
        end
        u80[FlightPos] = v1
        if not u81 then
            local v11 = stepPursuits
            u81 = RunService.RenderStepped:Connect(v11)
        end
        u281 = u281 + v5
    end)))
    a1:Thread(function() -- Line: 569
        -- upvalues: a1 (val), u303 (ref), u335 (ref), Replicator (val), NPCReplicator (upval), u343 (ref), u253 (ref)
        -- upvalues: GameState (upval), u351 (val), u359 (ref), u367 (ref), u375 (val), u383 (val)
        -- upvalues: EmitterManager (upval)
        local Configuration = a1.Model.Weapon.Heli.Configuration
        local Attribute = Configuration:GetAttribute("Type")
        local Attribute_2 = Configuration:GetAttribute("BulletType")
        local Attribute_3 = Configuration:GetAttribute("BulletReversed")
        u303 = a1:FindTarget()
        local v1 = Replicator:Get("AttackTarget")
        u335 = v1 and NPCReplicator.GetNPCFromFolder(v1)
        if u343 then
            u253 = tick()
            if a1._hasShootingAnimation and not a1._shootingTrack then
                a1._shootingTrack = a1:Animate("Shoot")
            end
        elseif 1 <= (tick() - u253) * GameState.TimeScale and a1._shootingTrack then
            a1._shootingTrack:Stop()
            a1._shootingTrack = nil
        end
        if u335 and u335.Model then
            local v2
            local Position = u335.Model.PrimaryPart.Position
            local X = Position.X
            local Y = Position.Y
            local Z = Position.Z
            local v3 = vector.create(X, Y, Z)
            if Attribute == "SingleBarrel" then
                v2 = Random.new():NextNumber(0.9, 1.1)
                a1:_playOneShot("RifleFire", {playbackSpeed = v2})
                u343 = true
            elseif Attribute == "DualBarrel" then
                v2 = Random.new():NextNumber(0.9, 1.1)
                a1:_playOneShot("BaseFire", {playbackSpeed = v2})
                u343 = true
            elseif Attribute == "Minigun" then
                local v4
                u351.t = 1
                v2 = Replicator:Get("Revved")
                if not u359 then
                    u359 = true
                    a1._minigunSlowTriggered = false
                    v4 = a1
                    local _minigunSpinLoop_2 = a1._minigunSpinLoop or a1:_getLoop("MinigunSpin")
                    v4._minigunSpinLoop = _minigunSpinLoop_2
                    local _minigunSpinLoop = a1._minigunSpinLoop
                    a1._minigunStartPlayer = a1:_playOneShot("MinigunStart", {playbackSpeed = 1})
                    local _minigunStartPlayer = a1._minigunStartPlayer
                    if _minigunStartPlayer then
                        local u138 = false
                        if _minigunStartPlayer.Ended then
                            _minigunStartPlayer.Ended:Once(function() -- Line: 624 -- upvalues: u138 (ref), u359 (upval), u343 (upval), _minigunSpinLoop (val), a1 (upval)
                                u138 = true
                                if u359 and not u343 and _minigunSpinLoop then
                                    _minigunSpinLoop:Play()
                                    local u8 = nil
                                    local v1 = (_minigunSpinLoop:GetPropertyChangedSignal("IsPlaying")):Connect(function() -- Line: 632 -- upvalues: _minigunSpinLoop (upval), u8 (ref), a1 (upval)
                                        if not _minigunSpinLoop.IsPlaying then
                                            u8:Disconnect()
                                            if a1._minigunSlowTriggered then
                                                return
                                            end
                                            a1._minigunSlowTriggered = true
                                            a1:_playOneShot("MinigunSlow")
                                        end
                                    end)
                                end
                            end)
                        end
                        local u145 = nil
                        local v5 = (_minigunStartPlayer:GetPropertyChangedSignal("IsPlaying")):Connect(function() -- Line: 643 -- upvalues: _minigunStartPlayer (val), u138 (ref), u145 (ref), a1 (upval)
                            if not _minigunStartPlayer.IsPlaying and not u138 then
                                u145:Disconnect()
                                if a1._minigunSlowTriggered then
                                    return
                                end
                                a1._minigunSlowTriggered = true
                                a1:_playOneShot("MinigunSlow")
                            end
                        end)
                    end
                end
                if v2 and not u343 then
                    u343 = true
                    if a1._minigunSpinLoop and a1._minigunSpinLoop.IsPlaying then
                        a1._minigunSpinLoop:Stop()
                    end
                    v4 = a1
                    local _minigunFireLoop = a1._minigunFireLoop or a1:_getLoop("MinigunLoop")
                    v4._minigunFireLoop = _minigunFireLoop
                    if a1._minigunFireLoop then
                        a1._minigunFireLoop:Play()
                        if not a1._minigunFireLoopWatchConnected then
                            a1._minigunFireLoopWatchConnected = true
                            local u193 = nil
                            u193 = (a1._minigunFireLoop:GetPropertyChangedSignal("IsPlaying")):Connect(function() -- Line: 666 -- upvalues: a1 (upval), u193 (ref), u359 (upval)
                                if not a1._minigunFireLoop.IsPlaying then
                                    if u193.Connected then
                                        u193:Disconnect()
                                    end
                                    if u359 then
                                        if a1._minigunSlowTriggered then
                                            return
                                        end
                                        a1._minigunSlowTriggered = true
                                        a1:_playOneShot("MinigunSlow")
                                    end
                                end
                            end)
                            a1.Maid:Mark(function() -- Line: 676 -- upvalues: u193 (ref)
                                if u193.Connected then
                                    u193:Disconnect()
                                end
                            end)
                        end
                    end
                end
            end
            if u343 then
                local Value, v6
                v2 = if not (0 < u367 % 2) then 2 else 1
                u367 = u367 + 1
                if Attribute ~= "DualBarrel" then
                    Value = Configuration.Attachments.Start.Value
                    if Attribute ~= "Minigun" then
                        v6 = u375
                        v6.v = v6.v + 15
                    else
                        v6 = u375
                        v6.v = v6.v + 5
                    end
                    u375.s = 25
                else
                    Value = Configuration.Attachments[("Start%*"):format(v2)].Value
                    if v2 ~= 1 then
                        v6 = u383
                        v6.v = v6.v + 5
                        u383.s = 7.5
                    else
                        v6 = u375
                        v6.v = v6.v + 5
                        u375.s = 7.5
                    end
                end
                a1:Bullet({
                    Start = Value.WorldPosition,
                    End = v3,
                    Spread = 100,
                    Speed = 140,
                    Bullet = Attribute_2,
                    NoColor = Attribute_2 ~= nil,
                    Reversed = Attribute_3,
                })
                EmitterManager.manualEmit(Value)
            end
            a1:Wait((a1:GetCooldown()))
            return
        end
        u343 = false
        if Attribute == "Minigun" and u359 then
            u351.t = 0
            u359 = false
            if a1._minigunStartPlayer and a1._minigunStartPlayer.IsPlaying then
                a1._minigunStartPlayer:Stop()
            end
            if a1._minigunFireLoop and a1._minigunFireLoop.IsPlaying then
                a1._minigunFireLoop:Stop()
                if not a1._minigunSlowTriggered then
                    a1._minigunSlowTriggered = true
                    a1:_playOneShot("MinigunSlow")
                end
            end
            if a1._minigunSpinLoop and a1._minigunSpinLoop.IsPlaying then
                a1._minigunSpinLoop:Stop()
            end
        end
    end)
    local u387 = 0
    a1.Maid:Mark((RunService.PostSimulation:Connect(function(a1) -- Line: 749
        -- upvalues: GameState (upval), Weapon (val), u351 (val), u335 (ref), u383 (val), u387 (ref), u399 (val)
        -- upvalues: u375 (val)
        local v1 = a1 * GameState.TimeScale
        local Heli = Weapon.Heli
        local Configuration = Heli.Configuration
        local Attribute = Configuration:GetAttribute("Type")
        local Bones = Configuration.Bones
        local TopRotor = Bones:FindFirstChild("TopRotor") and Bones.TopRotor.Value
        local BottomRotor = Bones:FindFirstChild("BottomRotor") and Bones.BottomRotor.Value
        local TailRotor = Bones:FindFirstChild("TailRotor") and Bones.TailRotor.Value
        if TopRotor then
            TopRotor.Transform = TopRotor.Transform * CFrame.Angles(0, 17.453292519943297 * v1, 0)
        end
        if BottomRotor then
            BottomRotor.Transform = BottomRotor.Transform * CFrame.Angles(0, -17.453292519943297 * v1, 0)
        end
        if TailRotor then
            TailRotor.Transform = TailRotor.Transform * CFrame.Angles(0, 17.453292519943297 * v1 * 1.5, 0)
        end
        local p = u351.p
        if Attribute then
            local Value, v2
            local Value_2 = nil
            local p_2 = 0
            local Value_3 = nil
            local v3 = false
            local Model = u335 and u335.Model
            local PrimaryPart = Model and Model.PrimaryPart
            if Attribute ~= "DualBarrel" then
                Value = Bones.Barrel.Value
                Value_3 = Bones.Handle.Value
                v3 = true
            else
                Value = Bones.Barrel1.Value
                Value_2 = Bones.Barrel2.Value
                p_2 = u383.p
            end
            if Attribute == "Minigun" and p > 0 then
                v2 = math.rad(1080 * p * v1)
                u387 = (u387 + v2) % 6.283185307179586
            end
            if Value_3 and v3 and PrimaryPart then
                v2 = if not Value_3:GetAttribute("Inverse") then 1 else -1
                local v4 = v2 * math.asin((PrimaryPart.Position - Heli.PrimaryPart.Position).Unit.Y) + v2 * 0.2617993877991494
                v4 = if not v2 then math.clamp(v4, -1.5707963267948966, 0) else math.clamp(v4, 0, 1.5707963267948966)
                u399.t = v4
                Value_3.Transform = CFrame.Angles(u399.p, 0, 0)
            end
            local p_3 = u375.p
            if Value and Value:IsA("Bone") then
                Value.Transform = (CFrame.new(0, (if not Value:GetAttribute("Inverse") then 1 else -1) * 2 * p_3, 0)) * CFrame.Angles(0, u387, 0)
            end
            if Value_2 and Value_2:IsA("Bone") then
                Value_2.Transform = (CFrame.new(0, (if not Value_2:GetAttribute("Inverse") then 1 else -1) * 2 * p_2, 0)) * CFrame.Angles(0, v2 * u387, 0)
            end
        end
    end)))
end

return v1