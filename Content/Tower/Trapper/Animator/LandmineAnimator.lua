-- Script path: ReplicatedStorage.Content.Tower.Trapper.Animator.LandmineAnimator
-- Decompile time: 4.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local SoundPool = require(ReplicatedStorage.Shared.Modules.SoundPool)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local u47 = {}
u47.__index = u47

local function setTransparency(a1, a2) -- Line: 29 -- types: a1: userdata, a2: number
    for i, v in ipairs(a1:GetDescendants()) do
        if v:IsA("BasePart") and not v.Locked then
            v.Transparency = a2
        end
    end
end

function u47.new(a1) -- Line: 37 -- upvalues: u47 (val), SpringClass (val) -- types: a1: table
    local v1 = {}
    setmetatable(v1, u47)
    v1.fbxModel = a1.fbxModel == true
    v1.trapData = a1
    v1.explosionRadiusMultipler = a1.explosionRadiusMultipler or 1
    v1.rotation = 0
    v1.lastTick = tick()
    v1.model = v1:_createModel()
    local Main = if not v1.fbxModel then v1.model.PrimaryPart else v1.model:FindFirstChild("Main")
    v1.root = Main
    v1.rootScale = if not v1.fbxModel then 1 else v1.root.Size
    v1.position = a1.position - v1.root.Floor.Position
    v1.rawPosition = a1.position
    v1.stats = a1.trapStats
    v1.explosionRadius = a1.trapStats.ExplosionRadius
    v1._spring = SpringClass.new(0, 0.6, 15)
    v1._originalSize = v1.root.Size
    v1._sizeThread = nil
    v1._soundPools = {}
    return v1
end

function u47:_createModel() -- Line: 62
    local v1 = if self.trapData.level ~= 4 then self.trapData.towerModel.Weapon.Landmine:Clone() else self.trapData.towerModel.Weapon.C4:Clone()
    local Main = if not self.fbxModel then v1.PrimaryPart else v1:FindFirstChild("Main")
    Main.Anchored = true
    ;(if not self.fbxModel then Main:FindFirstChild("Handle") else Main:FindFirstChildWhichIsA("RigidConstraint", true) or Main:FindFirstChildOfClass("Motor6D")):Destroy()
    return v1
end

function u47:_updateSize() -- Line: 81
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

function u47.landEffect(a1) -- Line: 100
    -- upvalues: RunService (val), TimescaleUtilities (val), SoundPool (val), SoundService (val)
    a1._spring.v = a1._spring.v + 1.5
    a1._sizeThread = RunService.RenderStepped:Connect(function() -- Line: 103 -- upvalues: a1 (val)
        a1:_updateSize()
    end)
    task.spawn(function() -- Line: 106 -- upvalues: TimescaleUtilities (upval), a1 (val)
        TimescaleUtilities.Wait(1)
        if a1._sizeThread then
            a1._sizeThread:Disconnect()
            a1._sizeThread = nil
        end
    end)
    task.spawn(function() -- Line: 114 -- upvalues: a1 (val), SoundPool (upval), SoundService (upval)
        local Sound = (a1.model:WaitForChild("Main")):FindFirstChild("Sound")
        if Sound and Sound:IsA("Sound") then
            local v1 = a1._soundPools[Sound]
            if not v1 then
                v1 = SoundPool.new({
                    maxInstances = 2,
                    timeScaled = true,
                    id = Sound.SoundId,
                    sound = Sound,
                    parent = Sound.Parent,
                    volume = Sound.Volume,
                })
                a1._soundPools[Sound] = v1
            end
            Sound.SoundGroup = SoundService:FindFirstChild("Towers")
            v1:play({
                playbackSpeed = 0.95 + math.random() * 0.1,
                volume = Sound.Volume * 0.5,
            })
        end
    end)
end

function u47.getRotationMod(a1) -- Line: 138 -- upvalues: GameState (val)
    local v1 = tick() - a1.lastTick
    a1.lastTick = tick()
    a1.rotation = a1.rotation + 600 * v1 * GameState.TimeScale
    return (CFrame.Angles(0, math.rad(a1.rotation), 0)) * a1:getPlacementRotation()
end

function u47:getPlacementRotation() -- Line: 146
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

function u47.getFinalCFrame(a1) -- Line: 162
    return (CFrame.new(a1.position)) * CFrame.Angles(0, a1.rotation, 0) * a1:getPlacementRotation()
end

function u47.enableModel(a1) -- Line: 168 -- upvalues: setTransparency (val)
    setTransparency(a1.model, 0)
    a1.model.Parent = workspace
end

function u47.onTriggered(a1) -- Line: 173
    -- upvalues: EmitterManager (val), EffectsController (val), SoundPool (val), GameState (val)
    local v1 = a1.explosionRadius * a1.explosionRadiusMultipler
    if a1.root:FindFirstChild("VFX") then
        local v2 = v1 / ((a1.root.VFX:GetExtentsSize()).Magnitude / 2)
        local u21 = a1.root.VFX:Clone()
        u21:ScaleTo(v2)
        u21.PrimaryPart.Position = a1.rawPosition
        u21.Parent = workspace.Terrain
        EmitterManager.manualEmit(u21)
        task.delay(5, function() -- Line: 187 -- upvalues: u21 (val)
            u21:Destroy()
        end)
        return
    end
    EffectsController.Explosion({Position = a1.position, Radius = v1})
    local Main = a1.model:FindFirstChild("Main")
    local Sound = Main and Main:FindFirstChild("Sound")
    if Main and Sound and Sound:IsA("Sound") then
        local v3 = a1._soundPools[Sound]
        if not v3 then
            v3 = SoundPool.new({
                maxInstances = 4,
                timeScaled = true,
                id = Sound.SoundId,
                sound = Sound,
                parent = Sound.Parent,
            })
            a1._soundPools[Sound] = v3
        end
        v3:play({playbackSpeed = GameState.TimeScale * (0.95 + math.random() * 0.1)})
    end
end

function u47:Destroy() -- Line: 214
    for k, v in pairs(self._soundPools) do
        v:destroy()
    end
    if self._sizeThread then
        self._sizeThread:Disconnect()
        self._sizeThread = nil
    end
    self.model:Destroy()
end

return u47