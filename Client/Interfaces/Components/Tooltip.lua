-- Script path: ReplicatedStorage.Client.Interfaces.Components.Tooltip
-- Decompile time: 0.69 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local NewTooltipStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.NewTooltipStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local useEffect = React.useEffect
local useRef = React.useRef
return function(a1) -- Line: 9 -- upvalues: useRef (val), useEffect (val), NewTooltipStore (val), React (val)
    local u2 = useRef()
    local v1 = useEffect
    local v2 = {u2.current, a1}
    v1(function() -- Line: 11 -- upvalues: u2 (val), a1 (val), NewTooltipStore (upval)
        local current = u2.current
        if current and not a1.Disabled then
            NewTooltipStore.addOrUpdate({name = a1.Name, element = current, tooltip = a1})
            return function() -- Line: 21 -- upvalues: NewTooltipStore (upval), a1 (upval)
                NewTooltipStore.remove(a1.Name)
            end
        end
        return nil
    end, v2)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 9999,
        key = a1.Name,
        Size = UDim2.fromScale(1, 1),
        ref = u2,
    })
end