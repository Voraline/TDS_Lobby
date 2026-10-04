-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.ConfuseVisuals
-- Decompile time: 2.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Particles = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects"):WaitForChild("Particles")
return {
    onAdded = function(a1, a2) -- Line: 16 -- upvalues: Particles (val), RunService (val)
        local Model = a1.Model
        if not Model then
            return nil
        end
        local Head = Model:FindFirstChild("Head")
        if not Head then
            return nil
        end
        local Confused = Particles:FindFirstChild("Confused")
        if not Confused then
            return nil
        end
        local u17 = Confused:Clone()
        u17.Parent = Head
        local Root = u17:FindFirstChild("Root")
        if Root then
            local Trail1 = Root:FindFirstChild("Trail1")
            local Trail2 = Root:FindFirstChild("Trail2")
            if Trail1 then
                Trail1.Enabled = true
            end
            if Trail2 then
                Trail2.Enabled = true
            end
        end
        local u33 = 0
        return {
            effect = u17,
            connection = RunService.Heartbeat:Connect(function(a1) -- Line: 50 -- upvalues: Head (val), u33 (ref), u17 (val)
                if Head and Head.Parent then
                    u33 = u33 + 4.71238898038469 * a1
                    u17:PivotTo((CFrame.new(Head.Position + Vector3.new(0, Head.Size.Y * 0.5, 0))) * (CFrame.Angles(0, u33, 0)))
                    return
                end
            end),
        }
    end,
    onRemoved = function(a1, a2, a3) -- Line: 64
        if not a3 then
            return
        end
        if a3.connection then
            a3.connection:Disconnect()
        end
        if a3.effect then
            a3.effect:Destroy()
        end
    end,
}