-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.DepthOfField
-- Decompile time: 0.55 ms

local Lighting = game:GetService("Lighting")
local TweenService = game:GetService("TweenService")
return {
    Effect = Lighting:WaitForChild("DepthOfField"),
    Defaults = {FarIntensity = 0, FocusDistance = 0, InFocusRadius = 0, NearIntensity = 0},
    Enable = function(a1, a2, a3) -- Line: 15 -- upvalues: TweenService (val)
        a1.Effect.Enabled = true
        TweenService:Create(a1.Effect, a2, a3):Play()
    end,
    Disable = function(a1, a2, a3) -- Line: 23 -- upvalues: TweenService (val)
        local v1 = TweenService:Create(a1.Effect, a2, a3 or a1.Defaults)
        local u15 = nil
        local v2 = v1.Completed:Connect(function() -- Line: 30 -- upvalues: u15 (ref), a1 (val)
            u15:Disconnect()
            a1.Effect.Enabled = false
        end)
        v1:Play()
    end,
}