-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.MobileNavBar
-- Decompile time: 2.47 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Hydrate = Fusion.Hydrate
local Value = Fusion.Value
local Children = Fusion.Children
local OnEvent = Fusion.OnEvent
local Computed = Fusion.Computed
local ForPairs = Fusion.ForPairs
local MobileNavButton = require(script.Parent.MobileNavButton)
local MobileNavBar = Elements.MobileNavBar
local u25 = {Stickers = true, Flairs = true}
local u28 = {
    Towers = 1,
    Crates = 2,
    Consumables = 3,
    Emotes = 4,
    Tags = 5,
    Charms = 6,
    Home = -1,
    Skins = 2,
    Gamepasses = 5,
    Credits = 6,
    Tickets = 7,
}
return function(a1) -- Line: 39
    -- upvalues: Value (val), MobileNavBar (val), Hydrate (val), Children (val), New (val), ForPairs (val), u25 (val)
    -- upvalues: MobileNavButton (val), u28 (val), Computed (val), OnEvent (val)
    local CurrentPage = a1.CurrentPage
    if not CurrentPage then
        CurrentPage = Value((a1.Pages or {})[1] or "Home")
    end
    local v1 = MobileNavBar:Clone()
    local v2 = Hydrate(v1)
    local v3 = {
        Size = a1.Size,
        Position = a1.Position,
        Visible = a1.Visible,
        AnchorPoint = a1.AnchorPoint,
    }
    local v4 = {}
    local v5 = Hydrate(v1.Buttons)
    local v6 = {}
    local v7 = {}
    local ScrollingFrame = New("ScrollingFrame")
    local v8 = {
        Name = "ScrollingFrame",
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        CanvasSize = UDim2.new(),
        ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0),
        ScrollBarThickness = 1,
        Active = true,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Size = UDim2.new(1, 0, 1, -66),
    }
    v8[Children] = {
        a1[Children],
        New("UIListLayout")({
            Name = "UIListLayout",
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
        (ForPairs(a1.Pages or {}, function(a1_2, a2) -- Line: 73
            -- upvalues: u25 (upval), MobileNavButton (upval), u28 (upval), Computed (upval), CurrentPage (val)
            -- upvalues: a1 (val)
            local Name = a2.Name
            if u25[Name] then
                return a1_2, nil
            end
            local v1 = MobileNavButton
            local v2 = {Text = Name, Icon = a2.Icon}
            local LayoutOrder = u28[Name] or a2.LayoutOrder or a1_2
            v2.LayoutOrder = LayoutOrder
            v2.Selected = Computed(function() -- Line: 88 -- upvalues: CurrentPage (upval), Name (val)
                return (CurrentPage:get()) == Name
            end)

            function v2.Clicked() -- Line: 92 -- upvalues: CurrentPage (upval), Name (val), a1 (upval)
                if (CurrentPage:get()) == Name then
                    return
                end
                if a1.UpdatePage then
                    a1.UpdatePage(Name)
                    return
                end
                CurrentPage:set(Name)
            end

            return a1_2, v1(v2)
        end, function(a1, a2) -- Line: 104
            a2:Destroy()
        end)),
    }
    v7[1] = ScrollingFrame(v8)
    v6[Children] = v7
    v5 = v5(v6)
    v6 = Hydrate(v1.Leave)
    local v9 = {}
    local Activated = OnEvent("Activated")

    v9[Activated] = function() -- Line: 113 -- upvalues: a1 (val)
        if a1.OnClose then
            a1.OnClose()
        end
    end

    v4[1] = v5
    v4[2] = v6(v9)
    v3[Children] = v4
    return v2(v3)
end