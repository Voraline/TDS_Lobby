-- Script path: ReplicatedStorage.Shared.Modules.PlayerRegions
-- Decompile time: 2.21 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Octree = require(ReplicatedStorage.Shared.Modules.Octree)
local u15 = {}
local u16 = {}
local u17 = false
local u19 = Octree.new()
u19._maxRegionSize = {32, 0, 32}
local u24 = {UPDATE_FREQUENCY = 0.1}

function u24.findPlayersNearPosition(a1, a2, a3) -- Line: 36
    -- upvalues: u19 (val)
    return (u19:RadiusSearch(Vector3.new(a1.X, 0, a1.Z), a2, a3))
end

function u24.findPlayersNearModel(a1, a2, a3) -- Line: 49
    -- upvalues: u24 (val)
    local v1 = {}
    if a1.PrimaryPart then
        v1 = u24.findPlayersNearPosition(a1.PrimaryPart.Position, a2, a3)
    end
    return v1
end

function u24.findPlayersNearPlayer(a1, a2, a3) -- Line: 68
    -- upvalues: u24 (val)
    if not a1.Character then
        return {}
    end
    local v1 = {}
    for i, j in u24.findPlayersNearModel(a1.Character, a2, a3) do
        if j ~= a1 then
            table.insert(v1, j)
        end
    end
    return v1
end

function u24.findPlayersOnScreen(a1, a2) -- Line: 91 -- upvalues: u24 (val) -- types: a1: number, a2: number
    local Character, v1
    local CurrentCamera = workspace.CurrentCamera
    if not CurrentCamera then
        return {}
    end
    local v2 = {}
    local v3 = u24.findPlayersNearPosition(CurrentCamera.CFrame.Position, a1, a2)
    local ViewportSize = CurrentCamera.ViewportSize
    for i, j in v3 do
        Character = j.Character
        if Character then
            v1 = CurrentCamera:WorldToViewportPoint((Character:GetPivot()).Position)
            if 0 <= v1.X and v1.X <= ViewportSize.X and 0 <= v1.Y and v1.Y <= ViewportSize.Y and 0 <= v1.Z then
                table.insert(v2, j)
            end
        end
    end
    return v2
end

function u24.init() -- Line: 129 -- upvalues: u17 (ref), Players (val), u15 (val), u16 (val)
    if u17 then
        return
    end
    u17 = true
    Players.PlayerRemoving:Connect(function(a1) -- Line: 136 -- upvalues: u15 (upval), u16 (upval)
        if u15[a1] then
            u15[a1]:Destroy()
            u15[a1] = nil
        end
        u16[a1] = nil
    end)
end

task.spawn(function() -- Line: 150 -- upvalues: Players (val), u16 (val), u15 (val), u19 (val), u24 (val)
    local Position, v1
    while true do
        for i, j in Players:GetPlayers() do
            if j.Character then
                Position = j.Character:GetPivot().Position
                if u16[j] ~= Position then
                    u16[j] = Position
                    v1 = u15[j]
                    if v1 then
                        v1:SetPosition(Position)
                    else
                        v1 = u19:CreateNode(Vector3.new(Position.X, 0, Position.Z), j)
                        u15[j] = v1
                    end
                end
            end
        end
        task.wait(u24.UPDATE_FREQUENCY)
    end
end)
task.spawn(u24.init)
return u24