-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Gatling Gun
-- Decompile time: 0.94 ms

local RunService = game:GetService("RunService")
return {
    Init = function(a1, a2, a3) -- Line: 4 -- upvalues: RunService (val)
        if a1.Weapon:FindFirstChild("Goal") then
            a1.Weapon.Goal:Destroy()
        end
        if a2 and a2.Offset then
            a2.Offset = a2.Offset + Vector3.new(-0.30000001192092896, -0.20000000298023224, -0.5)
            a1.fakeCharacter:Destroy()
        end
        task.defer(function() -- Line: 14 -- upvalues: a1 (val), RunService (upval)
            if not a1.Weapon:FindFirstChild("Tilt") then
                return
            end
            local Pivot = a1.Weapon.Main:GetPivot()
            local Pivot_2 = a1.Weapon.Tilt:GetPivot()
            local u18 = nil
            local v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 23 -- upvalues: a1 (upval), u18 (ref), Pivot_2 (val), Pivot (val)
                if not a1.Parent then
                    u18:Disconnect()
                    return
                end
                local v1 = math.sin((tick())) * 0.09
                local v2 = math.cos((tick())) * 0.2
                a1.Weapon.Tilt:PivotTo(Pivot_2 * (CFrame.Angles(0, 0, -v2)))
                a1.Weapon.Main:PivotTo(Pivot * (CFrame.Angles(v1, v2, 0)))
            end)
        end)
    end,
}