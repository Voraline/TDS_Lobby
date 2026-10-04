-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.Shop
-- Decompile time: 7.41 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Hooks = ReplicatedStorage.Client.Interfaces.Hooks
local InventoryContext = require(ReplicatedStorage.Client.Interfaces.Contexts.InventoryContext)
local Loading = require(ReplicatedStorage.Client.Interfaces.Universal.Views.Loading)
local Notification = require(ReplicatedStorage.Client.Modules.Universal.Interface.Components.Notification)
local React = require(ReplicatedStorage.Shared.UI.React)
local ShopRevamp = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp)
local ShopPurchase = require(ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopPurchase)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useCache = require(Hooks.useCache)
local useMediaQuery = require(Hooks.useMediaQuery)
local useShopData = require(Hooks.useShopData)
local useShopMarketplaceData = require(Hooks.useShopMarketplaceData)
local useVIPPlus = require(Hooks.useVIPPlus)
local useViewEnabled = require(Hooks.useViewEnabled)
local useViewEvent = require(Hooks.useViewEvent)
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState
return function(a1) -- Line: 34
    -- upvalues: useMediaQuery (val), useShopData (val), useCache (val), useVIPPlus (val), useShopMarketplaceData (val)
    -- upvalues: useViewEnabled (val), useRef (val), useState (val), useCallback (val), useViewEvent (val)
    -- upvalues: Notification (val), ViewController (val), useEffect (val), createElement (val), Loading (val)
    -- upvalues: InventoryContext (val), ShopRevamp (val), ShopPurchase (val)
    local u4 = not useMediaQuery("large")
    local v1 = useShopData()
    local v2 = useCache("Values.Coins", 0)
    local v3 = useCache("Values.Gems", 0)
    local u18 = useCache("Values.Level", 0)
    local v4, v5 = useShopMarketplaceData(v1.template, v1.items, useCache("Inventory.Troops", {}), (useVIPPlus()))
    local Shop, Shop_2 = useViewEnabled("Shop")
    local u38 = useRef(0)
    local u41 = useRef(0)
    local v6, u45 = useState(nil)
    local v7 = useCallback(function(a1) -- Line: 50 -- upvalues: u41 (val), u45 (val)
        if type(a1) == "string" and a1 ~= "" then
            local v1 = u41
            v1.current = v1.current + 1
            u45({id = u41.current, title = a1})
            return
        end
    end, {})
    useViewEvent("Shop", "Select", v7, {v7})
    local v8 = useCallback(function(a1) -- Line: 63 -- upvalues: u45 (val) -- types: a1: number
        u45(function(a1_2) -- Line: 64 -- upvalues: a1 (val)
            if a1_2 and a1_2.id == a1 then
                return nil
            end
            return a1_2
        end)
    end, {})
    local v9 = {Shop_2}
    local v10 = useCallback(function() -- Line: 69 -- upvalues: u38 (val), u45 (val), Shop_2 (val)
        u38.current = 0
        u45(nil)
        Shop_2("Hotbar")
    end, v9)
    local v11 = useCallback(function(a1) -- Line: 75 -- upvalues: u38 (val) -- types: a1: number
        u38.current = a1
    end, {})
    local v12 = {u18}
    v9 = useCallback(function(a1) -- Line: 79 -- upvalues: u18 (val), Notification (upval), ViewController (upval) -- types: a1: string
        if u18 < 25 then
            Notification.Error("You must be level 25 or higher to access Special Modes.")
            return
        end
        ;(ViewController:getEmitter("MatchmakingPrompt")):Emit("Show", "Special Modes", nil, "Difficulty")
    end, v12)
    local v13 = useEffect
    local v14 = {u4, Shop, a1.screen, a1.setIgnoreGuiInset, a1.setScreenInsets}
    v13(function() -- Line: 90 -- upvalues: Shop (val), a1 (val), u4 (val)
        if not Shop then
            return
        end
        local screen = a1.screen
        local IgnoreGuiInset = screen
        if IgnoreGuiInset then
            IgnoreGuiInset = screen.IgnoreGuiInset
        end
        local ScreenInsets = screen
        if ScreenInsets then
            ScreenInsets = screen.ScreenInsets
        end
        local ClipToDeviceSafeArea = screen
        if ClipToDeviceSafeArea then
            ClipToDeviceSafeArea = screen.ClipToDeviceSafeArea
        end
        if a1.setScreenInsets then
            a1.setScreenInsets(Enum.ScreenInsets.None)
        end
        if u4 then
            if a1.setIgnoreGuiInset then
                a1.setIgnoreGuiInset(true)
            end
            if screen then
                screen.ClipToDeviceSafeArea = false
            end
        end
        return function() -- Line: 113
            -- upvalues: a1 (upval), ScreenInsets (val), u4 (upval), IgnoreGuiInset (val), screen (val)
            -- upvalues: ClipToDeviceSafeArea (val)
            if a1.setScreenInsets and ScreenInsets ~= nil then
                a1.setScreenInsets(ScreenInsets)
            end
            if u4 and a1.setIgnoreGuiInset and IgnoreGuiInset ~= nil then
                a1.setIgnoreGuiInset(IgnoreGuiInset)
            end
            if u4 and screen and screen.Parent and ClipToDeviceSafeArea ~= nil then
                screen.ClipToDeviceSafeArea = ClipToDeviceSafeArea
            end
        end
    end, v14)
    if not Shop then
        return nil
    end
    if v1.loading then
        return createElement(Loading, {visible = true})
    end
    return createElement(InventoryContext.inventoryProvider, {}, {
        shop = createElement(ShopRevamp, {
            onClose = v10,
            initialScrollPosition = u38.current,
            onScrollPositionChanged = v11,
            sectionRequest = v6,
            onSectionRequestHandled = v8,
            template = v4,
            items = v1.items,
            marketplaceData = v5,
            createPurchaseHandler = ShopPurchase.createHandler,
            onUnlockRequirementClick = v9,
            state = {coins = v2, gems = v3},
        }),
    })
end