-- Script path: ReplicatedStorage.Content.Maps.Huevous Hunt.Animator.Events.BeamSworm
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local v1 = {}
local u16 = {}
local v2 = Color3.fromRGB(37, 139, 255)
local v3 = Color3.fromRGB(215, 53, 255)
u16[1] = v2
u16[2] = v3
u16[3] = Color3.fromRGB(0, 238, 255)
local u33 = Random.new()
local u34 = nil

function v1.rewind(a1) -- Line: 20 -- upvalues: u34 (ref)
    if u34 then
        u34:Disconnect()
        u34 = nil
    end
    if a1.map:FindFirstChild("BeamSworm") then
        a1.map.BeamSworm:Destroy()
    end
end

function v1.start(a1) -- Line: 30 -- upvalues: u16 (val), u33 (val), u34 (ref), RunService (val), GameState (val)
    local v1, v2
    local u1 = 0
    local BoundingBox = a1.map:GetBoundingBox()
    local Model = Instance.new("Model")
    Model.Name = "BeamSworm"
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.CanCollide = false
    Part.Size = Vector3.new(1, 1, 1)
    Part.Position = Vector3.new(BoundingBox.X, 15, BoundingBox.Z)
    Part.Name = "Center"
    Part.Parent = Model
    Model.Parent = a1.map
    for i = 1, 60 do
        v1 = i * 4 + 30
        v2 = a1.map.Misc.Trails.CorruptionTrail:Clone()
        v2.Anchored = true
        v2.CanCollide = false
        v2.Size = Vector3.new(1, 1, 1)
        v2.CFrame = Part.CFrame * CFrame.Angles(0, math.rad(i * 36), 0) * CFrame.new(0, v1, -250)
        v2.Parent = Model
        v2.Trail.Color = ColorSequence.new(u16[u33:NextInteger(1, #u16)])
    end
    local CFrame_2 = Part.CFrame
    u34 = RunService.RenderStepped:Connect(function(a1) -- Line: 69 -- upvalues: u1 (ref), GameState (upval), Model (val), CFrame_2 (val)
        local CFrame_3, new, v1
        u1 = u1 + a1 * 90 * GameState.TimeScale
        Model:PivotTo(CFrame_2 * (CFrame.Angles(0, math.rad(u1), 0)))
        for k, v in pairs(Model:GetChildren()) do
            if v:IsA("BasePart") then
                CFrame_3 = v.CFrame
                new = CFrame.new
                v1 = tick()
                v.CFrame = CFrame_3 * new(0, 0, (math.sin(v1)))
            end
        end
    end)
end

return v1