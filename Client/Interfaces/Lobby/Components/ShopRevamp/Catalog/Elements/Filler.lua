-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.Filler
-- Decompile time: 0.46 ms

local Constants = require(script.Parent.Parent.Constants)
local Container = require(script.Parent.Container)
return function() -- Line: 6 -- upvalues: Container (val), Constants (val)
    return Container(Constants.CONTENT_WIDTH_SCALE * Constants.SECTION_WIDTH_SCALE, {})
end