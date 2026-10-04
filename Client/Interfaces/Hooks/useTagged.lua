-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTagged
-- Decompile time: 3.21 ms

local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
return function(a1) -- Line: 10
    -- upvalues: CollectionService (val), useState (val), useEffect (val), useRef (val)
    local current, v1

    local function getTaggedInstances() -- Line: 11 -- upvalues: CollectionService (upval), a1 (val)
        return CollectionService:GetTagged(a1)
    end

    local u41, u5 = useState(getTaggedInstances)
    local v2 = {a1}
    useEffect(function() -- Line: 17 -- upvalues: u5 (val), getTaggedInstances (val), CollectionService (upval), a1 (val)
        local u10 = (CollectionService:GetInstanceAddedSignal(a1)):Connect(function(a1) -- Line: 18 -- upvalues: u5 (upval), getTaggedInstances (upval)
            u5(getTaggedInstances)
        end)
        local u19 = (CollectionService:GetInstanceRemovedSignal(a1)):Connect(function(a1) -- Line: 22 -- upvalues: u5 (upval), getTaggedInstances (upval)
            u5(getTaggedInstances)
        end)
        u5(getTaggedInstances)
        return function() -- Line: 32 -- upvalues: u10 (val), u19 (val)
            u10:Disconnect()
            u19:Disconnect()
        end
    end, v2)
    local u42 = useRef({next = 1, map = {}})
    local v3 = #u41
    for i = 1, v3 do
        v1 = u41[i]
        if u42.current.map[v1] == nil then
            u42.current.map[v1] = u42.current.next
            current = u42.current
            current.next = current.next + 1
        end
    end
    local v4 = {u41}
    useEffect(function() -- Line: 47 -- upvalues: u41 (val), u42 (val)
        local v1 = {}
        local v2 = #u41
        for i = 1, v2 do
            v1[u41[i]] = true
        end
        for j in u42.current.map do
            if not v1[j] then
                u42.current.map[j] = nil
            end
        end
    end, v4)
    return u41
end