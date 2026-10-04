-- Script path: ReplicatedStorage.Client.Modules.Laser
-- Decompile time: 31.94 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Game = SettingsController.Game
local u45 = Random.new()
local Part = Instance.new("Part")
local u53 = CFrame.new(1000000, 1000000, 1000000)
local u64 = workspace:FindFirstChild("LaserPool")
if not u64 then
    u64 = Instance.new("Folder")
    u64.Name = "LaserPool"
    u64.Parent = workspace.CurrentCamera
end
local u68 = {Parts = {}, BulletEffects = {}, Attachments = {}}

local function acquirePart() -- Line: 34 -- upvalues: table (val), u68 (val), Part (val), u64 (ref)
    local v1 = table.remove(u68.Parts)
    if v1 then
        return v1
    end
    local v2 = Part:Clone()
    v2.Name = "PooledBeam"
    v2.Anchored = true
    v2.CanCollide = false
    v2.Locked = true
    v2.CastShadow = false
    v2.Material = Enum.Material.Neon
    v2.Parent = u64
    return v2
end

local function releasePart(a1) -- Line: 50 -- upvalues: u53 (val), table (val), u68 (val) -- types: a1: userdata
    a1.Transparency = 1
    a1.Size = Vector3.new(0, 0, 0)
    a1.CFrame = u53
    table.insert(u68.Parts, a1)
end

local function acquireAttachment() -- Line: 57 -- upvalues: table (val), u68 (val)
    local v1 = table.remove(u68.Attachments)
    if v1 then
        return v1
    end
    local Attachment = Instance.new("Attachment")
    Attachment.Name = "PooledLaserAttachment"
    Attachment.Parent = workspace.Trash
    return Attachment
end

local function releaseAttachment(a1) -- Line: 69 -- upvalues: u53 (val), table (val), u68 (val) -- types: a1: userdata
    a1.WorldCFrame = u53
    table.insert(u68.Attachments, a1)
end

local function acquireBulletEffect(a1) -- Line: 74
    -- upvalues: u68 (val), table (val), ReplicatedStorage (val), u64 (ref)
    local v1 = u68.BulletEffects[a1]
    if v1 and #v1 > 0 then
        return table.remove(v1)
    end
    local v2 = ReplicatedStorage.Assets.Effects.Misc.Bullets:FindFirstChild(a1)
    if not v2 then
        return nil
    end
    local v3 = v2:Clone()
    v3.Parent = u64
    return v3
end

local function releaseBulletEffect(a1, a2) -- Line: 88 -- upvalues: table (val), u68 (val) -- types: a2: string
    if a1.Attachment0 then
        a1.Attachment0 = nil
    end
    if a1.Attachment1 then
        a1.Attachment1 = nil
    end
    table.insert(u68.BulletEffects[a2], a1)
end

local function ensureBulletBucket(a1) -- Line: 101 -- upvalues: u68 (val)
    if not u68.BulletEffects[a1] then
        u68.BulletEffects[a1] = {}
    end
end

local function schedule(a1, a2) -- Line: 107 -- upvalues: TimescaleUtilities (val) -- types: a1: number
    TimescaleUtilities.Delay(a1, a2)
end

local function debrisAddItemPooled(a1, a2, a3, a4) -- Line: 111
    -- upvalues: u53 (val), table (val), u68 (val), TimescaleUtilities (val)
    TimescaleUtilities.Delay(a3, function() -- Line: 113 -- upvalues: a1 (val), a2 (val), u53 (upval), table (upval), u68 (upval), a4 (val)
        local v1
        if a1 == "Part" then
            v1 = a2
            v1.Transparency = 1
            v1.Size = Vector3.new(0, 0, 0)
            v1.CFrame = u53
            table.insert(u68.Parts, v1)
            return
        end
        if a1 == "BulletEffect" then
            v1 = a2
            if v1.Attachment0 then
                v1.Attachment0 = nil
            end
            if v1.Attachment1 then
                v1.Attachment1 = nil
            end
            table.insert(u68.BulletEffects[a4], v1)
            return
        end
        if a1 ~= "Attachment" then
            if a2.Destroy then
                a2:Destroy()
            end
            return
        end
        v1 = a2
        v1.WorldCFrame = u53
        table.insert(u68.Attachments, v1)
    end)
end

local v1 = {}
v1.__index = v1

function v1.Cast(a1, a2) -- Line: 132
    -- upvalues: SettingsController (val), table (val), u68 (val), Part (val), u64 (ref), TweenService (val), u53 (val)
    -- upvalues: TimescaleUtilities (val), math (val), ReplicatedStorage (val)
    local v1
    if SettingsController.Game:Get("Bullet Trails") == false then
        return
    end
    if typeof(a2.Color) == "BrickColor" then
        a2.Color = a2.Color.Color
    end
    local Magnitude = (a2.Start - a2.Pos).Magnitude
    if a2.Type == "Fade" then
        local u36
        v1 = table.remove(u68.Parts)
        if not v1 then
            local v2 = Part:Clone()
            v2.Name = "PooledBeam"
            v2.Anchored = true
            v2.CanCollide = false
            v2.Locked = true
            v2.CastShadow = false
            v2.Material = Enum.Material.Neon
            v2.Parent = u64
            u36 = v2
        else
            u36 = v1
        end
        if a2.Color then
            u36.Color = a2.Color
        end
        u36.Material = Enum.Material.Neon
        u36.Transparency = 0
        u36.Size = Vector3.new(a2.Size, a2.Size, Magnitude)
        u36.CFrame = (CFrame.new(a2.Start, a2.Pos)) * CFrame.new(0, 0, -Magnitude / 2)
        TweenService:Create(u36, TweenInfo.new(a2.Fade, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0), {Transparency = 1}):Play()
        local Fade = a2.Fade
        local u81 = "Part"
        local u82 = nil
        TimescaleUtilities.Delay(Fade, function() -- Line: 113 -- upvalues: u81 (val), u36 (val), u53 (upval), table (upval), u68 (upval), u82 (val)
            local v1
            if u81 == "Part" then
                v1 = u36
                v1.Transparency = 1
                v1.Size = Vector3.new(0, 0, 0)
                v1.CFrame = u53
                table.insert(u68.Parts, v1)
                return
            end
            if u81 == "BulletEffect" then
                v1 = u36
                if v1.Attachment0 then
                    v1.Attachment0 = nil
                end
                if v1.Attachment1 then
                    v1.Attachment1 = nil
                end
                table.insert(u68.BulletEffects[u82], v1)
                return
            end
            if u81 ~= "Attachment" then
                if u36.Destroy then
                    u36:Destroy()
                end
                return
            end
            v1 = u36
            v1.WorldCFrame = u53
            table.insert(u68.Attachments, v1)
        end)
        return
    end
    if a2.Type ~= "Bullet" then
        return
    end
    local v3 = tonumber(a2.Fade) or 0
    if v3 <= 0 or v3 ~= v3 or v3 == math.huge or v3 == -math.huge then
        v3 = 90
    end
    if Magnitude == Magnitude and Magnitude ~= math.huge and Magnitude ~= -math.huge then
        local u146, v4
        v1 = Magnitude / v3
        local Bullet = a2.Bullet
        if not u68.BulletEffects[Bullet] then
            u68.BulletEffects[Bullet] = {}
        end
        local Bullet_2 = a2.Bullet
        local v5 = u68.BulletEffects[Bullet_2]
        if not v5 or not (#v5 > 0) then
            v4 = ReplicatedStorage.Assets.Effects.Misc.Bullets:FindFirstChild(Bullet_2)
            if v4 then
                local v6 = v4:Clone()
                v6.Parent = u64
                u146 = v6
            else
                u146 = nil
            end
        else
            u146 = table.remove(v5)
        end
        if u146 then
            local u160, u173
            v5 = table.remove(u68.Attachments)
            if not v5 then
                local Attachment = Instance.new("Attachment")
                Attachment.Name = "PooledLaserAttachment"
                Attachment.Parent = workspace.Trash
                u160 = Attachment
            else
                u160 = v5
            end
            v4 = table.remove(u68.Attachments)
            if not v4 then
                local Attachment_2 = Instance.new("Attachment")
                Attachment_2.Name = "PooledLaserAttachment"
                Attachment_2.Parent = workspace.Trash
                u173 = Attachment_2
            else
                u173 = v4
            end
            local u174 = false

            local function cleanupBulletTrail() -- Line: 187
                -- upvalues: u174 (ref), u160 (val), u53 (upval), table (upval), u68 (upval), u173 (val), u146 (val)
                -- upvalues: a2 (val)
                if u174 then
                    return
                end
                u174 = true
                local v1 = u160
                v1.WorldCFrame = u53
                table.insert(u68.Attachments, v1)
                v1 = u173
                v1.WorldCFrame = u53
                table.insert(u68.Attachments, v1)
                v1 = u146
                local Bullet = a2.Bullet
                if v1.Attachment0 then
                    v1.Attachment0 = nil
                end
                if v1.Attachment1 then
                    v1.Attachment1 = nil
                end
                table.insert(u68.BulletEffects[Bullet], v1)
            end

            u160.WorldCFrame = CFrame.new(a2.Start, a2.Pos)
            u173.WorldCFrame = CFrame.new(a2.Start, a2.Pos)
            local v7 = if not a2.Reversed then u160 else u173
            u146.Attachment0 = v7
            v7 = if not a2.Reversed then u173 else u160
            u146.Attachment1 = v7
            if a2.Color then
                u146.Color = ColorSequence.new(a2.Color, a2.Color)
            end
            TweenService:Create(
                u173,
                TweenInfo.new(v1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0),
                {WorldCFrame = u173.WorldCFrame * CFrame.new(0, 0, -Magnitude)}
            ):Play()
            TimescaleUtilities.Delay(v1, cleanupBulletTrail)
            task.delay(math.min(2, v1 * 60), cleanupBulletTrail)
        end
        return
    end
end

function v1.Bolt(a1, a2) -- Line: 234
    -- upvalues: math (val), u45 (val), table (val), u68 (val), Part (val), u64 (ref), TweenService (val), u53 (val)
    -- upvalues: TimescaleUtilities (val), Game (val)
    local Fade, Pos_2, v1, v2, v3, v4, v5, v6
    local Start = a2.Start
    local v7 = a2.Offset or 2.5
    local v8 = math.floor((a2.Start - a2.Pos).Magnitude / 3 + 0.5)
    for i = 1, v8 do
        v6 = Vector3.new(u45:NextNumber(-v7, v7), u45:NextNumber(-v7, v7), (u45:NextNumber(-v7, v7)))
        Pos_2 = if not (v8 <= i) then Start + -(Start - a2.Pos).unit * 3 + v6 else a2.Pos
        local Magnitude = (Start - Pos_2).Magnitude
        v1 = table.remove(u68.Parts)
        if not v1 then
            v2 = Part:Clone()
            v2.Name = "PooledBeam"
            v2.Anchored = true
            v2.CanCollide = false
            v2.Locked = true
            v2.CastShadow = false
            v2.Material = Enum.Material.Neon
            v2.Parent = u64
            u74 = v2
        else
            local u74 = v1
        end
        if a2.Color then
            u74.BrickColor = a2.Color
        end
        u74.Transparency = a2.Transparency
        u74.Size = Vector3.new(a2.Size, a2.Size, Magnitude)
        u74.CFrame = CFrame.new(Start:Lerp(Pos_2, 0.5), Pos_2)
        if a2.ColorLerp1 then
            u74.Color = a2.ColorLerp1:lerp(a2.ColorLerp2, i / v8)
        end
        if a2.Type == "Fade" then
            v1 = TweenService
            v3 = TweenInfo.new(a2.Fade, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
            v4 = {Transparency = 1}
            v5 = a2.Zero and Vector3.new(0, 0, Magnitude) or Vector3.new(a2.Size, a2.Size, Magnitude)
            v4.Size = v5
            v1:Create(u74, v3, v4):Play()
            Fade = a2.Fade
            local u160 = "Part"
            local u161 = nil
            TimescaleUtilities.Delay(Fade, function() -- Line: 113 -- upvalues: u160 (val), u74 (val), u53 (upval), table (upval), u68 (upval), u161 (val)
                local v1
                if u160 == "Part" then
                    v1 = u74
                    v1.Transparency = 1
                    v1.Size = Vector3.new(0, 0, 0)
                    v1.CFrame = u53
                    table.insert(u68.Parts, v1)
                    return
                end
                if u160 == "BulletEffect" then
                    v1 = u74
                    if v1.Attachment0 then
                        v1.Attachment0 = nil
                    end
                    if v1.Attachment1 then
                        v1.Attachment1 = nil
                    end
                    table.insert(u68.BulletEffects[u161], v1)
                    return
                end
                if u160 ~= "Attachment" then
                    if u74.Destroy then
                        u74:Destroy()
                    end
                    return
                end
                v1 = u74
                v1.WorldCFrame = u53
                table.insert(u68.Attachments, v1)
            end)
        elseif a2.Type ~= "Bullet" or not Game:Get("Bullet Trails") then
            local u184 = "Part"
            local u185 = nil
            TimescaleUtilities.Delay(0.1, function() -- Line: 113 -- upvalues: u184 (val), u74 (val), u53 (upval), table (upval), u68 (upval), u185 (val)
                local v1
                if u184 == "Part" then
                    v1 = u74
                    v1.Transparency = 1
                    v1.Size = Vector3.new(0, 0, 0)
                    v1.CFrame = u53
                    table.insert(u68.Parts, v1)
                    return
                end
                if u184 == "BulletEffect" then
                    v1 = u74
                    if v1.Attachment0 then
                        v1.Attachment0 = nil
                    end
                    if v1.Attachment1 then
                        v1.Attachment1 = nil
                    end
                    table.insert(u68.BulletEffects[u185], v1)
                    return
                end
                if u184 ~= "Attachment" then
                    if u74.Destroy then
                        u74:Destroy()
                    end
                    return
                end
                v1 = u74
                v1.WorldCFrame = u53
                table.insert(u68.Attachments, v1)
            end)
        else
            local u178 = a2.Fade / v8
            delay(i * u178, function() -- Line: 290
                -- upvalues: TweenService (upval), u74 (val), u178 (val), a2 (val), Magnitude (val), u53 (upval)
                -- upvalues: table (upval), u68 (upval), TimescaleUtilities (upval)
                TweenService:Create(u74, TweenInfo.new(u178, Enum.EasingStyle.Linear, Enum.EasingDirection.In, 0, false, 0), {
                    Transparency = 1,
                    Size = Vector3.new(a2.Size, a2.Size, 0),
                    CFrame = u74.CFrame * CFrame.new(0, 0, -Magnitude / 2),
                }):Play()
                local u34 = u74
                local v1 = u178
                local u36 = "Part"
                local u37 = nil
                TimescaleUtilities.Delay(v1, function() -- Line: 113 -- upvalues: u36 (val), u34 (val), u53 (upval), table (upval), u68 (upval), u37 (val)
                    local v1
                    if u36 == "Part" then
                        v1 = u34
                        v1.Transparency = 1
                        v1.Size = Vector3.new(0, 0, 0)
                        v1.CFrame = u53
                        table.insert(u68.Parts, v1)
                        return
                    end
                    if u36 == "BulletEffect" then
                        v1 = u34
                        if v1.Attachment0 then
                            v1.Attachment0 = nil
                        end
                        if v1.Attachment1 then
                            v1.Attachment1 = nil
                        end
                        table.insert(u68.BulletEffects[u37], v1)
                        return
                    end
                    if u36 ~= "Attachment" then
                        if u34.Destroy then
                            u34:Destroy()
                        end
                        return
                    end
                    v1 = u34
                    v1.WorldCFrame = u53
                    table.insert(u68.Attachments, v1)
                end)
            end)
        end
    end
end

local u95 = {}

function v1.Lightning(a1, a2) -- Line: 321 -- upvalues: math (val), table (val), TweenService (val), u95 (val)
    local u227 = {}
    local Magnitude = (a2.Start - a2.End).Magnitude
    local v1 = math.clamp(math.floor(Magnitude / 4), 3, math.huge)
    local u212 = Magnitude / v1
    local u234 = Random.new()
    if v1 == v1 and v1 ~= math.huge then
        local Beam, Transparency, insert, u241, v2, v3, v4, v5, v6, v7, v8
        local Part = Instance.new("Part")
        Part.Anchored = true
        Part.Transparency = 1
        Part.CanCollide = false
        Part.Size = Vector3.new(0, 0, Magnitude)
        Part.CFrame = (CFrame.new(a2.Start, a2.End)) * CFrame.new(0, 0, -Magnitude / 2)
        Part.Parent = workspace.CurrentCamera

        local function v9(a1) -- Line: 341 -- upvalues: u212 (val), Magnitude (val), Part (val)
            local v1 = u212 * a1
            local Attachment = Instance.new("Attachment")
            Attachment.Name = "Node" .. a1
            Attachment.Position = Vector3.new(0, 0, -Magnitude / 2 + v1)
            Attachment.Parent = Part
            return Attachment
        end

        local Bursts = a2.Bursts
        for i = 1, Bursts do
            table.insert(u227, {})
            insert = table.insert
            v3 = u227[i]
            v5 = u212 * 0
            v4 = Instance.new("Attachment")
            v4.Name = "Node" .. 0
            v4.Position = Vector3.new(0, 0, -Magnitude / 2 + v5)
            v4.Parent = Part
            insert(v3, v4)
            v2 = u234:NextNumber(a2.minWidth, a2.maxWidth)
            v3 = a2.Lifetime * u234:NextNumber(0.2, 1)
            for j = 1, v1 do
                v7 = u212 * j
                v6 = Instance.new("Attachment")
                v6.Name = "Node" .. j
                v6.Position = Vector3.new(0, 0, -Magnitude / 2 + v7)
                v6.Parent = Part
                Beam = Instance.new("Beam")
                v8 = if not a2.EndColor then ColorSequence.new(a2.Color) else ColorSequence.new(a2.Color:Lerp(a2.EndColor, j / v1))
                Beam.Color = v8
                Beam.LightEmission = 1
                Beam.LightInfluence = 0
                Beam.TextureLength = 2
                Beam.TextureSpeed = 10
                Beam.Segments = 1
                Beam.Brightness = a2.Brightness or 1
                Transparency = a2.Transparency or NumberSequence.new(0, 0)
                Beam.Transparency = Transparency
                Beam.TextureMode = Enum.TextureMode.Static
                Beam.FaceCamera = true
                Beam.Width0 = v2
                Beam.Width1 = v2
                Beam.Attachment0 = u227[i][j]
                Beam.Attachment1 = v6
                Beam.Parent = Part
                TweenService:Create(
                    Beam,
                    TweenInfo.new(v3, Enum.EasingStyle.Cubic, Enum.EasingDirection.In, 0, false, 0),
                    {Width0 = 0, Width1 = 0}
                ):Play()
                table.insert(u227[i], v6)
            end
        end
        local u238 = tick() - 0.03
        local u239 = 0

        function u241(a1) -- Line: 407
            -- upvalues: u239 (ref), a2 (val), u238 (ref), u227 (val), u234 (val), u95 (upval), u241 (ref), Part (val)
            u239 = u239 + a1
            local v1 = u239 / a2.Lifetime
            if 0.03 <= tick() - u238 then
                local v2, v3
                for k, v in pairs(u227) do
                    for k2, i in pairs(v) do
                        if k2 > 1 and k2 < #v then
                            v2 = u234:NextNumber(-a2.Offset, a2.Offset)
                            v3 = u234:NextNumber(-a2.Offset, a2.Offset)
                            i.Position = Vector3.new(v2, v3, i.Position.Z)
                        end
                    end
                end
                u238 = tick()
            end
            if v1 >= 1 then
                u95[u241] = nil
                Part:Destroy()
            end
        end

        u95[u241] = true
        return
    end
end

Scheduler.add("UpdateLasers", RunService.Heartbeat, function(a1) -- Line: 436 -- upvalues: u95 (val)
    for i in u95 do
        i(a1)
    end
end)
return v1