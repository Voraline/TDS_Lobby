-- Script path: ReplicatedStorage.Content.Maps.Classic Candy Cane Lane.Animator.Events.SpreadCorruption
-- Decompile time: 12.63 ms

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
    _breakAway = {},
    _corruptionParts = {},
    _models = {},
    _connections = {},
}
local u31 = {}
local u32 = nil
local u33 = nil
local u35 = OverlapParams.new()
local u36 = {}
local v2 = Color3.fromRGB(17, 17, 9)
local v3 = Color3.fromRGB(25, 11, 12)
u36[1] = v2
u36[2] = v3
u36[3] = Color3.fromRGB(0, 0, 0)

local function rng(a1) -- Line: 33
    return Random.new():NextNumber(-1, 1) * a1
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 37
    -- upvalues: u31 (ref), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u31[a2] then
        u31[a2]:Disconnect()
    end
    u31[a2] = (RunService.RenderStepped:Connect(function(a1_2) -- Line: 45
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

function v1.rewind(a1) -- Line: 57
    -- upvalues: u33 (ref), u31 (ref), RunService (val), GameState (val), TweenService (val), u32 (ref)
    -- upvalues: TimescaleUtilities (val)
    local RenderStepped_2, v1
    for i, j in a1._connections do
        j:Disconnect()
    end
    if u33 then
        u33:Disconnect()
        u33 = nil
    end
    local u115 = 0
    local u117 = {}
    for k, n in a1._breakAway do
        u117[n.obj] = n.obj.CFrame
    end
    local v2 = nil
    local v3 = nil
    local v4 = a1
    for m, i5 in a1._corruptionParts, v2, v3 do
        local obj = i5.obj
        local color = i5.color
        local Linear = Enum.EasingStyle.Linear
        local InOut = Enum.EasingDirection.InOut
        local u89 = 0
        local Color = obj.Color
        if u31[obj] then
            u31[obj]:Disconnect()
        end
        v1 = u31
        RenderStepped_2 = RunService.RenderStepped
        local u101 = 1
        local u102 = "Color"
        v1[obj] = (RenderStepped_2:Connect(function(a1) -- Line: 45
            -- upvalues: u89 (ref), GameState (upval), u101 (val), TweenService (upval), Linear (val), InOut (val)
            -- upvalues: obj (val), u102 (val), Color (val), color (val), u31 (upval)
            u89 = u89 + a1 * GameState.TimeScale / u101
            local Value = TweenService:GetValue(u89, Linear, InOut)
            obj[u102] = (Color:Lerp(color, Value))
            if Value >= 1 then
                u31[obj]:Disconnect()
            end
        end))
    end
    local _breakAway = v4._breakAway
    for i6, i7 in v4._models do
        i7.model:PivotTo(i7.oringnalPivot)
        if i7.model.PrimaryPart then
            i7.model.PrimaryPart.Anchored = false
        end
    end
    u32 = RunService.RenderStepped:Connect(function(a1) -- Line: 88
        -- upvalues: u115 (ref), GameState (upval), u32 (upval), _breakAway (val), TweenService (upval), u117 (val)
        local Value
        local v1 = {}
        local v2 = {}
        u115 = u115 + a1 * GameState.TimeScale
        if u115 > 1 then
            u32:Disconnect()
            return
        end
        for i, j in _breakAway do
            Value = TweenService:GetValue(u115, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            table.insert(v1, (u117[j.obj]:Lerp(j.oringnalCFrame, Value)))
            table.insert(v2, j.obj)
        end
        workspace:BulkMoveTo(v2, v1)
    end)
    v4.data = {}
    v4._breakAway = {}
    v4._corruptionParts = {}
    v4._models = {}
    TimescaleUtilities.Delay(3, function() -- Line: 115 -- upvalues: u31 (upval)
        for i, j in u31 do
            j:Disconnect()
        end
        u31 = {}
    end)
end

function v1.spinModel(a1, a2) -- Line: 124
    -- upvalues: RunService (val), GameState (val), TweenService (val)
    local Pivot = a2:GetPivot()
    local u5 = 0
    if a2.PrimaryPart then
        a2.PrimaryPart.Anchored = true
    end
    table.insert(a1._models, {model = a2, oringnalPivot = Pivot})
    local u68 = Pivot * CFrame.new(Random.new():NextNumber(-1, 1) * 5, Pivot.Position.Y + math.random(20, 30), Random.new():NextNumber(-1, 1) * 5) * CFrame.Angles(Random.new():NextNumber(-1, 1) * 40, Random.new():NextNumber(-1, 1) * 40, Random.new():NextNumber(-1, 1) * 40)
    table.insert(a1._connections, (RunService.RenderStepped:Connect(function(a1) -- Line: 141
        -- upvalues: GameState (upval), u5 (ref), TweenService (upval), Pivot (val), u68 (val), a2 (val)
        local v1 = a1 * GameState.TimeScale
        u5 = u5 + v1
        a2:PivotTo((Pivot:Lerp(u68, (TweenService:GetValue(u5 / 60, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)))) * CFrame.Angles(0, math.rad(u5 * 45), 0))
    end)))
end

function v1.corruptModel(a1, a2) -- Line: 159
    -- upvalues: u36 (val), u31 (ref), RunService (val), GameState (val), TweenService (val)
    local RenderStepped, v1
    local v2 = a2:GetDescendants()
    local v3 = nil
    local v4 = nil
    local v5 = a1
    for i, j in v2, v3, v4 do
        if j:IsA("BasePart") and not table.find(v5.data, j) then
            table.insert(v5.data, j)
            local u34 = u36[math.random(1, #u36)]
            table.insert(v5._corruptionParts, {obj = j, color = j.Color})
            local Linear = Enum.EasingStyle.Linear
            local InOut = Enum.EasingDirection.InOut
            local u42 = 0
            local Color = j.Color
            if u31[j] then
                u31[j]:Disconnect()
            end
            v1 = u31
            RenderStepped = RunService.RenderStepped
            local u54 = 7
            local u55 = "Color"
            v1[j] = (RenderStepped:Connect(function(a1) -- Line: 45
                -- upvalues: u42 (ref), GameState (upval), u54 (val), TweenService (upval), Linear (val), InOut (val)
                -- upvalues: j (val), u55 (val), Color (val), u34 (val), u31 (upval)
                u42 = u42 + a1 * GameState.TimeScale / u54
                local Value = TweenService:GetValue(u42, Linear, InOut)
                j[u55] = (Color:Lerp(u34, Value))
                if Value >= 1 then
                    u31[j]:Disconnect()
                end
            end))
        end
    end
end

function v1.corruptEverything(a1) -- Line: 182
    -- upvalues: u36 (val), u31 (ref), RunService (val), GameState (val), TweenService (val)
    local RenderStepped_2, v1
    local Children = a1.map:GetChildren()
    if workspace:FindFirstChild("Ground") then
        local RenderStepped, v2
        for i, j in workspace.Ground:GetChildren() do
            if j:IsA("BasePart") and not table.find(a1.data, j) then
                table.insert(a1.data, j)
                local u43 = u36[math.random(1, #u36)]
                table.insert(a1._corruptionParts, {obj = j, color = j.Color})
                local Linear = Enum.EasingStyle.Linear
                local InOut = Enum.EasingDirection.InOut
                local u51 = 0
                local Color = j.Color
                if u31[j] then
                    u31[j]:Disconnect()
                end
                v2 = u31
                RenderStepped = RunService.RenderStepped
                local u63 = 7
                local u64 = "Color"
                v2[j] = (RenderStepped:Connect(function(a1) -- Line: 45
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
                if i5:IsA("BasePart") and not table.find(a1.data, i5) and i5.Parent.Name ~= "Portal" then
                    table.insert(a1.data, i5)
                    local u138 = u36[math.random(1, #u36)]
                    table.insert(a1._corruptionParts, {obj = i5, color = i5.Color})
                    local Exponential = Enum.EasingStyle.Exponential
                    local Out = Enum.EasingDirection.Out
                    local u146 = 0
                    local Color_2 = i5.Color
                    if u31[i5] then
                        u31[i5]:Disconnect()
                    end
                    v1 = u31
                    RenderStepped_2 = RunService.RenderStepped
                    local u158 = 6
                    local u159 = "Color"
                    v1[i5] = (RenderStepped_2:Connect(function(a1) -- Line: 45
                        -- upvalues: u146 (ref), GameState (upval), u158 (val), TweenService (upval), Exponential (val)
                        -- upvalues: Out (val), i5 (val), u159 (val), Color_2 (val), u138 (val), u31 (upval)
                        u146 = u146 + a1 * GameState.TimeScale / u158
                        local Value = TweenService:GetValue(u146, Exponential, Out)
                        i5[u159] = (Color_2:Lerp(u138, Value))
                        if Value >= 1 then
                            u31[i5]:Disconnect()
                        end
                    end))
                end
            end
        end
    end
end

function v1.start(a1, a2) -- Line: 245
    -- upvalues: u33 (ref), RunService (val), GameState (val), TweenService (val), u35 (val), u36 (val), u31 (ref)
    a1._radius = a2
    if a1.started then
        return
    end
    a1.started = true
    local u4 = 0
    u33 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 256
        -- upvalues: u4 (ref), GameState (upval), a1 (val), TweenService (upval), u35 (upval), u36 (upval), u31 (upval)
        -- upvalues: RunService (upval)
        local Value, elasped_3, v1
        u4 = u4 + a1_2 * GameState.TimeScale
        local v2 = {}
        local v3 = {}
        local v4 = nil
        local v5 = nil
        for i, j in a1._breakAway, v4, v5 do
            j.elasped = j.elasped + a1_2 * GameState.TimeScale / 50
            Value = TweenService:GetValue(j.elasped, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut)
            v1 = 1 - j.elasped
            elasped_3 = if not j.inverse then j.elasped else v1
            table.insert(
                v2,
                (j.oringnalCFrame:Lerp(j.randomCFrame, Value)) * CFrame.new(0, (math.sin((tick()) - j.startTime)) * GameState.TimeScale, 0) * CFrame.Angles(0, math.rad(elasped_3 * j.randomSpeed), 0)
            )
            table.insert(v3, j.obj)
        end
        workspace:BulkMoveTo(v3, v2)
        if u4 > 1 then
            local BreakAway, RenderStepped, v6, v7
            v4 = workspace:GetPartBoundsInRadius(a1._startPosition, a1._radius, u35)
            v5 = nil
            local v8 = nil
            for k, n in v4, v5, v8 do
                if not table.find(a1.data, n) then
                    table.insert(a1.data, n)
                    table.insert(a1._corruptionParts, {obj = n, color = n.Color})
                    local u84 = u36[math.random(1, #u36)]
                    if string.find(string.lower(n.Name), "water") then
                        u84 = Color3.fromRGB(103, 95, 34)
                    end
                    local Linear = Enum.EasingStyle.Linear
                    local InOut = Enum.EasingDirection.InOut
                    local u87 = 0
                    local Color = n.Color
                    if u31[n] then
                        u31[n]:Disconnect()
                    end
                    v7 = u31
                    RenderStepped = RunService.RenderStepped
                    local u100 = 4
                    local u101 = "Color"
                    v7[n] = (RenderStepped:Connect(function(a1) -- Line: 45
                        -- upvalues: u87 (ref), GameState (upval), u100 (val), TweenService (upval), Linear (val)
                        -- upvalues: InOut (val), n (val), u101 (val), Color (val), u84 (val), u31 (upval)
                        u87 = u87 + a1 * GameState.TimeScale / u100
                        local Value = TweenService:GetValue(u87, Linear, InOut)
                        n[u101] = (Color:Lerp(u84, Value))
                        if Value >= 1 then
                            u31[n]:Disconnect()
                        end
                    end))
                    BreakAway = a1.map.BreakAway
                    if n:IsDescendantOf(BreakAway) then
                        v6 = n.CFrame * CFrame.new(
                            Random.new():NextNumber(-1, 1) * 5,
                            n.Position.Y + math.random(20, 30),
                            Random.new():NextNumber(-1, 1) * 5
                        ) * CFrame.Angles(
                            Random.new():NextNumber(-1, 1) * 40,
                            Random.new():NextNumber(-1, 1) * 40,
                            Random.new():NextNumber(-1, 1) * 40
                        )
                        table.insert(a1._breakAway, {
                            elasped = 0,
                            obj = n,
                            randomCFrame = v6,
                            oringnalCFrame = n.CFrame,
                            inverse = math.random(1, 2) == 1,
                            randomSpeed = math.random(300, 700),
                            startTime = tick(),
                            color = n.Color,
                            transparency = n.Transparency,
                        })
                        n.CanTouch = false
                        n.CanCollide = false
                        n.CanQuery = false
                    end
                end
            end
            u4 = 0
        end
    end)
end

function v1.init(a1) -- Line: 339 -- upvalues: u35 (val)
    a1._startPosition = (a1.map:WaitForChild("Environment")):WaitForChild("Portal"):GetPivot().Position
    u35.FilterType = Enum.RaycastFilterType.Include
    u35.FilterDescendantsInstances = {
        a1.map:WaitForChild("BreakAway"),
        a1.map:WaitForChild("Environment"),
        (workspace:WaitForChild("Cliff")),
    }
    for i, j in a1.map.BreakAway:GetDescendants() do
        if j:IsA("BasePart") then
            j.CanQuery = true
        end
    end
end

return v1