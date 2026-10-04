-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Components.Tabs
-- Decompile time: 5.11 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Fusion = require(ReplicatedStorage.Shared.UI.Fusion)
local Elements = require(script.Parent.Elements)
local New = Fusion.New
local Value = Fusion.Value
local Hydrate = Fusion.Hydrate
local Children = Fusion.Children
local ForValues = Fusion.ForValues
local Computed = Fusion.Computed
local Cleanup = Fusion.Cleanup
local OnEvent = Fusion.OnEvent
local OnChange = Fusion.OnChange
local u27 = Elements.Tabs:Clone()
local u31 = u27.TabItem:Clone()
u27.TabItem:Destroy()
return function(a1) -- Line: 20
    -- upvalues: u27 (val), Hydrate (val), Children (val), New (val), ForValues (val), Computed (val), u31 (val)
    -- upvalues: Cleanup (val), OnEvent (val)
    local v1 = u27:Clone()
    local v2 = Hydrate(v1)
    local v3 = {Position = a1.Position, AnchorPoint = a1.AnchorPoint, Size = a1.Size}
    local v4 = Children
    v3[v4] = {
        New("UIPadding")({}),
        New("UIListLayout")({
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Center,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(a1.Padding or 0.0325, 0),
        }),
        (ForValues(a1.Tabs, function(a1_2) -- Line: 39
            -- upvalues: Computed (upval), a1 (val), u31 (upval), Hydrate (upval), Children (upval), Cleanup (upval)
            -- upvalues: OnEvent (upval)
            local u3, v1 = Computed(function() -- Line: 40 -- upvalues: a1 (upval), a1_2 (val)
                return (a1.Selected:get()) == a1_2
            end)
            local v2 = u31:Clone()
            local v3 = Hydrate(v2)
            local v4 = {
                Size = a1.TabSize,
                BackgroundColor3 = Computed(function() -- Line: 47 -- upvalues: u3 (val)
                    return u3:get() and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(34, 34, 34)
                end),
            }
            local v5 = Children
            v4[v5] = {
                Hydrate(v2.TextLabel)({
                    Text = a1_2,
                    TextColor3 = Computed(function() -- Line: 55 -- upvalues: u3 (val)
                        return u3:get() and Color3.fromRGB(36, 36, 36) or Color3.fromRGB(255, 255, 255)
                    end),
                }),
            }
            v5 = Cleanup
            v4[v5] = {v1}
            local Activated = OnEvent("Activated")

            v4[Activated] = function() -- Line: 63 -- upvalues: a1 (upval), u3 (val), a1_2 (val)
                if a1.Clicked and not u3:get() then
                    a1.Clicked(a1_2)
                end
                a1.Selected:set(a1_2)
            end

            return v3(v4)
        end, function(a1) -- Line: 71
            a1:Destroy()
        end)),
    }
    return v2(v3)
end