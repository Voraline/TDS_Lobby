-- Script path: ReplicatedStorage.Content.Consumables.Winter Storm.Animator
-- Decompile time: 2.50 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
game:GetService("ServerStorage")
require(ReplicatedStorage.Shared.Types.ConsumableTypes)
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
local Blizzard = (ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects"):WaitForChild("Client"):WaitForChild("Blizzard")

local function lightingEffect() -- Line: 17
    -- upvalues: Create (val), Lighting (val), TweenService (val), TimescaleUtilities (val)
    local u13 = Create("Atmosphere", {
        Name = "IceAtmosphere",
        Density = 0.765,
        Glare = 0.3,
        Haze = 10,
        Color = Color3.fromRGB(255, 255, 255),
        Decay = Color3.fromRGB(255, 255, 255),
    })
    local u22 = Create("ColorCorrectionEffect", {Name = "IceColorCorrection", TintColor = Color3.fromRGB(229, 249, 255)})
    u22:AddTag("DONT_TOUCH")
    u22.Parent = Lighting
    u13:AddTag("DONT_TOUCH")
    u13.Parent = Lighting
    return function() -- Line: 38 -- upvalues: TweenService (upval), u13 (val), u22 (val), TimescaleUtilities (upval)
        TweenService:Create(u13, TweenInfo.new(5), {Density = 0, Haze = 0, Color = Color3.new(1, 1, 1)}):Play()
        TweenService:Create(u22, TweenInfo.new(5), {TintColor = Color3.new(1, 1, 1)}):Play()
        TimescaleUtilities.Delay(5, function() -- Line: 49 -- upvalues: u13 (upval)
            u13:Destroy()
        end)
    end
end

local function winterStormEffect() -- Line: 55 -- upvalues: Blizzard (val), TweenService (val), TimescaleUtilities (val)
    local Brightness, Rate
    local u3 = Blizzard:Clone()
    local v1 = TweenInfo.new(5)
    local u9 = TweenInfo.new(2)
    for i, j in u3:GetChildren() do
        if j:IsA("Beam") then
            Brightness = j.Brightness
            j.Brightness = 0
            TweenService:Create(j, v1, {Brightness = Brightness}):Play()
        elseif j:IsA("ParticleEmitter") then
            Rate = j.Rate
            j.Rate = 0
            TweenService:Create(j, v1, {Rate = Rate}):Play()
        end
    end
    u3.Parent = workspace.Terrain
    return function() -- Line: 81 -- upvalues: u3 (val), TweenService (upval), u9 (val), TimescaleUtilities (upval)
        for i, j in u3:GetChildren() do
            if j:IsA("Beam") then
                TweenService:Create(j, u9, {Brightness = 0}):Play()
            elseif j:IsA("ParticleEmitter") then
                TweenService:Create(j, u9, {Rate = 0}):Play()
            end
        end
        TimescaleUtilities.Delay(u9.Time, function() -- Line: 94 -- upvalues: u3 (upval)
            u3:Destroy()
        end)
    end
end

return {
    OnUse = function(a1) -- Line: 101
        -- upvalues: TypedPromise (val), winterStormEffect (val), lightingEffect (val), TimescaleUtilities (val)
        return TypedPromise.new(function(a1_2) -- Line: 102
            -- upvalues: a1 (val), winterStormEffect (upval), lightingEffect (upval), TimescaleUtilities (upval)
            print("create")
            local Context = a1.Context
            local u7 = winterStormEffect()
            local u9 = lightingEffect()
            local effectDuration = Context.effectDuration
            local v1 = (workspace:GetServerTimeNow()) - Context.started
            TimescaleUtilities.Delay(math.max(0, effectDuration - v1), function() -- Line: 113 -- upvalues: u7 (val), u9 (val), a1_2 (val)
                print("clean up")
                u7()
                u9()
                a1_2()
            end)
        end)
    end,
}