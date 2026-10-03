-- Script path: ReplicatedStorage.Packages._Index.outofbears_react-flow@0.4.0.react-flow.Hooks.useSequenceAnimation
-- Decompile time: 2.58 ms

local Promise = require(script.Parent.Parent.Promise)
local Animations = require(script.Parent.Parent.Animations)
local useMemo = (require(script.Parent.Parent.React)).useMemo
local u19 = {}
u19.__index = u19

function u19.new(a1) -- Line: 12 -- upvalues: u19 (val), Animations (val) -- types: a1: table
    local timestamp, v1
    local u63 = setmetatable({}, u19)
    local v2 = {}
    local v3 = nil
    local v4 = nil
    for i, j in a1, v3, v4 do
        v1 = {timestamp = j.timestamp}
        v2[i] = v1
        for k, n in j do
            if k ~= "timestamp" then
                v2[i][k] = (Animations.fromDefinition(n))
            end
        end
    end
    u63.playing = false
    u63.listener = nil
    u63.animation = v2
    table.sort(v2, function(a1, a2) -- Line: 34
        return a1.timestamp < a2.timestamp
    end)
    local v5 = nil
    v4 = nil
    local v6 = nil
    for m, i5 in v2, v4, v6 do
        timestamp = i5.timestamp
        if v5 == timestamp then
            error("Duplicate timestamp found in sequence")
        end
        for i6, i7 in i5 do
            if i6 ~= "timestamp" then
                i7:SetListener(function(a1) -- Line: 53 -- upvalues: u63 (val), i6 (val)
                    if u63.listener then
                        u63.listener(i6, a1)
                    end
                end)
            end
        end
    end
    return u63
end

function u19:SetListener(a2) -- Line: 64 -- types: self: table, a2: function
    self.listener = a2
end

function u19:Play(a2, a3) -- Line: 68 -- upvalues: Promise (val) -- types: self: table, a2: table, a3: boolean?
    if self.playing then
        self:Stop()
    end
    local v1 = Promise.new(function(a1, a2_2, a3_2) -- Line: 73 -- upvalues: self (val), Promise (upval), a3 (val), a2 (val)
        local u45 = {}
        local u4 = {}
        local animation = self.animation
        local v1 = nil
        local v2 = nil
        local v3, v4 = a1, a3_2
        for i, j in animation, v1, v2 do
            table.insert(u45, ((Promise.delay(if not a3 then j.timestamp else 0)):andThen(function() -- Line: 78 -- upvalues: j (val), u4 (val), a2 (upval), a3 (upval), Promise (upval)
                local v1, v2
                local v3 = {}
                local v4 = nil
                local v5 = nil
                for i, j2 in j, v4, v5 do
                    if i ~= "timestamp" then
                        if u4[i] then
                            u4[i]:cancel()
                        end
                        v2 = a2[i]
                        v1 = j2:Play(v2, a3)
                        u4[i] = v1
                        table.insert(v3, v1)
                    end
                end
                return Promise.all(v3)
            end)))
        end
        local u25 = Promise.all(u45):andThen(v3)
        v4(function() -- Line: 104 -- upvalues: u45 (val), u25 (val)
            for i, j in u45 do
                j:cancel()
            end
            u25:cancel()
        end)
    end)
    self.playing = true
    self.player = v1
    return v1
end

function u19:Stop() -- Line: 119
    if not self.playing then
        return
    end
    if self.player then
        self.player:cancel()
        self.player = nil
    end
    self.playing = false
end

return function(a1) -- Line: 132 -- upvalues: useMemo (val), u19 (val) -- types: a1: table
    return useMemo(function() -- Line: 133 -- upvalues: u19 (upval), a1 (val)
        return u19.new(a1)
    end, {})
end