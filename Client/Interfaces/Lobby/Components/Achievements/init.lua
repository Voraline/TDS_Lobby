-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.Achievements
-- Decompile time: 2.83 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Interfaces = ReplicatedStorage.Client.Interfaces
local Hooks = Interfaces.Hooks
local Components = Interfaces.Components
local Components_2 = Interfaces.Lobby.Components
local React = require(ReplicatedStorage.Shared.UI.React)
local table = require(ReplicatedStorage.Shared.Modules.Utils.table)
local Achievement = require(script.Achievement)
local BattlepassWindow = require(Components_2.Battlepass.BattlepassWindow)
local IconButton = require(Components.IconButton)
local useMediaQuery = require(Hooks.useMediaQuery)
local useSound = require(Hooks.useSound)
local useBinding = React.useBinding
local createElement = React.createElement
local memo = React.memo

local function withSound(a1, a2) -- Line: 33 -- types: a2: function?
    return function() -- Line: 34 -- upvalues: a1 (val), a2 (val)
        a1()
        if a2 then
            a2()
        end
    end
end

local u45 = memo(function(a1) -- Line: 43 -- upvalues: useBinding (val), table (val), createElement (val), Achievement (val), React (val)
    local v1, u4 = useBinding(0)
    local v2 = table.reduce(a1.achievements or {}, function(a1_2, a2, a3) -- Line: 47 -- upvalues: createElement (upval), Achievement (upval), a1 (val)
        local v1 = tostring(a3)
        a1_2[v1] = (createElement(Achievement, {
            size = UDim2.fromScale(1, 1),
            name = a2.name,
            title = a2.title,
            description = a2.description,
            progress = a2.progress,
            maxProgress = a2.maxProgress,
            rewards = a2.rewards,
            completed = a2.completed,
            claimable = a2.claimable,
            equipped = a2.equipped,
            onEquip = function() -- Line: 59 -- upvalues: a1 (upval), a2 (val)
                if a1.onEquip then
                    a1.onEquip(a2.name or a2.title or "")
                end
            end,
            onClaim = function() -- Line: 64 -- upvalues: a1 (upval), a2 (val)
                if a1.onClaim then
                    a1.onClaim(a2.name or a2.title or "")
                end
            end,
            layoutOrder = a3,
        }))
        return a1_2
    end, {})
    local v3 = createElement
    local v4 = {
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        TopImage = "",
        BottomImage = "",
        ScrollBarThickness = 8,
        Size = UDim2.fromScale(1, 0.79),
        Position = UDim2.fromScale(0, 0.2),
        CanvasSize = v1:map(function(a1) -- Line: 79
            return UDim2.fromOffset(0, a1)
        end),
    }
    local v5 = {
        padding = createElement("UIPadding", {
            PaddingTop = UDim.new(0, 0),
            PaddingBottom = UDim.new(0, 0),
            PaddingLeft = UDim.new(0, 10),
            PaddingRight = UDim.new(0, 15),
        }),
    }
    local v6 = createElement
    local v7 = {
        SortOrder = Enum.SortOrder.LayoutOrder,
        FillDirection = Enum.FillDirection.Vertical,
        HorizontalAlignment = Enum.HorizontalAlignment.Left,
        Padding = UDim.new(0, 10),
    }

    v7[React.Change.AbsoluteContentSize] = function(a1) -- Line: 98 -- upvalues: u4 (val)
        u4(a1.AbsoluteContentSize.Y)
    end

    v5.listLayout = v6("UIListLayout", v7)
    return v3("ScrollingFrame", v4, v5, v2)
end)
return (memo(function(a1) -- Line: 105
    -- upvalues: useSound (val), createElement (val), BattlepassWindow (val), useMediaQuery (val), IconButton (val)
    -- upvalues: u45 (val)
    local Click = useSound("Click")
    local v1 = createElement
    local v2 = BattlepassWindow
    local v3 = {
        title = "Achievements",
        subTitle = "Earn different titles!",
        disableIcon = true,
        disableSizeConstraint = true,
        render = 123630164799190,
        titleSize = UDim2.fromScale(0.622, 0.08),
        subTitlePosition = UDim2.fromScale(0.034, 0.12),
        subTitleSize = UDim2.fromScale(0.452, 0.05),
        size = (useMediaQuery("large", true)):map(function(a1) -- Line: 121
            return a1 and UDim2.fromScale(0.6, 0.6) or UDim2.fromScale(0.8, 0.8)
        end),
    }
    local v4 = {}
    local v5 = createElement
    local v6 = IconButton
    local v7 = {
        AnchorPoint = Vector2.new(1, 0),
        Size = UDim2.fromScale(0.044, 0.069),
        Position = UDim2.fromScale(0.982, 0.035),
        Color = Color3.fromRGB(255, 60, 60),
    }
    local close = a1.close

    function v7.Clicked() -- Line: 34 -- upvalues: Click (val), close (val)
        Click()
        if close then
            close()
        end
    end

    v4.close = v5(v6, v7)
    v4.achievements = createElement(u45, {achievements = a1.achievements, onClaim = a1.onClaim, onEquip = a1.onEquip})
    return v1(v2, v3, v4)
end))