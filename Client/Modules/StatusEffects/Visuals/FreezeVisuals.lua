-- Script path: ReplicatedStorage.Client.Modules.StatusEffects.Visuals.FreezeVisuals
-- Decompile time: 2.05 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Effects = ReplicatedStorage:WaitForChild("Assets"):WaitForChild("Effects")
return {
    onAdded = function(a1, a2) -- Line: 13 -- upvalues: Effects (val), TweenService (val)
        local Part1, Size, WeldConstraint, WeldConstraint_2, v1, v2
        local Part = a1.Part or a1.PrimaryPart
        if not Part then
            return nil
        end
        local Misc = Effects:FindFirstChild("Misc") and Effects.Misc:FindFirstChild("IceModels")
        if not Misc then
            return nil
        end
        local Children = Misc:GetChildren()
        if #Children == 0 then
            return nil
        end
        local v3 = {}
        local v4 = {}
        local v5 = a1.Hitbox or Part
        for i, j in v5.Parent:GetDescendants() do
            if j:IsA("Motor6D") then
                Part1 = j.Part1
                if Part1 then
                    WeldConstraint = Instance.new("WeldConstraint")
                    WeldConstraint.Name = ("%*_ICE_WELD"):format(Part1.Name)
                    WeldConstraint.Part0 = Part
                    WeldConstraint.Part1 = Part1
                    WeldConstraint.Parent = v5
                    table.insert(v3, WeldConstraint)
                    v1 = Children[math.random(#Children)]:Clone()
                    Size = Part1.Size
                    v1.Size = Vector3.new(0, 0, 0)
                    v1.Transparency = 0
                    v1.CFrame = Part1.CFrame
                    v1.CanCollide = false
                    v1.Anchored = false
                    v1.Parent = Part1
                    WeldConstraint_2 = Instance.new("WeldConstraint")
                    WeldConstraint_2.Part0 = Part1
                    WeldConstraint_2.Part1 = v1
                    WeldConstraint_2.Parent = v1
                    table.insert(v4, v1)
                    v2 = Size + Vector3.new(0.25, 0.25, 0.25)
                    TweenService:Create(
                        v1,
                        TweenInfo.new(math.random(10, 25) / 100, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {Size = v2}
                    ):Play()
                end
            end
        end
        return {welds = v3, ices = v4}
    end,
    onRemoved = function(a1, a2, a3) -- Line: 83 -- upvalues: TweenService (val)
        if not a3 then
            return
        end
        if a3.ices then
            local v1, v2
            for i, j in a3.ices do
                v2 = TweenService
                v1 = TweenInfo.new(0.2)
                v2:Create(j, v1, {Transparency = 1}):Play()
            end
            task.delay(0.25, function() -- Line: 93 -- upvalues: a3 (val)
                for i, j in a3.ices do
                    j:Destroy()
                end
            end)
        end
        if a3.welds then
            for k, n in a3.welds do
                n:Destroy()
            end
        end
    end,
}