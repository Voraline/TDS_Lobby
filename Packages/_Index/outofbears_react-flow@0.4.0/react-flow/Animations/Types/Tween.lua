-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Animations.Types.Tween
-- Decompile time: 3.88 ms

local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Base = require(script.Parent.Parent.Base)
local Promise = require(script.Parent.Parent.Parent.Promise)
local LinearValue = require(script.Parent.Parent.Parent.Utility.LinearValue)
local Symbols = require(script.Parent.Parent.Symbols)
local u37 = {}
u37.__index = u37
local u38 = {}
local u39 = nil

local function pooledUpdate(a1) -- Line: 26 -- upvalues: u38 (val), u39 (ref), RunService (val) -- types: a1: function
    u38[a1] = true
    if not u39 then
        u39 = RunService.RenderStepped:Connect(function(a1) -- Line: 30 -- upvalues: u38 (upval), u39 (upval)
            local v1 = false
            for i in u38 do
                v1 = true
                i(a1)
            end
            if not v1 and u39 then
                u39:Disconnect()
                u39 = nil
            end
        end)
    end
    return function() -- Line: 45 -- upvalues: u38 (upval), a1 (val), u39 (upval)
        u38[a1] = nil
        if next(u38) == nil and u39 then
            u39:Disconnect()
            u39 = nil
        end
    end
end

local function playTween(a1, a2, a3) -- Line: 54 -- upvalues: TweenService (val) -- types: a2: function, a3: function
    local NumberValue = Instance.new("NumberValue")
    NumberValue.Value = 0
    ;(NumberValue:GetPropertyChangedSignal("Value")):Connect(function() -- Line: 57 -- upvalues: a2 (val), NumberValue (val)
        a2(NumberValue.Value)
    end)
    local u21 = TweenService:Create(NumberValue, a1, {Value = 1})
    u21.Completed:Once(function() -- Line: 65 -- upvalues: NumberValue (val), a3 (val)
        NumberValue:Destroy()
        a3()
    end)
    return function() -- Line: 70 -- upvalues: a2 (val), u21 (val)
        a2(0)
        u21:Play()
    end, function() -- Line: 73 -- upvalues: NumberValue (val), u21 (val)
        NumberValue:Destroy()
        u21:Cancel()
    end
end

local function playTween2(a1, a2, a3) -- Line: 79
    -- upvalues: pooledUpdate (val), TweenService (val)
    local u3 = nil
    local u4 = 0
    local u5 = 0
    local Time = a1.Time
    local DelayTime = a1.DelayTime
    local RepeatCount = a1.RepeatCount
    local Reverses = a1.Reverses
    local EasingStyle = a1.EasingStyle
    local EasingDirection = a1.EasingDirection
    assert(Reverses == false, "Tween reverses is not supported")
    return function() -- Line: 103
        -- upvalues: u5 (ref), u4 (ref), DelayTime (val), u3 (ref), pooledUpdate (upval), Time (val)
        -- upvalues: TweenService (upval), EasingStyle (val), EasingDirection (val), a2 (val), RepeatCount (val)
        -- upvalues: a3 (val)
        u5 = 0
        u4 = 0
        if DelayTime and DelayTime > 0 then
            u5 = -DelayTime
        end
        if not u3 then
            u3 = pooledUpdate(function(a1) -- Line: 112
                -- upvalues: u5 (upval), Time (upval), TweenService (upval), EasingStyle (upval)
                -- upvalues: EasingDirection (upval), a2 (upval), RepeatCount (upval), u4 (upval), u3 (upval)
                -- upvalues: a3 (upval)
                u5 = u5 + a1
                local v1 = math.clamp(u5 / Time, 0, 1)
                local Value = TweenService:GetValue(v1, EasingStyle, EasingDirection)
                a2(Value)
                if v1 >= 1 then
                    if RepeatCount ~= 0 and u4 < RepeatCount then
                        u4 = u4 + 1
                        u5 = 0
                        return
                    end
                    if u3 then
                        u3()
                        u3 = nil
                    end
                    a3()
                end
            end)
        end
    end, function() -- Line: 96 -- upvalues: u3 (ref)
        if u3 then
            u3()
            u3 = nil
        end
    end
end

function u37.definition(a1) -- Line: 137 -- upvalues: Symbols (val) -- types: a1: table
    return {Symbols.Tween, a1}
end

function u37.new(a1) -- Line: 144 -- upvalues: Base (val), u37 (val) -- types: a1: table
    local v1 = Base.new()
    local v2 = setmetatable(v1, u37)
    v2.props = a1
    v2.player = nil
    return v2
end

function u37:Play(a2, a3) -- Line: 153
    -- upvalues: Promise (val), LinearValue (val), playTween2 (val)
    if self.playing then
        self:Stop()
    end
    local info = self.props.info
    local startImmediate = self.props.startImmediate
    if not startImmediate then
        startImmediate = self.props.start
        if not startImmediate then
            startImmediate = a2
        end
    end
    local target = self.props.target
    local u22 = self.props.startImmediate ~= nil
    local delay = self.props.delay
    if not delay then
        assert(not u22, "Cannot start immediately without a delay")
    elseif u22 then
        assert(delay > 0, "DelayTime must be greater than zero")
    end
    assert(startImmediate, "No start value provided")
    assert(target, "No target value provided")
    assert(info, "No tween info provided")
    assert(info.RepeatCount == 0, "RepeatCount must be 0")
    assert(info.Reverses == false, "Reverses must be false")
    assert(info.DelayTime == 0, "DelayTime must be 0")
    if startImmediate == target then
        return Promise.resolve()
    end
    local u101 = LinearValue.fromValue(startImmediate)
    local u105 = LinearValue.fromValue(target)
    if a3 then
        self.listener(target)
        self.playing = false
        self.player = nil
        return Promise.resolve()
    end
    local v1 = Promise.new(function(a1, a2, a3) -- Line: 198
        -- upvalues: playTween2 (upval), info (val), u101 (val), u105 (val), self (val), delay (val), u22 (val)
        -- upvalues: startImmediate (val)
        local v1, v2 = playTween2(info, function(a1) -- Line: 199 -- upvalues: u101 (upval), u105 (upval), self (upval)
            local v1 = u101:Lerp(u105, a1):ToValue()
            self.listener(v1)
        end, function() -- Line: 202 -- upvalues: self (upval), a1 (val)
            self.playing = false
            self.player = nil
            a1()
        end)
        a3(v2)
        if not delay then
            v1()
            return
        end
        if u22 then
            self.listener(startImmediate)
        end
        task.wait(delay)
        v1()
    end)
    self.playing = true
    self.player = v1
    return v1
end

function u37:Stop() -- Line: 228
    if not self.playing then
        return
    end
    if self.player then
        self.player:cancel()
        self.player = nil
    end
    self.playing = false
end

return u37