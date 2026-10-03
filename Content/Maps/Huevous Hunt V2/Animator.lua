-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt V2.Animator
-- Decompile time: 7.96 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Laser = require(ReplicatedStorage.Client.Modules.Laser)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local SpreadCorruption = require(script.Parent.Events:WaitForChild("SpreadCorruption"))
local TreeReplace = require(script.Parent.Events:WaitForChild("TreeReplace"))
local Map = NewNetwork.Channel("Map")
local u68 = OverlapParams.new()
u68.FilterType = Enum.RaycastFilterType.Include
local u70 = false
local u73 = Random.new(5)
local u74 = nil
local u75 = nil
local u76 = {}
local u77 = {}

local function bezier(a1, a2, a3, a4) -- Line: 27
    return (1 - a4) ^ 2 * a1 + 2 * (1 - a4) * a4 * a2 + a4 ^ 2 * a3
end

local function ShootLighting() -- Line: 31 -- upvalues: u75 (ref), u73 (val), Laser (val), EmitterManager (val)
    local v1 = {Color3.fromRGB(0, 170, 255), (Color3.fromRGB(160, 76, 255))}
    local v2 = u75.Ray.Size / 2
    local Position = u75.Ray.Position
    local X = Position.X
    local Z = Position.Z
    local v3 = Vector3.new(X + u73:NextNumber(-v2.X, v2.X), Position.Y, Z + (u73:NextNumber(-v2.Z, v2.Z)))
    local v4 = workspace:Raycast(v3, (Vector3.new(-0, -210, -0)))
    if not v4 then
        return
    end
    local v5 = v4.Position + Vector3.new(u73:NextNumber(-4, 4), 0, (u73:NextNumber(-4, 4)))
    Laser:Lightning({
        Lifetime = 0.8,
        minWidth = 0.1,
        maxWidth = 2,
        Bursts = 1,
        Color = v1[math.random(1, #v1)],
        Start = Vector3.new(v3.X, 300, v3.Z),
        End = v5,
        Offset = Random.new():NextNumber(4, 8),
    })
    EmitterManager.Emit("EnergyExplosion", CFrame.new(v5), 6)
end

local function reset() -- Line: 72
    -- upvalues: u70 (ref), SpreadCorruption (val), u77 (ref), u76 (ref), TweenService (val)
    local v1, v2
    u70 = false
    SpreadCorruption:rewind()
    for i, j in u77 do
        task.cancel(j)
    end
    for k, n in u76 do
        if typeof(n) == "number" then
            v1 = TweenService
            v2 = TweenInfo.new(2)
            v1:Create(k, v2, {Transparency = n}):Play()
        elseif typeof(n) == "function" then
            n()
        end
    end
    u76 = {}
    u77 = {}
end

local function storm() -- Line: 94 -- upvalues: u77 (ref), ShootLighting (val)
    if not u77.Lightning then
        u77.Lightning = task.spawn(function() -- Line: 96 -- upvalues: ShootLighting (upval)
            while true do
                ShootLighting()
                task.wait(Random.new():NextNumber(0.5, 1.5))
            end
        end)
    end
end

local function dome() -- Line: 105
    -- upvalues: u76 (ref), TweenService (val), u75 (ref), Lighting (val), RunService (val), GameState (val)
    if not u76.Dome then
        local u11 = TweenService:Create(u75.InnerParticleDome, TweenInfo.new(10), {Transparency = 0})
        u11:Play()
        TweenService:Create(Lighting, TweenInfo.new(10), {ClockTime = 0}):Play()
        local u32 = RunService.Heartbeat:Connect(function(a1) -- Line: 117 -- upvalues: u75 (upval), GameState (upval)
            local InnerParticleDome = u75.InnerParticleDome
            InnerParticleDome.CFrame = InnerParticleDome.CFrame * CFrame.Angles(0, math.rad(a1 * 90 * GameState.TimeScale), 0)
        end)

        function u76.Dome() -- Line: 125
            -- upvalues: u32 (val), TweenService (upval), Lighting (upval), u11 (val), u75 (upval)
            u32:Disconnect()
            TweenService:Create(Lighting, TweenInfo.new(1), {ClockTime = 14}):Play()
            u11:Cancel()
            TweenService:Create(u75.InnerParticleDome, TweenInfo.new(1), {Transparency = 1}):Play()
        end
    end
end

local function onWaveChange(a1, a2) -- Line: 140
    -- upvalues: u77 (ref), ShootLighting (val), SpreadCorruption (val), u74 (ref), u75 (ref), dome (val), u70 (ref)
    -- upvalues: u76 (ref), RunService (val), u68 (val), TweenService (val)
    local Transparency, v1, v2, v3
    if a2 >= 30 and not u77.Lightning then
        u77.Lightning = task.spawn(function() -- Line: 96 -- upvalues: ShootLighting (upval)
            while true do
                ShootLighting()
                task.wait(Random.new():NextNumber(0.5, 1.5))
            end
        end)
    end
    if a1 % 1 == 0 then
        local v4 = nil
        while not v4 do
            if not (#SpreadCorruption.corruptedModels < u74) then
                break
            end
            v4 = (u75.Trees:GetChildren())[math.random(1, #u75.Trees:GetChildren())]
        end
        if v4 then
            SpreadCorruption:corruptModel(v4)
            SpreadCorruption:spinModel(v4)
        end
    end
    if a2 >= 28 then
        dome()
    end
    if a2 >= 20 and not u70 then
        local v5
        u70 = true
        for i, j in u75.CarBroken:GetChildren() do
            local u76_2 = u75.Car:FindFirstChild(j.Name)
            if not u76[j] then
                local CFrame = j.CFrame

                u76[j] = function() -- Line: 170 -- upvalues: j (val), CFrame (val), u76_2 (val)
                    j.CFrame = CFrame
                    j.Transparency = 0
                    j.CanCollide = true
                    u76_2.Transparency = 1
                end
            end
            if u76_2 then
                local Position = j.Position
                local u99 = Position + Vector3.new(math.random(-10, 10), math.random(4, 9), (math.random(-10, 10)))
                local Position_2 = u76_2.Position
                local u101 = 0
                local u102 = nil
                local Orientation = j.Orientation
                local u106 = u76_2.Orientation + Vector3.new(0, 360, 0)
                local u107 = Orientation
                local u114 = Random.new():NextNumber(0.8, 2.1)
                v5 = RunService.Heartbeat:Connect(function(a1) -- Line: 191
                    -- upvalues: u101 (ref), u114 (val), u102 (ref), j (val), u76_2 (val), Position (val), u99 (val)
                    -- upvalues: Position_2 (val), Orientation (ref), u107 (val), u106 (val)
                    u101 = u101 + a1 * u114
                    local v1 = math.clamp(u101, 0, 1)
                    if v1 == 1 then
                        u102:Disconnect()
                        j.Transparency = 1
                        j.CanCollide = false
                        u76_2.Transparency = 0
                    end
                    j.Position = (1 - v1) ^ 2 * Position + 2 * (1 - v1) * v1 * u99 + v1 ^ 2 * Position_2
                    Orientation = u107:Lerp(u106, v1)
                    j.Orientation = Orientation
                end)
            end
        end
    end
    local v6 = workspace:GetPartBoundsInRadius(u75.StartingPoint.Position, 10 + a1 ^ 1.675, u68)
    local v7 = nil
    local v8 = nil
    for k, n in v6, v7, v8 do
        Transparency = n.Transparency
        v1 = if n.Parent.Name ~= "Corrupted" then 1 else 0
        if not u76[n] then
            u76[n] = Transparency
        end
        v2 = TweenService
        v3 = TweenInfo.new(2)
        v2:Create(n, v3, {Transparency = v1}):Play()
    end
end

local function win() -- Line: 224
    -- upvalues: TweenService (val), u75 (ref), Lighting (val), Create (val), reset (val), TreeReplace (val)
    local v1, v2, v3
    for i, j in workspace.Ground.Ground:GetDescendants() do
        if j:IsA("BasePart") then
            if i % 4 == 0 then
                task.wait()
            end
            v1 = TweenService
            v2 = TweenInfo.new(6)
            v3 = {Color = Color3.fromRGB(7, math.random(90, 100), 40)}
            v1:Create(j, v2, v3):Play()
        end
    end
    for k, n in u75.Flowers:GetDescendants() do
        if n:IsA("BasePart") then
            v1 = TweenService
            v2 = TweenInfo.new(2)
            v1:Create(n, v2, {Transparency = 0}):Play()
        end
    end
    Lighting.MoreSuttleSky:Destroy()
    Create("SunRaysEffect", {Parent = Lighting})
    reset()
    TreeReplace:replace()
    TweenService:Create(u75.Neon, TweenInfo.new(3), {Color = Color3.fromRGB(59, 255, 134)}):Play()
end

return function(a1, a2) -- Line: 258
    -- upvalues: u75 (ref), u68 (val), u74 (ref), Map (val), dome (val), u77 (ref), ShootLighting (val)
    -- upvalues: SpreadCorruption (val), TreeReplace (val), win (val), onWaveChange (val), reset (val)
    u75 = a1
    u68.FilterDescendantsInstances = {a1:WaitForChild("Road")}
    u74 = #a1.Trees:GetChildren()
    a2:Mark((Map:onEvent("Lose", function() -- Line: 263
        -- upvalues: a1 (val), dome (upval), u77 (upval), ShootLighting (upval), SpreadCorruption (upval)
        for i, j in a1.Trees:GetChildren() do
            dome()
            if not u77.Lightning then
                u77.Lightning = task.spawn(function() -- Line: 96 -- upvalues: ShootLighting (upval)
                    while true do
                        ShootLighting()
                        task.wait(Random.new():NextNumber(0.5, 1.5))
                    end
                end)
            end
            SpreadCorruption:corruptModel(j)
            SpreadCorruption:spinModel(j)
        end
        SpreadCorruption:corruptEverything()
    end)))
    TreeReplace.map = a1
    SpreadCorruption.map = a1
    a2:Mark((Map:onEvent("Win", win)))
    a2:Mark((Map:onEvent("TransitionScene", onWaveChange)))
    a2:Mark((Map:onEvent("Reset", reset)))
end