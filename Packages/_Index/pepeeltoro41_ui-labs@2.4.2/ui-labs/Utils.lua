-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.Utils
-- Decompile time: 0.69 ms

local u0 = {}
require(script.Parent.Types)

function u0.ListenControl(a1, a2) -- Line: 4 -- types: a2: function
    local __old = a1.__old
    local __new = a1.__new
    if __old ~= __new then
        a2(__new)
    end
end

function u0.CreateControlStates(a1, a2, a3) -- Line: 13
    -- upvalues: u0 (val)
    local v1
    local v2 = {}
    for k, v in pairs(a1) do
        v1 = a2[k]
        if v.EntryType ~= "ControlGroup" then
            v2[k] = (a3(v1))
        else
            v2[k] = (u0.CreateControlStates(v.Controls, v1, a3))
        end
    end
    return v2
end

function u0.UpdateControlStates(a1, a2, a3, a4) -- Line: 33
    -- upvalues: u0 (val)
    local v1
    for k, v in pairs(a2) do
        v1 = a3[k]
        if v.EntryType ~= "ControlGroup" then
            a4(a1[k], v1)
        else
            u0.UpdateControlStates(a1[k], v.Controls, v1, a4)
        end
    end
end

return u0