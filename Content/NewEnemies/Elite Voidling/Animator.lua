-- Script path: ReplicatedStorage.Content.NewEnemies.Elite Voidling.Animator
-- Decompile time: 1.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

local function playAnimation(a1, a2) -- Line: 14 -- upvalues: Animation (val)
    local Animations = a1:FindFirstChild("Animations")
    local AnimationController = a1:FindFirstChild("AnimationController")
    if Animations and AnimationController then
        local v1 = Animations:FindFirstChild(a2)
        if not v1 then
            return
        end
        Animation.new({Track = v1, Target = AnimationController}):Play()
        return
    end
end

function v1.Initialize(a1) -- Line: 32
    -- upvalues: playAnimation (val), EffectsController (val), Shaker (val), EmitterManager (val), EasySound (val)
    -- upvalues: GameState (val), TweenService (val)
    a1.Executables = {
        Stomp = function(a1_2, a2) -- Line: 35
            -- upvalues: a1 (val), playAnimation (upval), EffectsController (upval), Shaker (upval)
            -- upvalues: EmitterManager (upval)
            a1:Face(a1_2)
            playAnimation(a1.Model, "Stomp")
            a1:Delay(0.75, function() -- Line: 39
                -- upvalues: a2 (val), EffectsController (upval), a1_2 (val), Shaker (upval), a1 (upval)
                -- upvalues: EmitterManager (upval)
                if a2 then
                    EffectsController.GroundSmash(CFrame.new(a1_2), a2)
                    Shaker:Shake({5, 10, 0, 1.5}, 0.5, 1, {position = a1_2, radius = a2 * 8})
                end
                local HitVFX = a1.Model:FindFirstChild("HitVFX")
                if HitVFX then
                    local u31 = HitVFX:Clone()
                    u31.Position = a1_2
                    u31.Parent = workspace
                    EmitterManager.manualEmit(u31)
                    a1:Delay(0.5, function() -- Line: 55 -- upvalues: u31 (val)
                        u31:Destroy()
                    end)
                end
            end)
        end,
        Death = function() -- Line: 62 -- upvalues: playAnimation (upval), a1 (val), EasySound (upval)
            playAnimation(a1.Model, "Death")
            EasySound.Play({
                id = "rbxassetid://79908583643458",
                audioGroup = "Enemies",
                destroyOnEnd = true,
                parent = a1.Model.PrimaryPart,
            })
        end,
        LaneSwitch = function(a1_2, a2, a3) -- Line: 72
            -- upvalues: GameState (upval), a1 (val), EasySound (upval), playAnimation (upval), TweenService (upval)
            local v1 = GameState.Paths[a1.PathTeam]
            local v2 = v1 and v1[a1_2]
            local PrimaryPart = a1.Model.PrimaryPart or a1.Model:FindFirstChild("RootPart")
            if v2 and PrimaryPart then
                local Scalar = v2:GetScalar(a2)
                local Scalar_2 = v2:GetScalar(a2 + 1)
                a1:Face(Scalar, TweenInfo.new((math.min(a3, 0.35))), true)
                EasySound.Play({
                    id = "rbxassetid://85325609576956",
                    audioGroup = "Enemies",
                    destroyOnEnd = true,
                    parent = a1.Model.PrimaryPart,
                })
                playAnimation(a1.Model, "Jump")
                TweenService:Create(PrimaryPart, TweenInfo.new(a3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
                    CFrame = (CFrame.new(Scalar, Scalar_2)) * CFrame.new(0, a1.Height, 0),
                }):Play()
                return
            end
        end,
        PathChange = function(a1_2, a2) -- Line: 99 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
    }
end

return v1