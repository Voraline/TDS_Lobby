-- Script path: ReplicatedStorage.Client.Controllers.Lobby.EventAreaController
-- Decompile time: 4.99 ms

local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local u10 = {}
local u11 = {}
local u13 = Random.new()

local function onTaggedInstance(a1, a2) -- Line: 8
    -- upvalues: CollectionService (val)
    local v1
    local u2 = {}
    ;(CollectionService:GetInstanceAddedSignal(a1)):Connect(function(a1) -- Line: 11 -- upvalues: u2 (val), a2 (val)
        if a1:IsDescendantOf(workspace) then
            u2[a1] = (a2(a1))
        end
    end)
    ;(CollectionService:GetInstanceRemovedSignal(a1)):Connect(function(a1) -- Line: 17 -- upvalues: u2 (val)
        local v1 = u2[a1]
        if v1 then
            v1()
            u2[a1] = nil
        end
    end)
    for i, v in ipairs(CollectionService:GetTagged(a1)) do
        v1 = workspace
        if v:IsDescendantOf(v1) then
            u2[v] = (a2(v))
        end
    end
end

RunService.Stepped:Connect(function(a1, a2) -- Line: 32 -- upvalues: u10 (val), u11 (val)
    local Rotation, v1, v2, v3, v4, v5
    local v6 = {}
    local v7 = {}
    local v8 = tick() * 2
    for i, j in u10 do
        v1 = u11[i]
        Rotation = i.CFrame.Rotation
        v3 = math.max(0.2, 1 - i.Size.Magnitude / 60)
        v4 = v3 * 0.005
        v5 = (math.clamp(v3 ^ 2, 0.4, 0.8)) * 0.25 * 10
        v1 = v1 + Vector3.new(0, math.sin(j.Y * 100 + v8) * 0.5 * v5, 0)
        v2 = Rotation * (CFrame.Angles(j.X * v4, j.Y * v4, j.Z * v4))
        table.insert(v7, (CFrame.new(v1)) * v2)
        table.insert(v6, i)
    end
    workspace:BulkMoveTo(v6, v7, Enum.BulkMoveMode.FireCFrameChanged)
end)
onTaggedInstance("GodCube", function(a1) -- Line: 61 -- upvalues: RunService (val), u13 (val)
    local u1 = 0
    local u6 = CFrame.Angles(0, 0, 0)
    local u12 = RunService.PostSimulation:Connect(function(a1_2) -- Line: 65 -- upvalues: u1 (ref), u13 (upval), u6 (ref), a1 (val)
        u1 = u1 + a1_2
        if (u13:NextNumber()) < 0.4 then
            u6 = CFrame.Angles(math.rad((u13:NextNumber(-10, 10))), math.rad((u13:NextNumber(-10, 10))), (math.rad((u13:NextNumber(-10, 10)))))
        end
        a1:PivotTo((CFrame.new(a1.WorldPivot.Position)) * CFrame.Angles(0, math.rad(u1 * 90), 0) * u6)
    end)
    return function() -- Line: 84 -- upvalues: u12 (val)
        u12:Disconnect()
    end
end)
onTaggedInstance("FloatingRock", function(a1) -- Line: 89 -- upvalues: u10 (val), u13 (val), u11 (val)
    u10[a1] = (u13:NextUnitVector())
    u11[a1] = a1.CFrame.Position
    return function() -- Line: 93 -- upvalues: u10 (upval), a1 (val), u11 (upval)
        u10[a1] = nil
        u11[a1] = nil
    end
end)
return nil