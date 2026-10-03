-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Hud.PartyBar
-- Decompile time: 3.37 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local React = require(ReplicatedStorage.Shared.UI.React)
local HudPartyMember = require(script.Parent.HudPartyMember)
local Fragment = React.Fragment
local createElement = React.createElement
return React.memo(function(a1) -- Line: 39
    -- upvalues: Players (val), createElement (val), HudPartyMember (val), Fragment (val)
    local showAddButton, v1, v2, v3, v4, v5, v6, v7, v8
    local v9 = a1.Visible ~= false
    local v10 = a1.phone == true
    local v11 = a1.layout == "vertical"
    local v12 = if not v10 then 1 else if v11 then 1 else 0.7
    local v13 = table.clone(a1.members or {})
    local leader = a1.leader
    if v13[1] == nil and Players.LocalPlayer then
        v13[1] = Players.LocalPlayer
    end
    if a1.showAddButton == nil then
        showAddButton = false
        if #v13 < 4 then
            showAddButton = v13[1] == Players.LocalPlayer
        end
    else
        showAddButton = a1.showAddButton
    end
    local v14 = #v13
    local v15 = v14 + (if not showAddButton then 0 else 1)
    v14 = {}
    local v16 = 0
    local v17 = v13
    local v18 = nil
    local v19 = nil
    local v20 = a1
    for i, j in v17, v18, v19 do
        v2 = i == 1
        if v2 then
            v2 = false
            if j == leader then
                v2 = not v8
            end
        end
        v3 = (if not v1 then 40 else 50) * v12
        v4 = if not v11 then i else v15 - i + 1
        v16 = v16 + v3
        v5 = ("Member_%*"):format(j.UserId)
        v6 = {
            LayoutOrder = v4,
            Size = UDim2.fromOffset(v3, v3),
            Visible = v9,
            ZIndex = if not v20.ZIndex then nil else v20.ZIndex + 1,
            clicked = v20.clicked,
            glow = v2,
        }
        v7 = if not v2 then Color3.fromRGB(0, 170, 255) else Color3.fromRGB(62, 255, 85)
        v6.glowColor = v7
        v6.icon = ("rbxthumb://type=AvatarHeadShot&id=%*&w=180&h=180"):format(j.UserId)
        v6.interactive = v20.interactive
        v6.name = j.Name
        v7 = if not v2 then Color3.fromRGB(0, 170, 255) else Color3.fromRGB(85, 255, 127)
        v6.strokeColor = v7
        v14[v5] = (createElement(HudPartyMember, v6))
    end
    if showAddButton then
        v17 = v12 * 40
        v16 = v16 + v17
        v14.Add = createElement(HudPartyMember, {
            icon = 16885338903,
            LayoutOrder = if not v11 then v15 else 1,
            Size = UDim2.fromOffset(v17, v17),
            Visible = v9,
            ZIndex = if not v20.ZIndex then nil else v20.ZIndex + 1,
            clicked = v20.clicked,
            iconSize = UDim2.fromScale(0.5, 0.5),
            interactive = v20.interactive,
            strokeColor = Color3.fromRGB(255, 255, 255),
        })
    end
    if v11 and v15 > 1 then
        v16 = v16 + (v15 - 1) * 8
    end
    v19 = {BackgroundTransparency = 1, AnchorPoint = v20.AnchorPoint}
    v19.AutomaticSize = if not v11 then Enum.AutomaticSize.Y else Enum.AutomaticSize.None
    v19.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v19.BorderColor3 = Color3.fromRGB(27, 42, 53)
    v19.LayoutOrder = v20.LayoutOrder or 2
    local Position = v20.Position or (if not v11 then UDim2.new(1, if not v10 then 20 else -15, 0, 0) else UDim2.fromScale(0, 0))
    v19.Position = Position
    local Size = v20.Size or (if not v11 then UDim2.fromScale(0, 1) else UDim2.fromOffset(54, v16 + 16))
    v19.Size = Size
    v19.ZIndex = v20.ZIndex
    return createElement("Frame", v19, {
        Layout = createElement("UIListLayout", {
            FillDirection = if not v11 then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical,
            HorizontalAlignment = if not v11 then Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
            Padding = UDim.new(0, if not v11 then 10 else 8),
            SortOrder = Enum.SortOrder.LayoutOrder,
            VerticalAlignment = Enum.VerticalAlignment.Center,
        }),
        Members = createElement(Fragment, {}, v14),
    })
end)