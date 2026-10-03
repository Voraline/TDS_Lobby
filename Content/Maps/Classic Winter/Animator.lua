-- Script path: ReplicatedStorage.Content.Maps.Classic Winter.Animator
-- Decompile time: 5.17 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local u31 = nil
local Map = Network.Channel("Map")
local u35 = 0
local u36 = nil
local u37 = {}
local u38 = {}
local u40 = OverlapParams.new()
local u41 = {}
local v1 = Color3.fromRGB(20, 16, 6)
local v2 = Color3.fromRGB(11, 28, 35)
u41[1] = v1
u41[2] = v2
u41[3] = Color3.fromRGB(6, 0, 0)
local ClockTime = game.Lighting.ClockTime

local function createExplosion(a1) -- Line: 27 -- upvalues: GameState (val), Create (val) -- types: a1: vector
    local Explosion = Instance.new("Explosion")
    Explosion.TimeScale = GameState.TimeScale
    Explosion.Position = a1
    Explosion.BlastPressure = 0
    Explosion.BlastRadius = 0
    Explosion.DestroyJointRadiusPercent = 0
    Explosion.ExplosionType = Enum.ExplosionType.NoCraters
    local u14 = Create("Part", {
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Size = Vector3.new(1, 1, 1),
        Position = a1,
        Parent = workspace,
    })
    local u18 = Create("Sound", {SoundId = "rbxassetid://12221984", Volume = 0.1, Parent = u14})
    u18:Play()
    u18.Ended:Connect(function() -- Line: 54 -- upvalues: u14 (val), u18 (val)
        u14:Destroy()
        u18:Destroy()
    end)
    Explosion.Parent = workspace
end

local function corrupt() -- Line: 62
    -- upvalues: u36 (ref), u35 (ref), u40 (val), u37 (ref), TweenService (val), u41 (val)
    local v1, v2, v3, v4
    for i, j in (workspace:GetPartBoundsInRadius(u36, u35, u40)) do
        if not u37[j] then
            v2 = u37
            v3 = {Color = j.Color}
            v2[j] = v3
            v2 = TweenService
            v4 = TweenInfo.new(5)
            v1 = {Color = u41[math.random(1, #u41)]}
            v2:Create(j, v4, v1):Play()
        end
    end
end

local function flingTrees() -- Line: 77
    -- upvalues: u36 (ref), u35 (ref), u40 (val), u31 (ref), u38 (ref), TimescaleUtilities (val), createExplosion (val)
    -- upvalues: TweenService (val), Create (val)
    local Trees
    for i, j in (workspace:GetPartBoundsInRadius(u36, u35, u40)) do
        Trees = u31.Environment:FindFirstChild("Trees", true)
        if j:IsDescendantOf(Trees) and not u38[j] then
            TimescaleUtilities.Wait(0.02)
            createExplosion(j.Position)
            u38[j] = true
            local u40_2 = j:Clone()
            u40_2.Parent = workspace
            u40_2.AssemblyLinearVelocity = Vector3.new(math.random(-10, 10), math.random(10, 20) * 2, (math.random(-10, 10)))
            u40_2.AssemblyAngularVelocity = Vector3.new(math.random(-10, 10), math.random(-10, 10), (math.random(-10, 10)))
            TweenService:Create(u40_2, TweenInfo.new(5), {Transparency = 1, Size = u40_2.Size * 0.4}):Play()
            u40_2.Anchored = false
            u40_2.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Glass)
            Create("BodyForce", {Force = Vector3.new(0, 50, 0), Parent = u40_2})
            j.CanCollide = false
            j.CanQuery = false
            j.Transparency = 1
            TimescaleUtilities.Delay(5, function() -- Line: 111 -- upvalues: u40_2 (val)
                u40_2:Destroy()
            end)
        end
    end
end

local u63 = {}
local v3 = {
    wave = 2,
    run = function() -- Line: 121 -- upvalues: u35 (ref), corrupt (val)
        u35 = 10
        corrupt()
    end,
}
local v4 = {
    wave = 3,
    run = function() -- Line: 129 -- upvalues: u35 (ref), corrupt (val)
        u35 = 15
        corrupt()
    end,
}
local v5 = {
    wave = 4,
    run = function() -- Line: 137 -- upvalues: u35 (ref), corrupt (val)
        u35 = 20
        corrupt()
    end,
}
local v6 = {
    wave = 5,
    run = function() -- Line: 145 -- upvalues: u35 (ref), corrupt (val), TweenService (val)
        u35 = 35
        corrupt()
        TweenService:Create(game.Lighting, TweenInfo.new(10, Enum.EasingStyle.Linear), {ClockTime = 6.3}):Play()
    end,
}
local v7 = {
    wave = 6,
    run = function() -- Line: 159 -- upvalues: u35 (ref), corrupt (val)
        u35 = 45
        corrupt()
    end,
}
local v8 = {
    wave = 7,
    run = function() -- Line: 167 -- upvalues: u35 (ref), corrupt (val)
        u35 = 58
        corrupt()
    end,
}
local v9 = {
    wave = 8,
    run = function() -- Line: 174 -- upvalues: u35 (ref), corrupt (val)
        u35 = 65
        corrupt()
    end,
}
local v10 = {
    wave = 9,
    run = function() -- Line: 181 -- upvalues: u35 (ref), corrupt (val)
        u35 = 78
        corrupt()
    end,
}
local v11 = {
    wave = 10,
    run = function() -- Line: 188 -- upvalues: u35 (ref), corrupt (val)
        u35 = 83
        corrupt()
    end,
}
local v12 = {
    wave = 11,
    run = function() -- Line: 196 -- upvalues: u35 (ref), corrupt (val), flingTrees (val)
        u35 = 95
        corrupt()
        flingTrees()
    end,
}
local v13 = {
    wave = 12,
    run = function() -- Line: 205 -- upvalues: u35 (ref), corrupt (val), flingTrees (val)
        u35 = 120
        corrupt()
        flingTrees()
    end,
}
u63[1] = v3
u63[2] = v4
u63[3] = v5
u63[4] = v6
u63[5] = v7
u63[6] = v8
u63[7] = v9
u63[8] = v10
u63[9] = v11
u63[10] = v12
u63[11] = v13

local function onWaveChange(a1, a2) -- Line: 213 -- upvalues: u63 (val)
    for i, j in u63 do
        if a1 == j.wave then
            task.spawn(j.run)
            if not a2 then
                break
            end
        end
    end
end

local function cancelEvents() -- Line: 224 -- upvalues: u37 (ref), u38 (ref), TweenService (val), ClockTime (val)
    local Position, Size, v1, v2
    for k, v in pairs(u37) do
        k.Color = v.Color
    end
    for k2, i in pairs(u38) do
        Position = k2.Position
        Size = k2.Size
        k2.Position = k2.Position - Vector3.new(0, 50, 0)
        k2.Size = Size * 0.5
        v2 = TweenService
        v1 = TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
        v2:Create(k2, v1, {Transparency = 0, Position = Position, Size = Size}):Play()
    end
    TweenService:Create(game.Lighting, TweenInfo.new(2, Enum.EasingStyle.Linear), {ClockTime = ClockTime}):Play()
    u37 = {}
    u38 = {}
end

return function(a1, a2) -- Line: 255
    -- upvalues: u31 (ref), u36 (ref), u40 (val), Map (val), onWaveChange (val), GameState (val), u63 (val)
    u31 = a1
    u36 = u31.Environment.Portal:GetPivot().Position
    u40.FilterDescendantsInstances = {u31.Environment, workspace:WaitForChild("Cliff")}
    u40.FilterType = Enum.RaycastFilterType.Include
    a2:Mark((Map:On("TransitionScene", onWaveChange)))
    local Wave = GameState.Wave
    if Wave and Wave > 0 then
        for i = 1, Wave do
            for j, k in u63 do
                if i == k.wave then
                    task.spawn(k.run)
                end
            end
        end
    end
end