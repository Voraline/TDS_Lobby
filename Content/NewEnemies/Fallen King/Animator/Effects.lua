-- Script path: ReplicatedStorage.Content.NewEnemies.Fallen King.Animator.Effects
-- Decompile time: 5.41 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local FallenKing = ReplicatedStorage.Assets.Effects.Mob.FallenKing
return {
    DeathEffect = function(a1) -- Line: 13
        -- upvalues: FallenKing (val), spr (val), TweenService (val), RunService (val), TimescaleUtilities (val)
        local v1, v2
        local u116 = FallenKing[("Death%*"):format(a1.phase)]:Clone()
        local Y = (a1.Model:GetExtentsSize()).Y
        local u16 = {value = 0}
        spr.target(u16, 0.48, 0.71, {value = Y})
        u116.Cylinder.Transparency = 1
        u116.flip.Transparency = 1
        TweenService:Create(u116.Cylinder, TweenInfo.new(1), {Transparency = 0.25}):Play()
        TweenService:Create(u116.flip, TweenInfo.new(1), {Transparency = 0.95}):Play()
        local u117 = RunService.Heartbeat:Connect(function() -- Line: 27 -- upvalues: u116 (val), u16 (val)
            u116.Cylinder.Size = Vector3.new(u16.value, 900, u16.value)
            u116.flip.Size = Vector3.new(u16.value + 1, 900, u16.value + 1)
        end)
        for i, j in u116:GetDescendants() do
            if j:IsA("Light") then
                v1 = TweenService
                v2 = TweenInfo.new(1)
                v1:Create(j, v2, {Brightness = 14}):Play()
            end
            if j:IsA("ParticleEmitter") then
                j.Enabled = true
            end
        end
        u116:PivotTo(a1.Model.PrimaryPart.Node.WorldCFrame * (CFrame.Angles(0, 0, 1.5707963267948966)))
        u116.Parent = workspace.CurrentCamera
        TimescaleUtilities.Delay(5, function() -- Line: 44 -- upvalues: u117 (val), TweenService (upval), u116 (val)
            local v1, v2
            u117:Disconnect()
            TweenService:Create(
                u116.Cylinder,
                TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Transparency = 1, Size = Vector3.new(0, 0, 0)}
            ):Play()
            TweenService:Create(
                u116.flip,
                TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                {Transparency = 1, Size = Vector3.new(0, 0, 0)}
            ):Play()
            for i, j in u116:GetDescendants() do
                if j:IsA("Light") then
                    v1 = TweenService
                    v2 = TweenInfo.new(1)
                    v1:Create(j, v2, {Brightness = 0}):Play()
                end
                if j:IsA("ParticleEmitter") then
                    j.Enabled = false
                end
            end
        end)
    end,
    splines = function(a1) -- Line: 69 -- upvalues: FallenKing (val)
        local v1, v2, v3
        local u1 = {}
        local u2 = {}
        local u3 = {}
        local v4 = {Color3.fromRGB(37, 237, 255), (Color3.fromRGB(255, 47, 227))}
        local v5 = {
            ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.142, Color3.fromRGB(37, 237, 255)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(67, 10, 255))),
            }),
            (ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                ColorSequenceKeypoint.new(0.142, Color3.fromRGB(255, 47, 227)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(190, 26, 255))),
            })),
        }
        for i = 1, 30 do
            v3 = FallenKing.Trail:Clone()
            v1 = i * 30
            v2 = math.random(1, #v5)
            v3.Trail.Color = v5[v2]
            v3.ParticleEmitter.Color = ColorSequence.new(v4[v2])
            v3.Parent = workspace.CurrentCamera
            u3[v3] = v1
            table.insert(u2, v3)
        end
        local u114 = workspace.CurrentCamera.CFrame * CFrame.new(0, 100, 0)
        table.insert(u1, ((game:GetService("RunService")).RenderStepped:Connect(function(a1) -- Line: 111 -- upvalues: u3 (val), u114 (ref)
            local v1, v2, v3, v4, v5, v6
            local v7 = {}
            local v8 = {}
            for i, j in u3 do
                v5 = workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -25) * CFrame.Angles(0, 0.7853981633974483, 0.17453292519943295)
                u114 = u114:Lerp(v5, a1 * 2)
                v6 = math.noise(j * 1.23) * 400
                v1 = math.noise(j * 4) * 60
                v2 = (math.noise(j / 2)) * 200
                v3 = u114 * CFrame.new(v6, v1, v2)
                v4 = u3
                v4[i] = v4[i] + a1 / 4
                table.insert(v7, i)
                table.insert(v8, v3)
            end
            workspace:BulkMoveTo(v7, v8, Enum.BulkMoveMode.FireCFrameChanged)
        end)))
        a1.Maid:Mark(function() -- Line: 138 -- upvalues: u2 (val), u1 (val), u3 (val)
            for i, j in u2 do
                j:Destroy()
            end
            for k, n in u1 do
                n:Disconnect()
            end
            table.clear(u1)
            table.clear(u2)
            table.clear(u3)
        end)
    end,
    phase2 = function(a1) -- Line: 152
        -- upvalues: FallenKing (val), Lighting (val), RunService (val), TweenService (val), TimescaleUtilities (val)
        local u5 = FallenKing.CameraVFX:Clone()
        u5.Name = "FallenVFX"
        u5.Parent = workspace.CurrentCamera
        local Sky = Lighting:FindFirstChildOfClass("Sky")
        local u18 = nil
        if not Sky then
            u18 = Instance.new("Sky")
            u18.Name = "Sky"
            u18.Parent = Lighting
        end
        local Atmosphere = Instance.new("Atmosphere")
        Atmosphere.Name = "FallenAtmosphere"
        Atmosphere.Color = Color3.fromRGB(199, 91, 176)
        Atmosphere.Decay = Color3.fromRGB(154, 20, 107)
        Atmosphere.Density = 0
        Atmosphere.Glare = 0
        Atmosphere.Haze = 0
        Atmosphere.Parent = Lighting
        local u45 = RunService.Heartbeat:Connect(function() -- Line: 175 -- upvalues: u5 (val)
            u5.CFrame = workspace.CurrentCamera.CFrame
        end)
        TweenService:Create(
            Atmosphere,
            TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {Density = 0.546, Glare = 1.3, Haze = 2.54}
        ):Play()
        TweenService:Create(Lighting, TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {ClockTime = 17.5}):Play()
        a1.Maid:Mark(function() -- Line: 201 -- upvalues: TimescaleUtilities (upval), Atmosphere (val), u5 (val), u18 (ref), u45 (val)
            TimescaleUtilities.Delay(6, function() -- Line: 202 -- upvalues: Atmosphere (upval), u5 (upval), u18 (upval), u45 (upval)
                Atmosphere:Destroy()
                u5:Destroy()
                if u18 then
                    u18:Destroy()
                end
                u45:Disconnect()
            end)
        end)
    end,
}