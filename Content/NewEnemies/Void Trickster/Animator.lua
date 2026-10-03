-- Script path: ReplicatedStorage.Content.NewEnemies.Void Trickster.Animator
-- Decompile time: 3.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local Bezier = require(ReplicatedStorage.Shared.Modules.Bezier)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local v1 = {}
v1.__index = v1
local u55 = ReplicatedStorage.Assets.Effects.Mob["Rift Walker"]
local VoidReaper = ReplicatedStorage.Assets.Effects.Mob.VoidReaper

function v1:_playAnimation(a2) -- Line: 20
    local v1 = self._animations[a2]
    if v1 then
        v1:Play()
    end
end

function v1.Initialize(a1) -- Line: 27
    -- upvalues: Create (val), SoundService (val), StateManager (val), Animation (val), u55 (val), Bezier (val)
    -- upvalues: RunService (val), GameState (val), TimescaleUtilities (val), VoidReaper (val), EmitterManager (val)
    local u6 = Create("Sound", {
        Name = "SummonPortal",
        SoundId = "rbxassetid://131219069628768",
        Volume = 0.75,
        Parent = a1.Model.PrimaryPart,
    })
    u6.SoundGroup = SoundService.Enemies
    a1._dead = false
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        if j.Name ~= "Walk" then
            a1._animations[j.Name] = (Animation.new({Preload = true, Track = j, Target = AnimationController}))
        end
    end
    local _stateManager = a1._stateManager
    local v1 = {}
    local v2 = {
        name = "Portal",
        onEnter = function(a1_2) -- Line: 62
            -- upvalues: a1 (val), u55 (upval), u6 (val), Bezier (upval), RunService (upval), GameState (upval)
            -- upvalues: TimescaleUtilities (upval)
            local v1, v2, v3
            a1:Face(a1_2, TweenInfo.new(0.75), true)
            a1:_playAnimation("SpellThrow")
            a1:Delay(0.1)
            for i = 1, 4 do
                local u29 = u55.Trail:Clone()
                v2 = u6:Clone()
                v2.PlaybackSpeed = Random.new():NextNumber(0.9, 1.1)
                v2.Volume = 0.45
                v2.Parent = u29
                v2:Play()
                v3 = {
                    a1.Model.scepterObject.Position,
                    (a1.Model.scepterObject.Position:Lerp(a1_2, 0.5)) + Vector3.new(0, 10, 0),
                    a1_2 + Vector3.new(0, 1.25, 0),
                }
                local u69 = Bezier.new(unpack(v3))
                u29.Position = u69:Get(0)
                local u74 = 0
                local u75 = nil
                local u83 = Random.new():NextNumber(1.3, 2.1) / 1.25
                v1 = RunService.Heartbeat:Connect(function(a1) -- Line: 90
                    -- upvalues: u74 (ref), u83 (val), GameState (upval), u29 (val), u69 (val), u75 (ref)
                    -- upvalues: TimescaleUtilities (upval)
                    u74 = u74 + a1 * u83 * GameState.TimeScale
                    local v1 = math.clamp(u74, 0, 1)
                    u29.Position = u69:Get(v1)
                    if v1 >= 1 then
                        u75:Disconnect()
                        TimescaleUtilities.CleanUp(u29, 2)
                    end
                end)
                u29.Parent = workspace.Trash
                TimescaleUtilities.Wait(Random.new():NextNumber(0.08, 0.1))
            end
        end,
    }
    local v3 = {
        name = "Summon",
        onEnter = function() -- Line: 109 -- upvalues: a1 (val)
            a1:_playAnimation("Summon")
        end,
    }
    local v4 = {
        name = "Death",
        onEnter = function() -- Line: 115 -- upvalues: a1 (val)
            a1:_playAnimation("Death")
        end,
    }
    v1[1] = {
        name = "Walking",
        onEnter = function() end,
    }
    v1[2] = v2
    v1[3] = v3
    v1[4] = v4
    _stateManager:addStates(v1)
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 122 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
        Effect = function() -- Line: 126 -- upvalues: a1 (val), VoidReaper (upval), EmitterManager (upval), TimescaleUtilities (upval)
            a1:Delay(1)
            local v1 = VoidReaper.NewSummonVFX:Clone()
            v1.CFrame = CFrame.new(a1.Model.PrimaryPart.Node.WorldPosition + Vector3.new(0, 0.10000000149011612, 0))
            EmitterManager.manualEmit(v1)
            v1.Parent = workspace
            TimescaleUtilities.CleanUp(v1, 3)
        end,
    }
end

return v1