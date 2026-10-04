-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPRankedNew.RankRewards.PVPRewards
-- Decompile time: 12.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local React = require(ReplicatedStorage.Shared.UI.React)
require(ReplicatedStorage.Shared.Data.Seasons.Types)
local PVPItemPreview = require(script.PVPItemPreview)
local PVPLevel = require(script.Parent.PVPLevel)
local createElement = React.createElement

local function convertReward(a1) -- Line: 29
    if a1 and not a1.type then
        local Type = a1.Type
        local Value = a1.Value
        local v1 = {type = Type}
        if Type == "Crate" then
            v1.type = "crate"
            v1.name = Value[1]
            v1.amount = Value[2] or 1
            return v1
        end
        if Type ~= "Currency" and Type ~= "Stat" then
            if Type == "Tower" then
                v1.type = "tower"
                v1.name = Value[1]
                v1.skin = "Default"
                return v1
            end
            if Type == "Skin" then
                v1.type = "skin"
                v1.tower = Value[1]
                v1.skin = Value[2]
                return v1
            end
            if Type == "Emote" then
                v1.type = "emote"
                v1.name = Value[1]
                return v1
            end
            if Type == "Sticker" then
                v1.type = "sticker"
                v1.name = Value[1]
                return v1
            end
            if Type == "Tag" then
                v1.type = "nametag"
                v1.name = Value[1]
                return v1
            end
            if Type == "Consumable" then
                v1.type = "consumable"
                v1.name = Value[1]
                v1.amount = Value[2] or 1
                return v1
            end
            if Type == "Totem" then
                v1.type = "charm"
                v1.name = Value[1]
                return v1
            end
            if Type == "Badge" then
                assert(false, "Badge rewards are not supported")
            end
            return v1
        end
        v1.type = "stat"
        v1.stat = Value[1]
        v1.amount = Value[2] or 1
        return v1
    end
    return a1
end

return React.memo(function(a1) -- Line: 80
    -- upvalues: createElement (val), PVPConstants (val), PVPLevel (val), PVPItemPreview (val), convertReward (val)
    local v1, v2
    local level = a1.level
    local levelIcon = a1.levelIcon
    local completed = a1.completed
    local selected = a1.selected
    if not a1.rankRange then
        NumberRange.new(0, 0)
    end
    local rewards = a1.rewards or {}
    local v3, v4, v5 = unpack(rewards)
    if selected then
        v2 = Color3.fromRGB(254, 163, 3)
        v1 = Color3.fromRGB(255, 255, 255)
    elseif not completed then
        v2 = Color3.fromRGB(58, 58, 58)
        v1 = Color3.fromRGB(161, 161, 161)
    else
        v2 = Color3.fromRGB(42, 255, 97)
        v1 = Color3.fromRGB(11, 33, 0)
    end
    local v6 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        LayoutOrder = a1.LayoutOrder or 0,
        Visible = a1.Visible,
    }
    local v7 = {ratio = createElement("UIAspectRatioConstraint", {AspectRatio = 4})}
    local v8 = {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}
    local v9 = {}
    local v10 = {
        BorderSizePixel = 0,
        Size = UDim2.new(0.85, 0, 0, 2),
        Position = UDim2.fromScale(0.5, 1.45),
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
    }
    v10.BackgroundTransparency = if a1.rankMax == (1 / 0) then 1 else if a1.rankMax == PVPConstants.RANK_DIFFICULTIES.PVP_midRanks.Min - 1 then 1 else if a1.rankMax ~= PVPConstants.RANK_DIFFICULTIES.PVP_highRanks.Min - 1 then 0.95 else 1
    v9.dividerFrame = createElement("Frame", v10)
    v7.backgroundFrame = createElement("Frame", v8, v9)
    v7.contentFrame = createElement("Frame", {BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1)}, {
        uiListLayout = createElement("UIListLayout", {
            HorizontalFlex = "None",
            FillDirection = Enum.FillDirection.Horizontal,
            SortOrder = Enum.SortOrder.LayoutOrder,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            Padding = UDim.new(0.025, 0),
        }),
        level = createElement(PVPLevel, {
            LayoutOrder = 0,
            level = 1,
            Size = UDim2.fromScale(1, 1),
            Position = UDim2.fromScale(0, 0),
            textPosition = UDim2.fromScale(0.58, 0.5),
            textSize = UDim2.fromScale(0.828, 0.45),
            textXAlignment = Enum.TextXAlignment.Center,
            levelIcon = levelIcon,
            color = v2,
            textColor = v1,
            Transparency = a1.Transparency,
            levelText = level or "Lieutenant III",
            rank = a1.rankMin,
        }),
        items = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Size = UDim2.fromScale(0.62, 0.9),
            Position = UDim2.fromScale(1, 0),
            AnchorPoint = Vector2.new(1, 0),
        }, {
            arenaImage = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                ImageTransparency = 0,
                ZIndex = 0,
                Size = UDim2.fromScale(1.1, 1.25),
                Position = UDim2.fromScale(0.5, 0.7),
                AnchorPoint = Vector2.new(0.5, 0.5),
                Image = a1.arenaImage,
            }, {
                uiAspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 2.6391752577319587}),
            }),
            contentFrame = createElement("Frame", {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.3),
                Size = UDim2.fromScale(1, 1),
            }, {
                uiListLayout = createElement("UIListLayout", {
                    HorizontalFlex = "None",
                    FillDirection = Enum.FillDirection.Horizontal,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    VerticalAlignment = Enum.VerticalAlignment.Center,
                    Padding = UDim.new(0.035, 0),
                }),
                uiPadding = createElement("UIPadding", {
                    PaddingLeft = UDim.new(0.03, 0),
                    PaddingRight = UDim.new(0.03, 0),
                    PaddingTop = UDim.new(0.1, 0),
                    PaddingBottom = UDim.new(0.1, 0),
                }),
                rewardOne = v3 and createElement(PVPItemPreview, {
                    LayoutOrder = 2,
                    removeBG = false,
                    ZIndex = 10,
                    AspectRatio = 1,
                    Size = UDim2.fromScale(1, 1),
                    item = convertReward(v3),
                    locked = not (completed or selected),
                    completed = completed,
                    color = v2,
                }),
                rewardTwo = v4 and createElement(PVPItemPreview, {
                    LayoutOrder = 3,
                    ZIndex = 10,
                    AspectRatio = 1,
                    removeBG = false,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0, 0),
                    color = v2,
                    item = convertReward(v4),
                    locked = not (completed or selected),
                    completed = completed,
                }),
                rewardThree = v5 and createElement(PVPItemPreview, {
                    LayoutOrder = 4,
                    ZIndex = 10,
                    AspectRatio = 1,
                    removeBG = false,
                    Size = UDim2.fromScale(1, 1),
                    Position = UDim2.fromScale(0, 0.5),
                    color = v2,
                    item = convertReward(v5),
                    locked = not (completed or selected),
                    completed = completed,
                }),
            }),
        }),
    })
    return createElement("Frame", v6, v7)
end)