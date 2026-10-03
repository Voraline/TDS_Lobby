-- Script path: ReplicatedStorage.Client.Modules.Replicators.ClientGameMiddleware
-- Decompile time: 14.51 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")
local TweenService = game:GetService("TweenService")
local v1 = {}
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local Enum_2 = require(ReplicatedStorage.Shared.Modules.Enum)
local LegacyMiddleware = require(ReplicatedStorage.Shared.Modules.LegacyMiddleware)
local TagReplicator = require(ReplicatedStorage.Client.Modules.TagReplicator)
local EffectsController = require(ReplicatedStorage.Client.Controllers.Game.EffectsController)
local ModifiersStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ModifiersStore)
local Misc = ReplicatedStorage.Assets.Effects.Misc
local v2 = TagReplicator.getReplicatorEntityFromFolder(ReplicatedStorage:WaitForChild("Modifiers"))
local Children = Misc.Confetti:GetChildren()
local Children_2 = Misc.Firework:GetChildren()
local HealthParticle = Misc.Health.HealthParticle
local u89 = {Gunslinger = true, Cavalry = true, ["Undead Miner"] = true, Husk = true}
local v3 = Misc.BloodDeathEffect:Clone()
v3.Parent = workspace.Trash
for k, v in pairs(v3.MainAttachment:GetChildren()) do
    if v:IsA("ParticleEmitter") then
        table.insert({}, {v, v:GetAttribute("EmitCount") or 1})
    end
end
local u117 = Random.new()
local GameModifier = Enum_2.GameModifier
local u121 = RaycastParams.new()
u121.FilterType = Enum.RaycastFilterType.Include

local function onMap(a1) -- Line: 62 -- upvalues: u121 (val)
    if not a1 then
        return
    end
    u121.FilterDescendantsInstances = {a1}
end

local Map = workspace:FindFirstChild("Map")
if Map then
    u121.FilterDescendantsInstances = {Map}
end
workspace.ChildAdded:Connect(function(a1) -- Line: 71 -- upvalues: u121 (val)
    if a1.Name == "Map" then
        if not a1 then
            return
        end
        u121.FilterDescendantsInstances = {a1}
    end
end)
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local u144 = {}
u144[GameModifier.Boss] = {
    Icon = 10044911963,
    Name = "Boss",
    Description = "All mobs spawn with a boss stat and are buffed.",
    Multiplier = 0.4,
    ServerIdentifier = "Boss",
    RunFunction = function() -- Line: 89 -- upvalues: LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 90
            a2:ScaleBy(1.5, 100)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 101 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.BanFarm] = {Icon = 135791172420130, Name = "Farm Banned", Description = "Farms will not give cash."}
u144[GameModifier.BanGatlingGun] = {Icon = 108137113182163, Name = "Gatling Gun Banned", Description = "Gatling Gun is not allowed."}
u144[GameModifier.AllPaths] = {
    Icon = 10983083186,
    Name = "All Paths",
    Description = "Enemies spawn on all paths.",
    Multiplier = 0.1,
    ServerIdentifier = "AllPaths",
}
u144[GameModifier.Glass] = {Icon = 10044862083, Name = "Glass", Description = "You have 1 HP.", Multiplier = 0.5}
u144[GameModifier.Weekend] = {
    Icon = 16671756946,
    Name = "XP Boost",
    Description = "Enjoy a boost to your earned EXP!",
    Multiplier = GameState.Replicator:Get("WeekendMultiplier") or 1,
}
u144[GameModifier.Battlepass] = {
    Icon = 16671756946,
    Name = "Battlepass Boost",
    Description = "Enjoy a boost to your battle pass EXP!",
    Multiplier = GameState.Replicator:Get("BattlepassMultiplier") or 1,
}
u144[GameModifier.ClassicDeath] = {
    Icon = 269363975,
    Name = "Retro Deaths",
    Description = "Classic roblox styled deaths.",
    ServerIdentifier = "MessyDeath",
    RunFunction = function() -- Line: 150
        -- upvalues: ReplicatedStorage (val), u117 (val), TimescaleUtilities (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 151
            -- upvalues: ReplicatedStorage (upval), u117 (upval), TimescaleUtilities (upval)
            a2.OnDestroy:Connect(function() -- Line: 152 -- upvalues: ReplicatedStorage (upval), a2 (val), u117 (upval), TimescaleUtilities (upval)
                local v1
                local Projectile = require(ReplicatedStorage.Shared.Modules.Projectile)
                local Position = a2.Model:GetPivot().Position
                local v2 = a2.Model:Clone()
                v2.Parent = workspace
                v2:BreakJoints()
                for i, v in ipairs(v2:GetChildren()) do
                    if v:IsA("BasePart") and v.Transparency < 1 then
                        v1 = v.Position - Position
                        v.Anchored = true
                        v.CanQuery = false
                        v.CanCollide = false
                        v.CanTouch = false
                        v.CollisionGroup = "Players"
                        local u55 = 0
                        local u59 = u117:NextNumber()
                        ;((Projectile:throwWithPhysics({
                            gravity = Vector3.new(-0, -30, -0),
                            start = v.Position,
                            velocity = v1 * u117:NextNumber(10, 20),
                            asset = v,
                            include = {
                                workspace:FindFirstChild("Map"),
                                workspace:FindFirstChild("Ground"),
                                (workspace:FindFirstChild("Cliff")),
                            },
                            rotation = function(a1) -- Line: 182 -- upvalues: u55 (ref), u59 (val) -- types: a1: vector
                                u55 = u55 + 0.1 * a1.Magnitude / 10
                                return CFrame.Angles(u59 + u55, u59 + u55, 0)
                            end,
                        })):andThen(function() -- Line: 187 -- upvalues: v (val)
                            v.CanCollide = true
                            v.Anchored = false
                        end)):catch(function() end)
                    end
                end
                TimescaleUtilities.CleanUp(v2, 5)
            end)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 207 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.ClassicOof] = {
    Icon = 269363975,
    Name = "Classic Oof",
    Description = "Classic roblox styled oofs.",
    ServerIdentifier = "Oof",
    RunFunction = function() -- Line: 221 -- upvalues: Create (val), GameState (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 222 -- upvalues: Create (upval), GameState (upval)
            a2.OnDestroy:Connect(function() -- Line: 223 -- upvalues: Create (upval), a2 (val), GameState (upval)
                local u11 = Create("Attachment", {
                    WorldPosition = a2.Model:GetPivot().Position,
                    Parent = workspace.Terrain,
                })
                local v1 = Create("Sound", {
                    SoundId = "rbxassetid://17564423313",
                    Volume = 0.2,
                    PlaybackSpeed = 1 * GameState.TimeScale,
                    Parent = u11,
                })
                v1.Ended:Connect(function() -- Line: 236 -- upvalues: u11 (val)
                    u11:Destroy()
                end)
                v1:Play()
            end)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 251 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.BadTranslation] = {
    Icon = 35395285,
    Name = "Translated",
    Description = "Questionable translations.",
    ServerIdentifier = "BadTranslation",
}
u144[GameModifier.HealthLock] = {Icon = 10045657037, Name = "HP Locked", Description = "Base health is capped."}
u144[GameModifier.Mutation] = {
    Icon = 10046408505,
    Name = "Mutation",
    Description = "Mobs will gain more HP per wave after being introduced.",
    Multiplier = 0.2,
    ServerIdentifier = "Mutation",
}
u144[GameModifier.Birthday] = {
    Icon = 10044810289,
    Name = "Birthday",
    Description = "Confetti.. EVERYWHERE.",
    ServerIdentifier = "Birthday",
    RunFunction = function() -- Line: 283 -- upvalues: u117 (val), Misc (val), Children (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 284 -- upvalues: u117 (upval), Misc (upval), Children (upval)
            local v1
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://5759274072"
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u117:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            a2:EquipHat(Misc.PartyHat, true)
            for i, v in ipairs(Children) do
                v1 = v:Clone()
                v1.Parent = a2.Effect.MainAttachment
                table.insert(a2.Particles, v1)
            end
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 308 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.JulyFourth] = {
    Icon = 10044810289,
    Name = "Fireworks",
    Description = "Happy Fourth of July!",
    ServerIdentifier = "JulyFourth",
    RunFunction = function() -- Line: 322 -- upvalues: u117 (val), Misc (val), Children_2 (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 323 -- upvalues: u117 (upval), Misc (upval), Children_2 (upval)
            local v1
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://269146157"
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u117:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            a2:EquipHat(Misc.UncleSamHat, true)
            for i, v in ipairs(Children_2) do
                v1 = v:Clone()
                v1.Parent = a2.Effect.MainAttachment
                table.insert(a2.Particles, v1)
            end
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 347 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.PirateHat] = {
    Icon = 10045192886,
    Name = "Talk Like a Pirate Day",
    Description = "Arrr!",
    ServerIdentifier = "Pirate",
    RunFunction = function() -- Line: 361 -- upvalues: Misc (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 362 -- upvalues: Misc (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(Misc.PirateHat, true)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 378 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.Halloween] = {
    Icon = 11416875715,
    Name = "Halloween",
    Description = "Happy Halloween! Enemies spawn with pumpkin heads.",
    ServerIdentifier = "Halloween",
}
u144[GameModifier.Scuba] = {
    Icon = 10119865337,
    Name = "Scuba Gear",
    Description = "In the depths of the ocean.",
    ServerIdentifier = "Scuba",
    RunFunction = function() -- Line: 398 -- upvalues: Misc (val), u117 (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 399 -- upvalues: Misc (upval), u117 (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(Misc.ScubaHelmet, true)
            local v1 = Misc.Bubbles.Particle:Clone()
            v1.Parent = a2.PrimaryPart
            local Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://5852470908"
            Sound.Volume = 2
            Sound.PlayOnRemove = true
            Sound.PlaybackSpeed = u117:NextNumber(0.8, 1.2)
            Sound.Parent = a2.PrimaryPart
            local v2 = Misc.BubblesDeath.Particle:Clone()
            v2.Parent = a2.Effect.MainAttachment
            table.insert(a2.Particles, v2)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 427 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.Legacy] = {
    Icon = 17113206952,
    Name = "Legacy",
    Description = "Replaces all enemies with legacy variants.",
    ServerIdentifier = "Legacy",
}
u144[GameModifier.Astronaut] = {
    Icon = 10120744749,
    Name = "Space Suit",
    Description = "Oxygen-powered.",
    ServerIdentifier = "Astronaut",
    RunFunction = function() -- Line: 447 -- upvalues: Misc (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 448 -- upvalues: Misc (upval)
            if not a2 then
                return nil
            end
            a2:EquipHat(Misc.AstronautHelmet, true)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0, nil, 99)
        return function() -- Line: 466 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.Blood] = {
    Icon = 11416875395,
    Name = "Blood",
    Description = "It's actually pizza sauce!",
    ServerIdentifier = "Blood",
    RunFunction = function() -- Line: 480 -- upvalues: UserGameSettings (val), EffectsController (val), LegacyMiddleware (val)
        local u0 = {
            [Enum.SavedQualitySetting.QualityLevel2] = 1,
            [Enum.SavedQualitySetting.QualityLevel3] = 1,
            [Enum.SavedQualitySetting.QualityLevel4] = 1,
            [Enum.SavedQualitySetting.QualityLevel5] = 2,
            [Enum.SavedQualitySetting.QualityLevel6] = 2,
            [Enum.SavedQualitySetting.QualityLevel7] = 2,
            [Enum.SavedQualitySetting.QualityLevel8] = 2,
            [Enum.SavedQualitySetting.QualityLevel9] = 2,
            [Enum.SavedQualitySetting.QualityLevel10] = 4,
            [Enum.SavedQualitySetting.Automatic] = 2,
            [Enum.SavedQualitySetting.QualityLevel1] = 0,
        }

        local function u23(a1, a2) -- Line: 495
            -- upvalues: u0 (val), UserGameSettings (upval), EffectsController (upval)
            if not a2 then
                return nil
            end
            a2.OnDestroy:Connect(function() -- Line: 500 -- upvalues: u0 (upval), UserGameSettings (upval), EffectsController (upval), a2 (val)
                local v1 = u0[UserGameSettings.SavedQualityLevel]
                if v1 == 0 then
                    return
                end
                EffectsController.BloodDrop({
                    range = 10,
                    dtMultiplier = 5,
                    gravity = -4,
                    direction = Vector3.new(4, 0, 4),
                    npc = a2,
                    amount = v1,
                    velocity = NumberRange.new(1, 4),
                })
            end)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u23, nil, 99)
        return function() -- Line: 529 -- upvalues: LegacyMiddleware (upval), u23 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u23)
        end
    end,
}
u144[GameModifier.Cowboy] = {
    Icon = 10045192886,
    Name = "Cowboy",
    Description = "Yeehaw!",
    ServerIdentifier = "Cowboy",
    RunFunction = function() -- Line: 543 -- upvalues: u89 (val), Misc (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 544 -- upvalues: u89 (upval), Misc (upval)
            if a2 and not u89[a2.Name] then
                a2:EquipHat(Misc.CowboyHat, true)
            end
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0, nil, 99)
        return function() -- Line: 560 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.DoubleHealth] = {
    Icon = 1565113310,
    Name = "Double Health",
    Description = "You have double health.",
    RunFunction = function() -- Line: 573 -- upvalues: HealthParticle (val), LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 574 -- upvalues: HealthParticle (upval)
            if not a2 then
                return nil
            end
            local v1 = HealthParticle:Clone()
            v1.Parent = a2.PrimaryPart
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 590 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.NewModels] = {
    Icon = 10045879046,
    Name = "Enemies Beta",
    Description = "Mob models are replaced with refreshed models.",
    ServerIdentifier = "NewModels",
}
u144[GameModifier.BadlandsEnemies] = {
    Icon = 10044911963,
    Name = "Badlands",
    Description = "Mobs are replaced with western variants.",
    Multiplier = 0.2,
    ServerIdentifier = "BadlandsEnemies",
    RunFunction = function() -- Line: 611 -- upvalues: SoundService (val), u117 (val), LegacyMiddleware (val)
        local Sound
        local Music = workspace:WaitForChild("Music")
        local u9 = ""
        local u10 = {}
        local u11 = nil
        for k, v in pairs({10981954022, 10981954769, 10981955568}) do
            Sound = Instance.new("Sound")
            Sound.SoundId = "rbxassetid://" .. v
            Sound.Volume = 0.5
            Sound.Parent = workspace
            Sound.SoundGroup = SoundService.Music
            table.insert(u10, Sound)
        end

        local function shuffleSound() -- Line: 629 -- upvalues: u10 (val), u117 (upval), u11 (ref)
            local v1 = u10[u117:NextInteger(1, #u10)]
            while v1 == u11 do
                v1 = u10[u117:NextInteger(1, #u10)]
            end
            u11 = v1
            return v1
        end

        local function u27(a1, a2) -- Line: 640 -- upvalues: Music (val), u9 (ref), shuffleSound (val)
            if a2 % 10 == 0 or a2 == 1 then
                if Music.Value ~= "" then
                    u9 = Music.Value
                    Music.Value = ""
                end
                local v1 = shuffleSound()
                v1:Play()
                task.wait(v1.TimeLength * 1.5)
                if Music.Value == "" then
                    Music.Value = u9
                end
                u9 = ""
            end
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, u27)
        return function() -- Line: 666 -- upvalues: LegacyMiddleware (upval), u27 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.OnNextWave, LegacyMiddleware.Boundedness.Outbound, u27)
        end
    end,
}
u144[GameModifier.PollutedWasteland] = {
    Icon = 10044769819,
    Name = "Nuclear",
    Description = "Mobs are replaced with nuclear variants.",
    Multiplier = 0.3,
    ServerIdentifier = "PollutedWasteland",
}
u144[GameModifier.PizzaParty] = {
    Icon = 11416882364,
    Name = "Pizza Party",
    Description = "Mobs are replaced with pizzeria variants.",
    Multiplier = 0.1,
    ServerIdentifier = "PizzaParty",
}
u144[GameModifier.MemeMode] = {
    Icon = 16972125270,
    Name = "Brain Rot",
    Description = "Dop dop yes yes",
    Multiplier = 0.5,
    ServerIdentifier = "MemeMode",
    RunFunction = function() -- Line: 695
        -- upvalues: ReplicatedStorage (val), Create (val), Players (val), TweenService (val), TimescaleUtilities (val)
        local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
        local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
        local v1 = Create("Sound", {
            Name = "Fart",
            SoundId = "rbxassetid://6445594239",
            Volume = 1,
            Parent = workspace.CurrentCamera,
        })
        local u61 = Create("ScreenGui", {
            Name = "VignetteGui",
            IgnoreGuiInset = true,
            ResetOnSpawn = false,
            ScreenInsets = Enum.ScreenInsets.DeviceSafeInsets,
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
            Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
            (Create("ImageLabel", {
                Name = "Vignette",
                Image = "rbxassetid://8052577310",
                BackgroundTransparency = 1,
                ImageTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            })),
        })
        v1:Play()
        TweenService:Create(u61.Vignette, TweenInfo.new(1, Enum.EasingStyle.Exponential), {ImageTransparency = 0}):Play()
        Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
        task.delay(1, function() -- Line: 739 -- upvalues: TweenService (upval), u61 (val)
            TweenService:Create(u61.Vignette, TweenInfo.new(5, Enum.EasingStyle.Exponential), {ImageTransparency = 1}):Play()
        end)
        Notification.Create({Text = "The brain rot has begun!"})
        TimescaleUtilities.CleanUp(u61, 6)
        TimescaleUtilities.CleanUp(v1, 6)
        workspace.Music.Value = "Skibidi"
    end,
}
u144[GameModifier.Redemption] = {
    Icon = 11417699882,
    Name = "Lost Souls",
    Description = "The game just got harder.",
    ServerIdentifier = "Redemption",
}
u144[GameModifier.Fallen] = {
    Icon = 6739682029,
    Name = "Fallen",
    Description = "You are a fallen angel. You have a chance to get a special hat.",
}
u144[GameModifier.Small] = {
    Icon = 4830003493,
    Name = "Small",
    Description = "You are a small enemy. You have a chance to get a special hat.",
    ServerIdentifier = "Small",
    RunFunction = function() -- Line: 773 -- upvalues: LegacyMiddleware (val)
        local function u0(a1, a2) -- Line: 774
            if not a2 then
                return nil
            end
            a2:ScaleBy(0.5, 100)
            return a2
        end

        LegacyMiddleware:Hook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        return function() -- Line: 789 -- upvalues: LegacyMiddleware (upval), u0 (val)
            LegacyMiddleware:RemoveHook(LegacyMiddleware.HookType.SpawnEnemy, LegacyMiddleware.Boundedness.Outbound, u0)
        end
    end,
}
u144[GameModifier.Juggernaut] = {
    Icon = 10044810289,
    Name = "Juggernaut",
    Description = "All enemies have high defenses, tank and bloated modifiers.",
}
u144[GameModifier.Vanguard] = {Icon = 10044810289, Name = "Vanguard", Description = "All enemies have Nimble."}
u144[GameModifier.OopsAllSlimes] = {Icon = 10044810289, Name = "Oops all slimes!", Description = "All enemies have Slime."}
u144[GameModifier.ClassicRoblox] = {
    Icon = 10044810289,
    Name = "Classic Roblox",
    Description = "Enemies spawn with Classic Roblox event 2024 modifiers.",
}
u144[GameModifier.BackToBasics] = {
    Icon = 10044810289,
    Name = "Back to Basics",
    Description = "Players start out only using beginner towers. Players receive a full refund when selling towers.",
}
u144[GameModifier.BossRush] = {
    Icon = 10044810289,
    Name = "Boss Rush",
    Description = "Players are given a lot of cash after each wave and progress through fighting boss waves from each mode each wave.",
}
u144[GameModifier.Legion] = {
    Icon = 10044810289,
    Name = "Legion",
    Description = "AOE focused challenge that pits the player against swarms of enemies.",
}
u144[GameModifier.JailedTower] = {
    Icon = 17833795233,
    Name = "Jailed Towers",
    Description = "Once per wave, a tower type will be jailed.",
}
local u277 = {}

local function makeIcon(a1, a2) -- Line: 843 -- upvalues: ModifiersStore (val) -- types: a1: number, a2: table
    local add = ModifiersStore.add
    local v1 = {
        Type = a2.Name,
        Name = a2.Name,
        Icon = a2.Icon,
        Title = a2.Name,
        Description = a2.Description,
    }
    local Multiplier_2 = a2.Multiplier and ("x%*"):format(1 + a2.Multiplier)
    v1.AdditionalText = Multiplier_2
    add(v1)
end

local function removeIcon(a1, a2) -- Line: 854 -- upvalues: ModifiersStore (val) -- types: a1: number, a2: table
    ModifiersStore.remove({
        Name = a2.Name,
        Type = a2.Name,
        Icon = a2.Icon,
        Title = a2.Name,
        Description = a2.Description,
    })
end

local function onModifierAdded(a1) -- Line: 864 -- upvalues: u144 (val), u277 (val), makeIcon (val)
    if a1 == nil then
        return
    end
    if u144[a1] then
        if u144[a1].RunFunction then
            u277[a1] = (u144[a1].RunFunction())
        end
        if u144[a1].Icon then
            makeIcon(a1, u144[a1])
            return
        end
        warn("No icon for modifier \"" .. (tostring(a1)) .. "\", not adding to display")
    end
end

local function onModifierRemoved(a1) -- Line: 882 -- upvalues: u144 (val), u277 (val), ModifiersStore (val)
    if a1 == nil then
        return
    end
    if u144[a1] then
        if u277[a1] then
            u277[a1]()
        end
        if u144[a1].Icon then
            local v1 = u144[a1]
            ModifiersStore.remove({
                Name = v1.Name,
                Type = v1.Name,
                Icon = v1.Icon,
                Title = v1.Name,
                Description = v1.Description,
            })
            return
        end
        warn("No icon for modifier \"" .. (tostring(a1)) .. "\", not adding to display")
    end
end

for k2 in pairs(v2:GetAllStates()) do
    onModifierAdded(k2)
end

local function updateBoostModifiers() -- Line: 904
    -- upvalues: GameState (val), u144 (val), GameModifier (val), ModifiersStore (val)
    local v1 = GameState.Replicator:Get("WeekendMultiplier") or 1
    local v2 = GameState.Replicator:Get("BattlepassMultiplier") or 1
    u144[GameModifier.Weekend].Multiplier = v1
    u144[GameModifier.Battlepass].Multiplier = v2
    ModifiersStore.update("XP Boost", {AdditionalText = ("x%*"):format(1 + v1)})
    ModifiersStore.update("Battlepass Boost", {AdditionalText = ("x%*"):format(1 + v2)})
end

updateBoostModifiers()
;(GameState.Replicator:GetStateChangedSignal("WeekendMultiplier")):Connect(updateBoostModifiers)
;(GameState.Replicator:GetStateChangedSignal("BattlepassMultiplier")):Connect(updateBoostModifiers)
if not RunService:IsServer() then
    v2.Changed:Connect(function(a1, a2) -- Line: 925 -- upvalues: onModifierAdded (val), u144 (val), u277 (val), ModifiersStore (val)
        if a2 ~= nil then
            onModifierAdded(a1)
            return
        end
        if a1 == nil then
            return
        end
        if u144[a1] then
            if u277[a1] then
                u277[a1]()
            end
            if u144[a1].Icon then
                local v1 = u144[a1]
                ModifiersStore.remove({
                    Name = v1.Name,
                    Type = v1.Name,
                    Icon = v1.Icon,
                    Title = v1.Name,
                    Description = v1.Description,
                })
                return
            end
            warn("No icon for modifier \"" .. (tostring(a1)) .. "\", not adding to display")
        end
    end)
end
v1.Modifiers = u144
v1.Replicator = v2
return v1