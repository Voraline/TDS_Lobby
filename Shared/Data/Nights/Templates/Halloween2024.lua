-- Script path: ReplicatedStorage.Shared.Data.Nights.Templates.Halloween2024
-- Decompile time: 2.89 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Parent = script.Parent.Parent
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local u38 = nil
local Types = require(Parent.Types)
require(Parent.Timezone)
local u32 = RunService:IsClient()
if u32 then
    u38 = require(ReplicatedStorage.Client.Modules.Shaker)
end
return (Types({
    name = "Halloween2024",
    startsAt = DateTime.fromUniversalTime(2024, 1, 1),
    endsAt = DateTime.fromUniversalTime(2024, 12, 25),
    nights = {
        {map = "Failed Gateway", startsAt = DateTime.fromUniversalTime(2024, 10, 23, 19)},
        {map = "The Nightmare Realm", startsAt = DateTime.fromUniversalTime(2024, 10, 25, 19)},
        {map = "Containment", startsAt = DateTime.fromUniversalTime(2024, 10, 30, 19)},
    },
    init = function(a1) -- Line: 40
        a1.Character.Parent = nil
        a1.Model.Statue.Transparency = 0
        a1.Model.Statue.CanCollide = true
        a1.Interaction.Enabled = false
    end,
    intro = function(a1) -- Line: 47 -- upvalues: TweenService (val), RunService (val)
        local v1 = TweenInfo.new(2)
        TweenService:Create(a1.Model.Lock.Tombstone, v1, {
            Position = a1.Model.Lock.Tombstone.Position - Vector3.new(0, 6, 0),
        }):Play()
        TweenService:Create(a1.Model.Lock.Lock, v1, {Position = a1.Model.Lock.Lock.Position - Vector3.new(0, 6, 0)}):Play()
        a1.Model.Lock.Tombstone.Shift:Play()
        a1.Model.Lock.Tombstone.Dirt.Enabled = true
        local Statue = a1.Model.Statue
        local Attribute = Statue:GetAttribute("NeonColor")
        if not Attribute then
            Attribute = Color3.fromRGB(242, 197, 234)
        end
        Statue.Material = Enum.Material.Neon
        Statue.Color = Attribute:Lerp(Color3.new(0, 0, 0), 0.9)
        local u85 = Vector3.new(Statue.Size.X * 1.1, Statue.Size.Y * 1.1, Statue.Size.Z * 1.1)
        local u97 = Statue.CFrame + Vector3.new(0, Statue.Size.Y * 1.1 - Statue.Size.Y, 0)
        for k, v in pairs(a1.Model.Active:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                v.Enabled = true
            end
        end
        local Color = Statue.Color
        local CFrame = Statue.CFrame
        local Size = Statue.Size
        local u119 = 0
        local v2 = RunService.Stepped:Connect(function(a1_2, a2) -- Line: 91
            -- upvalues: u119 (ref), a1 (val), Statue (val), Color (val), Attribute (val), Size (val), u85 (val)
            -- upvalues: CFrame (val), u97 (val)
            local v1
            local v2 = math.clamp(u119 / 3.5, 0, 1)
            u119 = u119 + a2
            for k, v in pairs(a1.Model.Active:GetDescendants()) do
                if v:IsA("ParticleEmitter") then
                    v1 = v2 * 50
                    v.Rate = math.round(v1) + 25
                end
            end
            Statue.Color = Color:Lerp(Attribute, v2)
            Statue.Size = Size:Lerp(u85, v2)
            Statue.CFrame = (CFrame:Lerp(u97, v2)) * CFrame.new(math.random(-1, 1) * 0.1 + v2 * 0.3, math.random(-1, 1) * 0.1 + v2 * 0.3, math.random(-1, 1) * 0.1 + v2 * 0.3)
        end)
        Statue.Riser:Play()
        task.wait(3.5)
        v2:Disconnect()
        Statue.CFrame = u97
    end,
    unlock = function(a1) -- Line: 118 -- upvalues: EmitterManager (val), u32 (val), u38 (ref)
        local Statue = a1.Model.Statue
        Statue.Transparency = 1
        Statue.CanCollide = false
        EmitterManager.manualEmit(a1.Model.Explosion)
        a1.Model.Lock:Destroy()
        a1.Character.Parent = a1.Model
        a1.Interaction.Enabled = true
        for k, v in pairs(a1.Model.Active:GetDescendants()) do
            if v:IsA("ParticleEmitter") then
                v.Rate = 0
            end
        end
        if u32 then
            u38:Shake({5, 10, 0, 1.5}, 0.5, 1, {radius = 100, position = a1.Model.WorldPivot.Position})
        end
    end,
    countDown = function(a1, a2) -- Line: 144 -- types: a2: number
        local Lock = a1.Model:FindFirstChild("Lock")
        local Counter = Lock and Lock:FindFirstChild("Counter", true)
        if not Counter then
            return
        end
        Counter.Text = ("Days: %*, Hours: %*\nMinutes: %*, Seconds: %*"):format(
            math.floor(a2 / 86400),
            math.floor(a2 / 3600 % 24),
            math.floor(a2 / 60 % 60),
            (math.floor(a2 % 60))
        )
    end,
}))