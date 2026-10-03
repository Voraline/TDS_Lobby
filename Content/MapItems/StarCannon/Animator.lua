-- Script path: ReplicatedStorage.Content.MapItems.StarCannon.Animator
-- Decompile time: 6.08 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Moonlite = require(ReplicatedStorage.Client.Modules.Moonlite)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local SpringClass = require(ReplicatedStorage.Shared.Modules.Standalone.SpringClass)
local TimescaleUtilities = require(ReplicatedStorage.Shared.Modules.TimescaleUtilities)
local TweenService = require(ReplicatedStorage.Client.Modules.TweenService)
local VignetteStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.VignetteStore)
local u59 = {on = 121370449791581, humLoop = 76986390773985}
return {
    new = function(a1, a2, a3) -- Line: 18
        -- upvalues: Maid (val), u59 (val), Create (val), SpringClass (val), RunService (val), TweenService (val)
        -- upvalues: TimescaleUtilities (val), Moonlite (val), Lighting (val), VignetteStore (val), Shaker (val)
        local v1
        local u3 = {}
        u3.maid = Maid.new()
        u3.sounds = {}

        function u3.Destroy(a1) -- Line: 24 -- upvalues: u3 (val)
            u3.maid:Sweep()
        end

        for k, v in pairs(u59) do
            v1 = Create("Sound", {
                Volume = 1,
                Name = k,
                SoundId = "rbxassetid://" .. tostring(v),
                Looped = string.match(k, "Loop$"),
                Parent = a1.RotationPart,
            })
            u3.maid:Mark(v1)
            u3.sounds[k] = v1
        end
        local Position = a1.RotationPart.Position
        local CFrame_2 = a1.RotationPart.CFrame
        local u31 = CFrame_2 * CFrame.Angles(0.5235987755982988, 0, 0)
        local Attachment = Instance.new("Attachment")
        Attachment.Name = "HitSoundAttachment"
        Attachment.Parent = workspace.Terrain
        local u41 = Create("Sound", {Name = "HitSound", SoundId = "rbxassetid://133203273388015", Volume = 7, Parent = Attachment})
        local CFrameValue = Instance.new("CFrameValue")
        CFrameValue.Value = CFrame_2
        local u50 = SpringClass.new(0, 0.2, 12)
        local u56 = SpringClass.new(0, 0.45, 10)
        u3.maid:Mark((RunService.Heartbeat:Connect(function() -- Line: 62 -- upvalues: u50 (val), a1 (val), CFrameValue (val), u56 (val)
            local p = u50.p
            a1.RotationPart.CFrame = CFrameValue.Value * CFrame.Angles(math.rad(p), 0, 0) * CFrame.new(0, 0, u56.p)
            a1.CannonFoundation.FoundationPart2.Orientation = Vector3.new(0, a1.RotationPart.Orientation.Y + 90, 0)
        end)))

        function u3._updateEnabled(a1_2, a2) -- Line: 72
            -- upvalues: u3 (val), a1 (val), TweenService (upval), CFrameValue (val), u31 (val)
            -- upvalues: TimescaleUtilities (upval), u50 (val)
            local v1, v2, v3
            if a2 then
                u3.sounds.humLoop:Play()
                u3.sounds.on:Play()
            end
            a1.Attachment.AmountText.Enabled = a2
            a1.Attachment.Images.Enabled = a2
            if not a2 then
                for i, j in a1:GetDescendants() do
                    if j:IsA("SurfaceAppearance") then
                        v3 = TweenService
                        v1 = TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                        v2 = {Color = Color3.new(0, 0, 0)}
                        v3:Create(j, v1, v2):Play()
                    end
                end
                return
            end
            for k, n in a1:GetDescendants() do
                if n:IsA("SurfaceAppearance") then
                    v3 = TweenService
                    v1 = TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    v2 = {Color = Color3.new(1, 1, 1)}
                    v3:Create(n, v1, v2):Play()
                end
                if n:IsA("BasePart") then
                    v3 = TweenService
                    v1 = TweenInfo.new(0.85, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
                    v3:Create(n, v1, {Transparency = 0}):Play()
                end
            end
            TweenService:Create(CFrameValue, TweenInfo.new(1, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {Value = u31}):Play()
            TimescaleUtilities.Delay(0.95, function() -- Line: 113 -- upvalues: TweenService (upval), a1 (upval), u50 (upval)
                TweenService:Create(a1.StarCannon.Neon, TweenInfo.new(0.8), {Color = Color3.fromRGB(255, 159, 70)}):Play()
                TweenService:Create(
                    workspace.Map.Environment.StarCannonLight.LightAttachment.SpotLight,
                    TweenInfo.new(8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out),
                    {Brightness = 7.5}
                ):Play()
                for i, j in workspace.Map.Environment.StarCannonLight:GetDescendants() do
                    if j:IsA("ParticleEmitter") then
                        j.Enabled = true
                    end
                end
                local v1 = u50
                v1.v = v1.v + 70
            end)
        end

        function u3:Shoot() -- Line: 151 -- upvalues: a1 (val), Moonlite (upval)
            if not self._vfxPlayer then
                local StarCannonVFX = a1.StarCannon.StarCannonVFX
                local v1 = Moonlite.CreatePlayer(StarCannonVFX)
                v1.Looped = false
                v1.RestoreDefaults = false
                self._vfxPlayer = v1
            end
            self._vfxPlayer.TimePosition = 0
            self._vfxPlayer:Play()
        end

        function u3._flash(a1) -- Line: 164
            -- upvalues: TweenService (upval), Lighting (upval), TimescaleUtilities (upval)
            TweenService:Create(Lighting, TweenInfo.new(0.06), {ExposureCompensation = 2}):Play()
            TimescaleUtilities.Delay(0.06, function() -- Line: 168 -- upvalues: TweenService (upval), Lighting (upval)
                TweenService:Create(
                    Lighting,
                    TweenInfo.new(6, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {ExposureCompensation = 0}
                ):Play()
            end)
        end

        function u3._animateVignette(a1, a2) -- Line: 177 -- upvalues: VignetteStore (upval)
            VignetteStore.setAnimationData({
                transparency = a2.transparency,
                tweenInfo = a2.tweenInfo,
                color = a2.color,
            })
        end

        function u3.Initialize(a1_2) -- Line: 185
            -- upvalues: u3 (val), TweenService (upval), CFrameValue (val), u31 (val), TimescaleUtilities (upval)
            -- upvalues: a1 (val), u56 (val), Shaker (upval), Attachment (val), u41 (val), a3 (val), a2 (val)
            u3.Executables = {
                Shoot = function(a1_2) -- Line: 187
                    -- upvalues: TweenService (upval), CFrameValue (upval), u31 (upval), TimescaleUtilities (upval)
                    -- upvalues: a1 (upval), u3 (upval), u56 (upval), Shaker (upval), Attachment (upval), u41 (upval)
                    local Lord_Exo = workspace:FindFirstChild("Lord_Exo")
                    local v1 = CFrameValue
                    TweenService:Create(v1, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                        Value = CFrame.new(u31.Position, a1_2 or Lord_Exo.PrimaryPart.Root.Torso.WorldPosition),
                    }):Play()
                    TimescaleUtilities.Delay(0.45, function() -- Line: 200
                        -- upvalues: TweenService (upval), a1 (upval), u3 (upval), a1_2 (val), Lord_Exo (val)
                        -- upvalues: u56 (upval), Shaker (upval), Attachment (upval), u41 (upval)
                        TweenService:Create(
                            a1.StarCannon.Neon,
                            TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                            {Color = Color3.fromRGB(255, 70, 230)}
                        ):Play()
                        u3:_animateVignette({
                            transparency = 0,
                            tweenInfo = TweenInfo.new(0.8, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
                            color = Color3.new(0, 0, 0),
                        })
                        a1.StarCannon.CannonPart2.BeamEnd.WorldPosition = a1_2 or Lord_Exo.PrimaryPart.Root.Torso.WorldPosition
                        a1.StarCannon.CannonPart2.Fire:Play()
                        u3:Shoot()
                        task.delay(0.76, function() -- Line: 223
                            -- upvalues: TweenService (upval), a1 (upval), u56 (upval), Shaker (upval), a1_2 (upval)
                            -- upvalues: Attachment (upval), u41 (upval), u3 (upval)
                            TweenService:Create(a1.StarCannon.Neon, TweenInfo.new(0.03), {Color = Color3.fromRGB(255, 255, 255)}):Play()
                            task.delay(0.05, function() -- Line: 230 -- upvalues: TweenService (upval), a1 (upval)
                                TweenService:Create(
                                    a1.StarCannon.Neon,
                                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                                    {Color = Color3.fromRGB(255, 159, 70)}
                                ):Play()
                            end)
                            local v1 = u56
                            v1.v = v1.v + 80
                            Shaker:Shake({5, 25, 0, 2, 5}, 0.5, 2)
                            if not a1_2 then
                                Attachment.WorldPosition = a1.StarCannon.CannonPart2.BeamEnd.WorldPosition
                                u41:Play()
                            end
                            u3:_flash()
                            u3:_animateVignette({
                                transparency = 1,
                                tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                                color = Color3.new(0, 0, 0),
                            })
                        end)
                    end)
                end,
            }
            u3:_updateEnabled((a3:WaitForState("Enabled")))
            ;(a3:GetStateChangedSignal("Enabled")):Connect(function(a1) -- Line: 267 -- upvalues: u3 (upval)
                u3:_updateEnabled(a1)
            end)

            local function updateBatteries(a1_2) -- Line: 271 -- upvalues: a1 (upval), a2 (upval)
                local v1
                a1.Attachment.AmountText.TextLabel.Text = ("%* | 3"):format(a1_2)
                local MaxBatteries = a2.MaxBatteries
                for i = 1, MaxBatteries do
                    v1 = a1.Attachment.Images.Holder[tostring(i)]
                    v1.ImageColor3 = Color3.new()
                    v1.ImageTransparency = 0.44
                end
                for j = 1, a1_2 do
                    v1 = a1.Attachment.Images.Holder[tostring(j)]
                    v1.ImageColor3 = Color3.fromRGB(255, 208, 0)
                    v1.ImageTransparency = 0
                end
            end

            ;(a3:GetStateChangedSignal("Batteries")):Connect(updateBatteries)
            updateBatteries(a3:WaitForState("Batteries"))
        end

        function u3.Step(a1, a2) end

        return u3
    end,
}