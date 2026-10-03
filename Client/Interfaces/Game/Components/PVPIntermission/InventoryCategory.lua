-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.PVPIntermission.InventoryCategory
-- Decompile time: 2.73 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = require(ReplicatedStorage.Shared.UI.Network)
local React = require(ReplicatedStorage.Shared.UI.React)
local TowerInventoryButton = require(script.Parent.TowerInventoryButton)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local createElement = React.createElement
local Inventory = Network.Channel("Inventory")
return function(a1) -- Line: 25
    -- upvalues: useCache (val), React (val), createElement (val), TowerInventoryButton (val), Inventory (val)
    -- upvalues: ViewController (val)
    local u4 = useCache("Inventory.Troops", {})
    local useMemo = React.useMemo
    local v1 = {a1.Items, u4, a1.EquippedTroops}
    local v2 = useMemo(function() -- Line: 28
        -- upvalues: a1 (val), u4 (val), createElement (upval), TowerInventoryButton (upval), Inventory (upval)
        -- upvalues: ViewController (upval)
        local v1 = {}
        local v2 = nil
        local v3 = nil
        for i, j in a1.Items, v2, v3 do
            if u4[j.name] then
                if table.find(a1.EquippedTroops, j.name) ~= nil then
                    u22 = true
                else
                    local u22 = false
                end
                v1[j.name] = (createElement(TowerInventoryButton, {
                    Locked = false,
                    Idx = i,
                    Name = j.name,
                    Equipped = u22,
                    OnClick = function() -- Line: 43 -- upvalues: u22 (val), Inventory (upval), j (val), ViewController (upval)
                        local v1, v2
                        print("clic")
                        if not u22 then
                            v1, v2 = Inventory:InvokeServer("Equip", "PVPTower", j.name)
                        else
                            v1, v2 = Inventory:InvokeServer("Unequip", "PVPTower", j.name)
                        end
                        if not v1 then
                            ViewController:init()
                            ViewController:notifyError(v2 or "Error equipping/unequipping tower")
                        end
                    end,
                }))
            end
        end
        return v1
    end, v1)
    return createElement("Frame", {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundColor3 = Color3.fromRGB(255, 255, 255),
        LayoutOrder = a1.Idx,
        Visible = next(v2) ~= nil,
        Size = UDim2.new(1, -16, 0, 0),
    }, {
        holder = createElement("Frame", {
            BackgroundTransparency = 1,
            AutomaticSize = Enum.AutomaticSize.Y,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(27, 42, 53),
            Position = UDim2.fromOffset(0, 40),
            Size = UDim2.fromScale(1, 0),
        }, {
            uIGridLayout = createElement("UIGridLayout", {
                CellPadding = UDim2.fromOffset(8, 8),
                CellSize = UDim2.fromOffset(118, 118),
                SortOrder = Enum.SortOrder.LayoutOrder,
            }),
            content = React.createElement(React.Fragment, {}, v2),
        }),
        header = createElement("Frame", {
            BackgroundTransparency = 1,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            Size = UDim2.new(1, 0, 0, 40),
        }, {
            divider = createElement("Frame", {
                BorderSizePixel = 0,
                AnchorPoint = Vector2.new(0.5, 1),
                BackgroundColor3 = Color3.fromRGB(113, 113, 113),
                Position = UDim2.new(0.5, 0, 1, -6),
                Size = UDim2.new(1, -40, 0, 2),
            }),
            title = createElement("TextLabel", {
                TextSize = 25,
                BackgroundTransparency = 1,
                FontFace = Font.new("rbxasset://fonts/families/SourceSansPro.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal),
                Text = ("%* TOWERS"):format((string.upper(a1.Name))),
                TextColor3 = a1.Color,
                TextXAlignment = Enum.TextXAlignment.Left,
                AnchorPoint = Vector2.new(0.5, 0),
                BackgroundColor3 = Color3.fromRGB(255, 255, 255),
                Position = UDim2.fromScale(0.5, 0),
                Size = UDim2.new(1, 0, 1, -10),
            }, {
                uIStroke2 = createElement("UIStroke", {Thickness = 2, Transparency = 0.5, LineJoinMode = Enum.LineJoinMode.Miter}),
            }),
        }),
    })
end