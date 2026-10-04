-- Script path: ReplicatedStorage.Client.Controllers.Game.ShrineController
-- Decompile time: 16.93 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local ShrineBillboardMount = require(ReplicatedStorage.Client.Controllers.Game.ShrineBillboardMount)
local Shrines = NewNetwork.Channel("Shrines")
local u50 = Random.new()
local u51 = {}
local u52 = {}

local function playActivationSound(a1) -- Line: 17 -- upvalues: EasySound (val) -- types: a1: string?
    if typeof(a1) == "string" and a1 ~= "" then
        EasySound.Play({volume = 1, destroyOnEnd = true, timeScaled = false, id = a1})
        return
    end
end

local function mountShrineBillboard(a1) -- Line: 30
    -- upvalues: u52 (val), ShrineBillboardMount (val)
    if u52[a1] then
        return
    end
    u52[a1] = (ShrineBillboardMount.mount(a1))
end

local function cleanupShrineBillboard(a1) -- Line: 38 -- upvalues: u52 (val) -- types: a1: userdata
    local v1 = u52[a1]
    if not v1 then
        return
    end
    u52[a1] = nil
    v1()
end

local function getShrineById(a1) -- Line: 48 -- upvalues: CollectionService (val) -- types: a1: string
    for i, j in CollectionService:GetTagged("Shrine") do
        if j:IsA("Model") and j:GetAttribute("ShrineId") == a1 then
            return j
        end
    end
    return nil
end

local function waitForShrine(a1) -- Line: 58 -- upvalues: getShrineById (val) -- types: a1: string
    local v1 = os.clock() + 2
    local v2 = getShrineById(a1)
    while not v2 do
        if not (os.clock() < v1) then
            break
        end
        task.wait()
        v2 = getShrineById(a1)
    end
    return v2
end

local function stopAnimation(a1) -- Line: 70 -- upvalues: u51 (val) -- types: a1: userdata
    local v1 = u51[a1]
    if v1 then
        v1:Disconnect()
        u51[a1] = nil
    end
end

local function animateShrine(a1, a2, a3, a4, a5) -- Line: 78
    -- upvalues: waitForShrine (val), u51 (val), RunService (val), GameState (val), TweenService (val), u50 (val)
    task.spawn(function() -- Line: 85
        -- upvalues: waitForShrine (upval), a1 (val), u51 (upval), a4 (ref), a5 (ref), a2 (val), a3 (val)
        -- upvalues: RunService (upval), GameState (upval), TweenService (upval), u50 (upval)
        local u2 = waitForShrine(a1)
        if not u2 then
            return
        end
        local v1 = u51[u2]
        if v1 then
            v1:Disconnect()
            u51[u2] = nil
        end
        a4 = math.max(a4 or 1, 0.05)
        a5 = math.max(a5 or 8, 0)
        v1 = a2 + Vector3.new(0, -a5, 0)
        local Pivot = if not a3 then u2:GetPivot() else v1
        local u37 = if not a3 then v1 else a2
        local u38 = 0
        u2:PivotTo(Pivot)
        u51[u2] = (RunService.Heartbeat:Connect(function(a1) -- Line: 103
            -- upvalues: u2 (val), u51 (upval), u38 (ref), GameState (upval), a4 (upval), TweenService (upval)
            -- upvalues: a3 (upval), u50 (upval), Pivot (val), u37 (val)
            local v1
            if not u2.Parent then
                v1 = u2
                local v2 = u51[v1]
                if v2 then
                    v2:Disconnect()
                    u51[v1] = nil
                end
                return
            end
            u38 = u38 + a1 * (GameState.TimeScale or 1)
            v1 = math.clamp(u38 / a4, 0, 1)
            local Value = TweenService:GetValue(v1, Enum.EasingStyle.Sine, if not a3 then Enum.EasingDirection.In else Enum.EasingDirection.Out)
            local v3 = (1 - v1) * 0.18
            local v4 = Vector3.new(u50:NextNumber(-v3, v3), u50:NextNumber(-v3, v3), (u50:NextNumber(-v3, v3)))
            local v5 = CFrame.Angles(
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1)
            )
            u2:PivotTo((Pivot:Lerp(u37, Value)) * (CFrame.new(v4)) * v5)
            if v1 >= 1 then
                u2:PivotTo(u37)
                local v6 = u2
                local v7 = u51[v6]
                if v7 then
                    v7:Disconnect()
                    u51[v6] = nil
                end
            end
        end))
    end)
end

Shrines:onEvent("Activated", function(a1, a2) -- Line: 138 -- upvalues: EasySound (val), Shaker (val) -- types: a1: vector, a2: string?
    if typeof(a2) == "string" and a2 ~= "" then
        EasySound.Play({volume = 1, destroyOnEnd = true, timeScaled = false, id = a2})
    end
    Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5, {radius = 140, position = a1})
end)
Shrines:onEvent("Intro", function(a1, a2, a3, a4) -- Line: 149
    -- upvalues: waitForShrine (val), u51 (val), RunService (val), GameState (val), TweenService (val), u50 (val)
    local u4 = a3
    local u5 = a4
    local spawn = task.spawn
    local u7 = true
    spawn(function() -- Line: 85
        -- upvalues: waitForShrine (upval), a1 (val), u51 (upval), u4 (ref), u5 (ref), a2 (val), u7 (val)
        -- upvalues: RunService (upval), GameState (upval), TweenService (upval), u50 (upval)
        local u2 = waitForShrine(a1)
        if not u2 then
            return
        end
        local v1 = u51[u2]
        if v1 then
            v1:Disconnect()
            u51[u2] = nil
        end
        u4 = math.max(u4 or 1, 0.05)
        u5 = math.max(u5 or 8, 0)
        v1 = a2 + Vector3.new(0, -u5, 0)
        local Pivot = if not u7 then u2:GetPivot() else v1
        local u37 = if not u7 then v1 else a2
        local u38 = 0
        u2:PivotTo(Pivot)
        u51[u2] = (RunService.Heartbeat:Connect(function(a1) -- Line: 103
            -- upvalues: u2 (val), u51 (upval), u38 (ref), GameState (upval), u4 (upval), TweenService (upval)
            -- upvalues: u7 (upval), u50 (upval), Pivot (val), u37 (val)
            local v1
            if not u2.Parent then
                v1 = u2
                local v2 = u51[v1]
                if v2 then
                    v2:Disconnect()
                    u51[v1] = nil
                end
                return
            end
            u38 = u38 + a1 * (GameState.TimeScale or 1)
            v1 = math.clamp(u38 / u4, 0, 1)
            local Value = TweenService:GetValue(v1, Enum.EasingStyle.Sine, if not u7 then Enum.EasingDirection.In else Enum.EasingDirection.Out)
            local v3 = (1 - v1) * 0.18
            local v4 = Vector3.new(u50:NextNumber(-v3, v3), u50:NextNumber(-v3, v3), (u50:NextNumber(-v3, v3)))
            local v5 = CFrame.Angles(
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1)
            )
            u2:PivotTo((Pivot:Lerp(u37, Value)) * (CFrame.new(v4)) * v5)
            if v1 >= 1 then
                u2:PivotTo(u37)
                local v6 = u2
                local v7 = u51[v6]
                if v7 then
                    v7:Disconnect()
                    u51[v6] = nil
                end
            end
        end))
    end)
end)
Shrines:onEvent("Outro", function(a1, a2, a3, a4) -- Line: 156
    -- upvalues: waitForShrine (val), u51 (val), RunService (val), GameState (val), TweenService (val), u50 (val)
    local u4 = a3
    local u5 = a4
    local spawn = task.spawn
    local u7 = false
    spawn(function() -- Line: 85
        -- upvalues: waitForShrine (upval), a1 (val), u51 (upval), u4 (ref), u5 (ref), a2 (val), u7 (val)
        -- upvalues: RunService (upval), GameState (upval), TweenService (upval), u50 (upval)
        local u2 = waitForShrine(a1)
        if not u2 then
            return
        end
        local v1 = u51[u2]
        if v1 then
            v1:Disconnect()
            u51[u2] = nil
        end
        u4 = math.max(u4 or 1, 0.05)
        u5 = math.max(u5 or 8, 0)
        v1 = a2 + Vector3.new(0, -u5, 0)
        local Pivot = if not u7 then u2:GetPivot() else v1
        local u37 = if not u7 then v1 else a2
        local u38 = 0
        u2:PivotTo(Pivot)
        u51[u2] = (RunService.Heartbeat:Connect(function(a1) -- Line: 103
            -- upvalues: u2 (val), u51 (upval), u38 (ref), GameState (upval), u4 (upval), TweenService (upval)
            -- upvalues: u7 (upval), u50 (upval), Pivot (val), u37 (val)
            local v1
            if not u2.Parent then
                v1 = u2
                local v2 = u51[v1]
                if v2 then
                    v2:Disconnect()
                    u51[v1] = nil
                end
                return
            end
            u38 = u38 + a1 * (GameState.TimeScale or 1)
            v1 = math.clamp(u38 / u4, 0, 1)
            local Value = TweenService:GetValue(v1, Enum.EasingStyle.Sine, if not u7 then Enum.EasingDirection.In else Enum.EasingDirection.Out)
            local v3 = (1 - v1) * 0.18
            local v4 = Vector3.new(u50:NextNumber(-v3, v3), u50:NextNumber(-v3, v3), (u50:NextNumber(-v3, v3)))
            local v5 = CFrame.Angles(
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1),
                (u50:NextNumber(-0.04, 0.04)) * (1 - v1)
            )
            u2:PivotTo((Pivot:Lerp(u37, Value)) * (CFrame.new(v4)) * v5)
            if v1 >= 1 then
                u2:PivotTo(u37)
                local v6 = u2
                local v7 = u51[v6]
                if v7 then
                    v7:Disconnect()
                    u51[v6] = nil
                end
            end
        end))
    end)
end)
for i, j in CollectionService:GetTagged("Shrine") do
    if j:IsA("Model") and not u52[j] then
        u52[j] = (ShrineBillboardMount.mount(j))
    end
end
;(CollectionService:GetInstanceAddedSignal("Shrine")):Connect(function(a1) -- Line: 167 -- upvalues: u52 (val), ShrineBillboardMount (val)
    if a1:IsA("Model") then
        if u52[a1] then
            return
        end
        u52[a1] = (ShrineBillboardMount.mount(a1))
    end
end)
;(CollectionService:GetInstanceRemovedSignal("Shrine")):Connect(function(a1) -- Line: 173 -- upvalues: u51 (val), u52 (val)
    if a1:IsA("Model") then
        local v1 = u51[a1]
        if v1 then
            v1:Disconnect()
            u51[a1] = nil
        end
        v1 = u52[a1]
        if not v1 then
            return
        end
        u52[a1] = nil
        v1()
    end
end)
return nil