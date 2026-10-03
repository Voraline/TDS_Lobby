-- Script path: ReplicatedStorage.Content.Maps.A Dark Tale.Animator
-- Decompile time: 5.54 ms

game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local DialogController = require(ReplicatedStorage.Client.Controllers.Shared.DialogController)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local Map = Network.Channel("Map")
local u44 = nil
local u45 = {}
local u46 = 8

function animateObject(a1, a2) -- Line: 24 -- upvalues: u46 (ref), TweenService (val)
    local v1 = a2 > 0
    local Y = a1:IsA("BasePart") and a1.Size.Y or a1:IsA("Model") and a1:GetExtentsSize().Y
    local Y_2 = a1:IsA("Model") and a1.WorldPivot.Position.Y or a1:IsA("BasePart") and a1.Position.Y
    local v2 = (u46 + Y_2 / 20) * Random.new():NextNumber(0.8, 1)
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

function fadeObject(a1, a2) -- Line: 60 -- upvalues: u46 (ref), TweenService (val)
    local v1 = u46 * Random.new():NextNumber(0.8, 1.5)
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

function IntroDialog() -- Line: 88 -- upvalues: RunService (val), DialogController (val)
    if RunService:IsStudio() then
        return
    end
    task.wait(1)
    for k, v in pairs({
        {
            Speaker = "Narrator",
            Emotion = "Neutral",
            Text = "You! Welcome to our show! Bear witness to a recollection of a tale almost lost to time! Become immersed with themes of desperation, conquest, and nostalgia. Without further to do, let me take you to the very beginning, where the story first began!",
            Voice = 15193808536,
        },
    }) do
        DialogController.Queue(v)
    end
end

function animateScene(a1, a2) -- Line: 108 -- upvalues: u45 (ref), Shaker (val), u46 (ref)
    local map = u45[a1].map
    local Moveable = map:WaitForChild("Moveable")
    local Fade = map:WaitForChild("Fade")
    local v1 = {}
    local v2 = {}
    Shaker:Shake({1.5, 25, 0.1, 1}, u46, 2)
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
    for k3, j in pairs(Fade:GetChildren()) do
        if j:IsA("Model") or j:IsA("BasePart") then
            table.insert(v2, j)
        elseif j:IsA("Folder") then
            for k4, k5 in pairs(j:GetChildren()) do
                if k5:IsA("Model") or k5:IsA("BasePart") then
                    table.insert(v2, k5)
                end
            end
        end
    end
    for k6, n in pairs(v2) do
        fadeObject(n, v3)
    end
    for k7, m in pairs(v1) do
        animateObject(m, v3)
    end
end

return function(a1, a2) -- Line: 152
    -- upvalues: u44 (ref), u45 (ref), GameState (val), DialogController (val), u46 (ref), Map (val), RunService (val)
    u44 = workspace:WaitForChild("Map")
    local Environment = u44:WaitForChild("Environment")
    local u12 = {}
    u45 = {
        {
            map = Environment:WaitForChild("Scene1"),
            desiredCFrame = CFrame.new(0.25, 20.74, -2.26),
        },
        {map = Environment:WaitForChild("Scene2"), desiredCFrame = CFrame.new(0, 0, 0)},
    }
    local u34 = {
        {
            Text = "Dying right before the turning point?.. NO NO NO, I've got to play the audience booing sound effect because you deserve it!",
            Voice = 15193809081,
        },
        {Text = "Dying right before the turning point?.. You're no fun!", Voice = 15193809201},
    }
    ;(GameState.State:GetStateChangedSignal("GameOver")):Connect(function(a1) -- Line: 180 -- upvalues: GameState (upval), u34 (val), DialogController (upval)
        if GameState.Health <= 0 then
            local v1 = u34[(Random.new()):NextInteger(1, #u34)]
            for k, v in pairs({
                {
                    Speaker = "Narrator",
                    Emotion = "Neutral",
                    Text = v1.Text,
                    Voice = v1.Voice,
                },
            }) do
                DialogController.Queue(v)
            end
        end
    end)
    for k, v in pairs({
        transitionScene = function(a1, a2, a3) -- Line: 208 -- upvalues: u46 (upval)
            local v3
            u46 = a3
            animateScene(a1, a2)
            return
        end,
    }) do
        Map:On(k, v)
    end
    for k2, i in pairs(Environment:WaitForChild("Chandeliers"):GetChildren()) do
        table.insert(u12, i.Spin)
    end
    a2:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 224 -- upvalues: u12 (val)
        local v1
        for k, v in pairs(u12) do
            v1 = v.PrimaryPart.CFrame * (CFrame.Angles(0, 0.5 * a1, 0))
            v:SetPrimaryPartCFrame(v1)
        end
    end)))
    local Umbra = Environment:FindFirstChild("Umbra")
    if Umbra then
        (Umbra:WaitForChild("AnimationController")):LoadAnimation((Umbra:WaitForChild("Animation"))):Play()
    end
    local Penumbras = Environment:FindFirstChild("Penumbras")
    if Penumbras then
        (Penumbras:WaitForChild("AnimationController")):LoadAnimation((Penumbras:WaitForChild("Animation"))):Play()
    end
    IntroDialog()
end