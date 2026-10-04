-- Script path: ReplicatedStorage.Content.Maps.Pls Donate.Animator
-- Decompile time: 2.56 ms

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local u10 = nil
local u11 = {
    ["Floss Dance"] = "http://www.roblox.com/asset/?id=10714340543",
    Monkey = "http://www.roblox.com/asset/?id=10714388352",
    ["Olivia Rodrigo Head Bop"] = "http://www.roblox.com/asset/?id=15517864808",
    ["Old Town Road Dance - Lil Nas X (LNX)"] = "http://www.roblox.com/asset/?id=10714391240",
    Confused = "http://www.roblox.com/asset/?id=4940561610",
    ["High Wave"] = "http://www.roblox.com/asset/?id=10714362852",
    Bored = "http://www.roblox.com/asset/?id=10713992055",
    ["Jumping Wave"] = "http://www.roblox.com/asset/?id=10714378156",
}
local u20 = {
    "http://www.roblox.com/asset/?id=182436842",
    "http://www.roblox.com/asset/?id=182491248",
    "http://www.roblox.com/asset/?id=182491277",
    "http://www.roblox.com/asset/?id=182435998",
    "http://www.roblox.com/asset/?id=182491037",
    "http://www.roblox.com/asset/?id=182491065",
    "http://www.roblox.com/asset/?id=182491423",
}
return function(a1, a2) -- Line: 30 -- upvalues: u10 (ref), RunService (val), Players (val), u11 (val), u20 (val)
    local Animation, getModel, result, success, v1
    u10 = a1
    local Blimps = ((u10:WaitForChild("Environment")):WaitForChild("ManMade")):WaitForChild("Blimps")
    RunService.Heartbeat:Connect(function(a1) -- Line: 35 -- upvalues: Blimps (val) -- types: a1: number
        Blimps:PivotTo((Blimps:GetPivot()) * (CFrame.Angles(0, math.rad(a1 * 20), 0)))
    end)
    local FriendsOnline = Players.LocalPlayer:GetFriendsOnline(50)
    if #FriendsOnline <= 0 then
        FriendsOnline = {
            {VisitorId = 19004289},
            {VisitorId = 8073216},
            {VisitorId = 11643},
            {VisitorId = 83066639},
            {VisitorId = 49601674},
            {VisitorId = 6542620},
            {VisitorId = 4545223},
            {VisitorId = 6757996},
            {VisitorId = 20391411},
            {VisitorId = 17914141},
        }
    end

    function getModel(a1) -- Line: 58 -- upvalues: Players (upval), getModel (val) -- types: a1: number
        local success, result = pcall(function() -- Line: 59 -- upvalues: Players (upval), a1 (val)
            return Players:CreateHumanoidModelFromUserId(a1)
        end)
        if success then
            return result
        end
        task.wait(3)
        return getModel(a1)
    end

    for i, j in u10.Environment.ManMade.Details:GetChildren() do
        if j.Name == "Booth" then
            local VisitorId = FriendsOnline[math.random(1, #FriendsOnline)].VisitorId
            success, result = pcall(function() -- Line: 59 -- upvalues: Players (upval), VisitorId (val)
                return Players:CreateHumanoidModelFromUserId(VisitorId)
            end)
            if success then
                v1 = result
            else
                task.wait(3)
                v1 = getModel(VisitorId)
            end
            v1:ScaleTo(0.5)
            v1:PivotTo(j.CFrame * CFrame.new(0, 0, -1.25) * (CFrame.Angles(0, 3.141592653589793, 0)))
            for k, n in v1:GetDescendants() do
                if n:IsA("BasePart") then
                    n.CanCollide = false
                    n.CollisionGroup = "FakePlayers"
                end
            end
            v1.Parent = workspace
            local u115 = {}
            local u116 = nil
            for m, i5 in not (v1.Humanoid.RigType ~= Enum.HumanoidRigType.R15) and u11 or u20 do
                Animation = Instance.new("Animation")
                Animation.AnimationId = i5
                table.insert(u115, (v1.Humanoid.Animator:LoadAnimation(Animation)))
            end
            task.spawn(function() -- Line: 97 -- upvalues: u116 (ref), u115 (val)
                while true do
                    if u116 then
                        u116:Stop()
                    end
                    u116 = u115[math.random(1, #u115)]
                    u116:Play()
                    task.wait(math.random(10, 20))
                end
            end)
        end
    end
end