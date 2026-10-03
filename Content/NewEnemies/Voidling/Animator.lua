-- Script path: ReplicatedStorage.Content.NewEnemies.Voidling.Animator
-- Decompile time: 2.61 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local ItemDrop = require(ReplicatedStorage.Shared.Modules.ItemDrop)
local v1 = {}
v1.__index = v1

local function playAnimation(a1, a2) -- Line: 12 -- upvalues: Animation (val)
    local Animations = a1:FindFirstChild("Animations")
    local AnimationController = a1:FindFirstChild("AnimationController")
    if Animations and AnimationController then
        local v1 = Animations:FindFirstChild(a2)
        if not v1 then
            return
        end
        return Animation.new({Track = v1, Target = AnimationController}):Play()
    end
end

function v1.Initialize(a1) -- Line: 32
    -- upvalues: playAnimation (val), EasySound (val), GameState (val), ItemDrop (val)
    a1.Executables = {
        Death = function() -- Line: 34 -- upvalues: playAnimation (upval), a1 (val), EasySound (upval)
            playAnimation(a1.Model, "Death")
            EasySound.Play({
                id = "rbxassetid://79908583643458",
                audioGroup = "Enemies",
                destroyOnEnd = true,
                parent = a1.Model.PrimaryPart,
            })
        end,
        LaneSwitch = function(a1_2, a2, a3) -- Line: 44
            -- upvalues: GameState (upval), a1 (val), ItemDrop (upval), playAnimation (upval), EasySound (upval)
            local v1 = GameState.Paths[a1.PathTeam]
            local v2 = v1 and v1[a1_2]
            local PrimaryPart = a1.Model.PrimaryPart or a1.Model:FindFirstChild("RootPart")
            if v2 and PrimaryPart and a3 then
                local u28 = a1.Stats.LaneSwitch.Delay or 0
                a3.startPosition = PrimaryPart.Position
                local endPosition = a3.endPosition or (v2:GetScalar(a2)) + Vector3.new(0, 1, 0) * a1.Height
                a3.endPosition = endPosition
                local u52 = (ItemDrop.GetTimeToDestinationWithGV(a3.startPosition, a3.endPosition, a3.gravity, a3.velocity)) / a3.dtMultiplier
                local u57 = playAnimation(a1.Model, "Jump")
                if u57 then
                    task.spawn(function() -- Line: 67 -- upvalues: u57 (val), u52 (val), u28 (val)
                        local v1 = 0
                        while u57.Length == 0 do
                            if not (v1 < 60) then
                                break
                            end
                            v1 = v1 + 1
                            task.wait()
                        end
                        if 0 < u57.Length and u52 > 0 then
                            u57:AdjustSpeed(u57.Length / (u52 + u28 + 0.5))
                        end
                    end)
                end
                if u28 > 0 then
                    a1:Face(a3.endPosition, (TweenInfo.new(u28)))
                    a1:Wait(u28)
                end
                EasySound.Play({
                    id = "rbxassetid://85325609576956",
                    audioGroup = "Enemies",
                    destroyOnEnd = true,
                    parent = a1.Model.PrimaryPart,
                })
                local Rotation = (CFrame.lookAt(a3.startPosition, (Vector3.new(a3.endPosition.X, a3.startPosition.Y, a3.endPosition.Z)))).Rotation
                ;(ItemDrop.Drop(a3.startPosition, a3.endPosition, PrimaryPart, a3.dtMultiplier, a3.gravity, a3.velocity, function() -- Line: 106 -- upvalues: Rotation (val)
                    return Rotation
                end)):andThen(function() end)
                return
            end
        end,
        PathChange = function(a1_2, a2) -- Line: 112 -- upvalues: a1 (val)
            a1.PathName = a1_2
            a1.PathDistance = a2
            a1:RefreshPath(nil, nil, true)
        end,
    }
end

return v1