-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactPortal
-- Decompile time: 0.32 ms

local REACT_PORTAL_TYPE = require(script.Parent.Parent:WaitForChild("shared")).ReactSymbols.REACT_PORTAL_TYPE
require(script.Parent.Parent:WaitForChild("shared"))
return {
    createPortal = function(a1, a2, a3, a4) -- Line: 17 -- upvalues: REACT_PORTAL_TYPE (val) -- types: a4: string?
        if a4 ~= nil then
            a4 = tostring(a4)
        end
        return {
            ["$$typeof"] = REACT_PORTAL_TYPE,
            key = a4,
            children = a1,
            containerInfo = a2,
            implementation = a3,
        }
    end,
}