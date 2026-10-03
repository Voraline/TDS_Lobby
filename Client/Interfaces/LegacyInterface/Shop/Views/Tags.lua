-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Tags
-- Decompile time: 5.69 ms

local Shared = game:GetService("ReplicatedStorage").Shared
local Fusion = require(Shared.UI.Fusion)
local New = Fusion.New
local Children = Fusion.Children
local OnChange = Fusion.OnChange
local Computed = Fusion.Computed
local Observer = Fusion.Observer
local Value = Fusion.Value
Components = script.Parent.Parent.Components
Controllers = script.Parent.Parent.Parent.Controllers
Icons = require(script.Parent.Parent.Parent.Icons)
Comma = require(Shared.UI.Comma)
StoreController = require(Controllers.StoreController)
ViewController = require(Controllers.ViewController)
ItemController = require(Controllers.ItemController)
DailyTags = require(Components.DailyTags)
Title = require(Components.Title)
SharedComponents = Components.Parent.Parent.Components

local function purchaseItem(a1, a2, a3) -- Line: 25
    local v1, v2 = StoreController:purchaseDaily(a1, a2, a3)
    if not v1 then
        local v3 = v2 or string.format("Unknown error occured while purchasing %q", a1)
        ViewController:notifyError(v3)
    end
end

local function promptPurchase(a1) -- Line: 33
    return function(a1_2) -- Line: 34 -- upvalues: a1 (val)
        local v1 = ItemController:getPrice(a1_2)
        local v2 = ItemController:getPurchaseType(a1_2)
        if v2 == "Robux" then
            local v3 = a1
            local name = a1_2.name
            local v4, v5 = StoreController:purchaseDaily(v3, name, v1)
            if not v4 then
                local v6 = v5 or string.format("Unknown error occured while purchasing %q", v3)
                ViewController:notifyError(v6)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a1_2.name, Comma(v1), v2),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 58 -- upvalues: a1 (upval), a1_2 (val)
                        ViewController:closePrompt()
                        local v1 = a1
                        local name = a1_2.name
                        local v2, v3 = StoreController:purchaseDaily(v1, name, nil)
                        if not v2 then
                            local v4 = v3 or string.format("Unknown error occured while purchasing %q", v1)
                            ViewController:notifyError(v4)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 67
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end
end

return function(a1) -- Line: 76 -- upvalues: Value (val), New (val), OnChange (val), Children (val), Computed (val)
    local IsMobile = a1.IsMobile
    local Visible = a1.Visible or Value(true)
    local u10 = StoreController:getRotation("Tags")
    local u14 = StoreController:getNextRotation()
    local Frame = New("Frame")
    local v1 = {
        BackgroundTransparency = 1,
        AnchorPoint = Vector2.new(0, 0),
        Position = UDim2.new(0, 0, 0, 40),
    }
    local v2 = IsMobile and UDim2.new(1, 0, 0, 0) or UDim2.new(1, 0, 1, -80)
    v1.Size = v2
    v1.AutomaticSize = IsMobile and Enum.AutomaticSize.Y or Enum.AutomaticSize.None
    v1.LayoutOrder = a1.LayoutOrder
    v1.Visible = a1.Delayed
    local AbsoluteSize = OnChange("AbsoluteSize")
    v1[AbsoluteSize] = a1.OnSize
    local v3 = {}
    local v4 = a1[Children]
    local UIListLayout = New("UIListLayout")
    local v5 = {
        Name = "UIListLayout",
        FillDirection = IsMobile and Enum.FillDirection.Vertical or Enum.FillDirection.Horizontal,
    }
    v5.HorizontalAlignment = IsMobile and Enum.HorizontalAlignment.Center or Enum.HorizontalAlignment.Left
    v5.VerticalAlignment = Enum.VerticalAlignment.Top
    v5.SortOrder = Enum.SortOrder.LayoutOrder
    v5.Padding = UDim.new(0, if not IsMobile then 20 else 80)
    local v6 = UIListLayout(v5)
    v5 = DailyTags
    local v7 = {
        Title = "Daily Nametags",
        TitleIcon = 9674090511,
        TitleAnchorPoint = not IsMobile and Vector2.new(0, 0),
        TitlePosition = not IsMobile and UDim2.new(0, 0, 0, 0),
        Size = if not IsMobile then nil else UDim2.fromOffset(450, 390),
        Visible = Visible,
        IsMobile = IsMobile,
    }
    local u147 = "Tag"

    function v7.OnPurchase(a1) -- Line: 34 -- upvalues: u147 (val)
        local v1 = ItemController:getPrice(a1)
        local v2 = ItemController:getPurchaseType(a1)
        if v2 == "Robux" then
            local v3 = u147
            local name = a1.name
            local v4, v5 = StoreController:purchaseDaily(v3, name, v1)
            if not v4 then
                local v6 = v5 or string.format("Unknown error occured while purchasing %q", v3)
                ViewController:notifyError(v6)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a1.name, Comma(v1), v2),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 58 -- upvalues: u147 (upval), a1 (val)
                        ViewController:closePrompt()
                        local v1 = u147
                        local name = a1.name
                        local v2, v3 = StoreController:purchaseDaily(v1, name, nil)
                        if not v2 then
                            local v4 = v3 or string.format("Unknown error occured while purchasing %q", v1)
                            ViewController:notifyError(v4)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 67
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end

    v7.Tags = Computed(function() -- Line: 118 -- upvalues: u10 (val)
        local v1 = u10:get() or {}
        return {v1[1], v1[2]}
    end)
    v5 = v5(v7)
    local Frame_2 = New("Frame")
    local v8 = {
        Size = UDim2.new(
            if not IsMobile then 0.53 else 0,
            if not IsMobile then 0 else 550,
            if not IsMobile then 1 else 0,
            if not IsMobile then 0 else 400
        ),
        BackgroundTransparency = 1,
    }
    local v9 = {}
    local v10 = DailyTags
    local v11 = {
        Small = true,
        Title = Computed(function() -- Line: 136 -- upvalues: u14 (val)
            return "Restock in " .. u14:get()
        end),
    }
    v11.TitleAnchorPoint = not IsMobile and Vector2.new(1, 0)
    v11.TitlePosition = not IsMobile and UDim2.new(1, -10, 0, 0)
    v11.Visible = Visible
    v11.IsMobile = IsMobile
    v11.Position = UDim2.fromOffset(0, 0)
    local v12 = IsMobile and UDim2.fromScale(1, 1) or UDim2.new(0, 636, 1, 0)
    v11.Size = v12
    v11.AnchorPoint = Vector2.new(0, 0)
    local u273 = "Tag"

    function v11.OnPurchase(a1) -- Line: 34 -- upvalues: u273 (val)
        local v1 = ItemController:getPrice(a1)
        local v2 = ItemController:getPurchaseType(a1)
        if v2 == "Robux" then
            local v3 = u273
            local name = a1.name
            local v4, v5 = StoreController:purchaseDaily(v3, name, v1)
            if not v4 then
                local v6 = v5 or string.format("Unknown error occured while purchasing %q", v3)
                ViewController:notifyError(v6)
            end
            return
        end
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a1.name, Comma(v1), v2),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 58 -- upvalues: u273 (upval), a1 (val)
                        ViewController:closePrompt()
                        local v1 = u273
                        local name = a1.name
                        local v2, v3 = StoreController:purchaseDaily(v1, name, nil)
                        if not v2 then
                            local v4 = v3 or string.format("Unknown error occured while purchasing %q", v1)
                            ViewController:notifyError(v4)
                        end
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 67
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end

    v11.Tags = Computed(function() -- Line: 150 -- upvalues: u10 (val)
        local v1 = u10:get() or {}
        local v2 = {}
        for i, j in v1 do
            if not (i <= 2) then
                table.insert(v2, j)
            end
        end
        return v2
    end)
    v9[1] = v10(v11)
    v8[Children] = v9
    v3[1] = v4
    v3[2] = v6
    v3[3] = v5
    v3[4] = Frame_2(v8)
    v1[Children] = v3
    return Frame(v1)
end