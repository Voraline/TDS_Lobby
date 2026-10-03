-- Script path: ReplicatedStorage.Content.NewEnemies.Corrupted Brawler.Animator
-- Decompile time: 1.70 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u33 = ReplicatedStorage.Assets.Effects.Mob["Nerd Duck"]
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 14
    -- upvalues: Animation (val), GameState (val), TimescaleUtilities (val), ItemDrop (val), u33 (val)
    -- upvalues: EmitterManager (val)
    local u10 = Animation.new({
        IgnorePriority = true,
        IsPersistent = true,
        Preload = true,
        Track = a1.Model.Animations.Jump,
        Target = a1.Model.AnimationController.Animator,
    })
    a1.Executables = {
        PathChange = function(a1_2, a2) -- Line: 26 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
        SwitchPath = function(a1_2, a2, a3, a4) -- Line: 33
            -- upvalues: a1 (val), u10 (val), GameState (upval), TimescaleUtilities (upval), ItemDrop (upval)
            -- upvalues: u33 (upval), EmitterManager (upval)
            a1:Face(a3.endPosition, TweenInfo.new(0.6), true)
            u10:Play()
            local Scalar = GameState.Paths[a1.PathTeam][a1_2]:GetScalar(a1.PathDistance + 5, 1)
            a1.Rotation = CFrame.new() * CFrame.new(a1.Position, Scalar).Rotation
            local PrimaryPart = a1.Model.PrimaryPart
            local Node = PrimaryPart:FindFirstChild("Node")
            if not Node then
                return
            end
            TimescaleUtilities.Delay(0.2, function() -- Line: 54
                -- upvalues: a3 (val), ItemDrop (upval), PrimaryPart (val), u33 (upval), Node (val)
                -- upvalues: EmitterManager (upval), TimescaleUtilities (upval)
                local Rotation = (CFrame.new(a3.startPosition, a3.endPosition)).Rotation
                ;(ItemDrop.Drop(a3.startPosition, a3.endPosition, PrimaryPart, a3.dtMultiplier, a3.gravity, a3.velocity, function() -- Line: 63 -- upvalues: Rotation (val)
                    return Rotation
                end)):andThen(function() -- Line: 66 -- upvalues: u33 (upval), Node (upval), EmitterManager (upval), TimescaleUtilities (upval)
                    local v1 = u33.LandVFX:Clone()
                    v1.Parent = workspace.Terrain
                    v1.Position = Node.WorldPosition - Vector3.new(0, 3, 0)
                    EmitterManager.manualEmit(v1)
                    TimescaleUtilities.CleanUp(v1, 3)
                end)
            end)
        end,
    }
end

return v1