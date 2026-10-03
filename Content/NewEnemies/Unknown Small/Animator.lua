-- Script path: ReplicatedStorage.Content.NewEnemies.Unknown Small.Animator
-- Decompile time: 0.84 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8 -- upvalues: ReplicatedStorage (val), EmitterManager (val), TweenService (val)
    a1.OnDestroy:Connect(function(a1_2) -- Line: 9
        -- upvalues: ReplicatedStorage (upval), a1 (val), EmitterManager (upval), TweenService (upval)
        local UnknownExplosion = ReplicatedStorage.Assets.Effects.Mob:FindFirstChild("UnknownExplosion")
        if UnknownExplosion then
            local u11 = UnknownExplosion:Clone()
            u11.Parent = workspace.Trash
            u11.CFrame = a1.Model.PrimaryPart.Node.WorldCFrame
            EmitterManager.manualEmit(u11)
            a1:Delay(0.5, function() -- Line: 16 -- upvalues: u11 (val), TweenService (upval), a1 (upval)
                local SurfaceGui = u11:FindFirstChildWhichIsA("SurfaceGui", true)
                if SurfaceGui then
                    local v1, v2
                    for i, j in SurfaceGui:GetDescendants() do
                        if j:IsA("ImageLabel") then
                            v1 = TweenService
                            v2 = TweenInfo.new(0.5)
                            v1:Create(j, v2, {ImageTransparency = 1}):Play()
                        end
                    end
                    a1:Wait(0.5)
                end
                if u11 and u11.Parent then
                    u11:Destroy()
                end
            end)
        end
    end)
end

return v1