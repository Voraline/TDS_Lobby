-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Builder.Chrome
-- Decompile time: 1.29 ms

require(script.Parent.Parent.Types)
local VirtualRows = require(script.Parent.Parent.VirtualRows)
local Filler = require(script.Parent.Parent.Elements.Filler)
local Header = require(script.Parent.Parent.Elements.Header)
return function(a1, a2, a3, a4) -- Line: 9
    -- upvalues: VirtualRows (val), Filler (val), Header (val)
    VirtualRows.append(a1, ("%*_Filler"):format(a2.key), UDim2.fromScale(1, 0.025), a4, Filler(), a2.title)
    local v1 = a3 + 1
    VirtualRows.append(a1, ("%*_Header"):format(a2.key), UDim2.fromScale(1, 0.04), a4, Header(a2, v1), nil)
    return v1 + 1
end