-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Navbar
-- Decompile time: 1.80 ms

local Elements = require(script.Parent.Elements)
local Fusion = require(game.ReplicatedStorage.Shared.UI.Fusion)
local New = Fusion.New
local Value = Fusion.Value
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Computed = Fusion.Computed
local ForPairs = Fusion.ForPairs
local NavbarButton = require(script.Parent.NavbarButton)

local function getSelection(a1, a2, a3) -- Line: 14 -- upvalues: Computed (val)
    local u16 = a3 or {
        Selection = Color3.fromRGB(255, 255, 255),
        Unselected = Color3.fromRGB(117, 117, 117),
    }
    return (Computed(function() -- Line: 21 -- upvalues: a2 (val), a1 (val), u16 (ref)
        if a2 == a1:get() then
            return u16.Selection
        end
        return u16.Unselected
    end))
end

return function(a1) -- Line: 30
    -- upvalues: Elements (val), Hydrate (val), Children (val), ForPairs (val), NavbarButton (val), getSelection (val)
    local v1 = Elements.Navbar:Clone()
    local CurrentPage = a1.CurrentPage
    local v2 = Hydrate(v1)
    local v3 = {}
    local Position = a1.Position or v1.Position
    v3.Position = Position
    v3.AnchorPoint = Vector2.new(0.5, 0)
    local v4 = {}
    local v5 = Hydrate(v1.Buttons)
    local v6 = {}
    v6[Children] = {
        a1[Children],
        ForPairs(a1.Pages or {}, function(a1_2, a2) -- Line: 43 -- upvalues: NavbarButton (upval), getSelection (upval), CurrentPage (val), a1 (val)
            local v1 = NavbarButton({
                Size = a2.ButtonSize,
                StrokeColor = getSelection(CurrentPage, a2.Name),
                Icon = a2.Icon,
                Text = a2.Name,
                LayoutOrder = a2.LayoutOrder or a1_2,
                Clicked = function() -- Line: 51 -- upvalues: a2 (val), a1 (upval), CurrentPage (upval)
                    if a2.Name ~= a1.CurrentPage:get() then
                        CurrentPage:set(a2.Name)
                    end
                end,
            })
            local Size = v1.Size
            v1.Size = UDim2.new(Size.X.Scale, Size.X.Offset, 1, 0)
            return a1_2, v1
        end, function(a1, a2) -- Line: 61
            a2:Destroy()
        end),
        (NavbarButton({
            Icon = "rbxassetid://9674219565",
            Transparency = 0,
            LayoutOrder = 1000,
            Text = "",
            Color = Color3.fromRGB(255, 60, 60),
            StrokeColor = Color3.fromRGB(168, 58, 58),
            IconSize = UDim2.fromOffset(24, 24),
            IconPosition = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromOffset(44, 44),
            Clicked = function() -- Line: 76 -- upvalues: a1 (val)
                if a1.OnClose then
                    a1.OnClose()
                end
            end,
        })),
    }
    v4[1] = v5(v6)
    v3[Children] = v4
    return v2(v3)
end