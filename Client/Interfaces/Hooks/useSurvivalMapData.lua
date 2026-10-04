-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useSurvivalMapData
-- Decompile time: 1.78 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local useChild = require(script.Parent.useChild)
local useState = React.useState
local u21 = {ImageID = 0, Difficulty = Enum.Difficulty.Easy}
u21.Creator = {13323714}
return function(a1) -- Line: 15
    -- upvalues: useChild (val), ReplicatedStorage (val), useState (val), u21 (val), React (val)
    local u12 = useChild(useChild(useChild(ReplicatedStorage, "Content"), "Maps"), a1)
    local v1, u16 = useState(true)
    local v2, u20 = useState(u21)
    local v3 = {u12}
    React.useEffect(function() -- Line: 23 -- upvalues: u12 (val), u20 (val), u21 (upval), u16 (val)
        if not u12 then
            u20(u21)
        else
            local Data = if not u12:IsA("Folder") then u12 else u12:FindFirstChild("Data")
            assert(Data and Data:IsA("ModuleScript"), "Map data not found")
            u20(require(Data))
        end
        u16(u12 == nil)
    end, v3)
    return v2, v1
end