-- Script path: ReplicatedStorage.Client.Interfaces.Universal.Components.PlayerList.PlayerListProfile
-- Decompile time: 32.66 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Asset = require(ReplicatedStorage.Shared.Modules.Asset)
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local PVPConstants = require(ReplicatedStorage.Shared.Modules.PVPConstants)
local PVPProfileCard = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.PVPProfileCard)
local React = require(ReplicatedStorage.Shared.UI.React)
local ItemController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ItemController)
local Comma = require(ReplicatedStorage.Client.Modules.Comma)
local ReactUtils = require(ReplicatedStorage.Shared.UI.ReactUtils)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local memo = React.memo
local useState = React.useState
local useBinding = React.useBinding
local createElement = React.createElement
local joinBindings = React.joinBindings
local u90 = memo(function(a1) -- Line: 27
    -- upvalues: useGameStateValue (val), PVPConstants (val), ItemController (val), createElement (val), React (val)
    local Icon, v1, v2, v3, v4
    local Towers = a1.Towers
    local Transparency = a1.Transparency
    local v5 = {}
    local Difficulty = useGameStateValue("Difficulty")
    local v6 = if not a1.IsPVP then 5 else PVPConstants.getLoadoutSize(Difficulty)
    for i = 1, v6 do
        v4 = nil
        v1 = Towers[i]
        if v1 then
            Icon = ItemController:skin(v1, "Default").info.Icon
            v3 = {
                BackgroundTransparency = 1,
                AnchorPoint = Vector2.new(0.5, 0.5),
                Position = UDim2.fromScale(0.5, 0.5),
                Size = UDim2.fromScale(1.1, 1.1),
            }
            v3.Image = not (type(Icon) ~= "number") and ("rbxassetid://%*"):format(Icon) or Icon
            v3.ImageTransparency = Transparency
            v4 = createElement("ImageLabel", v3)
        end
        v2 = createElement("Frame", {
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BackgroundTransparency = Transparency:map(function(a1) -- Line: 56
                return a1 + 0.8
            end),
            Size = UDim2.fromOffset(64, 64),
            LayoutOrder = i,
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            icon = v4,
            uIStroke3 = createElement("UIStroke", {
                Thickness = 2,
                Color = Color3.fromRGB(162, 162, 162),
                Transparency = Transparency,
            }),
        })
        v5[("slot%*"):format(i)] = v2
    end
    return createElement(React.Fragment, {}, v5)
end)
local u93 = memo(function(a1) -- Line: 81 -- upvalues: useState (val), createElement (val), React (val), u90 (val)
    local v1, u4 = useState(0)
    local v2 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
        AnchorPoint = Vector2.new(0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        Position = a1.percentVisible:map(function(a1) -- Line: 89
            return UDim2.new(0, 0, 0, -10)
        end),
    }
    local v3 = {}
    local v4 = {
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 0),
    }

    v4[React.Change.AbsoluteSize] = function(a1) -- Line: 99 -- upvalues: u4 (val)
        u4(a1.AbsoluteSize.Y)
    end

    local v5 = {
        uIPadding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 8), PaddingTop = UDim.new(0, 8)}),
    }
    v5.medals = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.new(1, 0, 0, 80),
    }, {
        content1 = createElement("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(0, 18),
            Size = UDim2.new(1, 0, 1, -20),
        }, {
            uIListLayout = createElement("UIListLayout", {
                Padding = UDim.new(0, 24),
                FillDirection = Enum.FillDirection.Horizontal,
                HorizontalAlignment = Enum.HorizontalAlignment.Center,
                SortOrder = Enum.SortOrder.LayoutOrder,
                VerticalAlignment = Enum.VerticalAlignment.Center,
            }),
            easy = createElement("ImageLabel", {
                Image = "rbxassetid://5326870527",
                BackgroundTransparency = 1,
                ImageTransparency = a1.transparency,
                ImageColor3 = a1.selectedPlayer:map(function(a1) -- Line: 132
                    return a1 and not (a1.Medals.Easy ~= 0) and Color3.new() or Color3.new(1, 1, 1)
                end),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromOffset(48, 48),
            }, {
                value = createElement("TextLabel", {
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Text = a1.selectedPlayer:map(function(a1) -- Line: 148
                        return a1 and a1.Medals.Easy or 0
                    end),
                    TextColor3 = Color3.fromRGB(7, 1, 1),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextTransparency = a1.transparency,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(0.85, 0.85),
                    Size = UDim2.fromOffset(20, 20),
                }, {
                    uIStroke = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = a1.percentAlpha:map(function(a1) -- Line: 163
                            return 1 - a1 * 0.5
                        end),
                    }),
                }),
            }),
            normal = createElement("ImageLabel", {
                Image = "rbxassetid://5326870790",
                BackgroundTransparency = 1,
                LayoutOrder = 1,
                ImageTransparency = a1.transparency:map(function(a1) -- Line: 173
                    return a1 + 0.4
                end),
                ImageColor3 = a1.selectedPlayer:map(function(a1) -- Line: 177
                    return a1 and not (a1.Medals.Normal ~= 0) and Color3.new() or Color3.new(1, 1, 1)
                end),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromOffset(48, 48),
            }, {
                value1 = createElement("TextLabel", {
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Text = a1.selectedPlayer:map(function(a1) -- Line: 194
                        return a1 and a1.Medals.Normal or 0
                    end),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    TextTransparency = a1.transparency,
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(0.85, 0.85),
                    Size = UDim2.fromOffset(20, 20),
                }, {
                    uIStroke1 = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = a1.percentAlpha:map(function(a1) -- Line: 209
                            return 1 - a1 * 0.5
                        end),
                    }),
                }),
            }),
            insane = createElement("ImageLabel", {
                Image = "rbxassetid://5326871573",
                BackgroundTransparency = 1,
                LayoutOrder = 2,
                ImageColor3 = a1.selectedPlayer:map(function(a1) -- Line: 219
                    return a1 and not (a1.Medals.Insane ~= 0) and Color3.new() or Color3.new(1, 1, 1)
                end),
                ImageTransparency = a1.transparency:map(function(a1) -- Line: 224
                    return a1 + 0.4
                end),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Size = UDim2.fromOffset(48, 48),
            }, {
                value2 = createElement("TextLabel", {
                    TextSize = 14,
                    BackgroundTransparency = 1,
                    FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
                    Text = a1.selectedPlayer:map(function(a1) -- Line: 240
                        return a1 and a1.Medals.Insane or 0
                    end),
                    TextColor3 = Color3.fromRGB(255, 255, 255),
                    AnchorPoint = Vector2.new(0.5, 0.5),
                    TextTransparency = a1.transparency,
                    BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                    Position = UDim2.fromScale(0.85, 0.85),
                    Size = UDim2.fromOffset(20, 20),
                }, {
                    uIStroke2 = createElement("UIStroke", {
                        Thickness = 2,
                        Transparency = a1.percentAlpha:map(function(a1) -- Line: 255
                            return 1 - a1 * 0.5
                        end),
                    }),
                }),
            }),
        }),
        divider = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(168, 168, 168),
            BackgroundTransparency = a1.transparency,
            Position = UDim2.fromScale(0.5, 1),
            Size = UDim2.new(1, -20, 0, 1),
        }),
        textLabel = createElement("TextLabel", {
            Text = "Medals Earned",
            TextSize = 16,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AnchorPoint = Vector2.new(0.5, 0),
            TextTransparency = a1.transparency,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.new(0.5, 0, 0, 2),
            Size = UDim2.new(1, 0, 0, 16),
        }),
    })
    v5.stats = createElement("Frame", {
        BackgroundTransparency = 1,
        LayoutOrder = 2,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Size = UDim2.fromScale(1, 0),
    }, {
        uIListLayout1 = createElement("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder}),
        winRatio = createElement("TextLabel", {
            TextSize = 14,
            BackgroundTransparency = 1,
            LayoutOrder = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.winRatio:map(function(a1) -- Line: 308
                local v1 = a1 and ("%*"):format((string.format("%.2f", a1))) or 0
                return "Win Ratio: " .. v1
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = a1.transparency,
            Size = UDim2.fromOffset(0, 24),
        }, {uIPadding2 = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12)})}),
        mapsCleared = createElement("TextLabel", {
            TextSize = 14,
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Heavy, Enum.FontStyle.Normal),
            Text = a1.selectedPlayer:map(function(a1) -- Line: 333
                return "Maps Cleared: " .. (a1 and a1.MapsCleared or 0)
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextTransparency = a1.transparency,
            AutomaticSize = Enum.AutomaticSize.X,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.fromOffset(0, 24),
        }, {uIPadding3 = createElement("UIPadding", {PaddingLeft = UDim.new(0, 12)})}),
    })
    local v6 = false
    if a1.gameMode ~= "PVP" then
        v6 = createElement("Frame", {
            BackgroundTransparency = 1,
            LayoutOrder = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, -20, 0, 180),
        }, {
            uIPadding4 = createElement("UIPadding", {PaddingBottom = UDim.new(0, 8)}),
            divider1 = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundTransparency = a1.transparency,
                BackgroundColor3 = Color3.fromRGB(168, 168, 168),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.new(1, 0, 0, 1),
            }),
            textLabel1 = createElement("TextLabel", {
                Text = "Tower Loadout",
                TextSize = 16,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                TextColor3 = Color3.fromRGB(255, 255, 255),
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.new(0.5, 0, 0, 4),
                Size = UDim2.new(1, 0, 0, 16),
                TextTransparency = a1.transparency,
            }),
            content2 = createElement("Frame", {
                BackgroundTransparency = 1,
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromOffset(0, 28),
                Size = UDim2.fromScale(1, 1),
                Visible = a1.towersVisible,
            }, {
                uIGridLayout = createElement("UIGridLayout", {
                    CellPadding = UDim2.fromOffset(14, 14),
                    CellSize = UDim2.fromOffset(64, 64),
                    SortOrder = Enum.SortOrder.LayoutOrder,
                }),
                frame = createElement(u90, {
                    IsPVP = a1.gameMode == "PVP",
                    Towers = a1.towers,
                    Transparency = a1.transparency,
                }),
            }),
        })
    end
    v5.loadout = v6
    v5.banner = createElement("ImageLabel", {
        BackgroundTransparency = 1,
        Image = a1.mapId:map(function(a1) -- Line: 426
            return a1 or "rbxassetid://4019041718"
        end),
        ScaleType = Enum.ScaleType.Crop,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        ImageTransparency = a1.transparency,
        Position = UDim2.fromOffset(0, 8),
        Size = UDim2.new(1, 0, 0, 50),
    }, {
        playerIcon = createElement("ImageLabel", {
            BackgroundTransparency = 1,
            Image = a1.selectedPlayer:map(function(a1) -- Line: 437
                return a1 and ("rbxthumb://type=AvatarHeadShot&id=%*&w=150&h=150"):format(a1.UserId) or ""
            end),
            AnchorPoint = Vector2.new(1, 1),
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            ImageTransparency = a1.transparency,
            Position = UDim2.fromScale(1, 1),
            Size = UDim2.fromOffset(80, 80),
        }),
        displayName = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
            Text = a1.selectedPlayer:map(function(a1) -- Line: 458
                return a1 and a1.DisplayName or ""
            end),
            TextColor3 = Color3.fromRGB(255, 255, 255),
            TextXAlignment = Enum.TextXAlignment.Left,
            TextTransparency = a1.transparency,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(8, 4),
            Size = UDim2.fromOffset(140, 20),
        }, {
            uIStroke8 = createElement("UIStroke", {
                Thickness = 2,
                Transparency = a1.percentAlpha:map(function(a1) -- Line: 475
                    return 1 - a1 * 0.4
                end),
            }),
        }),
        username = createElement("TextLabel", {
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            BackgroundTransparency = 1,
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal),
            Text = a1.selectedPlayer:map(function(a1) -- Line: 488
                return a1 and ("@%*"):format(a1.Username) or ""
            end),
            TextColor3 = Color3.fromRGB(220, 220, 220),
            TextTransparency = a1.transparency,
            TextXAlignment = Enum.TextXAlignment.Left,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Position = UDim2.fromOffset(8, 28),
            Size = UDim2.fromOffset(140, 14),
        }, {
            uIStroke9 = createElement("UIStroke", {
                Thickness = 2,
                Transparency = a1.percentAlpha:map(function(a1) -- Line: 505
                    return 1 - a1 * 0.4
                end),
            }),
        }),
    })
    v5.uIListLayout2 = createElement("UIListLayout", {
        Padding = UDim.new(0, 4),
        HorizontalAlignment = Enum.HorizontalAlignment.Center,
        SortOrder = Enum.SortOrder.LayoutOrder,
    })
    v3.content = createElement("Frame", v4, v5)
    v3.background = createElement("Frame", {
        ZIndex = 0,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BackgroundTransparency = a1.transparency:map(function(a1) -- Line: 521
            return a1 + 0.4
        end),
        Size = UDim2.new(1, 0, 0, v1),
    }, {uICorner5 = createElement("UICorner")})
    v3.dropShadow = createElement("ImageLabel", {
        Image = "rbxassetid://9239716855",
        BackgroundTransparency = 1,
        ZIndex = -1,
        Visible = false,
        ImageTransparency = a1.transparency:map(function(a1) -- Line: 532
            return a1 + 0.2
        end),
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(14, 14, 64, 24),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        Position = UDim2.fromScale(0.5, 0.5),
        Size = UDim2.new(1, 14, 1, 14),
    })
    return createElement("Frame", v2, v3)
end)
local u96 = memo(function(a1) -- Line: 548
    -- upvalues: ReactUtils (val), PVPConstants (val), createElement (val), PVPProfileCard (val), Comma (val)
    local selectedPlayer = a1.selectedPlayer
    return createElement(PVPProfileCard, {
        anchorPoint = Vector2.new(1, 0),
        size = UDim2.fromScale(1, 1),
        sizeConstraint = Enum.SizeConstraint.RelativeXX,
        transparency = a1.transparency,
        position = a1.percentVisible:map(function(a1) -- Line: 563
            return UDim2.new(1, 0, 0, -10)
        end),
        userId = ReactUtils.map(selectedPlayer, function(a1) -- Line: 567
            return a1 and a1.UserId or 1
        end),
        userName = ReactUtils.map(selectedPlayer, function(a1) -- Line: 570
            return a1 and a1.Username or "N/A"
        end),
        displayName = ReactUtils.map(selectedPlayer, function(a1) -- Line: 573
            local DisplayName = if not a1 then "N/A" else a1.DisplayName or a1.Username or "N/A"
            if a1 and a1.Verified then
                DisplayName = ("%* %*"):format(utf8.char(57344), DisplayName)
            end
            return DisplayName
        end),
        rankName = ReactUtils.map(ReactUtils.map(ReactUtils.map(selectedPlayer, function(a1) -- Line: 551
            return a1 and a1.Rank or -1
        end), function(a1) -- Line: 554 -- upvalues: PVPConstants (upval)
            return PVPConstants.RANK_DATA[tostring(a1)]
        end), function(a1) -- Line: 583
            return a1.Name
        end),
        wins = ReactUtils.map(selectedPlayer, function(a1) -- Line: 586 -- upvalues: Comma (upval)
            return Comma((a1 or {}).PVPWins or 0)
        end),
        losses = ReactUtils.map(selectedPlayer, function(a1) -- Line: 589 -- upvalues: Comma (upval)
            return Comma((a1 or {}).PVPLosses or 0)
        end),
        enemiesSent = ReactUtils.map(selectedPlayer, function(a1) -- Line: 592 -- upvalues: Comma (upval)
            return Comma((a1 or {}).EnemiesSent or 0)
        end),
        enemiesKilled = ReactUtils.map(selectedPlayer, function(a1) -- Line: 595 -- upvalues: Comma (upval)
            return Comma((a1 or {}).EnemiesKilled or 0)
        end),
    })
end)
return function(a1) -- Line: 601
    -- upvalues: RunService (val), joinBindings (val), Players (val), useGameStateValue (val), useBinding (val)
    -- upvalues: useState (val), useSpring (val), useReactBindings (val), Asset (val), Enum (val), createElement (val)
    -- upvalues: u93 (val), u96 (val), GlowButton (val)
    local SelectedPlayer = a1.SelectedPlayer
    local IsVisible = a1.IsVisible
    if RunService:IsRunning() then
        IsVisible = (joinBindings({IsVisible, SelectedPlayer})):map(function(a1) -- Line: 606 -- upvalues: Players (upval)
            local v1, v2 = unpack(a1)
            if not v1 then
                return false
            end
            if v2 and Players:GetPlayerByUserId(v2.UserId) then
                return true
            end
            return false
        end)
    end
    local v1 = useGameStateValue("GameMode", "")
    local v2, u27 = useBinding(SelectedPlayer:getValue())
    local v3, u31 = useState({})
    local v4, u35 = useBinding("")
    local u38, u39 = useState(false)
    local v5, u48 = useSpring(a1.Visibility or 0, 0.7, 30, true)
    local v6, u56 = useSpring(a1.Visibility or 0, 1, 40, true)
    local v7 = v6:map(function(a1) -- Line: 631
        return 1 - a1
    end)
    local v8 = SelectedPlayer:map(function(a1) -- Line: 635
        return a1 and a1.Map or "Grass Isle"
    end)
    local v9 = SelectedPlayer:map(function(a1) -- Line: 639
        local Stats = a1 and a1.Stats or {}
        return (Stats.Triumphs or 0) / math.max(1, Stats.Deaths or 0)
    end)
    local v10 = {IsVisible}
    useReactBindings(function(a1) -- Line: 644 -- upvalues: u48 (val), u56 (val)
        u48(if not a1 then 0 else 1)
        u56(if not a1 then 0 else 1)
    end, v10)
    v10 = {SelectedPlayer}
    useReactBindings(function(a1) -- Line: 649 -- upvalues: u27 (val), u31 (val)
        if a1 and 1 < a1.UserId then
            u27(a1)
        end
        u31(a1 and a1.Towers or {})
    end, v10)
    v10 = {v8}
    useReactBindings(function(a1) -- Line: 658 -- upvalues: u35 (val), Asset (upval), Enum (upval)
        local u1 = true
        u35("")
        task.spawn(function() -- Line: 662 -- upvalues: Asset (upval), a1 (val), Enum (upval), u1 (ref), u35 (upval)
            local v1 = Asset("NewMaps", a1, Enum.Gamemode.Survival)
            if v1 and u1 then
                u35((("rbxassetid://%*"):format(v1.ImageID)))
            end
        end)
        return function() -- Line: 669 -- upvalues: u1 (ref)
            u1 = false
        end
    end, v10)
    v10 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(1, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Size = UDim2.fromOffset(240, 0),
        Position = v5:map(function(a1) -- Line: 681
            return UDim2.new((1 - a1) * 0.5, -8, 0, 8)
        end),
    }
    local v11 = {
        list = createElement("UIListLayout", {
            HorizontalAlignment = Enum.HorizontalAlignment.Center,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        pveProfile = if u38 then nil else createElement(u93, {
            selectedPlayer = v2,
            isVisible = IsVisible,
            transparency = v7,
            percentVisible = v5,
            percentAlpha = v6,
            mapId = v4,
            winRatio = v9,
            gameMode = v1,
            towers = v3,
        }),
        pvpProfile = if not u38 then nil else createElement(u96, {
            selectedPlayer = v2,
            isVisible = IsVisible,
            transparency = v7,
            percentVisible = v5,
            percentAlpha = v6,
        }),
    }
    local v12 = {
        LayoutOrder = 10,
        Size = UDim2.fromOffset(150, 35),
        transparency = v7,
        text = ("Switch to %*"):format(if not u38 then "PVP" else "PVE"),
    }
    local v13 = if u38 then Color3.fromRGB(60, 200, 255) else Color3.fromRGB(255, 60, 60)
    v12.color = v13

    function v12.clicked() -- Line: 726 -- upvalues: u39 (val), u38 (val)
        u39(not u38)
    end

    v11.switchProfile = createElement(GlowButton, v12)
    return createElement("Frame", v10, v11)
end