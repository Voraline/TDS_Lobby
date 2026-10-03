-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt V2.Events.SpreadCorruption
-- Decompile time: 7.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {
    _radius = 0,
    _startPosition = Vector3.new(0, 0, 0),
    started = false,
    data = {},
    corruptedModels = {},
    _breakAway = {},
    _corruptionParts = {},
    _connections = {},
}
local u31 = {}
local u32 = nil
local u33 = {}
local v2 = Color3.fromRGB(2, 16, 39)
local v3 = Color3.fromRGB(31, 31, 31)
u33[1] = v2
u33[2] = v3
u33[3] = Color3.fromRGB(82, 82, 82)

local function rng(a1) -- Line: 31
    return Random.new():NextNumber(-1, 1) * a1
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 35
    -- upvalues: u31 (ref), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u31[a2] then
        u31[a2]:Disconnect()
    end
    u31[a2] = (RunService.Heartbeat:Connect(function(a1_2) -- Line: 43
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u31 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        a2[a3] = (u7:Lerp(a4, Value))
        if Value >= 1 then
            u31[a2]:Disconnect()
        end
    end))
end

function v1.rewind(a1) -- Line: 55
    -- upvalues: u32 (ref), u31 (ref), RunService (val), GameState (val), TweenService (val), TimescaleUtilities (val)
    local Heartbeat, v1
    for i, j in a1._connections do
        j:Disconnect()
    end
    if u32 then
        u32:Disconnect()
        u32 = nil
    end
    local v2 = {}
    for k, n in a1._breakAway do
        v2[n.obj] = n.obj.CFrame
    end
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for m, i5 in a1._corruptionParts, v3, v4 do
        local obj = i5.obj
        local color = i5.color
        local Linear = Enum.EasingStyle.Linear
        local InOut = Enum.EasingDirection.InOut
        local u73 = 0
        local Color = obj.Color
        if u31[obj] then
            u31[obj]:Disconnect()
        end
        v1 = u31
        Heartbeat = RunService.Heartbeat
        local u85 = 1
        local u86 = "Color"
        v1[obj] = (Heartbeat:Connect(function(a1) -- Line: 43
            -- upvalues: u73 (ref), GameState (upval), u85 (val), TweenService (upval), Linear (val), InOut (val)
            -- upvalues: obj (val), u86 (val), Color (val), color (val), u31 (upval)
            u73 = u73 + a1 * GameState.TimeScale / u85
            local Value = TweenService:GetValue(u73, Linear, InOut)
            obj[u86] = (Color:Lerp(color, Value))
            if Value >= 1 then
                u31[obj]:Disconnect()
            end
        end))
    end
    for i6, i7 in v5.corruptedModels do
        i6:PivotTo(i7)
        if i6.PrimaryPart then
            i6.PrimaryPart.Anchored = false
        end
    end
    v5.data = {}
    v5._breakAway = {}
    v5._corruptionParts = {}
    v5.corruptedModels = {}
    TimescaleUtilities.Delay(3, function() -- Line: 87 -- upvalues: u31 (upval)
        for i, j in u31 do
            j:Disconnect()
        end
        u31 = {}
    end)
end

function v1.spinModel(a1, a2) -- Line: 96
    -- upvalues: RunService (val), GameState (val), TweenService (val)
    if a1.corruptedModels[a2] then
        return
    end
    local Pivot = a2:GetPivot()
    local u7 = 0
    if a2.PrimaryPart then
        a2.PrimaryPart.Anchored = true
    end
    a1.corruptedModels[a2] = Pivot
    local u67 = Pivot * CFrame.new(Random.new():NextNumber(-1, 1) * 5, Pivot.Position.Y + math.random(20, 30), Random.new():NextNumber(-1, 1) * 5) * CFrame.Angles(Random.new():NextNumber(-1, 1) * 40, Random.new():NextNumber(-1, 1) * 40, Random.new():NextNumber(-1, 1) * 40)
    table.insert(a1._connections, (RunService.Heartbeat:Connect(function(a1) -- Line: 116
        -- upvalues: GameState (upval), u7 (ref), TweenService (upval), Pivot (val), u67 (val), a2 (val)
        local v1 = a1 * GameState.TimeScale
        u7 = u7 + v1
        a2:PivotTo((Pivot:Lerp(u67, (TweenService:GetValue(u7 / 60, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)))) * CFrame.Angles(0, math.rad(u7 * 45), 0))
    end)))
end

function v1.corruptModel(a1, a2) -- Line: 134
    -- upvalues: u33 (val), u31 (ref), RunService (val), GameState (val), TweenService (val)
    local Heartbeat, v1
    if a1.corruptedModels[a2] then
        return
    end
    local v2 = a2:GetDescendants()
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in v2, v3, v4 do
        if j:IsA("BasePart") and not table.find(v5.data, j) then
            table.insert(v5.data, j)
            local u36 = u33[math.random(1, #u33)]
            table.insert(v5._corruptionParts, {obj = j, color = j.Color})
            local Linear = Enum.EasingStyle.Linear
            local InOut = Enum.EasingDirection.InOut
            local u44 = 0
            local Color = j.Color
            if u31[j] then
                u31[j]:Disconnect()
            end
            v1 = u31
            Heartbeat = RunService.Heartbeat
            local u56 = 7
            local u57 = "Color"
            v1[j] = (Heartbeat:Connect(function(a1) -- Line: 43
                -- upvalues: u44 (ref), GameState (upval), u56 (val), TweenService (upval), Linear (val), InOut (val)
                -- upvalues: j (val), u57 (val), Color (val), u36 (val), u31 (upval)
                u44 = u44 + a1 * GameState.TimeScale / u56
                local Value = TweenService:GetValue(u44, Linear, InOut)
                j[u57] = (Color:Lerp(u36, Value))
                if Value >= 1 then
                    u31[j]:Disconnect()
                end
            end))
        end
    end
end

function v1.corruptEverything(a1) -- Line: 161
    -- upvalues: u33 (val), u31 (ref), RunService (val), GameState (val), TweenService (val)
    local Heartbeat_2, v1
    local Children = a1.map:GetChildren()
    if workspace:FindFirstChild("Ground") then
        local Heartbeat, v2
        for i, j in workspace.Ground:GetChildren() do
            if j:IsA("BasePart") and not table.find(a1.data, j) then
                table.insert(a1.data, j)
                local u43 = u33[math.random(1, #u33)]
                table.insert(a1._corruptionParts, {obj = j, color = j.Color})
                local Linear = Enum.EasingStyle.Linear
                local InOut = Enum.EasingDirection.InOut
                local u51 = 0
                local Color = j.Color
                if u31[j] then
                    u31[j]:Disconnect()
                end
                v2 = u31
                Heartbeat = RunService.Heartbeat
                local u63 = 7
                local u64 = "Color"
                v2[j] = (Heartbeat:Connect(function(a1) -- Line: 43
                    -- upvalues: u51 (ref), GameState (upval), u63 (val), TweenService (upval), Linear (val)
                    -- upvalues: InOut (val), j (val), u64 (val), Color (val), u43 (val), u31 (upval)
                    u51 = u51 + a1 * GameState.TimeScale / u63
                    local Value = TweenService:GetValue(u51, Linear, InOut)
                    j[u64] = (Color:Lerp(u43, Value))
                    if Value >= 1 then
                        u31[j]:Disconnect()
                    end
                end))
            end
        end
    end
    local v3 = nil
    local v4 = nil
    for k, n in Children, v3, v4 do
        if n:IsA("Folder") and not string.find(string.lower(n.Name), "ghost_tree") then
            for m, i5 in n:GetDescendants() do
                if i5:IsA("BasePart") and not table.find(a1.data, i5) then
                    table.insert(a1.data, i5)
                    local u136 = u33[math.random(1, #u33)]
                    table.insert(a1._corruptionParts, {obj = i5, color = i5.Color})
                    local Exponential = Enum.EasingStyle.Exponential
                    local Out = Enum.EasingDirection.Out
                    local u144 = 0
                    local Color_2 = i5.Color
                    if u31[i5] then
                        u31[i5]:Disconnect()
                    end
                    v1 = u31
                    Heartbeat_2 = RunService.Heartbeat
                    local u156 = 6
                    local u157 = "Color"
                    v1[i5] = (Heartbeat_2:Connect(function(a1) -- Line: 43
                        -- upvalues: u144 (ref), GameState (upval), u156 (val), TweenService (upval), Exponential (val)
                        -- upvalues: Out (val), i5 (val), u157 (val), Color_2 (val), u136 (val), u31 (upval)
                        u144 = u144 + a1 * GameState.TimeScale / u156
                        local Value = TweenService:GetValue(u144, Exponential, Out)
                        i5[u157] = (Color_2:Lerp(u136, Value))
                        if Value >= 1 then
                            u31[i5]:Disconnect()
                        end
                    end))
                end
            end
        end
    end
end

return v1