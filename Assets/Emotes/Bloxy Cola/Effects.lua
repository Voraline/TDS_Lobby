-- Script path: ReplicatedStorage.Assets.Emotes.Bloxy Cola.Effects
-- Decompile time: 0.64 ms

return {
    TakeOut = function(a1, a2) -- Line: 2
        local Cola = a2:FindFirstChild("Cola")
        if Cola then
            Cola.Handle.Equip:Play()
        end
    end,
    Open = function(a1, a2) -- Line: 10
        local Cola = a2:FindFirstChild("Cola")
        if Cola then
            Cola.Handle.Open:Play()
        end
    end,
    Drink = function(a1, a2) -- Line: 18
        local Cola = a2:FindFirstChild("Cola")
        if Cola then
            Cola.Handle.Gulp:Play()
            Cola.Handle.Drink.Emitter.Enabled = true
            wait(1.35)
            Cola.Handle.Drink.Emitter.Enabled = false
        end
    end,
    Throw = function(a1, a2) -- Line: 29
        local Cola = a2:FindFirstChild("Cola")
        if Cola then
            local v1 = Cola.Handle:Clone()
            for k, v in pairs(v1:GetChildren()) do
                if not v:IsA("SpecialMesh") then
                    v:Destroy()
                end
            end
            v1.CanCollide = true
            v1.CFrame = Cola.Handle.CFrame
            v1.Transparency = 0
            v1.Parent = workspace.CurrentCamera
            v1.Velocity = -a2.HumanoidRootPart.CFrame.lookVector * 15
            game.Debris:AddItem(v1, 2)
        end
    end,
}