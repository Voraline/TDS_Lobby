-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Skins
-- Decompile time: 14.16 ms

local Shared = game:GetService("ReplicatedStorage").Shared
local Fusion = require(Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Computed = Fusion.Computed
local Value = Fusion.Value
Components = script.Parent.Parent.Components
Controllers = script.Parent.Parent.Parent.Controllers
Icons = require(script.Parent.Parent.Parent.Icons)
Comma = require(Shared.UI.Comma)
StoreController = require(Controllers.StoreController)
ViewController = require(Controllers.ViewController)
DailyCrates = require(Components.DailyCrates)
DailySkins = require(Components.DailySkins)
Title = require(Components.Title)
SharedComponents = Components.Parent.Parent.Components

local function purchaseItem(a1, a2, a3, a4) -- Line: 24
    local v1, v2 = StoreController:purchaseDaily(a1, a2, a4)
    if not v1 then
        local v3 = v2 or string.format("Unknown error occured while purchasing %q", a3.DisplayName)
        ViewController:notifyError(v3)
    end
end

local function promptPurchase(a1) -- Line: 33
    return function(a1_2, a2) -- Line: 34 -- upvalues: a1 (val)
        if a2.Currency == "Robux" then
            local v1 = a1
            local v2, v3 = StoreController:purchaseDaily(v1, a1_2, true)
            if not v2 then
                local v4 = v3 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                ViewController:notifyError(v4)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a2.DisplayName, Comma(a2.Price), a2.Currency),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 55 -- upvalues: a1 (upval), a1_2 (val), a2 (val)
                        ViewController:closePrompt()
                        local v1, v2 = StoreController:purchaseDaily(a1, a1_2, nil)
                        if not v1 then
                            local v3 = v2 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                            ViewController:notifyError(v3)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 64
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end
end

return function(a1) -- Line: 73 -- upvalues: Value (val), Computed (val), New (val), OnChange (val), Children (val)
    local IsMobile = a1.IsMobile
    local Visible = a1.Visible
    if not Visible then
        Visible = Value(true)
    end
    local u10 = StoreController:getRotation("Skins")
    local v1 = StoreController:getRotation("Crates")
    local u19 = StoreController:getNextRotation()
    local u23 = StoreController:getCanPurchaseRandomItemsState()
    local v2 = Computed(function() -- Line: 81 -- upvalues: Visible (val), u23 (val)
        return Visible:get() and u23:get()
    end)
    local v3 = Computed(function() -- Line: 84 -- upvalues: u23 (val)
        return not u23:get()
    end)
    local v4 = Computed(function() -- Line: 87 -- upvalues: u10 (val), u23 (val)
        local v1 = u10:get()
        local v2 = {}
        local v3 = #v1
        for i = 1, (math.min(if not u23:get() then 5 else 3, v3)) do
            v2[i] = v1[i]
        end
        return v2
    end)
    local Frame = New("Frame")
    local v5 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(0, 0, 0, 40),
    }
    local v6 = IsMobile and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 1, -80)
    v5.Size = v6
    v5.AutomaticSize = IsMobile and Enum.AutomaticSize.Y or Enum.AutomaticSize.None
    v5.LayoutOrder = a1.LayoutOrder
    v5.Visible = a1.Delayed
    local AbsoluteSize = OnChange("AbsoluteSize")
    v5[AbsoluteSize] = a1.OnSize
    local v7 = {}
    local v8 = a1[Children]
    local v9 = IsMobile and New("UIListLayout")({
        Name = "UIListLayout",
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
        VerticalAlignment = Enum.VerticalAlignment.Top,
        Padding = UDim.new(0, 20),
    }) or nil
    local v10 = IsMobile and New("UIPadding")({PaddingBottom = UDim.new(0, 40)}) or nil
    local v11 = DailySkins
    local v12 = {
        LayoutOrder = 1,
        IsMobile = IsMobile,
        Visible = Visible,
        Expanded = v3,
        Skins = v4,
    }
    local u142 = "Skin"

    function v12.OnPurchase(a1, a2) -- Line: 34 -- upvalues: u142 (val)
        if a2.Currency == "Robux" then
            local v1 = u142
            local v2, v3 = StoreController:purchaseDaily(v1, a1, true)
            if not v2 then
                local v4 = v3 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                ViewController:notifyError(v4)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a2.DisplayName, Comma(a2.Price), a2.Currency),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 55 -- upvalues: u142 (upval), a1 (val), a2 (val)
                        ViewController:closePrompt()
                        local v1, v2 = StoreController:purchaseDaily(u142, a1, nil)
                        if not v1 then
                            local v3 = v2 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                            ViewController:notifyError(v3)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 64
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end

    v11 = v11(v12)
    local Frame_2 = New("Frame")
    local v13 = {}
    local v14 = IsMobile and UDim2.fromOffset(750, 280) or UDim2.fromOffset(0, 0)
    v13.Size = v14
    v14 = IsMobile and UDim2.fromScale(0, 0) or UDim2.fromScale(1, 0)
    v13.Position = v14
    v13.AutomaticSize = IsMobile and Enum.AutomaticSize.None or Enum.AutomaticSize.XY
    v13.BackgroundTransparency = 1
    v13.Visible = v2
    v14 = Children
    local v15 = {}
    local v16 = DailyCrates
    local v17 = {Visible = v2, IsMobile = IsMobile, Position = UDim2.new(1, 0, 0, 50), Crates = v1}
    local u221 = "Crate"

    function v17.OnPurchase(a1, a2) -- Line: 34 -- upvalues: u221 (val)
        if a2.Currency == "Robux" then
            local v1 = u221
            local v2, v3 = StoreController:purchaseDaily(v1, a1, true)
            if not v2 then
                local v4 = v3 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                ViewController:notifyError(v4)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a2.DisplayName, Comma(a2.Price), a2.Currency),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 55 -- upvalues: u221 (upval), a1 (val), a2 (val)
                        ViewController:closePrompt()
                        local v1, v2 = StoreController:purchaseDaily(u221, a1, nil)
                        if not v1 then
                            local v3 = v2 or string.format("Unknown error occured while purchasing %q", a2.DisplayName)
                            ViewController:notifyError(v3)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 64
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end

    v17[Children] = {
        Title({
            Icon = "rbxassetid://8471992395",
            Text = Computed(function() -- Line: 151 -- upvalues: u19 (val)
                return "Restock in " .. u19:get()
            end),
            Position = UDim2.fromOffset(0, -50),
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromOffset(275, 40),
        }),
    }
    v15[1] = v16(v17)
    v13[v14] = v15
    v7[1] = v8
    v7[2] = v9
    v7[3] = v10
    v7[4] = v11
    v7[5] = Frame_2(v13)
    v5[Children] = v7
    return Frame(v5)
end