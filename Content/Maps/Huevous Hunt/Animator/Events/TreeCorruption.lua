-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator.Events.TreeCorruption
-- Decompile time: 7.35 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u40 = {data = {}, _treesSpawn = {}, _threads = {}}
local u45 = Random.new()
local u46 = nil

local function rng(a1) -- Line: 22 -- upvalues: u45 (val)
    return u45:NextNumber(-1, 1) * a1
end

local function lerp(a1, a2, a3) -- Line: 26
    return a1 + (a2 - a1) * a3
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 30
    -- upvalues: u46 (ref), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u46 then
        u46:Disconnect()
    end
    u46 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 38
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u46 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        local v1 = u7
        a2[a3] = v1 + (a4 - v1) * Value
        if Value >= 1 then
            u46:Disconnect()
        end
    end)
end

local function createTree(a1, a2) -- Line: 50
    -- upvalues: u40 (val), EmitterManager (val), u45 (val), RunService (val), GameState (val), TweenService (val)
    local u4 = u40._treesSpawn[a1]
    local v1 = u40.data[a1]
    v1.canClone = true
    local u21 = u40.map.GhostTrees["Ghost_Tree_" .. math.random(1, 2)]:Clone()
    local u27 = u4 * CFrame.new(0, -20, 0)
    u21:PivotTo(u27)
    u21.Parent = u40.map.NewTrees
    a1:SetAttribute("Effect", true)
    EmitterManager.Emit("EnergyExplosion", a2.obj.CFrame, 1.5, 1.5, false)
    local v2 = u40.map.Misc.Explosion1:Clone()
    v2.Volume = 0.2
    v2.Parent = u21:GetChildren()[1]
    v2.PlaybackSpeed = u45:NextNumber(0.85, 1.15)
    v2:Play()
    v2.Ended:Connect(function() -- Line: 71 -- upvalues: a1 (val)
        a1:Destroy()
    end)
    local u75 = nil
    local u76 = 0
    local u82 = 1 * math.random(2, 4)
    local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 78
        -- upvalues: u21 (val), u75 (ref), u76 (ref), GameState (upval), u82 (val), TweenService (upval), u27 (val)
        -- upvalues: u4 (val)
        if u21 and u21.Parent then
            u76 = u76 + a1 * GameState.TimeScale / u82
            local Value = TweenService:GetValue(u76, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            u21:PivotTo((u27:Lerp(u4, Value)))
            if Value >= 1 then
                u75:Disconnect()
            end
            return
        end
        u75:Disconnect()
    end)
end

local function moveObjects(a1) -- Line: 97 -- upvalues: createTree (val), ItemDrop (val) -- types: a1: table
    local Parent
    local v1 = nil
    local v2 = nil
    for i, j in a1, v1, v2 do
        Parent = j.obj.Parent
        if Parent and Parent:IsA("Model") and not Parent:GetAttribute("Effect") then
            createTree(Parent, j)
        end
        local u30 = Random.new():NextNumber()
        local Size = j.obj.Size
        ;(ItemDrop.Drop(j.obj.Position, j.randomCFrame.Position, j.obj, 6, -1.2, 2, function(a1, a2, a3) -- Line: 120 -- upvalues: u30 (val), j (val), Size (val)
            CFrame.new()
            local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u30 + a1, 0, 0)
            local obj = j.obj
            local v2 = Size
            local v3 = a1 / 6
            obj.Size = v2:Lerp(Vector3.new(0, 0, 0), v3)
            return v1 - v1.Position
        end)):andThen(function(a1) -- Line: 127 -- upvalues: j (val)
            local Parent = j.obj.Parent
            if Parent and Parent:IsA("Model") and Parent.Parent then
                Parent:Destroy()
            end
        end)
    end
end

function u40.rewind(a1) -- Line: 136
    -- upvalues: RunService (val), GameState (val), TweenService (val), TimescaleUtilities (val)
    local v1
    if not a1.map:FindFirstChild("NewTrees") then
        return
    end
    for i, j in a1._threads do
        task.cancel(j)
    end
    a1.map.NewTrees:ClearAllChildren()
    for k, n in a1.data do
        if n.canClone then
            n.tree:PivotTo(n.originalCFrame * (CFrame.new(0, -10, 0)))
            n.tree.Parent = a1.map.Trees
            n.startCFrame = n.tree:GetPivot()
            local u57 = nil
            local u58 = 0
            v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 159 -- upvalues: u58 (ref), GameState (upval), TweenService (upval), n (val), u57 (ref)
                u58 = u58 + a1 * GameState.TimeScale / 3
                local Value = TweenService:GetValue(u58, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                n.tree:PivotTo((n.startCFrame:Lerp(n.originalCFrame, Value)))
                if Value >= 1 then
                    u57:Disconnect()
                end
            end)
        end
    end
    TimescaleUtilities.Delay(3, function() -- Line: 176 -- upvalues: a1 (val)
        a1._treesSpawn = {}
        a1.data = {}
        a1._threads = {}
    end)
end

function u40.start(a1, a2) -- Line: 183
    -- upvalues: u45 (val), u46 (ref), RunService (val), GameState (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: Shaker (val), moveObjects (val)
    local Pivot, v1, v2
    local u133 = {}
    if not a1.map:FindFirstChild("NewTrees") then
        local Folder = Instance.new("Folder")
        Folder.Name = "NewTrees"
        Folder.Parent = a1.map
    end
    local Children = a1.map.Trees:GetChildren()
    table.sort(Children, function(a1_2, a2) -- Line: 194 -- upvalues: a1 (val)
        return (a1_2:GetPivot().Position - a1.map.KorbloxGate:GetPivot().Position).Magnitude < (a2:GetPivot().Position - a1.map.KorbloxGate:GetPivot().Position).Magnitude
    end)
    for i = 1, a2 do
        v2 = Children[i]
        if v2 then
            u133[i] = {}
            a1.data[v2] = {canClone = false, tree = v2:Clone(), originalCFrame = v2:GetPivot()}
            Pivot = v2:GetPivot()
            a1._treesSpawn[v2] = Pivot
            for j, k in v2:GetChildren() do
                if k:IsA("BasePart") then
                    v1 = k.CFrame * CFrame.new(u45:NextNumber(-1, 1) * 24, k.CFrame.Position.Y - 10, u45:NextNumber(-1, 1) * 24) * CFrame.Angles(
                        math.rad((u45:NextNumber(-1, 1)) * 40),
                        math.rad((u45:NextNumber(-1, 1)) * 40),
                        (math.rad((u45:NextNumber(-1, 1)) * 40))
                    )
                    table.insert(u133[i], {obj = k, randomCFrame = v1})
                end
            end
        end
    end
    local Lighting = game.Lighting
    local Exponential = Enum.EasingStyle.Exponential
    local Out = Enum.EasingDirection.Out
    local u140 = 0
    local ExposureCompensation = Lighting.ExposureCompensation
    if u46 then
        u46:Disconnect()
    end
    local RenderStepped = RunService.RenderStepped
    local u149 = 2
    local u150 = "ExposureCompensation"
    local u151 = -1
    u46 = RenderStepped:Connect(function(a1) -- Line: 38
        -- upvalues: u140 (ref), GameState (upval), u149 (val), TweenService (upval), Exponential (val), Out (val)
        -- upvalues: Lighting (val), u150 (val), ExposureCompensation (val), u151 (val), u46 (upval)
        u140 = u140 + a1 * GameState.TimeScale / u149
        local Value = TweenService:GetValue(u140, Exponential, Out)
        local v1 = ExposureCompensation
        Lighting[u150] = v1 + (u151 - v1) * Value
        if Value >= 1 then
            u46:Disconnect()
        end
    end)
    TimescaleUtilities.Delay(1, function() -- Line: 239 -- upvalues: u46 (upval), RunService (upval), GameState (upval), TweenService (upval)
        local Lighting = game.Lighting
        local Exponential = Enum.EasingStyle.Exponential
        local Out = Enum.EasingDirection.Out
        local u4 = 0
        local ExposureCompensation = Lighting.ExposureCompensation
        if u46 then
            u46:Disconnect()
        end
        local RenderStepped = RunService.RenderStepped
        local u13 = 8
        local u14 = "ExposureCompensation"
        local u15 = 0
        u46 = RenderStepped:Connect(function(a1) -- Line: 38
            -- upvalues: u4 (ref), GameState (upval), u13 (val), TweenService (upval), Exponential (val), Out (val)
            -- upvalues: Lighting (val), u14 (val), ExposureCompensation (val), u15 (val), u46 (upval)
            u4 = u4 + a1 * GameState.TimeScale / u13
            local Value = TweenService:GetValue(u4, Exponential, Out)
            local v1 = ExposureCompensation
            Lighting[u14] = v1 + (u15 - v1) * Value
            if Value >= 1 then
                u46:Disconnect()
            end
        end)
    end)
    Shaker:Shake({
        15,
        10,
        0,
        Vector3.new(0, 0.05000000074505806, 0),
        (Vector3.new(0.10000000149011612, 0, 0.10000000149011612)),
    }, 0, 4)
    table.insert(a1._threads, (task.spawn(function() -- Line: 254 -- upvalues: u133 (val), moveObjects (upval), TimescaleUtilities (upval)
        for i, j in u133 do
            moveObjects(j)
            TimescaleUtilities.Wait(0.45)
        end
    end)))
end

return u40