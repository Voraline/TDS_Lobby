-- Script path: ReplicatedStorage.Content.NewEnemies.Void Swordmaster.Animator
-- Decompile time: 5.96 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Animation = require(ReplicatedStorage.Shared.Modules.Animation)
local EasySound = require(ReplicatedStorage.Shared.Modules.EasySound)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local StateManager = require(ReplicatedStorage.Client.Modules.StateManager)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VoidSwordmaster = ReplicatedStorage.Assets.Effects.Mob.VoidSwordmaster
local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 15
    -- upvalues: StateManager (val), Animation (val), EasySound (val), VoidSwordmaster (val), EmitterManager (val)
    -- upvalues: Shaker (val), TweenService (val)
    local Animations = a1.Model:WaitForChild("Animations")
    local AnimationController = a1.Model:WaitForChild("AnimationController")
    a1._stateManager = StateManager.new()
    a1._animations = {}
    for i, j in Animations:GetChildren() do
        a1._animations[j.Name] = (Animation.new({Preload = true, Track = j, Target = AnimationController}))
    end
    a1._stateManager:addStates({
        {
            name = "Walking",
            onEnter = function() -- Line: 32 -- upvalues: a1 (val)
                a1._animations.Walk:Play()
            end,
        },
        {
            name = "VoidTear",
            onEnter = function(a1_2, a2) -- Line: 38
                -- upvalues: a1 (val), EasySound (upval), VoidSwordmaster (upval), EmitterManager (upval)
                -- upvalues: Shaker (upval), TweenService (upval)
                local v1, v2, v3, v4, v5, v6
                a1:Face(a1_2, (TweenInfo.new()))
                a1._animations.VoidTear:Play()
                a1:Delay(4.7, function() -- Line: 42 -- upvalues: a1 (upval), EasySound (upval)
                    if a1:IsAlive() then
                        EasySound.Play({
                            id = "rbxassetid://119055402065449",
                            audioGroup = "Enemies",
                            volume = 0.5,
                            destroyOnEnd = true,
                            parent = a1.Model.PrimaryPart,
                        })
                    end
                end)
                a1:Delay(2, function() -- Line: 54 -- upvalues: a1 (upval), EasySound (upval)
                    if a1:IsAlive() then
                        EasySound.Play({
                            id = "rbxassetid://133797969140431",
                            audioGroup = "Enemies",
                            volume = 0.5,
                            destroyOnEnd = true,
                            parent = a1.Model.PrimaryPart,
                        })
                    end
                end)
                local Position = a1.Model.PrimaryPart.Position
                local v7 = Vector3.new(a1_2.X - Position.X, 0, a1_2.Z - Position.Z)
                local v8 = math.atan2(v7.X, v7.Z)
                local Stats = a1.Stats
                local VoidTearHitbox = Stats.VoidTearHitbox

                local function spawnSlash(a1_3) -- Line: 72
                    -- upvalues: VoidSwordmaster (upval), VoidTearHitbox (val), a1_2 (val), a1 (upval)
                    -- upvalues: EmitterManager (upval)
                    local v1 = VoidSwordmaster.VoidSlash:Clone()
                    v1.Size = Vector3.new(VoidTearHitbox.X, v1.Size.Y, VoidTearHitbox.Z)
                    v1.Parent = workspace.Trash
                    v1.Anchored = true
                    v1.CFrame = (CFrame.new(a1_2)) * CFrame.fromEulerAnglesYXZ(0, a1_3, 0)
                    a1.Maid:Mark(v1)
                    EmitterManager.toggle(v1, true)
                    EmitterManager.manualEmit(v1)
                    return v1
                end

                local v9 = {}
                for i, j in Stats.VoidTearSlashAngles do
                    table.insert(v9, (spawnSlash(v8 + (math.rad(j)))))
                end
                a1:Wait(a2)
                Shaker:Shake({1.5, 10, 0.1, 1}, 0.2, 0.5, {radius = 120, position = a1_2})
                for k, n in v9 do
                    n:Destroy()
                end
                local VoidTearExplosionCount = Stats.VoidTearExplosionCount
                local v10 = VoidTearHitbox.Z / 2
                local v11 = nil
                local v12 = nil
                for m, i5 in Stats.VoidTearSlashAngles, v11, v12 do
                    v1 = {1, -1}
                    v2 = nil
                    v3 = nil
                    for i6, i7 in v1, v2, v3 do
                        v4 = v8 + math.rad(i5)
                        if i7 == -1 then
                            v4 = v4 + 3.141592653589793
                        end
                        v5 = Vector3.new(math.sin(v4), 0, (math.cos(v4)))
                        for i8 = 1, VoidTearExplosionCount do
                            v6 = a1_2 + v5 * (i8 / VoidTearExplosionCount * v10)
                            local u156 = VoidSwordmaster.VoidExplosion:Clone()
                            u156.Size = Vector3.new(VoidTearHitbox.X, u156.Size.Y, VoidTearHitbox.X)
                            u156.Parent = workspace.Trash
                            u156.Anchored = true
                            u156.CFrame = CFrame.new(v6)
                            a1.Maid:Mark(u156)
                            EasySound.Play({
                                id = "rbxassetid://105120922633794",
                                audioGroup = "Enemies",
                                volume = 0.5,
                                destroyOnEnd = true,
                                parent = u156,
                            })
                            EmitterManager.toggle(u156, true)
                            EmitterManager.manualEmit(u156)
                            a1:Delay(2, function() -- Line: 128 -- upvalues: u156 (val), TweenService (upval), a1 (upval)
                                local SurfaceGui = u156:FindFirstChildWhichIsA("SurfaceGui", true)
                                if SurfaceGui then
                                    local v1, v2
                                    for i, j in SurfaceGui:GetDescendants() do
                                        if j:IsA("ImageLabel") then
                                            v1 = TweenService
                                            v2 = TweenInfo.new(0.5)
                                            v1:Create(j, v2, {ImageTransparency = 1}):Play()
                                        end
                                    end
                                    a1:Wait(0.5)
                                end
                                if u156 and u156.Parent then
                                    u156:Destroy()
                                end
                            end)
                        end
                    end
                end
            end,
        },
        {
            name = "ImpalingSword",
            onEnter = function(a1_2) -- Line: 152
                -- upvalues: a1 (val), EasySound (upval), Shaker (upval), VoidSwordmaster (upval)
                -- upvalues: EmitterManager (upval), TweenService (upval)
                a1._animations.ImpalingSword:Play()
                EasySound.Play({
                    id = "rbxassetid://72911576315131",
                    audioGroup = "Enemies",
                    volume = 0.5,
                    destroyOnEnd = true,
                    parent = a1.Model.PrimaryPart,
                })
                a1:Wait(a1.Stats.ImpalingSwordStartDelay)
                for i, j in a1_2 do
                    a1:Delay(i * a1.Stats.ImpalingSwordBladeDelay, function() -- Line: 166
                        -- upvalues: Shaker (upval), j (val), VoidSwordmaster (upval), a1 (upval)
                        -- upvalues: EmitterManager (upval), TweenService (upval)
                        Shaker:Shake({0.75, 10, 0.1, 1}, 0.15, 0.4, {radius = 90, position = j})
                        local u17 = VoidSwordmaster.VoidExplosion:Clone()
                        u17.Parent = workspace.Trash
                        u17.Anchored = true
                        u17.CFrame = CFrame.new(j)
                        a1.Maid:Mark(u17)
                        EmitterManager.toggle(u17, true)
                        EmitterManager.manualEmit(u17)
                        a1:Delay(2, function() -- Line: 178 -- upvalues: u17 (val), TweenService (upval), a1 (upval)
                            local SurfaceGui = u17:FindFirstChildWhichIsA("SurfaceGui", true)
                            if SurfaceGui then
                                local v1, v2
                                for i, j in SurfaceGui:GetDescendants() do
                                    if j:IsA("ImageLabel") then
                                        v1 = TweenService
                                        v2 = TweenInfo.new(0.5)
                                        v1:Create(j, v2, {ImageTransparency = 1}):Play()
                                    end
                                end
                                a1:Wait(0.5)
                            end
                            if u17 and u17.Parent then
                                u17:Destroy()
                            end
                        end)
                    end)
                end
            end,
        },
        {
            name = "Rage",
            onEnter = function() -- Line: 200 -- upvalues: a1 (val)
                a1._animations.Rage:Play()
            end,
        },
        {
            name = "Death",
            onEnter = function() -- Line: 206 -- upvalues: a1 (val)
                a1._animations.Death:Play()
            end,
        },
    })
    a1.Executables = {
        ChangeState = function(a1_2, ...) -- Line: 213 -- upvalues: a1 (val) -- types: a1_2: string
            a1._stateManager:changeState(a1_2, ...)
        end,
    }
end

return v1