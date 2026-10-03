-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useGroupAnimation
-- Decompile time: 1.64 ms

local React = require(script.Parent.Parent.React)
local useBinding = React.useBinding
local useMemo = React.useMemo
local u8 = {}
u8.__index = u8

function u8.new(a1, a2, a3) -- Line: 25 -- upvalues: u8 (val) -- types: a1: table, a2: table, a3: table
    local u6 = setmetatable({}, u8)
    u6.currentState = "Default"
    u6.animations = a1
    u6.state = a2
    u6.setters = a3
    for i, j in a1 do
        j:SetListener(function(a1, a2) -- Line: 35 -- upvalues: u6 (val), i (val)
            if u6.currentState ~= i then
                return
            end
            u6.state[a1] = a2
            u6.setters[a1](a2)
        end)
    end
    return u6
end

function u8:Play(a2, a3) -- Line: 48 -- types: self: table, a2: string, a3: boolean?
    local v1 = self.animations[a2]
    assert(v1, (("No animation found for state %*"):format(a2)))
    self.currentState = a2
    if self.currentAnimation then
        self.currentAnimation:Stop()
    end
    self.currentAnimation = v1
    v1:Play(self.state, a3)
end

function u8:Stop() -- Line: 62
    if self.currentAnimation then
        self.currentAnimation:Stop()
        self.currentAnimation = nil
    end
end

function u8:UpdateSetters(a2) -- Line: 69 -- types: self: table, a2: table
    self.setters = a2
end

local function getStateContainer(a1) -- Line: 73 -- upvalues: useBinding (val) -- types: a1: table
    local v1, v2
    local v3 = {}
    local v4 = {}
    for i, j in a1 do
        v1, v2 = useBinding(j)
        v3[i] = v2
        v4[i] = v1
    end
    return v3, v4
end

return function(a1, a2) -- Line: 87
    -- upvalues: useMemo (val), getStateContainer (val), u8 (val)
    local u5 = useMemo(function() -- Line: 88 -- upvalues: a2 (val)
        return a2
    end, {})
    local u8_2, v1 = getStateContainer(u5)
    local v2 = useMemo(function() -- Line: 93 -- upvalues: u8 (upval), a1 (val), u5 (val), u8_2 (val)
        local u5_2 = u8.new(a1, u5, u8_2)
        return {
            updateSetters = function(a1) -- Line: 97 -- upvalues: u5_2 (val) -- types: a1: table
                u5_2:UpdateSetters(a1)
            end,
            play = function(a1, a2) -- Line: 101 -- upvalues: u5_2 (val) -- types: a1: string, a2: boolean?
                assert(typeof(a1) == "string", "useGroupAnimation expects a string 'state'")
                u5_2:Play(a1, a2)
            end,
            stop = function() -- Line: 106 -- upvalues: u5_2 (val)
                u5_2:Stop()
            end,
        }
    end, {})
    v2.updateSetters(u8_2)
    return v1, v2.play, v2.stop
end