-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.NewMatchmaking.SquadSizeWindow
-- Decompile time: 20.70 ms

local GuiService = game:GetService("GuiService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local ActionButton = require(ReplicatedStorage.Client.Interfaces.Components.ActionButton)
local ImageLabel = require(ReplicatedStorage.Client.Interfaces.Components.ImageLabel)
local MatchmakingCard = require(script.Parent.MatchmakingCard)
local MatchmakingModel = require(script.Parent.MatchmakingModel)
local MatchmakingSquadArtwork = require(script.Parent.MatchmakingSquadArtwork)
local MatchmakingStyle = require(script.Parent.MatchmakingStyle)
local RadioCloseButton = require(ReplicatedStorage.Client.Interfaces.Game.Components.Radio.RadioCloseButton)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local useFontScale = require(ReplicatedStorage.Client.Interfaces.Hooks.useFontScale)
local createElement = React.createElement
local memo = React.memo
local useRef = React.useRef
local u73 = UDim2.fromScale(0.5, 0.03)
local u77 = UDim2.fromScale(0.5, 0.1)
local u81 = UDim2.fromScale(0.5, 0.17)
local u85 = UDim2.fromScale(0.5, 0.075)
local u89 = UDim2.fromScale(0.5, 0.29)
local u93 = UDim2.fromScale(0.76, 0.55)
local u97 = UDim2.fromScale(0.49, 0.49)
local u101 = UDim2.fromScale(1, 1.025)
local u105 = UDim2.fromScale(0.3, 0.125)
local success = MatchmakingStyle.colors.success

local function isPlayerCountAvailable(a1, a2, a3) -- Line: 52 -- types: a1: number, a2: number, a3: number
    local v1 = false
    if a2 <= a1 then
        v1 = a1 <= a3
    end
    return v1
end

local function getCardLayout(a1, a2) -- Line: 60 -- upvalues: u97 (val) -- types: a1: number, a2: number
    if a2 == 1 then
        return (UDim2.fromScale(0.255, 0.255)), u97
    end
    if a2 == 2 then
        local fromScale = UDim2.fromScale
        return (fromScale(if a1 ~= 1 then 0.51 else 0, 0.255)), u97
    end
    if a2 == 3 and a1 == 3 then
        return (UDim2.fromScale(0, 0.51)), UDim2.fromScale(1, 0.49)
    end
    local v1 = a1 - 1
    if a2 > 4 then
        return (UDim2.fromScale(v1 % 2 * 0.51, math.floor(v1 / 2) * 0.34)), UDim2.fromScale(0.49, 0.32)
    end
    return (UDim2.fromScale(v1 % 2 * 0.51, math.floor(v1 / 2) * 0.51)), u97
end

local function configureSelectionNavigation(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11) -- Line: 77
    -- upvalues: GuiService (val)
    local playerCount, v1, v2
    local current = a1.current
    local current_2 = a2.current
    local current_3 = a3.current
    local current_4 = a4.current
    local current_5 = a5.current
    local current_6 = a6.current
    local current_7 = a7.current
    local current_8 = a8.current
    if not current then
        return nil
    end
    local v3 = {}
    for i, j in {current_3, current_4, current_5, current_6, current_7, current_8} do
        if j and i <= a10 then
            table.insert(v3, {button = j, playerCount = i})
        end
    end
    local v4 = {}
    local v5 = {}
    local v6 = nil
    local v7 = nil
    local v8, v9, v10 = a10, a11, a9
    for k, n in v3, v6, v7 do
        playerCount = n.playerCount
        v1 = false
        if v10 <= playerCount then
            v1 = playerCount <= v8
        end
        if v1 then
            table.insert(v4, n.button)
            v5[n.playerCount] = n.button
        end
    end
    v6 = nil
    v7 = nil
    for m, i5 in v5, v6, v7 do
        if v8 == 1 then
            i5.NextSelectionUp = current_2
            i5.NextSelectionDown = current
        elseif v8 == 2 then
            v2 = if not (m == 1) then v5[1] else nil
            i5.NextSelectionLeft = v2
            v2 = if not v1 then nil else v5[2]
            i5.NextSelectionRight = v2
            i5.NextSelectionUp = current_2
            i5.NextSelectionDown = current
        elseif v8 ~= 3 or m ~= 3 then
            v2 = if not (m % 2 == 1) then v5[m - 1] else nil
            i5.NextSelectionLeft = v2
            v2 = if not v1 then nil else v5[m + 1]
            i5.NextSelectionRight = v2
            i5.NextSelectionUp = v5[m - 2] or current_2
            v2 = if v8 ~= 3 then v5[m + 2] or current else if m ~= 2 then v5[m + 2] or current else v5[3] or current
            i5.NextSelectionDown = v2
        else
            v1 = v5[1] or v5[2] or current_2
            i5.NextSelectionUp = v1
            i5.NextSelectionDown = current
        end
    end
    local u61 = {current}
    for i6, i7 in v3 do
        table.insert(u61, i7.button)
    end
    if current_2 then
        table.insert(u61, current_2)
    end
    local u86 = v4[1] or current
    current.NextSelectionUp = v4[#v4] or current_2
    if current_2 then
        current_2.NextSelectionDown = u86
    end
    local SelectedObject = GuiService.SelectedObject
    local v11 = false
    for i8, i9 in v3 do
        if SelectedObject == i9.button then
            v11 = table.find(v4, SelectedObject) == nil
            break
        end
    end
    local u117 = false
    if v9 or v11 then
        task.defer(function() -- Line: 179 -- upvalues: u117 (ref), u86 (val), GuiService (upval)
            if not u117 and u86.Parent then
                GuiService.SelectedObject = u86
            end
        end)
    end
    return function() -- Line: 186 -- upvalues: u117 (ref), u61 (val)
        u117 = true
        for i, j in u61 do
            j.NextSelectionUp = nil
            j.NextSelectionDown = nil
            j.NextSelectionLeft = nil
            j.NextSelectionRight = nil
        end
    end
end

return memo(function(a1) -- Line: 197
    -- upvalues: useRef (val), useFontScale (val), MatchmakingStyle (val), React (val)
    -- upvalues: configureSelectionNavigation (val), MatchmakingModel (val), getCardLayout (val), createElement (val)
    -- upvalues: MatchmakingCard (val), MatchmakingSquadArtwork (val), RadioCloseButton (val), u73 (val), u77 (val)
    -- upvalues: TextLabel (val), u81 (val), u85 (val), ImageLabel (val), success (val), u89 (val), u93 (val)
    -- upvalues: ActionButton (val), u101 (val), u105 (val)
    local v1, v2, v3, v4, v5, v6, v7, v8, v9
    local u465 = useRef(nil)
    local u469 = useRef(nil)
    local u471 = useRef(nil)
    local u473 = useRef(nil)
    local u475 = useRef(nil)
    local u477 = useRef(nil)
    local u479 = useRef(nil)
    local u481 = useRef(nil)
    local u485 = math.max(math.floor(a1.currentPartySize or 1), 1)
    local u487 = math.min(math.clamp(math.floor(a1.maxPlayers or 4), 1, 6), (math.clamp(math.floor(a1.modeEntry.maxPlayers or 4), 1, 6)))
    local v10 = useFontScale(MatchmakingStyle.getFontSize("header1", false))
    local v11 = useFontScale(MatchmakingStyle.getFontSize("subheader1", false))
    local v12 = useFontScale(MatchmakingStyle.getFontSize("header3", false))
    local v13 = useFontScale(MatchmakingStyle.getFontSize("button", false))
    local useEffect = React.useEffect
    local v14 = {u485, u487, a1.focusFirstCard}
    useEffect(function() -- Line: 217
        -- upvalues: configureSelectionNavigation (upval), u465 (val), u469 (val), u471 (val), u473 (val), u475 (val)
        -- upvalues: u477 (val), u479 (val), u481 (val), u485 (val), u487 (val), a1 (val)
        return (configureSelectionNavigation(u465, u469, u471, u473, u475, u477, u479, u481, u485, u487, a1.focusFirstCard))
    end, v14)
    local v15 = {}
    v14 = nil
    local v16 = nil
    for i, j in MatchmakingModel.SQUAD_SIZE_OPTIONS, v14, v16 do
        if not (u487 < j.playerCount) then
            v2 = if not (j.playerCount < u485) then nil else "Party size too big."
            v3, v4 = getCardLayout(j.playerCount, u487)
            v5 = ("SquadSize_%*"):format(j.id)
            v6 = {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = false,
                Name = ("SquadSize_%*"):format(j.title),
                Position = v3,
                Size = v4,
            }
            v7 = {}
            v8 = {
                compact = true,
                denseChin = true,
                revealed = true,
                artwork = createElement(MatchmakingSquadArtwork, {backgroundImage = j.backgroundImage, foregroundImage = j.foregroundImage}),
            }
            v9 = if j.id ~= "solo" then if j.id ~= "duo" then if j.id ~= "trio" then if j.id ~= "quad" then if j.id ~= "five" then u481 else u479 else u477 else u475 else u473 else u471
            v8.buttonRef = v9
            v8.image = j.backgroundImage
            v8.locked = v1
            v8.lockReason = v2

            function v8.onActivated() -- Line: 269 -- upvalues: a1 (val), j (val)
                if a1.onActivated then
                    a1.onActivated()
                end
                a1.onSquadSizeActivated(j.id)
            end

            v8.parallaxSensitivity = MatchmakingStyle.motion.parallaxSensitivity
            v8.revealOrder = i
            v8.selected = not v1 and a1.selectedSizeId == j.id
            v8.size = UDim2.fromScale(1, 1)
            v8.subtitle = j.subtitle
            v8.title = j.title
            v7.Card = createElement(MatchmakingCard, v8)
            v15[v5] = (createElement("Frame", v6, v7))
        end
    end
    v16 = {
        Active = true,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Name = "SquadSizeWindow",
        SelectionGroup = true,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Size = UDim2.fromScale(0.7, 1),
        Position = UDim2.fromScale(0.5, 0.5),
    }
    local v17 = {}
    local onClose = a1.onClose and createElement(RadioCloseButton, {
        ZIndex = 30,
        AnchorPoint = Vector2.new(1, 0),
        ButtonRef = u469,
        Position = UDim2.fromScale(0.9, 0.025),
        Size = UDim2.fromOffset(44, 44),
        onActivated = function() -- Line: 303 -- upvalues: a1 (val)
            if a1.onActivated then
                a1.onActivated()
            end
            if a1.onClose then
                a1.onClose()
            end
        end,
    })
    v17.Close = onClose
    v17.Header = createElement("Frame", {
        BackgroundTransparency = 1,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = u73,
        Size = u77,
    }, {
        Title = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Black",
            Text = "Choose a Squad Size",
            TextScaled = false,
            ZIndex = 6,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0),
            Size = UDim2.fromScale(0.84, 0.62),
            TextSize = v10,
            TextTruncate = Enum.TextTruncate.AtEnd,
        }),
        Subtitle = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "SemiBold",
            Text = "Select the maximum number of players for this run.",
            TextScaled = false,
            ZIndex = 6,
            AnchorPoint = Vector2.new(0.5, 0),
            Position = UDim2.fromScale(0.5, 0.64),
            Size = UDim2.fromScale(0.84, 0.28),
            TextColor3 = MatchmakingStyle.colors.textMuted,
            TextSize = v11,
            TextTruncate = Enum.TextTruncate.AtEnd,
        }),
    })
    v17.SelectedMode = createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = MatchmakingStyle.colors.surface,
        BackgroundTransparency = MatchmakingStyle.transparency.surface,
        Position = u81,
        Size = u85,
    }, {
        Corner = createElement("UICorner", {CornerRadius = MatchmakingStyle.cornerRadius.panel}),
        Stroke = createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
            Color = MatchmakingStyle.colors.borderMuted,
            Thickness = MatchmakingStyle.strokeThickness.thin,
            Transparency = MatchmakingStyle.transparency.border,
        }),
        Icon = createElement(ImageLabel, {
            BackgroundTransparency = 1,
            Image = 17275148743,
            ZIndex = 6,
            disableSpinner = true,
            AnchorPoint = Vector2.new(0, 0.5),
            ImageColor3 = success,
            Position = UDim2.new(0, 18, 0.5, 0),
            ScaleType = Enum.ScaleType.Fit,
            Size = UDim2.fromOffset(28, 28),
        }),
        SelectedModeLabel = createElement(TextLabel, {
            BackgroundTransparency = 1,
            FontWeight = "Bold",
            TextScaled = false,
            ZIndex = 7,
            AnchorPoint = Vector2.new(0, 0.5),
            Position = UDim2.new(0, 58, 0.5, 0),
            Size = UDim2.new(1, -76, 0.55, 0),
            Text = ("Selected Gamemode: %*"):format(a1.modeEntry.title),
            TextColor3 = MatchmakingStyle.colors.textStrong,
            TextSize = v12,
            TextTruncate = Enum.TextTruncate.AtEnd,
            TextXAlignment = Enum.TextXAlignment.Left,
        }),
    })
    v17.GridArea = createElement("Frame", {
        BackgroundTransparency = 1,
        SelectionGroup = true,
        ZIndex = 5,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = u89,
        Size = u93,
    }, {
        AspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 1.55, AspectType = Enum.AspectType.FitWithinMaxSize}),
        Cards = createElement("Frame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            ZIndex = 5,
            Size = UDim2.fromScale(1, 1),
        }, v15),
        Back = createElement(ActionButton, {
            Label = "Back",
            TextSizeIsScaled = true,
            ZIndex = 8,
            AnchorPoint = Vector2.new(1, 0),
            BackgroundColor3 = Color3.fromRGB(116, 120, 128),
            ButtonRef = u465,
            OnActivated = function() -- Line: 412 -- upvalues: a1 (val)
                if a1.onActivated then
                    a1.onActivated()
                end
                a1.onBack()
            end,
            Position = u101,
            Size = u105,
            StrokeColor = Color3.fromRGB(78, 81, 88),
            TextSize = v13,
        }),
    })
    return createElement("Frame", v16, v17)
end)