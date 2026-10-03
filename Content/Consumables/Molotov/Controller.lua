-- Script path: ReplicatedStorage.Content.Consumables.Molotov.Controller
-- Decompile time: 3.21 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local NapalmEffect = ReplicatedStorage.Assets.Effects.Client.NapalmEffect
local u66 = RaycastParams.new()
u66.FilterType = Enum.RaycastFilterType.Include
u66.FilterDescendantsInstances = {workspace:WaitForChild("Map")}
return {
    CreateContext = function(a1) -- Line: 23 -- upvalues: Players (val)
        local Position = Vector3.new(0, 0, 0)
        local PlayerByUserId = Players:GetPlayerByUserId(a1.playerId)
        if PlayerByUserId and PlayerByUserId.Character then
            Position = PlayerByUserId.Character.PrimaryPart.Position
        end
        a1.lifeTime = math.max(0.5, (Position - a1.position).Magnitude / 100)
        a1.noise = Random.new():NextNumber()
    end,
    OnUse = function(a1) -- Line: 38
        -- upvalues: TypedPromise (val), Players (val), ReplicatedStorage (val), Projectile (val), u66 (val)
        -- upvalues: NapalmEffect (val), Create (val), TimescaleUtilities (val), RunService (val), GameState (val)
        -- upvalues: TeamOctrees (val), Enum_2 (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 39
            -- upvalues: a1 (val), Players (upval), ReplicatedStorage (upval), Projectile (upval), u66 (upval)
            -- upvalues: NapalmEffect (upval), Create (upval), TimescaleUtilities (upval), RunService (upval)
            -- upvalues: GameState (upval), TeamOctrees (upval), Enum_2 (upval)
            local Context = a1.Context
            local PlayerByUserId = Players:GetPlayerByUserId(Context.playerId)
            if not PlayerByUserId then
                a2("Invalid player")
                return
            end
            local u13 = 0
            local Handle = ReplicatedStorage.Assets.Effects.Client.Molotov:Clone().Handle
            Handle.Anchored = true
            local CFrame = PlayerByUserId.Character.RightHand.CFrame
            Handle:PivotTo(CFrame)
            local u50 = (Projectile:throwWithPhysics({
                asset = Handle,
                duration = Context.lifeTime,
                start = Handle.Position,
                target = Context.position,
                rotation = function(a1) -- Line: 62 -- upvalues: u13 (ref), Context (val) -- types: a1: vector
                    u13 = u13 + 0.1 * a1.Magnitude / 2
                    return CFrame.Angles(Context.noise + u13, Context.noise + u13, 0)
                end,
                include = {workspace:WaitForChild("Map")},
            })):andThen(function(a1) -- Line: 69
                -- upvalues: u66 (upval), NapalmEffect (upval), Create (upval), TimescaleUtilities (upval)
                -- upvalues: RunService (upval), GameState (upval), TeamOctrees (upval), Enum_2 (upval)
                local v1 = workspace
                local v2 = u66
                v1 = v1:Raycast(a1, Vector3.new(0, -50, 0), v2)
                local u12 = v1 and v1.Position or a1
                local u16 = NapalmEffect:Clone()
                u16.Anchored = true
                u16.Size = Vector3.new(0.15600000321865082, 6.5, 6.5)
                u16.CFrame = (CFrame.new(u12)) * CFrame.Angles(0, 0, 1.5707963267948966)
                u16.Parent = workspace.Terrain
                local v3 = Create("Sound", {SoundId = "rbxassetid://17437522590", Volume = 0.7})
                v3.Parent = u16
                v3:Play()
                local u37 = nil
                TimescaleUtilities.Delay(10, function() -- Line: 90 -- upvalues: u16 (val), u37 (ref)
                    u16:Destroy()
                    u37:Disconnect()
                end)
                local u44 = tick()
                local v4 = RunService.Heartbeat:Connect(function() -- Line: 98 -- upvalues: u44 (ref), GameState (upval), TeamOctrees (upval), Enum_2 (upval), u12 (ref)
                    local v1 = tick() - u44
                    if 0.2 / GameState.TimeScale <= v1 then
                        local Burn, v2
                        u44 = tick()
                        for k, v in pairs((TeamOctrees.getTargets(Enum_2.Team.Player, u12, 3.25))) do
                            if v.Type ~= "Towers" then
                                Burn = Enum_2.DebuffType.Burn
                                v2 = 6 / GameState.TimeScale
                                v:ApplyDebuff(Burn, v2, {DefenseMelt = 15, BurnDamage = 10, BurnTickRate = 0.5})
                            end
                        end
                    end
                end)
            end)
            u50:finally(function() -- Line: 123 -- upvalues: u50 (ref), Handle (ref), a1_2 (val)
                u50 = nil
                Handle:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 130 -- upvalues: u50 (ref)
                if u50 then
                    u50:cancel()
                end
            end)
        end)
    end,
}