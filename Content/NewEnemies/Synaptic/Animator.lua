-- Script path: ReplicatedStorage.Content.NewEnemies.Synaptic.Animator
-- Decompile time: 1.01 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local FallenBlood = (((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Misc")):WaitForChild("FallenBlood")
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 12 -- upvalues: FallenBlood (val), TweenService (val), TimescaleUtilities (val)
    a1.Executables = {
        CreatePuddle = function(a1, a2) -- Line: 14
            -- upvalues: FallenBlood (upval), TweenService (upval), TimescaleUtilities (upval)
            local u14 = FallenBlood[math.random(1, #FallenBlood:GetChildren())]:Clone()
            u14.CFrame = (CFrame.new(a1 + Vector3.new(0, 0.10000000149011612, 0))) * CFrame.Angles(0, math.rad((math.random(0, 360))), 0)
            u14.Parent = workspace.Terrain
            local Size = u14.Size
            u14.Size = Vector3.new(0, 0, 0)
            TweenService:Create(u14, TweenInfo.new(0.65, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {Size = Size}):Play()
            TimescaleUtilities.Delay(a2, function() -- Line: 30 -- upvalues: TweenService (upval), u14 (val), Size (val)
                local v1 = TweenService:Create(u14, TweenInfo.new(1), {Transparency = 1, Size = Size * 0.5})
                v1:Play()
                v1.Completed:Connect(function() -- Line: 37 -- upvalues: u14 (upval)
                    u14:Destroy()
                end)
            end)
        end,
    }
end

return v1