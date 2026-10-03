-- Script path: ReplicatedStorage.Content.Maps.Classic Castle.Animator.Events.Explosion
-- Decompile time: 2.19 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local u16 = {}
local u17 = {}
local u18 = {}
local u19 = {}

local function createExplosion(a1) -- Line: 12 -- upvalues: GameState (val) -- types: a1: vector
    local Explosion = Instance.new("Explosion")
    Explosion.TimeScale = GameState.TimeScale
    Explosion.Position = a1
    Explosion.BlastPressure = 0
    Explosion.BlastRadius = 0
    Explosion.DestroyJointRadiusPercent = 0
    Explosion.ExplosionType = Enum.ExplosionType.NoCraters
    Explosion.Parent = workspace
end

function u16.start(a1) -- Line: 25
    -- upvalues: u16 (val), u18 (ref), GameState (val), Create (val), u17 (ref), u19 (ref)
    local v1, v2, v3
    local v4 = {}
    local v5 = (u16.map.Environment:GetChildren())
    for i, j in v5 do
        if j.Name == "House" and not u18[j] then
            table.insert(v4, j)
        end
    end
    if #v4 == 0 then
        return
    end
    repeat
        v5 = v4[math.random(1, #v4)]
    until not u18[v5]
    u18[v5] = true
    local Pivot = v5:GetPivot()
    local Position = Pivot.Position
    local Explosion = Instance.new("Explosion")
    Explosion.TimeScale = GameState.TimeScale
    Explosion.Position = Position
    Explosion.BlastPressure = 0
    Explosion.BlastRadius = 0
    Explosion.DestroyJointRadiusPercent = 0
    Explosion.ExplosionType = Enum.ExplosionType.NoCraters
    Explosion.Parent = workspace
    local u50 = Create("Part", {
        CanCollide = false,
        Anchored = true,
        Transparency = 1,
        Size = Vector3.new(1, 1, 1),
        Position = Pivot.Position,
        Parent = workspace,
    })
    local u54 = Create("Sound", {SoundId = "rbxassetid://12221984", Volume = 1.2, Parent = u50})
    u54:Play()
    u54.Ended:Connect(function() -- Line: 67 -- upvalues: u50 (val), u54 (val)
        u50:Destroy()
        u54:Destroy()
    end)
    local v6 = {}
    for k, n in v5:GetDescendants() do
        table.insert(u17, n)
        table.insert(v6, (n:Clone()))
        n.Transparency = 1
        n.CanCollide = false
    end
    for m, i5 in v6 do
        i5.Parent = workspace
        v1 = math.random(-10, 10)
        v2 = math.random(10, 20) * 1.25
        v3 = math.random(-10, 10)
        i5.AssemblyLinearVelocity = Vector3.new(v1, v2, v3)
        v1 = math.random(-10, 10)
        v2 = math.random(-10, 10)
        v3 = math.random(-10, 10)
        i5.AssemblyAngularVelocity = Vector3.new(v1, v2, v3)
        i5.CustomPhysicalProperties = PhysicalProperties.new(Enum.Material.Rubber)
        i5.Anchored = false
        Create("BodyForce", {Force = Vector3.new(0, 70, 0), Parent = i5})
        table.insert(u19, i5)
    end
end

function u16.rewind(a1) -- Line: 103 -- upvalues: u17 (ref), u19 (ref), u18 (ref)
    for i, j in u17 do
        j.Transparency = 0
        j.CanCollide = true
    end
    for k, n in u19 do
        n:Destroy()
    end
    u19 = {}
    u18 = {}
    u17 = {}
end

return u16