-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.Pursuit
-- Decompile time: 1.35 ms

local RunService = game:GetService("RunService")
return {
    Init = function(a1, a2, a3) -- Line: 6 -- upvalues: RunService (val)
        local v1
        local Name = a1.Name
        local Heli = (a1:WaitForChild("Weapon")):WaitForChild("Heli")
        local RootPart = if not Heli:IsA("Folder") then Heli.PrimaryPart else a1.RootPart
        if Name ~= "Dragon" then
            v1 = ((a1:WaitForChild("Upgrades")):WaitForChild("0")):WaitForChild("BasePad")
        else
            v1 = a1:WaitForChild("BasePad")
            a1:ScaleTo(0.8)
        end
        v1:Destroy()
        local Configuration = Heli:WaitForChild("Configuration")
        local TailRotor = Configuration.Bones:FindFirstChild("TailRotor")
        if TailRotor then
            TailRotor = Configuration.Bones.TailRotor.Value
        end
        local TopRotor = Configuration.Bones:FindFirstChild("TopRotor")
        if TopRotor then
            TopRotor = Configuration.Bones.TopRotor.Value
        end
        a1.PrimaryPart = RootPart
        if TailRotor or TopRotor then
            local u80 = nil
            local v2 = RunService.RenderStepped:Connect(function(a1_2) -- Line: 30 -- upvalues: a1 (val), u80 (ref), TopRotor (val), TailRotor (val) -- types: a1_2: number
                local v1
                if not a1.Parent then
                    u80:Disconnect()
                    return
                end
                if TopRotor then
                    v1 = TopRotor
                    v1.Transform = v1.Transform * CFrame.Angles(0, a1_2 * 17.453292519943297, 0)
                end
                if TailRotor then
                    v1 = TailRotor
                    v1.Transform = v1.Transform * CFrame.Angles(0, a1_2 * 17.453292519943297 * 1.5, 0)
                end
            end)
        end
        if not a3 then
            a2.Offset = Vector3.new(-0.5, 0.10000000149011612, -2)
            a2.Rotation = CFrame.Angles(0, 3.490658503988659, 0)
        else
            a2.Offset = Vector3.new(-0.30000001192092896, -0.8999999761581421, -10)
            a2.Rotation = CFrame.Angles(0, 3.490658503988659, -0.3490658503988659)
        end
        a2.ShadowRadius = 1.5
    end,
    Animation = function(a1) -- Line: 57
        if a1:FindFirstChild("Animations") and a1.Animations:FindFirstChild("Fly") then
            return a1.Animations.Fly["0"]
        end
        return nil
    end,
}