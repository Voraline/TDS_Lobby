-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Views.TopBar
-- Decompile time: 9.12 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local LegacyInterface = ReplicatedStorage.Client.Interfaces.LegacyInterface
local TopBar_2 = ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar
local Value = workspace:WaitForChild("Type").Value
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local EventDirectorStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.EventDirectorStore)
local HudButton = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.HudButton)
local Icons = require(LegacyInterface.Icons)
local PlaytimeRewardData = require(ReplicatedStorage.Shared.Modules.PlaytimeRewardData)
local React = require(ReplicatedStorage.Shared.UI.React)
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local ViewController = require(LegacyInterface.Controllers.ViewController)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
require(ReplicatedStorage.Client.Interfaces.Hooks.useKeyBinding)
local u76 = nil
local u88 = nil
if Value == "Game" then
    u76 = require(ReplicatedStorage.Client.Controllers.Game.CameraModeController)
elseif Value == "Lobby" then
    u88 = require(TopBar_2.TopBarGiftBox)
end
local useAtomSelector = require(Hooks.useAtomSelector)
local useCache = require(Hooks.useCache)
local useFFlag = require(Hooks.useFFlag)
local useMediaQuery = require(Hooks.useMediaQuery)
local useView = require(Hooks.useView)
local useViewEnabled = require(Hooks.useViewEnabled)
local TopBar = require(TopBar_2.TopBar)
local TopBarCurrencies = require(TopBar_2.TopBarCurrencies)
local createElement = React.createElement
local useCallback = React.useCallback
local useState = React.useState
local useEffect = React.useEffect
local memo = React.memo
local useMemo = React.useMemo
local u122 = {labelStrokeThickness = 2, large = false}
u122.iconPosition = UDim2.fromScale(0.5, 0.5)
u122.iconSize = UDim2.fromScale(0.8, 0.8)
u122.phoneIconPosition = UDim2.fromScale(0.5, 0.5)
u122.phoneIconSize = UDim2.fromScale(0.9, 0.9)
u122.color = Color3.fromRGB(0, 118, 255)
u122.strokeColor = Color3.fromRGB(137, 191, 255)
local u158 = memo(function(a1) -- Line: 62
    -- upvalues: useState (val), useGameStateValue (val), useAtomSelector (val), EventDirectorStore (val)
    -- upvalues: useFFlag (val), useCallback (val), useEffect (val), createElement (val), TopBar (val)
    -- upvalues: TopBarCurrencies (val), HudButton (val), Icons (val), u122 (val), ViewController (val), u76 (ref)
    -- upvalues: Enum (val)
    local v1, u4 = useState(false)
    local v2 = useGameStateValue("GameStarted", false)
    local v3 = useGameStateValue("GameMode", "")
    local v4 = v3 == "PVP"
    local v5 = v3 == "Tutorial"
    local v6 = useAtomSelector(EventDirectorStore.getState, function(a1) -- Line: 71
        return a1.available
    end)
    local v7 = useFFlag("event_director.enabled", false, {enabled = v6})
    if not _G.Music then
        _G.Music = {}
    end
    local Music = _G.Music
    Music.Enable = useCallback(function() -- Line: 82 -- upvalues: u4 (val)
        u4(true)
    end, {})
    local Music_2 = _G.Music
    Music_2.Disable = useCallback(function() -- Line: 86 -- upvalues: u4 (val)
        u4(false)
    end, {})
    useEffect(function() -- Line: 90
        return function() -- Line: 91
            _G.Music = nil
        end
    end, {})
    local v8 = {currencies = createElement(TopBarCurrencies)}
    v8.eventDirector = if not v6 or not v7 or v5 then nil else createElement(HudButton, {
        LayoutOrder = 2,
        name = "EventDirector",
        text = "Director",
        icon = Icons.Book,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 115 -- upvalues: EventDirectorStore (upval)
            EventDirectorStore.toggle()
        end,
    })
    v8.settings = if v5 then nil else createElement(HudButton, {
        LayoutOrder = 4,
        name = "Settings",
        text = "Settings",
        icon = Icons.Settings,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 135 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "Settings" then "Settings" else "Hotbar")
        end,
    })
    v8.music = createElement(HudButton, {
        LayoutOrder = 3,
        name = "Music",
        text = "Music",
        Visible = v1,
        icon = Icons.Music,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 157 -- upvalues: ViewController (upval)
            ViewController:setView("Music")
        end,
    })
    v8.birdsEye = if not v2 or not v4 then nil else createElement(HudButton, {
        LayoutOrder = 3,
        name = "BirdsEye",
        text = "Birds Eye",
        icon = "rbxassetid://75563055529313",
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 176 -- upvalues: u76 (upval), Enum (upval)
            u76.toggleMode(Enum.CameraMode.BirdsEye)
        end,
    })
    return createElement(TopBar, {}, v8)
end)
local u164 = memo(function(a1) -- Line: 184
    -- upvalues: useView (val), useMediaQuery (val), useViewEnabled (val), useFFlag (val), useAtomSelector (val)
    -- upvalues: EventDirectorStore (val), useState (val), useCache (val), useMemo (val), PlaytimeRewardData (val)
    -- upvalues: createElement (val), u88 (ref), SharedGameConstants (val), TopBar (val), HudButton (val), u122 (val)
    -- upvalues: ViewController (val), Icons (val), React (val)
    local v1 = useView()
    local v2 = not useMediaQuery("large")
    local Crate = useViewEnabled("Crate")
    local PromptMatchmaking = useViewEnabled("PromptMatchmaking")
    local Shop = useViewEnabled("Shop")
    local ShopFocus = useViewEnabled("ShopFocus")
    local v3 = string.match(v1, "^GiftProduct:%d+$") ~= nil
    local v4 = Crate or v3 and v2 or Shop or ShopFocus or PromptMatchmaking
    local v5 = useFFlag("catalog.enabled", false)
    local v6 = useAtomSelector(EventDirectorStore.getState, function(a1) -- Line: 199
        return a1.available
    end)
    local v7 = useFFlag("event_director.enabled", false, {enabled = v6})
    local v8, v9 = useState(false)
    local u59, u60 = useState(false)
    local u65 = useCache("PlaytimeRewards", {TimePlayedSeconds = 0, Claimed = {}})

    local function formatTime(a1) -- Line: 215 -- types: a1: number
        if type(a1) == "number" and not (a1 < 0) then
            return string.format("%02d:%02d", math.floor(a1 / 60), a1 % 60)
        end
        return "00:00"
    end

    local v10 = {u65}
    local v11 = useMemo(function() -- Line: 224 -- upvalues: u65 (val), PlaytimeRewardData (upval)
        local v1 = u65.TimePlayedSeconds or 0
        local Claimed = u65.Claimed or {}
        local v2 = 0
        local v3 = nil
        local v4 = PlaytimeRewardData
        local v5 = nil
        local v6 = nil
        for i, j in v4, v5, v6 do
            if j.seconds <= v1 and not Claimed[i] then
                v2 = v2 + 1
            end
            if not Claimed[i] and not v3 then
                v3 = j
            end
        end
        if v2 > 0 then
            v4 = "Claim!"
        elseif not v3 then
            v4 = "Rewards"
        else
            v5 = math.max(0, v3.seconds - v1)
            v4 = if type(v5) ~= "number" then "00:00" else if not (v5 < 0) then string.format("%02d:%02d", math.floor(v5 / 60), v5 % 60) else "00:00"
        end
        return {text = v4, count = v2}
    end, v10)
    local v12 = createElement(u88, {setButtonVisible = v9, giftBoxOpen = u59 and not v4}, {})
    if not SharedGameConstants.IS_PROD then
        v10 = string.split(useFFlag("catalog.whitelist_places", ""), ",")
        v5 = v5 and table.find(v10, (tostring(game.GameId)))
    end
    local v13 = {
        catalog = v5 and createElement(HudButton, {
            LayoutOrder = 3,
            name = "Catalog",
            text = "Catalog",
            icon = 131454203983449,
            iconPosition = u122.iconPosition,
            iconSize = u122.iconSize,
            phoneIconPosition = u122.phoneIconPosition,
            phoneIconSize = u122.phoneIconSize,
            color = u122.color,
            strokeColor = u122.strokeColor,
            labelStrokeThickness = u122.labelStrokeThickness,
            large = u122.large,
            clicked = function() -- Line: 281 -- upvalues: ViewController (upval)
                ViewController:setView(if ViewController:getCurrentView() ~= "Catalog" then "Catalog" else "Hotbar")
            end,
        }),
    }
    v13.eventDirector = if not v6 or not v7 then nil else createElement(HudButton, {
        LayoutOrder = 5,
        name = "EventDirector",
        text = "Director",
        icon = Icons.Book,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 302 -- upvalues: EventDirectorStore (upval)
            EventDirectorStore.toggle()
        end,
    })
    v13.settings = createElement(HudButton, {
        LayoutOrder = 6,
        name = "Settings",
        text = "Settings",
        icon = Icons.Settings,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 321 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "Settings" then "Settings" else "Hotbar")
        end,
    })
    v13.news = createElement(HudButton, {
        LayoutOrder = 4,
        name = "News",
        text = "News",
        icon = Icons.News,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 341 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "News" then "News" else "Hotbar")
        end,
    })
    v13.login = createElement(HudButton, {
        LayoutOrder = 3,
        name = "Login",
        text = "Login",
        icon = Icons.Login,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 361 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "Login" then "Login" else "Hotbar")
        end,
    })
    v13.gifts = createElement(HudButton, {
        LayoutOrder = 2,
        name = "GiftClaim",
        text = "Gift Claim",
        icon = 10975466152,
        Visible = v8,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 382 -- upvalues: u60 (val), u59 (val)
            u60(not u59)
        end,
    })
    v13.codes = createElement(HudButton, {
        LayoutOrder = 1,
        name = "Codes",
        text = "Codes",
        icon = 9438462043,
        iconPosition = u122.iconPosition,
        iconSize = u122.iconSize,
        phoneIconPosition = u122.phoneIconPosition,
        phoneIconSize = u122.phoneIconSize,
        color = u122.color,
        strokeColor = u122.strokeColor,
        labelStrokeThickness = u122.labelStrokeThickness,
        large = u122.large,
        clicked = function() -- Line: 400 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "Codes" then "Codes" else "Hotbar")
        end,
    })
    v13.rewards = createElement(HudButton, {
        name = "Rewards",
        labelStrokeThickness = 2,
        large = false,
        LayoutOrder = -3,
        icon = Icons.Rewards,
        iconPosition = UDim2.fromScale(0.5, 0.5),
        iconSize = UDim2.fromScale(0.8, 0.8),
        phoneIconPosition = UDim2.fromScale(0.5, 0.5),
        phoneIconSize = UDim2.fromScale(0.9, 0.9),
        color = Color3.fromRGB(255, 0, 0),
        strokeColor = Color3.fromRGB(255, 135, 135),
        text = v11.text,
        notifications = if not (0 < v11.count) then nil else v11.count,
        clicked = function() -- Line: 421 -- upvalues: ViewController (upval)
            ViewController:setView(if ViewController:getCurrentView() ~= "PlaytimeRewards" then "PlaytimeRewards" else "Hotbar")
        end,
    })
    return React.createElement(React.Fragment, {}, {topBar = createElement(TopBar, {Visible = not v4}, v13), giftBox = v12})
end)
return (memo(function() -- Line: 436 -- upvalues: useViewEnabled (val), createElement (val), Value (val), u164 (val), u158 (val)
    return not useViewEnabled("Inventory") and createElement(not (Value ~= "Lobby") and u164 or u158)
end))