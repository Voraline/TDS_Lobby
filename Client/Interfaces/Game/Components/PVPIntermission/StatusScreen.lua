-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVPIntermission.StatusScreen
-- Decompile time: 46.26 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local HotbarButton = require(ReplicatedStorage.Client.Interfaces.Universal.Components.Hotbar.HotbarButton)
local InventoryCategory = require(script.Parent.InventoryCategory)
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local PVPIntermissionStore = require(ReplicatedStorage.Client.Interfaces.Stores.Game.PVPIntermissionStore)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactCharm = require(ReplicatedStorage.Packages.ReactCharm)
local TeamMember = require(script.Parent.TeamMember)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local usePlayerReplicatorValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePlayerReplicatorValue)
local usePropertyValue = require(ReplicatedStorage.Client.Interfaces.Hooks.usePropertyValue)
local useSound = require(ReplicatedStorage.Client.Interfaces.Hooks.useSound)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local useUpdateEffect = require(ReplicatedStorage.Client.Interfaces.Hooks.useUpdateEffect)
local Event = React.Event
local createElement = React.createElement
local LocalPlayer = Players.LocalPlayer
local u122 = {}
u122[Enum.SkinRarity.Common] = (Color3.fromRGB(162, 162, 162))
u122[Enum.SkinRarity.Uncommon] = (Color3.fromRGB(85, 255, 127))
u122[Enum.SkinRarity.Rare] = (Color3.fromRGB(0, 170, 255))
u122[Enum.SkinRarity.Legendary] = (Color3.fromRGB(170, 85, 255))
u122[Enum.SkinRarity.Golden] = (Color3.fromRGB(255, 223, 0))
u122[Enum.SkinRarity.Exclusive] = (Color3.fromRGB(255, 0, 0))
u122[Enum.SkinRarity.Event] = (Color3.fromRGB(255, 0, 0))
local u172 = {
    Cooldown = true,
    Damage = true,
    Income = true,
    Range = true,
    SpawnTime = true,
}
local Inventory = Network.Channel("Inventory")
return function() -- Line: 53
    -- upvalues: useGameStateValue (val), usePlayerReplicatorValue (val), LocalPlayer (val), ReactCharm (val)
    -- upvalues: PVPIntermissionStore (val), usePropertyValue (val), ReplicatedStorage (val), useCache (val), Enum (val)
    -- upvalues: GameState (val), React (val), createElement (val), TeamMember (val), math (val), useSound (val)
    -- upvalues: useSpring (val), Asset (val), u122 (val), Inventory (val), u172 (val), HotbarButton (val)
    -- upvalues: useUpdateEffect (val), ItemController (val), InventoryCategory (val), Event (val)
    local Defaults, DisplayName, Golden, Icon, SkinData, v1, v2, v3, v4, v5, v6, v7, v8
    local u295 = usePlayerReplicatorValue(
        LocalPlayer,
        if not (useGameStateValue("GameMode") == "PVP") then "EquippedTowers" else "EquippedPVPTowers",
        {"Scout"}
    )
    local u307 = ReactCharm.useSignalState(PVPIntermissionStore.getState)
    local v9 = usePropertyValue(ReplicatedStorage.State.PriceScale, "Value")
    local v10 = useCache("Inventory.Troops", {Scout = {Skin = "Default", Equipped = true, GoldenPerks = false}})
    local u50 = useGameStateValue("Teams", {
        Enum.Team.Red,
        [99053014] = Enum.Team.Red,
        [32345429] = Enum.Team.Blue,
        [24941] = Enum.Team.Blue,
    })
    if GameState.IsModifierEnabled("Inflation") then
        v9 = math.round(v9 * 1.5)
    end
    local v11 = {u50}
    local v12 = React.useMemo(function() -- Line: 79 -- upvalues: u50 (val), Enum (upval), createElement (upval), TeamMember (upval), math (upval)
        local v1, v2, v3, v4, v5
        local v6 = u50 or {}
        local v7 = {}
        local v8 = {}
        for i, j in Enum.Team do
            v7[j] = {}
            v8[j] = 0
        end
        for k, n in v6 do
            v8[n] = v8[n] + 1
        end
        local v9 = nil
        local v10 = nil
        for m, i5 in v6, v9, v10 do
            v4 = i5 == Enum.Team.Red
            v5 = #v7[i5] + 1
            v1 = v7[i5]
            v2 = createElement
            v3 = {
                UserId = m,
                Size = UDim2.fromScale(
                    1 / v8[i5],
                    math.lerp(if not v4 then 0.5 else 0.4, if not v4 then 0.4 else 0.5, if v8[i5] ~= 1 then (v5 - 1) / (v8[i5] - 1) else 1)
                ),
                idx = v5,
            }
            v2 = v2(TeamMember, v3)
            table.insert(v1, v2)
        end
        v7.teamSizes = v8
        return v7
    end, v11)
    local InventoryOpen = useSound("InventoryOpen")
    local Unequip = useSound("Unequip")
    local Hover = useSound("Hover")
    local v13, u1363 = useSpring(1, 1, 40, true)
    local v14 = {}
    for i = 1, 4 do
        local u90 = u295[i]
        v1 = React.useRef()
        v2 = {
            Icon = "",
            Selected = false,
            Level = 999,
            LayoutOrder = i,
            Ref = v1,
            Enabled = u307.Enabled,
            OnActivate = function() end,
        }
        if u90 then
            v3 = v10[u90]
            if v3 then
                v4 = Asset("Troops", u90, nil, "PVP")
                v5 = Asset("Troops", u90, v3.Skin)
                if v4 and v5 then
                    Golden = v3.GoldenPerks and v4.Stats.Golden and v4.Stats.Golden or v4.Stats.Default
                    Defaults = Golden.Defaults
                    SkinData = v4.Properties.SkinData or {}
                    v6 = SkinData[v3.Skin]
                    if Defaults then
                        v7 = math.floor(Defaults.Price * v9)
                        if GameState.IsModifierEnabled("Inflation") then
                            v7 = math.floor(v7 * 1.5)
                        end
                        DisplayName = v6 and v6.DisplayName or v4.Properties.DisplayName or u90
                        v2.Name = DisplayName
                        v2.Description = "Tower Stats"
                        Icon = if not v6 then v4.Preview.Icon else v6.Icon
                        v2.Icon = Icon
                        v2.Price = v7
                        v8 = v6 and v6.Rarity and u122[v6.Rarity] or u122[Enum.SkinRarity.Common]
                        v2.Color = v8

                        function v2.OnActivate() -- Line: 185 -- upvalues: Inventory (upval), u90 (val)
                            Inventory:FireServer("Unequip", "PVPTower", u90)
                        end

                        v2.Selected = false
                        v2.Stats = {}
                        for j, k in Defaults do
                            if u172[j] then
                                v2.Stats[j] = k
                            end
                        end
                    end
                end
            else
                warn((("No inventory entry for troop %* found"):format(u90)))
            end
        end
        table.insert(v14, (createElement(HotbarButton, v2)))
    end
    local v15 = useUpdateEffect
    local v16 = {u307.Enabled}
    v15(function() -- Line: 206 -- upvalues: u307 (val), InventoryOpen (val), Unequip (val)
        if u307.Enabled then
            InventoryOpen()
            return
        end
        Unequip()
    end, v16)
    v16 = {u295}
    v15 = React.useMemo(function() -- Line: 214
        -- upvalues: ItemController (upval), createElement (upval), InventoryCategory (upval), u295 (val)
        local v1 = {}
        for i, j in (ItemController:subcategorize("towers")) do
            v1[j.name] = (createElement(InventoryCategory, {
                Idx = i,
                Name = j.name,
                Color = j.color,
                Items = j.items,
                EquippedTroops = u295,
            }))
        end
        return v1
    end, v16)
    local v17 = createElement
    local v18 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.fromScale(0.5, 0.7),
        Visible = u307.Enabled,
    }
    v1 = {}
    v2 = createElement
    v4 = {
        BackgroundTransparency = 0.25,
        BorderSizePixel = 0,
        BackgroundColor3 = Color3.fromRGB(17, 17, 17),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromScale(1, 1),
    }
    v5 = {
        hotbarTower = createElement("Frame", {
            BackgroundTransparency = 0.35,
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.new(0.5, 0, 0, 56),
            Size = UDim2.fromOffset(384, 104),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 16),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(0, 12)}),
            content = React.createElement(React.Fragment, {}, v14),
        }),
        troops = createElement("ScrollingFrame", {
            BottomImage = "http://www.roblox.com/asset/?id=6275896591",
            MidImage = "http://www.roblox.com/asset/?id=6275893557",
            TopImage = "http://www.roblox.com/asset/?id=6275890853",
            BackgroundTransparency = 0.5,
            BorderSizePixel = 0,
            Selectable = false,
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            ElasticBehavior = Enum.ElasticBehavior.Never,
            ScrollingDirection = Enum.ScrollingDirection.Y,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(0, 0, 0),
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, -32, 1, -192),
        }, {
            content = React.createElement(React.Fragment, {}, v15),
            uIListLayout1 = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder}),
            uIPadding = createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 8),
                PaddingLeft = UDim.new(0, 8),
                PaddingRight = UDim.new(0, 8),
                PaddingTop = UDim.new(0, 8),
            }),
        }),
        towersTitle = createElement("Frame", {
            BorderSizePixel = 0,
            LayoutOrder = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.new(0.5, 0, 0, 176),
            Size = UDim2.new(0.5, 0, 0, 4),
        }, {
            uIGradient = createElement("UIGradient", {
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 1),
                    NumberSequenceKeypoint.new(0.5, 0),
                    (NumberSequenceKeypoint.new(1, 1)),
                }),
            }),
            streak = createElement("TextLabel", {
                Text = "Towers",
                TextSize = 28,
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.new(1, 0, 0, 32),
            }, {uIStroke2 = createElement("UIStroke", {Thickness = 3})}),
        }),
        loadout = createElement("ImageButton", {
            Image = "http://www.roblox.com/asset/?id=8429088937",
            BackgroundTransparency = 1,
            ImageColor3 = Color3.fromRGB(77, 231, 113),
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(8, 8, 152, 32),
            AnchorPoint = Vector2.new(0.5, 0),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0, 16),
            Size = UDim2.fromOffset(256, 32),
        }, {
            value = createElement("TextLabel", {
                Text = "Team #1",
                TextScaled = true,
                TextSize = 14,
                TextWrapped = true,
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1, 0.7),
            }, {uIStroke3 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5})}),
            abilityOptions = createElement("Frame", {
                BackgroundTransparency = 0.2,
                Visible = false,
                AnchorPoint = Vector2.new(0.5, 1),
                AutomaticSize = Enum.AutomaticSize.Y,
                BackgroundColor3 = Color3.fromRGB(9, 9, 9),
                Position = UDim2.new(0.5, 0, 0, -8),
                Size = UDim2.fromScale(1, 0),
            }, {
                uIListLayout2 = createElement("UIListLayout", {
                    Padding = UDim.new(0, 8),
                    HorizontalAlignment = Enum.HorizontalAlignment.Center,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                textButton = createElement("TextButton", {
                    Text = "Call To Arms",
                    TextSize = 22,
                    LayoutOrder = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundColor3 = Color3.fromRGB(85, 170, 255),
                    Size = UDim2.new(1, 0, 0, 32),
                }, {
                    textStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
                }),
                uIPadding1 = createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8),
                    PaddingLeft = UDim.new(0, 8),
                    PaddingRight = UDim.new(0, 8),
                    PaddingTop = UDim.new(0, 8),
                }),
                textButton1 = createElement("TextButton", {
                    Text = "Medic Heal",
                    TextSize = 22,
                    BackgroundTransparency = 0.2,
                    LayoutOrder = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(223, 223, 223),
                    BackgroundColor3 = Color3.fromRGB(56, 56, 56),
                    Size = UDim2.new(1, 0, 0, 32),
                }, {
                    textStroke1 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
                }),
                uIStroke4 = createElement("UIStroke", {
                    Thickness = 2,
                    ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                    Color = Color3.fromRGB(157, 157, 157),
                    LineJoinMode = Enum.LineJoinMode.Bevel,
                }),
                title = createElement("TextLabel", {
                    Text = "Set Priority",
                    TextSize = 16,
                    TextStrokeTransparency = 0,
                    TextWrapped = true,
                    BackgroundTransparency = 1,
                    LayoutOrder = -1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Size = UDim2.fromOffset(200, 20),
                }),
                textButton2 = createElement("TextButton", {
                    Text = "Swarmer's Throw",
                    TextSize = 22,
                    BackgroundTransparency = 0.2,
                    LayoutOrder = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(223, 223, 223),
                    BackgroundColor3 = Color3.fromRGB(56, 56, 56),
                    Size = UDim2.new(1, 0, 0, 32),
                }, {
                    textStroke2 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
                }),
                textButton3 = createElement("TextButton", {
                    Text = "Mega Brap",
                    TextSize = 22,
                    BackgroundTransparency = 0.2,
                    LayoutOrder = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(223, 223, 223),
                    BackgroundColor3 = Color3.fromRGB(56, 56, 56),
                    Size = UDim2.new(1, 0, 0, 32),
                }, {
                    textStroke3 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
                }),
                textButton4 = createElement("TextButton", {
                    Text = "Automatic",
                    TextSize = 22,
                    BackgroundTransparency = 0.2,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                    TextColor3 = Color3.fromRGB(134, 182, 255),
                    BackgroundColor3 = Color3.fromRGB(56, 56, 56),
                    Size = UDim2.new(1, 0, 0, 32),
                }, {
                    textStroke4 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, Color = Color3.fromRGB(38, 38, 38)}),
                }),
            }),
        }),
        uICorner3 = createElement("UICorner"),
        dropShadow = createElement("ImageLabel", {
            Image = "http://www.roblox.com/asset/?id=9239716855",
            BackgroundTransparency = 1,
            ZIndex = -1,
            ScaleType = Enum.ScaleType.Slice,
            SliceCenter = Rect.new(14, 14, 64, 24),
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.new(1, 14, 1, 14),
        }),
        versus = createElement("Frame", {
            BorderSizePixel = 0,
            ZIndex = -1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.new(1, 0, 0, 167),
        }, {
            uIGradient1 = createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 0, 0)),
                    (ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 170, 255))),
                }),
                Transparency = NumberSequence.new({
                    NumberSequenceKeypoint.new(0, 0),
                    NumberSequenceKeypoint.new(0.15, 0.75),
                    NumberSequenceKeypoint.new(0.3, 1),
                    NumberSequenceKeypoint.new(0.5, 1),
                    NumberSequenceKeypoint.new(0.7, 1),
                    NumberSequenceKeypoint.new(0.85, 0.75),
                    (NumberSequenceKeypoint.new(1, 0)),
                }),
            }),
            redTeam = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Size = UDim2.fromScale(0.3, 1),
            }, {
                list = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Left,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(-(v12.teamSizes[Enum.Team.Red] * 0.1), 0),
                }),
                content = React.createElement(React.Fragment, {}, v12[Enum.Team.Red]),
            }),
            blueTeam = createElement("ImageLabel", {
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                ClipsDescendants = true,
                AnchorPoint = Vector2.new(1, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(1, 0),
                Size = UDim2.fromScale(0.3, 1),
            }, {
                list = createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal,
                    HorizontalAlignment = Enum.HorizontalAlignment.Right,
                    VerticalAlignment = Enum.VerticalAlignment.Bottom,
                    SortOrder = Enum.SortOrder.LayoutOrder,
                    Padding = UDim.new(-(v12.teamSizes[Enum.Team.Blue] * 0.1), 0),
                }),
                content = React.createElement(React.Fragment, {}, v12[Enum.Team.Blue]),
            }),
            uICorner4 = createElement("UICorner"),
        }),
        title1 = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(0, -8),
            Size = UDim2.fromOffset(256, 28),
        }, {
            textLabel2 = createElement("TextLabel", {
                Text = "10 Slot Tickets",
                TextScaled = true,
                TextSize = 30,
                TextWrapped = true,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 170, 0),
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.55, 0.5),
                Size = UDim2.fromScale(0.7, 0.8),
            }, {
                uIStroke5 = createElement("UIStroke", {Thickness = 2, Color = Color3.fromRGB(74, 23, 23)}),
                uIGradient2 = createElement("UIGradient", {
                    Rotation = 90,
                    Color = ColorSequence.new({
                        ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.6, Color3.fromRGB(255, 255, 255)),
                        ColorSequenceKeypoint.new(0.601, Color3.fromRGB(235, 235, 235)),
                        (ColorSequenceKeypoint.new(1, Color3.fromRGB(235, 235, 235))),
                    }),
                }),
            }),
            imageLabel = createElement("ImageLabel", {
                Image = "rbxassetid://17447487817",
                BackgroundTransparency = 1,
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                BorderColor3 = Color3.fromRGB(0, 0, 0),
                Position = UDim2.fromScale(0.1, 0.5),
                Size = UDim2.fromScale(0.2, 1),
            }, {uIAspectRatioConstraint = createElement("UIAspectRatioConstraint")}),
        }),
    }
    local v19 = createElement
    v6 = {
        Text = "",
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        LayoutOrder = 6,
        Position = UDim2.fromScale(1, 0),
        Selectable = false,
        Size = UDim2.fromOffset(44, 44),
    }

    v6[Event.MouseButton1Click] = function() -- Line: 680 -- upvalues: PVPIntermissionStore (upval)
        PVPIntermissionStore.setEnabled(false)
    end

    v6[Event.MouseButton1Down] = function() -- Line: 683 -- upvalues: u1363 (val)
        u1363(0.9)
    end

    v6[Event.MouseEnter] = function() -- Line: 686 -- upvalues: Hover (val), u1363 (val)
        Hover()
        u1363(1.1)
    end

    v6[Event.MouseLeave] = function() -- Line: 690 -- upvalues: u1363 (val)
        u1363(1)
    end

    v6[Event.MouseButton1Up] = function() -- Line: 693 -- upvalues: u1363 (val)
        u1363(1)
    end

    v5.leave = v19("TextButton", v6, {
        scale = createElement("UIScale", {Scale = v13}),
        content = createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(255, 60, 60),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = UDim2.fromScale(1, 1),
        }, {
            uICorner5 = createElement("UICorner", {CornerRadius = UDim.new(0, 6)}),
            uIStroke6 = createElement("UIStroke", {
                Thickness = 2,
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
                Color = Color3.fromRGB(168, 58, 58),
            }),
            icon2 = createElement("ImageLabel", {
                Image = "http://www.roblox.com/asset/?id=9674219565",
                BackgroundTransparency = 1,
                ImageColor3 = Color3.fromRGB(235, 235, 235),
                ScaleType = Enum.ScaleType.Fit,
                AnchorPoint = Vector2.new(0.5, 0.5),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromOffset(24, 24),
            }, {uIAspectRatioConstraint1 = createElement("UIAspectRatioConstraint")}),
        }),
    })
    v1.frame = v2("ImageLabel", v4, v5)
    return v17("Frame", v18, v1)
end