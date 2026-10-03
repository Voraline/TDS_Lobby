-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useCharmSelector
-- Decompile time: 1.22 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Charm = require(ReplicatedStorage.Packages.Charm)
local React = require(ReplicatedStorage.Shared.UI.React)
local useLayoutEffect = React.useLayoutEffect
local useRef = React.useRef
local useState = React.useState
return function(a1, a2, a3, a4) -- Line: 10
    -- upvalues: useRef (val), useState (val), useLayoutEffect (val), Charm (val)
    local u6 = useRef(a2)
    u6.current = a2
    local u9 = useRef(a4)
    u9.current = a4
    local u12 = useRef(nil)
    local v1, u16 = useState(function() -- Line: 23 -- upvalues: a2 (val), a1 (val), u12 (val)
        local v1 = a2(a1())
        u12.current = v1
        return v1
    end)
    local v2 = a3 or {a1}
    useLayoutEffect(function() -- Line: 29 -- upvalues: u6 (val), a1 (val), u12 (val), u9 (val), u16 (val), Charm (upval)
        local function getSelectedValue() -- Line: 30 -- upvalues: u6 (upval), a1 (upval)
            return u6.current(a1())
        end

        local function update(a1) -- Line: 34 -- upvalues: u12 (upval), u9 (upval), u16 (upval) -- types: a1: userdata
            local current = u12.current
            local current_2 = u9.current
            if current_2 and current ~= nil and current_2(current, a1) then
                return
            end
            if not current_2 and current == a1 then
                return
            end
            u12.current = a1
            u16(a1)
        end

        local v1 = u6.current(a1())
        local current = u12.current
        local current_2 = u9.current
        if not current_2 or current == nil or not current_2(current, v1) then
            if current_2 or current ~= v1 then
                u12.current = v1
                u16(v1)
            end
        end
        return Charm.listen(getSelectedValue, update)
    end, v2)
    return v1
end