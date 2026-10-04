-- Script path: ReplicatedStorage.Content.Maps.Outpost 32.Animator.Events.PowerPlant
-- Decompile time: 4.07 ms

local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Sound = Instance.new("Sound")
Sound.SoundId = "rbxassetid://137269319964390"
local Sound_2 = Instance.new("Sound")
Sound_2.SoundId = "rbxassetid://84409020127285"
ContentProvider:PreloadAsync({Sound, Sound_2})

local function IceRocket(a1, a2) -- Line: 19
    -- upvalues: ReplicatedStorage (val), Sound_2 (val), GameState (val), Shaker (val), EmitterManager (val)
    -- upvalues: Sound (val)
    local u2 = nil
    local u3 = 0
    local Model = Instance.new("Model")
    Model.Name = "IceRocket"
    local u24 = (ReplicatedStorage.Assets.Effects.Mob.FrostSpirit.Shards:GetChildren())[math.random(1, 2)]:Clone()
    local u28 = Sound_2:Clone()
    u28.Volume = 2.5
    u28.PlaybackSpeed = Random.new():NextNumber(0.86, 1)
    u28.Parent = u24
    u28:Play()
    u28.Ended:Connect(function() -- Line: 36 -- upvalues: u28 (val)
        u28:Destroy()
    end)
    u24.Parent = Model
    Model:ScaleTo(1)
    Model.Parent = workspace
    local u56 = Random.new():NextNumber(0.3, 0.4)
    local u58 = CFrame.new()
    local v1 = (game:GetService("RunService")).RenderStepped:Connect(function(a1_2) -- Line: 48
        -- upvalues: u3 (ref), GameState (upval), u56 (val), Model (val), Shaker (upval), EmitterManager (upval)
        -- upvalues: a2 (val), Sound (upval), u24 (val), u2 (ref), a1 (val), u58 (ref)
        u3 = u3 + a1_2 * GameState.TimeScale / u56
        if Model and Model.Parent and not (u3 >= 1) then
            local v1 = CFrame.new(math.noise(u3 * u56) * 12, math.noise(u3 * u56 * 2) * 8, 0)
            local v2 = CFrame.new((a1:Lerp(a2, u3))) * v1
            Model:PivotTo((CFrame.new(v2.Position, v2.Position - (u58.Position - v2.Position).Unit * 2)) * (CFrame.Angles(1.5707963267948966, 0, 0)))
            u58 = v2
            return
        end
        if Model and Model.Parent then
            Shaker:Shake({0.5, 30, 0, 1.5}, 0.1, 0.7)
            EmitterManager.Emit("FrostExplosion", CFrame.new(a2), 5)
            local u85 = Sound:Clone()
            u85.Volume = 1
            u85.Parent = u24
            u85:Play()
            u85.Ended:Connect(function() -- Line: 61 -- upvalues: u85 (val)
                u85:Destroy()
            end)
            for k, v in pairs(Model:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.Transparency = 1
                elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                    v.Enabled = false
                end
            end
            game.Debris:AddItem(Model, 2)
        end
        u2:Disconnect()
    end)
end

return function(a1) -- Line: 95 -- upvalues: IceRocket (val), TimescaleUtilities (val), EmitterManager (val), Shaker (val)
    local PowerPlant = a1:FindFirstChild("PowerPlant", true)
    local RealPowerPlant = a1:FindFirstChild("RealPowerPlant", true)
    if PowerPlant and RealPowerPlant then
        local u12 = Random.new()
        task.spawn(function() -- Line: 104
            -- upvalues: u12 (val), IceRocket (upval), a1 (val), PowerPlant (val), TimescaleUtilities (upval)
            local v1, v2, v3
            for i = 1, 6 do
                v1 = u12:NextNumber(-6, 6)
                v2 = u12:NextNumber(-6, 6)
                v3 = u12:NextNumber(-6, 6)
                IceRocket(
                    (a1.ProjectileStart.CFrame * (CFrame.new(v1, v2, v3))).Position,
                    ((PowerPlant:GetPivot()) * CFrame.new(v1 * 2, v2 * 2, v3 * 2)).Position
                )
                TimescaleUtilities.Wait(0.09)
            end
        end)
        TimescaleUtilities.Wait(0.31)
        for i, j in PowerPlant:GetChildren() do
            if j:IsA("BasePart") then
                j.CanCollide = false
            end
        end
        local v1 = PowerPlant.AnimationController:LoadAnimation(PowerPlant.Fall)
        v1:Play(0)
        task.delay(0.1, function() -- Line: 128 -- upvalues: PowerPlant (val)
            PowerPlant["Export.008"].Sound:Play()
        end)
        ;(v1:GetMarkerReachedSignal("Explosion")):Connect(function() -- Line: 132
            -- upvalues: RealPowerPlant (val), EmitterManager (upval), a1 (val), Shaker (upval), PowerPlant (val)
            for i, j in RealPowerPlant:GetChildren() do
                if j:IsA("BasePart") then
                    j.Transparency = 0
                end
            end
            EmitterManager.manualEmit(a1:WaitForChild("PowerPlantEffects"))
            Shaker:Shake({1, 30, 0, 1.5}, 0.1, 3)
            for k, n in PowerPlant:GetChildren() do
                if n:IsA("BasePart") then
                    n.Transparency = 1
                end
            end
        end)
        return function() -- Line: 149 -- upvalues: RealPowerPlant (val), PowerPlant (val)
            for i, j in RealPowerPlant:GetChildren() do
                if j:IsA("BasePart") then
                    j.Transparency = 1
                end
            end
            for k, n in PowerPlant:GetChildren() do
                if n:IsA("BasePart") then
                    n.Transparency = 0
                    n.CanCollide = true
                end
            end
        end
    end
    warn("PowerPlant not found")
end