-- Script path: ReplicatedStorage.Content.Maps.The Haunted Past.Animator
-- Decompile time: 5.51 ms

game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local Map = Network.Channel("Map")
local u38 = nil
local u39 = {}
local u40 = 8

function animateObject(a1, a2) -- Line: 23 -- upvalues: u40 (ref), TweenService (val)
    local v1 = a2 > 0
    local Y = a1:IsA("BasePart") and a1.Size.Y or a1:IsA("Model") and a1:GetExtentsSize().Y
    local Y_2 = a1:IsA("Model") and a1.WorldPivot.Position.Y or a1:IsA("BasePart") and a1.Position.Y
    local v2 = (u40 + Y_2 / 20) * Random.new():NextNumber(0.8, 1)
    local v3 = TweenInfo.new(v2, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
    local v4 = a2 < 0 and Y * 1.5 or Y
    if a1:IsA("BasePart") then
        if v1 then
            a1.CFrame = a1.CFrame + Vector3.new(0, v4 * -1, 0)
            print("repositioned", a1.Name)
        end
        TweenService:Create(a1, v3, {CFrame = a1.CFrame + Vector3.new(0, v4 * a2, 0)}):Play()
        return
    end
    if a1:IsA("Model") then
        local v5, v6
        if v1 then
            a1:PivotTo(a1.WorldPivot + (Vector3.new(0, v4 * -1, 0)))
        end
        for k, v in pairs(a1:GetDescendants()) do
            if v:IsA("BasePart") then
                v5 = TweenService
                v6 = {CFrame = v.CFrame + Vector3.new(0, v4 * a2, 0)}
                v5:Create(v, v3, v6):Play()
            end
        end
    end
end

function fadeObject(a1, a2) -- Line: 59 -- upvalues: u40 (ref), TweenService (val)
    local v1 = u40 * Random.new():NextNumber(0.8, 1.5)
    local v2 = TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
    if a1:IsA("BasePart") then
        local Transparency = a2 > 0 and a1.Transparency or 1
        if a2 > 0 then
            a1.Transparency = 1
        end
        TweenService:Create(a1, v2, {Transparency = Transparency}):Play()
        return
    end
    if a1:IsA("Model") then
        local Transparency_2
        for k, v in pairs(a1:GetDescendants()) do
            if v:IsA("BasePart") then
                Transparency_2 = a2 > 0 and v.Transparency or 1
                if a2 > 0 then
                    v.Transparency = 1
                end
                TweenService:Create(v, v2, {Transparency = Transparency_2}):Play()
            end
        end
    end
end

function animateScene(a1, a2) -- Line: 88 -- upvalues: u39 (ref), Shaker (val), u40 (ref), u38 (ref)
    local map = u39[a1].map
    local Moveable = map:WaitForChild("Moveable")
    local Fade = map:WaitForChild("Fade")
    local v1 = {}
    local v2 = {}
    Shaker:Shake({1.5, 25, 0.1, 1}, u40, 2)
    local v3 = a2
    for k, v in pairs(Moveable:GetChildren()) do
        if v:IsA("Model") or v:IsA("BasePart") then
            table.insert(v1, v)
        elseif v:IsA("Folder") then
            for k2, i in pairs(v:GetChildren()) do
                if i:IsA("Model") or i:IsA("BasePart") then
                    table.insert(v1, i)
                end
            end
        end
    end
    local Ground = #u38:WaitForChild("Ground"):GetChildren() > 0 and u38:WaitForChild("Ground") or workspace:WaitForChild("Ground")
    for k3, j in pairs(Ground:GetChildren()) do
        if j:IsA("BasePart") or j:IsA("Model") then
            table.insert(v2, j)
        end
    end
    for k4, k5 in pairs(Fade:GetChildren()) do
        if k5:IsA("Model") or k5:IsA("BasePart") then
            table.insert(v2, k5)
        elseif k5:IsA("Folder") then
            for k6, n in pairs(k5:GetChildren()) do
                if n:IsA("Model") or n:IsA("BasePart") then
                    table.insert(v2, n)
                end
            end
        end
    end
    for k7, m in pairs(v2) do
        fadeObject(m, v3)
    end
    for k8, i5 in pairs(v1) do
        animateObject(i5, v3)
    end
end

return function(a1, a2) -- Line: 142 -- upvalues: u38 (ref), u39 (ref), GameState (val), u40 (ref), Map (val), RunService (val)
    u38 = workspace:WaitForChild("Map")
    local Environment = u38:WaitForChild("Environment")
    local u12 = {}
    u39 = {
        {
            map = Environment:WaitForChild("Scene1"),
            desiredCFrame = CFrame.new(0, 16.027, 0),
        },
        {
            map = Environment:WaitForChild("Scene2"),
            desiredCFrame = (CFrame.new(0, 14.395, 0)) * CFrame.Angles(0, -1.5707963267948966, 0),
        },
    }
    ;(GameState.State:GetStateChangedSignal("Wave")):Connect(function(a1) end)
    for k, v in pairs({
        transitionScene = function(a1, a2, a3) -- Line: 162 -- upvalues: u40 (upval)
            local v3
            u40 = a3
            animateScene(a1, a2)
            return
        end,
        RemoveOldScene = function() -- Line: 167
            local Boundaries, Cliff, v0, v1, v2, v3, v4, v5, v6, v7, v8
            Cliff = workspace:WaitForChild("Cliff")
            Boundaries = workspace:WaitForChild("Boundaries")
            for k, v in pairs(Cliff:GetChildren()) do
                if not v:IsA("Highlight") then
                    if not v:IsA("Humanoid") then
                        v:Destroy()
                    end
                end
            end
            for k2, i in pairs(Boundaries:GetChildren()) do
                if not i:IsA("Highlight") then
                    if not i:IsA("Humanoid") then
                        i:Destroy()
                    end
                end
            end
            return
        end,
        InitializeScene = function() -- Line: 184 -- upvalues: u38 (upval)
            local Boundaries, Boundaries_2, Cliff, Cliff_2, v0, v1, v2, v3, v4, v5, v6, v7, v8
            Cliff = u38:WaitForChild("Cliff")
            Boundaries = u38:WaitForChild("Boundaries")
            Cliff_2 = workspace:WaitForChild("Cliff")
            Boundaries_2 = workspace:WaitForChild("Boundaries")
            for k, v in pairs(Cliff:GetChildren()) do
                v.Parent = Cliff_2
            end
            for k2, i in pairs(Boundaries:GetChildren()) do
                i.Parent = Boundaries_2
            end
            return
        end,
    }) do
        Map:On(k, v)
    end
    for k2, i in pairs(Environment:WaitForChild("Chandeliers"):GetChildren()) do
        table.insert(u12, i.Spin)
    end
    a2:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 211 -- upvalues: u12 (val)
        local v1
        for k, v in pairs(u12) do
            v1 = v.PrimaryPart.CFrame * (CFrame.Angles(0, 0.5 * a1, 0))
            v:SetPrimaryPartCFrame(v1)
        end
    end)))
end