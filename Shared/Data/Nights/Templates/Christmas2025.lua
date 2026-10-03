-- Script path: ReplicatedStorage.Shared.Data.Nights.Templates.Christmas2025
-- Decompile time: 4.41 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Parent_2 = script.Parent.Parent
local Timezone = require(ReplicatedStorage.Shared.Data.Events.Timezone)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u51 = nil
local Types = require(Parent_2.Types)
if RunService:IsClient() then
    u51 = require(ReplicatedStorage.Client.Modules.Shaker)
end

local function getTime(a1) -- Line: 23 -- upvalues: Timezone (val) -- types: a1: userdata
    return Timezone("EST")(a1)
end

local v1 = {name = "Christmas2025"}
local v2 = DateTime.fromUniversalTime(2025, 12, 19, 20, 30)
v1.startsAt = Timezone("EST")(v2)
v1.endsAt = Timezone("EST")(DateTime.fromUniversalTime(2026, 1, 28, 16, 0))
local v3 = {}
v2 = {map = "The Narratorium"}
local v4 = DateTime.fromUniversalTime(2025, 12, 19, 20, 30)
v2.startsAt = Timezone("EST")(v4)
v3[1] = v2
v1.nights = v3

function v1.init(a1) -- Line: 44
    -- upvalues: RunService (val), Players (val), ReplicatedStorage (val), TweenService (val), spr (val)
    local v1, v2
    local u1 = {}
    local SurfaceGui = a1.Model.Timer.SurfaceGui
    RunService.Heartbeat:Connect(function(a1) -- Line: 48 -- upvalues: SurfaceGui (val), u1 (val)
        local fromScale, v1, v2, v3
        for i, j in SurfaceGui.Frame:GetChildren() do
            if j:IsA("Frame") then
                for k, n in j:GetChildren() do
                    if n:IsA("TextLabel") then
                        if not u1[n] then
                            u1[n] = n.Position
                        end
                        v1 = u1[n]
                        fromScale = UDim2.fromScale
                        v3 = (tick()) + j.LayoutOrder
                        n.Position = v1 + fromScale(0, math.sin(v3) / 10)
                        v2 = (tick()) + j.LayoutOrder
                        n.Rotation = math.cos(v2) * 5
                    end
                end
            end
        end
    end)
    a1.lastDay = -1
    a1.lastHour = -1
    a1.lastMinute = -1
    a1.lastSecond = -1
    local Nights = Players.LocalPlayer:WaitForChild("Nights")
    for i = 1, 4 do
        v1 = string.sub("LIVE", i, i)
        v2 = ReplicatedStorage.EventLabelTemplate2:Clone()
        v2.Name = "LIVE_TEXT"
        for j, k in v2:GetChildren() do
            if k:IsA("TextLabel") then
                k.Text = v1
            end
        end
        v2.Parent = SurfaceGui.Frame
        v2.LayoutOrder = i
        v2.Visible = false
    end

    function a1:_updateTimer(a2, a3) -- Line: 89
        -- upvalues: SurfaceGui (val), TweenService (upval), spr (upval)
        for i, j in SurfaceGui.Frame:GetChildren() do
            if j.Name == "LIVE_TEXT" then
                j.Visible = self._active
            elseif j:IsA("Frame") and j.Name ~= "EventLabelTemplate" then
                if not self._active then
                    j.Visible = true
                else
                    j.Visible = false
                end
            end
        end
        SurfaceGui.Frame.UIListLayout.Padding = UDim.new(0, 12)
        local v1 = SurfaceGui.Frame:FindFirstChild(a2 or "")
        if v1 then
            for k, n in v1:GetChildren() do
                if n:IsA("TextLabel") then
                    n.Text = string.format("%02d", a3)
                    if n:FindFirstChild("UIScale") then
                        if n.Name == "GradientText" then
                            TweenService:Create(
                                n.UIGradient,
                                TweenInfo.new(0.98, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {Offset = Vector2.new(1, 0)}
                            ):Play()
                            task.delay(0.981, function() -- Line: 128 -- upvalues: n (val)
                                n.UIGradient.Offset = Vector2.new(-1, 0)
                            end)
                        end
                        spr.target(n.UIScale, 0.65, 4, {Scale = 1.2})
                        task.delay(0.1, function() -- Line: 134 -- upvalues: spr (upval), n (val)
                            spr.target(n.UIScale, 0.65, 2, {Scale = 1})
                        end)
                    end
                end
            end
        end
    end

    Nights.AttributeChanged:Connect(function() -- Line: 143 -- upvalues: a1 (val)
        a1:_updateTimer()
    end)
end

function v1.intro(a1) end

function v1.unlock(a1) -- Line: 150 -- upvalues: u51 (ref), TweenService (val), Lighting (val)
    local Sound = Instance.new("Sound")
    Sound.SoundId = "rbxassetid://93039252123020"
    Sound.Parent = workspace
    Sound.Volume = 1.2
    if not Sound.IsLoaded then
        Sound.Loaded:Wait()
    end
    Sound:Play()
    task.wait(1)
    ;(require(a1.Model.TicketMachine.Animation)()).Event:Connect(function() -- Line: 170 -- upvalues: u51 (upval), TweenService (upval), Lighting (upval), a1 (val)
        u51:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
        TweenService:Create(
            Lighting,
            TweenInfo.new(0.02, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {ExposureCompensation = 3}
        ):Play()
        task.delay(0.02, function() -- Line: 181 -- upvalues: TweenService (upval), Lighting (upval)
            TweenService:Create(
                Lighting,
                TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {ExposureCompensation = 0}
            ):Play()
        end)
        a1.Model.TeleportorToMainArea.CanTouch = true
    end)
end

function v1.countDown(a1, a2) -- Line: 194 -- types: a2: number
    local v1 = math.floor(a2 / 86400)
    local v2 = math.floor(a2 % 86400 / 3600)
    local v3 = math.floor(a2 % 3600 / 60)
    local v4 = math.floor(a2 % 60)
    local v5 = false
    if a2 <= 0 then
        v5 = not a1.ended
    end
    a1._active = v5
    if v1 ~= a1.lastDay then
        a1.lastDay = v1
        a1:_updateTimer("Days", v1)
    end
    if v2 ~= a1.lastHour then
        a1.lastHour = v2
        a1:_updateTimer("Hours", v2)
    end
    if v3 ~= a1.lastMinute then
        a1.lastMinute = v3
        a1:_updateTimer("Minutes", v3)
    end
    if v4 ~= a1.lastSecond then
        a1.lastSecond = v4
        a1:_updateTimer("Seconds", v4)
    end
end

return (Types(v1))