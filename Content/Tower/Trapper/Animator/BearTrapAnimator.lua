-- Script path: ReplicatedStorage.Content.Tower.Trapper.Animator.BearTrapAnimator
-- Decompile time: 3.52 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local u36 = {}
u36.__index = u36

local function setTransparency(a1, a2) -- Line: 28 -- types: a1: userdata, a2: number
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("BasePart") and not v.Locked then
            v.Transparency = a2
        end
    end
end

function u36.new(a1) -- Line: 36 -- upvalues: u36 (val), SpringClass (val) -- types: a1: table
    local v1 = {}
    setmetatable(v1, u36)
    v1.fbxModel = a1.fbxModel == true
    v1.trapData = a1
    v1.model = v1:_createModel()
    v1.rotation = 0
    v1.lastTick = tick()
    local Main = if not v1.fbxModel then v1.model.PrimaryPart else v1.model:FindFirstChild("Main")
    v1.root = Main
    v1.rootScale = if not v1.fbxModel then 1 else v1.root.Size
    v1.position = a1.position - v1.root.Floor.Position
    v1.rawPosition = a1.position
    if not v1.fbxModel then
        v1._clawMotor = (v1.model:WaitForChild("Main")):WaitForChild("Claw")
        v1._origClawC0 = v1._clawMotor.C0
    end
    v1._spring = SpringClass.new(0, 0.6, 15)
    v1._originalSize = v1.root.Size
    v1._sizeThread = nil
    v1._soundPools = {}
    return v1
end

function u36:_createModel() -- Line: 63
    local v1 = self.trapData.towerModel.Weapon.BearTrap:Clone()
    local Main = if not self.fbxModel then v1.PrimaryPart else v1:FindFirstChild("Main")
    Main.Anchored = true
    ;(if not self.fbxModel then Main:FindFirstChild("Handle") else Main:FindFirstChildWhichIsA("RigidConstraint", true) or Main:FindFirstChildOfClass("Motor6D")):Destroy()
    return v1
end

function u36:_updateSize() -- Line: 79
    if self._spring.v ~= 0 then
        local Main = self.model:FindFirstChild("Main")
        if Main == nil then
            self._sizeThread:Disconnect()
            return
        end
        local v1 = math.clamp(self._spring.p, -0.99, 2)
        if not self.fbxModel then
            self.model:ScaleTo(v1 + 1)
        else
            self.root.Size = self.rootScale * (v1 + 1)
        end
        Main.Position = self.rawPosition + Vector3.new(0, Main.Size.Y / 2, 0)
    end
end

function u36:_playSound() -- Line: 98 -- upvalues: SoundPool (val)
    local Main = self.model:FindFirstChild("Main")
    local Sound = Main and Main:FindFirstChild("Sound")
    if Sound and Sound:IsA("Sound") then
        local v1 = self._soundPools[Sound]
        if not v1 then
            v1 = SoundPool.new({
                maxInstances = 3,
                timeScaled = true,
                id = Sound.SoundId,
                sound = Sound,
                parent = Sound.Parent,
            })
            self._soundPools[Sound] = v1
        end
        v1:play({playbackSpeed = 0.95 + math.random() * 0.1})
    end
end

function u36.landEffect(a1) -- Line: 117 -- upvalues: RunService (val), TimescaleUtilities (val)
    a1._spring.v = a1._spring.v + 1.5
    a1._sizeThread = RunService.RenderStepped:Connect(function() -- Line: 120 -- upvalues: a1 (val)
        a1:_updateSize()
    end)
    task.spawn(function() -- Line: 123 -- upvalues: TimescaleUtilities (upval), a1 (val)
        TimescaleUtilities.Wait(1)
        if a1._sizeThread then
            a1._sizeThread:Disconnect()
            a1._sizeThread = nil
        end
    end)
end

function u36.enableModel(a1) -- Line: 132 -- upvalues: setTransparency (val)
    setTransparency(a1.model, 0)
    a1.model.Parent = workspace
end

function u36.getRotationMod(a1) -- Line: 137 -- upvalues: GameState (val)
    local v1 = tick() - a1.lastTick
    a1.lastTick = tick()
    a1.rotation = a1.rotation + 600 * v1 * GameState.TimeScale
    return (CFrame.Angles(0, math.rad(a1.rotation), 0)) * a1:getPlacementRotation()
end

function u36:getPlacementRotation() -- Line: 145
    local v1 = CFrame.new()
    if self.fbxModel then
        local Configuration = self.model:FindFirstChildWhichIsA("Configuration")
        local PlacementRotation = Configuration and Configuration:FindFirstChild("PlacementRotation")
        if PlacementRotation and PlacementRotation:IsA("Vector3Value") then
            v1 = CFrame.Angles(math.rad(PlacementRotation.Value.X), math.rad(PlacementRotation.Value.Y), (math.rad(PlacementRotation.Value.Z)))
        end
    end
    return v1
end

function u36.getFinalCFrame(a1) -- Line: 161
    return (CFrame.new(a1.position)) * CFrame.Angles(0, a1.rotation, 0) * a1:getPlacementRotation()
end

function u36.onTriggered(a1) -- Line: 167 -- upvalues: GameState (val), TweenService (val)
    a1:_playSound()
    if not a1._clawMotor then
        return
    end
    TweenService:Create(
        a1._clawMotor,
        TweenInfo.new(0.15 / GameState.TimeScale, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {C0 = a1._origClawC0 * CFrame.Angles(-2.007128639793479, 0, 0)}
    ):Play()
end

function u36:Destroy() -- Line: 184 -- upvalues: TimescaleUtilities (val)
    for k, v in pairs(self._soundPools) do
        v:destroy()
    end
    if self._sizeThread then
        self._sizeThread:Disconnect()
        self._sizeThread = nil
    end
    TimescaleUtilities.Wait(0.5)
    self.model:Destroy()
end

return u36