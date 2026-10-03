-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.Inventory.InventoryItem
-- Decompile time: 13.50 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharmPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CharmPreview)
local ConsumablePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.ConsumablePreview)
local CratePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.CratePreview)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local CustomSkinRarityComponent = require(ReplicatedStorage.Client.Interfaces.Universal.Components.CustomSkinRarityComponent)
local EmotePreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.EmotePreview)
local FlairPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.FlairPreview)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local RarityColors = require(ReplicatedStorage.Shared.Modules.RarityColors)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local Sift = require(ReplicatedStorage.Packages.Sift)
local Spotlight = require(ReplicatedStorage.Client.Interfaces.Components.Spotlight)
local SpotlightStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.SpotlightStore)
local StickerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.StickerPreview)
local TagPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TagPreview)
local TextMarquee = require(ReplicatedStorage.Client.Interfaces.Universal.Components.TextMarquee)
local TowerPreview = require(ReplicatedStorage.Client.Interfaces.Components.Previews.TowerPreview)
local useAspectRatio = require(ReplicatedStorage.Client.Interfaces.Hooks.useAspectRatio)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useTowers = require(ReplicatedStorage.Client.Interfaces.Hooks.useTowers)
local createElement = React.createElement
return React.memo(function(a1) -- Line: 62
    -- upvalues: useTowers (val), useFontScale (val), useSound (val), RarityColors (val), createElement (val)
    -- upvalues: CustomSkinRarityComponent (val), ReactFlow (val), useAspectRatio (val), React (val), Sift (val)
    -- upvalues: Spotlight (val), SpotlightStore (val), StickerPreview (val), FlairPreview (val), CharmPreview (val)
    -- upvalues: TagPreview (val), EmotePreview (val), ConsumablePreview (val), ImageLabel (val), CratePreview (val)
    -- upvalues: TowerPreview (val), TextMarquee (val), Enum (val)
    local v1
    local v2 = useTowers()[a1.towerName or "Scout"]
    local v3 = v2 and v2.Properties.SkinData[a1.skin or "Default"]
    if not v3 then
        warn("NO SKIN DATA FOR", a1.towerName)
        return
    end
    local v4 = a1.type or "tower"
    local v5 = useFontScale({scale = 1})
    local Click = useSound("Click")
    local forcedRarity = a1.forcedRarity or v3.Rarity
    local v6 = RarityColors[forcedRarity] or RarityColors[1]
    local children = a1.children or {}
    if a1.type == "crate" then
        v5 = v5 * 1.25
    end
    local v7 = {}
    local forcedRarity_2 = a1.forcedRarity or v3.Rarity
    v7.Rarity = forcedRarity_2
    children.Effect = createElement(CustomSkinRarityComponent, v7)
    local v8, u71 = ReactFlow.useTween({
        start = 0.02,
        target = 0.02,
        info = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
    })
    v7 = a1.owned and Color3.new(1, 1, 1) or Color3.fromRGB(83, 83, 83)
    local v9, u88 = ReactFlow.useSpring({start = 0.1, target = 0.1, damper = 0.6, speed = 20})
    local v10 = useAspectRatio()
    local useEffect = React.useEffect
    local v11 = {a1.selected}
    useEffect(function() -- Line: 106 -- upvalues: a1 (val), u88 (val)
        if not a1.selected then
            return
        end
        u88({start = 0.1, target = 0.01})
    end, v11)
    local v12 = v9:map(function(a1) -- Line: 117
        return UDim.new(a1, 0)
    end)
    local v13, u107 = ReactFlow.useSpring({target = 1, start = 1, damper = 0.6, speed = 40})
    local v14, u112 = React.useState(false)
    local v15, u122 = ReactFlow.useTween({
        start = 1,
        target = 1,
        info = TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
    })
    local v16 = React.useRef(nil)
    local useEffect_2 = React.useEffect
    local v17 = {a1.selected}
    useEffect_2(function() -- Line: 138 -- upvalues: a1 (val), u71 (val), u122 (val)
        local u2 = task.spawn(function() -- Line: 139 -- upvalues: a1 (upval), u71 (upval), u122 (upval)
            if not a1.selected then
                u71({target = 0.08})
                u122({target = 1})
                return
            end
            while true do
                u71({target = 0.015})
                u122({target = 0.1})
                task.wait(0.4)
                u71({target = 0.04})
                u122({target = 0.6})
                task.wait(0.4)
            end
        end)
        return function() -- Line: 155 -- upvalues: u2 (val)
            task.cancel(u2)
        end
    end, v17)
    local previewName = a1.previewName or a1.forcedText
    local u154 = ("%*:%*"):format(a1.spotlightPrefix or v4, a1.towerName or previewName)
    local v18 = (Sift.Dictionary.join({
        BackgroundTransparency = 1,
        Selectable = true,
        Size = UDim2.fromOffset(200, 185),
        LayoutOrder = a1.layOutOrder,
        ref = v16,
    }, a1.native or {}))
    local v19 = {}
    local v20 = {}
    local scale = a1.scale or (if not a1.cantAnimate then v13 else 1)
    v20.Scale = scale
    v19.uIScale = createElement("UIScale", v20)
    v19.spotlight = if not a1.disableSpotlight then createElement(Spotlight, {name = u154}) else nil
    v20 = {
        Active = true,
        BackgroundTransparency = 1,
        Selectable = true,
        Size = UDim2.fromScale(1, 1),
    }

    v20[React.Event.Activated] = function() -- Line: 189 -- upvalues: Click (val), a1 (val), SpotlightStore (upval), u154 (val)
        Click()
        a1.onClick(a1.towerName)
        if a1.disableSpotlight then
            return
        end
        SpotlightStore.fire(u154)
    end

    v20[React.Event.MouseButton1Down] = function() -- Line: 200 -- upvalues: u107 (val)
        u107({target = 0.95})
    end

    v20[React.Event.MouseButton1Up] = function() -- Line: 205 -- upvalues: u107 (val)
        u107({target = 1.1})
    end

    v20[React.Event.MouseEnter] = function() -- Line: 210 -- upvalues: a1 (val), u112 (val), u107 (val)
        if a1.onEnter then
            a1.onEnter()
        end
        u112(true)
        u107({target = 1.1})
    end

    v20[React.Event.MouseLeave] = function() -- Line: 219 -- upvalues: a1 (val), u112 (val), u107 (val)
        if a1.onLeave then
            a1.onLeave()
        end
        u112(false)
        u107({target = 1})
    end

    local v21 = {}
    local darkened = a1.darkened and createElement("Frame", {
        BackgroundTransparency = 0.3,
        ZIndex = 100000,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.5),
    })
    v21.darkeningFrame = darkened
    local v22 = false
    if v4 == "stickers" then
        v22 = createElement(StickerPreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = v7,
            name = previewName,
            playing = v14,
        })
    end
    v21.stickerPreview = v22
    v22 = false
    if v4 == "flairs" then
        v22 = createElement(FlairPreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = v7,
            name = previewName,
            playing = v14,
        })
    end
    v21.flairPreview = v22
    v22 = false
    if v4 == "totems" then
        v22 = createElement(CharmPreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 1.1),
            ImageColor3 = v7,
            name = previewName,
            playing = v14,
        })
    end
    v21.totemPreview = v22
    v22 = false
    if v4 == "tags" then
        v22 = createElement(TagPreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.1, 1.1),
            ImageColor3 = v7,
            name = previewName,
            playing = v14,
        })
    end
    v21.tagPreview = v22
    v22 = false
    if v4 == "emotes" then
        v22 = createElement(EmotePreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.2, 1.2),
            ImageColor3 = v7,
            name = previewName,
            playing = v14,
        })
    end
    v21.emoteViewport = v22
    v22 = false
    if v4 == "consumable" then
        v22 = createElement(ConsumablePreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.2, 1.2),
            ImageColor3 = v7,
            name = previewName,
        })
    end
    v21.consumableIcon = v22
    local forcedIcon = a1.forcedIcon and createElement(ImageLabel, {
        BackgroundTransparency = 1,
        ZIndex = 3,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Image = a1.forcedIcon,
        ImageColor3 = v7,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.8, 0.8),
        ScaleType = Enum.ScaleType.Fit,
    })
    v21.forcedIconLabel = forcedIcon
    v22 = false
    if v4 == "crate" then
        v22 = createElement(CratePreview, {
            ZIndex = 3,
            ClipsDescendants = true,
            icon = false,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
            ImageColor3 = v7,
            name = previewName,
        })
    end
    v21.crateIcon = v22
    local towerName_2 = a1.towerName
    if towerName_2 then
        v1 = {
            pause = true,
            animate = true,
            shadow = false,
            icon = true,
            ZIndex = 3,
            ClipsDescendants = true,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1.2, 1.2),
        }
        v1.ImageColor3 = a1.darkened and Color3.fromRGB(150, 150, 150) or v7
        v1.tower = a1.towerName
        v1.skin = a1.skin or "Default"
        towerName_2 = createElement(TowerPreview, v1, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    end
    v21.towerViewport = towerName_2
    v1 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ZIndex = 999999,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0.18, 0.18),
    }
    local equiped = a1.equiped or not a1.owned
    v1.Visible = equiped
    v21.topThing = createElement("Frame", v1, {
        icon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Image = if not a1.equiped then "rbxassetid://8418293221" else "rbxassetid://8418292821",
            Position = UDim2.fromScale(0.5, 0.5),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromScale(1, 1),
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.15, 0)}),
        aspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1}),
    })
    v21.background = createElement("Frame", {
        BorderSizePixel = 0,
        BackgroundTransparency = 0.8,
        ZIndex = 999,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(0, 0, 0),
        Visible = not a1.owned,
    })
    v21.children = createElement(React.Fragment, nil, children)
    local towerName_3 = a1.towerName and createElement(TowerPreview, {
        pause = true,
        ImageTransparency = 0.3,
        animate = true,
        shadow = false,
        icon = true,
        ZIndex = 3,
        ClipsDescendants = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.52, 0.52),
        Size = UDim2.fromScale(1.2, 1.2),
        ImageColor3 = Color3.new(0, 0, 0),
        tower = a1.towerName,
        skin = a1.skin or "Default",
    }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint", {AspectRatio = 1})})
    v21.towerViewportShadow = towerName_3
    v21.glowSelected = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = "rbxassetid://102413898432149",
        ZIndex = -12,
        AnchorPoint = Vector2.new(0.5, 0.5),
        ImageColor3 = Color3.fromRGB(255, 157, 0),
        ImageTransparency = v15,
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(1.4, 1.4),
        SliceCenter = Rect.new(256, 256, 512, 512),
    })
    v21.selectedFrame = createElement("Frame", {BackgroundTransparency = 1, ZIndex = 99999, Size = UDim2.fromScale(1, 1)}, {
        stroke = createElement("UIStroke", {
            Color = Color3.fromRGB(255, 225, 0),
            Thickness = v8,
            Enabled = a1.selected,
            BorderOffset = v12,
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        iCorner = createElement("UICorner", {CornerRadius = UDim.new(0.0123457, 0)}),
    })
    v21.bG = createElement("Frame", {BackgroundColor3 = Color3.new(1, 1, 1), Size = UDim2.fromScale(1, 1)}, {
        accent = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(0.844757, 0.884116),
        }, {
            uIStroke = createElement("UIStroke", {
                Thickness = 0.02,
                Transparency = 0.5,
                Color = v6:Lerp(Color3.new(0, 0, 0), 0.3),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        }),
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, v6:Lerp(Color3.new(0, 0, 0), 0.3)),
                ColorSequenceKeypoint.new(1, Color3.new()),
            }),
        }),
        uIStroke = createElement("UIStroke", {
            Thickness = 0.02,
            Color = v6:Lerp(Color3.new(1, 1, 1), 0.1),
            StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
        }),
        uICorner = createElement("UICorner", {CornerRadius = UDim.new(0.0123457, 0)}),
    })
    v1 = {
        BackgroundTransparency = 1,
        Image = "rbxassetid://130886444201134",
        AnchorPoint = Vector2.new(0.5, 0.5),
    }
    local v23 = a1.greenColor and Color3.new(0, 1, 0.3) or Color3.fromRGB(255, 255, 255)
    v1.ImageColor3 = v23
    v1.Position = UDim2.fromScale(0.114543, 0.0832109)
    v1.Size = UDim2.fromScale(0.178881, 0.129949)
    v1.ScaleType = Enum.ScaleType.Fit
    v21.accent = createElement("ImageLabel", v1)
    local weightAmount = a1.weightAmount
    if weightAmount then
        v1 = {
            BackgroundTransparency = 1,
            ZIndex = 999999,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0.5, 0.9),
            Size = UDim2.fromScale(0, 1),
        }
        v23 = a1.weightAmount and ("%*"):format((string.format("%.2f%%", a1.weightAmount))) or ""
        v1.Text = v23
        v1.TextColor3 = Color3.new(1, 1, 1)
        v1.TextSize = math.round(2 * v5)
        v1.Font = Enum.Font.GothamBold
        v1.AutomaticSize = Enum.AutomaticSize.X
        weightAmount = createElement("TextLabel", v1, {
            uIStroke = createElement("UIStroke", {
                Thickness = 0.16,
                Color = Color3.fromRGB(31, 31, 31),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        })
    end
    v21.weightAmount = weightAmount
    local owned = a1.owned
    if owned then
        v1 = {
            BackgroundTransparency = 1,
            ZIndex = 9999,
            AnchorPoint = Vector2.new(1, 0.5),
            Position = UDim2.fromScale(0.9, 0.9),
            Size = UDim2.fromScale(0, 1),
        }
        v23 = a1.ownedAmount and ("x%*"):format((tostring(a1.ownedAmount))) or ""
        v1.Text = v23
        v1.TextColor3 = Color3.new(1, 1, 1)
        v1.TextSize = math.round(1.6 * v5)
        v1.Font = Enum.Font.GothamBold
        v1.AutomaticSize = Enum.AutomaticSize.X
        v1.TextXAlignment = Enum.TextXAlignment.Right
        owned = createElement("TextLabel", v1, {
            uIStroke = createElement("UIStroke", {
                Thickness = 0.16,
                Color = Color3.fromRGB(31, 31, 31),
                StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize,
            }),
        })
    end
    v21.amountLeft = owned
    v21.uIAspectRatioConstraint = not a1.noAspect and createElement("UIAspectRatioConstraint", {AspectRatio = 0.78})
    v22 = not a1.weightAmount
    if v22 then
        v1 = {
            BackgroundTransparency = 1,
            TextWrapped = true,
            ZIndex = 5,
            AnchorPoint = Vector2.new(0.5, if not a1.ownedAmount then 1 else 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        }
        v23 = if not a1.ownedAmount then UDim2.fromScale(0.5, 0.96) else UDim2.fromScale(0.5, 0.04)
        v1.Position = v23
        v1.Size = UDim2.fromScale(0.9, 0.5)
        local forcedText = a1.forcedText or v3 and v3.DisplayName or v2 and v2.Properties.DisplayName or a1.towerName
        v1.Text = forcedText
        v1.TextColor3 = Color3.new(1, 1, 1)
        v1.TextYAlignment = a1.ownedAmount and Enum.TextYAlignment.Top or Enum.TextYAlignment.Bottom
        v1.TextSize = math.round(1.05 * v5) / v10
        v23 = false
        if a1.type ~= "tags" then
            v23 = a1.type ~= "flairs"
        end
        v1.Visible = v23
        v1.padding = UDim.new(0, 5)
        v1.hoverRef = v16
        v22 = createElement(TextMarquee, v1, {
            uIStroke = createElement("UIStroke", {Thickness = 0.16, StrokeSizingMode = Enum.StrokeSizingMode.ScaledSize}),
        })
    end
    v21.displayName = v22
    v19.main = createElement("ImageButton", v20, v21)
    return createElement("Frame", v18, v19)
end)