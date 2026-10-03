-- Script path: ReplicatedStorage.Assets.Emotes.Firework.Effects
-- Decompile time: 2.21 ms

local TweenService = game:GetService("TweenService")

local function explode(a1) -- Line: 3
    local Players = game:GetService("Players")
    game:GetService("TweenService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Character = Players.LocalPlayer.Character
    local u18 = {}
    local v1 = Color3.fromRGB(255, 255, 255)
    local v2 = Color3.fromRGB(255, 0, 0)
    local v3 = Color3.fromRGB(0, 0, 255)
    local v4 = Color3.fromRGB(0, 255, 255)
    u18[1] = v1
    u18[2] = v2
    u18[3] = v3
    u18[4] = v4
    u18[5] = Color3.fromRGB(255, 89, 89)

    function createDeb(a1) -- Line: 21
        local u3 = a1:Clone()
        u3.CFrame = a1.CFrame
        u3.Parent = workspace.CurrentCamera
        u3.Anchored = false
        u3.Velocity = Vector3.new(math.random(-75, 75), math.random(-75, 75), (math.random(-75, 75)))
        u3.CanCollide = false
        delay(1, function() -- Line: 29 -- upvalues: u3 (val)
            u3.Anchored = true
        end)
        game.Debris:AddItem(u3, 3)
        return u3
    end

    function createFirework(a1) -- Line: 38 -- upvalues: ReplicatedStorage (val), u18 (val)
        local v1 = ReplicatedStorage.Assets.Effects.Client.Firework:Clone()
        v1.CFrame = CFrame.new(a1)
        v1.Parent = workspace.CurrentCamera
        local v2 = u18[math.random(1, #u18)]
        v1.Trail.Color = ColorSequence.new(v2)
        v1.Flash.Color = ColorSequence.new(v2)
        local v3 = v1.CFrame * CFrame.new(0, math.random(80, 200), 0)
        v1.Boom:Play()
        v1.Flash:Emit(1)
        math.random()
        for i = 1, (math.random(10, 18)) do
            createDeb(v1)
        end
        game.Debris:AddItem(v1, 5)
    end

    for i = 1, 3 do
        spawn(function() -- Line: 58 -- upvalues: a1 (val)
            createFirework(a1)
        end)
    end
end

return {
    Place = function(a1, a2, a3) -- Line: 65 -- upvalues: TweenService (val), explode (val)
        local Firework = a2:FindFirstChild("Firework")
        local Lighter = a2:FindFirstChild("Lighter")
        if Firework and Lighter then
            local Handle = Firework:FindFirstChild("Handle")
            if Handle then
                Handle = Firework.Handle:Clone()
            end
            if Handle then
                local Handle_2 = Firework:WaitForChild("Handle")
                Handle_2.Transparency = 1
                Handle:WaitForChild("AccessoryWeld"):Destroy()
                Handle.Anchored = true
                Handle.CanCollide = false
                Handle.Parent = workspace.CurrentCamera
                Lighter.Handle.Click:Play()
                Lighter.Handle.Fire.Emitter.Enabled = true
                delay(0.75, function() -- Line: 84 -- upvalues: Lighter (val), Handle (val), TweenService (upval), explode (upval)
                    if not Lighter:IsDescendantOf(workspace) then
                        return Handle:Destroy()
                    end
                    Lighter.Handle.Fire.Emitter.Enabled = false
                    local Trail = Handle:WaitForChild("Trail")
                    Trail.Enabled = false
                    Handle:WaitForChild("Launch"):Play()
                    local Trail_2 = Handle:WaitForChild("Trail")
                    Trail_2.Enabled = true
                    local v1 = TweenService:Create(
                        Handle,
                        TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                        {CFrame = Handle.CFrame * CFrame.new(0, 0, -50)}
                    )
                    v1.Completed:Connect(function() -- Line: 99 -- upvalues: explode (upval), Handle (upval)
                        explode(Handle.Position)
                        local Trail = Handle:WaitForChild("Trail")
                        Trail.Enabled = false
                        Handle.Transparency = 1
                        delay(1, function() -- Line: 106 -- upvalues: Handle (upval)
                            Handle:Destroy()
                        end)
                    end)
                    v1:Play()
                end)
            end
        end
    end,
}