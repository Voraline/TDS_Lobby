-- Script path: ReplicatedStorage.Shared.UI.Components.RichText.Container
-- Decompile time: 0.25 ms

local u0 = {}

function u0.Get(a1) -- Line: 3
    return a1.value
end

function u0.Set(a1, a2) -- Line: 7
    a1.value = a2
    return a2
end

return (setmetatable({}, {
    __call = function(a1, a2) -- Line: 13 -- upvalues: u0 (val)
        return (setmetatable({value = a2}, {__index = u0}))
    end,
}))