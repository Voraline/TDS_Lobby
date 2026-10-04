-- Script path: ReplicatedStorage.Content.Emote.Victory's Kiss.Animator
-- Decompile time: 0.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 11 -- upvalues: TweenService (val), EmitterManager (val)
    local Trophy = a1.Character.Instance:WaitForChild("Trophy")
    a1:OnTrackPlayed("rbxassetid://103366023065159", function(a1) -- Line: 13 -- upvalues: Trophy (val), TweenService (upval), EmitterManager (upval) -- types: a1: userdata
        local function play() -- Line: 14 -- upvalues: Trophy (upval), TweenService (upval), EmitterManager (upval)
            local BasePart = Trophy:FindFirstChildWhichIsA("BasePart")
            if BasePart and BasePart:IsDescendantOf(workspace) then
                local function doTween(a1, a2) -- Line: 17
                    -- upvalues: TweenService (upval), BasePart (val), EmitterManager (upval)
                    local v1 = TweenService:Create(BasePart, TweenInfo.new(2), {Transparency = a1})
                    v1:Play()
                    v1.Completed:Once(function() -- Line: 22 -- upvalues: EmitterManager (upval), BasePart (upval), a2 (val)
                        EmitterManager.toggle(BasePart, a2)
                    end)
                end

                BasePart.Transparency = 1
                doTween(0, true)
                task.delay(6, function() -- Line: 28 -- upvalues: BasePart (val), doTween (val)
                    if BasePart and BasePart:IsDescendantOf(workspace) then
                        doTween(1, false)
                    end
                end)
            end
        end

        play()
        local u8 = a1.DidLoop:Connect(play)
        a1.Stopped:Once(function() -- Line: 37 -- upvalues: u8 (val)
            u8:Disconnect()
        end)
    end)
end

return v1