-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.TopBar.GiftboxPanel
-- Decompile time: 1.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GiftboxItem = require(script.Parent.GiftboxItem)
local createElement = require(ReplicatedStorage.Shared.UI.React).createElement
return function(a1) -- Line: 23 -- upvalues: createElement (val), GiftboxItem (val) -- types: a1: table
    local v1 = a1.visible ~= false
    local v2 = {
        layout = createElement("UIListLayout", {Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder}),
    }
    v2.padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 8),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 8),
    })
    if #a1.items ~= 0 then
        local v3
        for i, v in ipairs(a1.items) do
            v3 = ("item%*"):format(i)
            v2[v3] = (createElement(GiftboxItem, {
                cover = v.cover,
                sender = v.sender,
                reward = v.reward,
                rewardIcon = v.rewardIcon,
                layoutOrder = i,
                onClaim = function() -- Line: 61 -- upvalues: a1 (val), v (val)
                    if a1.onClaim then
                        a1.onClaim(v)
                    end
                end,
            }))
        end
    else
        v2.empty = createElement("TextLabel", {
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            Text = "No gifts to claim",
            TextSize = 18,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Size = UDim2.new(1, 0, 0, 60),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        })
    end
    local v4 = {BackgroundTransparency = 0.2}
    local anchorPoint = a1.anchorPoint or Vector2.new(1, 0)
    v4.AnchorPoint = anchorPoint
    v4.AutomaticSize = Enum.AutomaticSize.Y
    v4.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    local position = a1.position or UDim2.new(1, -10, 0, 48)
    v4.Position = position
    v4.Size = UDim2.new(0, 320, 0, 0)
    v4.Visible = v1
    return createElement("Frame", v4, v2)
end