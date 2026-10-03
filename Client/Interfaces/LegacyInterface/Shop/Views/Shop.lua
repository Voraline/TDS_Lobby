-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Shop
-- Decompile time: 8.98 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UI = ReplicatedStorage.Shared.UI
local u14 = RunService:IsRunning()
local Binder = require(UI.Components.Binder)
local Charm = require(ReplicatedStorage.Packages.Charm)
require(UI.Components.DelayedState)
local Fusion = require(UI.Fusion)
local ScreenQuery = require(UI.Components.ScreenQuery)
local New = Fusion.New
local Value = Fusion.Value
local ForPairs = Fusion.ForPairs
local Children = Fusion.Children
local Cleanup = Fusion.Cleanup
local Computed = Fusion.Computed
local OnChange = Fusion.OnChange
local Observer = Fusion.Observer
Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local Parent = script.Parent.Parent.Parent
Controllers = Parent.Controllers
SharedComponents = Parent.Components
Components = script.Parent.Parent.Components
Views = script.Parent
Icons = require(Parent.Icons)
ViewScales = require(Views.ViewScales)
ViewController = require(Controllers.ViewController)
StoreController = require(Controllers.StoreController)
local ViewStateStore = require(ReplicatedStorage.Client.Interfaces.Stores.Shared.ViewStateStore)
Navbar = require(Components.Navbar)
NavbarButton = require(Components.NavbarButton)
MobileNavbar = require(SharedComponents.MobileNavBar)
MobileNavButton = require(SharedComponents.MobileNavButton)
Button = require(SharedComponents.Button)
Transition = require(SharedComponents.Transition)
Home = require(Views.Home)
Skins = require(Views.Skins)
Emotes = require(Views.Emotes)
Tags = require(Views.Tags)
Gamepasses = require(Views.Gamepasses)
Credits = require(Views.Credits)
Tickets = require(Views.Tickets)
local u136 = 0

local function v1(a1) -- Line: 64 -- upvalues: u136 (ref), Value (val)
    local v1 = {View = a1, Layout = u136, Size = Value(nil)}
    u136 = u136 + 1
    return v1
end

local v2 = {}
local v3 = {View = Home, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Home = v3
v3 = {View = Skins, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Skins = v3
v3 = {View = Emotes, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Emotes = v3
v3 = {View = Tags, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Tags = v3
v3 = {View = Gamepasses, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Gamepasses = v3
v3 = {View = Credits, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Credits = v3
v3 = {View = Tickets, Layout = u136, Size = Value(nil)}
u136 = u136 + 1
v2.Tickets = v3
local u181 = v2

local function ComputerView(a1) -- Line: 87
    -- upvalues: New (val), Cleanup (val), Children (val), Value (val), Computed (val), u181 (ref)
    local Pages = a1.Pages
    local CurrentPage = a1.CurrentPage
    local PageVisiblity = a1.PageVisiblity
    if not PageVisiblity then
        PageVisiblity = {}
    end
    local DelayedVisiblity = a1.DelayedVisiblity
    if not DelayedVisiblity then
        DelayedVisiblity = {}
    end
    local u12 = ViewController:getEmitter("Inventory")
    local u13 = nil
    local Frame = New("Frame")
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, -20),
        Size = UDim2.fromOffset(1200, 630),
        LayoutOrder = a1.LayoutOrder,
    }

    v1[Cleanup] = function() -- Line: 103 -- upvalues: u13 (ref)
        if u13 then
            u13:Destroy()
            u13 = nil
        end
    end

    local v2 = Children
    local v3 = {}
    local v4 = New("UIAspectRatioConstraint")({AspectRatio = 1.9})
    local v5 = New("UISizeConstraint")({MaxSize = Vector2.new(1200, 800), MinSize = Vector2.new(100, 500)})
    local v6 = Navbar
    local v7 = {
        Position = UDim2.new(0.5, 0, 0, 20),
        AnchorPoint = Vector2.new(0, 0),
        CurrentPage = CurrentPage,
        Pages = Pages,
        OnClose = a1.OnClose,
    }
    v7[Children] = {
        NavbarButton({
            Text = "Towers",
            LayoutOrder = 1,
            Icon = Icons.Towers,
            Selected = Value(false),
            Clicked = function() -- Line: 134 -- upvalues: u12 (val)
                u12:Emit("Select", "Towers")
                ViewController:setView("Inventory")
            end,
        }),
    }
    v6 = v6(v7)
    local Frame_2 = New("Frame")
    local v8 = {
        Size = UDim2.fromScale(1, 1),
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 90),
        BackgroundTransparency = 1,
    }
    v8[Children] = {
        (Computed(function() -- Line: 149
            -- upvalues: u13 (ref), CurrentPage (val), u181 (upval), a1 (val), PageVisiblity (val)
            -- upvalues: DelayedVisiblity (val)
            if u13 then
                u13:Destroy()
                u13 = nil
            end
            local v1 = CurrentPage:get()
            local v2 = u181[v1]
            if not v2 then
                return
            end
            local v3 = v2.View({
                CurrentTab = CurrentPage,
                LayoutOrder = v2.Layout,
                IsMobile = a1.IsMobile,
                Visible = PageVisiblity[v1],
                Delayed = DelayedVisiblity[v1],
            })
            v3.Name = v1
            u13 = v3
            return v3
        end)),
    }
    v3[1] = v4
    v3[2] = v5
    v3[3] = v6
    v3[4] = Frame_2(v8)
    v1[v2] = v3
    return (Frame(v1))
end

local function MobileView(a1) -- Line: 181
    -- upvalues: Value (val), New (val), Computed (val), u181 (ref), Children (val), Cleanup (val), OnChange (val)
    local Pages = a1.Pages
    local CurrentPage = a1.CurrentPage
    local u5 = Value(750)
    local v1 = New("UIPageLayout")({
        Circular = true,
        GamepadInputEnabled = false,
        ScrollWheelInputEnabled = false,
        TouchInputEnabled = false,
        TweenTime = 0.25,
        EasingStyle = Enum.EasingStyle.Cubic,
        Padding = UDim.new(0.2, 0),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Center,
    })
    local u19 = nil
    local v2 = Computed(function() -- Line: 201
        -- upvalues: u19 (ref), CurrentPage (val), u181 (upval), Computed (upval), a1 (val), Value (upval)
        -- upvalues: Children (upval), New (upval)
        if u19 then
            u19:Destroy()
            u19 = nil
        end
        local u9 = CurrentPage:get()
        local v1 = u181[u9]
        if not v1 then
            return
        end
        local Size = v1.Size
        local v2 = Computed(function() -- Line: 216 -- upvalues: a1 (upval), u9 (val)
            return math.floor(a1.Size:get().X / 750 * (ViewScales[u9] or 1) * 100) / 100
        end)
        local View = v1.View
        local v3 = {
            IsMobile = true,
            Scale = v2,
            LayoutOrder = v1.Layout,
            Visible = Value(true),
            Delayed = Value(true),
            OnSize = function(a1) -- Line: 229 -- upvalues: Size (val)
                Size:set(a1)
            end,
        }
        local v4 = Children
        v3[v4] = {
            if table.find({"Gamepasses"}, u9) then nil else New("UIScale")({Scale = v2}),
        }
        local v5 = View(v3)
        v5.Name = u9
        u19 = v5
        return v5
    end)
    local u27 = ViewController:getEmitter("Inventory")
    local Frame = New("Frame")
    local v3 = {
        Position = UDim2.fromScale(0, 0),
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
    }

    v3[Cleanup] = function() -- Line: 255 -- upvalues: u19 (ref)
        if u19 then
            u19:Destroy()
        end
    end

    local v4 = Children
    local v5 = {}
    local v6 = New("UISizeConstraint")({MaxSize = Vector2.new(1200, 800), MinSize = Vector2.new(100, 300)})
    local v7 = MobileNavbar
    local v8 = {Pages = Pages, CurrentPage = CurrentPage, OnClose = a1.OnClose}
    local v9 = Children
    v8[v9] = {
        MobileNavButton({
            Text = "Towers",
            LayoutOrder = 1,
            Icon = Icons.Towers,
            Selected = Value(false),
            Clicked = function() -- Line: 279 -- upvalues: u27 (val)
                u27:Emit("Select", "Towers")
                ViewController:setView("Inventory")
            end,
        }),
    }
    v7 = v7(v8)
    local ScrollingFrame = New("ScrollingFrame")
    v9 = {
        AnchorPoint = Vector2.new(0, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ScrollingDirection = Enum.ScrollingDirection.Y,
        ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255),
        BottomImage = "rbxassetid://6275896591",
        MidImage = "rbxassetid://6275893557",
        TopImage = "rbxassetid://6275890853",
        ScrollBarThickness = 12,
        BackgroundTransparency = 1,
        Position = UDim2.new(0, 64, 0, 0),
        Size = UDim2.new(1, -64, 1, 0),
        ZIndex = 0,
        CanvasSize = Computed(function() -- Line: 301 -- upvalues: CurrentPage (val), u181 (upval)
            local v1 = CurrentPage:get()
            local v2 = u181[v1]
            local v3 = v2 and v2.Size:get()
            if v3 then
                return UDim2.fromOffset(0, v3.Y + 20)
            end
            return UDim2.fromScale(0, 1)
        end),
    }
    local AbsoluteSize = OnChange("AbsoluteSize")

    v9[AbsoluteSize] = function(a1) -- Line: 313 -- upvalues: u5 (val)
        u5:set(a1.Y)
    end

    local v10 = Children
    v9[v10] = {v1, v2}
    v5[1] = v6
    v5[2] = v7
    v5[3] = ScrollingFrame(v9)
    v3[v4] = v5
    return (Frame(v3))
end

return function(a1) -- Line: 326
    -- upvalues: Value (val), ViewStateStore (val), Charm (val), Binder (val), u14 (val), Computed (val)
    -- upvalues: ScreenQuery (val), MobileView (val), ComputerView (val), New (val), Cleanup (val), Children (val)
    ViewController:init()
    StoreController:init()
    local Home = Value("Home")
    local u20 = Value(ViewStateStore.getCurrentView() == "Shop")
    local v1 = Charm.listen(ViewStateStore.getCurrentView, function(a1) -- Line: 332 -- upvalues: u20 (val)
        u20:set(a1 == "Shop")
    end)
    local u28 = Value()
    local u29 = nil
    local u30 = {}
    local v2 = {
        Name = "Home",
        Icon = "rbxassetid://6053791066",
        LayoutOrder = 0,
        Size = UDim2.fromOffset(80, 44),
    }
    local v3 = {Name = "Skins", Icon = Icons.Crates}
    local v4 = {Name = "Emotes", Icon = Icons.Emotes}
    local v5 = {Name = "Tags", Icon = Icons.Tags}
    local v6 = {Name = "Gamepasses", Icon = Icons.GamepassesNav}
    local v7 = {Name = "Credits", Icon = Icons.Chest}
    local v8 = {Name = "Tickets", Icon = Icons.Tickets}
    u30[1] = v2
    u30[2] = v3
    u30[3] = v4
    u30[4] = v5
    u30[5] = v6
    u30[6] = v7
    u30[7] = v8
    v2 = Binder(u20, function(a1) -- Line: 376 -- upvalues: u29 (ref), Home (val)
        if a1 then
            Home:set(u29 or "Home")
            return
        end
        u29 = Home:get()
        Home:set("")
    end)
    v3 = Binder(Home, function(a1) -- Line: 385 -- upvalues: u20 (val), u29 (ref), u14 (upval)
        if u20:get(false) and a1 ~= u29 and u14 then
            Sound("Bleep"):Play()
        end
    end)
    local u63 = {}
    local u64 = {}
    v8 = {
        __index = function(a1, a2) -- Line: 395 -- upvalues: Computed (upval), Home (val)
            local v1 = Computed(function() -- Line: 396 -- upvalues: Home (upval), a2 (val)
                return Home:get() == a2
            end)
            rawset(a1, a2, v1)
            return v1
        end,
    }
    setmetatable(u63, v8)
    v8 = {
        __index = function(a1, a2) -- Line: 407 -- upvalues: Computed (upval), Home (val)
            local v1 = Computed(function() -- Line: 408 -- upvalues: Home (upval), a2 (val)
                return Home:get() == a2
            end)
            rawset(a1, a2, v1)
            return v1
        end,
    }
    setmetatable(u64, v8)
    v7 = Binder(ScreenQuery.IsMobile, function(a1) -- Line: 419
        -- upvalues: u28 (val), MobileView (upval), ComputerView (upval), ScreenQuery (upval), Home (val), u63 (val)
        -- upvalues: u64 (val), u30 (val)
        local v1 = u28:get(false)
        if v1 then
            v1:Destroy()
        end
        local v2 = {
            Size = ScreenQuery.ScreenSize,
            CurrentPage = Home,
            PageVisiblity = u63,
            DelayedVisiblity = u64,
            IsMobile = a1,
            Pages = u30,
            OnClose = function() -- Line: 434
                ViewController:setView("Hotbar")
            end,
        }
        u28:set(((if not a1 then ComputerView else MobileView)(v2)))
    end)
    ;(ViewController:getEmitter("Shop")):On("Select", function(a1) -- Line: 442 -- upvalues: Home (val), u29 (ref)
        if Home:get() == "" then
            u29 = a1
            return
        end
        Home:set(a1 or "Home")
    end)
    local Frame = New("Frame")
    local v9 = {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        Visible = Computed(function() -- Line: 453 -- upvalues: u20 (val), u14 (upval)
            local v1 = u20:get()
            if v1 and u14 then
                Sound("ShopOpen"):Play()
            end
            return v1
        end),
    }
    v9[Cleanup] = {
        v2,
        v7,
        v3,
        v1,
        function() -- Line: 468 -- upvalues: u28 (val)
            local v1 = u28:get()
            if v1 then
                v1:Destroy()
            end
        end,
    }
    v9[Children] = u28
    return (Frame(v9))
end