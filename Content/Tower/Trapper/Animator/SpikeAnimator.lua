-- Script path: ReplicatedStorage.Content.Tower.Trapper.Animator.SpikeAnimator
-- Decompile time: 4.47 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local u41 = {}
u41.__index = u41

local function setTransparency(a1, a2) -- Line: 25 -- types: a1: userdata, a2: number
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("BasePart") and not v.Locked then
            v.Transparency = a2
        end
    end
end

function u41.new(a1) -- Line: 33 -- upvalues: u41 (val), SpringClass (val) -- types: a1: table
    local v1 = {}
    setmetatable(v1, u41)
    v1.fbxModel = a1.fbxModel == true
    v1.trapData = a1
    v1.rotation = 0
    v1.lastTick = tick()
    v1.model = v1:_createModel()
    local Main = if not v1.fbxModel then v1.model.PrimaryPart else v1.model:FindFirstChild("Main")
    v1.root = Main
    v1.rootScale = if not v1.fbxModel then 1 else v1.root.Size
    v1.position = a1.position - v1.root.Floor.Position
    v1.rawPosition = a1.position
    v1._spring = SpringClass.new(0, 0.6, 15)
    v1._originalSize = v1.root.Size
    v1._sizeScale = 1
    v1._sizeThread = nil
    local Configuration = v1.model:FindFirstChildWhichIsA("Configuration")
    local LandEffectScale = Configuration and Configuration:FindFirstChild("LandEffectScale")
    if LandEffectScale and LandEffectScale:IsA("NumberValue") then
        v1._sizeScale = LandEffectScale.Value
    end
    v1._soundPools = {}
    v1._maid = {}
    return v1
end

function u41:_createModel() -- Line: 65
    local v1 = if not (self.trapData.level < 2) then self.trapData.towerModel.Weapon.QuadSpike:Clone() else self.trapData.towerModel.Weapon.SingleSpike:Clone()
    local Main = if not self.fbxModel then v1.PrimaryPart else v1:FindFirstChild("Main")
    Main.Anchored = true
    ;(if not self.fbxModel then Main:FindFirstChild("Handle") else Main:FindFirstChildWhichIsA("RigidConstraint", true) or Main:FindFirstChildOfClass("Motor6D")):Destroy()
    return v1
end

function u41:_updateSize() -- Line: 84
    if self._spring.v ~= 0 then
        local Main = self.model:FindFirstChild("Main")
        if Main == nil then
            self._sizeThread:Disconnect()
            return
        end
        local v1 = math.clamp(self._spring.p, -0.99, 2)
        local v2 = self._originalSize.Y * (v1 * -2 + 1) * self._sizeScale
        local v3 = self._originalSize.X * (v1 + 1) * self._sizeScale
        Main.Size = Vector3.new(v3, v2, v3)
        Main.Position = self.rawPosition + Vector3.new(0, Main.Size.Y / 2, 0)
    end
end

function u41.getRotationMod(a1) -- Line: 100 -- upvalues: GameState (val)
    local v1 = tick() - a1.lastTick
    a1.lastTick = tick()
    a1.rotation = a1.rotation + 600 * v1 * GameState.TimeScale
    return (CFrame.Angles(0, math.rad(a1.rotation), 0)) * a1:getPlacementRotation()
end

function u41:getPlacementRotation() -- Line: 108
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

function u41.getFinalCFrame(a1) -- Line: 124
    return (CFrame.new(a1.position)) * CFrame.Angles(0, a1.rotation, 0) * a1:getPlacementRotation()
end

function u41.landEffect(a1) -- Line: 130 -- upvalues: RunService (val)
    a1._spring.v = a1._spring.v + 5
    a1._sizeThread = RunService.RenderStepped:Connect(function() -- Line: 132 -- upvalues: a1 (val)
        a1:_updateSize()
    end)
end

function u41.enableModel(a1) -- Line: 137 -- upvalues: setTransparency (val)
    setTransparency(a1.model, 0)
    a1.model.Parent = workspace
end

function u41.onTriggered(a1, a2, a3) -- Line: 142
    -- upvalues: SoundPool (val), EmitterManager (val)
    a1._sizeScale = 1 - (1 - a2 / a3) / 3
    a1._spring.v = a1._spring.v + 3
    local Sound = a1.root:FindFirstChild("Sound")
    if Sound and Sound:IsA("Sound") then
        local v1 = a1._soundPools[Sound]
        if not v1 then
            v1 = SoundPool.new({
                maxInstances = 4,
                timeScaled = true,
                id = Sound.SoundId,
                sound = Sound,
                parent = Sound.Parent,
            })
            a1._soundPools[Sound] = v1
        end
        v1:play({playbackSpeed = 0.95 + math.random() * 0.1})
    end
    local VFX = a1.root:FindFirstChild("VFX")
    if VFX then
        EmitterManager.manualEmit(VFX)
        return
    end
    EmitterManager.Emit("SpikeHit", CFrame.new(a1.position), nil, nil, Sound == nil)
end

function u41:Destroy() -- Line: 172 -- upvalues: TweenService (val), GameState (val), TimescaleUtilities (val)
    for k, v in pairs(self._soundPools) do
        v:destroy()
    end
    if self._sizeThread then
        self._sizeThread:Disconnect()
        self._sizeThread = nil
    end
    TweenService:Create(self.model:WaitForChild("Main"), TweenInfo.new(0.1 / GameState.TimeScale, Enum.EasingStyle.Linear), {
        Size = Vector3.new(0.009999999776482582, 0.009999999776482582, 0.009999999776482582),
        Position = self.rawPosition,
    }):Play()
    TimescaleUtilities.CleanUp(self.model, 0.1)
end

return u41