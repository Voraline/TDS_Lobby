-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVP.PVPTowerInventory
-- Decompile time: 40.98 ms

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage.Shared.Modules
local Interfaces = ReplicatedStorage.Client.Interfaces
local Content = require(Modules.Content)
local Enum = require(Modules.Enum)
local IconButton = require(ReplicatedStorage.Client.Interfaces.Components.IconButton)
local React = require(ReplicatedStorage.Shared.UI.React)
local fzy = require(Modules.fzy)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Towers = require(ReplicatedStorage.Shared.Data.Icons).Towers
local PVPTowerInventoryFilter = require(script.Parent.PVPTowerInventoryFilter)
local useGameStateValue = require(ReplicatedStorage.Client.Interfaces.Hooks.useGameStateValue)
local PVPTowerInventoryHotbar = require(Interfaces.Game.Components.PVP.PVPTowerInventoryHotbar)
local ImageLabel = require(Interfaces.Components.ImageLabel)
local PVPTeamDevision = require(script.Parent.PVPTeamDevision)
local PVPTeamPlayers = require(Interfaces.Game.Components.PVP.PVPTeamPlayers)
local PVPTowerInventoryTroop = require(script.Parent.PVPTowerInventoryTroop)
local Fragment = React.Fragment
local createElement = React.createElement
local useCallback = React.useCallback
local useEffect = React.useEffect
local useState = React.useState
local useMemo = React.useMemo
local useRef = React.useRef
local memo = React.memo
local u91 = {}
u91.Starter = Color3.fromRGB(255, 255, 255)
u91.Intermediate = Color3.fromRGB(255, 255, 255)
u91.Advanced = Color3.fromRGB(255, 255, 255)
u91.Hardcore = Color3.fromRGB(153, 77, 228)
u91.Evolved = Color3.fromRGB(0, 208, 212)
u91.Exclusive = Color3.fromRGB(225, 20, 20)
local u122 = {
    {icon = 11702759774, text = "Offense"},
    {icon = 11702759774, text = "Defense"},
    {icon = 11702759774, text = "Support"},
}
local LocalPlayer = Players.LocalPlayer
local Tower = Content("Tower")
local Consumables = Content("Consumables")
local u139 = table.reduce(Tower:GetChildren(), function(a1, a2, a3) -- Line: 55 -- upvalues: Enum (val), table (val)
    local Stats = require(a2.Stats)
    table.insert(a1, {
        Name = a2.Name,
        Role = Stats.Properties.Role,
        Category = Stats.Properties.Category and Enum.TowerCategory.ToString(Stats.Properties.Category) or "None",
        Stats = Stats,
    })
    return a1
end, {})
local u146 = table.reduce(Consumables:GetChildren(), function(a1, a2, a3) -- Line: 72
    local Data = require(a2.Data)
    if Data.Disabled then
        return a1
    end
    a1[Data.Name] = Data
    return a1
end, {})
local u149 = memo(function(a1) -- Line: 118 -- upvalues: createElement (val)
    local v1 = {
        BackgroundTransparency = 1,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
    }
    local Size = a1.Size or UDim2.new(1, 0, 0, 40)
    v1.Size = Size
    local v2 = {
        divider = createElement("Frame", {
            BorderSizePixel = 0,
            AnchorPoint = Vector2.new(0.5, 1),
            BackgroundColor3 = Color3.fromRGB(113, 113, 113),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.new(0.5, 0, 1, -6),
            Size = UDim2.new(1, -40, 0, 2),
        }),
    }
    local v3 = {
        BackgroundTransparency = 1,
        TextSize = 25,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0),
        Size = UDim2.new(1, -20, 1, -10),
        Text = a1.text,
    }
    local color = a1.color or Color3.new(1, 1, 1)
    v3.TextColor3 = color
    v3.TextXAlignment = Enum.TextXAlignment.Left
    v2.title = createElement("TextLabel", v3, {
        uIStroke = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
    })
    return createElement("Frame", v1, v2)
end)
local u152 = memo(function(a1) -- Line: 160
    -- upvalues: table (val), createElement (val), PVPTowerInventoryTroop (val), u149 (val), React (val)
    local title = a1.title
    local selected = a1.selected
    local v1 = table.reduce(a1.troops, function(a1, a2, a3) -- Line: 164 -- upvalues: createElement (upval), PVPTowerInventoryTroop (upval), selected (val)
        local name = a2.name
        local v1 = createElement
        local v2 = {
            Visible = a2.Visible,
            LayoutOrder = a2.LayoutOrder,
            Size = a2.Size,
            banning = a2.banning,
            locallyBanning = a2.locallyBanning,
            banned = a2.banned,
            locked = a2.locked,
            equipped = a2.equipped,
            selected = a2.name == selected,
            name = a2.name,
            icon = a2.icon,
            clicked = a2.clicked,
            tooltip = a2.tooltip,
        }
        a1[name] = (v1(PVPTowerInventoryTroop, v2))
        return a1
    end, {})
    if title == "None" or title == "Starter" then
        title = nil
    end
    local v2 = createElement
    local v3 = {BackgroundTransparency = 1, BorderSizePixel = 0, AutomaticSize = Enum.AutomaticSize.Y}
    local Size = a1.Size or UDim2.new(1, -12, 0, 0)
    v3.Size = Size
    v3.LayoutOrder = a1.LayoutOrder
    v3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    v3.BorderColor3 = Color3.fromRGB(27, 42, 53)
    return v2("Frame", v3, {
        title = title and createElement(u149, {text = title:upper(), color = a1.color}),
        holder = createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, -15, 0, 0),
            Position = UDim2.new(0.5, 0, 0, if not title then 0 else 40),
            AnchorPoint = Vector2.new(0.5, 0),
        }, {
            gridLayout = createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(8, 8),
                CellSize = UDim2.fromOffset(118, 118),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            troops = createElement(React.Fragment, {}, v1),
        }),
    })
end)
local u155 = memo(function(a1) -- Line: 223 -- upvalues: createElement (val), React (val)
    local selected = a1.selected
    local v1 = {}
    local v2 = selected and Color3.new(1, 1, 1) or Color3.fromRGB(21, 21, 21)
    v1.BackgroundColor3 = v2
    v1.BorderColor3 = Color3.fromRGB(0, 0, 0)
    v1.BorderSizePixel = 0
    v1.FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json")
    v1.Size = UDim2.fromScale(1, 1)
    v1.SizeConstraint = Enum.SizeConstraint.RelativeXX
    v1.Text = ""
    v1.TextColor3 = Color3.fromRGB(0, 0, 0)
    v1.TextSize = 14
    v1.ZIndex = 2
    v1.LayoutOrder = a1.LayoutOrder
    v1[React.Event.MouseButton1Click] = a1.onClick
    v2 = {corner = createElement("UICorner")}
    v2.stroke = createElement("UIStroke", {
        Thickness = 2,
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
        Color = Color3.fromRGB(7, 7, 7),
    })
    v2.padding = createElement("UIPadding", {
        PaddingBottom = UDim.new(0, 4),
        PaddingLeft = UDim.new(0, 8),
        PaddingRight = UDim.new(0, 8),
        PaddingTop = UDim.new(0, 4),
    })
    local v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        LayoutOrder = 2,
        TextScaled = true,
        TextWrapped = true,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
        FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.SemiBold, Enum.FontStyle.Normal),
        Position = UDim2.fromScale(0.5, 0.85),
        Size = UDim2.fromScale(2, 0.25),
        Text = a1.text,
    }
    local v4 = selected and Color3.new(0, 0, 0) or Color3.new(1, 1, 1)
    v3.TextColor3 = v4
    v2.text = createElement("TextLabel", v3)
    v3 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AnchorPoint = Vector2.new(0.5, 0),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }
    local icon_3 = typeof(a1.icon) == "number" and ("rbxassetid://%*"):format(a1.icon) or a1.icon
    v3.Image = icon_3
    v3.Position = UDim2.fromScale(0.5, 0)
    v3.Size = UDim2.fromScale(1, 0.8)
    v2.icon = createElement("ImageLabel", v3, {ratio = createElement("UIAspectRatioConstraint")})
    return createElement("TextButton", v1, v2)
end)
return memo(function(a1) -- Line: 291
    -- upvalues: useState (val), useGameStateValue (val), useRef (val), useEffect (val), LocalPlayer (val)
    -- upvalues: useMemo (val), u139 (val), table (val), fzy (val), Enum (val), u146 (val), Towers (val)
    -- upvalues: createElement (val), u152 (val), u91 (val), IconButton (val), PVPTowerInventoryFilter (val), u122 (val)
    -- upvalues: useCallback (val), Fragment (val), PVPTeamDevision (val), PVPTeamPlayers (val)
    -- upvalues: PVPTowerInventoryHotbar (val), u155 (val), ImageLabel (val)
    local u3 = a1.banningTowers == true
    local Towers_2, Towers_3 = useState("Towers")
    if u3 then
        Towers_2 = "Towers"
    end
    if useGameStateValue("GameMode") == "PVP" then end
    local Ranked = useGameStateValue("Ranked")
    local u19, u20 = useState()
    local u22, u23 = useState()
    local u25, u26 = useState()
    local u28 = useRef()
    local u30 = useRef()
    local hotbarClicked = a1.hotbarClicked
    u28.current = a1.consumableClicked
    u30.current = a1.towerClicked
    local redPlayers = a1.redPlayers or {}
    local bluePlayers = a1.bluePlayers or {}
    local equippedTowers = a1.equippedTowers
    if not equippedTowers then
        equippedTowers = {}
    end
    local towerInventory = a1.towerInventory
    if not towerInventory then
        towerInventory = {}
    end
    local equippedConsumables = a1.equippedConsumables
    if not equippedConsumables then
        equippedConsumables = {}
    end
    local u53 = a1.selected or ""
    local bannedTowers = a1.bannedTowers
    if not bannedTowers then
        bannedTowers = {}
    end
    local bansPerPlayer = a1.bansPerPlayer
    if not bansPerPlayer then
        bansPerPlayer = {}
    end
    local u61, u62 = useState(true)
    local v1 = {bansPerPlayer}
    useEffect(function() -- Line: 326 -- upvalues: LocalPlayer (upval), bansPerPlayer (val), u62 (val)
        local v1 = bansPerPlayer[tostring(LocalPlayer.UserId)]
        if v1 ~= nil then
            u62(v1 > 0)
            return
        end
        u62(false)
    end, v1)
    v1 = {u19, u22}
    local u88 = useMemo(function() -- Line: 337 -- upvalues: u139 (upval), u22 (val), table (upval), fzy (upval), u19 (val), Enum (upval)
        local u7 = u139
        if u22 and u22 ~= "" then
            u7 = table.clone(u139)
            local v1 = table.map(u7, function(a1) -- Line: 343
                return a1.Name
            end)
            local v2 = fzy.filter(u22, v1, false, true)
            table.sort(v2, function(a1, a2) -- Line: 348
                local v1 = a1[3]
                return a2[3] < v1
            end)
            u7 = table.reduce(v2, function(a1, a2) -- Line: 352 -- upvalues: table (upval), u7 (ref)
                table.insert(a1, u7[a2[1]])
                return a1
            end, {})
        end
        if u19 and u19 ~= "" then
            local u37 = Enum.TowerRole[u19]
            local v3 = u7
            u7 = table.filter(v3, function(a1) -- Line: 360 -- upvalues: u37 (val)
                return a1.Role == u37
            end)
        end
        return (table.reduce(u7, function(a1, a2, a3) -- Line: 365 -- upvalues: table (upval)
            if not a1[a2.Category] then
                a1[a2.Category] = {}
            end
            table.insert(a1[a2.Category], a2)
            return a1
        end, {}))
    end, v1)
    local v2 = {u25}
    local u100 = useMemo(function() -- Line: 375 -- upvalues: u146 (upval), u25 (val), table (upval), u139 (upval), fzy (upval), Enum (upval)
        local u7 = u146
        if u25 and u25 ~= "" then
            u7 = table.clone(u139)
            local v1 = table.map(u7, function(a1) -- Line: 381
                return a1.Name
            end)
            local v2 = fzy.filter(u25, v1, false, true)
            table.sort(v2, function(a1, a2) -- Line: 386
                local v1 = a1[3]
                return a2[3] < v1
            end)
            u7 = table.reduce(v2, function(a1, a2) -- Line: 390 -- upvalues: table (upval), u7 (ref)
                table.insert(a1, u7[a2[1]])
                return a1
            end, {})
        end
        return (table.reduce(u7, function(a1, a2, a3) -- Line: 396 -- upvalues: Enum (upval), table (upval)
            local v1 = Enum.ConsumableRarity.ToString(a2.Rarity)
            if not a1[v1] then
                a1[v1] = {}
            end
            table.insert(a1[v1], a2)
            return a1
        end, {}))
    end, v2)
    local v3 = {towerInventory, equippedTowers, u88, u53, bannedTowers, u3, u61}
    v1 = useMemo(function() -- Line: 407
        -- upvalues: u88 (val), towerInventory (val), table (upval), equippedTowers (val), u3 (val), bannedTowers (val)
        -- upvalues: Towers (upval), u61 (val), u30 (val), createElement (upval), u152 (upval), u91 (upval), u53 (val)
        -- upvalues: Enum (upval)
        local Name, Skin, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
        local v11 = {}
        local v12 = nil
        local v13 = nil
        for i, j in u88, v12, v13 do
            v7 = {}
            v8 = i == "Exclusive"
            if not v8 then
                v9 = j
                v10 = nil
                v1 = nil
                for k, n in v9, v10, v1 do
                    local u68 = towerInventory[n.Name]
                    v2 = table.find(equippedTowers, n.Name) ~= nil
                    v3 = not u68
                    if not v3 or not v8 or u3 then
                        v4 = table.find(bannedTowers, n.Name) ~= nil
                        v5 = u3
                        Skin = u68 and u68.Skin or "Default"
                        v6 = Towers[n.Name][Skin]
                        Name = n.Name
                        v7[Name] = {
                            selected = false,
                            Size = UDim2.fromOffset(118, 118),
                            LayoutOrder = k,
                            name = n.Name,
                            icon = v6,
                            equipped = not v4 and not u3 and v2,
                            locked = not v4 and not u3 and v3,
                            banned = v4,
                            banning = v5,
                            locallyBanning = u61,
                            clicked = function() -- Line: 456 -- upvalues: u30 (upval), u68 (val), u3 (upval), n (val)
                                if u30.current then
                                    if u68 or u3 then
                                        u30.current(n.Name)
                                    end
                                end
                            end,
                        }
                    end
                end
                if next(v7) then
                    v9 = createElement
                    v1 = {
                        title = ("%* TOWERS"):format(i),
                        color = u91[i],
                        troops = v7,
                        selected = u53,
                        LayoutOrder = i ~= "None" and Enum.TowerCategory[i] or 0,
                    }
                    v11[i] = (v9(u152, v1))
                end
            end
        end
        return v11
    end, v3)
    local v4 = {u100, equippedConsumables}
    v2 = useMemo(function() -- Line: 490
        -- upvalues: u100 (val), table (upval), equippedConsumables (val), u28 (val), createElement (upval)
        -- upvalues: u152 (upval), u53 (val), u91 (upval), Enum (upval)
        local v1, v2, v3, v4, v5, v6
        local v7 = {}
        local v8 = nil
        local v9 = nil
        for i, j in u100, v8, v9 do
            v3 = {}
            v4 = i == "Exclusive"
            v5 = j
            v6 = nil
            v1 = nil
            for k, n in v5, v6, v1 do
                v2 = table.find(equippedConsumables, n.Name) ~= nil
                if not v4 and n.PVP then
                    v3[n.Name] = {
                        selected = false,
                        locked = false,
                        banned = false,
                        banning = false,
                        locallyBanning = false,
                        Size = UDim2.fromOffset(118, 118),
                        LayoutOrder = k,
                        name = n.Name,
                        icon = n.Icon,
                        equipped = v2,
                        tooltip = {
                            subject = "Consumable Stats",
                            header = n.Name,
                            content = {{Text = ("Description: %*"):format(n.Description)}},
                        },
                        clicked = function() -- Line: 528 -- upvalues: u28 (upval), n (val)
                            if u28.current then
                                u28.current(n.Name)
                            end
                        end,
                    }
                end
            end
            if next(v3) then
                if i == "Common" then
                    i = "None"
                end
                v5 = createElement
                v1 = {
                    consumable = true,
                    title = i,
                    troops = v3,
                    selected = u53,
                    color = u91[i],
                    LayoutOrder = i ~= "None" and Enum.ConsumableRarity[i] or 0,
                }
                v7[i] = (v5(u152, v1))
            end
        end
        return v7
    end, v4)
    v3 = createElement
    local v5 = {BackgroundTransparency = 0.35, BorderSizePixel = 0, LayoutOrder = 2, ZIndex = 2}
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 1)
    v5.AnchorPoint = AnchorPoint
    local Position = a1.Position or UDim2.new(0.5, 0, 1, 5)
    v5.Position = Position
    local Size = a1.Size or UDim2.fromScale(0.7, 1)
    v5.Size = Size
    v5.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    v5.BorderColor3 = Color3.fromRGB(0, 0, 0)
    local v6 = {
        corner = createElement("UICorner"),
        sizeConstraint = createElement("UISizeConstraint", {MaxSize = Vector2.new(1200, (1 / 0))}),
        close = not Ranked and a1.leaveClicked and createElement(IconButton, {
            LayoutOrder = 10,
            Position = UDim2.new(1, -30, 0, -20),
            AnchorPoint = Vector2.new(0, 0),
            Size = UDim2.fromOffset(44, 44),
            Color = Color3.fromRGB(255, 60, 60),
            Clicked = a1.leaveClicked,
        }),
        inventory = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TopImage = "",
            BottomImage = "",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1, 0.85),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            Visible = Towers_2 == "Towers",
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 10)}),
            filter = createElement(PVPTowerInventoryFilter, {
                Size = UDim2.new(1, -35, 0, 48),
                category = u19,
                categories = u122,
                categoryChanged = useCallback(function(a1) -- Line: 621 -- upvalues: u20 (val)
                    u20(a1)
                end, {}),
                onSearch = useCallback(function(a1) -- Line: 625 -- upvalues: u23 (val)
                    u23(a1)
                end, {}),
            }),
            categories = createElement(Fragment, {}, v1),
        }),
        consumables = createElement("ScrollingFrame", {
            BackgroundTransparency = 1,
            BorderSizePixel = 0,
            TopImage = "",
            BottomImage = "",
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            Size = UDim2.fromScale(1, 0.85),
            AutomaticCanvasSize = Enum.AutomaticSize.Y,
            CanvasSize = UDim2.new(),
            Visible = Towers_2 == "Consumables",
        }, {
            list = createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical,
                HorizontalAlignment = Enum.HorizontalAlignment.Left,
                VerticalAlignment = Enum.VerticalAlignment.Top,
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            padding = createElement("UIPadding", {PaddingBottom = UDim.new(0, 10)}),
            filter = createElement(PVPTowerInventoryFilter, {
                category = "",
                Size = UDim2.new(1, -35, 0, 48),
                categories = {},
                onSearch = useCallback(function(a1) -- Line: 664 -- upvalues: u26 (val)
                    u26(a1)
                end, {}),
            }),
            consumables = createElement(Fragment, {}, v2),
        }),
    }
    local v7 = createElement
    local v8 = {
        backgroundCornerRadius = 4,
        Size = UDim2.new(1, 0, 0.12, 0),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
    }
    local v9 = {}
    local v10 = false
    if #redPlayers > 0 then
        v10 = createElement(PVPTeamPlayers, {
            team = "Red",
            Size = UDim2.fromScale(0.36, 1),
            Position = UDim2.fromScale(0.01, 0.47),
            AnchorPoint = Vector2.new(0, 0.5),
            player1 = redPlayers[1],
            player2 = redPlayers[2],
            bansPerPlayer = bansPerPlayer,
        })
    end
    v9.leftTeamPlayers = v10
    v10 = false
    if #bluePlayers > 0 then
        v10 = createElement(PVPTeamPlayers, {
            team = "Blue",
            Size = UDim2.fromScale(0.36, 1),
            Position = UDim2.fromScale(0.99, 0.47),
            AnchorPoint = Vector2.new(1, 0.5),
            player1 = bluePlayers[1],
            player2 = bluePlayers[2],
            bansPerPlayer = bansPerPlayer,
        })
    end
    v9.rightTeamPlayers = v10
    v10 = createElement
    local v11 = {
        Size = UDim2.fromScale(0.335, 0.844),
        showConsumables = Towers_2 == "Consumables",
        towerInventory = a1.towerInventory,
    }
    local v12 = {Towers_2, hotbarClicked}
    v11.clicked = useCallback(function(a1) -- Line: 702 -- upvalues: hotbarClicked (val), Towers_2 (ref)
        if hotbarClicked then
            hotbarClicked(Towers_2, a1)
        end
    end, v12)
    v11.items = table.reduce({1, 2, 3, 4}, function(a1, a2) -- Line: 707
        -- upvalues: Towers_2 (ref), table (upval), equippedTowers (val), equippedConsumables (val)
        if Towers_2 == "Towers" then
            table.insert(a1, equippedTowers[a2] or "")
            return a1
        end
        table.insert(a1, equippedConsumables[a2] or "")
        return a1
    end, {})
    v9.hotbar = v10(PVPTowerInventoryHotbar, v11)
    v6.players = v7(PVPTeamDevision, v8, v9)
    v6.tabs = createElement("Frame", {
        BackgroundTransparency = 1,
        Size = UDim2.new(0.08, 0, 1, 0),
        Position = UDim2.new(0, -10, 0, 0),
        AnchorPoint = Vector2.new(1, 0),
        Visible = not u3,
    }, {
        list = createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical,
            HorizontalAlignment = Enum.HorizontalAlignment.Right,
            VerticalAlignment = Enum.VerticalAlignment.Top,
            SortOrder = Enum.SortOrder.LayoutOrder,
            Padding = UDim.new(0, 10),
        }),
        towers = createElement(u155, {
            LayoutOrder = 1,
            text = "Towers",
            icon = "rbxassetid://6053788302",
            selected = Towers_2 == "Towers",
            onClick = useCallback(function() -- Line: 740 -- upvalues: Towers_3 (val)
                Towers_3("Towers")
            end, {}),
        }),
        consumables = createElement(u155, {
            LayoutOrder = 2,
            text = "Items",
            icon = "rbxassetid://17409006603",
            selected = Towers_2 == "Consumables",
            onClick = useCallback(function() -- Line: 752 -- upvalues: Towers_3 (val)
                Towers_3("Consumables")
            end, {}),
        }),
    })
    v6.shadow = createElement("Frame", {
        BorderSizePixel = 0,
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.fromScale(0.5, 0.85),
        Size = UDim2.new(1, -2, 0.08, 0),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        BorderColor3 = Color3.fromRGB(0, 0, 0),
    }, {
        uIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    v6.dropShadow = createElement(ImageLabel, {
        BackgroundTransparency = 1,
        Image = "rbxassetid://9239716855",
        ZIndex = -1,
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        BorderColor3 = Color3.fromRGB(27, 42, 53),
        Position = UDim2.fromScale(0.5, 0.5),
        ScaleType = Enum.ScaleType.Slice,
        Size = UDim2.new(1, 14, 1, 14),
        SliceCenter = Rect.new(14, 14, 64, 24),
    })
    v3 = v3("Frame", v5, v6, a1.children)
    return v3
end)