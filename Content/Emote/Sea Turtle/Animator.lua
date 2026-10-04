-- Script path: ReplicatedStorage.Content.Emote.Sea Turtle.Animator
-- Decompile time: 3.92 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local u17 = Random.new()

local function toggleParticles(a1, a2) -- Line: 13 -- types: a1: userdata, a2: boolean
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") or j:IsA("Beam") then
            j.Enabled = a2
        end
    end
end

local function updateRate(a1, a2) -- Line: 21 -- types: a1: userdata, a2: number
    for i, j in a1:GetDescendants() do
        if j:IsA("ParticleEmitter") then
            j.Rate = a2
        end
    end
end

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 32
    -- upvalues: toggleParticles (val), EasySound (val), RunService (val), u17 (val), updateRate (val)
    a1._connections = {}
    local Instance = a1.Character.Instance
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local Humanoid = Instance:WaitForChild("Humanoid")
    local SeaTurtle = Instance:WaitForChild("SeaTurtle")
    local TurtleMotor = SeaTurtle:WaitForChild("TurtleMotor")
    local Turtle = SeaTurtle:WaitForChild("Turtle"):WaitForChild("Turtle")
    TurtleMotor.Part0 = HumanoidRootPart
    TurtleMotor.Part1 = Turtle
    a1:PreloadTrack("rbxassetid://78645152839980")
    a1:OnTrackPlayed("rbxassetid://137756286046394", function(a1_2) -- Line: 46 -- upvalues: toggleParticles (upval), Turtle (val), a1 (val) -- types: a1_2: userdata
        toggleParticles(Turtle.SpawnEmit, true)
        task.wait(1.7)
        toggleParticles(Turtle.SpawnEmit, false)
        toggleParticles(Turtle.ActiveVFX, true)
        a1_2:Stop()
        a1:PlayTrack("rbxassetid://78645152839980")
    end)
    if a1.Preview then
        Humanoid.HipHeight = 2
        return
    end
    local u43 = EasySound.Play({
        id = 103306313533177,
        looped = true,
        volume = 0.5,
        soundGroupName = "Emotes",
        timeScaled = false,
        position = HumanoidRootPart.Position,
        parent = HumanoidRootPart,
    })
    a1._sound = u43
    local u44 = 0
    local u46 = Vector3.new()
    a1._connections.Movement = RunService.PostSimulation:Connect(function(a1_2) -- Line: 73
        -- upvalues: Humanoid (val), u46 (ref), HumanoidRootPart (val), u44 (ref), a1 (val)
        local MoveDirection = Humanoid.MoveDirection
        u46 = HumanoidRootPart.CFrame:VectorToObjectSpace(MoveDirection)
        local v1 = -u46.Z * 30
        u44 = math.lerp(u44, v1, a1_2 * 1.5)
        if a1.Local then
            local v2 = HumanoidRootPart
            v2.CFrame = v2.CFrame * CFrame.new(0, 0, -u44 * a1_2)
            if 0 < (math.abs(MoveDirection.X)) then
                HumanoidRootPart.CFrame = HumanoidRootPart.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + MoveDirection), a1_2 * 2)
            end
        end
    end)
    local v1 = {
        (Instance:WaitForChild("LowerTorso")):WaitForChild("Root"),
        ((Instance:WaitForChild("Head")):WaitForChild("Neck")),
    }
    a1._motorData = {}
    for k, v in pairs(v1) do
        a1._motorData[v.Name] = {motor = v, C0 = v.C0}
    end
    local u89 = u17:NextNumber(-100000, 100000)
    local u95 = u17:NextNumber(-100000, 100000)
    local u101 = u17:NextNumber(-100000, 100000)
    local u102 = 0
    local u103 = 0
    local u104 = 0
    a1._connections.Hover = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 110
        -- upvalues: u104 (ref), u89 (val), u95 (val), u101 (val), u46 (ref), u102 (ref), u103 (ref), a1 (val)
        -- upvalues: u44 (ref), toggleParticles (upval), Turtle (val), updateRate (upval), u43 (val)
        if u104 < 0.999 then
            u104 = lerp(u104, 1, a2)
        end
        local v1 = (Vector3.new(
            math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u89),
            math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u95),
            (math.noise(a1_2 / 250 * 100, a1_2 / 250 * 100, u101))
        )) * u104
        local v2 = -u46.X * 30
        local v3 = u46.Z * 25
        u102 = lerp(u102, v2, a2 * 2)
        u103 = lerp(u103, v3, a2 * 2)
        a1._motorData.Neck.motor.C0 = a1._motorData.Neck.C0 * CFrame.Angles(math.rad(-u103), 0, 0)
        a1._motorData.Root.motor.C0 = a1._motorData.Root.C0 * CFrame.new(v1) * CFrame.Angles(math.rad(u103), 0, 0) * CFrame.Angles(0, 0, (math.rad(u102)))
        local v4 = u44 > 10
        local v5 = math.map(math.clamp(u44, 2, 20), 2, 20, 0, 1)
        toggleParticles(Turtle.ActiveVFX, v4)
        updateRate(Turtle.ActiveVFX, 22 + 22 * v5)
        u43.Volume = v5 * 0.5
        u43.PlaybackSpeed = v5
    end)
end

function v1.update(a1, a2) end

function v1:Destroy() -- Line: 145
    for k, v in pairs(self._connections) do
        if v.Connected then
            v:Disconnect()
        end
    end
    if self._sound then
        self._sound:Destroy()
    end
end

return v1