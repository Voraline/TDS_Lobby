-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.HexTileInfo.story
-- Decompile time: 2.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HexTileInfo = require(script.Parent.HexTileInfo)
local Charm = require(ReplicatedStorage.Packages.Charm)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactRoblox = require(ReplicatedStorage.Shared.UI.ReactRoblox)

local function render() -- Line: 9 -- upvalues: Charm (val), React (val), HexTileInfo (val), Enum (val)
    local v1 = Charm.signal(1)
    local v2 = Charm.signal(true)
    local v3 = Charm.signal(false)
    local v4 = Charm.signal(1000)
    local v5 = Charm.signal(false)
    local v6 = Charm.signal(100)
    local v7 = Charm.signal(5)
    local v8 = Charm.signal(false)
    local v9 = Charm.signal(0)
    return React.createElement("Frame", {
        BackgroundTransparency = 1,
        Rotation = -90,
        Size = UDim2.new(0, 860, 0, 1000),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
    }, {
        hexTile = React.createElement(HexTileInfo, {
            Level = v1,
            IsHovering = v2,
            IsHeldDown = v3,
            Price = v4,
            SkillCap = v6,
            IsLocked = v5,
            LevelsNeeded = v7,
            IsMaxedOut = v8,
            SkillPoints = v9,
            SkillPointCost = Charm.signal(1000),
            UserSkillPoints = v9,
            SkillPriceNumber = Charm.signal(500),
            SkillEnum = Enum.SkillTreeNode.BeefedUpMinions,
        }),
        UIScale = React.createElement("UIScale", {Scale = 0.2}),
    })
end

return function(a1) -- Line: 51 -- upvalues: ReactRoblox (val), React (val), render (val)
    local u4 = ReactRoblox.createRoot(a1)
    u4:render((React.createElement(render)))
    return function() -- Line: 56 -- upvalues: u4 (val)
        u4:unmount()
    end
end