-- Script path: ReplicatedStorage.Content.Tower.Harvester.Animator
-- Decompile time: 11.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local PathPlacementCursorController = require(ReplicatedStorage.Client.Controllers.Game.PathPlacementCursorController)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local SharedControllerFunctions = require(ReplicatedStorage.Client.Modules.SharedControllerFunctions)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local u73 = {
    Lunar = {HarvesterHit = "LunarHarvester", HarvesterMaxHit = "MaxLunarHarvester"},
    Wasteland = {HarvesterHit = "HarvesterHit", HarvesterMaxHit = "WastelandHarvesterMaxHit"},
}
local CurrentCamera = workspace.CurrentCamera
local VinesCrosshair = ReplicatedStorage.Assets.Effects.Client.VinesCrosshair
local u87 = Random.new()
local u88 = nil
local u89 = {}
local u90 = nil
local v1 = {}
v1.__index = v1

local function cleanCursor() -- Line: 43 -- upvalues: u88 (ref), u90 (ref), u89 (val)
    if u88 then
        u88:Destroy()
        u88 = nil
    end
    if u90 then
        u90:Disconnect()
        u90 = nil
    end
    for i, v in ipairs(u89) do
        v:Destroy()
    end
    table.clear(u89)
end

local function getPlacement() -- Line: 60 -- upvalues: TypedPromise (val), PathPlacementCursorController (val)
    return TypedPromise.new(function(a1, a2, a3) -- Line: 61 -- upvalues: PathPlacementCursorController (upval)
        local u3 = nil
        local u4 = nil
        PathPlacementCursorController:Start({uiEnabled = false})
        u3 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 74 -- upvalues: u3 (ref), u4 (ref), a2 (val)
            u3:Disconnect()
            u4:Disconnect()
            a2("Canceled Placement")
        end)
        local v1 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2) -- Line: 78 -- upvalues: u3 (ref), u4 (ref), a1 (val)
            u3:Disconnect()
            u4:Disconnect()
            a1(a1_2, a2)
        end)
        a3(function() -- Line: 65 -- upvalues: u3 (ref), u4 (ref)
            u3:Disconnect()
            u4:Disconnect()
        end)
    end)
end

function v1.Initialize(a1) -- Line: 87
    -- upvalues: StateManager (val), Maid (val), cleanCursor (val), u88 (ref), VinesCrosshair (val), CurrentCamera (val)
    -- upvalues: u90 (ref), RunService (val), PathPlacementCursorController (val), u89 (val), Create (val)
    -- upvalues: GameState (val), TypedPromise (val), u73 (val), EmitterManager (val), EffectsController (val)
    -- upvalues: TimescaleUtilities (val), SharedControllerFunctions (val)
    a1._stateManager = StateManager.new()
    a1._thorns = {}
    a1._thornsRemovedAt = {}
    a1._thornsMaid = Maid.new()
    a1._lastFired = nil
    a1._holsterTimeAcc = 0
    a1._lastRepositionServerTime = (-1 / 0)
    a1.Maid:Mark(a1._thornsMaid)

    local function clearAllThorns() -- Line: 97 -- upvalues: a1 (val)
        for k, v in pairs(a1._thorns) do
            for i, i2 in ipairs(v) do
                if i2.model and i2.model.Parent then
                    i2.model:Destroy()
                end
            end
        end
        table.clear(a1._thorns)
        a1._thornsMaid:Sweep()
    end

    a1.Maid:Mark(((a1.Replicator:GetStateChangedSignal("Position")):Connect(function() -- Line: 110 -- upvalues: a1 (val), clearAllThorns (val)
        a1._lastRepositionServerTime = workspace:GetServerTimeNow()
        clearAllThorns()
    end)))
    a1.AbilityCallbacks = {
        Thorns = function() -- Line: 116
            -- upvalues: cleanCursor (upval), u88 (upval), VinesCrosshair (upval), CurrentCamera (upval), u90 (upval)
            -- upvalues: RunService (upval), PathPlacementCursorController (upval), a1 (val), u89 (upval)
            -- upvalues: Create (upval), GameState (upval), TypedPromise (upval)
            cleanCursor()
            u88 = VinesCrosshair:Clone()
            u88.Parent = CurrentCamera
            local u8 = 0
            local u9 = nil
            local u10 = nil
            local u11 = nil
            local u12 = nil
            local u13 = nil
            u90 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 129
                -- upvalues: CurrentCamera (upval), PathPlacementCursorController (upval), a1 (upval), u13 (ref)
                -- upvalues: u89 (upval), Create (upval), u88 (upval), u12 (ref), u10 (ref), u11 (ref), u9 (ref)
                -- upvalues: u8 (ref), GameState (upval)
                local v1, v2, v3, v4, v5, v6
                local LookVector = CurrentCamera.CFrame.LookVector
                local CurrentPath = PathPlacementCursorController.CurrentPath
                if not CurrentPath then
                    return
                end
                local PathDistance = CurrentPath.PathDistance
                local ThornsRange = a1.Stats.Attributes.ThornsRange
                local DistanceToEnd = CurrentPath:GetDistanceToEnd(PathPlacementCursorController.CurrentPathToEnd)
                local CurrentPosition = PathPlacementCursorController.CurrentPosition
                local Unit = (CurrentPosition - (CurrentPath:GetScalar(DistanceToEnd - 10))).Unit
                u13 = (LookVector * Vector3.new(1, 0, 1)):Dot(Unit * Vector3.new(1, 0, 1))
                local v7 = math.clamp(DistanceToEnd - (if not (u13 > 0) then 1 else -1) * ThornsRange, 0, PathDistance)
                local Scalar_2 = CurrentPath:GetScalar(v7)
                local v8 = math.max((v2 > 0 and DistanceToEnd - v2 * v7 or v7 + v2 * DistanceToEnd) - 3, 0)
                local v9 = math.floor(v8 / 3)
                if v9 < #u89 then
                    local v10 = #u89
                    while v9 < v10 do
                        table.remove(u89, v10):Destroy()
                        v10 = v10 - 1
                    end
                end
                for i = 1, v9 do
                    v3 = false
                    v4 = u89[i]
                    if not v4 then
                        v4 = Create("Part", {
                            Anchored = true,
                            Size = Vector3.new(0.10000000149011612, 0.5, 0.5),
                            Transparency = 0,
                            CanCollide = false,
                            Shape = Enum.PartType.Cylinder,
                            Parent = u88,
                        })
                        table.insert(u89, v4)
                        v3 = true
                    end
                    v5 = (CFrame.new((CurrentPath:GetScalar(DistanceToEnd - v2 * i * v8 / v9)))) * CFrame.Angles(0, 0, 1.5707963267948966)
                    v6 = not v3 and v2 == u12 and v4.CFrame:Lerp(v5, v1 * 15) or v5
                    v4.CFrame = v6
                end
                u10 = u10 and u10:Lerp(CurrentPosition, v1 * 15) or CurrentPosition
                u11 = v2 == u12 and u11 and u11:Lerp(Scalar_2, v1 * 15) or Scalar_2
                local Unit_2 = (u11 - u10).Unit
                u9 = u9 and u9:Lerp(Unit_2, v1 * 15) or Unit_2
                local v11 = CFrame.new(u10)
                local v12 = CFrame.new(u11)
                u8 = u8 + v1
                v3 = u8 * 2 * GameState.TimeScale
                u88.Start:PivotTo(v11)
                u88.Start.OuterTarget.CFrame = v11 * CFrame.Angles(0, v3, 0)
                u88.End:PivotTo(v12 * (CFrame.Angles(0, v3, 0)))
                u12 = v2
            end)
            local v1, v2, v3 = TypedPromise.new(function(a1, a2, a3) -- Line: 61 -- upvalues: PathPlacementCursorController (upval)
                local u3 = nil
                local u4 = nil
                PathPlacementCursorController:Start({uiEnabled = false})
                u3 = PathPlacementCursorController.Canceled:Connect(function() -- Line: 74 -- upvalues: u3 (ref), u4 (ref), a2 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    a2("Canceled Placement")
                end)
                local v1 = PathPlacementCursorController.OnClicked:Connect(function(a1_2, a2) -- Line: 78 -- upvalues: u3 (ref), u4 (ref), a1 (val)
                    u3:Disconnect()
                    u4:Disconnect()
                    a1(a1_2, a2)
                end)
                a3(function() -- Line: 65 -- upvalues: u3 (ref), u4 (ref)
                    u3:Disconnect()
                    u4:Disconnect()
                end)
            end):await()
            cleanCursor()
            if not v1 then
                return false
            end
            return {pathName = v2, pointToEnd = v3, backwards = u13 > 0}
        end,
    }
    a1.Executables = {
        Hit = function(a1_2, a2) -- Line: 226
            -- upvalues: u73 (upval), a1 (val), EmitterManager (upval)
            if a2 < 5 then
                local HarvesterHit = u73[a1.Model.Name] and u73[a1.Model.Name].HarvesterHit or "HarvesterHit"
                EmitterManager.Emit(HarvesterHit, CFrame.new(a1_2))
                return
            end
            local HarvesterMaxHit = u73[a1.Model.Name] and u73[a1.Model.Name].HarvesterMaxHit or "HarvesterMaxHit"
            EmitterManager.Emit(HarvesterMaxHit, CFrame.new(a1_2))
        end,
        ThornsHit = function(a1) -- Line: 241 -- upvalues: EmitterManager (upval) -- types: a1: vector
            EmitterManager.Emit("SpikeHit", CFrame.new(a1))
        end,
        Projectile = function(a1_2) -- Line: 244 -- upvalues: a1 (val)
            if a1_2.Started and a1_2.Started < a1._lastRepositionServerTime then
                return
            end
            a1._stateManager:changeState("Fire", a1_2.End)
            a1:_projectile(a1_2)
        end,
        Summon = function(a1_2) -- Line: 252 -- upvalues: a1 (val) -- types: a1_2: vector
            a1._stateManager:changeState("Summon", a1_2)
        end,
        CreateThorns = function(a1_2, a2, a3, a4, a5) -- Line: 255
            -- upvalues: a1 (val), EffectsController (upval)
            local Attribute, Attribute_2, v1, v2, v3, v4, v5, v6
            if a5 and a1._thornsRemovedAt[a1_2] and a5 <= a1._thornsRemovedAt[a1_2] then
                return
            end
            if a1._thorns[a1_2] then
                for i, v in ipairs(a1._thorns[a1_2]) do
                    v.model:Destroy()
                end
                a1._thorns[a1_2] = nil
            end
            local v7 = table.create(#a3)
            local Level = a1:GetLevel()
            local v8 = nil
            local v9 = nil
            local v10, v11, v12, v13 = a1_2, a2, a4, a3
            for i2, j in a3, v8, v9 do
                v1 = {
                    radius = v11,
                    cframe = j,
                    growthTime = v12,
                    material = Enum.Material.Ground,
                }
                if not (Level >= 5) then
                    v1.baseColor = Color3.fromRGB(86, 66, 54)
                    v1.thornsColor = Color3.fromRGB(184, 165, 160)
                else
                    if a1.Model.Name ~= "Wasteland" then
                        v1.baseColor = Color3.fromRGB(89, 34, 89)
                        v1.thornsColor = Color3.fromRGB(223, 80, 230)
                        v1.brightness = 5
                    else
                        v2 = Color3.fromRGB(255, 136, 0)
                        v4 = Color3.fromRGB(0, 0, 0)
                        v5 = #v13
                        v2 = v2:Lerp(v4, i2 / v5)
                        v1.baseColor = v2
                        v1.thornsColor = v2
                        v1.material = Enum.Material.Neon
                        v1.brightness = (1 - i2 / #v13) * 5
                    end
                    if a1.Model:GetAttribute("ThornsColor") then
                        Attribute = a1.Model:GetAttribute("ThornsColor2")
                        Attribute_2 = a1.Model:GetAttribute("ThornsColor")
                        v6 = #v13
                        v3 = Attribute_2:Lerp(Attribute, i2 / v6)
                        v1.baseColor = v3
                        v1.thornsColor = v3
                    end
                end
                u143, v3 = EffectsController.CreateVines(v1)
                v7[i2] = {model = u143, reverse = v3}
                a1._thornsMaid:Mark(function() -- Line: 320 -- upvalues: u143 (val)
                    if u143 and u143.Parent then
                        u143:Destroy()
                    end
                end)
                a1:Wait(v12)
            end
            a1._thorns[v10] = v7
        end,
        RemoveThorns = function(a1_2, a2) -- Line: 331 -- upvalues: a1 (val), TimescaleUtilities (upval) -- types: a1_2: string, a2: number?
            if a2 then
                a1._thornsRemovedAt[a1_2] = (math.max(a1._thornsRemovedAt[a1_2] or (-1 / 0), a2))
            end
            local u14 = a1._thorns[a1_2]
            if not u14 then
                return
            end
            for i = #u14, 1, -1 do
                u14[i].reverse(0.5)
                TimescaleUtilities.Wait(0.375)
            end
            a1:Delay(0.5, function() -- Line: 348 -- upvalues: u14 (val), a1 (upval), a1_2 (val)
                for i, v in ipairs(u14) do
                    v.model:Destroy()
                end
                a1._thorns[a1_2] = nil
            end)
        end,
        DestroyThorns = function(a1_2, a2) -- Line: 355 -- upvalues: a1 (val) -- types: a1_2: string, a2: number?
            if a2 then
                a1._thornsRemovedAt[a1_2] = (math.max(a1._thornsRemovedAt[a1_2] or (-1 / 0), a2))
            end
            local v1 = a1._thorns[a1_2]
            if not v1 then
                return
            end
            for i, v in ipairs(v1) do
                v.model:Destroy()
            end
            a1._thorns[a1_2] = nil
        end,
    }
    a1._stateManager:addStates({
        {name = "Idle"},
        {
            name = "Fire",
            onEnter = function(a1_2) -- Line: 379 -- upvalues: a1 (val), TimescaleUtilities (upval) -- types: a1_2: vector
                local v1 = a1:_playAnimation("Fire")
                local v2 = TimescaleUtilities.DelayPromise(v1.Length)
                v2:andThen(function() -- Line: 382 -- upvalues: a1 (upval)
                    a1._stateManager:changeState("Holster")
                end)
                a1:_fire(a1_2)
                a1._lastFired = tick()
                a1.Model.Weapon.Bow.Arrow.Transparency = 1
                return {v2, v1}
            end,
            onLeave = function(a1_2, a2) -- Line: 393 -- upvalues: a1 (val)
                if a1_2 then
                    a1_2:cancel()
                end
                if a2 then
                    a2:Stop(0.1)
                end
                a1.Model.Weapon.Bow.Arrow.Transparency = 0
            end,
        },
        {
            name = "Holster",
            onEnter = function() -- Line: 405 -- upvalues: a1 (val)
                return {(a1:_playAnimation("Holster"))}
            end,
            onLeave = function(a1_2) -- Line: 409 -- upvalues: a1 (val) -- types: a1_2: userdata
                a1._holsterTimeAcc = 0
                if a1_2 then
                    a1_2:Stop(0.1)
                end
            end,
            onUpdate = function(a1_2) -- Line: 415 -- upvalues: a1 (val), GameState (upval) -- types: a1_2: number
                local v1 = a1
                v1._holsterTimeAcc = v1._holsterTimeAcc + a1_2 * GameState.TimeScale
                if 3 < a1._holsterTimeAcc then
                    a1._stateManager:changeState("Unholster")
                end
            end,
        },
        {
            name = "Unholster",
            onEnter = function() -- Line: 424 -- upvalues: a1 (val), TimescaleUtilities (upval)
                local v1 = a1:_playAnimation("Unholster")
                local v2 = TimescaleUtilities.DelayPromise(v1.Length)
                v2:andThen(function() -- Line: 427 -- upvalues: a1 (upval)
                    a1._stateManager:changeState("Idle")
                end)
                return {v2, v1}
            end,
            onLeave = function(a1, a2) -- Line: 433 -- types: a2: userdata
                if a1 then
                    a1:cancel()
                end
                if a2 then
                    a2:Stop(0.1)
                end
            end,
        },
        {
            name = "Summon",
            onEnter = function(a1_2) -- Line: 444 -- upvalues: a1 (val), TimescaleUtilities (upval) -- types: a1_2: vector
                local v1 = a1:_playAnimation("Summon")
                local v2 = TimescaleUtilities.DelayPromise(v1.Length)
                v2:andThen(function() -- Line: 447 -- upvalues: a1 (upval)
                    a1._stateManager:changeState("Idle")
                end)
                a1:Face(a1_2)
                return {v2, v1}
            end,
            onLeave = function(a1, a2) -- Line: 455 -- types: a2: userdata
                if a1 then
                    a1:cancel()
                end
                if a2 then
                    a2:Stop(0.1)
                end
            end,
        },
    })
    for k, v in pairs(a1.Animations) do
        for k2, i in pairs(v) do
            i:Load()
        end
    end
    SharedControllerFunctions.RegisterJoints(a1, {
        a1.Model.Torso:WaitForChild("Right Arm"),
        (a1.Model.Torso:WaitForChild("Left Arm")),
    })
    local u91 = tick()
    a1:Thread(function() -- Line: 478 -- upvalues: u91 (ref), a1 (val)
        a1._stateManager:update(tick() - u91)
        u91 = tick()
    end)
    a1._stateManager:changeState("Idle")
end

function v1:_playAnimation(a2) -- Line: 489 -- types: self: table, a2: string
    return self:Animate(a2, nil, {0.1})
end

function v1:_aimAt(a2, a3) -- Line: 493
    -- upvalues: SharedControllerFunctions (val)
    self:Face(a2)
    SharedControllerFunctions.AimArmsAt(self, a2)
    SharedControllerFunctions.AimHeadAt(self, a3 or a2)
end

function v1:_fire(a2) -- Line: 499
    -- upvalues: EmitterManager (val), u87 (val), EasySound (val)
    local Bow = self.Model.Weapon:FindFirstChild("Bow")
    local Handle = Bow and Bow:FindFirstChild("Handle")
    self:_aimAt(a2, a2 + Vector3.new(0, 1.5, 0))
    if Handle then
        local Start = Handle.Start
        EmitterManager.manualEmit(Start)
        local v1 = u87:NextNumber(0.9, 1.1)
        EasySound.Play({
            audioGroup = "Towers",
            destroyOnEnd = true,
            id = Handle.Fire.SoundId,
            parent = Start,
            volume = Handle.Fire.Volume or 1,
            playbackSpeed = v1,
        })
    end
end

function v1:_projectile(a2) -- Line: 520 -- upvalues: Projectile (val)
    local Bow = self.Model.Weapon:FindFirstChild("Bow")
    local Handle = Bow and Bow:FindFirstChild("Handle")
    if Handle then
        local Start = Handle.Start
        local v1 = self.Model.Weapon.Bow.Arrow:Clone()
        v1.Anchored = true
        v1.Transparency = 0
        a2.Decay = 1
        a2.Projectile = v1
        a2.Start = Start.WorldPosition
        Projectile:Pierce(a2, function(a1) end)
        v1:Destroy()
    end
end

return v1