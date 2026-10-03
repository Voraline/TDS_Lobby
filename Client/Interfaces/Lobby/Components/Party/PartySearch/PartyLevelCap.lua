-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartySearch.PartyLevelCap
-- Decompile time: 1.30 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Abbreviate = require(ReplicatedStorage.Shared.Modules.Abbreviate)
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local createElement = (require(ReplicatedStorage.Shared.UI.React)).createElement

local function formatNumber(a1) -- Line: 9 -- upvalues: Comma (val), Abbreviate (val) -- types: a1: number
    if not a1 then
        return ""
    end
    if a1 <= 9999 then
        return Comma(a1)
    end
    return Abbreviate(a1)
end

return function(a1) -- Line: 21 -- upvalues: createElement (val), Comma (val), Abbreviate (val)
    local partyParams = a1.party.partyParams
    local v1 = {
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(1, 0),
        Size = UDim2.fromScale(0, 1),
    }
    local v2 = {
        uiListLayout = createElement("UIListLayout", {
            Padding = UDim.new(0, 8),
            FillDirection = Enum.FillDirection.Horizontal,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            SortOrder = Enum.SortOrder.LayoutOrder,
        }),
    }
    local v3 = {
        TextSize = 20,
        BackgroundTransparency = 0.8,
        BorderSizePixel = 0,
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
    }
    local minimumLevel = partyParams.minimumLevel
    local maximumLevel = partyParams.maximumLevel
    local v4 = if maximumLevel then if not (maximumLevel <= 9999) then Abbreviate(maximumLevel) else Comma(maximumLevel) else ""
    v3.Text = ("Lvl. %* - %*"):format(
        if minimumLevel then if not (minimumLevel <= 9999) then Abbreviate(minimumLevel) else Comma(minimumLevel) else "",
        v4
    )
    v3.TextColor3 = Color3.fromRGB(255, 255, 255)
    v3.TextXAlignment = Enum.TextXAlignment.Left
    v3.AutomaticSize = Enum.AutomaticSize.X
    v3.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v3.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v3.Position = UDim2.fromOffset(86, 48)
    v3.Size = UDim2.fromOffset(0, 24)
    v2.textLabel = createElement("TextLabel", v3, {
        uiStroke = createElement("UIStroke", {Thickness = 2}),
        uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8), PaddingRight = UDim.new(0, 8)}),
        uiCorner = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
    })
    return createElement("Frame", v1, v2)
end