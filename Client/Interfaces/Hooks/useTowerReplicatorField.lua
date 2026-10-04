-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useTowerReplicatorField
-- Decompile time: 6.32 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerReplicator = require(ReplicatedStorage.Client.Modules.Replicators.TowerReplicator)
local useLayoutEffect = React.useLayoutEffect
local useRef = React.useRef
local useState = React.useState

local function getTowerFromTarget(a1) -- Line: 10 -- upvalues: TowerReplicator (val)
    if a1 == nil then
        return nil
    end
    if typeof(a1) ~= "Instance" then
        return TowerReplicator.getTowerByUID(a1) or TowerReplicator.getTowerByUID((tostring(a1)))
    end
    local v1 = if not a1:IsA("Model") then a1:FindFirstAncestorOfClass("Model") else a1
    if v1 then
        return (TowerReplicator.getTowerByModel(v1))
    end
    return nil
end

local function selectTowerField(a1, a2, a3) -- Line: 26 -- types: a2: string
    if not a1 then
        return a3
    end
    local v1 = a1.Replicator:Get(a2)
    if v1 == nil and a1.Attributes then
        v1 = a1.Attributes:Get(a2)
    end
    if v1 == nil then
        return a3
    end
    return v1
end

return function(a1, a2, a3, a4) -- Line: 39
    -- upvalues: useRef (val), useState (val), getTowerFromTarget (val), useLayoutEffect (val)
    local v1 = if a3 ~= nil then a3 else false
    local u9 = useRef(a2)
    local u13 = useRef(a3)
    local u17 = useRef(a4)
    local u20 = useRef(nil)
    u9.current = a2
    u13.current = a3
    u17.current = a4
    local v2, u25 = useState(function() -- Line: 55 -- upvalues: getTowerFromTarget (upval), a1 (val), a2 (val), a3 (val), u20 (val)
        local v1
        local v2 = getTowerFromTarget(a1)
        local v3 = a2
        local v4 = a3
        if v2 then
            local v5 = v2.Replicator:Get(v3)
            if v5 == nil and v2.Attributes then
                v5 = v2.Attributes:Get(v3)
            end
            v1 = if v5 ~= nil then v5 else v4
        else
            v1 = v4
        end
        u20.current = v1
        return v1
    end)
    local v3 = {a1 or false, a2, v1}
    useLayoutEffect(function() -- Line: 61
        -- upvalues: getTowerFromTarget (upval), a1 (val), u9 (val), u13 (val), u20 (val), u17 (val), u25 (val)
        local v1
        local u2 = getTowerFromTarget(a1)

        local function update() -- Line: 64
            -- upvalues: u2 (val), u9 (upval), u13 (upval), u20 (upval), u17 (upval), u25 (upval)
            local v1
            local v2 = u2
            local current = u9.current
            local current_2 = u13.current
            if v2 then
                local v3 = v2.Replicator:Get(current)
                if v3 == nil and v2.Attributes then
                    v3 = v2.Attributes:Get(current)
                end
                v1 = if v3 ~= nil then v3 else current_2
            else
                v1 = current_2
            end
            local current_3 = u20.current
            local current_4 = u17.current
            if current_4 and current_3 ~= nil and current_4(current_3, v1) then
                return
            end
            if not current_4 and current_3 == v1 then
                return
            end
            u20.current = v1
            u25(v1)
        end

        local current = u9.current
        local current_2 = u13.current
        if u2 then
            local v2 = u2.Replicator:Get(current)
            if v2 == nil and u2.Attributes then
                v2 = u2.Attributes:Get(current)
            end
            v1 = if v2 ~= nil then v2 else current_2
        else
            v1 = current_2
        end
        local current_3 = u20.current
        local current_4 = u17.current
        if not current_4 or current_3 == nil or not current_4(current_3, v1) then
            if current_4 or current_3 ~= v1 then
                u20.current = v1
                u25(v1)
            end
        end
        if not u2 then
            return
        end
        local u61 = (u2.Replicator:GetStateChangedSignal(u9.current)):Connect(update)
        local u76 = nil
        if u9.current ~= "Attributes" and u2.Attributes then
            u76 = (u2.Attributes:GetStateChangedSignal(u9.current)):Connect(update)
        end
        return function() -- Line: 96 -- upvalues: u61 (val), u76 (ref)
            u61:Disconnect()
            if u76 then
                u76:Disconnect()
            end
        end
    end, v3)
    return v2
end