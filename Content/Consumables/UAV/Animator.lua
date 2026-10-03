-- Script path: ReplicatedStorage.Content.Consumables.UAV.Animator
-- Decompile time: 1.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local UAV = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects"):WaitForChild("Client"):WaitForChild("UAV")
return {
    OnUse = function(a1) -- Line: 16 -- upvalues: TypedPromise (val), UAV (val), Create (val), RunService (val), GameState (val)
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 17
            -- upvalues: a1 (val), UAV (upval), Create (upval), RunService (upval), GameState (upval)
            local Context = a1.Context
            local u5 = nil
            local u14 = math.max(0, (workspace:GetServerTimeNow()) - Context.started)
            local u18 = UAV:Clone()
            local v1 = Create("Sound", {SoundId = "rbxassetid://17446794228", Volume = 0.5, Looped = true})
            v1.Parent = u18.PrimaryPart
            v1:Play()
            u18.Parent = workspace.Terrain
            u5 = RunService.Stepped:Connect(function(a1, a2) -- Line: 36
                -- upvalues: u14 (ref), GameState (upval), Context (val), u5 (ref), u18 (val), a1_2 (val)
                u14 = u14 + a2 * GameState.TimeScale
                if not (Context.duration <= u14) then
                    u18.PropellarBase.Propeller.C0 = CFrame.Angles(0, 0, u14 * 90)
                    u18:PivotTo((CFrame.Angles(0, u14 * 0.5, 0)) * CFrame.new(0, 20, 0) * CFrame.new(0, 0, -40) * CFrame.Angles(2.007128639793479, 0, -1.5707963267948966))
                    return
                end
                u5:Disconnect()
                u18:Destroy()
                a1_2()
            end)
            a3(function() -- Line: 57 -- upvalues: u5 (ref), u18 (val)
                if u5.Connected then
                    u5:Disconnect()
                    u18:Destroy()
                end
            end)
        end)
    end,
}