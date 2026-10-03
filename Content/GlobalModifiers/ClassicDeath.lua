-- Script path: ReplicatedStorage.Content.GlobalModifiers.ClassicDeath
-- Decompile time: 1.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage.Shared.Types.GlobalModifierTypes)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local u21 = Random.new()
return {
    displayName = "Retro Deaths",
    description = "Classic roblox styled deaths.",
    icon = 269363975,
    onEnableClient = function(a1, a2, a3) -- Line: 14
        -- upvalues: LegacyMiddleware (val), ReplicatedStorage (val), u21 (val), TimescaleUtilities (val)
        a1.middleware(LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, function(a1, a2) -- Line: 19 -- upvalues: ReplicatedStorage (upval), u21 (upval), TimescaleUtilities (upval)
            a2.OnDestroy:Connect(function() -- Line: 20 -- upvalues: ReplicatedStorage (upval), a2 (val), u21 (upval), TimescaleUtilities (upval)
                local v1
                local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
                local Position = a2.Model:GetPivot().Position
                local v2 = a2.Model:Clone()
                v2.Parent = workspace
                v2:BreakJoints()
                for i, v in ipairs(v2:GetChildren()) do
                    if v:IsA("BasePart") and v.Transparency < 1 then
                        v1 = v.Position - Position
                        v.Anchored = true
                        v.CanQuery = false
                        v.CanCollide = false
                        v.CanTouch = false
                        v.CollisionGroup = "Players"
                        local u55 = 0
                        local u59 = u21:NextNumber()
                        ;((Projectile:throwWithPhysics({
                            gravity = Vector3.new(-0, -30, -0),
                            start = v.Position,
                            velocity = v1 * u21:NextNumber(10, 20),
                            asset = v,
                            include = {
                                workspace:FindFirstChild("Map"),
                                workspace:FindFirstChild("Ground"),
                                (workspace:FindFirstChild("Cliff")),
                            },
                            rotation = function(a1) -- Line: 50 -- upvalues: u55 (ref), u59 (val) -- types: a1: vector
                                u55 = u55 + 0.1 * a1.Magnitude / 10
                                return CFrame.Angles(u59 + u55, u59 + u55, 0)
                            end,
                        })):andThen(function() -- Line: 55 -- upvalues: v (val)
                            v.CanCollide = true
                            v.Anchored = false
                        end)):catch(function() end)
                    end
                end
                TimescaleUtilities.CleanUp(v2, 5)
            end)
            return a2
        end))
    end,
}