-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.useAtom
-- Decompile time: 0.45 ms

local Dependencies = require(script.Parent.Parent.Dependencies)
local Charm = Dependencies.get("Charm")
local React = Dependencies.get("React")
local useState = React.useState
return function(a1) -- Line: 9 -- upvalues: useState (val), React (val), Charm (val)
    local v1, u4 = useState(a1)
    local v2 = {a1}
    React.useEffect(function() -- Line: 12 -- upvalues: Charm (upval), a1 (val), u4 (val)
        return Charm.subscribe(a1, u4)
    end, v2)
    return v1
end