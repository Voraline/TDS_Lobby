-- Script path: ReplicatedStorage.Content.Emote.Ice Skating.Animator
-- Decompile time: 3.14 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local PhysicsUtils = require(ReplicatedStorage.Shared.Modules.PhysicsUtils)
local v1 = {}
v1.__index = v1

function v1:ToggleSkate(a2, a3) -- Line: 20 -- types: self: table, a2: string, a3: boolean
    local _leftSkate = not (a2 ~= "left") and self._leftSkate or self._rightSkate
    _leftSkate:FindFirstChildWhichIsA("Trail", true).Enabled = a3
end

function v1.Initialize(a1) -- Line: 26
    -- upvalues: PhysicsUtils (val), RunService (val), EasySound (val), EmitterManager (val)
    local u1 = 0
    local Instance = a1.Character.Instance
    local Humanoid = Instance:WaitForChild("Humanoid")
    local HumanoidRootPart = Instance:WaitForChild("HumanoidRootPart")
    local v1 = Instance:WaitForChild("Ice Skates")
    local IceSkateBlades_L = v1:WaitForChild("IceSkateBlades_L")
    local IceSkateBlades_R = v1:WaitForChild("IceSkateBlades_R")
    if a1.Preview then
        return
    end
    a1._root = HumanoidRootPart
    if a1.Local then
        a1._walking = false
        a1._moving = false
        a1._leftSkate = IceSkateBlades_L
        a1._rightSkate = IceSkateBlades_R
        a1._humanoid = Humanoid
        a1._hipHeight = Humanoid.HipHeight
        Humanoid.HipHeight = Humanoid.HipHeight + 0.3
        a1._linearVelocity = PhysicsUtils.createLinearVelocity({
            maxAxesForce = Vector3.new((1 / 0), 0, (1 / 0)),
            attachment0 = HumanoidRootPart:FindFirstChild("RootRigAttachment"),
        })
        a1._alignOrientation = PhysicsUtils.createAlignOrientation({responsiveness = 50, attachment0 = HumanoidRootPart:FindFirstChild("RootRigAttachment")})
        a1._linearVelocity.Parent = HumanoidRootPart
        a1._alignOrientation.CFrame = HumanoidRootPart.CFrame.Rotation
        a1._alignOrientation.Parent = HumanoidRootPart
        local u53 = RaycastParams.new()
        u53.FilterType = Enum.RaycastFilterType.Exclude
        u53.FilterDescendantsInstances = {Instance}
        u53.RespectCanCollide = true
        a1._thread = RunService.Heartbeat:Connect(function(a1_2) -- Line: 71
            -- upvalues: Humanoid (val), u1 (ref), HumanoidRootPart (val), a1 (val), u53 (val), EasySound (upval)
            -- upvalues: EmitterManager (upval)
            local v1 = Humanoid.MoveDirection * Vector3.new(1, 0, 1)
            u1 = math.lerp(u1, 30, a1_2 * 1.5)
            HumanoidRootPart.AssemblyAngularVelocity = HumanoidRootPart.AssemblyAngularVelocity * Vector3.new(0, 1, 0)
            a1._linearVelocity.VectorVelocity = HumanoidRootPart.CFrame.LookVector * Vector3.new(1, 0, 1) * u1
            if 0 < (math.abs(v1.X)) then
                a1._alignOrientation.CFrame = a1._alignOrientation.CFrame:Lerp(CFrame.lookAt(HumanoidRootPart.Position, HumanoidRootPart.Position + v1), a1_2 * 4)
            end
            local v2 = workspace:Blockcast(HumanoidRootPart.CFrame, HumanoidRootPart.Size, HumanoidRootPart.CFrame.LookVector * 1, u53)
            if v2 then
                a1:Stop()
                local LookVector = (CFrame.lookAt(HumanoidRootPart.Position, v2.Position)).LookVector
                EasySound.Play({
                    id = 96775454942603,
                    volume = 1,
                    soundGroupName = "Emotes",
                    destroyOnEnd = true,
                    parent = HumanoidRootPart,
                    position = v2.Position,
                })
                EmitterManager.Emit("IceSkateBump", CFrame.new(v2.Position), 2)
                HumanoidRootPart.AssemblyLinearVelocity = (-LookVector * Vector3.new(1, 0, 1) + Vector3.new(0, 0.4000000059604645, 0)) * 10 * HumanoidRootPart.AssemblyMass
            end
        end)
    end
    a1:OnTrackPlayed("rbxassetid://93573822223548", function(a1_2) -- Line: 110 -- upvalues: EasySound (upval), a1 (val) -- types: a1_2: userdata
        local u6 = EasySound.Create({
            id = 73931467975388,
            looped = true,
            volume = 0.5,
            soundGroupName = "Emotes",
            parent = a1._root,
        })
        u6:Play()
        a1.Maid:Mark(function() -- Line: 121 -- upvalues: u6 (val)
            u6:Destroy()
        end)
        for i, j in {"Left", "Right"} do
            (a1_2:GetMarkerReachedSignal((("Enable%*"):format(j)))):Connect(function() -- Line: 126 -- upvalues: a1 (upval), j (val)
                a1:ToggleSkate(j:lower(), true)
            end)
            ;(a1_2:GetMarkerReachedSignal((("Disable%*"):format(j)))):Connect(function() -- Line: 129 -- upvalues: a1 (upval), j (val)
                a1:ToggleSkate(j:lower(), false)
            end)
        end
    end)
end

function v1:Destroy() -- Line: 136
    if self._thread and self._thread.Connected then
        self._thread:Disconnect()
    end
    if self._humanoid and self._hipHeight then
        self._humanoid.HipHeight = self._hipHeight
    end
    if self._linearVelocity then
        self._linearVelocity:Destroy()
    end
    if self._alignOrientation then
        self._alignOrientation:Destroy()
    end
end

return v1