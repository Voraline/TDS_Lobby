-- Script path: ReplicatedStorage.Client.Interfaces.Components.ParticleEmitter
-- Decompile time: 5.76 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local React = require(ReplicatedStorage.Shared.UI.React)
local UIParticle = require(ReplicatedStorage.Shared.UI.Components.UIParticle)
local useEffect = React.useEffect
local createElement = React.createElement
local useRef = React.useRef
local useMemo = React.useMemo
local memo = React.memo
local u26 = {}

local function defaultAssign(a1) -- Line: 46 -- types: a1: string
    return function(a1_2, a2) -- Line: 47 -- upvalues: a1 (val)
        a1_2[a1] = a2
    end
end

local u28 = {}
local u29 = "Enabled"

function u28.enabled(a1, a2) -- Line: 47 -- upvalues: u29 (val)
    a1[u29] = a2
end

local u31 = "Rate"

function u28.rate(a1, a2) -- Line: 47 -- upvalues: u31 (val)
    a1[u31] = a2
end

local u33 = "Drag"

function u28.drag(a1, a2) -- Line: 47 -- upvalues: u33 (val)
    a1[u33] = a2
end

local u35 = "Color"

function u28.color(a1, a2) -- Line: 47 -- upvalues: u35 (val)
    a1[u35] = a2
end

local u37 = "Transparency"

function u28.transparency(a1, a2) -- Line: 47 -- upvalues: u37 (val)
    a1[u37] = a2
end

function u28.size(a1, a2) -- Line: 58
    a1.Size = {X = a2, Y = a2}
end

local u40 = "ZOffset"

function u28.zOffset(a1, a2) -- Line: 47 -- upvalues: u40 (val)
    a1[u40] = a2
end

function u28.speed(a1, a2) -- Line: 62
    a1.xSpeed = NumberRange.new(0, 0)
    a1.ySpeed = a2
end

local u43 = "SpreadAngle"

function u28.spreadAngle(a1, a2) -- Line: 47 -- upvalues: u43 (val)
    a1[u43] = a2
end

local u45 = "RotSpeed"

function u28.rotSpeed(a1, a2) -- Line: 47 -- upvalues: u45 (val)
    a1[u45] = a2
end

local u47 = "Lifetime"

function u28.lifeTime(a1, a2) -- Line: 47 -- upvalues: u47 (val)
    a1[u47] = a2
end

local u49 = "Acceleration"

function u28.acceleration(a1, a2) -- Line: 47 -- upvalues: u49 (val)
    a1[u49] = a2
end

local u51 = "Rotation"

function u28.rotation(a1, a2) -- Line: 47 -- upvalues: u51 (val)
    a1[u51] = a2
end

local u53 = "LockedToGui"

function u28.lockedToGui(a1, a2) -- Line: 47 -- upvalues: u53 (val)
    a1[u53] = a2
end

local u55 = "FlipbookMode"

function u28.flipbookMode(a1, a2) -- Line: 47 -- upvalues: u55 (val)
    a1[u55] = a2
end

local u57 = "FlipbookFramerate"

function u28.flipbookFrameRate(a1, a2) -- Line: 47 -- upvalues: u57 (val)
    a1[u57] = a2
end

local u59 = "UnitMultiplier"

function u28.unitMultiplier(a1, a2) -- Line: 47 -- upvalues: u59 (val)
    a1[u59] = a2
end

function u28.point(a1, a2) -- Line: 75 -- types: a2: boolean
    a1.EmitterMode = if not a2 then "Fill" else "Point"
end

RunService:UnbindFromRenderStep("UPDATE_REACT_EMITTERS")
RunService:BindToRenderStep("UPDATE_REACT_EMITTERS", Enum.RenderPriority.Last.Value, function(a1) -- Line: 81 -- upvalues: u26 (val)
    for k in pairs(u26) do
        k:Step(a1)
    end
end)
return memo(function(a1) -- Line: 87
    -- upvalues: useRef (val), useMemo (val), useEffect (val), u26 (val), UIParticle (val), u28 (val)
    -- upvalues: createElement (val)
    local u2 = useRef()
    local u4 = useRef()
    local u8 = useMemo(function() -- Line: 91
        local ImageLabel = Instance.new("ImageLabel")
        ImageLabel.Name = "Particle"
        ImageLabel.Size = UDim2.fromOffset(1, 1)
        ImageLabel.Image = ""
        ImageLabel.BackgroundTransparency = 1
        ImageLabel.Visible = false
        return ImageLabel
    end, {})
    useEffect(function() -- Line: 103 -- upvalues: u8 (val)
        return function() -- Line: 104 -- upvalues: u8 (upval)
            u8:Destroy()
        end
    end, {})
    local v1 = {u2}
    useEffect(function() -- Line: 109 -- upvalues: u2 (val), u4 (val), u26 (upval), UIParticle (upval), u8 (val), a1 (val)
        if not u2 and u2.current then
            return
        end
        if u4.current then
            u26[u4.current] = nil
            u4.current:Destroy()
        end
        local u21 = UIParticle.new(u2.current, u8, a1.unitMultiplier)
        u21.EmitterMode = "Fill"
        u21.UnitMultiplier = 0.1
        u4.current = u21
        u26[u21] = true
        return function() -- Line: 126 -- upvalues: u21 (val), u26 (upval), u4 (upval)
            u21:Destroy()
            u26[u21] = nil
            if u4.current == u21 then
                u4.current = nil
            end
        end
    end, v1)
    useEffect(function() -- Line: 136 -- upvalues: u4 (val), a1 (val), u28 (upval)
        local current = u4.current
        if not current then
            return
        end
        for i, j in a1 do
            if u28[i] then
                u28[i](current, j)
            end
        end
        if a1.texture then
            current.Element.Image = a1.texture
        end
    end)
    v1 = {BackgroundTransparency = 1}
    local Size = a1.Size or UDim2.fromScale(1, 1)
    v1.Size = Size
    local Position = a1.Position or UDim2.fromScale(0.5, 0.5)
    v1.Position = Position
    local AnchorPoint = a1.AnchorPoint or Vector2.new(0.5, 0.5)
    v1.AnchorPoint = AnchorPoint
    v1.ref = u2
    return createElement("Frame", v1)
end)