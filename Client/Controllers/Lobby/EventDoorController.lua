-- Script path: ReplicatedStorage.Client.Controllers.Lobby.EventDoorController
-- Decompile time: 3.51 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SoundService = game:GetService("SoundService")
local FFlagController = require(ReplicatedStorage.Client.Controllers.Shared.FFlagController)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local v1 = {}
local u23 = nil
local u24 = nil
FFlagController.get("event.active", false)

local function playDoorSound(a1, a2) -- Line: 28
    -- upvalues: u24 (ref), SoundService (val)
    if u24 then
        u24:Destroy()
        u24 = nil
    end
    local Sound = Instance.new("Sound")
    Sound.SoundId = a2
    Sound.Volume = 1
    Sound.SoundGroup = SoundService:FindFirstChild("Ambience")
    Sound.Parent = a1
    Sound.Ended:Connect(function() -- Line: 40 -- upvalues: Sound (val)
        Sound:Destroy()
    end)
    Sound:Play()
    u24 = Sound
end

local function openDoor(a1) -- Line: 48 -- upvalues: playDoorSound (val), u23 (ref), spr (val) -- types: a1: table
    playDoorSound(a1.stone, "rbxassetid://80380698692499")
    u23 = task.delay(0.5, function() -- Line: 50 -- upvalues: spr (upval), a1 (val)
        spr.target(a1.upper, 0.8, 1, {Pivot = a1.upperStartCFrame * CFrame.new(0, 16, 0)})
        spr.target(a1.lower, 0.8, 1, {Pivot = a1.lowerStartCFrame * CFrame.new(0, -18, 0)})
    end)
    spr.target(a1.stone, 0.8, 1, {CFrame = a1.stoneStartCFrame * CFrame.new(0, -32.5, 0)})
end

local function closeDoor(a1) -- Line: 57 -- upvalues: playDoorSound (val), u23 (ref), spr (val) -- types: a1: table
    playDoorSound(a1.stone, "rbxassetid://97308089869488")
    u23 = task.delay(0.5, function() -- Line: 59 -- upvalues: spr (upval), a1 (val)
        spr.target(a1.upper, 0.8, 0.7, {Pivot = a1.upperStartCFrame})
        spr.target(a1.lower, 0.8, 0.7, {Pivot = a1.lowerStartCFrame})
    end)
    spr.target(a1.stone, 1, 1, {CFrame = a1.stoneStartCFrame})
end

local function toggleDoor(a1, a2) -- Line: 66
    -- upvalues: spr (val), u23 (ref), openDoor (val), closeDoor (val)
    spr.stop(a1.upper, "Pivot")
    spr.stop(a1.lower, "Pivot")
    spr.stop(a1.stone, "CFrame")
    if u23 then
        task.cancel(u23)
        u23 = nil
    end
    local v1 = {a1.lower, a1.upper}
    local v2 = nil
    local v3 = nil
    local v4, v5 = a2, a1
    for i, j in v1, v2, v3 do
        for k, n in j:GetDescendants() do
            if n:IsA("BasePart") then
                n.CanCollide = not v4
            end
        end
    end
    if v4 then
        openDoor(v5)
        return
    end
    closeDoor(v5)
end

function v1.init() end

task.spawn(v1.init)
return v1