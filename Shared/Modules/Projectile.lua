-- Script path: ReplicatedStorage.Shared.Modules.Projectile
-- Decompile time: 45.08 ms

local Container
local ServerStorage = game:GetService("ServerStorage")
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u42 = RunService:IsServer()
local ProjectilePool = if not u42 then require(ReplicatedStorage.Shared.Modules.ProjectilePool) else nil
local u49 = {}
if not u42 then
    Container = workspace
else
    Container = require(ServerStorage.Server.Modules.NPC).Container
    if not Container then
        Container = workspace
    end
end
local v1 = {}
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local Heartbeat = u42 and RunService.Heartbeat or RunService.RenderStepped
local u88 = Random.new()
local u89 = 0

local function isPointInsidePart(a1, a2) -- Line: 35 -- upvalues: math (val) -- types: a1: vector, a2: userdata
    local v1 = a2.CFrame:PointToObjectSpace(a1)
    local v2 = a2.Size * 0.5
    local v3 = false
    if (math.abs(v1.X)) <= v2.X then
        v3 = false
        if (math.abs(v1.Y)) <= v2.Y then
            v3 = (math.abs(v1.Z)) <= v2.Z
        end
    end
    return v3
end

local function emitProjectileHitParticles(a1) -- Line: 44
    -- upvalues: EmitterManager (val), math (val)
    local DamageEmitter = a1:FindFirstChild("DamageEmitter")
    if DamageEmitter and DamageEmitter:IsA("ParticleEmitter") then
        EmitterManager.emitParticle(DamageEmitter, math.random(5, 10), a1)
    end
    local HitEmitter = a1:FindFirstChild("HitEmitter")
    if HitEmitter and HitEmitter:IsA("ParticleEmitter") then
        EmitterManager.emitParticle(HitEmitter, 1, a1)
    end
end

local function playPierceHitSound(a1, a2) -- Line: 56
    -- upvalues: u89 (ref), u88 (val), TimescaleUtilities (val)
    if u89 >= 12 then
        debug.profilebegin("ProjectilePierceHitSoundCapped")
        debug.profileend()
        return
    end
    if not a1:IsA("Sound") then
        return
    end
    u89 = u89 + 1
    debug.profilebegin("ProjectilePierceHitSound")
    local v1 = a1:Clone()
    v1.PlaybackSpeed = u88:NextNumber(v1.PlaybackSpeed * 0.8, v1.PlaybackSpeed * 1.3)
    v1.Name = "HitClone"
    v1.Parent = a2
    v1:Play()
    TimescaleUtilities.CleanUp(v1, v1.TimeLength)
    debug.profileend()
end

local u102 = {}
local u103 = {}
local u104 = {}
local u105 = {heartbeat = 0, connect = 0, preSim = 0}
local u106 = {}

local function queueThrowBullet(a1, a2) -- Line: 90 -- upvalues: u106 (val) -- types: a1: userdata, a2: userdata
    u106[a1] = a2
end

local function clearThrowBullet(a1) -- Line: 94 -- upvalues: u106 (val) -- types: a1: userdata?
    if a1 then
        u106[a1] = nil
    end
end

local function flushThrowBullets() -- Line: 100 -- upvalues: u106 (val)
    debug.profilebegin("ProjectileFlushThrowBullets")
    local v1 = 0
    for i in u106 do
        v1 = v1 + 1
    end
    if v1 == 0 then
        debug.profileend()
        return
    end
    local u18 = table.create(v1)
    local u21 = table.create(v1)
    local v2 = 1
    for j, k in u106 do
        u18[v2] = j
        u21[v2] = k
        v2 = v2 + 1
    end
    table.clear(u106)
    debug.profilebegin("ProjectileThrowBulkMoveTo")
    local success, result = xpcall(function() -- Line: 125 -- upvalues: u18 (val), u21 (val)
        workspace:BulkMoveTo(u18, u21, Enum.BulkMoveMode.FireCFrameChanged)
    end, debug.traceback)
    debug.profileend()
    debug.profileend()
    if not success then
        error(result, 0)
    end
end

local function usesClientHitDetection(a1) -- Line: 136
    return a1.ClientHitDetection == true
end

local function writeClientHits(a1, a2) -- Line: 140
    local model, v1
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a2, v3, v4 do
        model = j.model
        if j.enemy and j.enemy.Replicator then
            model = j.enemy.Replicator.ReplicationFolder
        end
        v1 = {model, j.position, j.time}
        v2[i] = v1
    end
    local v5 = if not (#v2 > 0) then nil else v2
    v6.ClientHits = v5
end

local function readClientHitTime(a1) -- Line: 155
    return a1.Time or a1.time or a1[3] or 0
end

local function fireClientHits(a1, a2, a3, a4) -- Line: 159
    local Model, Position, Time, v1
    local v2 = 0
    local v3 = {}
    local v4, v5 = a1, a2
    while v5 <= #v4 do
        v1 = v4[v5]
        Time = v1.Time or v1.time or v1[3] or 0
        if v6 < Time then
            break
        end
        Model = v1.Model or v1.model or v1[1]
        Position = v1.Position or v1.position or v1[2]
        if Model then
            table.insert(v3, {Model, Position})
            if v7 then
                v7(Model, Position)
            end
        end
        v2 = v2 + 1
        v5 = v5 + 1
    end
    return v5, v2, v3
end

local function addCallback(a1, a2, a3, a4) -- Line: 185 -- upvalues: u105 (val) -- types: a2: string, a4: string?
    if not a3 or a1[a3] then
        return
    end
    a1[a3] = a4 or a2
    local v1 = u105
    v1[a2] = v1[a2] + 1
end

local function removeCallback(a1, a2, a3) -- Line: 203 -- upvalues: u105 (val) -- types: a2: string
    if not a3 or not a1[a3] then
        return
    end
    a1[a3] = nil
    local v1 = u105
    v1[a2] = v1[a2] - 1
end

local function runCallbackSet(a1, a2, a3) -- Line: 216 -- types: a2: string
    local result, success
    for i, j in a1 do
        debug.profilebegin((("%*_%*"):format(a2, j)))
        success, result = xpcall(i, debug.traceback, a3)
        debug.profileend()
        if not success then
            error(result, 0)
        end
    end
end

local u117 = {}
local u130 = nil
if u42 then
    u130 = require(ServerStorage.Server.Modules.NPC)
end

local function quadBezier(a1, a2, a3, a4) -- Line: 238
    return (1 - a1) ^ 2 * a2 + 2 * (1 - a1) * a1 * a3 + a1 ^ 2 * a4
end

local function getCurved(a1, a2, a3, a4) -- Line: 242 -- upvalues: u42 (val)
    local p = a3.Start.p
    local End = a3.End
    local v1 = (1 - a2) ^ 2 * p + 2 * (1 - a2) * a2 * a4 + a2 ^ 2 * End
    if u42 then
        return CFrame.new(v1)
    end
    return CFrame.new(a1, v1) - a1 + v1
end

local function getLinear(a1, a2, a3) -- Line: 251 -- upvalues: math (val)
    local v1 = math.lerp(CFrame.new(a3.Start.p).p, a3.End, a2)
    return CFrame.new(a1, v1) - a1 + v1
end

local function getPosition(a1, a2, a3) -- Line: 256 -- upvalues: math (val)
    if a2.Type ~= "Curve" then
        return math.lerp(a2.Start.p, a2.End, a1)
    end
    local p = a2.Start.p
    local End = a2.End
    return (1 - a1) ^ 2 * p + 2 * (1 - a1) * a1 * a3 + a1 ^ 2 * End
end

if not u42 then
    local DebugController = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
    local Gizmo = DebugController.Gizmo
    DebugController.createGizmo("Projectiles", function() -- Line: 269 -- upvalues: u49 (val), Gizmo (val)
        local CFrame, Size
        for i, j in u49 do
            CFrame = i.CFrame
            Size = i.Size
            Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(122, 245, 241))
            Gizmo.Box:Draw(CFrame, Size, false)
            Gizmo.PushProperty(Gizmo.Styles.Color, Color3.fromRGB(255, 53, 144))
            Gizmo.Ray:Draw(CFrame.Position, CFrame.Position + j)
        end
    end)
end

function v1.CalcDuration(a1, a2) -- Line: 283
    return (a2.Start.p - a2.End).Magnitude / a2.Speed
end

function MultiHitRayCast(a1) -- Line: 288 -- upvalues: Container (val), CollectionService (val)
    local v1, v2, v3
    local v4 = Ray.new(a1.Position, a1.Direction)
    local v5 = {}
    local v6 = 0
    local v7 = a1
    repeat
        v2 = Container:FindPartOnRayWithIgnoreList(v4, v7.Ignore)
        if not v2 then
            v1 = true
        elseif not CollectionService:HasTag(v2, "NPCHitbox") then
            table.insert(v7.Ignore, v2)
            v1 = false
        else
            table.insert(v7.Ignore, v2.Parent)
            table.insert(v5, v2.Parent)
            v1 = false
            v6 = v6 + 1
        end
        if v1 then
            break
        end
        v3 = v7.Hits + v6
    until (v7.MaxHits or 1) <= v3
    return nil, nil, nil, v5
end

local function laser(a1, a2) -- Line: 316 -- upvalues: TimescaleUtilities (val)
    local Part = Instance.new("Part")
    Part.Parent = workspace.Trash
    Part.BrickColor = BrickColor.new("Bright red")
    Part.Material = "Neon"
    Part.Transparency = 0.25
    Part.Anchored = true
    Part.CanCollide = false
    local magnitude = (a1 - a2).magnitude
    Part.Size = Vector3.new(0.1, 0.1, magnitude)
    Part.CFrame = (CFrame.new(a1, a2)) * CFrame.new(0, 0, -magnitude / 2)
    TimescaleUtilities.CleanUp(Part, 1)
end

if not u42 then
    local DebugController_2 = require(ReplicatedStorage.Client.Controllers.Shared.DebugController)
    local Gizmo_2 = DebugController_2.Gizmo
    DebugController_2.createGizmo("Projectiles", function() -- Line: 335 -- upvalues: u49 (val), Gizmo_2 (val)
        local CFrame, Size
        for i, j in u49 do
            CFrame = i.CFrame
            Size = i.Size
            Gizmo_2.PushProperty(Gizmo_2.Styles.Color, Color3.fromRGB(122, 245, 241))
            Gizmo_2.Box:Draw(CFrame, Size, false)
            Gizmo_2.PushProperty(Gizmo_2.Styles.Color, Color3.fromRGB(255, 53, 144))
            Gizmo_2.Ray:Draw(CFrame.Position, CFrame.Position + j)
        end
    end)
end

local function createHitscanModel(a1) -- Line: 349 -- upvalues: ServerStorage (val), u117 (val)
    local WorldModel = Instance.new("WorldModel")
    WorldModel.Name = ("%*'s world model"):format(a1.UserId)
    WorldModel.Parent = ServerStorage
    u117[a1] = WorldModel
    return WorldModel
end

function v1.MultiRaycast(a1) -- Line: 359
    -- upvalues: CollectionService (val), Container (val), u130 (ref)
    local v1, v2
    local v3 = 0
    local v4 = {}
    local v5 = {}
    local v6 = RaycastParams.new()
    v6.FilterDescendantsInstances = CollectionService:GetTagged("NPCHitbox")
    v6.FilterType = Enum.RaycastFilterType.Include
    local v7 = a1
    repeat
        v1 = Container:Raycast(v7.Origin, v7.Direction, v6)
        if v1 then
            v2 = u130.getNPCByModel(v1.Instance)
            if not v2 then
                table.insert(v5, v1.Position)
                v3 = v3 + 1
            elseif not v7.EnemyFilter or not v7.EnemyFilter(v2) then
                table.insert(v4, v2)
                table.insert(v5, v1.Position)
                v3 = v3 + 1
            end
        end
    until v1 == nil or v7.MaxHits <= v3
    return v4, v5
end

function v1.MultiHitRaycast(a1) -- Line: 395
    -- upvalues: math (val), CollectionService (val), isPointInsidePart (val), u130 (ref), Container (val)
    local Instance, v1, v2, v3
    local v4 = {}
    local v5 = {}
    local v6 = RaycastParams.new()
    local v7 = math.max(1, a1.MaxHits or 1)
    local Direction = a1.Direction
    local Magnitude = Direction.Magnitude
    if Magnitude <= 0 then
        return v4, v5
    end
    local Unit = Direction.Unit
    local Origin = a1.Origin
    local v8 = Magnitude
    local RaycastFilterType = a1.RaycastFilterType or Enum.RaycastFilterType.Include
    local v9 = {}
    local FilterList = a1.FilterList or CollectionService:GetTagged("NPCHitbox")
    local v10 = nil
    for i, j in FilterList, nil, v10 do
        if typeof(j) == "Instance" then
            table.insert(v9, j)
        end
    end
    v6.FilterType = RaycastFilterType
    if RaycastFilterType == Enum.RaycastFilterType.Include then
        local v11, v12
        v1 = a1
        for k = #v9, 1, -1 do
            v11 = v9[k]
            if v11:IsA("BasePart") and isPointInsidePart(Origin, v11) then
                table.remove(v9, k)
                v12 = u130.getNPCByModel(v11)
                if v12 then
                    if v1.EnemyFilter and v1.EnemyFilter(v12) then
                        continue
                    end
                    table.insert(v4, v12)
                    table.insert(v5, Origin)
                    if v7 <= #v4 then
                        return v4, v5
                    end
                end
            end
        end
    end
    while #v4 < v7 do
        if not (v8 > 0) then
            break
        end
        if RaycastFilterType == Enum.RaycastFilterType.Include and #v9 == 0 then
            break
        end
        v6.FilterDescendantsInstances = v9
        v2 = Container:Raycast(Origin, Unit * v8, v6)
        if not v2 then
            break
        end
        Instance = v2.Instance
        if RaycastFilterType == Enum.RaycastFilterType.Include then
            for n = #v9, 1, -1 do
                v3 = v9[n]
                if v3 == Instance or Instance:IsDescendantOf(v3) then
                    table.remove(v9, n)
                end
            end
        end
        v10 = u130.getNPCByModel(Instance)
        if v10 then
            if not v1.EnemyFilter or not v1.EnemyFilter(v10) then
                table.insert(v4, v10)
                table.insert(v5, v2.Position)
            end
        end
        v8 = v8 - ((v2.Position - Origin).Magnitude + 0.05)
        Origin = v2.Position + Unit * 0.05
    end
    return v4, v5
end

function v1.LagCompensatedRaycast(a1, a2) -- Line: 486
    -- upvalues: u117 (val), ServerStorage (val), u130 (ref), math (val), Enum (val)
    local CFrame_2, v1, v2, v3, v4, v5, v6, v7
    local v8 = u117[a2.player]
    if not v8 then
        local player = a2.player
        v8 = Instance.new("WorldModel")
        v8.Name = ("%*'s world model"):format(player.UserId)
        v8.Parent = ServerStorage
        u117[player] = v8
    end
    if a2.clientSync == nil then
        return
    end
    local Attribute = workspace:GetAttribute("Sync")
    if not Attribute then
        return nil, Vector3.new(), nil, {}
    end

    local function getClosestSync() -- Line: 506 -- upvalues: u130 (upval), a2 (val)
        local CurrentSync = 0
        local v1 = nil
        local v2 = nil
        for i, j in u130.PreviousPositions, v1, v2 do
            for k, n in j do
                if n.CurrentSync <= a2.clientSync and CurrentSync < n.CurrentSync then
                    CurrentSync = n.CurrentSync
                end
            end
            if CurrentSync ~= 0 then
                break
            end
        end
        return CurrentSync
    end

    local function getNextClosestSync(a1) -- Line: 523 -- upvalues: u130 (upval) -- types: a1: number
        local v1 = nil
        local v2 = nil
        for i, j in u130.PreviousPositions, v1, v2 do
            for k, n in j do
                if j[k - 1] and v3 == j[k - 1].CurrentSync then
                    return n.CurrentSync
                end
            end
        end
        return nil
    end

    local v9 = getClosestSync()
    local v10 = getNextClosestSync(v9) or Attribute
    local v11 = if v9 ~= v10 then math.clamp(math.ilerp(v9, v10, a2.clientSync), 0, 1) else 0
    local v12 = {}
    v8:ClearAllChildren()
    local v13 = nil
    local v14 = nil
    for i, j in u130.PreviousPositions, v13, v14 do
        v3 = u130.getNPCByModel(i)
        if v3 and v3:IsAlive() then
            v4 = false
            v6 = nil
            v7 = nil
            for k, n in j, v6, v7 do
                CFrame_2 = i.CFrame
                if n[k + 1] then
                    CFrame_2 = n[k + 1].CFrame
                end
                if n.CurrentSync == v9 then
                    v4 = true
                    local Part = Instance.new("Part")
                    Part:AddTag("NPCHitbox")
                    Part.Size = i.Size + Vector3.new(0, 0, 2)
                    Part.CFrame = (n.CFrame:Lerp(CFrame_2, v11)) * CFrame.new(0, (math.abs(n.Model.PrimaryPart.Node.Position.Y)) - Part.Size.Y / 2, 0)
                    Part.Anchored = true
                    Part.CanCollide = false
                    Part.Size = Part.Size + Vector3.new(0, 1, 0)
                    Part.Parent = v8
                    v12[Part] = i
                    task.delay(10, function() -- Line: 592 -- upvalues: Part (val)
                        Part:Destroy()
                    end)
                    break
                end
            end
            if not v4 then
                local Part_2 = Instance.new("Part")
                Part_2:AddTag("NPCHitbox")
                Part_2.Size = i.Size + Vector3.new(0, 0, 2)
                Part_2.CFrame = i.CFrame
                Part_2.Anchored = true
                Part_2.CanCollide = false
                Part_2.Size = Part_2.Size + Vector3.new(0, 1, 0)
                Part_2.Parent = v8
                v12[Part_2] = i
                task.delay(10, function() -- Line: 613 -- upvalues: Part_2 (val)
                    Part_2:Destroy()
                end)
            end
        end
    end
    local v15 = Ray.new(a2.position, a2.direction)
    v3 = 0
    v4 = {}
    repeat
        v5, v6, v7 = v8:FindPartOnRayWithIgnoreList(v15, a2.ignore)
        v14 = v5
        v1 = v6
        v2 = v7
        if not v14 then
            v13 = true
        elseif not v14:HasTag("NPCHitbox") then
            table.insert(a2.ignore, v14)
            v13 = false
        else
            table.insert(a2.ignore, v14)
            v13 = false
            v5 = u130.getNPCByModel(v12[v14])
            if v5 and v5:IsAlive() and v5.Team ~= a2.inheritance.Team then
                a2.inheritance:DealDamage(v5, v3, Enum.DamageType.Normal)
                table.insert(v4, v5.Replicator.ReplicationFolder)
                v3 = v3 + 1
            end
        end
    until v13 or v3 >= 3
    return v14, v1, v2, v4
end

function v1.PeirceRaycast(a1, a2) -- Line: 659
    -- upvalues: Container (val), CollectionService (val), u130 (ref), Enum (val)
    local v1, v2, v3
    local v4 = 0
    local v5 = RaycastParams.new()
    v5.FilterType = Enum.RaycastFilterType.Exclude
    v5.FilterDescendantsInstances = {}
    local v6 = {}
    local v7 = a2
    repeat
        v2 = Container:Raycast(v7.start, v7.direction, v5)
        if not v2 then
            v1 = true
        else
            v3 = CollectionService
            if not v3:HasTag(v2.Instance, "NPCHitbox") then
                v5:AddToFilter({v2.Instance})
                v1 = false
            else
                v5:AddToFilter({v2.Instance.Parent})
                v1 = false
                v3 = u130.getNPCByModel(v2.Instance)
                if v3.Team ~= v7.tower.Team then
                    v7.tower:DealDamage(v3, v4, Enum.DamageType.Normal)
                    table.insert(v6, v3.Replicator.ReplicationFolder)
                    v4 = v4 + 1
                end
            end
        end
    until v1 or v7.maxPerice <= v4
    return v6
end

function v1.Raycast(a1, a2, a3, a4, a5) -- Line: 701
    -- upvalues: CollectionService (val), isPointInsidePart (val), u130 (ref), Enum (val), Container (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = Ray.new(a3, a4)
    local v12 = 0
    local v13 = {}
    for i, j in CollectionService:GetTagged("NPCHitbox") do
        if j:IsA("BasePart") and isPointInsidePart(a3, j) then
            table.insert(a5, j.Parent)
            v5 = u130.getNPCByModel(j)
            if v5 and v5.Team ~= a2.Team then
                a2:DealDamage(v5, v12, Enum.DamageType.Normal)
                table.insert(v13, v5.Replicator.ReplicationFolder)
                v12 = v12 + 1
                if v12 >= 3 then
                    return j, a3, Vector3.new(0, 0, 0), v13
                end
            end
        end
    end
    repeat
        v2, v3, v4 = Container:FindPartOnRayWithIgnoreList(v11, v6)
        v8 = v2
        v9 = v3
        v10 = v4
        if not v8 then
            v7 = true
        elseif not CollectionService:HasTag(v8, "NPCHitbox") then
            table.insert(v6, v8)
            v7 = false
        else
            table.insert(v6, v8.Parent)
            v7 = false
            v2 = u130.getNPCByModel(v8)
            if v2.Team ~= v1.Team then
                v1:DealDamage(v2, v12, Enum.DamageType.Normal)
                table.insert(v13, v2.Replicator.ReplicationFolder)
                v12 = v12 + 1
            end
        end
    until v7 or v12 >= 3
    return v8, v9, v10, v13
end

local getLogicalThrowHits = nil

function v1.Throw(a1, a2, a3) -- Line: 764
    -- upvalues: u42 (val), ProjectilePool (val), getLogicalThrowHits (ref), writeClientHits (val)
    -- upvalues: TimescaleUtilities (val), u102 (val), u105 (val), u49 (val), u106 (val), GameState (val), math (val)
    -- upvalues: fireClientHits (val)
    local u3 = 0
    local Start = a2.Start
    local u5 = 0
    local u28 = nil
    local u19 = nil
    if not u42 then
        if not a2.Part:IsA("BasePart") then
            u28 = a2.Part:Clone()
            u28.Parent = workspace.CurrentCamera
        else
            u19 = ProjectilePool.get(a2.Part, a2.PoolSize)
            u28 = u19:take()
        end
        u28.CFrame = Start
    end
    local Position = Start.Position
    local Magnitude = (Start.p - a2.End).Magnitude
    local u42_2 = Magnitude / a2.Speed
    local u53 = (Start.p + a2.End) / 2 + Vector3.new(0, Magnitude / a2.Gravity, 0)
    local u55 = a2.MaxHits or 1
    local Ignore = a2.Ignore
    if not Ignore then
        Ignore = {}
    end
    local u61 = a2.ClientHitDetection == true
    if u42 then
        local v1 = getLogicalThrowHits(a2, u55, Ignore, u53)
        writeClientHits(a2, v1)
        for i, j in v1 do
            TimescaleUtilities.Delay(j.time, function() -- Line: 799 -- upvalues: j (val), a3 (val)
                if j.enemy:IsAlive() and a3 then
                    a3(j.model, j.position)
                end
            end)
        end
        return
    end
    local u100 = nil
    local ClientHits = a2.ClientHits
    if not ClientHits then
        ClientHits = {}
    end
    local u103 = 1

    local function finishProjectile() -- Line: 813
        -- upvalues: u102 (upval), u100 (ref), u105 (upval), u49 (upval), u28 (ref), u106 (upval), u19 (ref)
        local v1 = u102
        local v2 = u100
        if v2 and v1[v2] then
            v1[v2] = nil
            local v3 = u105
            v3.heartbeat = v3.heartbeat - 1
        end
        u49[u28] = nil
        v1 = u28
        if v1 then
            u106[v1] = nil
        end
        if u28.Name == "RailgunBullet" then
            u28.Transparency = 1
            task.wait(1)
        end
        if u19 then
            u19:release(u28)
            return
        end
        u28:Destroy()
    end

    function u100(a1) -- Line: 831
        -- upvalues: u5 (ref), u55 (val), finishProjectile (val), GameState (upval), u3 (ref), math (upval), u42_2 (val)
        -- upvalues: a2 (val), Position (ref), u53 (val), u42 (upval), ClientHits (val), u103 (ref)
        -- upvalues: fireClientHits (upval), a3 (val), u61 (val), Ignore (val), u49 (upval), u28 (ref), u106 (upval)
        local v1, v2, v3, v4, v5
        if u55 <= u5 then
            finishProjectile()
            return
        end
        local v6 = a1 * GameState.TimeScale
        local v7 = u3
        u3 = u3 + v6
        local v8 = math.clamp(v7 / u42_2, 0, 1)
        local v9 = math.clamp(u3 / u42_2, 0, 1)
        if a2.Type ~= "Curve" then
            v2 = Position
            v3 = a2
            v4 = math.lerp(CFrame.new(v3.Start.p).p, v3.End, v9)
            v1 = CFrame.new(v2, v4) - v2 + v4
        else
            v2 = Position
            v3 = a2
            v4 = u53
            local p = v3.Start.p
            local End = v3.End
            v5 = (1 - v9) ^ 2 * p + 2 * (1 - v9) * v9 * v4 + v9 ^ 2 * End
            v1 = if not u42 then CFrame.new(v2, v5) - v2 + v5 else CFrame.new(v5)
            if not v1 then
                v2 = Position
                v3 = a2
                v4 = math.lerp(CFrame.new(v3.Start.p).p, v3.End, v9)
                v1 = CFrame.new(v2, v4) - v2 + v4
            end
        end
        if not u42 then
            v1 = if a2.Type ~= "Curve" then v1 * CFrame.Angles(math.rad(-a2.Turn * u3), 0, 0) else v1 * CFrame.Angles(0, 0, math.rad(a2.Turn * u3))
        end
        v2 = v1.Position - Position
        v3 = #ClientHits
        if v3 > 0 then
            v4, v5 = fireClientHits(ClientHits, u103, u3, a3)
            u103 = v4
            u5 = u5 + v5
        elseif u61 then
            local End_3, p_3, v10, v11, v12, v13
            v4 = a2
            if v4.Type ~= "Curve" then
                v3 = math.lerp(v4.Start.p, v4.End, v8)
            else
                local p_2 = v4.Start.p
                local End_2 = v4.End
                v3 = (1 - v8) ^ 2 * p_2 + 2 * (1 - v8) * v8 * u53 + v8 ^ 2 * End_2
            end
            v2 = v1.Position - v3
            v4 = v8
            v5 = v3
            while v4 < v9 do
                if not (u5 < u55) then
                    break
                end
                v13 = math.min(v4 + 0.125, v9)
                v11 = a2
                if v11.Type ~= "Curve" then
                    v10 = math.lerp(v11.Start.p, v11.End, v13)
                else
                    p_3 = v11.Start.p
                    End_3 = v11.End
                    v10 = (1 - v13) ^ 2 * p_3 + 2 * (1 - v13) * v13 * u53 + v13 ^ 2 * End_3
                end
                v11 = v10 - v5
                if not (v11.Magnitude <= 0) then
                    _, _, _, v12 = MultiHitRayCast({
                        Position = v5,
                        Direction = v11,
                        Ignore = Ignore,
                        Hits = u5,
                        MaxHits = u55,
                    })
                    for k, v in pairs(v12) do
                        if a3 then
                            a3(v)
                        end
                        u5 = u5 + 1
                    end
                end
                v4 = v13
            end
        end
        if not u42 then
            u49[u28] = v2
            Position = v1.Position
            v3 = u28
            u106[v3] = v1
        end
        if v9 >= 1 or u55 <= u5 then
            finishProjectile()
        end
    end

    local v2 = u102
    local v3 = u100
    if v3 and not v2[v3] then
        v2[v3] = "Throw"
        local v4 = u105
        v4.heartbeat = v4.heartbeat + 1
    end
    return u28
end

local u255 = {}
local u256 = nil

local function flushPierceBullets() -- Line: 923 -- upvalues: u255 (val), u256 (ref)
    debug.profilebegin("ProjectileFlushPierceBullets")
    local v1 = 0
    for i in u255 do
        v1 = v1 + 1
        break
    end
    if v1 == 0 then
        if u256 then
            u256:Disconnect()
            u256 = nil
        end
        debug.profileend()
        return
    end
    local u20 = {}
    local u21 = {}
    local v2 = 0
    for j, k in u255 do
        v2 = v2 + 1
        u20[v2] = j
        u21[v2] = k
    end
    table.clear(u255)
    debug.profilebegin("ProjectilePierceBulkMoveTo")
    local success, result = xpcall(function() -- Line: 951 -- upvalues: u20 (val), u21 (val)
        workspace:BulkMoveTo(u20, u21, Enum.BulkMoveMode.FireCFrameChanged)
    end, debug.traceback)
    debug.profileend()
    debug.profileend()
    if not success then
        error(result, 0)
    end
end

local function setPierceBulletCFrame(a1, a2) -- Line: 962
    -- upvalues: u255 (val), u256 (ref), RunService (val), flushPierceBullets (val)
    u255[a1] = a2
    if not u256 then
        u256 = RunService.PreRender:Connect(flushPierceBullets)
    end
end

local function isIgnoredByList(a1, a2) -- Line: 973 -- types: a1: userdata, a2: table?
    if not a2 then
        return false
    end
    for i, j in a2 do
        if j then
            if a1 ~= j and not a1:IsDescendantOf(j) then
                continue
            end
            return true
        end
    end
    return false
end

local function getNPCPathVelocity(a1) -- Line: 987
    local Speed_2 = 0
    if typeof(a1.Speed) == "number" then
        Speed_2 = a1.Speed
    elseif a1.GetWalkSpeed then
        Speed_2 = a1:GetWalkSpeed()
    end
    if a1.Stopped then
        Speed_2 = 0
    end
    local v1 = if not a1.Reverse then Speed_2 else -Speed_2
    if typeof(a1.ForceSpeed) == "number" then
        v1 = v1 + a1.ForceSpeed
    end
    return v1
end

local function getNPCCenterAtTime(a1, a2) -- Line: 1007 -- types: a2: number
    local v1 = a1.Height or Vector3.new(0, 0, 0)
    if a1.Path and not a1.ForcePosition and typeof(a1.PathDistance) == "number" then
        local Speed_2 = 0
        if typeof(a1.Speed) == "number" then
            Speed_2 = a1.Speed
        elseif a1.GetWalkSpeed then
            Speed_2 = a1:GetWalkSpeed()
        end
        if a1.Stopped then
            Speed_2 = 0
        end
        local v2 = if not a1.Reverse then Speed_2 else -Speed_2
        if typeof(a1.ForceSpeed) == "number" then
            v2 = v2 + a1.ForceSpeed
        end
        if v2 ~= 0 then
            return a1.Path:GetScalar(a1.PathDistance + v2 * a2) + v1
        end
    end
    if a1.Position then
        return a1.Position + v1
    end
    if a1.Part then
        return a1.Part.Position
    end
    return (Vector3.new(0, 0, 0))
end

local function getNPCHitRadius(a1, a2) -- Line: 1028 -- upvalues: math (val) -- types: a2: number
    local _hitboxSize = a1._hitboxSize or a1.Part and a1.Part.Size or Vector3.new(0, 0, 0)
    local Size = a1.Part and a1.Part.Size or Vector3.new(0, 0, 0)
    return math.max(_hitboxSize.X, _hitboxSize.Z, Size.X, Size.Z) * 0.5 + a2
end

local function sortAndLimitLogicalHits(a1, a2) -- Line: 1036 -- upvalues: math (val) -- types: a2: number
    table.sort(a1, function(a1, a2) -- Line: 1037
        if a1.time == a2.time then
            return a1.missDistance < a2.missDistance
        end
        return a1.time < a2.time
    end)
    local v1 = {}
    for i = 1, (math.min(a2, #a1)) do
        v1[i] = a1[i]
    end
    return v1
end

local function getLogicalPierceHits(a1, a2, a3, a4) -- Line: 1053
    -- upvalues: CollectionService (val), isIgnoredByList (val), u130 (ref), getNPCCenterAtTime (val), math (val)
    -- upvalues: sortAndLimitLogicalHits (val)
    debug.profilebegin("ProjectileLogicalPierceHits")
    local Start = a1.Start
    local v1 = a1.End - Start
    local Magnitude = v1.Magnitude
    local Speed = a1.Speed
    if not (Magnitude <= 0) and Speed and not (Speed <= 0) then
        local Magnitude_2, Size, _hitboxSize, v2, v3, v4, v5, v6
        local v7 = v1 / Magnitude
        local v8 = Magnitude / Speed
        local v9 = (a1.Size or 0) * 0.5
        local v10 = a4 or 0
        local v11 = {}
        local v12, v13 = a2, a3
        for i, j in CollectionService:GetTagged("NPCHitbox") do
            if j.Parent and not isIgnoredByList(j, v13) then
                v2 = u130.getNPCByModel(j)
                if v2 and v2:IsAlive() then
                    v3 = getNPCCenterAtTime(v2, v10)
                    for k = 1, 4 do
                        v3 = getNPCCenterAtTime(v2, v10 + (math.clamp((v3 - Start):Dot(v7) / Magnitude, 0, 1)) * v8)
                    end
                    v5 = Start + v7 * Magnitude * 0
                    _hitboxSize = v2._hitboxSize or v2.Part and v2.Part.Size or Vector3.new(0, 0, 0)
                    Size = v2.Part and v2.Part.Size or Vector3.new(0, 0, 0)
                    v6 = (math.max(_hitboxSize.X, _hitboxSize.Z, Size.X, Size.Z)) * 0.5 + v9
                    Magnitude_2 = (v3 - v5).Magnitude
                    if Magnitude_2 <= v6 then
                        table.insert(v11, {
                            enemy = v2,
                            model = j.Parent,
                            position = v5,
                            time = v4 * v8,
                            missDistance = Magnitude_2,
                        })
                    end
                end
            end
        end
        local v14 = sortAndLimitLogicalHits(v11, v12)
        debug.profileend()
        return v14
    end
    debug.profileend()
    return {}
end

function v1.PreparePierceClientHits(a1, a2, a3) -- Line: 1115
    -- upvalues: u42 (val), getLogicalPierceHits (val), writeClientHits (val)
    if not u42 then
        return {}
    end
    local v1 = a2.MaxHits or 1
    local Ignore = a2.Ignore or {}
    a2.Ignore = Ignore
    local v2 = getLogicalPierceHits(a2, v1, Ignore, a3)
    writeClientHits(a2, v2)
    return v2
end

function getLogicalThrowHits(a1, a2, a3, a4) -- Line: 1130
    -- upvalues: math (val), CollectionService (val), isIgnoredByList (val), u130 (ref), getNPCCenterAtTime (val)
    -- upvalues: sortAndLimitLogicalHits (val)
    debug.profilebegin("ProjectileLogicalThrowHits")
    local Magnitude = (a1.Start.p - a1.End).Magnitude
    local Speed = a1.Speed
    if not (Magnitude <= 0) and Speed and not (Speed <= 0) then
        local End, End_2, Magnitude_2, Magnitude_3, Size, _hitboxSize, huge, p, p_2, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
        local v14 = Magnitude / Speed
        local v15 = math.ceil(8)
        local v16 = math.clamp(math.ceil(v14 * 30), v15, 48)
        local v17 = (a1.Size or 0) * 0.5
        local v18 = {}
        local v19, v20, v21, v22 = a2, a3, a1, a4
        for i, j in CollectionService:GetTagged("NPCHitbox") do
            if j.Parent and not isIgnoredByList(j, v20) then
                v1 = u130.getNPCByModel(j)
                if v1 and v1:IsAlive() then
                    huge = math.huge
                    v2 = nil
                    v3 = 0
                    v4 = v16 - 1
                    for k = 0, v4 do
                        v5 = k / v16
                        v6 = (k + 1) / v16
                        if v21.Type ~= "Curve" then
                            v7 = math.lerp(v21.Start.p, v21.End, v5)
                        else
                            p = v21.Start.p
                            End = v21.End
                            v7 = (1 - v5) ^ 2 * p + 2 * (1 - v5) * v5 * v22 + v5 ^ 2 * End
                        end
                        if v21.Type ~= "Curve" then
                            v8 = math.lerp(v21.Start.p, v21.End, v6)
                        else
                            p_2 = v21.Start.p
                            End_2 = v21.End
                            v8 = (1 - v6) ^ 2 * p_2 + 2 * (1 - v6) * v6 * v22 + v6 ^ 2 * End_2
                        end
                        v9 = v8 - v7
                        Magnitude_2 = v9.Magnitude
                        if not (Magnitude_2 <= 0) then
                            v10 = v9 / Magnitude_2
                            v11 = 0.5
                            v12 = getNPCCenterAtTime(v1, math.lerp(v5, v6, v11) * v14)
                            for n = 1, 4 do
                                v12 = getNPCCenterAtTime(v1, math.lerp(v5, v6, (math.clamp((v12 - v7):Dot(v10) / Magnitude_2, 0, 1))) * v14)
                            end
                            v13 = v7 + v9 * v11
                            Magnitude_3 = (v12 - v13).Magnitude
                            if Magnitude_3 < huge then
                                huge = Magnitude_3
                                v2 = v13
                                v3 = math.lerp(v5, v6, v11) * v14
                            end
                        end
                    end
                    _hitboxSize = v1._hitboxSize or v1.Part and v1.Part.Size or Vector3.new(0, 0, 0)
                    Size = v1.Part and v1.Part.Size or Vector3.new(0, 0, 0)
                    v4 = (math.max(_hitboxSize.X, _hitboxSize.Z, Size.X, Size.Z)) * 0.5 + v17
                    if v2 and huge <= v4 then
                        table.insert(v18, {
                            enemy = v1,
                            model = j.Parent,
                            position = v2,
                            time = v3,
                            missDistance = huge,
                        })
                    end
                end
            end
        end
        local v23 = sortAndLimitLogicalHits(v18, v19)
        debug.profileend()
        return v23
    end
    debug.profileend()
    return {}
end

function v1.Pierce(a1, a2, a3) -- Line: 1221
    -- upvalues: u42 (val), TimescaleUtilities (val), u49 (val), u255 (val), ProjectilePool (val), GameState (val)
    -- upvalues: math (val), u103 (val), u105 (val), fireClientHits (val), u256 (ref), RunService (val)
    -- upvalues: flushPierceBullets (val), playPierceHitSound (val), emitProjectileHitParticles (val)
    local magnitude = (a2.Start - a2.End).magnitude
    local Speed = a2.Speed
    if not (magnitude <= 0) and Speed and not (Speed <= 0) then
        local u151
        local u180 = a2.MaxHits or 1
        local Ignore = a2.Ignore
        if not Ignore then
            Ignore = {}
        end
        a2.Ignore = Ignore
        if u42 then
            for i, j in a1:PreparePierceClientHits(a2) do
                TimescaleUtilities.Delay(j.time, function() -- Line: 1238 -- upvalues: j (val), a3 (val)
                    if j.enemy:IsAlive() and a3 then
                        a3(j.model, j.position)
                    end
                end)
            end
            return
        end
        local u165 = magnitude / Speed
        local u158 = 0
        local u172 = 0
        local u227 = a2.ClientHitDetection == true
        local ClientHits = a2.ClientHits
        if not ClientHits then
            ClientHits = {}
        end
        local u220 = 1
        local u142 = nil
        local u202 = nil
        local u197 = false
        local u143 = {}

        local function hideBullet() -- Line: 1259
            -- upvalues: u142 (ref), u49 (upval), u255 (upval), u202 (ref), u143 (val)
            if not u142 then
                return
            end
            u49[u142] = nil
            u255[u142] = nil
            if u202 then
                u202:hide(u142)
                return
            end
            u142.Transparency = 1
            for k, v in pairs(u143) do
                v.Enabled = false
            end
            for k2, i in pairs(u142:GetDescendants()) do
                if i:IsA("BasePart") then
                    i.Transparency = 1
                end
            end
        end

        local function releaseBullet() -- Line: 1283
            -- upvalues: u142 (ref), u197 (ref), u49 (upval), u255 (upval), u202 (ref)
            if u142 and not u197 then
                u197 = true
                u49[u142] = nil
                u255[u142] = nil
                if u202 then
                    u202:release(u142)
                    return
                end
                u142:Destroy()
                return
            end
        end

        if a2.Projectile then
            if not a2.Projectile:IsA("BasePart") then
                u142 = a2.Projectile:Clone()
                u142.Parent = workspace.CurrentCamera
                for k, v in pairs(u142:GetDescendants()) do
                    if v:IsA("Trail") or v:IsA("ParticleEmitter") or v:IsA("Beam") then
                        v.Enabled = true
                        table.insert(u143, v)
                    elseif v:IsA("Weld") or v:IsA("WeldConstraint") then
                        v:Destroy()
                    end
                end
                u142.Anchored = true
            else
                u202 = ProjectilePool.get(a2.Projectile, a2.PoolSize)
                u142 = u202:take()
                u202:enableEffects(u142)
            end
            u142.CFrame = CFrame.new(a2.Start, a2.End)
        end

        function u151(a1) -- Line: 1326
            -- upvalues: u158 (ref), GameState (upval), math (upval), u165 (val), u172 (ref), u180 (val), u142 (ref)
            -- upvalues: a2 (val), hideBullet (val), TimescaleUtilities (upval), releaseBullet (val), u197 (ref)
            -- upvalues: u49 (upval), u255 (upval), u202 (ref), u103 (upval), u151 (ref), u105 (upval), magnitude (val)
            -- upvalues: ClientHits (val), u220 (ref), fireClientHits (upval), u227 (val), Ignore (val), u256 (upval)
            -- upvalues: RunService (upval), flushPierceBullets (upval), playPierceHitSound (upval)
            -- upvalues: emitProjectileHitParticles (upval), a3 (val)
            local v1
            u158 = u158 + a1 * GameState.TimeScale
            local v2 = math.clamp(u158 / u165, 0, 1)
            if not (v2 >= 1) then
                v1 = u172
                if not (u180 <= v1) then
                    local v3
                    v1 = (CFrame.new(a2.Start, a2.End)) * CFrame.new(0, 0, -magnitude * v2)
                    local lookVector = v1.lookVector
                    local u32 = {}
                    local v4 = 0
                    local v5 = #ClientHits
                    if v5 > 0 then
                        local v6, v7
                        v5, v6, v7 = fireClientHits(ClientHits, u220, u158, nil)
                        u220 = v5
                        v4 = v6
                        u32 = v7
                    elseif u227 then
                        _, _, _, v3 = MultiHitRayCast({
                            Position = v1.p,
                            Direction = lookVector * a2.Size,
                            Ignore = Ignore,
                            Hits = u172,
                            MaxHits = u180,
                        })
                        for i, j in v3 do
                            table.insert(u32, {j})
                        end
                        v4 = #u32
                    end
                    u172 = u172 + v4
                    if u142 then
                        v5 = u142
                        u255[v5] = v1
                        if not u256 then
                            v3 = flushPierceBullets
                            u256 = RunService.PreRender:Connect(v3)
                        end
                    end
                    if u142 then
                        u49[u142] = lookVector * a2.Size
                    end
                    if #u32 > 0 then
                        debug.profilebegin("ProjectilePierceHitEffects")
                        if u142 then
                            local HitSound = u142:FindFirstChild("HitSound")
                            if HitSound then
                                playPierceHitSound(HitSound, u142)
                            end
                            local Indicator = u142:FindFirstChild("Indicator")
                            if Indicator then
                                debug.profilebegin("ProjectilePierceHitParticles")
                                emitProjectileHitParticles(Indicator)
                                debug.profileend()
                            end
                        end
                        debug.profilebegin("ProjectilePierceHitFunctions")
                        local success, result = xpcall(function() -- Line: 1392 -- upvalues: u32 (ref), a3 (upval)
                            for k, v in pairs(u32) do
                                if a3 then
                                    a3(v[1], v[2])
                                end
                            end
                        end, debug.traceback)
                        debug.profileend()
                        debug.profileend()
                        if not success then
                            error(result, 0)
                        end
                    end
                    return
                end
            end
            if u142 then
                if a2.Decay then
                    hideBullet()
                    TimescaleUtilities.Delay(a2.Decay, releaseBullet)
                elseif u142 and not u197 then
                    u197 = true
                    u49[u142] = nil
                    u255[u142] = nil
                    if not u202 then
                        u142:Destroy()
                    else
                        u202:release(u142)
                    end
                end
            end
            v1 = u103
            local v8 = u151
            if not v8 or not v1[v8] then
                return
            end
            v1[v8] = nil
            local v9 = u105
            v9.connect = v9.connect - 1
        end

        local v1 = u103
        local v2 = u151
        if v2 and not v1[v2] then
            v1[v2] = "Pierce"
            local v3 = u105
            v3.connect = v3.connect + 1
        end
        return
    end
end

function v1.throwWithPhysics(a1, a2) -- Line: 1426
    -- upvalues: TypedPromise (val), GameState (val), math (val), u49 (val), u104 (val), u105 (val)
    return TypedPromise.new(function(a1, a2_2) -- Line: 1427
        -- upvalues: a2 (val), GameState (upval), math (upval), u49 (upval), u104 (upval), u105 (upval)
        local u66, v1, velocity
        local asset = a2.asset
        assert(asset and asset:IsA("BasePart"), "asset must be a BasePart")
        local bounce = a2.bounce
        local rotation = a2.rotation
        local gravity = a2.gravity
        if not gravity then
            gravity = Vector3.new(0, -workspace.Gravity, 0)
        end
        local start = a2.start
        local u28 = 0
        if not a2.velocity then
            local duration = a2.duration
            velocity = (a2.target - start - 0.5 * gravity * duration * duration) / duration
        else
            velocity = a2.velocity
        end
        local u46 = nil
        local u48 = RaycastParams.new()
        u48.FilterType = Enum.RaycastFilterType.Include
        local include = a2.include or {}
        u48.FilterDescendantsInstances = include
        u48.RespectCanCollide = true
        u48.IgnoreWater = true
        asset.Anchored = true
        asset.CanCollide = false
        asset.Position = a2.start

        function u66(a1_2) -- Line: 1464
            -- upvalues: GameState (upval), u28 (ref), gravity (val), velocity (ref), start (ref), asset (val)
            -- upvalues: math (upval), u48 (val), u49 (upval), rotation (val), a2 (upval), bounce (val), u46 (ref)
            -- upvalues: u104 (upval), u66 (ref), u105 (upval), a1 (val)
            local v1, v2, v3
            local v4 = a1_2 * GameState.TimeScale
            u28 = u28 + v4
            local v5 = 0.5 * gravity * u28 * u28 + velocity * u28 + start
            local v6 = v5 - asset.Position
            v6 = v6.Unit * math.max(v6.Magnitude, (asset.Size * v6.Unit).Magnitude / 2)
            local v7 = workspace:Shapecast(asset, v6, u48)
            u49[asset] = v6
            local v8 = false
            if not v7 then
                v2 = CFrame.new(v5)
                asset.CFrame = v2 * (rotation and rotation(v6) or CFrame.identity)
            else
                v8 = true
                v2 = CFrame.new(v7.Position + v7.Normal * asset.Size * 0.57)
                asset.CFrame = v2 * (rotation and rotation(velocity) or CFrame.identity)
                velocity = (v6 - 2 * v6:Dot(v7.Normal) * v7.Normal).Unit * velocity.Magnitude * 0.3
                start = asset.Position
                u28 = 0
                if a2.onHit then
                    a2.onHit(v7.Instance)
                end
                if bounce then
                    bounce(velocity)
                end
            end
            if not (v5.Y < workspace.FallenPartsDestroyHeight) and not (velocity.Magnitude < 0.1) then
                if v8 and a2.finishOnHit then
                    u46:Disconnect()
                    v1 = u104
                    v2 = u66
                    if v2 and v1[v2] then
                        v1[v2] = nil
                        v3 = u105
                        v3.preSim = v3.preSim - 1
                    end
                    u49[asset] = nil
                    a1(v5)
                    return true
                end
                return false
            end
            u46:Disconnect()
            v1 = u104
            v2 = u66
            if v2 and v1[v2] then
                v1[v2] = nil
                v3 = u105
                v3.preSim = v3.preSim - 1
            end
            u49[asset] = nil
            a1(v5)
            return true
        end

        local v2 = u104
        local v3 = u66
        if v3 and not v2[v3] then
            v2[v3] = "Physics"
            v1 = u105
            v1.preSim = v1.preSim + 1
        end
        v2 = asset.Destroying:Once(function() -- Line: 1516 -- upvalues: u104 (upval), u66 (ref), u105 (upval), a2_2 (val)
            local v1 = u104
            local v2 = u66
            if v2 and v1[v2] then
                v1[v2] = nil
                local v3 = u105
                v3.preSim = v3.preSim - 1
            end
            a2_2()
        end)
        if a2.delta and a2.delta < u28 then
            v1 = u28
            local delta = a2.delta
            for i = v1, delta, 0.016666666666666666 do
                if u66(a2.delta) then
                    break
                end
            end
        end
    end)
end

Scheduler.add("Projectile_PreSim", RunService.PreSimulation, function(a1) -- Line: 1535 -- upvalues: u105 (val), runCallbackSet (val), u104 (val)
    if u105.preSim <= 0 then
        return
    end
    debug.profilebegin("ProjectilePreSimCallbacks")
    local success, result = xpcall(runCallbackSet, debug.traceback, u104, "ProjectilePreSimCallback", a1)
    debug.profileend()
    if not success then
        error(result, 0)
    end
end)
Scheduler.add("Projectile_Heartbeat", RunService.Heartbeat, function(a1) -- Line: 1550 -- upvalues: u105 (val), runCallbackSet (val), u102 (val), flushThrowBullets (val)
    if u105.heartbeat <= 0 then
        return
    end
    debug.profilebegin("ProjectileHeartbeatCallbacks")
    local success, result = xpcall(runCallbackSet, debug.traceback, u102, "ProjectileHeartbeatCallback", a1)
    debug.profileend()
    if not success then
        error(result, 0)
    end
    flushThrowBullets()
end)
Scheduler.add("Projectile_Conn", Heartbeat, function(a1) -- Line: 1572 -- upvalues: u105 (val), u89 (ref), runCallbackSet (val), u103 (val)
    if u105.connect <= 0 then
        return
    end
    u89 = 0
    debug.profilebegin("ProjectileConnectCallbacks")
    local success, result = xpcall(runCallbackSet, debug.traceback, u103, "ProjectileConnectCallback", a1)
    debug.profileend()
    if not success then
        error(result, 0)
    end
end)
return v1