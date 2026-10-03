-- Script path: ReplicatedStorage.Client.Modules.Replicators.ClockReplicator
-- Decompile time: 7.23 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local Shaker = require(ReplicatedStorage.Client.Modules.Shaker)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u46 = {}
local u47 = {}
local BindableEvent = Instance.new("BindableEvent")
local u51 = {}
u51.__index = u51

local function animateScale(a1, a2) -- Line: 20 -- upvalues: TweenService (val) -- types: a1: userdata, a2: number
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = a1:GetScale()
    NumberValue.Changed:Connect(function(a1_2) -- Line: 23 -- upvalues: a1 (val)
        a1:ScaleTo(a1_2)
    end)
    local v1 = TweenService:Create(NumberValue, TweenInfo.new(0.4, Enum.EasingStyle.Cubic), {Value = a2})
    v1:Play()
    v1.Completed:Connect(function() -- Line: 32 -- upvalues: NumberValue (val)
        NumberValue:Destroy()
    end)
end

local function hookAttributes(a1, a2) -- Line: 37 -- upvalues: u47 (val) -- types: a1: userdata
    for i, j in a1:GetAttributes() do
        a2[i] = j
    end
    local u20 = a1.AttributeChanged:Connect(function(a1_2) -- Line: 42 -- upvalues: a2 (val), a1 (val), u47 (upval)
        a2[a1_2] = (a1:GetAttribute(a1_2))
        u47[a2] = true
    end)
    return function() -- Line: 47 -- upvalues: u20 (ref)
        if u20 then
            u20:Disconnect()
            u20 = nil
        end
    end
end

local function fromDuration(a1) -- Line: 55 -- upvalues: math (val) -- types: a1: number
    return {
        days = math.floor(a1 / 86400),
        hours = math.floor(a1 / 3600) % 24,
        minutes = math.floor(a1 / 60) % 60,
        seconds = math.floor(a1 % 60),
    }
end

local function fromYPivot(a1, a2) -- Line: 69 -- upvalues: math (val) -- types: a1: userdata, a2: number
    local v1 = CFrame.new(a1.Position)
    local v2, v3 = a1:ToEulerAnglesXYZ()
    return v1 * CFrame.fromEulerAnglesXYZ(v2, v3, math.rad(a2))
end

function u51.GetClockFromInstance(a1) -- Line: 78 -- upvalues: u46 (val) -- types: a1: userdata
    return u46[a1]
end

function u51.WaitForClockInstance(a1) -- Line: 82
    -- upvalues: Promise (val), u46 (val), BindableEvent (val)
    return Promise.new(function(a1_2, a2, a3) -- Line: 83 -- upvalues: u46 (upval), a1 (val), BindableEvent (upval)
        local u3 = nil
        a3(function() -- Line: 86 -- upvalues: u3 (ref)
            if u3 then
                u3:Disconnect()
                u3 = nil
            end
        end)
        if u46[a1] then
            a1_2(u46[a1])
        end
        local v1 = BindableEvent.Event:Connect(function(a1_3) -- Line: 97 -- upvalues: a1 (upval), u3 (ref), a1_2 (val), u46 (upval)
            if a1_3 == a1 then
                u3:Disconnect()
                u3 = nil
                a1_2(u46[a1_3])
            end
        end)
    end)
end

function u51.Hook(a1) -- Line: 108
    -- upvalues: u51 (val), Maid (val), hookAttributes (val), u46 (val), u47 (val), BindableEvent (val)
    local CFrameValue, Transparency
    local u4 = setmetatable({}, u51)
    u4.Maid = Maid.new()
    u4.Instance = a1
    u4.Scale = a1:GetScale()
    u4.Enabled = true
    u4.Finished = false
    u4.Finishes = DateTime.fromUniversalTime(2024, 10, 23, 19).UnixTimestamp
    u4.Ticks = 0
    u4.Hands = {}
    u4.Values = {}
    u4.Parts = {}
    u4.Center = a1:WaitForChild("Center")
    u4.Counterdown = a1:WaitForChild("Countdown")
    u4.Smoke = u4.Counterdown:WaitForChild("Smoke")
    u4.UIContainer = u4.Counterdown:WaitForChild("SurfaceGui")
    u4.UICounter = u4.UIContainer:WaitForChild("Counter")
    u4.Maid:Mark((hookAttributes(a1, u4)))
    for i, j in {"Hours", "Minutes", "Seconds"} do
        local u111 = a1:WaitForChild(j)
        CFrameValue = Instance.new("CFrameValue")
        u4.Hands[j] = u111
        u4.Values[j] = CFrameValue
        u111.PivotOffset = u111.CFrame:ToObjectSpace(u4.Center.CFrame)
        CFrameValue.Value = u111:GetPivot()
        CFrameValue:SetAttribute("BasePivot", CFrameValue.Value)
        CFrameValue.Changed:Connect(function(a1) -- Line: 150 -- upvalues: u111 (val)
            u111:PivotTo(a1)
        end)
    end
    for k, n in u4.Instance:GetDescendants() do
        if n:IsA("BasePart") then
            Transparency = n.Transparency
            n:SetAttribute("Transparency", Transparency)
            n.CanCollide = false
            n.CanTouch = false
            n.CanQuery = false
            u4.Parts[n] = true
        end
    end
    u46[a1] = u4
    u47[u4] = true
    BindableEvent:Fire(a1)
    return function() -- Line: 172 -- upvalues: u47 (upval), u4 (val), u46 (upval), a1 (val)
        u47[u4] = nil
        u46[a1] = nil
        table.clear(u4.Hands)
        table.clear(u4.Values)
        table.clear(u4.Parts)
        u4.Maid:Sweep()
    end
end

function u51:Toggle(a2, a3) -- Line: 184
    -- upvalues: animateScale (val), TweenService (val), Shaker (val)
    local v1, v2, v3, v4
    self.UIContainer.Enabled = a2
    self.Smoke.Enabled = a2
    if not a2 then
        self.Smoke:Clear()
    end
    if not a3 then
        local Attribute_2
        self.Instance:ScaleTo(a2 and self.Scale or self.Scale * 1.2)
        v3 = nil
        v4 = nil
        for i in self.Parts, v3, v4 do
            Attribute_2 = a2 and i:GetAttribute("Transparency") or 1
            i.Transparency = Attribute_2
        end
        return
    end
    animateScale(self.Instance, a2 and self.Scale or self.Scale * 1.2)
    local Parts = self.Parts
    v3 = nil
    v4 = nil
    local v5, v6 = self, a2
    for j in Parts, v3, v4 do
        v1 = TweenInfo.new(0.4, Enum.EasingStyle.Cubic)
        v2 = {Transparency = v6 and j:GetAttribute("Transparency") or 1}
        TweenService:Create(j, v1, v2):Play()
    end
    if workspace.CurrentCamera then
        local CFrame = workspace.CurrentCamera.CFrame
        if 50 < (CFrame.LookVector:Dot(v5.Center.Position - CFrame.Position)) then
            Shaker:Shake({1.5, 20, 0.1, 1}, 0.2, 0.5)
        end
        if v5.Center:FindFirstChild("Complete") then
            v5.Center.Complete:Play()
            return
        end
    end
end

function u51:Step(a2) -- Line: 222
    -- upvalues: fromDuration (val), spr (val), math (val)
    local Finished = self.Finished
    self.Finished = (self.Finishes or 0) < a2
    local Finished_2 = true
    if self.Enabled == true then
        Finished_2 = self.Finished
    end
    if self._lastState ~= Finished_2 then
        self._lastState = Finished_2
        self:Toggle(not Finished_2, not Finished and self.Finished)
    end
    if Finished_2 then
        return false
    end
    local v1 = (self.Finishes or 0) - a2
    local v2 = fromDuration(tick())
    local v3 = fromDuration(v1)
    if self._lastTime ~= v1 then
        local v4
        self._lastTime = v1
        if self.Instance.Base:FindFirstChild("Tick") then
            local Tick = self.Instance.Base:FindFirstChild("Tick")
            if Tick then
                v4 = Tick:Clone()
                v4.Name = "TickSound"
                v4.Parent = self.Instance.Base
                v4.PlaybackSpeed = if self.Ticks % 2 ~= 0 then 1 else 0.6
                v4:Play()
                game.Debris:AddItem(v4, v4.TimeLength or 2)
            end
        end
        self.Ticks = self.Ticks + 1
        local target = spr.target
        local Hours = self.Values.Hours
        local v5 = {}
        local Attribute = self.Values.Hours:GetAttribute("BasePivot")
        local v6 = math.map(v2.hours % 12, 0, 12, 0, 360)
        local v7 = CFrame.new(Attribute.Position)
        local v8, v9 = Attribute:ToEulerAnglesXYZ()
        v5.Value = v7 * CFrame.fromEulerAnglesXYZ(v8, v9, math.rad(v6))
        target(Hours, 0.6, 4, v5)
        local target_2 = spr.target
        local Minutes = self.Values.Minutes
        v5 = {}
        local Attribute_2 = self.Values.Minutes:GetAttribute("BasePivot")
        v6 = math.map(v2.minutes, 0, 60, 0, 360)
        v7 = CFrame.new(Attribute_2.Position)
        v8, v9 = Attribute_2:ToEulerAnglesXYZ()
        v5.Value = v7 * CFrame.fromEulerAnglesXYZ(v8, v9, math.rad(v6))
        target_2(Minutes, 0.6, 4, v5)
        local target_3 = spr.target
        local Seconds = self.Values.Seconds
        v5 = {}
        local Attribute_3 = self.Values.Seconds:GetAttribute("BasePivot")
        v6 = math.map(v2.seconds, 0, 60, 0, 360)
        v7 = CFrame.new(Attribute_3.Position)
        v8, v9 = Attribute_3:ToEulerAnglesXYZ()
        v5.Value = v7 * CFrame.fromEulerAnglesXYZ(v8, v9, math.rad(v6))
        target_3(Seconds, 0.6, 4, v5)
        local UICounter = self.UICounter
        v4 = if not (0 < v3.days) then string.format("%02d:%02d:%02d", v3.hours, v3.minutes, v3.seconds) else string.format("%02d:%02d:%02d:%02d", v3.days, v3.hours, v3.minutes, v3.seconds)
        UICounter.Text = v4
    end
    return true
end

RunService.Heartbeat:Connect(function(a1) -- Line: 300 -- upvalues: math (val), u47 (val)
    local v1 = math.floor(workspace:GetServerTimeNow())
    for i in u47 do
        if not i:Step(v1) then
            u47[i] = nil
        end
    end
end)
TagObserver("CLOCK", function(a1) -- Line: 310 -- upvalues: u51 (val)
    if a1:IsA("Model") then
        return u51.Hook(a1)
    end
    warn((("WARNING: Clock \"%*\" must be a model!"):format((a1:GetFullName()))))
end)
return u51