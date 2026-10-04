-- Script path: ReplicatedStorage.Content.NewEnemies.Void Caster.Animator.VoidCasterEffects
-- Decompile time: 7.85 ms

local Debris = game:GetService("Debris")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ServerTicks = require(ReplicatedStorage.Shared.Modules.ServerTicks)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local VoidCaster = ReplicatedStorage.Assets.Effects.Mob.VoidCaster
local VoidReaver = ReplicatedStorage.Assets.Effects.Mob.VoidReaver
local u57 = CFrame.new(0, 0.1, 0)
local u59 = Random.new()

local function randomInRange(a1) -- Line: 19 -- upvalues: u59 (val) -- types: a1: userdata
    return u59:NextNumber(a1.Min, a1.Max)
end

return {
    summonPortal = function(a1, a2, a3) -- Line: 25
        -- upvalues: VoidReaver (val), u57 (val), spr (val), RunService (val), TimescaleUtilities (val)
        -- upvalues: EmitterManager (val)
        local u7 = VoidReaver.Portal:Clone()
        u7:PivotTo(a2 * u57)
        u7:ScaleTo(0.01)
        local u17 = {progress = 0.01}
        spr.target(u17, 0.5, 0.8, {progress = 1})
        u7.Parent = workspace.Trash
        local u34 = RunService.Heartbeat:Connect(function() -- Line: 41 -- upvalues: u7 (val), u17 (val)
            u7:ScaleTo(u17.progress)
        end)
        a1.Maid:Mark(u34)
        TimescaleUtilities.Delay(4, function() -- Line: 47 -- upvalues: u34 (ref)
            u34:Disconnect()
        end)
        TimescaleUtilities.Delay(a3, function() -- Line: 51 -- upvalues: VoidReaver (upval), a2 (val), EmitterManager (upval), u7 (val)
            local v1 = VoidReaver.EyeExplosion:Clone()
            v1:ScaleTo(5)
            v1:PivotTo((CFrame.new(a2.Position)) * (CFrame.new(0, 2, 0)))
            v1.Parent = workspace.Trash
            EmitterManager.manualEmit(v1)
            u7:Destroy()
        end)
    end,
    statueHandler = function(a1, a2) -- Line: 61 -- upvalues: EmitterManager (val), TimescaleUtilities (val) -- types: a2: boolean
        local function getBoneKey(a1) -- Line: 62 -- types: a1: userdata
            if a1.Parent then
                return (("%*_%*"):format(a1.Parent.Name, a1.Name))
            end
            return a1.Name
        end

        return function() -- Line: 66 -- upvalues: EmitterManager (upval), a1 (val)
            EmitterManager.toggle(a1.Model, false, "ParticleEmitter")
            for i, j in a1.Model:GetDescendants() do
                if j:IsA("SurfaceAppearance") then
                    j:Destroy()
                end
                if j:IsA("BasePart") then
                    j.Material = Enum.Material.Slate
                    j.Color = Color3.fromRGB(90, 73, 97)
                end
            end
        end, function() -- Line: 80 -- upvalues: a1 (val), a2 (val), TimescaleUtilities (upval)
            local Name_3, Name_6, v1
            local v2 = {}
            for i, j in a1.Model:GetDescendants() do
                if j:IsA("BasePart") then
                    j.CanCollide = false
                    j.Anchored = true
                elseif j:IsA("Bone") then
                    Name_6 = if not j.Parent then j.Name else ("%*_%*"):format(j.Parent.Name, j.Name)
                    v2[Name_6] = j.Transform
                end
            end
            local v3 = a1.Model:Clone()
            v3.Name = a1.Model.Name .. "_Corpse"
            v3.Parent = workspace.Trash
            local Highlight = v3:FindFirstChild("Highlight")
            if Highlight then
                Highlight:Destroy()
            end
            if a2 then
                TimescaleUtilities.CleanUp(v3, 60)
            end
            for k, n in v3:WaitForChild("RootPart"):QueryDescendants("Bone") do
                Name_3 = if not n.Parent then n.Name else ("%*_%*"):format(n.Parent.Name, n.Name)
                v1 = v2[Name_3]
                if v1 then
                    n.CFrame = n.CFrame * v1
                end
            end
        end
    end,
    reviveBeams = function(a1, a2) -- Line: 119
        -- upvalues: u59 (val), TimescaleUtilities (val), VoidCaster (val), Bezier (val), RunService (val)
        -- upvalues: GameState (val)
        local u2 = {}
        local u3 = true

        local function getWorldPosition(a1_2) -- Line: 130 -- upvalues: a1 (val) -- types: a1_2: userdata?
            if not a1_2 then
                return a1.Position
            end
            if a1_2:IsA("Attachment") then
                return a1_2.WorldPosition
            end
            if a1_2:IsA("BasePart") then
                return a1_2.Position
            end
            if a1_2:IsA("Model") then
                return a1_2:GetPivot().Position
            end
            local Attachment = a1_2:FindFirstChildWhichIsA("Attachment", true)
            if Attachment then
                return Attachment.WorldPosition
            end
            local BasePart = a1_2:FindFirstChildWhichIsA("BasePart", true)
            if BasePart then
                return BasePart.Position
            end
            return a1.Position
        end

        local function getSideVector(a1, a2) -- Line: 160 -- types: a1: vector, a2: vector
            local v1 = (a2 - a1):Cross((Vector3.new(0, 1, 0)))
            if v1.Magnitude <= 0.001 then
                return (Vector3.new(1, 0, 0))
            end
            return v1.Unit
        end

        local function setTrailEnabled(a1, a2) -- Line: 169 -- types: a1: userdata, a2: boolean
            for i, j in a1:GetDescendants() do
                if j:IsA("Trail") then
                    j.Enabled = a2
                end
            end
        end

        local function getPositionForBeam() -- Line: 177
            -- upvalues: getWorldPosition (val), a1 (val), a2 (val), u59 (upval)
            local v1 = getWorldPosition(a1.Model.ReviveStaff.Value)
            local v2 = v1:Lerp(a2.endPosition, 0.5)
            local v3 = (a2.endPosition - v1):Cross((Vector3.new(0, 1, 0)))
            local Unit = if not (v3.Magnitude <= 0.001) then v3.Unit else Vector3.new(1, 0, 0)
            local v4 = {}
            local v5 = (v1:Lerp(v2, 0.5)) + Vector3.new(0, 1, 0) * u59:NextNumber(-12, 12) + Unit * u59:NextNumber(-13, 13)
            local v6 = v2 + Vector3.new(0, 1, 0) * u59:NextNumber(-12, 12) + Unit * u59:NextNumber(-12, 12)
            local v7 = (v2:Lerp(a2.endPosition, 0.75)) + Vector3.new(0, 1, 0) * u59:NextNumber(-12, 12) + Unit * u59:NextNumber(-12, 12)
            v4[1] = v1
            v4[2] = v5
            v4[3] = v6
            v4[4] = v7
            v4[5] = a2.endPosition
            return v4
        end

        a1._revivingMaid:Mark(function() -- Line: 197 -- upvalues: u3 (ref), u2 (val), setTrailEnabled (val), TimescaleUtilities (upval)
            u3 = false
            for i, j in u2 do
                setTrailEnabled(j.trail, false)
                TimescaleUtilities.CleanUp(j.trail, 3)
            end
        end)
        task.spawn(function() -- Line: 205
            -- upvalues: a1 (val), a2 (val), u3 (ref), VoidCaster (upval), u2 (val), getPositionForBeam (val)
            -- upvalues: u59 (upval), Bezier (upval), TimescaleUtilities (upval)
            local new, positions, v1, v2, v3
            local ReviveChargeTime = a1.Stats.ReviveChargeTime or a2.beamCount
            local v4 = (math.max(ReviveChargeTime - a2.introTime, 0.1)) / a2.beamCount
            local beamCount = a2.beamCount
            for i = 1, beamCount do
                if not u3 then
                    return
                end
                v1 = VoidCaster.Trail:Clone()
                v2 = u2
                v3 = {
                    t = 0,
                    trail = v1,
                    positions = getPositionForBeam(),
                    randomTime = u59:NextNumber(0.5, 1.25),
                }
                v2[i] = v3
                v2 = u2[i]
                new = Bezier.new
                positions = u2[i].positions
                v2.bez = new(unpack(positions))
                v1.Position = u2[i].positions[1]
                v1.Parent = workspace.Trash
                TimescaleUtilities.Wait(v4)
            end
        end)
        a1._revivingMaid:Mark((RunService.Heartbeat:Connect(function(a1) -- Line: 231 -- upvalues: u2 (val), GameState (upval), getPositionForBeam (val), Bezier (upval), u3 (ref)
            local v1 = #u2
            for i = 1, v1 do
                local u9 = u2[i]
                if u9 then
                    u9.t = u9.t + a1 / u9.randomTime * GameState.TimeScale
                    if 1 < u9.t then
                        u9.t = 0
                        u9.positions = getPositionForBeam()
                        u9.bez = Bezier.new(unpack(u9.positions))
                        for j, k in u9.trail:GetDescendants() do
                            if k:IsA("Trail") then
                                k.Enabled = false
                                task.delay(0.01, function() -- Line: 247 -- upvalues: u3 (upval), u9 (val), k (val)
                                    if u3 and u9.trail.Parent then
                                        k.Enabled = true
                                    end
                                end)
                            end
                        end
                    end
                    u9.trail.Position = u9.bez:Get(u9.t, 1)
                end
            end
        end)))
    end,
    deathEnergyOrbs = function(a1, a2) -- Line: 261
        -- upvalues: ServerTicks (val), u59 (val), EmitterManager (val), Debris (val), VoidCaster (val), Bezier (val)
        -- upvalues: RunService (val), GameState (val), TimescaleUtilities (val), randomInRange (val)
        local u2 = {}
        local u7 = ServerTicks.getTime() + a2.duration

        local function shouldSpawnEnergyOrbs() -- Line: 274 -- upvalues: ServerTicks (upval), u7 (val)
            return ServerTicks.getTime() < u7
        end

        local function shouldStopEnergyOrbConnection() -- Line: 278 -- upvalues: ServerTicks (upval), u7 (val), u2 (val)
            return not (ServerTicks.getTime() < u7) and #u2 == 0
        end

        local function getDeathEnergyOrbPath() -- Line: 282 -- upvalues: a1 (val), u59 (upval), a2 (val)
            local Position = a1.Model:GetPivot().Position
            local WorldPosition = a1.Model.ReviveStaff.Value.WorldPosition
            local v1 = Vector3.new(u59:NextNumber(-1, 1), u59:NextNumber(-1, 1), (u59:NextNumber(-1, 1)))
            if v1.Magnitude <= 0.001 then
                v1 = Vector3.new(0, 1, 0)
            end
            local Unit = v1.Unit
            local radius = a2.radius
            local v2 = Position + Unit * u59:NextNumber(radius.Min, radius.Max)
            local v3 = CFrame.lookAlong(v2:Lerp(WorldPosition, 0.5), v1)
            local new = CFrame.new
            local controlOffset = a2.controlOffset
            local v4 = u59:NextNumber(controlOffset.Min, controlOffset.Max)
            local controlOffset_2 = a2.controlOffset
            v3 = {v2}
            v3[2] = (v3 * new(v4, u59:NextNumber(controlOffset_2.Min, controlOffset_2.Max), 0)).Position
            v3[3] = WorldPosition
            return v3
        end

        local function destroyEnergyOrb(a1) -- Line: 309 -- upvalues: EmitterManager (upval), Debris (upval)
            a1.trail.Position = a1.bez:Get(1, 1)
            EmitterManager.toggle(a1.trail, false)
            Debris:AddItem(a1.trail, 1)
        end

        local function spawnEnergyOrb() -- Line: 315
            -- upvalues: VoidCaster (upval), getDeathEnergyOrbPath (val), u2 (val), a2 (val), u59 (upval)
            -- upvalues: Bezier (upval)
            local v1 = VoidCaster.DeathTrail:Clone()
            local v2 = getDeathEnergyOrbPath()
            v1.Position = v2[1]
            v1.Parent = workspace.Trash
            local v3 = u2
            local v4 = {t = 0, trail = v1}
            local travelTime = a2.travelTime
            v4.travelTime = u59:NextNumber(travelTime.Min, travelTime.Max)
            v4.bez = Bezier.new(unpack(v2))
            table.insert(v3, v4)
        end

        local u13 = nil
        local v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 331
            -- upvalues: u2 (val), GameState (upval), EmitterManager (upval), Debris (upval), ServerTicks (upval)
            -- upvalues: u7 (val), u13 (ref)
            local v1
            for i = #u2, 1, -1 do
                v1 = u2[i]
                v1.t = v1.t + a1 / v1.travelTime * GameState.TimeScale
                if not (1 <= v1.t) then
                    v1.trail.Position = v1.bez:Get(v1.t, 1)
                else
                    v1.trail.Position = v1.bez:Get(1, 1)
                    EmitterManager.toggle(v1.trail, false)
                    Debris:AddItem(v1.trail, 1)
                    table.remove(u2, i)
                end
            end
            if not (ServerTicks.getTime() < u7) and #u2 == 0 and u13 then
                u13:Disconnect()
            end
        end)
        task.spawn(function() -- Line: 350
            -- upvalues: ServerTicks (upval), u7 (val), spawnEnergyOrb (val), TimescaleUtilities (upval)
            -- upvalues: randomInRange (upval), a2 (val)
            while true do
                if not (ServerTicks.getTime() < u7) then
                    break
                end
                spawnEnergyOrb()
                TimescaleUtilities.Wait(randomInRange(a2.interval))
            end
        end)
    end,
}