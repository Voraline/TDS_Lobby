-- Script path: ReplicatedStorage.Client.Controllers.Shared.CogGearController
-- Decompile time: 3.51 ms

local paint
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameType = require(ReplicatedStorage.Shared.Modules.GameType)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local u20 = {}
local u21 = nil
local u22 = 0
local u23 = 0

local function snap(a1) -- Line: 30 -- types: a1: number
    local v1 = math.min(a1, 1) - 1
    return v1 * 1.9 * v1 * v1 + 1 + v1 * 0.9 * v1
end

local function elapsed() -- Line: 35 -- upvalues: u21 (ref), u23 (ref), u22 (ref)
    local v1 = u21
    if v1 and v1.IsPlaying then
        local TimePosition = v1.TimePosition
        if TimePosition < u23 - 1 then
            u22 = u22 + 1
        end
        u23 = TimePosition
        return u22 * v1.TimeLength + TimePosition
    end
    return workspace:GetServerTimeNow()
end

local function advance(a1) -- Line: 50 -- types: a1: number
    local v1 = math.floor(a1 / 0.5)
    local v2 = math.min((a1 - v1 * 0.5) / 0.18, 1) - 1
    return v1 + (v2 * 1.9 * v2 * v2 + 1 + v2 * 0.9 * v2)
end

local function meshes(a1, a2) -- Line: 55 -- types: a1: table, a2: table
    if (math.abs((a1.axis:Dot(a2.axis)))) < 0.9 then
        return false
    end
    local v1 = a2.part.Position - a1.part.Position
    local v2 = v1:Dot(a1.axis)
    local v3 = math.abs(v2)
    if (a1.part.Size.Y + a2.part.Size.Y) * 1.5 < v3 then
        return false
    end
    v3 = (a1.part.Size.X + a2.part.Size.X) / 2
    return (math.abs((v1 - a1.axis * v2).Magnitude / v3 - 1)) < 0.2
end

function paint(a1, a2, a3, a4) -- Line: 71
    -- upvalues: u20 (val), meshes (val), paint (val)
    a4[a1] = true
    local v1 = if not ((a1.axis:Dot(a3)) < 0) then 1 else -1
    a1.step = 5 / (a1.part.Size.X / 2) * 0.5 * a2 * v1
    for i, j in u20 do
        if not a4[j] and meshes(a1, j) then
            paint(j, -a2, a3, a4)
        end
    end
end

local function rebuild() -- Line: 84 -- upvalues: u20 (val), paint (val)
    local v1 = {}
    for i, j in u20 do
        if not v1[j] then
            paint(j, j.seed, j.axis, v1)
        end
    end
end

if GameType:IsA("Lobby") then
    task.spawn(function() -- Line: 94 -- upvalues: u21 (ref)
        u21 = (workspace:WaitForChild("Lobby")):WaitForChild("CogSoundPart"):WaitForChild("Sound")
    end)
end
RunService.Heartbeat:Connect(function() -- Line: 100 -- upvalues: u20 (val), u21 (ref), u23 (ref), u22 (ref)
    local v1, v2
    if next(u20) == nil then
        return
    end
    local v3 = u21
    if not v3 then
        v1 = workspace:GetServerTimeNow()
    elseif v3.IsPlaying then
        local TimePosition = v3.TimePosition
        if TimePosition < u23 - 1 then
            u22 = u22 + 1
        end
        u23 = TimePosition
        v1 = u22 * v3.TimeLength + TimePosition
    else
        v1 = workspace:GetServerTimeNow()
    end
    v3 = math.floor(v1 / 0.5)
    local v4 = math.min((v1 - v3 * 0.5) / 0.18, 1) - 1
    local v5 = v3 + (v4 * 1.9 * v4 * v4 + 1 + v4 * 0.9 * v4)
    for i, j in u20 do
        v2 = (v5 * j.step + j.offset) % 6.283185307179586
        j.part.CFrame = j.base * CFrame.Angles(0, v2, 0)
    end
end)
local v1 = {workspace}
TagObserver("CogGear", function(a1) -- Line: 113 -- upvalues: u20 (val), rebuild (val) -- types: a1: userdata
    if not a1:IsA("BasePart") then
        return function() end
    end
    local v1 = math.floor(a1.Position.X * 7 + a1.Position.Y * 13 + a1.Position.Z * 29)
    u20[a1] = {
        step = 0,
        part = a1,
        base = a1.CFrame,
        axis = a1.CFrame.UpVector,
        seed = if v1 % 2 ~= 0 then -1 else 1,
        offset = v1 % 360 / 360 * 6.283185307179586,
    }
    rebuild()
    return function() -- Line: 131 -- upvalues: u20 (upval), a1 (val), rebuild (upval)
        u20[a1] = nil
        rebuild()
    end
end, v1)
return nil