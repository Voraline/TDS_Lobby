-- Script path: ReplicatedStorage.Content.Tower.Snowballer.Animator
-- Decompile time: 2.39 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local CurrentCamera = workspace.CurrentCamera
local u28 = Random.new()
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 13
    -- upvalues: CurrentCamera (val), u28 (val), spr (val), EmitterManager (val), ItemDrop (val)
    a1._markerEffect = {
        ShowSnowball = function() -- Line: 15 -- upvalues: a1 (val)
            local Ammo = a1.Model.Weapon:WaitForChild("Weapon"):FindFirstChild("Ammo")
            if Ammo then
                Ammo.Transparency = 0
            end
        end,
        HideSnowball = function() -- Line: 22 -- upvalues: a1 (val)
            local Ammo = a1.Model.Weapon:WaitForChild("Weapon"):FindFirstChild("Ammo")
            if Ammo then
                Ammo.Transparency = 1
            end
        end,
    }
    a1.Executables = {
        Projectile = function(a1_2) -- Line: 32
            -- upvalues: a1 (val), CurrentCamera (upval), u28 (upval), spr (upval), EmitterManager (upval)
            -- upvalues: ItemDrop (upval)
            local v1
            local goal = a1_2.goal
            a1:Face(goal)
            local delay = a1_2.delay
            if delay then
                v1 = math.max(delay - ((workspace:GetServerTimeNow()) - a1_2.serverTime), 0)
                a1:Animate("Windup")
                a1:Wait(v1)
            end
            v1 = a1:Animate("Fire")
            if (a1.Replicator:Get("Upgrade")) < 3 then
                a1:_trackAnimationEvents(v1)
            end
            local Weapon = a1.Model.Weapon:WaitForChild("Weapon")
            local u55 = Weapon.Ammo:Clone()
            u55.Parent = CurrentCamera
            u55.Anchored = true
            for i, v in ipairs(u55:GetDescendants()) do
                if v:IsA("WeldConstraint") then
                    v:Destroy()
                elseif v:IsA("Trail") then
                    v.Enabled = true
                end
            end
            local Handle = Weapon:FindFirstChild("Handle")
            local Position = Handle and Handle.Start.WorldCFrame.Position or Weapon.Ammo.Position
            local u86 = u28:NextNumber()
            if Handle then
                local Size = u55.Size
                u55.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
                spr.target(u55, 0.6, 2, {Size = Size})
                local Start = Handle.Start
                EmitterManager.manualEmit(Start)
                local Fire = Handle.Fire
            end
            ;(ItemDrop.Drop(Position, goal, u55, a1_2.dtMultiplier, a1_2.gravity, a1_2.velocity, function(a1, a2, a3) -- Line: 92 -- upvalues: u86 (val) -- types: a1: number
                return ((CFrame.lookAt(a3, a2)) * CFrame.Angles(u86 - a1, 0, 0)).Rotation
            end)):andThen(function() -- Line: 95 -- upvalues: a1_2 (val), EmitterManager (upval), u55 (val)
                if not (4 <= a1_2.radius) then
                    EmitterManager.Emit("SnowballHit", u55.CFrame, a1_2.radius * 0.5)
                else
                    EmitterManager.Emit("SnowballAoeBlast", u55.CFrame)
                end
                u55:Destroy()
            end)
        end,
    }
end

function v1._trackAnimationEvents(a1, a2) -- Line: 109 -- types: a1: table, a2: userdata
    local u2 = {}

    local function cleanUp() -- Line: 112 -- upvalues: u2 (val)
        for k, v in pairs(u2) do
            v:Disconnect()
        end
    end

    u2.Marker = (a2:GetMarkerReachedSignal("Effect")):Connect(function(a1_2) -- Line: 120 -- upvalues: a1 (val) -- types: a1_2: string
        local v1 = a1._markerEffect[a1_2]
        if v1 then
            v1()
        end
    end)
    u2.Ended = a2.Ended:Connect(cleanUp)
    u2.Stopped = a2.Stopped:Connect(cleanUp)
end

return v1