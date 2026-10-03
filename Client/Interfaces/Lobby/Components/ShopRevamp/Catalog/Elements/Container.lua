-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.Container
-- Decompile time: 0.28 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
return function(a1, a2) -- Line: 7 -- upvalues: React (val) -- types: a1: number, a2: table
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.fromScale(a1, 1),
    }, a2)
end