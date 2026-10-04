-- Script path: ReplicatedStorage.Content.Maps.Krampus Frosthold.Animator
-- Decompile time: 6.36 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local u26 = nil
local u27 = {}
local LocalPlayer = Players.LocalPlayer
local Network = require(ReplicatedStorage.Shared.Modules.Network)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local Map = Network.Channel("Map")
local u42 = 8
local Animation = Instance.new("Animation")
Animation.AnimationId = "rbxassetid://15633504956"
local Animation_2 = Instance.new("Animation")
Animation_2.AnimationId = "rbxassetid://15633509599"
local u51 = nil
local u52 = nil

local function getAnimatableObjects(a1, a2) -- Line: 28 -- upvalues: table (val)
    local v1 = a2 > 0
    local Y = a1:IsA("BasePart") and a1.Size.Y or a1:IsA("Model") and a1:GetExtentsSize().Y
    local v2 = {}
    local v3 = {}
    local v4 = a2 < 0 and Y * 1.5 or Y
    if a1:IsA("BasePart") and not a1:GetAttribute("Static") then
        if v1 then
            a1.CFrame = a1.CFrame + Vector3.new(0, v4 * -1, 0)
        end
        table.insert(v2, a1)
        v3[a1] = v4
        return v2, v3
    end
    if a1:IsA("Model") and not a1:GetAttribute("Static") then
        if v1 then
            a1:PivotTo(a1.WorldPivot + (Vector3.new(0, v4 * -1, 0)))
        end
        for i, j in a1:GetDescendants() do
            if j:IsA("BasePart") then
                table.insert(v2, j)
                v3[j] = v4
            end
        end
    end
    return v2, v3
end

local function animateScene(a1, a2) -- Line: 63
    -- upvalues: u27 (val), Shaker (val), u42 (ref), u26 (ref), LocalPlayer (val), TweenService (val), u51 (ref)
    -- upvalues: Animation (val), u52 (ref), Animation_2 (val), table (val), getAnimatableObjects (val)
    -- upvalues: RunService (val)
    local v1, v2
    local map = u27[a1].map
    Shaker:Shake({1.5, 25, 0.1, 1}, u42, 2)
    local Environment = u26:FindFirstChild("Environment")
    local TransitionVFX = Environment and Environment:FindFirstChild("TransitionVFX")
    if TransitionVFX then
        for i, j in TransitionVFX:GetChildren() do
            if j:IsA("ParticleEmitter") then
                j.Enabled = true
                task.delay(u42 * 2 + 4, function() -- Line: 78 -- upvalues: j (val)
                    j.Enabled = false
                end)
            end
        end
    end
    local Character = LocalPlayer.Character
    if Character then
        local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
        if HumanoidRootPart then
            HumanoidRootPart.Anchored = true
            local v3 = TweenService:Create(
                HumanoidRootPart,
                TweenInfo.new(u42, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0),
                {CFrame = HumanoidRootPart.CFrame + Vector3.new(0, -a2 * 25, 0)}
            )
            local Humanoid = Character:FindFirstChildOfClass("Humanoid")
            local Animator = Humanoid and Humanoid:FindFirstChildOfClass("Animator")
            if not u51 then
                u51 = Animator and Animator:LoadAnimation(Animation)
            end
            if not u52 then
                u52 = Animator and Animator:LoadAnimation(Animation_2)
            end
            if u51 and u52 and a2 == -1 then
                u51:Play()
                u51.Stopped:Connect(function() -- Line: 115 -- upvalues: u52 (upval)
                    u52:Play()
                end)
            end
            if a2 == 1 then
                v3.Completed:Connect(function() -- Line: 121 -- upvalues: HumanoidRootPart (val), u51 (upval), u52 (upval)
                    HumanoidRootPart.Anchored = false
                    if u51 then
                        u51:Stop()
                        u51 = nil
                    end
                    if u52 then
                        u52:Stop()
                        u52 = nil
                    end
                end)
            end
            v3:Play()
        end
    end
    local v4 = {}
    for k, n in map:GetChildren() do
        if n:IsA("Model") or n:IsA("BasePart") then
            table.insert(v4, n)
        elseif n:IsA("Folder") then
            for m, i5 in n:GetChildren() do
                if i5:IsA("Model") or i5:IsA("BasePart") then
                    table.insert(v4, i5)
                end
            end
        end
    end
    local u219 = {}
    local u172 = {}
    local u305 = {}
    if a2 == 1 then
        local Ground = workspace:FindFirstChild("Ground")
        if Ground then
            local v5
            for i6, i7 in Ground:GetChildren() do
                if i7:IsA("BasePart") then
                    v2, v5 = getAnimatableObjects(i7, -a2)
                    for i8, i9 in v5 do
                        u172[i8] = i9
                    end
                    u219 = table.mergeList(u219, v2)
                end
            end
        end
    end
    local v6 = nil
    local v7 = nil
    for i10, i11 in v4, v6, v7 do
        v1, v2 = getAnimatableObjects(i11, a2)
        for i12, i13 in v2 do
            u172[i12] = i13
        end
        u219 = table.mergeList(u219, v1)
    end
    for i14, i15 in u219 do
        table.insert(u305, i15.CFrame)
    end
    local u252 = nil
    local u253 = 0
    local Sine = Enum.EasingStyle.Sine
    local In = Enum.EasingDirection.In
    local v8 = RunService.PreSimulation:Connect(function(a1) -- Line: 194
        -- upvalues: u253 (ref), u42 (upval), TweenService (upval), Sine (val), In (val), u219 (ref), u172 (val)
        -- upvalues: u305 (val), a2 (val), table (upval), u252 (ref)
        local v1, v2
        u253 = u253 + a1
        local v3 = u253 / u42
        local v4 = math.min(TweenService:GetValue(v3, Sine, In), 1)
        local v5 = {}
        local v6 = {}
        for i, j in u219 do
            v1 = u172[j]
            v2 = u305[i]:Lerp(u305[i] + Vector3.new(0, v1 * a2, 0), v4)
            table.insert(v5, j)
            table.insert(v6, v2)
        end
        workspace:BulkMoveTo(v5, v6, Enum.BulkMoveMode.FireCFrameChanged)
        if v4 == 1 and u252 and u252.Connected then
            u252:Disconnect()
            u252 = nil
        end
    end)
end

return function(a1, a2) -- Line: 222 -- upvalues: u26 (ref), table (val), u27 (val), u42 (ref), animateScene (val), Map (val)
    local Scenes = a1:WaitForChild("Scenes")
    table.insert(u27, {
        map = Scenes:WaitForChild("Default"),
        desiredCFrame = CFrame.new(0.757, 33.198, -0.342),
    })
    table.insert(u27, {
        map = Scenes:WaitForChild("BridgeWorld"),
        desiredCFrame = CFrame.new(0.21, 29.677, -0.389),
    })
    table.insert(u27, {
        map = Scenes:WaitForChild("IceWorld"),
        desiredCFrame = CFrame.new(-2.42809868, 37.7728195, -1.10333252, -1, 0, 0, 0, 1, 0, 0, 0, -1),
    })
    for i, j in {
        transitionScene = function(a1, a2, a3) -- Line: 254
            -- upvalues: u42 (upval), animateScene (upval)
            local Music, Music_2, v3, v4
            if a1 ~= 3 then
                if a1 == 1 then
                    Music_2 = workspace:WaitForChild("Music")
                    Music_2.Value = "Winter Fall"
                end
            else
                Music = workspace:WaitForChild("Music")
                Music.Value = "Krampus"
            end
            u42 = a3
            animateScene(a1, a2)
            return
        end,
    } do
        Map:On(i, j)
    end
end