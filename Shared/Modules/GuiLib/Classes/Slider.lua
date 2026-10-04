-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.Classes.Slider
-- Decompile time: 4.03 ms

local Parent_2 = script.Parent.Parent
local LazyLoader = require(Parent_2:WaitForChild("LazyLoader"))
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Thumbstick2 = Enum.KeyCode.Thumbstick2
local u20 = {}
u20.__index = u20
u20.__type = "Slider"

function u20.__tostring(a1) -- Line: 68 -- upvalues: u20 (val)
    return u20.__type
end

function u20.new(a1, a2) -- Line: 74 -- upvalues: u20 (val), LazyLoader (val)
    local v1 = setmetatable({}, u20)
    v1._Maid = LazyLoader.Utilities.Maid.new()
    v1._Spring = LazyLoader.Utilities.Spring.new(2, 0.1, 1, 0)
    v1._Axis = a2 and string.lower(a2) or "x"
    v1._ChangedBind = Instance.new("BindableEvent")
    v1._ClickedBind = Instance.new("BindableEvent")
    v1.Interval = 0
    v1.IsActive = true
    v1.TweenClick = true
    v1.Inverted = false
    v1.Frame = a1
    v1.Changed = v1._ChangedBind.Event
    v1.Clicked = v1._ClickedBind.Event
    v1.DragStart = nil
    v1.DragStop = nil
    init(v1)
    v1:Set(0.5)
    return v1
end

function init(self) -- Line: 102
    -- upvalues: LazyLoader (val), UserInputService (val), Thumbstick2 (val), RunService (val)
    local Frame = self.Frame
    local Slider = Frame.Slider
    local Parent = Frame.Parent
    local _Axis = self._Axis
    local _Maid = self._Maid
    local _Spring = self._Spring
    local u12 = LazyLoader.Classes.Dragger.new(Slider)
    self.DragStart = u12.DragStart
    self.DragStop = u12.DragStop
    _Maid:Mark(Frame)
    _Maid:Mark(self._ChangedBind)
    _Maid:Mark(self._ClickedBind)
    _Maid:Mark(function() -- Line: 119 -- upvalues: u12 (val)
        u12:Destroy()
    end)

    local function setUdim2(a1, a2) -- Line: 124 -- upvalues: _Axis (val)
        if _Axis == "y" then
            local v1 = a2
            a2 = a1
            a1 = v1
        end
        return UDim2.new(a1, 0, a2, 0)
    end

    local u32 = -1
    local u33 = nil
    local u34 = nil

    local function updateBounds() -- Line: 133 -- upvalues: u33 (ref), u34 (ref), self (val), u32 (ref)
        local v1, v2 = getBounds(self)
        u33 = v1
        u34 = v2
        u32 = -1
    end

    local v1, v2 = getBounds(self)
    u33 = v1
    u34 = v2
    u32 = -1
    _Maid:Mark(((Frame:GetPropertyChangedSignal("AbsoluteSize")):Connect(updateBounds)))
    _Maid:Mark(((Frame:GetPropertyChangedSignal("AbsolutePosition")):Connect(updateBounds)))
    _Maid:Mark(((Frame:GetPropertyChangedSignal("Parent")):Connect(updateBounds)))
    local u76 = 0
    local u77 = 0
    local u78 = false
    _Maid:Mark((Slider.SelectionGained:Connect(function() -- Line: 149 -- upvalues: u78 (ref)
        u78 = true
    end)))
    _Maid:Mark((Slider.SelectionLost:Connect(function() -- Line: 153 -- upvalues: u78 (ref)
        u78 = false
    end)))
    _Maid:Mark((UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 157 -- upvalues: Thumbstick2 (upval), u76 (ref), _Axis (val)
        if a2 and a1.KeyCode == Thumbstick2 then
            local Position = a1.Position
            u76 = 0.35 < (math.abs(Position[_Axis])) and math.sign(Position[_Axis]) or 0
        end
    end)))
    _Maid:Mark((u12.DragChanged:Connect(function(a1, a2, a3) -- Line: 165 -- upvalues: self (val), _Axis (val), u33 (ref), u34 (ref)
        if self.IsActive then
            self:Set((a2.Position[_Axis] - u33) / u34, self.TweenClick)
        end
    end)))
    _Maid:Mark((Frame.InputBegan:Connect(function(a1) -- Line: 172 -- upvalues: _Axis (val), u33 (ref), u34 (ref), self (val)
        if a1.UserInputType == Enum.UserInputType.MouseButton1 or a1.UserInputType == Enum.UserInputType.Touch then
            local v1 = (a1.Position[_Axis] - u33) / u34
            self._ClickedBind:Fire((math.clamp(v1, 0, 1)))
            if self.IsActive then
                self:Set(v1, self.TweenClick)
            end
        end
    end)))
    _Maid:Mark((RunService.RenderStepped:Connect(function(a1) -- Line: 186
        -- upvalues: u78 (ref), self (val), u76 (ref), u77 (ref), _Spring (val), u32 (ref), u33 (ref), u34 (ref)
        -- upvalues: Frame (val), _Axis (val), Slider (val)
        if u78 then
            local v1 = tick()
            if self.Interval <= 0 then
                self:Set((self:Get()) + u76 * 0.01 * a1 * 60)
            elseif 0.1 < v1 - u77 then
                u77 = v1
                self:Set((self:Get()) + self.Interval * u76)
            end
        end
        _Spring:Update(a1)
        local x = _Spring.x
        if x ~= u32 then
            local v2 = (u33 + x * u34 - Frame.AbsolutePosition[_Axis]) / Frame.AbsoluteSize[_Axis]
            local v3 = 0.5
            if _Axis == "y" then
                local v4 = v3
                v3 = v2
                v2 = v4
            end
            Slider.Position = UDim2.new(v2, 0, v3, 0)
            self._ChangedBind:Fire((self:Get()))
            u32 = x
        end
    end)))
end

function getBounds(self) -- Line: 209
    local Frame = self.Frame
    local Slider = Frame.Slider
    local _Axis = self._Axis
    return Frame.AbsolutePosition[_Axis] + Slider.AbsoluteSize[_Axis] / 2, Frame.AbsoluteSize[_Axis] - Slider.AbsoluteSize[_Axis]
end

function u20:Get() -- Line: 222
    local x = self._Spring.x
    if self.Inverted then
        x = 1 - x
    end
    return x
end

function u20:Set(a2, a3) -- Line: 230
    local _Spring = self._Spring
    local v1 = math.clamp(a2, 0, 1)
    if 0 < self.Interval then
        v1 = (math.floor(v1 / self.Interval + 0.5)) * self.Interval
    end
    _Spring.t = v1
    _Spring.instant = not a3
end

function u20:Destroy() -- Line: 242
    self._Maid:Sweep()
    self.Changed = nil
    self.Clicked = nil
    self.StartDrag = nil
    self.StopDrag = nil
    self.Frame = nil
end

return u20