-- Script path: ReplicatedStorage.Content.MapItems.SpotLight.Controller
-- Decompile time: 4.72 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SharedUniversalFunctions = require(ReplicatedStorage.Shared.Modules.SharedUniversalFunctions)
local TeamOctrees = require(ReplicatedStorage.Shared.Modules.TeamOctrees)

local function pointToY(a1, a2) -- Line: 25 -- types: a1: vector, a2: number
    return (a1.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, a2, 0)).Unit
end

local function pointDown(a1) -- Line: 29 -- types: a1: vector
    return (a1.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, -0.5, 0)).Unit
end

local function pointUp(a1) -- Line: 33 -- types: a1: vector
    return (a1.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, -0.10000000149011612, 0)).Unit
end

local function getMapCenter() -- Line: 37 -- upvalues: SharedUniversalFunctions (val)
    return SharedUniversalFunctions.getBoundingBox((workspace:WaitForChild("Map")).Ground, nil, true).Position
end

return {
    new = function(a1, a2, a3) -- Line: 43
        -- upvalues: Maid (val), Create (val), SharedUniversalFunctions (val), Players (val), TeamOctrees (val)
        -- upvalues: Enum (val)
        local u3 = {}
        local u4 = 0
        local u5 = 0
        u3.maid = Maid.new()
        u3.main = a1.Main
        u3.Replicator = a3
        u3.Interactable = a2.ReplicationData.Interactable
        u3.Owner = nil
        u3.Position = Vector3.new(0, 0, 0)
        u3.Stats = a2
        u3.Targets = {}
        a1.Parent = workspace
        local Part = Instance.new("Part")
        Part.Size = Vector3.new(2, 2, 2)
        Part.Color = Color3.new(1, 0, 0)
        Part.Position = u3.main.Position
        Part.CanCollide = false
        Part.CanQuery = false
        Part.Anchored = true
        Part.Parent = workspace
        Part.Transparency = 1
        Create("ObjectValue", {Name = "SpotLightBlock", Value = a1, Parent = Part})
        task.spawn(function() -- Line: 76 -- upvalues: u3 (val), SharedUniversalFunctions (upval)
            local v1 = u3
            local lookAt = CFrame.lookAt
            local Position = u3.main.Position
            local Ground = (workspace:WaitForChild("Map")).Ground
            v1.originTarget = (lookAt(Position, SharedUniversalFunctions.getBoundingBox(Ground, nil, true).Position).LookVector.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, -0.5, 0)).Unit
            u3.Target = u3.originTarget
            u3.Replicator:Set("Target", u3.Target)
        end)

        function u3.Destroy(a1) -- Line: 83
            a1.maid:Sweep()
        end

        function u3.ResetState(a1) -- Line: 87 -- upvalues: a2 (val), u3 (val)
            a1.Replicator:Set("Interactable", a2.ReplicationData.Interactable)
            a1.Replicator:Set("Target", u3.originTarget)
        end

        function u3.TurnOn(a1) -- Line: 92
            a1.Replicator:Set("Interactable", true)
        end

        function u3.TurnOff(a1) -- Line: 96
            a1.Replicator:Set("Interactable", false)
        end

        function u3.Initialize(a1) -- Line: 100 -- upvalues: Players (upval), a2 (val)
            a1.Replicator:Hook(a1)
            a1.maid:Mark(((a1.Replicator:GetStateChangedSignal("Interactable")):Connect(function(a1_2) -- Line: 104 -- upvalues: a1 (val) -- types: a1_2: boolean
                if a1_2 then
                    a1.Target = (a1.Target.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, -0.10000000149011612, 0)).Unit
                    a1.Position = a1:GetTargetPosition()
                    a1.Replicator:Set("Target", a1.Target)
                    return
                end
                a1.Owner = nil
                a1.Target = (a1.Target.Unit * Vector3.new(1, 0, 1) + Vector3.new(0, -0.5, 0)).Unit
                a1.Targets = {}
                a1.Replicator:Set("Owner", a1.Owner)
                a1.Replicator:Set("Target", a1.Target)
            end)))
            a1.maid:Mark((Players.PlayerRemoving:Connect(function(a1_2) -- Line: 118 -- upvalues: a1 (val) -- types: a1_2: userdata
                if a1.Owner == a1_2.UserId then
                    a1.Owner = nil
                    a1.Replicator:Set("Owner", nil)
                end
            end)))
            a1.Executables = {
                RequestOwner = function(a1_2) -- Line: 126 -- upvalues: a1 (val) -- types: a1_2: userdata
                    if not a1.Owner and a1.Interactable then
                        a1.Owner = a1_2.UserId
                        a1.Replicator:Set("Owner", a1_2.UserId)
                        return
                    end
                end,
                ReleaseOwner = function(a1_2) -- Line: 135 -- upvalues: a1 (val) -- types: a1_2: userdata
                    if a1.Owner ~= a1_2.UserId then
                        return
                    end
                    a1.Owner = nil
                    a1.Replicator:Set("Owner", nil)
                end,
                Replicate = function(a1_2, a2_2, a3) -- Line: 144
                    -- upvalues: a1 (val), a2 (upval)
                    if typeof(a2_2) == "Vector3" and a2_2.Magnitude ~= 0 then
                        if typeof(a3) == "Vector3" and a3.Magnitude ~= 0 then
                            if a1.Interactable and a1.Owner == a1_2.UserId then
                                local Unit = a2_2.Unit
                                if Unit ~= Unit then
                                    return
                                end
                                local v1 = a3 - a1.main.Position
                                local v2 = math.min(v1.Magnitude, a2.MaxLength)
                                local Unit_2 = v1.Unit
                                if Unit_2 ~= Unit_2 then
                                    return
                                end
                                local v3 = a1.main.Position + Unit_2 * v2
                                a1.Target = Unit
                                a1.Position = v3
                                a1:ReplicateActionUnreliableExcept(a1_2, "UpdateTarget", Unit, v3)
                                return
                            end
                            return
                        end
                        return
                    end
                end,
            }
        end

        function u3:GetTargetPosition() -- Line: 179 -- upvalues: a1 (val), a2 (val)
            local v1 = {}
            for i, j in (workspace:FindFirstChild("Map")):GetChildren() do
                if j.Name ~= "Cliff" then
                    table.insert(v1, j)
                end
            end
            local v2 = RaycastParams.new()
            v2.FilterType = Enum.RaycastFilterType.Include
            v2.FilterDescendantsInstances = v1
            local Position = a1.Main.Position
            local v3 = self.Target * a2.MaxLength
            local v4 = workspace:Raycast(Position, v3, v2)
            if v4 then
                return v4.Position
            end
            return Position + v3
        end

        function u3.Step(a1, a2_2) -- Line: 204
            -- upvalues: u4 (ref), u5 (ref), Part (val), TeamOctrees (upval), Enum (upval), a2 (val)
            u4 = u4 + a2_2
            u5 = u5 + a2_2
            if u4 >= 0.5 then
                u4 = 0
                a1.Replicator:Set("Target", a1.Target)
            end
            if u5 < 0.1 then
                return
            end
            u5 = 0
            if not a1.Interactable then
                if next(a1.Targets) then
                    a1.Targets = {}
                end
                return
            end
            Part.Position = a1.Position
            local v1 = {}
            local v2 = TeamOctrees.getTargets(Enum.Team.Player, a1.Position, a2.Radius)
            local v3 = nil
            local v4 = nil
            local v5 = a1
            for i, j in v2, v3, v4 do
                if j.Type == "Enemies" then
                    if not v5.Targets[j] then
                        v5.Targets[j] = true
                    end
                    v1[j] = true
                end
            end
            for k in v5.Targets do
                if not v1[k] then
                    v5.Targets[k] = nil
                end
            end
        end

        return u3
    end,
}