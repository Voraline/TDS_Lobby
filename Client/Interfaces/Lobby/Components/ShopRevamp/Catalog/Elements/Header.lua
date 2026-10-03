-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.Header
-- Decompile time: 0.55 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local SectionHeader = require(script.Parent.Parent.Parent.Components.SectionHeader)
local Constants = require(script.Parent.Parent.Constants)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
require(script.Parent.Parent.Types)
local Container = require(script.Parent.Container)
return function(a1, a2) -- Line: 13
    -- upvalues: Container (val), Constants (val), React (val), SectionHeader (val), LayoutUtils (val)
    return Container(Constants.CONTENT_WIDTH_SCALE * Constants.SECTION_WIDTH_SCALE, {
        Header = React.createElement(SectionHeader, {
            title = a1.title,
            layoutOrder = a2,
            timeLeft = LayoutUtils.getTimeUntilRefresh(a1.refreshes),
            size = UDim2.fromScale(1, 1),
        }),
    })
end