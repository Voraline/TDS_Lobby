-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier
-- Decompile time: 4.23 ms

local UI = (game:GetService("ReplicatedStorage")).Shared.UI
local React = require(UI.React)
local joinBindings = React.joinBindings
local useCallback = React.useCallback

local function modifyNumberTransparency(a1, a2) -- Line: 17 -- types: a1: number, a2: number
    local v1 = 1 - (1 - a2) * (1 - a1)
    if v1 < 0.01 then
        return 0
    end
    if v1 > 0.99 then
        return 1
    end
    return v1
end

local function modifyNumberSequenceTransparency(a1, a2) -- Line: 30 -- types: a1: number, a2: userdata
    local Envelope, Time, v1
    local v2 = table.create(#a2.Keypoints)
    for k, v in pairs(a2.Keypoints) do
        Time = v.Time
        Envelope = v.Envelope
        v1 = 1 - (1 - v.Value) * (1 - a1)
        table.insert(v2, (NumberSequenceKeypoint.new(Time, if not (v1 < 0.01) then if not (v1 > 0.99) then v1 else 1 else 0, Envelope)))
    end
    return NumberSequence.new(v2)
end

return function(a1) -- Line: 47
    -- upvalues: useCallback (val), modifyNumberSequenceTransparency (val), modifyNumberTransparency (val)
    -- upvalues: joinBindings (val)
    if not a1 then
        return function(a1) -- Line: 49
            return a1
        end
    end
    return useCallback(function(a1_2) -- Line: 53
        -- upvalues: a1 (val), modifyNumberSequenceTransparency (upval), modifyNumberTransparency (upval)
        -- upvalues: joinBindings (upval)
        local u1 = a1_2 or 0
        local v1 = u1
        if typeof(v1) == "number" then
            return (a1:map(function(a1) -- Line: 57 -- upvalues: u1 (ref) -- types: a1: number
                local v1 = 1 - (1 - u1) * (1 - a1)
                if v1 < 0.01 then
                    return 0
                end
                if v1 > 0.99 then
                    return 1
                end
                return v1
            end))
        end
        v1 = u1
        if typeof(v1) == "NumberSequence" then
            return (a1:map(function(a1) -- Line: 61 -- upvalues: modifyNumberSequenceTransparency (upval), u1 (ref) -- types: a1: number
                return modifyNumberSequenceTransparency(a1, u1)
            end))
        end
        v1 = u1
        if type(v1) == "table" and u1.getValue then
            local u28
            if typeof((u1:getValue())) ~= "number" then
                u28 = modifyNumberSequenceTransparency
            else
                u28 = modifyNumberTransparency
                if not u28 then
                    u28 = modifyNumberSequenceTransparency
                end
            end
            return ((joinBindings({a1, u1})):map(function(a1) -- Line: 69 -- upvalues: u28 (val) -- types: a1: table
                return u28(a1[1], a1[2])
            end))
        end
        return nil
    end, {a1})
end