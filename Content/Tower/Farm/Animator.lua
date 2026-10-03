-- Script path: ReplicatedStorage.Content.Tower.Farm.Animator
-- Decompile time: 22.27 ms

local Debris = game:GetService("Debris")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local LocalPlayer = Players.LocalPlayer
local v1 = {}
v1.__index = v1
local u59 = Random.new()
local u60 = {}

u60["Lemonade Stand"] = function(a1, a2) -- Line: 23
    if a2 == 5 then
        a1.Upgrades["5"].Stand_Lvl5.Parent = a1
    end
end

function u60.PNG(a1, a2) -- Line: 28
    task.defer(function() -- Line: 29 -- upvalues: a1 (val), a2 (val)
        for i, j in a1.Upgrades[tostring(a2)]:GetDescendants() do
            if j:IsA("SurfaceGui") then
                j.Enabled = true
            end
            if j:IsA("BasePart") then
                j.Transparency = 0.999
            end
        end
    end)
end

u60["Null Soul"] = function(a1, a2) -- Line: 40 -- upvalues: EmitterManager (val), EasySound (val)
    local Root = a1.PrimaryPart:WaitForChild("Root")
    local Ambient = a1.PrimaryPart:WaitForChild("Ambient")
    EmitterManager.toggle(Root, true)
    if a2 == 0 then
        EasySound.Play({
            looped = true,
            volume = 0.25,
            soundGroupName = "Towers",
            timeScaled = true,
            id = Ambient.SoundId,
            parent = Root,
        })
    end
end

local function bezier(a1, a2, a3, a4) -- Line: 57
    return (1 - a4) ^ 2 * a1 + 2 * (1 - a4) * a4 * a2 + a4 ^ 2 * a3
end

local function randomAngle() -- Line: 61
    return Random.new():NextNumber(-3.141592653589793, 3.141592653589793)
end

function v1.Initialize(a1) -- Line: 65
    -- upvalues: EmitterManager (val), u60 (val), Animation (val), EasySound (val), Players (val)
    -- upvalues: TimescaleUtilities (val), RunService (val), GameState (val), Debris (val), ReplicatedStorage (val)
    -- upvalues: randomAngle (val), TweenService (val), u59 (val), EffectsController (val), LocalPlayer (val)
    local RootPart = a1.Model:FindFirstChild("RootPart")
    if not RootPart then
        RootPart = a1.Model.HumanoidRootPart
    end
    local Effect = a1.Model:FindFirstChild("Effect")
    if not Effect then
        Effect = RootPart:FindFirstChild("Effect")
    end
    local PlacementVFX = a1.Model:FindFirstChild("PlacementVFX")
    if PlacementVFX then
        EmitterManager.manualEmit(PlacementVFX)
    end
    a1.OnUpgrade:Connect(function(a1_2) -- Line: 73 -- upvalues: u60 (upval), a1 (val)
        if u60[a1.Model.Name] then
            u60[a1.Model.Name](a1.Model, a1_2)
        end
    end)
    if u60[a1.Model.Name] then
        u60[a1.Model.Name](a1.Model, a1:GetLevel())
    end
    if a1.FBXModel and a1.Model.Name == "Null Soul" then
        local Animator = a1.Model:FindFirstChildWhichIsA("Animator", true)
        local Idle = a1.Model.Animations:FindFirstChild("Idle")
        if Animator and Idle then
            Animation.new({
                IgnorePriority = true,
                IsPersistent = true,
                Preload = true,
                Track = Idle,
                Target = Animator,
                Properties = {Looped = true},
            }):Play()
        end
    end
    local v1 = {
        Cash = function(a1_2) -- Line: 102
            -- upvalues: RootPart (val), EasySound (upval), Players (upval), a1 (val), Effect (val)
            -- upvalues: EmitterManager (upval), TimescaleUtilities (upval), RunService (upval), GameState (upval)
            -- upvalues: Debris (upval), ReplicatedStorage (upval), randomAngle (upval), TweenService (upval)
            -- upvalues: u59 (upval), EffectsController (upval)
            local v1
            local Coin = RootPart:FindFirstChild("Coin")
            if Coin and Coin:IsA("Sound") then
                EasySound.Play({
                    audioGroup = "Towers",
                    playbackSpeed = 1,
                    destroyOnEnd = true,
                    id = Coin.SoundId,
                    parent = RootPart,
                })
            end
            local PlayerByUserId = Players:GetPlayerByUserId(a1.Model.Owner.Value)
            local Character = PlayerByUserId
            if Character then
                Character = PlayerByUserId.Character
                if Character then
                    Character = PlayerByUserId.Character:FindFirstChild("HumanoidRootPart")
                end
            end
            local v2 = a1.Model:FindFirstChild((("Effect_Lvl%*"):format((a1:GetLevel())))) or Effect
            if v2 then
                EmitterManager.manualEmit(v2)
            end
            local Name = a1.Model.Name
            if Name == "PNG" then
                if Character and PlayerByUserId then
                    task.spawn(function() -- Line: 131
                        -- upvalues: TimescaleUtilities (upval), a1 (upval), EmitterManager (upval), RunService (upval)
                        -- upvalues: Character (val), GameState (upval)
                        local v1
                        for i = 1, 4 do
                            TimescaleUtilities.Wait(0.1)
                            if not a1.Model:FindFirstChild("HumanoidRootPart") then
                                break
                            end
                            local u97 = a1.Model.Coin:Clone()
                            u97.Parent = workspace
                            EmitterManager.manualEmit(u97)
                            for j, k in u97:GetDescendants() do
                                if k:IsA("ParticleEmitter") or k:IsA("Trail") then
                                    k.Enabled = true
                                end
                            end
                            local Position = a1.Model.HumanoidRootPart.Position
                            local u65 = Position + Vector3.new(
                                Random.new():NextNumber(-20, 20),
                                Random.new():NextNumber(10, 25),
                                (Random.new():NextNumber(-20, 20))
                            )
                            local u66 = 0
                            local u67 = nil
                            v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 159
                                -- upvalues: Character (upval), u66 (ref), GameState (upval), a1 (upval), u97 (val)
                                -- upvalues: u67 (ref), Position (val), u65 (val)
                                local Position_2 = Character.Position
                                u66 = u66 + a1_2 * GameState.TimeScale / 0.8
                                if not (u66 >= 1) then
                                    local v1 = u97
                                    local new = CFrame.new
                                    local v2 = u66
                                    v1.CFrame = (new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u65 + v2 ^ 2 * Position_2)) * CFrame.Angles(-math.rad(u66 * 30), math.rad(u66 * 90), (math.rad(u66 * 40))) * CFrame.Angles(0, 0, 1.5707963267948966)
                                    return
                                end
                                if a1.Model.Parent then
                                    for i, j in u97:GetDescendants() do
                                        if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                                            j.Enabled = false
                                        end
                                    end
                                end
                                u97:Destroy()
                                u67:Disconnect()
                            end)
                        end
                    end)
                end
                if PlayerByUserId and Character and a1_2 > 0 then
                    v1 = Character.CFrame * CFrame.new(
                        Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                    )
                    EffectsController.Cash(RootPart.Position, v1.p)
                end
                return
            end
            if Name == "Lemonade Stand" then
                if Character and PlayerByUserId then
                    task.spawn(function() -- Line: 189
                        -- upvalues: TimescaleUtilities (upval), a1 (upval), RunService (upval), Character (val)
                        -- upvalues: GameState (upval), EmitterManager (upval), Debris (upval)
                        local v1
                        for i = 1, 4 do
                            TimescaleUtilities.Wait(0.1)
                            if not a1.Model:FindFirstChild("HumanoidRootPart") then
                                break
                            end
                            local u95 = a1.Model.LemonadeCoin:Clone()
                            u95.Parent = workspace
                            for j, k in u95:GetDescendants() do
                                if k:IsA("ParticleEmitter") or k:IsA("Trail") then
                                    k.Enabled = true
                                end
                            end
                            u95.Cylinder.Transparency = 0
                            local Position = a1.Model.HumanoidRootPart.Position
                            local u64 = Position + Vector3.new(
                                Random.new():NextNumber(-20, 20),
                                Random.new():NextNumber(10, 25),
                                (Random.new():NextNumber(-20, 20))
                            )
                            local u65 = 0
                            local u66 = nil
                            v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 217
                                -- upvalues: Character (upval), u65 (ref), GameState (upval), a1 (upval)
                                -- upvalues: EmitterManager (upval), Debris (upval), u95 (val), u66 (ref)
                                -- upvalues: Position (val), u64 (val)
                                local Position_2 = Character.Position
                                u65 = u65 + a1_2 * GameState.TimeScale / 0.8
                                if not (u65 >= 1) then
                                    local Cylinder = u95.Cylinder
                                    local new = CFrame.new
                                    local v1 = u65
                                    Cylinder.CFrame = (new((1 - v1) ^ 2 * Position + 2 * (1 - v1) * v1 * u64 + v1 ^ 2 * Position_2)) * CFrame.Angles(-math.rad(u65 * 30), math.rad(u65 * 90), (math.rad(u65 * 40))) * CFrame.Angles(0, 0, 1.5707963267948966)
                                    u95.EffectPart.Position = u95.Cylinder.Position
                                    return
                                end
                                if a1.Model.Parent then
                                    local v2 = a1.Model.CoinReceive:Clone()
                                    v2.Anchored = true
                                    v2.Parent = workspace.Trash
                                    v2.CFrame = CFrame.new(Position_2)
                                    EmitterManager.manualEmit(v2)
                                    Debris:AddItem(v2, 3)
                                    for i, j in u95:GetDescendants() do
                                        if j:IsA("ParticleEmitter") or j:IsA("Trail") then
                                            j.Enabled = false
                                        end
                                    end
                                end
                                u95:Destroy()
                                u66:Disconnect()
                            end)
                        end
                    end)
                end
                if PlayerByUserId and Character and a1_2 > 0 then
                    v1 = Character.CFrame * CFrame.new(
                        Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                    )
                    EffectsController.Cash(RootPart.Position, v1.p)
                end
                return
            end
            if Name == "Booth" then
                if Character and PlayerByUserId then
                    task.spawn(function() -- Line: 256
                        -- upvalues: TimescaleUtilities (upval), a1 (upval), ReplicatedStorage (upval)
                        -- upvalues: RunService (upval), Character (val), GameState (upval), EmitterManager (upval)
                        -- upvalues: EasySound (upval), Debris (upval)
                        local v1
                        for i = 1, 4 do
                            TimescaleUtilities.Wait(0.1)
                            if not a1.Model:FindFirstChild("HumanoidRootPart") then
                                break
                            end
                            local u23 = ReplicatedStorage.Assets.Effects.Mob.PlsDonate.Coin:Clone()
                            u23.Size = u23.Size * 0.5
                            u23.Parent = workspace
                            local Position = a1.Model.HumanoidRootPart.Position
                            local u54 = Position + Vector3.new(
                                Random.new():NextNumber(-20, 20),
                                Random.new():NextNumber(10, 25),
                                (Random.new():NextNumber(-20, 20))
                            )
                            local u55 = 0
                            local u56 = nil
                            v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 278
                                -- upvalues: Character (upval), u55 (ref), GameState (upval), a1 (upval)
                                -- upvalues: EmitterManager (upval), EasySound (upval), Debris (upval), u23 (val)
                                -- upvalues: u56 (ref), Position (val), u54 (val)
                                local v1
                                local Position_2 = Character.Position
                                u55 = u55 + a1_2 * GameState.TimeScale / 0.8
                                if not (u55 >= 1) then
                                    v1 = u23
                                    local new = CFrame.new
                                    local v2 = u55
                                    v1.CFrame = (new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u54 + v2 ^ 2 * Position_2)) * CFrame.Angles(-math.rad(u55 * 30), math.rad(u55 * 90), (math.rad(u55 * 40)))
                                    return
                                end
                                if a1.Model
                                    and a1.Model:FindFirstChild("CollectSound")
                                    and a1.Model:FindFirstChild("Coin") then
                                    v1 = a1.Model.Coin:Clone()
                                    v1.Parent = workspace.Trash
                                    v1.CFrame = CFrame.new(Position_2)
                                    EmitterManager.manualEmit(v1)
                                    local CollectSound = a1.Model:FindFirstChild("CollectSound")
                                    if CollectSound and CollectSound:IsA("Sound") then
                                        EasySound.Play({
                                            audioGroup = "Towers",
                                            destroyOnEnd = true,
                                            id = CollectSound.SoundId,
                                            parent = v1,
                                            playbackSpeed = Random.new():NextNumber(0.9, 1.1),
                                        })
                                    end
                                    Debris:AddItem(v1, 3)
                                    for i, j in u23:GetDescendants() do
                                        if j:IsA("ParticleEmitter") then
                                            j.Enabled = false
                                        end
                                    end
                                end
                                u23:Destroy()
                                u56:Disconnect()
                            end)
                        end
                    end)
                end
                return
            end
            if Name ~= "Discovered" and Name ~= "Cinema" then
                if Name ~= "Pot Of Gold" and Name ~= "Bunny" then
                    if Name == "Null Soul" then
                        if Character and PlayerByUserId then
                            task.spawn(function() -- Line: 449
                                -- upvalues: TimescaleUtilities (upval), a1 (upval), TweenService (upval)
                                -- upvalues: randomAngle (upval), RunService (upval), Character (val), GameState (upval)
                                -- upvalues: EmitterManager (upval), Debris (upval)
                                local v1, v2, v3, v4
                                for i = 1, 4 do
                                    TimescaleUtilities.Wait(0.1)
                                    if a1:GetLevel() ~= 5 then
                                        u163 = a1.Model.Soul:Clone()
                                    else
                                        local u163 = a1.Model.Soul_Lvl5:Clone()
                                    end
                                    u163.Parent = workspace
                                    for j, k in u163:GetDescendants() do
                                        if k:IsA("ParticleEmitter") or k:IsA("Trail") then
                                            k.Enabled = true
                                        end
                                        if k:IsA("BasePart") then
                                            v4 = TweenService
                                            v2 = TweenInfo.new(0.5)
                                            v3 = {Transparency = k:GetAttribute("Transparency") or 0}
                                            v4:Create(k, v2, v3):Play()
                                        end
                                    end
                                    local Position = a1.Model.PrimaryPart.Position
                                    local u66 = Position + Vector3.new(
                                        Random.new():NextNumber(-20, 20),
                                        Random.new():NextNumber(10, 25),
                                        (Random.new():NextNumber(-20, 20))
                                    )
                                    local u84 = CFrame.Angles(
                                        Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                        Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                        randomAngle()
                                    )
                                    local u102 = CFrame.Angles(
                                        Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                        Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                        randomAngle()
                                    )
                                    local u103 = 0
                                    local u104 = nil
                                    v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 482
                                        -- upvalues: Character (upval), u103 (ref), GameState (upval), a1 (upval)
                                        -- upvalues: EmitterManager (upval), Debris (upval), u163 (val), u104 (ref)
                                        -- upvalues: Position (val), u66 (val), u84 (val), u102 (val)
                                        local v1
                                        local Position_2 = Character.Position
                                        u103 = u103 + a1_2 * GameState.TimeScale / 0.8
                                        if not (u103 >= 1) then
                                            v1 = u163
                                            local new = CFrame.new
                                            local v2 = u103
                                            v1:PivotTo((new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u66 + v2 ^ 2 * Position_2)) * (u84:Lerp(u102, u103)))
                                            return
                                        end
                                        if a1.Model.Parent then
                                            v1 = if a1:GetLevel() ~= 5 then a1.Model.CollectVFX:Clone() else a1.Model.CollectVFX_Lvl5:Clone()
                                            v1.Parent = workspace.Trash
                                            v1.Position = Position_2
                                            EmitterManager.manualEmit(v1)
                                            Debris:AddItem(v1, 3)
                                        end
                                        u163:Destroy()
                                        u104:Disconnect()
                                    end)
                                end
                            end)
                        end
                        if PlayerByUserId and Character and a1_2 > 0 then
                            v1 = Character.CFrame * CFrame.new(
                                Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                                Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                                Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                            )
                            EffectsController.Cash(RootPart.Position, v1.p)
                        end
                        return
                    end
                    if Name ~= "Crab" then
                        if PlayerByUserId and Character and a1_2 > 0 then
                            v1 = Character.CFrame * CFrame.new(
                                Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                                Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                                Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                            )
                            EffectsController.Cash(RootPart.Position, v1.p)
                        end
                        return
                    end
                    v1 = if not (5 <= a1.Upgrade) then "CrabFarmMoney" else "MaxCrabFarmMoney"
                    EmitterManager.manualEmit(a1.Model[v1])
                    if Character and PlayerByUserId then
                        local u94 = ReplicatedStorage.Assets.Effects.Mob.PlsDonate.Coin:Clone()
                        u94.Size = u94.Size * 0.25
                        u94.Parent = workspace
                        local Position = RootPart.Position
                        local u123 = Position + Vector3.new(Random.new():NextNumber(-20, 20), Random.new():NextNumber(10, 25), (Random.new():NextNumber(-20, 20)))
                        local u124 = 0
                        local u125 = nil
                        local v3 = RunService.Heartbeat:Connect(function(a1) -- Line: 531
                            -- upvalues: Character (val), u124 (ref), GameState (upval), RootPart (upval)
                            -- upvalues: EmitterManager (upval), EasySound (upval), u59 (upval), Debris (upval)
                            -- upvalues: u94 (val), u125 (ref), Position (val), u123 (val)
                            local Position_2 = Character.Position
                            u124 = u124 + a1 * GameState.TimeScale / 0.8
                            if not (u124 >= 1) then
                                local v1 = u94
                                local new = CFrame.new
                                local v2 = u124
                                v1.CFrame = (new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u123 + v2 ^ 2 * Position_2)) * CFrame.Angles(-math.rad(u124 * 30), math.rad(u124 * 90), (math.rad(u124 * 40)))
                                return
                            end
                            if RootPart:FindFirstChild("CollectSound") then
                                local Attachment = Instance.new("Attachment")
                                Attachment.Name = "CrabSoundAttachment"
                                Attachment.WorldCFrame = CFrame.new(Position_2)
                                Attachment.Parent = workspace.Terrain
                                EmitterManager.Emit("CrabFarmCollect", Attachment.WorldCFrame, 1.5)
                                local CollectSound = RootPart:FindFirstChild("CollectSound")
                                if CollectSound and CollectSound:IsA("Sound") then
                                    EasySound.Play({
                                        audioGroup = "Towers",
                                        destroyOnEnd = true,
                                        id = CollectSound.SoundId,
                                        parent = Attachment,
                                        playbackSpeed = u59:NextNumber(0.9, 1.1),
                                    })
                                end
                                Debris:AddItem(Attachment, 3)
                            end
                            u94:Destroy()
                            u125:Disconnect()
                        end)
                    end
                    return
                end
                if Character and PlayerByUserId then
                    task.spawn(function() -- Line: 388
                        -- upvalues: a1 (upval), EmitterManager (upval), TimescaleUtilities (upval), randomAngle (upval)
                        -- upvalues: RunService (upval), Character (val), GameState (upval), Debris (upval)
                        local v1
                        local MoneyEffect = a1.Model:FindFirstChild("MoneyEffect")
                        if MoneyEffect then
                            EmitterManager.manualEmit(MoneyEffect)
                        end
                        for i = 1, 4 do
                            TimescaleUtilities.Wait(0.1)
                            if not a1.Model:FindFirstChild("HumanoidRootPart") then
                                break
                            end
                            local u144 = a1.Model.WalmartCube:Clone()
                            u144.Parent = workspace
                            for j, k in u144:GetDescendants() do
                                if k:IsA("ParticleEmitter") or k:IsA("Trail") then
                                    k.Enabled = true
                                end
                            end
                            u144.Transparency = u144:GetAttribute("Transparency") or 0
                            local Position = a1.Model.HumanoidRootPart.Position
                            local u77 = Position + Vector3.new(
                                Random.new():NextNumber(-20, 20),
                                Random.new():NextNumber(10, 25),
                                (Random.new():NextNumber(-20, 20))
                            )
                            local u95 = CFrame.Angles(
                                Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                randomAngle()
                            )
                            local u113 = CFrame.Angles(
                                Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                                randomAngle()
                            )
                            local u114 = 0
                            local u115 = nil
                            v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 421
                                -- upvalues: Character (upval), u114 (ref), GameState (upval), a1 (upval)
                                -- upvalues: EmitterManager (upval), Debris (upval), u144 (val), u115 (ref)
                                -- upvalues: Position (val), u77 (val), u95 (val), u113 (val)
                                local v1
                                local Position_2 = Character.Position
                                u114 = u114 + a1_2 * GameState.TimeScale / 0.8
                                if not (u114 >= 1) then
                                    v1 = u144
                                    local new = CFrame.new
                                    local v2 = u114
                                    v1.CFrame = (new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u77 + v2 ^ 2 * Position_2)) * u95:Lerp(u113, u114)
                                    u144.Color = (Color3.fromRGB(220, 189, 16)):Lerp(Color3.fromRGB(1, 173, 15), u114)
                                    return
                                end
                                local CollectVFX = a1.Model:FindFirstChild("CollectVFX")
                                if CollectVFX then
                                    v1 = CollectVFX:Clone()
                                    v1.Parent = workspace.Trash
                                    v1.Position = Position_2
                                    EmitterManager.manualEmit(v1)
                                    Debris:AddItem(v1, 3)
                                end
                                u144:Destroy()
                                u115:Disconnect()
                            end)
                        end
                    end)
                end
                if PlayerByUserId and Character and a1_2 > 0 then
                    v1 = Character.CFrame * CFrame.new(
                        Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                        Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                    )
                    EffectsController.Cash(RootPart.Position, v1.p)
                end
                return
            end
            if Character and PlayerByUserId then
                task.spawn(function() -- Line: 332
                    -- upvalues: TimescaleUtilities (upval), a1 (upval), randomAngle (upval), RunService (upval)
                    -- upvalues: Character (val), GameState (upval), EmitterManager (upval), Debris (upval)
                    local v1
                    for i = 1, 4 do
                        TimescaleUtilities.Wait(0.1)
                        if not a1.Model:FindFirstChild("HumanoidRootPart") then
                            break
                        end
                        local u130 = a1.Model.WalmartCube:Clone()
                        u130.Parent = workspace
                        for j, k in u130:GetDescendants() do
                            if k:IsA("ParticleEmitter") or k:IsA("Trail") then
                                k.Enabled = true
                            end
                        end
                        u130.Transparency = 0
                        local Position = a1.Model.HumanoidRootPart.Position
                        local u63 = Position + Vector3.new(Random.new():NextNumber(-20, 20), Random.new():NextNumber(10, 25), (Random.new():NextNumber(-20, 20)))
                        local u81 = CFrame.Angles(
                            Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                            Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                            randomAngle()
                        )
                        local u99 = CFrame.Angles(
                            Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                            Random.new():NextNumber(-3.141592653589793, 3.141592653589793),
                            randomAngle()
                        )
                        local u100 = 0
                        local u101 = nil
                        v1 = RunService.Heartbeat:Connect(function(a1_2) -- Line: 361
                            -- upvalues: Character (upval), u100 (ref), GameState (upval), a1 (upval)
                            -- upvalues: EmitterManager (upval), Debris (upval), u130 (val), u101 (ref), Position (val)
                            -- upvalues: u63 (val), u81 (val), u99 (val)
                            local v1
                            local Position_2 = Character.Position
                            u100 = u100 + a1_2 * GameState.TimeScale / 0.8
                            if not (u100 >= 1) then
                                v1 = u130
                                local new = CFrame.new
                                local v2 = u100
                                v1.CFrame = (new((1 - v2) ^ 2 * Position + 2 * (1 - v2) * v2 * u63 + v2 ^ 2 * Position_2)) * u81:Lerp(u99, u100)
                                u130.Color = (Color3.fromRGB(16, 42, 220)):Lerp(Color3.fromRGB(76, 255, 166), u100)
                                return
                            end
                            if a1.Model.Parent then
                                v1 = a1.Model.CollectVFX:Clone()
                                v1.Parent = workspace.Trash
                                v1.Position = Position_2
                                EmitterManager.manualEmit(v1)
                                Debris:AddItem(v1, 3)
                            end
                            u130:Destroy()
                            u101:Disconnect()
                        end)
                    end
                end)
            end
            if PlayerByUserId and Character and a1_2 > 0 then
                v1 = Character.CFrame * CFrame.new(
                    Character.Size.X / 2 * Random.new():NextNumber(-1, 1),
                    Character.Size.Y / 2 * Random.new():NextNumber(-1, 1),
                    Character.Size.Z / 2 * Random.new():NextNumber(-1, 1)
                )
                EffectsController.Cash(RootPart.Position, v1.p)
            end
        end,
    }
    local v2 = false
    if a1.Model.Name == "Booth" then
        function v2() -- Line: 585
            return "TEST"
        end
    end
    v1.GetFriendID = v2
    a1.Executables = v1
    task.spawn(function() -- Line: 590 -- upvalues: a1 (val), Players (upval), LocalPlayer (upval)
        if a1.Model.Name == "Booth" then
            local Motor6D, VisitorId, getModel, v1
            local PlayerByUserId = Players:GetPlayerByUserId((a1.Replicator:Get("OwnerId")))
            if not PlayerByUserId then
                return
            end
            local v2 = a1.Replicator:Get("Count")
            local v3 = a1.Replicator:Get("Seed")
            while true do
                if not v2 then
                    v2 = a1.Replicator:Get("Count")
                    v3 = a1.Replicator:Get("Seed")
                    task.wait(1)
                    continue
                end
                if v3 then
                    break
                end
                v2 = a1.Replicator:Get("Count")
                v3 = a1.Replicator:Get("Seed")
                task.wait(1)
            end
            local success, result_2 = pcall(LocalPlayer.GetFriendsOnline, LocalPlayer, 50)
            local v4 = v2 > 1 and success and v3 % (#result_2 + 1) or 0
            if not (v4 > 1) then
                VisitorId = PlayerByUserId.UserId
            else
                VisitorId = result_2[v4].VisitorId
                if not VisitorId then
                    VisitorId = PlayerByUserId.UserId
                end
            end

            function getModel(a1) -- Line: 609 -- upvalues: Players (upval), getModel (val) -- types: a1: userdata
                local success, result = pcall(function() -- Line: 610 -- upvalues: Players (upval), a1 (val)
                    return Players:CreateHumanoidModelFromDescription(a1, Enum.HumanoidRigType.R6)
                end)
                if success then
                    return result
                end
                task.wait(1)
                return getModel(a1)
            end

            local success_2, result = pcall(function() -- Line: 623 -- upvalues: Players (upval), VisitorId (val)
                return Players:GetHumanoidDescriptionFromUserId(VisitorId)
            end)
            if not result or not success_2 then
                result = Instance.new("HumanoidDescription")
            end
            local success_3, result_3 = pcall(function() -- Line: 610 -- upvalues: Players (upval), result (val)
                return Players:CreateHumanoidModelFromDescription(result, Enum.HumanoidRigType.R6)
            end)
            if success_3 then
                v1 = result_3
            else
                task.wait(1)
                v1 = getModel(result)
            end
            v1.Parent = workspace
            v1:ScaleTo(0.272)
            v1:PivotTo((a1.Model.fakeCharacter:GetPivot()))
            v1.Name = "Character"
            v1.Parent = a1.Model
            for i, j in v1:GetDescendants() do
                if j:IsA("BasePart") then
                    j.CanCollide = false
                end
                if j:IsA("Motor6D") then
                    j:Destroy()
                end
            end
            for k, n in a1.Model.fakeCharacter:GetChildren() do
                n.Transparency = 1
                if v1:FindFirstChild(n.Name) then
                    Motor6D = Instance.new("Motor6D")
                    Motor6D.Part0 = n
                    Motor6D.Part1 = v1[n.Name]
                    Motor6D.Parent = v1[n.Name]
                end
            end
        end
    end)
end

return v1