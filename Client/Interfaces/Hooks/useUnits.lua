-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useUnits
-- Decompile time: 2.87 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UnitReplicator = require(ReplicatedStorage.Client.Modules.Replicators.UnitReplicator)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
local u19 = {PathDistance = true, ForcePosition = true, TotalDamage = true}

local function createState() -- Line: 33
    return {units = {}, _lookup = {}}
end

local function cleanupState(a1) -- Line: 43 -- types: a1: table
    if a1._unitAdded then
        a1._unitAdded:Disconnect()
    end
    if a1._unitRemoved then
        a1._unitRemoved:Disconnect()
    end
    for i, v in ipairs(a1.units) do
        if v._changed then
            v._changed:Disconnect()
        end
    end
    a1.units = {}
    a1._lookup = {}
    a1._tower = nil
    a1._unitAdded = nil
    a1._unitRemoved = nil
end

local function publishUnits(a1, a2) -- Line: 65 -- types: a1: table
    a2(table.clone(a1.units))
end

local function updateUnit(a1, a2, a3, a4, a5) -- Line: 69 -- types: a1: table, a3: userdata, a4: string
    if not a1._lookup[a3] then
        return
    end
    for i, v in ipairs(a1.units) do
        if v.value == a3 then
            v.states = table.clone(v.states)
            v.states[a4] = a5
            break
        end
    end
    a2(table.clone(a1.units))
end

local function addUnit(a1, a2, a3) -- Line: 85
    -- upvalues: UnitReplicator (val), u19 (val), updateUnit (val)
    if a1._lookup[a3] then
        return
    end
    local Value = a3.Value and UnitReplicator.GetNPCFromFolder(a3.Value)
    if not Value then
        return
    end
    if not Value.Model.PrimaryPart then
        Value.Model:GetPropertyChangedSignal("Primary"):Wait()
    end
    if not Value.Model.PrimaryPart:FindFirstChild("Node") then
        return
    end
    local v1 = {
        model = Value.Model,
        value = a3,
        states = Value.Replicator:GetAllStates(),
        _changed = Value.Replicator.Changed:Connect(function(a1_2, a2_2) -- Line: 111
            -- upvalues: u19 (upval), updateUnit (upval), a1 (val), a2 (val), a3 (val)
            if u19[a1_2] then
                return
            end
            updateUnit(a1, a2, a3, a1_2, a2_2)
        end),
    }
    a1._lookup[a3] = true
    table.insert(a1.units, v1)
    a2(table.clone(a1.units))
end

local function removeUnit(a1, a2, a3) -- Line: 125 -- types: a1: table, a3: userdata
    if not a1._lookup[a3] then
        return
    end
    for i, v in ipairs(a1.units) do
        if v.value == a3 then
            if v._changed then
                v._changed:Disconnect()
            end
            a1._lookup[a3] = nil
            table.remove(a1.units, i)
            a2(table.clone(a1.units))
            return
        end
    end
end

local function setTower(a1, a2, a3) -- Line: 146
    -- upvalues: cleanupState (val), addUnit (val), removeUnit (val)
    cleanupState(a1)
    if not a3 then
        a2(table.clone(a1.units))
        return
    end
    a1._tower = a3
    local Units = a3:FindFirstChild("Units")
    if not Units then
        a2(table.clone(a1.units))
        return
    end
    task.defer(function() -- Line: 162 -- upvalues: Units (val), addUnit (upval), a1 (val), a2 (val)
        for i, v in ipairs(Units:GetChildren()) do
            addUnit(a1, a2, v)
        end
    end)
    a1._unitAdded = Units.ChildAdded:Connect(function(a1_2) -- Line: 168 -- upvalues: addUnit (upval), a1 (val), a2 (val)
        addUnit(a1, a2, a1_2)
    end)
    a1._unitRemoved = Units.ChildRemoved:Connect(function(a1_2) -- Line: 172 -- upvalues: removeUnit (upval), a1 (val), a2 (val)
        removeUnit(a1, a2, a1_2)
    end)
    a2(table.clone(a1.units))
end

return function(a1) -- Line: 180
    -- upvalues: useState (val), useRef (val), useEffect (val), createState (val), cleanupState (val), setTower (val)
    local v1, u4 = useState({})
    local u7 = useRef(nil)
    useEffect(function() -- Line: 184 -- upvalues: u7 (val), createState (upval), cleanupState (upval)
        local current = u7.current
        if not current then
            current = createState()
            u7.current = current
        end
        return function() -- Line: 190 -- upvalues: cleanupState (upval), current (ref)
            cleanupState(current)
        end
    end, {})
    local v2 = {a1, u7}
    useEffect(function() -- Line: 195 -- upvalues: u7 (val), setTower (upval), u4 (val), a1 (val)
        local current = u7.current
        if current then
            setTower(current, u4, a1)
        end
    end, v2)
    return v1
end