-- Script path: ReplicatedStorage.Client.Modules.LiveEventPresentation
-- Decompile time: 19.10 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local DialogStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.DialogStore)
local EffectKinds = require(ReplicatedStorage.Shared.Modules.LiveEvents.EffectKinds)
local u33 = {}

local function vector(a1) -- Line: 11
    return (Vector3.new(a1.x, a1.y, a1.z))
end

local function part(a1, a2, a3, a4) -- Line: 15
    local Part = Instance.new("Part")
    Part.Name = a2
    Part.Shape = Enum.PartType.Ball
    Part.Anchored = true
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.CastShadow = false
    Part.Material = Enum.Material.Neon
    Part.Color = a3
    Part.Size = Vector3.new(1, 1, 1) * a4
    Part.Parent = a1
    return Part
end

local u36 = {}

u36[EffectKinds.Dialogue] = function(a1, a2) -- Line: 34 -- upvalues: DialogStore (val)
    local u4 = "LiveEvent_" .. a1.id
    a2(function() -- Line: 36 -- upvalues: DialogStore (upval), u4 (val)
        DialogStore.remove(u4)
    end)
    local add = DialogStore.add
    local v1 = {OverrideSetting = true, id = u4}
    v1.duration = math.max(0, a1.expiresAt - (workspace:GetServerTimeNow()))
    local v2 = {
        Emotion = "Neutral",
        TimeScaled = false,
        Speaker = a1.data.speaker,
        Text = a1.data.text,
    }
    v2.Voice = if not a1.data.soundId then nil else if not (0 < a1.data.soundId) then nil else a1.data.soundId
    v1.dialog = v2
    add(v1, true)
end

u36[EffectKinds.Sticker] = function(a1, a2, a3) -- Line: 55 -- upvalues: ReplicatedStorage (val), Players (val)
    local PlayerByUserId
    local StickerController = require(ReplicatedStorage.Client.Controllers.Shared.StickerController)
    for i, j in a1.data.userIds do
        PlayerByUserId = Players:GetPlayerByUserId(j)
        if a3() then
            break
        end
        if PlayerByUserId and PlayerByUserId.Character then
            local u36 = StickerController.createLocalSticker(a1.data.name, PlayerByUserId)
            if u36 then
                u36:catch(function() end)
                a2(function() -- Line: 67 -- upvalues: u36 (val)
                    u36:cancel()
                end)
                if a3() then
                    u36:cancel()
                end
            end
        end
    end
end

u36[EffectKinds.EventTeleportSequence] = function(a1, a2) -- Line: 78 -- upvalues: Players (val), ReplicatedStorage (val)
    if workspace.Type.Value == "Lobby" and table.find(a1.data.userIds, Players.LocalPlayer.UserId) then
        a2((require(ReplicatedStorage.Client.Controllers.Lobby.LiveEventEffectsController)).PlaySequence())
    end
end

local u43 = {}

u43[EffectKinds.Blackout] = function(a1, a2, a3) -- Line: 107 -- upvalues: Lighting (val), Players (val)
    local Frame, UICorner, UIStroke, v1, v2
    local u3 = {}
    local u4 = {Brightness = 0, ClockTime = 0, ExposureCompensation = -0.5}
    u4.Ambient = Color3.fromRGB(4, 5, 12)
    u4.OutdoorAmbient = Color3.fromRGB(4, 5, 12)
    u4.FogColor = Color3.new(0, 0, 0)
    a2(function() -- Line: 117 -- upvalues: u3 (val), Lighting (upval), u4 (val)
        for i, j in u3 do
            if Lighting[i] == u4[i] then
                Lighting[i] = j
            end
        end
    end)
    for i, j in u4 do
        u3[i] = Lighting[i]
        Lighting[i] = j
    end
    local u33 = {}
    local u40 = Lighting.ChildAdded:Connect(function(a1) -- Line: 132 -- upvalues: u33 (val)
        if a1:IsA("Atmosphere") and not u33[a1] then
            u33[a1] = true
            a1.Parent = nil
        end
    end)
    a2(function() -- Line: 139 -- upvalues: u40 (val), u33 (val), Lighting (upval)
        u40:Disconnect()
        for i in u33 do
            pcall(function() -- Line: 142 -- upvalues: i (val), Lighting (upval)
                i.Parent = Lighting
            end)
        end
    end)
    for k, n in Lighting:GetChildren() do
        if n:IsA("Atmosphere") and not u33[n] then
            u33[n] = true
            n.Parent = nil
        end
    end
    local u58 = {}
    u58.FogStart = Lighting.FogStart
    u58.FogEnd = Lighting.FogEnd
    local u63 = {}
    a2(function() -- Line: 152 -- upvalues: u58 (val), Lighting (upval), u63 (val)
        for i, j in u58 do
            if Lighting[i] == u63[i] then
                Lighting[i] = j
            end
        end
    end)
    local v3 = Color3.new(1, 1, 1)
    local u76 = Instance.new("Part")
    u76.Name = "PlayerLight"
    u76.Shape = Enum.PartType.Ball
    u76.Anchored = true
    u76.CanCollide = false
    u76.CanTouch = false
    u76.CanQuery = false
    u76.CastShadow = false
    u76.Material = Enum.Material.Neon
    u76.Color = v3
    u76.Size = Vector3.new(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
    u76.Parent = a3
    u76.Transparency = 1
    local PointLight = Instance.new("PointLight")
    PointLight.Color = Color3.fromRGB(176, 150, 255)
    PointLight.Range = 22
    PointLight.Brightness = 2
    PointLight.Shadows = true
    PointLight.Parent = u76
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "LiveEventBlackout"
    ScreenGui.DisplayOrder = -1001
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ResetOnSpawn = false
    ScreenGui.ScreenInsets = Enum.ScreenInsets.None
    a2(function() -- Line: 178 -- upvalues: ScreenGui (val)
        ScreenGui:Destroy()
    end)
    local u110 = {}
    local v4 = 0
    for m = 1, 16 do
        v1 = m / 16
        v2 = v1 * 0.97 * v1 * (3 - v1 * 2)
        Frame = Instance.new("Frame")
        Frame.AnchorPoint = Vector2.new(0.5, 0.5)
        Frame.BackgroundTransparency = 1
        UICorner = Instance.new("UICorner")
        UICorner.CornerRadius = UDim.new(0.5, 0)
        UICorner.Parent = Frame
        UIStroke = Instance.new("UIStroke")
        UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        UIStroke.Color = Color3.new(0, 0, 0)
        UIStroke.Thickness = 4096
        UIStroke.Transparency = (1 - v2) / (1 - v4)
        UIStroke.Parent = Frame
        Frame.Parent = ScreenGui
        table.insert(u110, Frame)
    end
    ScreenGui.Parent = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
    return function() -- Line: 204
        -- upvalues: Players (upval), PointLight (val), u76 (val), Lighting (upval), u63 (val), u110 (val)
        local v1
        local Character = Players.LocalPlayer.Character
        local PrimaryPart = Character and Character.PrimaryPart
        local CurrentCamera = workspace.CurrentCamera
        PointLight.Enabled = PrimaryPart ~= nil
        if PrimaryPart then
            local v2 = CurrentCamera.CFrame.Position - PrimaryPart.Position
            u76.Position = PrimaryPart.Position + (if not (0 < v2.Magnitude) then Vector3.new(0, 0, 0) else v2.Unit) * 4 + Vector3.new(0, 3, 0)
        end
        local Position = if not PrimaryPart then CurrentCamera.Focus.Position else PrimaryPart.Position
        local Magnitude = (CurrentCamera.CFrame.Position - Position).Magnitude
        Lighting.FogStart = Magnitude + 8
        Lighting.FogEnd = Magnitude + 28
        u63.FogStart = Lighting.FogStart
        u63.FogEnd = Lighting.FogEnd
        local ViewportSize = CurrentCamera.ViewportSize
        local v3 = ViewportSize / 2
        local Magnitude_2 = math.min(ViewportSize.X, ViewportSize.Y) * 0.2
        if PrimaryPart then
            local v4 = CurrentCamera:WorldToViewportPoint(PrimaryPart.Position)
            if 0 < v4.Z then
                local v5 = CurrentCamera:WorldToViewportPoint(PrimaryPart.Position + CurrentCamera.CFrame.RightVector * 18)
                v3 = Vector2.new(v4.X, v4.Y)
                Magnitude_2 = (Vector2.new(v5.X, v5.Y) - v3).Magnitude
            end
        end
        local v6 = math.min(Magnitude_2, (math.min(ViewportSize.X, ViewportSize.Y)) * 0.45)
        for i, j in u110 do
            v1 = v6 * 2 * (0.55 + 0.44999999999999996 * (i - 1) / 15)
            j.Position = UDim2.fromOffset(v3.X, v3.Y)
            j.Size = UDim2.fromOffset(v1, v1)
        end
    end
end

u43[EffectKinds.BlackHole] = (require(script.Parent.LiveEventVisuals.BlackHole))
u43[EffectKinds.Explosion] = (require(script.Parent.LiveEventVisuals.Explosion))
u43[EffectKinds.Gubby] = (require(script.Parent.LiveEventVisuals.Gubby))

u43[EffectKinds.TowerRain] = function(a1, a2, a3) -- Line: 253
    local Attachment, Attachment_2, Trail, v1, v2
    local u3 = {}
    for i, j in a1.data.drops do
        v1 = Color3.fromRGB(255, 176, 72)
        v2 = Instance.new("Part")
        v2.Name = "TowerComet"
        v2.Shape = Enum.PartType.Ball
        v2.Anchored = true
        v2.CanCollide = false
        v2.CanTouch = false
        v2.CanQuery = false
        v2.CastShadow = false
        v2.Material = Enum.Material.Neon
        v2.Color = v1
        v2.Size = Vector3.new(3, 3, 3)
        v2.Parent = a3
        Attachment = Instance.new("Attachment")
        Attachment.Position = Vector3.new(-1, 0, 0)
        Attachment.Parent = v2
        Attachment_2 = Instance.new("Attachment")
        Attachment_2.Position = Vector3.new(1, 0, 0)
        Attachment_2.Parent = v2
        Trail = Instance.new("Trail")
        Trail.Attachment0 = Attachment
        Trail.Attachment1 = Attachment_2
        Trail.Color = ColorSequence.new(Color3.fromRGB(255, 240, 177), Color3.fromRGB(255, 97, 43))
        Trail.Transparency = NumberSequence.new(0.2, 1)
        Trail.Lifetime = 0.45
        Trail.FaceCamera = true
        Trail.Parent = v2
        table.insert(u3, {part = v2, trail = Trail, data = j})
    end
    return function(a1) -- Line: 273 -- upvalues: u3 (val)
        local data, position, v1, v2, v3, v4
        local v5 = nil
        local v6 = nil
        local v7 = a1
        for i, j in u3, v5, v6 do
            data = j.data
            v2 = math.clamp((v7 - data.delay) / data.duration, 0, 1)
            v3 = false
            if data.delay <= v7 then
                v3 = v2 < 1
            end
            v1 = if not v3 then 1 else 0.35
            j.part.Transparency = v1
            j.trail.Enabled = v3
            position = data.position
            v4 = Vector3.new(position.x, position.y, position.z)
            j.part.Position = (v4 + Vector3.new(-15, 65, 0)):Lerp(v4, v2 * v2)
        end
    end
end

u33.Kinds = {}
for i in u36 do
    u33.Kinds[i] = true
end
for j in u43 do
    u33.Kinds[j] = true
end
table.freeze(u33.Kinds)
local u93 = {}

function u33.start(a1) -- Line: 302 -- upvalues: u33 (val), u93 (val), u36 (val), u43 (val), RunService (val)
    local u1 = {}
    local u2 = false

    local function own(a1) -- Line: 305 -- upvalues: u1 (val)
        table.insert(u1, a1)
    end

    local function cleanup() -- Line: 308 -- upvalues: u2 (ref), u1 (val)
        local result, success
        if u2 then
            return
        end
        u2 = true
        for i = #u1, 1, -1 do
            success, result = pcall(u1[i])
            if not success then
                warn((("Live event presentation cleanup failed: %*"):format(result)))
            end
        end
    end

    if a1.expiresAt and a1.expiresAt <= (workspace:GetServerTimeNow()) then
        return cleanup
    end
    if not u33.Kinds[a1.kind] then
        if not u93[a1.kind] then
            u93[a1.kind] = true
            warn((("Live event effect \"%*\" has no renderer in LiveEventPresentation."):format(a1.kind)))
        end
        cleanup()
        return cleanup
    end
    local success, result = xpcall(function() -- Line: 333
        -- upvalues: u36 (upval), a1 (val), own (val), u2 (ref), u1 (val), u43 (upval), RunService (upval)
        -- upvalues: cleanup (val)
        local v1 = u36[a1.kind]
        if v1 then
            v1(a1, own, function() -- Line: 336 -- upvalues: u2 (upval)
                return u2
            end)
            return
        end
        local Folder = Instance.new("Folder")
        Folder.Name = ("LiveEvent_%*"):format(a1.id)
        Folder.Parent = workspace
        table.insert(u1, function() -- Line: 344 -- upvalues: Folder (val)
            Folder:Destroy()
        end)
        local u31 = u43[a1.kind](a1, own, Folder)
        local u37 = RunService.RenderStepped:Connect(function() -- Line: 349 -- upvalues: u2 (upval), a1 (upval), cleanup (upval), u31 (val)
            if u2 then
                return
            end
            local ServerTimeNow = workspace:GetServerTimeNow()
            if a1.expiresAt and a1.expiresAt <= ServerTimeNow then
                cleanup()
                return
            end
            u31((math.max(0, ServerTimeNow - a1.startsAt)))
        end)
        table.insert(u1, function() -- Line: 360 -- upvalues: u37 (val)
            u37:Disconnect()
        end)
        u31((math.max(0, (workspace:GetServerTimeNow()) - a1.startsAt)))
    end, debug.traceback)
    if not success then
        cleanup()
        error(result, 0)
    end
    return cleanup
end

return u33