-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ItemChange
-- Decompile time: 9.25 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharmPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CharmPreview)
local ConsumablePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.ConsumablePreview)
local ContentExpand = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.News.ContentExpand)
local CratePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview)
local EmotePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.EmotePreview)
local FlairPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.FlairPreview)
local Icons = require(ReplicatedStorage.Shared.Data.Icons)
local React = require(ReplicatedStorage.Shared.UI.React)
local StickerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.StickerPreview)
local TagPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TagPreview)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local TowerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview)
local useTransparencyModifier = require(ReplicatedStorage.Client.Interfaces.Hooks.useTransparencyModifier)
local Change = React.Change
local createElement = React.createElement
local useState = React.useState
local u94 = {
    charm = "Charms",
    Charms = "Charms",
    consumable = "Consumables",
    Consumables = "Consumables",
    crate = "Crates",
    Crates = "Crates",
    emote = "Emotes",
    Emotes = "Emotes",
    flair = "Flairs",
    Flairs = "Flairs",
    nametag = "Tags",
    skin = "Towers",
    sticker = "Stickers",
    Stickers = "Stickers",
    tag = "Tags",
    Tags = "Tags",
    tower = "Towers",
    Towers = "Towers",
    unit = "Units",
    Unit = "Units",
    Units = "Units",
}
local u95 = {
    ["Air-Strike"] = true,
    Barricade = true,
    ["Blizzard Bomb"] = true,
    ["Molten Monster"] = true,
    Nuke = true,
    ["Range Flag"] = true,
}
local u102 = {["Field Medic"] = true, Grenadier = true, Rifleman = true, ["Riot Guard"] = true}

local function trim(a1) -- Line: 75 -- types: a1: string
    return string.gsub(a1, "^%s*(.-)%s*$", "%1")
end

local function stripRichText(a1) -- Line: 79 -- types: a1: string
    return string.gsub(a1, "<[^>]->", "")
end

local function getLevelLabel(a1) -- Line: 83 -- types: a1: string
    if string.find(a1, "/") then
        return (("Levels %* Changes"):format(a1))
    end
    return (("Level %* Changes"):format(a1))
end

local function stripLevelFromPoint(a1) -- Line: 91 -- types: a1: string
    return (string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(string.gsub(
        string.gsub(a1, "^(%s*)<b>%s*[Ll]vl%.?%s*[%d/]+%s+([^<:]+):%s*</b>", "%1<b>%2:</b>", 1),
        "^(%s*)<b>%s*[Ll]v%.?%s*[%d/]+%s+([^<:]+):%s*</b>",
        "%1<b>%2:</b>",
        1
    ), "^(%s*)<b>%s*[Ll]v%.?%s*[%d/]+%s*</b>%s*([^:]+):", "%1<b>%2:</b>", 1), "^(%s*)<b>%s*[Ll]evel%s*[%d/]+%s+([^<:]+):%s*</b>", "%1<b>%2:</b>", 1), "^%s*[Ll]vl%.?%s*[%d/]+%s*:%s*", "", 1), "^%s*[Ll]vl%.?%s*[%d/]+%s+", "", 1), "^%s*[Ll]v%.?%s*[%d/]+%s*:%s*", "", 1), "^%s*[Ll]v%.?%s*[%d/]+%s+", "", 1), "^%s*[Ll]evel%s*[%d/]+%s*:%s*", "", 1), "^%s*[Ll]evel%s*[%d/]+%s+", "", 1))
end

local function getLegacyItemData(a1) -- Line: 110 -- upvalues: u95 (val), u102 (val) -- types: a1: string?
    if not a1 then
        return {}
    end
    local v1 = string.gsub(a1, "^%s*(.-)%s*$", "%1")
    local v2 = string.gsub(string.gsub(string.gsub(v1, "%s+Rework$", ""), "%s*%b()", ""), "^%s*(.-)%s*$", "%1")
    local v3 = if not u95[v2] then "tower" else "consumable"
    if u102[v2] then
        v2 = "Mercenary Base"
    end
    local v4 = nil
    local v5 = string.match(v2, "^Golden%s+(.+)$")
    if v5 and v3 == "tower" then
        v2 = v5
        v4 = "Golden"
    end
    return {DisplayName = v1, Name = v2, Skin = v4, Type = v3}
end

local function getUnitIcon(a1) -- Line: 141 -- upvalues: Icons (val) -- types: a1: string?
    if not a1 then
        return nil
    end
    return Icons.Units[a1] or Icons.Units[a1:gsub("_", " ")]
end

local function getImageFromIcon(a1) -- Line: 149
    if typeof(a1) == "number" then
        return (("rbxassetid://%*"):format(a1))
    end
    return a1
end

local function getLevelFromPoint(a1) -- Line: 157 -- types: a1: string
    local v1 = string.gsub(a1, "<[^>]->", "")
    local v2 = string.match(v1, "[Ll]vl%.?%s*(%d+)") or string.match(v1, "[Ll]v%.?%s*(%d+)") or string.match(v1, "[Ll]evel%s*(%d+)")
    local v3 = string.match(v1, "[Ll]vl%.?%s*([%d/]+)") or string.match(v1, "[Ll]v%.?%s*([%d/]+)") or string.match(v1, "[Ll]evel%s*([%d/]+)")
    return if not v2 then nil else tonumber(v2), v3
end

local function getLegacyChanges(a1) -- Line: 169 -- upvalues: getLevelFromPoint (val), stripLevelFromPoint (val)
    local Key, v1, v2, v3, v4
    local v5 = {}
    local v6 = {}
    local v7 = {}
    local v8 = nil
    local v9 = nil
    for i, j in a1, v8, v9 do
        if typeof(j) == "string" then
            v4, v1 = getLevelFromPoint(j)
            if not v4 then
                table.insert(v5, j)
            else
                v2 = v1 or tostring(v4)
                if not v6[v2] then
                    v6[v2] = {Lines = {}, SortLevel = v4}
                    table.insert(v7, {Key = v2, SortLevel = v4})
                end
                table.insert(v6[v2].Lines, (stripLevelFromPoint(j)))
            end
        end
    end
    table.sort(v7, function(a1, a2) -- Line: 199
        if a1.SortLevel == a2.SortLevel then
            return a1.Key < a2.Key
        end
        return a1.SortLevel < a2.SortLevel
    end)
    local v10 = {}
    if #v5 > 0 then
        table.insert(v10, {Title = "General Changes", Lines = v5})
    end
    v9 = nil
    local v11 = nil
    for k, n in v7, v9, v11 do
        v3 = {}
        Key = n.Key
        v3.Title = if not string.find(Key, "/") then ("Level %* Changes"):format(Key) else ("Levels %* Changes"):format(Key)
        v3.Lines = v6[n.Key].Lines
        table.insert(v10, v3)
    end
    return v10
end

local function getInitialExpandListHeight(a1) -- Line: 225
    local v1 = #a1
    if v1 == 0 then
        return 0
    end
    return v1 * 28 + math.max(0, v1 - 1) * 16
end

local function getItemData(a1) -- Line: 234 -- upvalues: getLegacyItemData (val)
    return a1.Item or a1.ItemView or a1.Preview or getLegacyItemData(a1.SubjectName)
end

local function getDisplayName(a1, a2) -- Line: 238
    return a1.DisplayName or a1.Name or a1.Item or a2.DisplayName or a2.Name or "Item"
end

local function getPreview(a1) -- Line: 247 -- upvalues: u94 (val)
    if a1.Preview and a1.Preview.Type and a1.Preview.Item then
        return a1.Preview
    end
    local Type = u94[a1.Type] or a1.Type or "Towers"
    local Item = a1.Item or a1.Name
    if not Item then
        return nil
    end
    local v1 = {Type = Type, Item = Item, Skin = a1.Skin or "Default"}
    local Icon = a1.Icon or a1.Image
    v1.Icon = Icon
    v1.Preview = a1.PreviewData
    return v1
end

local function getChanges(a1) -- Line: 268 -- upvalues: getLegacyChanges (val)
    return a1.Changes or a1.ExpandList or a1.Content or a1.Points and getLegacyChanges(a1.Points) or {}
end

local function createPreviewElement(a1, a2, a3) -- Line: 276
    -- upvalues: createElement (val), TowerPreview (val), Icons (val), EmotePreview (val), CratePreview (val)
    -- upvalues: CharmPreview (val), StickerPreview (val), ConsumablePreview (val), TagPreview (val), FlairPreview (val)
    local v1
    local v2 = {}
    local AnchorPoint = a2.AnchorPoint or Vector2.new(0.5, 0.5)
    v2.AnchorPoint = AnchorPoint
    v2.ImageTransparency = a3
    local Position = a2.Position or UDim2.fromScale(0.5, 0.45)
    v2.Position = Position
    v2.ScaleType = a2.ScaleType
    local Size = a2.Size or UDim2.fromScale(1.25, 1.25)
    v2.Size = Size
    v2.Visible = a2.Visible
    v2.ZIndex = a2.ZIndex or 2
    if a1.Type == "Towers" then
        v1 = table.clone(v2)
        v1.skin = a1.Skin or "Default"
        v1.tower = a1.Item
        v1.icon = true
        return createElement(TowerPreview, v1)
    end
    if a1.Type == "Units" then
        v1 = table.clone(v2)
        v1.BackgroundTransparency = 1
        local Icon = a1.Icon
        local v3 = if typeof(Icon) ~= "number" then Icon else ("rbxassetid://%*"):format(Icon)
        if not v3 then
            local Item = a1.Item
            v3 = (if Item then Icons.Units[Item] or Icons.Units[Item:gsub("_", " ")] else nil) or ""
        end
        v1.Image = v3
        local ScaleType = a2.ScaleType or Enum.ScaleType.Fit
        v1.ScaleType = ScaleType
        return createElement("ImageLabel", v1)
    end
    if a1.Type == "Emotes" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        v1.playing = if a2.playing == nil then if a2.Playing == nil then false else a2.Playing else a2.playing
        return createElement(EmotePreview, v1)
    end
    if a1.Type == "Crates" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        local Size_2 = a2.Size or UDim2.fromScale(1, 1)
        v1.Size = Size_2
        return createElement(CratePreview, v1)
    end
    if a1.Type == "Charms" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        v1.flat = if a2.flat == nil then if a2.Flat == nil then true else a2.Flat else a2.flat
        v1.playing = if a2.playing == nil then if a2.Playing == nil then false else a2.Playing else a2.playing
        return createElement(CharmPreview, v1)
    end
    if a1.Type == "Stickers" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        local Size_3 = a2.Size or UDim2.fromScale(1, 1)
        v1.Size = Size_3
        return createElement(StickerPreview, v1)
    end
    if a1.Type == "Consumables" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        local Size_4 = a2.Size or UDim2.fromScale(1, 1)
        v1.Size = Size_4
        return createElement(ConsumablePreview, v1)
    end
    if a1.Type == "Tags" then
        v1 = table.clone(v2)
        v1.name = a1.Item
        v1.playing = if a2.playing == nil then if a2.Playing == nil then false else a2.Playing else a2.playing
        return createElement(TagPreview, v1)
    end
    if a1.Type ~= "Flairs" then
        return nil
    end
    v1 = table.clone(v2)
    v1.name = a1.Item
    return createElement(FlairPreview, v1)
end

return function(a1) -- Line: 351
    -- upvalues: getLegacyItemData (val), getLegacyChanges (val), getPreview (val), useState (val)
    -- upvalues: useTransparencyModifier (val), createElement (val), ContentExpand (val), createPreviewElement (val)
    -- upvalues: TextLabel (val), Change (val), React (val)
    local Content, Title, v1, v2, v3
    local Item = a1.Item or a1.ItemView or a1.Preview or getLegacyItemData(a1.SubjectName)
    local Changes = a1.Changes or a1.ExpandList or a1.Content or a1.Points and getLegacyChanges(a1.Points) or {}
    local DisplayName = Item.DisplayName or Item.Name or Item.Item or a1.DisplayName or a1.Name or "Item"
    local v4 = getPreview(Item)
    local v5 = a1.PaddingTop or 16
    local v6 = a1.PaddingBottom or 32
    local v7 = #Changes
    local u339, u343 = useState(if v7 ~= 0 then v7 * 28 + math.max(0, v7 - 1) * 16 else 0)
    local v8 = useTransparencyModifier(a1.Transparency)
    local v9 = a1.PageBreak ~= false
    local v10 = {}
    local v11 = nil
    local v12 = nil
    for i, j in Changes, v11, v12 do
        v1 = if typeof(j) ~= "table" then {Text = j} else j
        v2 = tostring(i)
        v3 = {}
        Content = v1.Content or v1.Lines or v1.Items or v1.Text
        v3.Content = Content
        v3.ContentBackgroundColor3 = v1.ContentBackgroundColor3
        v3.ContentBackgroundTransparency = v1.ContentBackgroundTransparency
        v3.DefaultExpanded = v1.DefaultExpanded
        v3.Expanded = v1.Expanded
        v3.GradientColor = v1.GradientColor
        v3.KeepExpanded = v1.KeepExpanded
        v3.LayoutOrder = v1.LayoutOrder or i
        v3.Text = v1.Text
        Title = v1.Title or v1.Name or v1.Header
        v3.Title = Title
        v3.TitleFontWeight = v1.TitleFontWeight
        v3.TitleMaxTextSize = v1.TitleMaxTextSize
        v3.Transparency = v13.Transparency
        v10[v2] = (createElement(ContentExpand, v3))
    end
    local PreviewProps = Item.PreviewProps or {}
    local v14 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = v13.LayoutOrder,
        Size = UDim2.new(1, 0, 0, math.max(96, u339) + v5 + v6),
    }
    local v15 = {
        itemView = createElement("TextButton", {
            Active = false,
            AutoButtonColor = false,
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = false,
            Text = "",
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0, 0, 0, v5),
            Size = UDim2.new(0.28, 0, 0, 96),
        }, {
            preview = v4 and createPreviewElement(v4, PreviewProps, v13.Transparency),
            title = createElement(TextLabel, {
                FontWeight = "SemiBold",
                StrokeThickness = 2,
                TextScaled = true,
                TextWrapped = true,
                ZIndex = 3,
                AnchorPoint = Vector2.new(0.5, 0),
                Position = UDim2.fromScale(0.5, 0.8),
                Size = UDim2.fromScale(0.95, 0.2),
                Text = DisplayName,
                TextColor3 = Color3.fromRGB(255, 255, 255),
                Transparency = v13.Transparency,
            }, {uITextSizeConstraint = createElement("UITextSizeConstraint", {MaxTextSize = 24})}),
        }),
    }
    v1 = createElement
    local v16 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Position = UDim2.new(0.3, 0, 0, v5),
        Size = UDim2.new(0.7, 0, 0, u339),
    }
    local v17 = {}
    v3 = createElement
    local v18 = {
        FillDirection = Enum.FillDirection.Vertical,
        Padding = UDim.new(0, 16),
        SortOrder = Enum.SortOrder.LayoutOrder,
    }

    v18[Change.AbsoluteContentSize] = function(a1) -- Line: 439 -- upvalues: u339 (val), u343 (val) -- types: a1: userdata
        local v1 = math.ceil(a1.AbsoluteContentSize.Y)
        if v1 ~= u339 then
            u343(v1)
        end
    end

    v17.uiListLayout = v3("UIListLayout", v18)
    v17.contentExpands = createElement(React.Fragment, {}, v10)
    v15.expandList = v1("Frame", v16, v17)
    v15.pageBreak = v9 and createElement("Frame", {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = v8(0.8),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.5, 0, 1, -8),
        Size = UDim2.new(1, 0, 0, 2),
    })
    return createElement("Frame", v14, v15)
end