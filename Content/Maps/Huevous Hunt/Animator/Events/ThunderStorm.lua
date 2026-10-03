-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator.Events.ThunderStorm
-- Decompile time: 3.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u35 = {data = {}}
local u37 = {}
u37[1] = (Color3.fromRGB(0, 170, 255))
u37[2] = Color3.fromRGB(160, 76, 255)
local u49 = Random.new()
local u50 = nil

local function lerp(a1, a2, a3) -- Line: 22
    return a1 + (a2 - a1) * a3
end

local function tween(a1, a2, a3, a4, a5, a6) -- Line: 26
    -- upvalues: u50 (ref), RunService (val), GameState (val), TweenService (val)
    local u6 = 0
    local u7 = a2[a3]
    if u50 then
        u50:Disconnect()
    end
    u50 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 34
        -- upvalues: u6 (ref), GameState (upval), a1 (val), TweenService (upval), a5 (val), a6 (val), a2 (val), a3 (val)
        -- upvalues: u7 (val), a4 (val), u50 (upval)
        u6 = u6 + a1_2 * GameState.TimeScale / a1
        local Value = TweenService:GetValue(u6, a5, a6)
        local v1 = u7
        a2[a3] = v1 + (a4 - v1) * Value
        if Value >= 1 then
            u50:Disconnect()
        end
    end)
end

local function ShootLighting() -- Line: 46
    -- upvalues: u35 (val), u49 (val), u37 (val), Laser (val), EmitterManager (val)
    local v1 = u35.map:GetExtentsSize() / 2
    local Position = u35.map:GetBoundingBox().Position
    local X = Position.X
    local Z = Position.Z
    local v2 = Vector3.new(X + u49:NextNumber(-v1.X, v1.X), 200, Z + (u49:NextNumber(-v1.Z, v1.Z)))
    local v3 = workspace:Raycast(v2, (Vector3.new(-0, -210, -0)))
    if not v3 then
        return
    end
    local v4 = v3.Position + Vector3.new(u49:NextNumber(-4, 4), 0, (u49:NextNumber(-4, 4)))
    Laser:Lightning({
        Lifetime = 0.8,
        minWidth = 0.1,
        maxWidth = 2,
        Bursts = 1,
        Color = u37[math.random(1, #u37)],
        Start = v2,
        End = v4,
        Offset = Random.new():NextNumber(4, 8),
    })
    EmitterManager.Emit("EnergyExplosion", CFrame.new(v4), 6)
end

function u35.rewind(a1) -- Line: 82 -- upvalues: u50 (ref), RunService (val), GameState (val), TweenService (val)
    local Clouds = workspace.Terrain:FindFirstChild("Clouds")
    if Clouds then
        local Quad = Enum.EasingStyle.Quad
        local InOut = Enum.EasingDirection.InOut
        local u9 = 0
        local Cover = Clouds.Cover
        if u50 then
            u50:Disconnect()
        end
        local RenderStepped = RunService.RenderStepped
        local u18 = 3
        local u19 = "Cover"
        local u20 = 0
        u50 = RenderStepped:Connect(function(a1) -- Line: 34
            -- upvalues: u9 (ref), GameState (upval), u18 (val), TweenService (upval), Quad (val), InOut (val)
            -- upvalues: Clouds (val), u19 (val), Cover (val), u20 (val), u50 (upval)
            u9 = u9 + a1 * GameState.TimeScale / u18
            local Value = TweenService:GetValue(u9, Quad, InOut)
            local v1 = Cover
            Clouds[u19] = v1 + (u20 - v1) * Value
            if Value >= 1 then
                u50:Disconnect()
            end
        end)
        task.delay(3, function() -- Line: 86 -- upvalues: Clouds (val)
            Clouds:Destroy()
        end)
    end
    if a1._thread then
        task.cancel(a1._thread)
    end
end

function u35.start(a1) -- Line: 95
    -- upvalues: u50 (ref), RunService (val), GameState (val), TweenService (val), TimescaleUtilities (val)
    -- upvalues: ShootLighting (val), u49 (val)
    local Clouds = Instance.new("Clouds")
    Clouds.Density = 0.11
    Clouds.Color = Color3.fromRGB(4, 13, 37)
    Clouds.Cover = 0
    Clouds.Parent = workspace.Terrain
    local Quad = Enum.EasingStyle.Quad
    local InOut = Enum.EasingDirection.InOut
    local u15 = 0
    local Cover = Clouds.Cover
    if u50 then
        u50:Disconnect()
    end
    local RenderStepped = RunService.RenderStepped
    local u24 = 3
    local u25 = "Cover"
    local u26 = 0.9
    u50 = RenderStepped:Connect(function(a1) -- Line: 34
        -- upvalues: u15 (ref), GameState (upval), u24 (val), TweenService (upval), Quad (val), InOut (val)
        -- upvalues: Clouds (val), u25 (val), Cover (val), u26 (val), u50 (upval)
        u15 = u15 + a1 * GameState.TimeScale / u24
        local Value = TweenService:GetValue(u15, Quad, InOut)
        local v1 = Cover
        Clouds[u25] = v1 + (u26 - v1) * Value
        if Value >= 1 then
            u50:Disconnect()
        end
    end)
    a1._thread = task.spawn(function() -- Line: 105 -- upvalues: TimescaleUtilities (upval), ShootLighting (upval), u49 (upval)
        TimescaleUtilities.Wait(3)
        while true do
            ShootLighting()
            TimescaleUtilities.Wait(u49:NextNumber(0.1, 1))
        end
    end)
end

return u35