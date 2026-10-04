-- Script path: ReplicatedStorage.Client.Interfaces.Components.ItemPreview
-- Decompile time: 31.03 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Previews = ReplicatedStorage.Client.Interfaces.Components.Previews
local CharmPreview = require(Previews.CharmPreview)
local ConsumablePreview = require(Previews.ConsumablePreview)
local CratePreview = require(Previews.CratePreview)
local EmotePreview = require(Previews.EmotePreview)
local FlairPreview = require(Previews.FlairPreview)
local React = require(ReplicatedStorage.Shared.UI.React)
local StickerPreview = require(Previews.StickerPreview)
local TagPreview = require(Previews.TagPreview)
local TowerPreview = require(Previews.TowerPreview)
local createElement = React.createElement
local __subscribeToBinding = React.__subscribeToBinding
local useEffect = React.useEffect
local useState = React.useState
local LocalPlayer = Players.LocalPlayer

local function isBinding(a1) -- Line: 23
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1["$$typeof"] == 60132
    end
    return v1
end

local function useBindingValue(a1, a2) -- Line: 27
    -- upvalues: useState (val), useEffect (val), __subscribeToBinding (val)
    local u21
    local v1 = false
    if typeof(a1) == "table" then
        v1 = a1["$$typeof"] == 60132
    end
    v1, u21 = useState(if not v1 then if a1 == nil then a2 else a1 else a1:getValue())
    local v2 = {a1}
    useEffect(function() -- Line: 34 -- upvalues: a1 (val), u21 (val), __subscribeToBinding (upval)
        local v1 = a1
        local v2 = false
        if typeof(v1) == "table" then
            v2 = v1["$$typeof"] == 60132
        end
        if not v2 then
            return
        end
        u21(a1:getValue())
        return (__subscribeToBinding(a1, function(a1) -- Line: 41 -- upvalues: u21 (upval)
            u21(a1)
        end))
    end, v2)
    local v3 = false
    if typeof(a1) == "table" then
        v3 = a1["$$typeof"] == 60132
    end
    if v3 then
        return v1
    end
    if a1 ~= nil then
        return a1
    end
    return a2
end

local function getPreviewType(a1) -- Line: 51
    local Type = a1 and a1.Type
    if typeof(Type) == "string" then
        return Type
    end
    return nil
end

local function getPreviewItem(a1) -- Line: 56
    local Item = a1 and (a1.Item or a1.Name)
    if Item ~= nil then
        return (tostring(Item))
    end
    return nil
end

local function getPreviewSkin(a1) -- Line: 61
    local Skin = a1 and a1.Skin
    if Skin ~= nil then
        return (tostring(Skin))
    end
    return "Default"
end

local function frameProps(a1) -- Line: 66
    local v1 = {AnchorPoint = a1.AnchorPoint}
    local BackgroundColor3 = a1.BackgroundColor3 or Color3.fromRGB(255, 255, 255)
    v1.BackgroundColor3 = BackgroundColor3
    v1.BackgroundTransparency = a1.BackgroundTransparency or 1
    v1.LayoutOrder = a1.LayoutOrder
    v1.Position = a1.Position
    v1.Size = a1.Size
    v1.Visible = a1.Visible
    v1.ZIndex = a1.ZIndex
    return v1
end

return function(a1) -- Line: 79
    -- upvalues: useBindingValue (val), createElement (val), TowerPreview (val), CratePreview (val), EmotePreview (val)
    -- upvalues: CharmPreview (val), FlairPreview (val), TagPreview (val), LocalPlayer (val), StickerPreview (val)
    -- upvalues: ConsumablePreview (val), frameProps (val), React (val)
    local Skin, v1
    local v2 = useBindingValue(a1.Preview, nil)
    local v3 = useBindingValue(a1.IsPreview, false)
    local Type = v2 and v2.Type
    local v4 = if typeof(Type) ~= "string" then nil else Type
    local Item = v2 and (v2.Item or v2.Name)
    local v5 = if Item == nil then nil else tostring(Item)
    local ImageTransparency = if a1.ImageTransparency == nil then 0 else a1.ImageTransparency
    local v6 = a1.PauseAnimation ~= true
    local v7 = false
    if v3 == true then
        v7 = a1.HidePreviewText ~= true
    end
    local v8 = a1.IgnoreShadow ~= true
    local v9 = nil
    if v4 == "Towers" or v4 == "Troops" then
        if v5 then
            v1 = {
                icon = false,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Visible = a1.Visible,
                ZIndex = a1.ZIndex,
                ImageTransparency = ImageTransparency,
                ClipsDescendants = a1.ClipsDescendants,
                tower = v5,
            }
            Skin = v2 and v2.Skin
            v1.skin = if Skin == nil then "Default" else tostring(Skin)
            v1.level = v2 and v2.Level
            v1.path = v2 and v2.Path
            v1.flat = a1.Flat == true
            v1.pause = a1.PauseAnimation == true
            v1.animate = a1.IgnoreAnimation ~= true
            v1.cameraOffset = a1.CameraOffset
            v1.preview = v7
            v1.shadow = v8
            v9 = createElement(TowerPreview, v1)
        end
    elseif v4 ~= "Skins" then
        if v4 == "Crates" then
            if v5 then
                v9 = createElement(CratePreview, {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Visible = a1.Visible,
                    ZIndex = a1.ZIndex,
                    ImageTransparency = ImageTransparency,
                    ClipsDescendants = a1.ClipsDescendants,
                    name = v5,
                    icon = a1.Icon,
                })
            end
        elseif v4 ~= "Crate" then
            if v4 == "Emotes" then
                if v5 then
                    v9 = createElement(EmotePreview, {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Visible = a1.Visible,
                        ZIndex = a1.ZIndex,
                        ImageTransparency = ImageTransparency,
                        ClipsDescendants = a1.ClipsDescendants,
                        name = v5,
                        cameraOffset = a1.CameraOffset,
                        playing = v6,
                        shadow = v8,
                    })
                end
            elseif v4 ~= "Emote" then
                if v4 == "Charms" then
                    if v5 then
                        v9 = createElement(CharmPreview, {
                            AnchorPoint = Vector2.new(0.5, 0.5),
                            Position = UDim2.fromScale(0.5, 0.5),
                            Size = UDim2.fromScale(1, 1),
                            Visible = a1.Visible,
                            ZIndex = a1.ZIndex,
                            ImageTransparency = ImageTransparency,
                            ClipsDescendants = a1.ClipsDescendants,
                            name = v5,
                            flat = a1.Flat ~= false,
                            cameraOffset = a1.CameraOffset,
                            preview = v7,
                            shadow = v8,
                            playing = v6,
                        })
                    end
                elseif v4 ~= "Totems" then
                    local AnchorPoint, AnchorPoint_2, Name, Position, Size, Text, v10
                    if v4 == "Tags" or v4 == "Tag" then
                        if v5 then
                            if not v2 or not v2.Flair then
                                v1 = {
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    Size = UDim2.fromScale(1, 1),
                                    Visible = a1.Visible,
                                    ZIndex = a1.ZIndex,
                                    ImageTransparency = ImageTransparency,
                                    ClipsDescendants = a1.ClipsDescendants,
                                    name = v5,
                                }
                                Text = v2.Text or ("@%*"):format(LocalPlayer.DisplayName)
                                v1.text = Text
                                v1.showPlayer = v2.ShowPlayer
                                v1.playing = v6
                                AnchorPoint_2 = v2.AnchorPoint or a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                                v1.tagAnchorPoint = AnchorPoint_2
                                v1.tagPosition = v2.Position
                                v1.tagSize = v2.Size
                                v9 = createElement(TagPreview, v1)
                            else
                                Name = v2.Preview and v2.Preview.Name or v5
                                v10 = {}
                                AnchorPoint = v2.AnchorPoint or a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                                v10.AnchorPoint = AnchorPoint
                                Position = v2.Position or UDim2.fromScale(0.5, 0.17)
                                v10.Position = Position
                                Size = v2.Size or UDim2.fromScale(1, 0.05)
                                v10.Size = Size
                                v10.Visible = a1.Visible
                                v10.ZIndex = a1.ZIndex
                                v10.name = Name
                                v9 = createElement(FlairPreview, v10)
                            end
                        end
                    elseif v4 ~= "Nametags" then
                        if v4 == "Stickers" then
                            if v5 then
                                v9 = createElement(StickerPreview, {
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    Size = UDim2.fromScale(1, 1),
                                    Visible = a1.Visible,
                                    ZIndex = a1.ZIndex,
                                    ImageTransparency = ImageTransparency,
                                    ClipsDescendants = a1.ClipsDescendants,
                                    name = v5,
                                })
                            end
                        elseif v4 ~= "Sticker" then
                            if v4 == "Consumables" then
                                if v5 then
                                    v9 = createElement(ConsumablePreview, {
                                        AnchorPoint = Vector2.new(0.5, 0.5),
                                        Position = UDim2.fromScale(0.5, 0.5),
                                        Size = UDim2.fromScale(1, 1),
                                        Visible = a1.Visible,
                                        ZIndex = a1.ZIndex,
                                        ImageTransparency = ImageTransparency,
                                        ClipsDescendants = a1.ClipsDescendants,
                                        name = v5,
                                    })
                                end
                            elseif v4 == "Consumable" and v5 then
                                v9 = createElement(ConsumablePreview, {
                                    AnchorPoint = Vector2.new(0.5, 0.5),
                                    Position = UDim2.fromScale(0.5, 0.5),
                                    Size = UDim2.fromScale(1, 1),
                                    Visible = a1.Visible,
                                    ZIndex = a1.ZIndex,
                                    ImageTransparency = ImageTransparency,
                                    ClipsDescendants = a1.ClipsDescendants,
                                    name = v5,
                                })
                            end
                        elseif v5 then
                            v9 = createElement(StickerPreview, {
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Size = UDim2.fromScale(1, 1),
                                Visible = a1.Visible,
                                ZIndex = a1.ZIndex,
                                ImageTransparency = ImageTransparency,
                                ClipsDescendants = a1.ClipsDescendants,
                                name = v5,
                            })
                        end
                    elseif v5 then
                        if not v2 or not v2.Flair then
                            v1 = {
                                AnchorPoint = Vector2.new(0.5, 0.5),
                                Position = UDim2.fromScale(0.5, 0.5),
                                Size = UDim2.fromScale(1, 1),
                                Visible = a1.Visible,
                                ZIndex = a1.ZIndex,
                                ImageTransparency = ImageTransparency,
                                ClipsDescendants = a1.ClipsDescendants,
                                name = v5,
                            }
                            Text = v2.Text or ("@%*"):format(LocalPlayer.DisplayName)
                            v1.text = Text
                            v1.showPlayer = v2.ShowPlayer
                            v1.playing = v6
                            AnchorPoint_2 = v2.AnchorPoint or a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                            v1.tagAnchorPoint = AnchorPoint_2
                            v1.tagPosition = v2.Position
                            v1.tagSize = v2.Size
                            v9 = createElement(TagPreview, v1)
                        else
                            Name = v2.Preview and v2.Preview.Name or v5
                            v10 = {}
                            AnchorPoint = v2.AnchorPoint or a1.Flat and Vector2.new(0.5, 0) or Vector2.new(0.5, 0.5)
                            v10.AnchorPoint = AnchorPoint
                            Position = v2.Position or UDim2.fromScale(0.5, 0.17)
                            v10.Position = Position
                            Size = v2.Size or UDim2.fromScale(1, 0.05)
                            v10.Size = Size
                            v10.Visible = a1.Visible
                            v10.ZIndex = a1.ZIndex
                            v10.name = Name
                            v9 = createElement(FlairPreview, v10)
                        end
                    end
                elseif v5 then
                    v9 = createElement(CharmPreview, {
                        AnchorPoint = Vector2.new(0.5, 0.5),
                        Position = UDim2.fromScale(0.5, 0.5),
                        Size = UDim2.fromScale(1, 1),
                        Visible = a1.Visible,
                        ZIndex = a1.ZIndex,
                        ImageTransparency = ImageTransparency,
                        ClipsDescendants = a1.ClipsDescendants,
                        name = v5,
                        flat = a1.Flat ~= false,
                        cameraOffset = a1.CameraOffset,
                        preview = v7,
                        shadow = v8,
                        playing = v6,
                    })
                end
            elseif v5 then
                v9 = createElement(EmotePreview, {
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    Position = UDim2.fromScale(0.5, 0.5),
                    Size = UDim2.fromScale(1, 1),
                    Visible = a1.Visible,
                    ZIndex = a1.ZIndex,
                    ImageTransparency = ImageTransparency,
                    ClipsDescendants = a1.ClipsDescendants,
                    name = v5,
                    cameraOffset = a1.CameraOffset,
                    playing = v6,
                    shadow = v8,
                })
            end
        elseif v5 then
            v9 = createElement(CratePreview, {
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
                Visible = a1.Visible,
                ZIndex = a1.ZIndex,
                ImageTransparency = ImageTransparency,
                ClipsDescendants = a1.ClipsDescendants,
                name = v5,
                icon = a1.Icon,
            })
        end
    elseif v5 then
        v1 = {
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            Visible = a1.Visible,
            ZIndex = a1.ZIndex,
            ImageTransparency = ImageTransparency,
            ClipsDescendants = a1.ClipsDescendants,
            tower = v5,
        }
        Skin = v2 and v2.Skin
        v1.skin = if Skin == nil then "Default" else tostring(Skin)
        v1.level = v2 and v2.Level
        v1.path = v2 and v2.Path
        v1.flat = a1.Flat == true
        v1.pause = a1.PauseAnimation == true
        v1.animate = a1.IgnoreAnimation ~= true
        v1.cameraOffset = a1.CameraOffset
        v1.preview = v7
        v1.shadow = v8
        v9 = createElement(TowerPreview, v1)
    end
    return createElement("Frame", frameProps(a1), {
        preview = v9,
        children = createElement(React.Fragment, nil, a1.children or {}),
    })
end