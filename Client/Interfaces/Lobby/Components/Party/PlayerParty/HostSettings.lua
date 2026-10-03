-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PlayerParty.HostSettings
-- Decompile time: 2.86 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Abbreviate = require(ReplicatedStorage.Shared.Modules.Abbreviate)
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local PartyContext = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.Party.PartyContext)
local React = require(ReplicatedStorage.Shared.UI.React)
local Setting = require(ReplicatedStorage.Client.Interfaces.Components.Settings.Setting)
local TextLabel = require(ReplicatedStorage.Client.Interfaces.Components.TextLabel)
local createElement = React.createElement

local function formatNumber(a1) -- Line: 17 -- upvalues: Comma (val), Abbreviate (val) -- types: a1: number
    if not a1 then
        return ""
    end
    if a1 <= 9999 then
        return Comma(a1)
    end
    return Abbreviate(a1)
end

return function(a1) -- Line: 29
    -- upvalues: React (val), PartyContext (val), createElement (val), Setting (val), Comma (val), Abbreviate (val)
    -- upvalues: TextLabel (val)
    local u4 = React.useContext(PartyContext)
    local partyParams = u4.partyParams
    local partyLocked = partyParams.partyLocked
    local membersCanInvite = partyParams.membersCanInvite
    local minimumLevel = partyParams.minimumLevel
    local maximumLevel = partyParams.maximumLevel
    return createElement("Frame", {
        BackgroundTransparency = 0.2,
        BorderSizePixel = 0,
        ZIndex = 4,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(30, 30, 30),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.new(0.75, 5, 0.5, 0),
        Size = UDim2.fromOffset(384, 384),
        Visible = a1.visible,
    }, {
        scrollList = createElement("ScrollingFrame", {
            BottomImage = "rbxassetid://6275896591",
            MidImage = "rbxassetid://6275893557",
            TopImage = "rbxassetid://6275890853",
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            Selectable = false,
            ZIndex = 2,
            ElasticBehavior = Enum.ElasticBehavior.Never,
            AnchorPoint = Vector2.new(0, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.new(1, 20, 1, -16),
            CanvasSize = UDim2.fromScale(0, 0),
        }, {
            options = React.createElement(React.Fragment, nil, {
                locked = createElement(Setting, {
                    Description = "",
                    Icon = 15117261700,
                    LayoutOrder = 0,
                    Title = "Party Lock",
                    Type = "Switch",
                    AnchorPoint = Vector2.new(0, 0.5),
                    IconAnchorPoint = Vector2.new(0.5, 0.5),
                    IconPosition = UDim2.new(0, 38, 0.5, 0),
                    IconSize = UDim2.fromOffset(30, 30),
                    Size = UDim2.new(0.93, 0, 0, 54),
                    Value = {
                        Name = "partyLocked",
                        Type = "Switch",
                        Current = partyLocked,
                        UpdateSetting = function(a1, a2) -- Line: 80 -- upvalues: u4 (val)
                            u4.onUpdateSettingsCallback(a1, a2)
                        end,
                        SwitchProps = {HideText = true, IconPosition = UDim2.fromScale(0.5, 0.5)},
                    },
                }),
                maximumLevel = createElement(Setting, {
                    Description = "",
                    Icon = 13126940137,
                    LayoutOrder = 2,
                    Title = "Maximum Level",
                    Type = "IntegerInput",
                    AnchorPoint = Vector2.new(0, 0.5),
                    IconAnchorPoint = Vector2.new(0.5, 0.5),
                    IconPosition = UDim2.new(0, 38, 0.5, 0),
                    IconSize = UDim2.fromOffset(40, 40),
                    Size = UDim2.new(0.93, 0, 0, 54),
                    Value = {
                        Name = "maximumLevel",
                        Type = "IntegerInput",
                        Current = if maximumLevel then if not (maximumLevel <= 9999) then Abbreviate(maximumLevel) else Comma(maximumLevel) else "",
                        UpdateSetting = function(a1, a2) -- Line: 105 -- upvalues: minimumLevel (val), u4 (val)
                            u4.onUpdateSettingsCallback(a1, (math.round((math.max(a2, minimumLevel)))))
                        end,
                    },
                }),
                membersCanInvite = createElement(Setting, {
                    Description = "",
                    Icon = 15117261700,
                    LayoutOrder = 1,
                    Title = "Members Can Invite",
                    Type = "Switch",
                    AnchorPoint = Vector2.new(0, 0.5),
                    IconAnchorPoint = Vector2.new(0.5, 0.5),
                    IconPosition = UDim2.new(0, 38, 0.5, 0),
                    IconSize = UDim2.fromOffset(40, 40),
                    Size = UDim2.new(0.93, 0, 0, 54),
                    Value = {
                        Name = "membersCanInvite",
                        Type = "Switch",
                        Current = membersCanInvite,
                        UpdateSetting = function(a1, a2) -- Line: 129 -- upvalues: u4 (val)
                            u4.onUpdateSettingsCallback(a1, a2)
                        end,
                        SwitchProps = {HideText = true, IconPosition = UDim2.fromScale(0.5, 0.5)},
                    },
                }),
                minimumLevel = createElement(Setting, {
                    Description = "",
                    Icon = "13126940137",
                    LayoutOrder = 3,
                    Title = "Minimum Level",
                    Type = "IntegerInput",
                    AnchorPoint = Vector2.new(0, 0.5),
                    IconAnchorPoint = Vector2.new(0.5, 0.5),
                    IconPosition = UDim2.new(0, 38, 0.5, 0),
                    IconSize = UDim2.fromOffset(40, 40),
                    Size = UDim2.new(0.93, 0, 0, 54),
                    Value = {
                        Name = "minimumLevel",
                        Type = "IntegerInput",
                        Current = if minimumLevel then if not (minimumLevel <= 9999) then Abbreviate(minimumLevel) else Comma(minimumLevel) else "",
                        UpdateSetting = function(a1, a2) -- Line: 154 -- upvalues: maximumLevel (val), u4 (val)
                            u4.onUpdateSettingsCallback(a1, (math.round((math.clamp(a2, 1, maximumLevel)))))
                        end,
                    },
                }),
            }),
            uiListLayout = createElement("UIListLayout", {Padding = UDim.new(0, 8), SortOrder = Enum.SortOrder.LayoutOrder}),
            uiPadding = createElement("UIPadding", {PaddingLeft = UDim.new(0, 8)}),
        }),
        title = createElement(TextLabel, {
            FontWeight = "Heavy",
            Text = "Party Settings",
            TextScaled = true,
            TextWrapped = true,
            StrokeThickness = 2,
            StrokeTransparency = 0.5,
            TextXAlignment = Enum.TextXAlignment.Left,
            AnchorPoint = Vector2.new(0, 0.4),
            Position = UDim2.fromOffset(2, -18),
            Size = UDim2.new(1, -128, 0, 20),
        }),
    })
end