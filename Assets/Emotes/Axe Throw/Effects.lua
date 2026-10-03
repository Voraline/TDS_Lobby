-- Script path: ReplicatedStorage.Assets.Emotes.Axe Throw.Effects
-- Decompile time: 2.33 ms

game:GetService("TweenService")
local RunService = game:GetService("RunService")

local function u10() -- Line: 6
    local v1 = if (workspace:WaitForChild("Type")).Value ~= "Lobby" then {} else {workspace:WaitForChild("Barriers"), (workspace:WaitForChild("MatchPrompts"))}
    for k, v in pairs(game.Players:GetChildren()) do
        table.insert(v1, v.Character)
    end
    return v1
end

return {
    Freeze = function(a1, a2, a3) -- Line: 26
        a3:AdjustSpeed(0)
    end,
    Throw = function(a1, a2, a3) -- Line: 30 -- upvalues: u10 (val), RunService (val)
        local Axe = a2:FindFirstChild("Axe")
        local HumanoidRootPart = a2:FindFirstChild("HumanoidRootPart")
        if Axe and HumanoidRootPart then
            local v1 = HumanoidRootPart.Position - (HumanoidRootPart.CFrame * CFrame.new(0, 0, 34)).p
            local v2 = u10()
            local v3 = Ray.new(HumanoidRootPart.Position, v1)
            local u32, v4 = workspace:FindPartOnRayWithIgnoreList(v3, v2)
            local u37 = Axe.Handle:Clone()
            for k, v in pairs(u37:GetChildren()) do
                if not v:IsA("Attachment")
                    and not v:IsA("Trail")
                    and not v:IsA("ParticleEmitter")
                    and not v:IsA("Sound") then
                    v:Destroy()
                end
            end
            local v5 = HumanoidRootPart.CFrame - HumanoidRootPart.Position
            u37.Name = "FakeAxe"
            u37.Parent = Axe
            u37.CFrame = v5 * CFrame.Angles(0, 0, 1.5707963267948966) + Axe.Handle.Position
            u37.Trail.Enabled = true
            local BodyPosition = Instance.new("BodyPosition")
            local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
            BodyPosition.D = 600
            BodyPosition.Position = u37.CFrame.p
            BodyPosition.Parent = u37
            BodyAngularVelocity.AngularVelocity = Vector3.new(0, 20, 0)
            BodyAngularVelocity.Parent = u37
            Axe.Handle.Spin:Play()
            Axe.Handle.Transparency = 1

            local function v6() -- Line: 72 -- upvalues: Axe (val), u37 (val), a3 (val)
                Axe.Handle.Transparency = 0
                Axe.Handle.Return:Play()
                u37.Transparency = 1
                u37.Anchored = true
                game.Debris:AddItem(u37, 2)
                a3:AdjustSpeed(1)
                a3.TimePosition = 2.5
            end

            local u89 = false
            local u91 = v4
            local u92 = nil
            local v7 = RunService.RenderStepped:Connect(function(a1) -- Line: 88
                -- upvalues: a2 (val), u92 (ref), u89 (ref), u91 (ref), HumanoidRootPart (val), BodyPosition (val)
                -- upvalues: u37 (val), u32 (val), Axe (val), a3 (val)
                if a2:FindFirstChild("Axe") ~= nil and a2:FindFirstChild("HumanoidRootPart") ~= nil then
                    if u89 then
                        u91 = HumanoidRootPart.Position
                    end
                    BodyPosition.Position = u91
                    if (u37.Position - u91).Magnitude < 3 then
                        if u89 then
                            Axe.Handle.Transparency = 0
                            Axe.Handle.Return:Play()
                            u37.Transparency = 1
                            u37.Anchored = true
                            game.Debris:AddItem(u37, 2)
                            a3:AdjustSpeed(1)
                            a3.TimePosition = 2.5
                            u92:Disconnect()
                        else
                            u89 = true
                            if u32 then
                                u37.Hit:Play()
                                u37.Spark:Emit(15)
                                return
                            end
                        end
                    end
                    return
                end
                u92:Disconnect()
            end)
        end
    end,
}