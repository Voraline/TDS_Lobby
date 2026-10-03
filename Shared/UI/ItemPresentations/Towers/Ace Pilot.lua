-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Ace Pilot
-- Decompile time: 0.86 ms

local RunService = game:GetService("RunService")
return {
    Init = function(a1, a2, a3) -- Line: 3 -- upvalues: RunService (val)
        a1.HumanoidRootPart:Destroy()
        a1.PrimaryPart = a1.Weapon.Main
        a1:PivotTo((CFrame.new(0, 0, 0)))
        a2.Offset = Vector3.new(-0.5, 0, -2.5)
        a2.Rotation = CFrame.Angles(0, -0.3490658503988659, 3.141592653589793)
        a2.ShadowRadius = 1.5
        local u25 = CFrame.new()
        local u26 = nil
        local v1 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 13 -- upvalues: a1 (val), u26 (ref), a2 (val), u25 (ref)
            local v1 = math.sin((tick()) * 2) * 0.09
            local v2 = math.cos((tick()) * 2) * 0.09
            if not a1.Parent then
                u26:Disconnect()
                return
            end
            local v3 = (CFrame.new(a2.Offset)) * a2.Rotation * CFrame.new(v1, v2, 0) * CFrame.Angles(v1 / 4, 0, v2 / 4)
            if a1.Weapon:FindFirstChild("Propeller") then
                u25 = u25 * CFrame.Angles(0, 0, (math.rad(1800 * a1_2)))
                a1.Weapon.Propeller.Motor.C1 = u25
            end
            a1:PivotTo(v3)
        end)
    end,
}