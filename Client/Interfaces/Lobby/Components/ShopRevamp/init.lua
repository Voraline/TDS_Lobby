-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp
-- Decompile time: 28.51 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Shared = ReplicatedStorage.Shared
local Client = ReplicatedStorage.Client
local Inventory = Client.Interfaces.Universal.Components.Inventory
local InventoryContext = require(Client.Interfaces.Contexts.InventoryContext)
local React = require(Shared.UI.React)
local Catalog = require(script.Catalog)
local HudCurrency = require(Client.Interfaces.Lobby.Components.Hud.HudCurrency)
local IconButton = require(Client.Interfaces.Components.IconButton)
local Icons = require(Client.Interfaces.LegacyInterface.Icons)
local Navigation = require(Inventory.Navigation)
local NavButton = require(Inventory.NavButton)
local Prompt = require(Client.Interfaces.Universal.Components.Prompt)
local PurchasePrompt = require(Client.Interfaces.Universal.Components.PurchasePrompt)
local ShopNavigation = require(Client.Interfaces.Lobby.Utility.ShopNavigation)
local ShopPanel = require(Client.Interfaces.Lobby.Components.SpinWheelChances.ShopPanel)
require(Shared.Types.ShopTypes)
local arePaidRandomItemsRestricted = require(Client.Interfaces.Lobby.Utility.arePaidRandomItemsRestricted)
local createElement = React.createElement
local useBinding = React.useBinding
local useCallback = React.useCallback
local useEffect = React.useEffect
local useMemo = React.useMemo
local useRef = React.useRef
local useState = React.useState
local memo = React.memo
local useAttribute = require(Client.Interfaces.Hooks.useAttribute)
local useCache = require(Client.Interfaces.Hooks.useCache)
local useMediaQuery = require(Client.Interfaces.Hooks.useMediaQuery)
local LocalPlayer = Players.LocalPlayer
local u119 = UDim2.fromScale(0.5, 0.97)
local u123 = UDim2.fromOffset(72, 46)
local u127 = UDim2.fromScale(0.5, 0.02)
local u131 = UDim2.fromOffset(532, 58)
local u135 = UDim2.fromScale(0.98, 0.095)
local u139 = UDim2.fromOffset(36, 36)
local u143 = UDim2.fromScale(0.045, 0.045)

local function toggleFlag(a1, a2) -- Line: 87 -- types: a2: string
    a1(function(a1) -- Line: 88 -- upvalues: a2 (val)
        local v1 = table.clone(a1)
        v1[a2] = not v1[a2]
        return v1
    end)
end

return memo(function(a1) -- Line: 95
    -- upvalues: useMediaQuery (val), useRef (val), useBinding (val), useState (val), InventoryContext (val)
    -- upvalues: useCache (val), useAttribute (val), LocalPlayer (val), useEffect (val)
    -- upvalues: arePaidRandomItemsRestricted (val), useCallback (val), useMemo (val), Catalog (val)
    -- upvalues: ShopNavigation (val), TweenService (val), createElement (val), NavButton (val), u123 (val)
    -- upvalues: PurchasePrompt (val), React (val), Prompt (val), ShopPanel (val), u119 (val), HudCurrency (val)
    -- upvalues: Icons (val), IconButton (val), u135 (val), u139 (val), u143 (val), Navigation (val), u127 (val)
    -- upvalues: u131 (val)
    local coins, gems, v1, v2, v3
    local large = useMediaQuery("large")
    local compact = if a1.compact == nil then not large else a1.compact
    local u344 = useRef(nil)
    local u12 = useRef(false)
    local u347 = useRef({})
    local u18, u19 = useBinding(nil)
    local u350, u358 = useState(Vector2.zero)
    local u366, u27 = useState({})
    local u374, u31 = useState({})
    local u382, u35 = useState({})
    local u385 = InventoryContext.useInventory()
    local u393 = useCache("TowerExp", {})
    local u401 = useAttribute(LocalPlayer, "SandboxAccess", false) == true
    local u408, u53 = useState(false)
    local u415, u57 = useState(false)
    local u64 = math.max(a1.initialScrollPosition or 0, 0)
    if not a1.state then
        coins = 0
    else
        coins = a1.state.coins
        if not coins then
            coins = 0
        end
    end
    if not a1.state then
        gems = 0
    else
        gems = a1.state.gems
        if not gems then
            gems = 0
        end
    end
    useEffect(function() -- Line: 116 -- upvalues: arePaidRandomItemsRestricted (upval), u53 (val)
        local u0 = false
        task.spawn(function() -- Line: 119 -- upvalues: arePaidRandomItemsRestricted (upval), u0 (ref), u53 (upval)
            local v1 = arePaidRandomItemsRestricted()
            if not u0 then
                u53(v1)
            end
        end)
        return function() -- Line: 126 -- upvalues: u0 (ref)
            u0 = true
        end
    end, {})
    local u428 = useCallback(function() -- Line: 131 -- upvalues: u57 (val)
        u57(true)
    end, {})
    local u431 = useCallback(function() -- Line: 135 -- upvalues: u57 (val)
        u57(false)
    end, {})
    local v4 = useMemo
    local v5 = {a1.template}
    local u101 = v4(function() -- Line: 139 -- upvalues: Catalog (upval), a1 (val)
        return Catalog.createSectionSpecs(a1.template or {})
    end, v5)
    local v6 = useMemo
    local v7 = {u101, a1.items, u385}
    local u434 = v6(function() -- Line: 143 -- upvalues: u101 (val), Catalog (upval), a1 (val), u385 (val)
        local hasAvailableTowerProducts, items
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in u101, v2, v3 do
            if j.title ~= "Towers" then
                table.insert(v1, j)
            else
                hasAvailableTowerProducts = Catalog.hasAvailableTowerProducts
                items = a1.items or {}
                if hasAvailableTowerProducts(j, items, u385) then
                    table.insert(v1, j)
                end
            end
        end
        return v1
    end, v7)
    local u437 = useCallback(function(a1) -- Line: 158 -- upvalues: u27 (val) -- types: a1: string
        u27(function(a1_2) -- Line: 88 -- upvalues: a1 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = not v1[a1]
            return v1
        end)
    end, {})
    local u440 = useCallback(function(a1) -- Line: 162 -- upvalues: u35 (val) -- types: a1: string
        u35(function(a1_2) -- Line: 88 -- upvalues: a1 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = not v1[a1]
            return v1
        end)
    end, {})
    local u443 = useCallback(function(a1) -- Line: 166 -- upvalues: u31 (val) -- types: a1: string
        u31(function(a1_2) -- Line: 88 -- upvalues: a1 (val)
            local v1 = table.clone(a1_2)
            v1[a1] = not v1[a1]
            return v1
        end)
    end, {})
    local u317 = useCallback(function(a1) -- Line: 170
        -- upvalues: u344 (val), ShopNavigation (upval), u347 (val), TweenService (upval)
        local current = u344.current
        if not current then
            return
        end
        local v1 = ShopNavigation.findScrollOffset(u347.current, a1)
        if not v1 then
            return
        end
        local v2 = TweenService:Create(
            current,
            TweenInfo.new(0.45, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out),
            {CanvasPosition = Vector2.new(0, (math.clamp(v1, 0, (1 / 0))))}
        )
        v2:Play()
        return v2
    end, {})
    local v8 = {u434}
    local u169 = useCallback(function(a1) -- Line: 195 -- upvalues: u434 (val), u347 (val), u18 (val), u19 (val) -- types: a1: number
        local title = u434[1] and u434[1].title or nil
        local offset = (-1 / 0)
        local v1 = a1 + 30
        for i, j in u347.current do
            if j.sectionTitle and j.offset <= v1 and offset <= j.offset then
                title = j.sectionTitle
                offset = j.offset
            end
        end
        if u18:getValue() ~= title then
            u19(title)
        end
    end, v8)
    local v9 = {a1, u169}
    local u446 = useCallback(function(a1_2) -- Line: 211 -- upvalues: u169 (val), a1 (val) -- types: a1_2: number
        u169(a1_2)
        if a1.onScrollPositionChanged then
            a1.onScrollPositionChanged(a1_2)
        end
    end, v9)
    v8 = useEffect
    local v10 = {u350, u64, a1.sectionRequest}
    v8(function() -- Line: 219 -- upvalues: u12 (val), u350 (val), a1 (val), u344 (val), u64 (val)
        if not u12.current and not (u350.X <= 0) and not (u350.Y <= 0) then
            if a1.sectionRequest then
                u12.current = true
                return
            end
            local u12_2 = false
            task.defer(function() -- Line: 234 -- upvalues: u12_2 (ref), u344 (upval), u64 (upval), u12 (upval)
                if u12_2 then
                    return
                end
                local current = u344.current
                if not current then
                    return
                end
                current.CanvasPosition = Vector2.new(0, u64)
                u12.current = true
            end)
            return function() -- Line: 248 -- upvalues: u12_2 (ref)
                u12_2 = true
            end
        end
    end, v10)
    v8 = useEffect
    v10 = {u350, a1.onSectionRequestHandled, a1.sectionRequest, u317, u434}
    v8(function() -- Line: 253 -- upvalues: a1 (val), u350 (val), u317 (val)
        local sectionRequest = a1.sectionRequest
        if sectionRequest and not (u350.X <= 0) and not (u350.Y <= 0) then
            local u10 = u317(sectionRequest.title)
            if not u10 then
                return
            end
            local u15 = u10.Completed:Connect(function(a1_2) -- Line: 264 -- upvalues: a1 (upval), sectionRequest (val)
                if a1_2 == Enum.PlaybackState.Completed and a1.onSectionRequestHandled then
                    a1.onSectionRequestHandled(sectionRequest.id)
                end
            end)
            return function() -- Line: 270 -- upvalues: u15 (val), u10 (val)
                u15:Disconnect()
                u10:Cancel()
            end
        end
    end, v10)
    v10 = {u434}
    useEffect(function() -- Line: 282 -- upvalues: u19 (val), u434 (val)
        u19(u434[1] and u434[1].title or nil)
    end, v10)
    local u327 = {}
    v10 = nil
    local v11 = nil
    for i, j in u434, v10, v11 do
        v1 = ("%*Button"):format(j.key)
        v2 = createElement
        v3 = {icon = j.icon or "", title = j.title, layoutOrder = i}
        v3.buttonSize = if not compact then nil else 0.7
        v3.size = compact and u123 or nil
        v3.enabled = u18:map(function(a1) -- Line: 294 -- upvalues: j (val)
            return j.title == a1
        end)

        function v3.onClick() -- Line: 297 -- upvalues: j (val), u18 (val), u317 (val)
            if j.title == u18:getValue() then
                return
            end
            u317(j.title)
        end

        u327[v1] = (v2(NavButton, v3))
    end
    if not compact then
        u327.otherChildren = {aspectRatio = createElement("UIAspectRatioConstraint", {AspectRatio = 0.26})}
    end
    return createElement(PurchasePrompt, {
        render = function(a1_2) -- Line: 316
            -- upvalues: Catalog (upval), u434 (val), a1 (val), u385 (val), u393 (val), u401 (val), u366 (val)
            -- upvalues: u374 (val), u382 (val), u437 (val), u440 (val), u443 (val), u408 (val), u428 (val), u344 (val)
            -- upvalues: u350 (val), u347 (val), compact (val), createElement (upval), React (upval), u415 (val)
            -- upvalues: Prompt (upval), ShopPanel (upval), u431 (val), u119 (upval), HudCurrency (upval), coins (val)
            -- upvalues: Icons (upval), ShopNavigation (upval), u317 (val), gems (val), IconButton (upval), u135 (upval)
            -- upvalues: u139 (upval), u143 (upval), Navigation (upval), u127 (upval), u131 (upval), u327 (val)
            -- upvalues: u358 (val), u446 (val)
            local buildShopRows = Catalog.buildShopRows
            local v1 = {sectionSpecs = u434}
            local items = a1.items or {}
            v1.items = items
            local marketplaceData = a1.marketplaceData or {}
            v1.marketplaceData = marketplaceData
            v1.inventory = u385
            v1.towerExp = u393
            v1.entitlements = {SandboxAccess = u401}
            v1.expandedSections = u366
            v1.expandedSubsections = u374
            v1.collapsedSubsections = u382
            v1.onShowMore = u437
            v1.onToggleSubsection = u440
            v1.onShowMoreSubsection = u443
            v1.purchasePrompt = a1_2
            v1.createPurchaseHandler = a1.createPurchaseHandler
            v1.onUnlockRequirementClick = a1.onUnlockRequirementClick
            v1.showSpinTicketPreview = u408
            v1.onSpinTicketPreview = u428
            v1.scrollingFrameRef = u344
            local v2 = buildShopRows(v1, u350)
            u347.current = v2
            v1 = {}
            local v3 = if not compact then 0 else 78
            for i, j in v2 do
                v1[j.key] = (createElement("Frame", {
                    BackgroundTransparency = 1,
                    Position = (UDim2.fromScale(0.5, 0)) + UDim2.fromOffset(-u350.X / 2, j.offset + v3),
                    Size = UDim2.fromOffset(u350.X, j.height),
                }, {Content = j.element}))
            end
            local v4 = v2[#v2]
            local v5 = v3 + (v4 and v4.offset + v4.height or 0)
            local v6 = createElement
            local Fragment = React.Fragment
            local v7 = {}
            local v8 = u415 and createElement(Prompt, {
                description = "",
                title = "",
                actions = {},
                content = createElement(ShopPanel, {OnClose = u431}),
                items = {},
                onModalClicked = u431,
            }) or nil
            v7.SpinTicketPreviewPrompt = v8
            v7.CameraModal = createElement("TextButton", {
                AutoButtonColor = false,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                Modal = true,
                Selectable = false,
                Text = "",
                ZIndex = -1,
                Size = UDim2.fromScale(1, 1),
            })
            v7.DimBackground = createElement("Frame", {
                BackgroundTransparency = 0.25,
                BorderSizePixel = 0,
                ZIndex = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 1),
            })
            v8 = createElement
            local v9 = {BackgroundTransparency = 1, ZIndex = 2}
            local v10 = if not compact then Vector2.new(1, 0) else Vector2.new(0.5, 1)
            v9.AnchorPoint = v10
            v9.AutomaticSize = if not compact then Enum.AutomaticSize.None else Enum.AutomaticSize.X
            v9.Position = if not compact then UDim2.fromScale(0.95, 0.1) else u119
            v10 = if not compact then UDim2.fromScale(0.07, 0.07) else UDim2.fromOffset(0, 50)
            v9.Size = v10
            v10 = {}
            local v11 = createElement
            local v12 = {
                FillDirection = if not compact then Enum.FillDirection.Vertical else Enum.FillDirection.Horizontal,
                SortOrder = Enum.SortOrder.LayoutOrder,
                HorizontalAlignment = if not compact then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Center,
                VerticalAlignment = if not compact then Enum.VerticalAlignment.Top else Enum.VerticalAlignment.Center,
            }
            local v13 = if not compact then UDim.new(0.08, 0) else UDim.new(0, 24)
            v12.Padding = v13
            v10.UIListLayout = v11("UIListLayout", v12)
            v11 = createElement
            v12 = {name = "Coins", LayoutOrder = 0, getExtra = true, currency = coins}
            v13 = if not compact then UDim2.fromScale(0, 0.8) else UDim2.fromOffset(0, 50)
            v12.Size = v13
            v12.AutomaticSize = Enum.AutomaticSize.X
            v12.AnchorPoint = Vector2.new(0.5, 0.5)
            v12.icon = Icons.Coins
            v12.phone = compact
            v12.textScale = if not compact then nil else 1.5

            function v12.onExtraClick() -- Line: 430 -- upvalues: ShopNavigation (upval), u317 (upval)
                local Coins = ShopNavigation.getCurrencySection("Coins")
                if Coins then
                    u317(Coins)
                end
            end

            v10.CoinsLabel = v11(HudCurrency, v12)
            v11 = createElement
            v12 = {name = "Gems", LayoutOrder = 1, getExtra = true, currency = gems}
            v13 = if not compact then UDim2.fromScale(0, 0.8) else UDim2.fromOffset(0, 50)
            v12.Size = v13
            v12.AutomaticSize = Enum.AutomaticSize.X
            v12.AnchorPoint = Vector2.new(0.5, 0.5)
            v12.icon = Icons.Gems
            v12.phone = compact
            v12.textScale = if not compact then nil else 1.5

            function v12.onExtraClick() -- Line: 451 -- upvalues: ShopNavigation (upval), u317 (upval)
                local Gems = ShopNavigation.getCurrencySection("Gems")
                if Gems then
                    u317(Gems)
                end
            end

            v12.textColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(244, 201, 246)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 100, 234))),
            })
            v12.textStrokeColor = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromRGB(107, 36, 94)),
                (ColorSequenceKeypoint.new(1, Color3.fromRGB(102, 38, 99))),
            })
            v10.GemsLabel = v11(HudCurrency, v12)
            v7.CurrencyHolder = v8("Frame", v9, v10)
            v8 = createElement
            v9 = {
                BackgroundTransparency = 1,
                ZIndex = 1,
                AnchorPoint = Vector2.new(0.5, 1),
                Position = UDim2.fromScale(0.5, 1),
                Size = UDim2.fromScale(1, 1),
            }
            v10 = {}
            v11 = not compact and createElement("UIAspectRatioConstraint", {AspectRatio = 0.9}) or nil
            v10.UIAspectRatioConstraint = v11
            v11 = createElement
            v12 = {
                AspectRatio = 1,
                ZIndex = 2,
                Position = if not compact then UDim2.fromScale(1.125, 0.05) else u135,
                Size = if not compact then u143 else u139,
                AnchorPoint = Vector2.new(1, 0.5),
                Color = Color3.fromRGB(255, 60, 60),
                Clicked = a1.onClose,
            }
            v10.CloseButton = v11(IconButton, v12)
            v11 = createElement
            v12 = {}
            v13 = if not compact then Vector2.new(1, 0.5) else Vector2.new(0.5, 0)
            v12.anchorPoint = v13
            v12.position = if not compact then UDim2.fromScale(-0.15, 0.5) else u127
            v12.size = if not compact then (UDim2.fromScale(1, 0)) + UDim2.fromOffset(0, 100) else u131
            v12.flipped = not compact
            v13 = if not compact then UDim.new(0, 25) else UDim.new(0, -8)
            v12.childPadding = v13
            v12.cornerRadius = UDim.new(0.3, 0)
            v12.paddingX = if not compact then nil else 0
            v12.paddingY = if not compact then nil else 0
            v12.unscaled = compact
            v13 = {left = compact and UDim.new(0, 5) or nil}
            v13.right = compact and UDim.new(0, 5) or nil
            local v14 = if not compact then UDim.new(0, -4) else UDim.new(0, 4)
            v13.top = v14
            v14 = if not compact then UDim.new(0, -4) else UDim.new(0, 4)
            v13.bottom = v14
            v12.padding = v13
            v10.NavBar = v11(Navigation, v12, u327)
            v11 = createElement
            v12 = {
                Active = true,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                CanvasSize = UDim2.fromOffset(0, v5),
                Position = UDim2.fromScale(0.5, 0),
                ScrollBarThickness = 0,
                ScrollingDirection = Enum.ScrollingDirection.Y,
            }
            v13 = if not compact then UDim2.fromScale(2, 1.2) else UDim2.fromScale(0.9, 1)
            v12.Size = v13
            v12.ref = u344

            v12[React.Change.AbsoluteWindowSize] = function(a1) -- Line: 531 -- upvalues: compact (upval), u358 (upval)
                local AbsoluteWindowSize = a1.AbsoluteWindowSize
                local v1 = if not compact then AbsoluteWindowSize.X * 0.7 else AbsoluteWindowSize.X * 1.15
                local Y = if not compact then AbsoluteWindowSize.Y else AbsoluteWindowSize.Y * 2.5
                u358(Vector2.new(v1, Y))
            end

            v12[React.Change.CanvasPosition] = function(a1) -- Line: 541 -- upvalues: u446 (upval)
                u446(a1.CanvasPosition.Y)
            end

            v10.ContentFrame = v11("ScrollingFrame", v12, v1)
            v7.ShopFrame = v8("Frame", v9, v10)
            return v6(Fragment, nil, v7)
        end,
    })
end)