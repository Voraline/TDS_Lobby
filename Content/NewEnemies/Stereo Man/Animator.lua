-- Script path: ReplicatedStorage.Content.NewEnemies.Stereo Man.Animator
-- Decompile time: 2.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function scaleAnimationToTime(a1, a2, a3) -- Line: 10 -- types: a2: number, a3: number?
    local v1 = tick() + (a3 or 1)
    local Controller = a1.Controller
    while Controller.Length == 0 do
        if v1 < tick() then
            return
        end
        task.wait()
    end
    a1:AdjustSpeed(Controller.Length / a2)
end

local function createBall() -- Line: 22
    local Part = Instance.new("Part")
    Part.Size = Vector3.new(1, 1, 1)
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CastShadow = false
    return Part
end

local function createShockwave(a1, a2, a3) -- Line: 34
    -- upvalues: TweenService (val)
    local Model = Instance.new("Model")
    Model.Name = "Shockwave"
    Model.Parent = workspace.CurrentCamera
    local Part = Instance.new("Part")
    Part.Size = Vector3.new(1, 1, 1)
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    Part.Material = Enum.Material.Glass
    Part.Transparency = 1
    Part.Position = a1
    Part.Color = Color3.new(1, 1, 1)
    Part.Parent = Model
    local Highlight = Instance.new("Highlight")
    Highlight.Enabled = false
    Highlight.Parent = Part
    local Part_2 = Instance.new("Part")
    Part_2.Size = Vector3.new(1, 1, 1)
    Part_2.Shape = Enum.PartType.Ball
    Part_2.Anchored = true
    Part_2.CanCollide = false
    Part_2.CanQuery = false
    Part_2.CastShadow = false
    Part_2.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    Part_2.Material = Enum.Material.ForceField
    Part_2.Color = Color3.new(1, 1, 1)
    Part_2.Transparency = 0.5
    Part_2.Position = a1
    Part_2.Parent = Model
    local v1 = TweenInfo.new(a3)
    TweenService:Create(Part_2, v1, {Size = Vector3.new(1, 1, 1) * (a2 * 2)}):Play()
    local v2 = TweenService:Create(Part, v1, {Transparency = 2, Size = Vector3.new(1, 1, 1) * (a2 * 2)})
    v2:Play()
    v2.Completed:Once(function() -- Line: 70 -- upvalues: Model (val)
        Model:Destroy()
    end)
end

function v1.Initialize(a1) -- Line: 75
    -- upvalues: Animation (val), TweenService (val), scaleAnimationToTime (val), Shaker (val), createShockwave (val)
    local v1
    local PrimaryPart = a1.Model.PrimaryPart
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    local Animations = a1.Model:WaitForChild("Animations")
    local u13 = {}
    for i, j in Animations:GetChildren() do
        if j:IsA("Animation") then
            v1 = Animation.new({IgnorePriority = true, Track = j, Target = AnimationController})
            u13[j.Name] = v1
        end
    end

    local function hideShield() -- Line: 93 -- upvalues: a1 (val)
        a1.Model.Shield.Transparency = 1
    end

    if a1.Replicator:Get("Shield") == 0 then
        a1.Model.Shield.Transparency = 1
    end
    a1.Executables = {
        Death = function() -- Line: 102 -- upvalues: u13 (val)
            u13.Death:Play()
        end,
        ShieldBreak = function() -- Line: 105
            -- upvalues: a1 (val), u13 (val), PrimaryPart (val), TweenService (upval), scaleAnimationToTime (upval)
            -- upvalues: Shaker (upval), createShockwave (upval)
            local RecoveryTime = a1.Stats.RecoveryTime
            local Break = u13.Break
            local v1 = Break:Play()
            PrimaryPart.Sound:Play()
            ;(v1:GetMarkerReachedSignal("CloneShield")):Once(function() -- Line: 113 -- upvalues: a1 (upval), TweenService (upval)
                local TransformedWorldCFrame = a1.PrimaryPart["Lower Torso"]["Upper Torso"]["Left Upper Arm"]["Left Lower Arm"].Shield.TransformedWorldCFrame
                local u13 = a1.Model.Shield:Clone()
                u13:ClearAllChildren()
                u13.Anchored = true
                u13.CFrame = TransformedWorldCFrame
                u13.Transparency = 0
                u13.Parent = workspace.CurrentCamera
                local v1 = TweenService:Create(u13, TweenInfo.new(3), {Transparency = 1})
                v1:Play()
                v1.Completed:Once(function() -- Line: 129 -- upvalues: u13 (val)
                    u13:Destroy()
                end)
                a1.Model.Shield.Transparency = 1
            end)
            scaleAnimationToTime(Break, RecoveryTime)
            Shaker:Shake({7, 30, 0, 2}, 0, 2, {radius = 100, position = PrimaryPart.Position})
            local v2 = 0.05
            for i = 1, 5 do
                createShockwave(PrimaryPart.Position, a1.Stats.ExplosionRadius, v2)
                task.wait(v2)
                v2 = v2 * 1.5
            end
        end,
    }
end

return v1