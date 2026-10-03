-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.Elements.Subsection
-- Decompile time: 0.56 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Packages.React)
local SubsectionBreak = require(script.Parent.Parent.Parent.Components.SubsectionBreak)
local Constants = require(script.Parent.Parent.Constants)
local LayoutUtils = require(script.Parent.Parent.LayoutUtils)
local Container = require(script.Parent.Container)
return function(a1, a2, a3, a4, a5, a6) -- Line: 12
    -- upvalues: LayoutUtils (val), Container (val), Constants (val), React (val), SubsectionBreak (val)
    return Container(Constants.CONTENT_WIDTH_SCALE * Constants.SECTION_WIDTH_SCALE, {
        Subsection = React.createElement(SubsectionBreak, {
            canExpand = true,
            visible = true,
            title = a1,
            subsectionKey = a2,
            expanded = a3,
            layoutOrder = a4,
            timeLeft = LayoutUtils.getTimeUntilRefresh(a6),
            size = UDim2.fromScale(1, 1),
            onToggleSubsection = a5,
        }),
    })
end