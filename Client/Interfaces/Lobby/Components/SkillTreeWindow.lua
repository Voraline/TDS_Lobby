-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.SkillTreeWindow
-- Decompile time: 27.04 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local CameraPan = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.CameraPan)
local Charm = require(ReplicatedStorage.Packages.Charm)
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local Comma = require(ReplicatedStorage.Shared.UI.Comma)
local GlowButton = require(ReplicatedStorage.Client.Interfaces.Components.GlowButton)
local Icons = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Icons)
local ParticleEmitter = require(ReplicatedStorage.Client.Interfaces.Components.ParticleEmitter)
local ProductInfoCache = require(ReplicatedStorage.Shared.Modules.ProductInfoCache)
local React = require(ReplicatedStorage.Shared.UI.React)
local ReactFlow = require(ReplicatedStorage.Packages.ReactFlow)
local SkillInfo = require(ReplicatedStorage.Client.Interfaces.Game.Components.SkillInfo)
local SkillReset = require(ReplicatedStorage.Client.Interfaces.Game.Components.SkillReset)
local SkillTree = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree)
local Skills = require(ReplicatedStorage.Shared.Data.Skills)
local Tooltip = require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local useAtomBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local useSpring = ReactFlow.useSpring
local memo = React.memo
local createElement = React.createElement
local useState = React.useState
local joinBindings = React.joinBindings
local useBinding = React.useBinding
local useEffect = React.useEffect
local useMemo = React.useMemo
local untracked = Charm.untracked
local u125 = utf8.char(57346)

local function len(a1) -- Line: 38 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + 1
    end
    return v1
end

return memo(function(a1) -- Line: 49
    -- upvalues: useBinding (val), useState (val), useAtomBinding (val), CameraPan (val), useMemo (val), useEffect (val)
    -- upvalues: ProductInfoCache (val), useSpring (val), Skills (val), untracked (val), useReactBindings (val)
    -- upvalues: SkillTree (val), RunService (val), CurrentCamera (val), CharmUtil (val), UserInputService (val)
    -- upvalues: createElement (val), React (val), ParticleEmitter (val), Icons (val), Tooltip (val), SkillInfo (val)
    -- upvalues: joinBindings (val), SkillReset (val), GlowButton (val), u125 (val), Comma (val)
    local u82
    local SkillData = a1.SkillData
    local v1 = useBinding(false)
    local v2 = useState(false)
    local u12, u13 = useBinding(-1)
    local v3, u17 = useState(false)
    local v4, u21 = useState(false)
    local v5, u25 = useState(nil)
    local v6, u29 = useBinding("NO DESCRIPTION")
    local v7, u33 = useBinding("UNSET COMPARISON")
    local v8, u37 = useBinding(0)
    local v9, u41 = useBinding(0)
    local v10, u45 = useBinding(Vector2.zero)
    local v11 = useBinding(Vector2.new(1, 0))
    local v12 = useAtomBinding(CameraPan.Atoms.CameraZoomOffset)
    local u60 = useAtomBinding(a1.SelectedTile)
    local v13, u64 = useState(false)
    local v14, u68 = useState(nil)
    local v15 = {SkillData}
    local v16 = useMemo(function() -- Line: 96 -- upvalues: SkillData (val)
        local v1 = 0
        for i, j in SkillData do
            v1 = v1 + 1
        end
        return v1 > 0
    end, v15)
    local v17 = useEffect
    local v18 = {a1.BuyAllTowerLevelsProductId}
    v17(function() -- Line: 100 -- upvalues: a1 (val), u68 (val), ProductInfoCache (upval)
        local BuyAllTowerLevelsProductId = a1.BuyAllTowerLevelsProductId
        if type(BuyAllTowerLevelsProductId) == "number" and not (BuyAllTowerLevelsProductId <= 0) then
            local u18 = ((ProductInfoCache.getProductInfo(BuyAllTowerLevelsProductId, Enum.InfoType.Product)):andThen(function(a1) -- Line: 108 -- upvalues: u68 (upval)
                u68(a1.PriceInRobux)
            end)):catch(function() -- Line: 111 -- upvalues: u68 (upval)
                u68(nil)
            end)
            return function() -- Line: 115 -- upvalues: u18 (val)
                u18:cancel()
            end
        end
        u68(nil)
    end, v18)
    v17, u82 = useSpring({start = 1, speed = 25, damper = 0.5})

    local function getPriceNumber(a1_2) -- Line: 126 -- upvalues: Skills (upval), a1 (val), u12 (val)
        local SkillData = a1_2.SkillData or Skills.nodes[a1_2.SkillEnum]
        if a1.Mode ~= "Research" and SkillData.mode ~= "Research" then
            return (math.floor((SkillData.costPerLevel((u12:getValue()) + 1)).amount))
        end
        return SkillData.requiredTowerLevel or 0
    end

    local function getSkillPointCost(a1_2) -- Line: 135 -- upvalues: Skills (upval), a1 (val), u12 (val)
        local SkillData = a1_2.SkillData or Skills.nodes[a1_2.SkillEnum]
        if a1.Mode ~= "Research" and SkillData.mode ~= "Research" then
            return (math.floor((SkillData.costPerLevel((u12:getValue()) + 1)).amount))
        end
        return 0
    end

    local function getComparison(a1_2) -- Line: 144 -- upvalues: Skills (upval), u12 (val), a1 (val), untracked (upval)
        local SkillData = a1_2.SkillData or Skills.nodes[a1_2.SkillEnum]
        local v1 = u12:getValue()
        if a1.Mode ~= "Research" and SkillData.mode ~= "Research" then
            if SkillData.skillLevelCap <= v1 then
                return "MAXED OUT"
            end
            if v1 > 0 then
                return (SkillData.displayText(SkillData.valuePerLevel(v1))) .. "  →  <b><font color=\"#fff344\">" .. SkillData.displayText(SkillData.valuePerLevel(v1 + 1)) .. "</font></b>"
            end
            return "UNLOCK"
        end
        if (SkillData.skillLevelCap or 1) <= v1 then
            return "UNLOCKED"
        end
        local v2 = SkillData.requiredTowerLevel or 1
        return (("Tower Level %*/%*"):format(math.floor((math.clamp(untracked(a1_2.Atoms.LevelsNeeded), 0, v2))), v2))
    end

    local function getDescription(a1) -- Line: 174 -- upvalues: Skills (upval), u12 (val)
        local SkillData = a1.SkillData or Skills.nodes[a1.SkillEnum]
        local v1 = u12:getValue()
        if typeof(SkillData.description) == "function" then
            return SkillData:description(v1)
        end
        return SkillData.description or "NO DESCRIPTION"
    end

    local u87 = nil
    local v19 = {u60}
    useReactBindings(function(a1_2) -- Line: 186
        -- upvalues: SkillTree (upval), u21 (val), untracked (upval), u25 (val), u13 (val), u17 (val), u29 (val)
        -- upvalues: getDescription (val), u33 (val), getComparison (val), Skills (upval), a1 (val), u12 (val)
        -- upvalues: u37 (val), u41 (val), u87 (ref), RunService (upval), CurrentCamera (upval), u45 (val), u64 (val)
        -- upvalues: CharmUtil (upval)
        local HexTileFromMesh = SkillTree:GetHexTileFromMesh(a1_2)
        if not HexTileFromMesh then
            u21(true)
            return
        end
        u21(untracked(HexTileFromMesh.Atoms.IsSelected) == nil)
        u25(HexTileFromMesh.SkillEnum)
        u13(untracked(HexTileFromMesh.Atoms.Level))
        u17(untracked(HexTileFromMesh.Atoms.IsMaxedOut))
        u29(getDescription(HexTileFromMesh))
        u33((getComparison(HexTileFromMesh)))
        local SkillData = HexTileFromMesh.SkillData or Skills.nodes[HexTileFromMesh.SkillEnum]
        local v1 = if a1.Mode == "Research" then SkillData.requiredTowerLevel or 0 else if SkillData.mode ~= "Research" then math.floor((SkillData.costPerLevel((u12:getValue()) + 1)).amount) else SkillData.requiredTowerLevel or 0
        local SkillData_2 = HexTileFromMesh.SkillData or Skills.nodes[HexTileFromMesh.SkillEnum]
        local v2 = if a1.Mode == "Research" then 0 else if SkillData_2.mode ~= "Research" then math.floor((SkillData_2.costPerLevel((u12:getValue()) + 1)).amount) else 0
        u37(v1)
        u41(v2)
        HexTileFromMesh:SetSkillPriceNumber(v1)
        HexTileFromMesh:SetSkillPointCost(v2)
        if u87 then
            u87:Disconnect()
            u87 = nil
        end
        u87 = RunService.RenderStepped:Connect(function() -- Line: 212 -- upvalues: a1_2 (val), CurrentCamera (upval), u45 (upval), u64 (upval)
            if a1_2 and CurrentCamera then
                local v1 = a1_2.CFrame:ToObjectSpace((CFrame.new(a1_2.Position + Vector3.new(0, 2, 0))) * CFrame.Angles(0, 0, 0))
                a1_2.CenterAttachment.CFrame = v1
                local v2, v3 = CurrentCamera:WorldToScreenPoint(a1_2.CenterAttachment.PromptAttachment.WorldPosition)
                if v3 then
                    local v4 = Vector2.new(v2.X, v2.Y)
                    u45(v4)
                end
                u64(v3)
            end
        end)
        return (CharmUtil.watch(HexTileFromMesh.Atoms.Level, function(a1) -- Line: 231 -- upvalues: u13 (upval)
            u13(a1)
        end)), (CharmUtil.watch(HexTileFromMesh.Atoms.IsMaxedOut, function(a1) -- Line: 234 -- upvalues: u17 (upval)
            u17(a1)
        end)), (CharmUtil.watch(HexTileFromMesh.Atoms.LevelsNeeded, function() -- Line: 237 -- upvalues: u33 (upval), getComparison (upval), HexTileFromMesh (val)
            u33((getComparison(HexTileFromMesh)))
        end)), function() -- Line: 240 -- upvalues: u87 (upval)
            u87:Disconnect()
            u87 = nil
        end
    end, v19)
    v19 = {u12}
    useReactBindings(function(a1_2) -- Line: 246
        -- upvalues: u60 (val), SkillTree (upval), u17 (val), untracked (upval), u29 (val), getDescription (val)
        -- upvalues: u33 (val), getComparison (val), Skills (upval), a1 (val), u12 (val), u37 (val), u41 (val)
        if not u60:getValue() then
            return
        end
        local HexTileFromMesh = SkillTree:GetHexTileFromMesh((u60:getValue()))
        if not HexTileFromMesh then
            return
        end
        u17(untracked(HexTileFromMesh.Atoms.IsMaxedOut))
        u29(getDescription(HexTileFromMesh))
        u33((getComparison(HexTileFromMesh)))
        local SkillData = HexTileFromMesh.SkillData or Skills.nodes[HexTileFromMesh.SkillEnum]
        local v1 = if a1.Mode == "Research" then SkillData.requiredTowerLevel or 0 else if SkillData.mode ~= "Research" then math.floor((SkillData.costPerLevel((u12:getValue()) + 1)).amount) else SkillData.requiredTowerLevel or 0
        local SkillData_2 = HexTileFromMesh.SkillData or Skills.nodes[HexTileFromMesh.SkillEnum]
        local v2 = if a1.Mode == "Research" then 0 else if SkillData_2.mode ~= "Research" then math.floor((SkillData_2.costPerLevel((u12:getValue()) + 1)).amount) else 0
        u37(v1)
        u41(v2)
        HexTileFromMesh:SetSkillPriceNumber(v1)
        HexTileFromMesh:SetSkillPointCost(v2)
    end, v19)
    v19 = {v12}
    useReactBindings(function(a1) -- Line: 268 -- upvalues: CameraPan (upval), u82 (val)
        local function mapZoomToScale(a1) -- Line: 269 -- upvalues: CameraPan (upval)
            local MIN_ZOOM = CameraPan.Constants.MIN_ZOOM
            local MAX_ZOOM = CameraPan.Constants.MAX_ZOOM
            return math.clamp((a1 - MIN_ZOOM) / (MAX_ZOOM - MIN_ZOOM), 0, 1) * -0.75 + 1.5
        end

        local v1 = u82
        local v2 = {}
        local MIN_ZOOM = CameraPan.Constants.MIN_ZOOM
        v2.target = math.clamp((a1 - MIN_ZOOM) / (CameraPan.Constants.MAX_ZOOM - MIN_ZOOM), 0, 1) * -0.75 + 1.5
        v1(v2)
    end, v19)
    local TouchEnabled = UserInputService.TouchEnabled
    local v20 = {
        BackgroundTransparency = 1,
        Size = UDim2.fromScale(1, 1),
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        Visible = a1.Visible,
    }
    local v21 = {}
    local createElement_2 = React.createElement
    local v22 = {
        enabled = false,
        drag = 5,
        rate = 50,
        point = true,
        Size = UDim2.fromScale(0.1, 0.1),
    }
    v22.particleSize = NumberSequence.new({NumberSequenceKeypoint.new(0, 1), (NumberSequenceKeypoint.new(1, 0))})
    v22.lifeTime = NumberRange.new(0.5, 0.8)
    v22.acceleration = Vector2.new(0, 0)
    v22.speed = NumberRange.new(10, 20)
    v22.spreadAngle = NumberRange.new(0, 360)
    v22.rotation = NumberRange.new(-180, 180)
    v22.rotSpeed = NumberRange.new(-45, 45)
    v22.transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))})
    local SkillPoints_3 = typeof(Icons.SkillPoints) == "number" and ("rbxassetid://%*"):format(Icons.SkillPoints) or Icons.SkillPoints
    v22.texture = SkillPoints_3
    v21.Emitter = createElement_2(ParticleEmitter, v22)
    v21.Tooltip = if v1 then nil else if not TouchEnabled or v2 then createElement(Tooltip, {Name = "SkillTreeTooltip", Header = "NO NAME", Icon = "rbxassetid://0", Subject = v6}) else nil
    v21.SkillInfo = if v4 then nil else if v13 then createElement(SkillInfo, {
        SkillEnum = v5,
        SkillData = v5 and SkillTree:GetSkillDataForNode(v5),
        Mode = a1.Mode,
        CurrentLevel = u12,
        MaxedOut = v3,
        Clicked = a1.onPurchaseSkill,
        SkillDescription = v6,
        SkillComparison = v7,
        SkillPriceNumber = v8,
        SkillPointCost = v9,
        SkillPoints = a1.userSkillPoints or 0,
        CameraZoomOffset = v12,
        Scale = v17,
        Position = joinBindings({v11, v10}):map(function(a1) -- Line: 341
            local v1
            _, v1 = unpack(a1)
            return UDim2.fromOffset(v1.X, v1.Y)
        end),
    }) else nil
    v21.SkillReset = if not v16 or a1.ShowResetButton == false then nil else createElement(SkillReset, {
        Visible = a1.ResetWindowVisible,
        ExitCallback = a1.setResetWindowClosed,
        PurchaseCallback = a1.onRefundSkills,
        refundCost = a1.refundCost,
        refundSkillPoints = a1.refundSkillPoints,
        userSkillPoints = a1.userSkillPoints,
        setHideSkillInfo = u21,
    })
    v21.GlowButton = createElement(GlowButton, {
        text = "EXIT",
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 0.925),
        Size = UDim2.new(0.05, 74, 0.025, 30),
        clicked = a1.exitClicked,
        color = Color3.fromRGB(255, 60, 60),
    }, {})
    v21.ResetButton = if not v16 or a1.ShowResetButton == false then nil else createElement(GlowButton, {
        text = "RESET SKILLS",
        AnchorPoint = Vector2.new(0, 1),
        Position = UDim2.new(0, 40, 1, -40),
        Size = UDim2.new(0.05, 120, 0.025, 30),
        clicked = a1.resetClicked,
        color = Color3.fromRGB(141, 141, 141),
    }, {
        title = createElement("TextLabel", {
            BackgroundTransparency = 0.999,
            BorderSizePixel = 0,
            Text = "Skills Reset",
            TextScaled = true,
            TextSize = 14,
            TextWrapped = true,
            Visible = false,
            LayoutOrder = 2,
            BackgroundColor3 = Color3.fromRGB(255, 255, 255),
            BorderColor3 = Color3.fromRGB(0, 0, 0),
            FontFace = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),
            Position = UDim2.new(0.5, 0, 0, -20),
            AnchorPoint = Vector2.new(0.5, 1),
            Size = UDim2.fromScale(1, 0.5),
            TextColor3 = Color3.fromRGB(255, 255, 255),
        }),
    })
    v21.BuyAllTowerLevelsButton = if a1.Mode ~= "Research" or a1.ShowBuyAllTowerLevelsButton == false then nil else createElement(GlowButton, {
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -40, 1, -40),
        Size = UDim2.new(0.05, 220, 0.025, 30),
        text = if not v14 then "BUY ALL LEVELS" else ("BUY ALL LEVELS %* %*"):format(u125, (Comma(v14))),
        clicked = a1.onBuyAllTowerLevels,
        color = Color3.fromRGB(80, 255, 83),
    }, {})
    v21.BackgroundGradient = createElement("Frame", {
        BackgroundTransparency = 0,
        ZIndex = -1,
        Size = UDim2.fromScale(1, 0.25),
        AnchorPoint = Vector2.new(0.5, 1),
        Position = UDim2.fromScale(0.5, 1),
        BackgroundColor3 = Color3.fromRGB(0, 0, 0),
        Visible = a1.Visible,
    }, {
        UIGradient = createElement("UIGradient", {
            Rotation = -90,
            Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0), (NumberSequenceKeypoint.new(1, 1))}),
        }),
    })
    return (createElement("Frame", v20, v21))
end)