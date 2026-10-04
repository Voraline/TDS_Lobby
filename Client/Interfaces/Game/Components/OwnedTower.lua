-- Script path: ReplicatedStorage.Client.Interfaces.Game.Components.OwnedTower
-- Decompile time: 9.37 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local useSpring = require(ReplicatedStorage.Client.Interfaces.Hooks.useSpring)
local React = require(ReplicatedStorage.Shared.UI.React)
local createElement = React.createElement
local useRef = React.useRef
local SharedGameConstants = require(ReplicatedStorage.Shared.Modules.SharedGameConstants)
local u33 = {}

local function calculateRange(a1, a2) -- Line: 15 -- types: a1: number, a2: number
    return a1 * a2
end

local function Boundary(a1) -- Line: 19 -- upvalues: createElement (val)
    return createElement("SurfaceGui", {
        Brightness = 4,
        PixelsPerStud = a1.PixelsPerStud or 32,
        SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud,
        Face = Enum.NormalId.Top,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
    }, {
        frame = createElement("Frame", {
            BackgroundTransparency = 1,
            AnchorPoint = Vector2.new(0.5, 0.5),
            BackgroundColor3 = Color3.fromRGB(0, 132, 198),
            Position = UDim2.fromScale(0.5, 0.5),
            Size = a1.Boundary:map(function(a1) -- Line: 35
                return UDim2.fromOffset(a1, a1)
            end),
        }, {
            uICorner = createElement("UICorner", {CornerRadius = UDim.new(1, 0)}),
            uIStroke = createElement("UIStroke", {Thickness = 4, Color = Color3.fromRGB(0, 132, 198)}),
        }),
    })
end

local u36 = {}
Scheduler.add("OwnedTowerRings", RunService.Heartbeat, function() -- Line: 53 -- upvalues: u33 (val), u36 (val)
    local Position, current, v1, v2
    local v3 = {}
    local v4 = {}
    local v5 = false
    for k, v in pairs(u33) do
        current = k.current
        if current then
            Position = if not v:IsA("BasePart") then v.WorldPosition else v.Position
            v1 = Vector3.new(Position.X, (current:GetAttribute("TargetY") or Position.Y) + 0.2, Position.Z)
            v2 = u36[k]
            if not v2 or not v2:FuzzyEq(v1, 0.001) then
                table.insert(v3, current)
                table.insert(v4, (CFrame.new(v1)))
                v5 = true
            end
        else
            u33[k] = nil
            u36[k] = nil
        end
    end
    if v5 then
        workspace:BulkMoveTo(v3, v4, Enum.BulkMoveMode.FireCFrameChanged)
    end
end)
return function(a1) -- Line: 93
    -- upvalues: SharedGameConstants (val), useSpring (val), React (val), useRef (val), u33 (val), createElement (val)
    -- upvalues: Boundary (val), u36 (val)
    local Boundary_2
    local Target = a1.Target
    if Target then
        assert(
            not (typeof(Target) ~= "Instance") and Target:IsA("BasePart") or Target:IsA("Attachment"),
            "Target part must be a BasePart or Attachment"
        )
    end
    if not (if a1.Enabled == nil then true else a1.Enabled) then
        Boundary_2 = 0
    else
        Boundary_2 = a1.Boundary
        if not Boundary_2 then
            Boundary_2 = SharedGameConstants.DEFAULT_BOUNDARY_SIZE
        end
    end
    local v1, u36_2 = useSpring(0, 0.6, 30, true)
    local v2 = v1:map(function(a1) -- Line: 110
        return a1 * 32
    end)
    local v3, u45 = React.useState(false)
    local v4 = {Target}
    React.useEffect(function() -- Line: 116 -- upvalues: Target (val), u45 (val)
        local u16 = nil
        local u6 = Target
        if u6 then
            u6 = Target:FindFirstAncestorWhichIsA("Model")
        end
        if u6 then
            u16 = (u6:GetAttributeChangedSignal("Flying")):Connect(function() -- Line: 121 -- upvalues: u6 (val), u45 (upval)
                if u6:GetAttribute("Flying") then
                    u45(true)
                    return
                end
                u45(false)
            end)
            if not u6:GetAttribute("Flying") then
                u45(false)
            else
                u45(true)
            end
        end
        return function() -- Line: 136 -- upvalues: u16 (ref)
            if u16 then
                u16:Disconnect()
            end
        end
    end, v4)
    v4 = {Boundary_2}
    React.useEffect(function() -- Line: 143 -- upvalues: u36_2 (val), Boundary_2 (val)
        u36_2(Boundary_2)
    end, v4)
    local u65 = useRef(nil)
    u33[u65] = Target
    local v5 = {}
    if Target then
        v5.boundary = createElement(Boundary, {PixelsPerStud = 32, Boundary = v2})
    end
    React.useEffect(function() -- Line: 158 -- upvalues: u33 (upval), u65 (val), u36 (upval)
        return function() -- Line: 159 -- upvalues: u33 (upval), u65 (upval), u36 (upval)
            u33[u65] = nil
            u36[u65] = nil
        end
    end, {})
    return createElement("Part", {
        Name = "OwnCircle",
        Anchored = true,
        CanCollide = false,
        CanQuery = false,
        CanTouch = false,
        CastShadow = false,
        Massless = true,
        Transparency = 1,
        BrickColor = BrickColor.new("Institutional white"),
        CFrame = if not Target then nil else if not Target:IsA("BasePart") then Target.WorldCFrame else Target.CFrame,
        Color = Color3.fromRGB(255, 255, 255),
        Material = Enum.Material.Glass,
        Size = Vector3.new(if not v3 then Boundary_2 else 0, 0.001, if not v3 then Boundary_2 else 0),
        ref = u65,
    }, v5)
end