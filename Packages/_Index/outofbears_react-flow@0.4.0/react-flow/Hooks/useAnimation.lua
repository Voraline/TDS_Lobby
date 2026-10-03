-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useAnimation
-- Decompile time: 1.51 ms

local Promise = require(script.Parent.Parent.Promise)
local Animations = require(script.Parent.Parent.Animations)
local useMemo = (require(script.Parent.Parent.React)).useMemo
local u19 = {}
u19.__index = u19

function u19.new(a1) -- Line: 14 -- upvalues: u19 (val), Animations (val) -- types: a1: table
    local u4 = setmetatable({}, u19)
    local v1 = {}
    for i, j in a1 do
        v1[i] = (Animations.fromDefinition(j))
    end
    u4.playing = false
    u4.listener = nil
    u4.animation = v1
    for k, n in v1 do
        n:SetListener(function(a1) -- Line: 27 -- upvalues: u4 (val), k (val)
            if u4.listener then
                u4.listener(k, a1)
            end
        end)
    end
    return u4
end

function u19:SetListener(a2) -- Line: 37 -- types: self: table, a2: function
    self.listener = a2
end

function u19:Play(a2, a3) -- Line: 41 -- upvalues: Promise (val) -- types: self: table, a2: table, a3: boolean?
    if self.playing then
        self:Stop()
    end
    local v1 = Promise.new(function(a1, a2_2, a3_2) -- Line: 46 -- upvalues: self (val), a2 (val), a3 (val), Promise (upval)
        local v1
        local u3 = {}
        for i, j in self.animation do
            v1 = a2[i]
            table.insert(u3, (j:Play(v1, a3)))
        end
        local u24 = Promise.all(u3):andThen(a1)
        a3_2(function() -- Line: 56 -- upvalues: u24 (val), u3 (val)
            u24:cancel()
            for i, j in u3 do
                j:cancel()
            end
        end)
    end)
    self.playing = true
    self.player = v1
    return v1
end

function u19:Stop() -- Line: 71
    if not self.playing then
        return
    end
    if self.player then
        self.player:cancel()
        self.player = nil
    end
    self.playing = false
end

return function(a1) -- Line: 84 -- upvalues: useMemo (val), u19 (val) -- types: a1: table
    return useMemo(function() -- Line: 85 -- upvalues: u19 (upval), a1 (val)
        return u19.new(a1)
    end, {})
end