-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt V2.Events.TreeReplace
-- Decompile time: 4.66 ms

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

local function rng(a1) -- Line: 19 -- upvalues: u45 (val)
    return u45:NextNumber(-1, 1) * a1
end

local function createTree(a1, a2) -- Line: 23
    -- upvalues: u40 (val), EmitterManager (val), RunService (val), GameState (val), TweenService (val)
    local u4 = u40._treesSpawn[a1]
    local v1 = u40.data[a1]
    v1.canClone = true
    local u14 = u40.map.Tree:Clone()
    local u20 = u4 * CFrame.new(0, -20, 0)
    u14:PivotTo(u20)
    u14.Parent = u40.map.NewTrees
    a1:SetAttribute("Effect", true)
    EmitterManager.Emit("EnergyExplosion", a2.obj.CFrame, 1.5, 1.5, false)
    local u42 = nil
    local u43 = 0
    local u49 = 1 * math.random(2, 4)
    local v2 = RunService.Heartbeat:Connect(function(a1) -- Line: 42
        -- upvalues: u14 (val), u42 (ref), u43 (ref), GameState (upval), u49 (val), TweenService (upval), u20 (val)
        -- upvalues: u4 (val)
        if u14 and u14.Parent then
            u43 = u43 + a1 * GameState.TimeScale / u49
            local Value = TweenService:GetValue(u43, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
            u14:PivotTo((u20:Lerp(u4, Value)))
            if Value >= 1 then
                u42:Disconnect()
            end
            return
        end
        u42:Disconnect()
    end)
end

local function moveObjects(a1) -- Line: 61 -- upvalues: createTree (val), ItemDrop (val) -- types: a1: table
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
        ;(ItemDrop.Drop(j.obj.Position, j.randomCFrame.Position, j.obj, 6, -1.2, 2, function(a1, a2, a3) -- Line: 84 -- upvalues: u30 (val), j (val), Size (val)
            CFrame.new()
            local v1 = (CFrame.lookAt(a2, a3)) * CFrame.Angles(u30 + a1, 0, 0)
            local obj = j.obj
            local v2 = Size
            local v3 = a1 / 6
            obj.Size = v2:Lerp(Vector3.new(0, 0, 0), v3)
            return v1 - v1.Position
        end)):andThen(function(a1) -- Line: 91 -- upvalues: j (val)
            local Parent = j.obj.Parent
            if Parent and Parent:IsA("Model") and Parent.Parent then
                Parent:Destroy()
            end
        end)
    end
end

function u40.rewind(a1) -- Line: 100
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
            v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 123 -- upvalues: u58 (ref), GameState (upval), TweenService (upval), n (val), u57 (ref)
                u58 = u58 + a1 * GameState.TimeScale / 3
                local Value = TweenService:GetValue(u58, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
                n.tree:PivotTo((n.startCFrame:Lerp(n.originalCFrame, Value)))
                if Value >= 1 then
                    u57:Disconnect()
                end
            end)
        end
    end
    TimescaleUtilities.Delay(3, function() -- Line: 140 -- upvalues: a1 (val)
        a1._treesSpawn = {}
        a1.data = {}
        a1._threads = {}
    end)
end

function u40.replace(a1) -- Line: 147 -- upvalues: u45 (val), Shaker (val), moveObjects (val), TimescaleUtilities (val)
    local Pivot, v1, v2
    local u127 = {}
    if not a1.map:FindFirstChild("NewTrees") then
        local Folder = Instance.new("Folder")
        Folder.Name = "NewTrees"
        Folder.Parent = a1.map
    end
    local Children = a1.map.Trees:GetChildren()
    local v3 = #Children
    local v4 = a1
    for i = 1, v3 do
        v2 = Children[i]
        if v2 then
            u127[i] = {}
            v4.data[v2] = {canClone = false, tree = v2:Clone(), originalCFrame = v2:GetPivot()}
            Pivot = v2:GetPivot()
            v4._treesSpawn[v2] = Pivot
            for j, k in v2:GetChildren() do
                if k:IsA("BasePart") then
                    v1 = k.CFrame * CFrame.new(u45:NextNumber(-1, 1) * 24, k.CFrame.Position.Y - 10, u45:NextNumber(-1, 1) * 24) * CFrame.Angles(
                        math.rad((u45:NextNumber(-1, 1)) * 40),
                        math.rad((u45:NextNumber(-1, 1)) * 40),
                        (math.rad((u45:NextNumber(-1, 1)) * 40))
                    )
                    table.insert(u127[i], {obj = k, randomCFrame = v1})
                end
            end
        end
    end
    Shaker:Shake({
        15,
        10,
        0,
        Vector3.new(0, 0.05000000074505806, 0),
        (Vector3.new(0.10000000149011612, 0, 0.10000000149011612)),
    }, 0, 4)
    table.insert(v4._threads, (task.spawn(function() -- Line: 191 -- upvalues: u127 (val), moveObjects (upval), TimescaleUtilities (upval)
        for i, j in u127 do
            moveObjects(j)
            TimescaleUtilities.Wait(0.1)
        end
    end)))
end

return u40