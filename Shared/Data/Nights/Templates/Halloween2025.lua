-- Script path: ReplicatedStorage.Shared.Data.Nights.Templates.Halloween2025
-- Decompile time: 14.92 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Parent_2 = script.Parent.Parent
local CatRom = require(ReplicatedStorage.Shared.Modules.CatRom)
local EmitterManager = require(ReplicatedStorage.Shared.Modules.EmitterManager)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local Timezone = require(ReplicatedStorage.Shared.Data.Events.Timezone)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u71 = nil
local Types = require(Parent_2.Types)
if RunService:IsClient() then
    u71 = require(ReplicatedStorage.Client.Modules.Shaker)
end

local function gateAnimation(a1) -- Line: 22
    -- upvalues: TweenService (val), CatRom (val), EmitterManager (val), u71 (ref), Lighting (val)
    local Pivot = a1.LeftDoor:GetPivot()
    local Pivot_2 = a1.RightDoor:GetPivot()
    local NumberValue = Instance.new("NumberValue")
    local NumberValue_2 = Instance.new("NumberValue")
    local Key = a1.Key
    local Lock = a1.Lock
    local NumberValue_3 = Instance.new("NumberValue")
    local NumberValue_4 = Instance.new("NumberValue")
    for i, j in Key:GetDescendants() do
        if j:IsA("Trail") then
            j.Enabled = false
        end
    end
    local u46 = task.spawn(function() -- Line: 41
        -- upvalues: a1 (val), Key (val), TweenService (upval), CatRom (upval), NumberValue_3 (val)
        -- upvalues: EmitterManager (upval), NumberValue_4 (val), NumberValue (val), NumberValue_2 (val), Lock (val)
        -- upvalues: u71 (upval), Lighting (upval), Pivot (val), Pivot_2 (val)
        a1.Sounds.DoorOpen:Play()
        task.delay(0.01, function() -- Line: 44 -- upvalues: Key (upval)
            for i, j in Key:GetDescendants() do
                if j:IsA("Trail") then
                    j.Enabled = true
                end
            end
        end)
        local v1 = {
            Key.CFrame * CFrame.new(0, 12, -5.7) * CFrame.Angles(1.2217304763960306, 0, 1.5707963267948966),
            Key.CFrame * CFrame.new(0, 6, -14) * CFrame.Angles(1.2217304763960306, 0, 0),
            Key.CFrame * CFrame.new(0, -2, -10) * CFrame.Angles(-0.3490658503988659, 0, -3.141592653589793),
            Key.CFrame * CFrame.new(0, -1, -4) * CFrame.Angles(-0.3490658503988659, 0, 6.283185307179586),
            Key.CFrame * CFrame.new(0, 0, 0.1) * CFrame.Angles(0.03490658503988659, 0, 6.283185307179586),
            Key.CFrame * CFrame.new(0, 0, 2),
            Key.CFrame * CFrame.new(0, 0, 3.6),
            Key.CFrame * CFrame.new(0, 0, 3.63),
        }
        TweenService:Create(Key, TweenInfo.new(0.85), {Transparency = 0}):Play()
        local u120 = CatRom.new(v1)
        TweenService:Create(NumberValue_3, TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {Value = 0.93}):Play()
        task.delay(1.9, function() -- Line: 74 -- upvalues: Key (upval)
            for i, j in Key:GetDescendants() do
                if j:IsA("Trail") then
                    j.Enabled = false
                end
            end
        end)
        task.delay(2.1, function() -- Line: 82 -- upvalues: TweenService (upval), NumberValue_3 (upval), a1 (upval), EmitterManager (upval)
            TweenService:Create(NumberValue_3, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Value = 0.9}):Play()
            task.wait(0.4)
            TweenService:Create(NumberValue_3, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Value = 1}):Play()
            task.wait(0.13)
            TweenService:Create(a1.Light.PointLight, TweenInfo.new(0.1), {Brightness = 6}):Play()
            task.delay(0.1, function() -- Line: 108 -- upvalues: TweenService (upval), a1 (upval)
                TweenService:Create(
                    a1.Light.PointLight,
                    TweenInfo.new(3, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
            EmitterManager.manualEmit(a1.Sparkles)
        end)
        local u143 = false
        task.delay(3, function() -- Line: 121
            -- upvalues: TweenService (upval), NumberValue_4 (upval), u143 (ref), a1 (upval), EmitterManager (upval)
            -- upvalues: NumberValue (upval), NumberValue_2 (upval), Key (upval), Lock (upval), u71 (upval)
            -- upvalues: Lighting (upval)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 30}):Play()
            task.wait(0.1)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 20}):Play()
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 30}):Play()
            task.wait(0.1)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 20}):Play()
            task.wait(0.1)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 30}):Play()
            task.wait(0.1)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.05, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Value = 20}):Play()
            task.wait(0.6)
            TweenService:Create(NumberValue_4, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Value = 90}):Play()
            task.wait(0.23)
            u143 = true
            for i, j in a1.Portal:GetDescendants() do
                pcall(function() -- Line: 180 -- upvalues: j (val)
                    j.Enabled = true
                end)
            end
            EmitterManager.manualEmit(a1.Portal.RotPart3)
            TweenService:Create(a1.Light2.PointLight, TweenInfo.new(0.1), {Brightness = 6}):Play()
            task.delay(0.1, function() -- Line: 189 -- upvalues: TweenService (upval), a1 (upval)
                TweenService:Create(
                    a1.Light2.PointLight,
                    TweenInfo.new(5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {Brightness = 0}
                ):Play()
            end)
            TweenService:Create(NumberValue, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Value = 105}):Play()
            task.delay(0.01, function() -- Line: 202 -- upvalues: TweenService (upval), NumberValue_2 (upval)
                TweenService:Create(NumberValue_2, TweenInfo.new(2.8, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Value = 123}):Play()
            end)
            local v1 = Key
            local v2 = Lock
            local u177 = v1:Clone()
            local u180 = v2:Clone()
            u177.Parent = v1.Parent
            u180.Parent = v2.Parent
            v1:Destroy()
            v2:Destroy()
            u177.Anchored = false
            u180.Anchored = false
            task.defer(function() -- Line: 223 -- upvalues: u180 (val)
                u180.CanCollide = true
            end)
            u180:ApplyImpulse(u177.CFrame.LookVector * 60 + Vector3.new(0, 20, 0))
            u177:ApplyImpulse(u177.CFrame.LookVector * 60 + Vector3.new(0, 20, 0))
            u177:ApplyAngularImpulse(u177.CFrame.LookVector * -10)
            u71:Shake({1, 10, 0.01, 1}, 0.2, 0.5)
            a1.Portal.PartEffect.Linked:SetAttribute("Disabled", false)
            TweenService:Create(
                Lighting,
                TweenInfo.new(0.02, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                {ExposureCompensation = 3}
            ):Play()
            task.delay(0.02, function() -- Line: 243 -- upvalues: TweenService (upval), Lighting (upval)
                TweenService:Create(
                    Lighting,
                    TweenInfo.new(4, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
                    {ExposureCompensation = 0}
                ):Play()
            end)
            a1.Sounds.Hum.Volume = 0.01
            a1.Sounds.Hum.PlaybackSpeed = 0
            TweenService:Create(
                a1.Sounds.Hum,
                TweenInfo.new(4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                {PlaybackSpeed = 1, Volume = 0.16}
            ):Play()
            a1.Sounds.Hum:Play()
            task.delay(0.5, function() -- Line: 265 -- upvalues: TweenService (upval), u180 (val), u177 (val)
                TweenService:Create(u180, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
                TweenService:Create(u177, TweenInfo.new(2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {Transparency = 1}):Play()
            end)
        end)

        local function u() -- Line: 279
            -- upvalues: a1 (upval), Pivot (upval), NumberValue (upval), Pivot_2 (upval), NumberValue_2 (upval)
            -- upvalues: u143 (ref), Key (upval), u120 (val), NumberValue_3 (upval), NumberValue_4 (upval)
            a1.LeftDoor:PivotTo(Pivot * (CFrame.Angles(0, 0, -(math.rad(NumberValue.Value)))))
            a1.RightDoor:PivotTo(Pivot_2 * (CFrame.Angles(0, 0, (math.rad(NumberValue_2.Value)))))
            if u143 then
                return
            end
            Key.CFrame = (u120:SolveRotCFrame(NumberValue_3.Value)) * CFrame.Angles(0, 0, (math.rad(NumberValue_4.Value)))
        end

        u()
        NumberValue_3.Changed:Connect(u)
        NumberValue_4.Changed:Connect(u)
        NumberValue.Changed:Connect(u)
        NumberValue_2.Changed:Connect(u)
    end)
    return function() -- Line: 301
        -- upvalues: NumberValue (val), NumberValue_2 (val), NumberValue_3 (val), NumberValue_4 (val), a1 (val)
        -- upvalues: u46 (val)
        NumberValue:Destroy()
        NumberValue_2:Destroy()
        NumberValue_3:Destroy()
        NumberValue_4:Destroy()
        a1:Destroy()
        task.cancel(u46)
    end
end

local function removeSection(a1) -- Line: 311 -- upvalues: Maid (val), TweenService (val)
    local CFrame, v1, v2
    local u91 = {}
    local u96 = Maid.new()
    u96:Mark((a1.DescendantAdded:Connect(function(a1) -- Line: 315 -- upvalues: u91 (val)
        if a1:IsA("SurfaceGui") then
            u91[a1] = {a1.Enabled}
            a1.Enabled = false
        end
        if a1:IsA("BasePart") and a1.Parent.Name ~= "Character" then
            u91[a1] = {a1.Transparency, a1.CanCollide, a1.CFrame}
            a1.Transparency = 1
            a1.CanCollide = false
            a1.CFrame = a1.CFrame + Vector3.new(0, Random.new():NextNumber(-50, -70), 0)
        end
        if a1:IsA("ParticleEmitter") then
            u91[a1] = {a1.Enabled}
            a1.Enabled = false
        end
        if a1:IsA("Light") then
            u91[a1] = {a1.Enabled}
            a1.Enabled = false
        end
    end)))
    for i, j in a1:GetDescendants() do
        if j:IsA("SurfaceGui") then
            v2 = {j.Enabled}
            u91[j] = v2
            j.Enabled = false
        end
        if j:IsA("BasePart") and j.Parent.Name == "Character" then
            v2 = {j.Transparency, j.CanCollide, j.CFrame}
            u91[j] = v2
            j.Transparency = 1
        end
        if j:IsA("BasePart") and j.Parent.Name ~= "Character" then
            v2 = {j.Transparency, j.CanCollide, j.CFrame}
            u91[j] = v2
            j.Transparency = 1
            j.CanCollide = false
            CFrame = j.CFrame
            v1 = Random.new():NextNumber(-50, -70)
            j.CFrame = CFrame + Vector3.new(0, v1, 0)
        end
        if j:IsA("ParticleEmitter") then
            v2 = {j.Enabled}
            u91[j] = v2
            j.Enabled = false
        end
        if j:IsA("Light") then
            v2 = {j.Enabled}
            u91[j] = v2
            j.Enabled = false
        end
    end
    return function() -- Line: 363 -- upvalues: u96 (val), u91 (val), TweenService (upval)
        u96:Sweep()
        local v1 = nil
        local v2 = nil
        for i, j in u91, v1, v2 do
            if i:IsA("SurfaceGui") then
                task.delay(1, function() -- Line: 367 -- upvalues: i (val), j (val)
                    i.Enabled = j[1]
                end)
            end
            if i:IsA("BasePart") then
                task.delay(Random.new():NextNumber(0.01, 0.1), function() -- Line: 372 -- upvalues: TweenService (upval), i (val), j (val)
                    TweenService:Create(i, TweenInfo.new(6, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {CFrame = j[3]}):Play()
                    TweenService:Create(
                        i,
                        TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In),
                        {Transparency = j[1], CanCollide = j[2]}
                    ):Play()
                end)
            elseif i:IsA("ParticleEmitter") or i:IsA("Light") then
                task.delay(1, function() -- Line: 391 -- upvalues: i (val), j (val)
                    i.Enabled = j[1]
                end)
            end
        end
    end
end

local function getTime(a1) -- Line: 399 -- upvalues: SharedGameConstants (val), Timezone (val) -- types: a1: userdata
    if not SharedGameConstants.IS_PROD then
        a1 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
    end
    return Timezone("EST")(a1)
end

local v1 = {name = "Halloween2025"}
local v2 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v2 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v1.startsAt = Timezone("EST")(v2)
v1.endsAt = Timezone("EST")(DateTime.fromUniversalTime(2025, 11, 26, 15, 0))
local v3 = {}
v2 = {map = "Outpost 16"}
local v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[1] = v2
v2 = {map = "Banlands"}
v4 = DateTime.fromUniversalTime(2025, 10, 25, 17, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[2] = v2
v2 = {map = "Blind Faith"}
v4 = DateTime.fromUniversalTime(2025, 10, 31, 20, 0)
if not SharedGameConstants.IS_PROD then
    v4 = DateTime.fromUniversalTime(2025, 10, 18, 17, 0)
end
v2.startsAt = Timezone("EST")(v4)
v3[3] = v2
v1.nights = v3

function v1.init(a1) -- Line: 430
    -- upvalues: removeSection (val), RunService (val), Players (val), ReplicatedStorage (val), TweenService (val)
    -- upvalues: spr (val)
    local RotPart3, v1, v2
    local u1 = {}
    a1._unlock = removeSection(a1.Model.Parent[("Night%*Area"):format(a1.Night)])
    local Model = a1.Model
    for i, j in Model.Portal:GetDescendants() do
        RotPart3 = Model.Portal.RotPart3
        if not j:IsDescendantOf(RotPart3) then
            pcall(function() -- Line: 441 -- upvalues: j (val)
                j.Enabled = false
            end)
        end
    end
    local SurfaceGui = a1.Model.Timer.SurfaceGui
    RunService.Heartbeat:Connect(function(a1) -- Line: 447 -- upvalues: SurfaceGui (val), u1 (val)
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
    local v3 = "PLAY NIGHT " .. (tostring(a1.Night - 1)) .. " TO UNLOCK"
    for k = 1, (string.len(v3)) do
        v2 = string.sub(v3, k, k)
        v1 = ReplicatedStorage.EventLabelTemplate:Clone()
        for n, m in v1:GetChildren() do
            if m:IsA("TextLabel") then
                m.Text = v2
            end
        end
        v1.Parent = SurfaceGui.Frame
        v1.LayoutOrder = k
        v1.Visible = false
    end
    for i5 = 1, 4 do
        v2 = string.sub("LIVE", i5, i5)
        v1 = ReplicatedStorage.EventLabelTemplate2:Clone()
        v1.Name = "LIVE_TEXT"
        for i6, i7 in v1:GetChildren() do
            if i7:IsA("TextLabel") then
                i7.Text = v2
            end
        end
        v1.Parent = SurfaceGui.Frame
        v1.LayoutOrder = i5
        v1.Visible = false
    end

    function a1:_updateTimer(a2, a3) -- Line: 503
        -- upvalues: Nights (val), Model (val), SurfaceGui (val), TweenService (upval), spr (upval)
        local _active
        local Night = self.Night
        local v1 = (Nights:GetAttribute("Halloween2025") or 1) < Night
        Model.Locked.SurfaceGui.Enabled = v1
        local v2, v3, v4 = a2, a3, self
        for i, j in SurfaceGui.Frame:GetChildren() do
            if j.Name == "LIVE_TEXT" then
                _active = v4._active and not v1
                j.Visible = _active
            elseif not j:IsA("Frame") or j.Name == "EventLabelTemplate" then
                if j.Name == "EventLabelTemplate" then
                    j.Visible = v1
                end
            elseif v3 ~= 0 then
                if not v4._active then
                    j.Visible = not v1
                else
                    j.Visible = false
                end
            elseif not string.find(j.Name:lower(), "seconds") then
                j.Visible = false
            elseif not v4._active then
                j.Visible = not v1
            else
                j.Visible = false
            end
        end
        SurfaceGui.Frame.UIListLayout.Padding = UDim.new(0, if not v1 then 12 else 0)
        local v5 = SurfaceGui.Frame:FindFirstChild(v2 or "")
        if v5 then
            for k, n in v5:GetChildren() do
                if n:IsA("TextLabel") then
                    n.Text = string.format("%02d", v3)
                    if n:FindFirstChild("UIScale") then
                        if n.Name == "GradientText" then
                            TweenService:Create(
                                n.UIGradient,
                                TweenInfo.new(0.98, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
                                {Offset = Vector2.new(1, 0)}
                            ):Play()
                            task.delay(0.981, function() -- Line: 550 -- upvalues: n (val)
                                n.UIGradient.Offset = Vector2.new(-1, 0)
                            end)
                        end
                        spr.target(n.UIScale, 0.65, 4, {Scale = 1.2})
                        task.delay(0.1, function() -- Line: 556 -- upvalues: spr (upval), n (val)
                            spr.target(n.UIScale, 0.65, 2, {Scale = 1})
                        end)
                    end
                end
            end
        end
    end

    Nights.AttributeChanged:Connect(function() -- Line: 565 -- upvalues: a1 (val)
        a1:_updateTimer()
    end)
end

function v1.intro(a1) end

function v1.unlock(a1) -- Line: 572 -- upvalues: gateAnimation (val)
    local Model = a1.Model
    a1._unlock()
    gateAnimation(Model)
end

function v1.countDown(a1, a2) -- Line: 580 -- types: a2: number
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