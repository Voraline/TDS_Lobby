-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Shop.Views.Emotes
-- Decompile time: 4.49 ms

local Shared = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
local Fusion = require(Shared.UI.Fusion)
local New = Fusion.New
local Value = Fusion.Value
local Computed = Fusion.Computed
local Children = Fusion.Children
local OnChange = Fusion.OnChange
Controllers = script.Parent.Parent.Parent.Controllers
Icons = require(script.Parent.Parent.Parent.Icons)
Comma = require(Shared.UI.Comma)
StoreController = require(Controllers.StoreController)
ViewController = require(Controllers.ViewController)
ItemController = require(Controllers.ItemController)
Components = script.Parent.Parent.Components
DailyEmotes = require(Components.DailyEmotes)

local function promptPurchase(a1) -- Line: 23
    return function(a1_2) -- Line: 24 -- upvalues: a1 (val)
        local info = a1_2.info
        local u6 = ItemController:getPurchaseType(a1_2)
        ViewController:prompt({
            Override = false,
            Subject = "Confirm Purchase?",
            Icon = Icons.Shop,
            Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a1_2.name, Comma(info.Price.Value), u6),
            Buttons = {
                {
                    Text = "Confirm",
                    Color = Color3.fromRGB(10, 220, 80),
                    Clicked = function() -- Line: 43 -- upvalues: a1 (upval), a1_2 (val), u6 (val)
                        ViewController:closePrompt()
                        a1(a1_2.name, u6 == "Robux")
                    end,
                },
                {
                    Text = "Cancel",
                    Color = Color3.fromRGB(39, 39, 39),
                    Clicked = function() -- Line: 52
                        ViewController:closePrompt()
                    end,
                },
            },
        })
    end
end

return function(a1) -- Line: 61 -- upvalues: Value (val), New (val), OnChange (val), Children (val)
    local Visible = a1.Visible or Value(true)
    local v1 = StoreController:getRotation("Emotes")
    local v2 = StoreController:getNextRotation()

    local function u14(a1, a2) -- Line: 66
        local v1, v2 = StoreController:purchaseDaily("Emote", a1, a2)
        if not v1 then
            local v3 = v2 or "Unknown error occured while purchasing " .. a1
            ViewController:notifyError(v3)
        end
    end

    local Frame = New("Frame")
    local v3 = {
        BackgroundTransparency = 1,
        AutomaticSize = Enum.AutomaticSize.XY,
        AnchorPoint = Vector2.new(0.5, 0),
        Position = UDim2.new(0.5, 0, 0, 40),
        Size = UDim2.new(0, 0, 0, 0),
        LayoutOrder = a1.LayoutOrder,
        Visible = a1.Delayed,
    }
    local AbsoluteSize = OnChange("AbsoluteSize")
    v3[AbsoluteSize] = a1.OnSize
    v3[Children] = {
        a1[Children],
        (DailyEmotes({
            Visible = Visible,
            Emotes = v1,
            Expires = v2,
            OnPurchase = function(a1) -- Line: 24 -- upvalues: u14 (val)
                local info = a1.info
                local u6 = ItemController:getPurchaseType(a1)
                ViewController:prompt({
                    Override = false,
                    Subject = "Confirm Purchase?",
                    Icon = Icons.Shop,
                    Description = string.format("Are you sure you want to purchase <b>%q</b> for <b>%s %s</b>?", a1.name, Comma(info.Price.Value), u6),
                    Buttons = {
                        {
                            Text = "Confirm",
                            Color = Color3.fromRGB(10, 220, 80),
                            Clicked = function() -- Line: 43 -- upvalues: u14 (upval), a1 (val), u6 (val)
                                ViewController:closePrompt()
                                u14(a1.name, u6 == "Robux")
                            end,
                        },
                        {
                            Text = "Cancel",
                            Color = Color3.fromRGB(39, 39, 39),
                            Clicked = function() -- Line: 52
                                ViewController:closePrompt()
                            end,
                        },
                    },
                })
            end,
        })),
    }
    return Frame(v3)
end