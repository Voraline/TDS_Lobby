-- Script path: ReplicatedStorage.Shared.Modules.spr
-- Decompile time: 17.49 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local GameState = require(ReplicatedStorage.Shared.Modules.GameState)
local Scheduler = require(ReplicatedStorage.Shared.Modules.Scheduler)
local exp = math.exp
local sin = math.sin
local cos = math.cos
local min = math.min
local sqrt = math.sqrt
local round = math.round

local function magnitudeSq(a1) -- Line: 56 -- types: a1: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + j ^ 2
    end
    return v1
end

local function distanceSq(a1, a2) -- Line: 64 -- types: a1: table, a2: table
    local v1 = 0
    for i, j in a1 do
        v1 = v1 + (a2[i] - j) ^ 2
    end
    return v1
end

local u28 = {}
u28.__index = u28

function u28.new(a1, a2, a3, a4, a5) -- Line: 103 -- upvalues: u28 (val) -- types: a1: number, a2: number
    local v1 = a5.toIntermediate(a3)
    return (setmetatable({
        d = a1,
        f = a2,
        g = v1,
        p = v1,
        v = table.create(#v1, 0),
        typedat = a5,
        rawGoal = a4,
    }, u28))
end

function u28:impulseVelocity(a2) -- Line: 116
    for i, j in (self.typedat.toIntermediate(a2)) do
        self.v[i] = (self.v[i] or 0) + j
    end
end

function u28:setGoal(a2) -- Line: 123
    self.rawGoal = a2
    self.g = self.typedat.toIntermediate(a2)
end

function u28:setVelocity(a2) -- Line: 128
    self.v = self.typedat.toIntermediate(a2)
end

function u28:setDampingRatio(a2) -- Line: 132 -- types: a2: number
    self.d = a2
end

function u28:setFrequency(a2) -- Line: 136 -- types: a2: number
    self.f = a2
end

function u28:canSleep() -- Line: 140
    local v1 = 0
    for i, j in self.v do
        v1 = v1 + j ^ 2
    end
    if v1 > 0.0001 then
        return false
    end
    v1 = 0
    for k, n in self.p do
        v1 = v1 + (self.g[k] - n) ^ 2
    end
    if v1 > 6.781684027777778e-08 then
        return false
    end
    return true
end

function u28:step(a2) -- Line: 152 -- upvalues: exp (val), sqrt (val), cos (val), sin (val) -- types: a2: number
    local v1, v2, v3, v4, v5, v6, v7, v8
    local d = self.d
    local v9 = self.f * 2 * 3.141592653589793
    local g = self.g
    local p = self.p
    local v = self.v
    if d == 1 then
        v6 = exp(-v9 * a2)
        v7 = a2 * v6
        v8 = v6 + v7 * v9
        v1 = v6 - v7 * v9
        v2 = v7 * v9 * v9
        v3 = #p
        for k = 1, v3 do
            v4 = p[k] - g[k]
            v5 = v4 * v8 + v[k] * v7
            p[k] = v5 + g[k]
            v5 = v[k] * v1
            v[k] = v5 - v4 * v2
        end
    else
        local v10, v11
        if not (d < 1) then
            v6 = sqrt(d * d - 1)
            v7 = -v9 * (d - v6)
            v8 = -v9 * (d + v6)
            v1 = exp(v7 * a2)
            v2 = exp(v8 * a2)
            v3 = #p
            for i = 1, v3 do
                v4 = p[i] - g[i]
                v10 = (v[i] - v4 * v7) / (2 * v9 * v6)
                v5 = v1 * (v4 - v10)
                v11 = v5 + v10 * v2
                p[i] = v11 + g[i]
                v[i] = v5 * v7 + v10 * v2 * v8
            end
        else
            local v12, v13
            v6 = exp(-d * v9 * a2)
            v7 = sqrt(1 - d * d)
            v8 = cos(a2 * v9 * v7)
            v1 = sin(a2 * v9 * v7)
            if not (v7 > 1e-05) then
                v3 = a2 * v9
                v2 = v3 + (v3 * v3 * (v7 * v7) * (v7 * v7) / 20 - v7 * v7) * (v3 * v3 * v3) / 6
            else
                v2 = v1 / v7
            end
            if not (1e-05 < v9 * v7) then
                v12 = v9 * v7
                v3 = a2 + (a2 * a2 * (v12 * v12) * (v12 * v12) / 20 - v12 * v12) * (a2 * a2 * a2) / 6
            else
                v3 = v1 / (v9 * v7)
            end
            v12 = #p
            for j = 1, v12 do
                v10 = p[j] - g[j]
                v13 = (v10 * (v8 + v2 * d) + v[j] * v3) * v6
                p[j] = v13 + g[j]
                v11 = v[j] * (v8 - v2 * d)
                v[j] = (v11 - v10 * (v2 * v9)) * v6
            end
        end
    end
    return self.typedat.fromIntermediate(self.p)
end

local u37 = {}
u37.__index = u37

local function angleBetween(a1, a2) -- Line: 269 -- types: a1: userdata, a2: userdata
    local v1
    _, v1 = a2:ToObjectSpace(a1):ToAxisAngle()
    return (math.abs(v1))
end

local function matrixToAxis(a1) -- Line: 274 -- types: a1: userdata
    local v1, v2 = a1:ToAxisAngle()
    return v1 * v2
end

local function axisToMatrix(a1) -- Line: 279 -- types: a1: vector
    local Magnitude = a1.Magnitude
    if Magnitude > 1e-06 then
        return CFrame.fromAxisAngle(a1.Unit, Magnitude)
    end
    return CFrame.identity
end

function u37.new(a1, a2, a3, a4) -- Line: 287
    -- upvalues: u37 (val)
    return (setmetatable({
        v = Vector3.new(0, 0, 0),
        d = a1,
        f = a2,
        g = a4,
        p = a3,
    }, u37))
end

function u37:impulseVelocity(a2) -- Line: 297 -- types: a2: userdata
    local v1, v2, v3 = a2:ToEulerAnglesXYZ()
    self.v = self.v + Vector3.new(v1 * 100, v2 * 100, v3 * 100)
end

function u37:setGoal(a2) -- Line: 302 -- types: a2: userdata
    self.g = a2
end

function u37:setVelocity(a2) -- Line: 306 -- types: a2: userdata
    local v1, v2, v3 = a2:ToEulerAnglesXYZ()
    self.v = Vector3.new(v1 * 100, v2 * 100, v3 * 100)
end

function u37:setDampingRatio(a2) -- Line: 311 -- types: a2: number
    self.d = a2
end

function u37:setFrequency(a2) -- Line: 315 -- types: a2: number
    self.f = a2
end

function u37:canSleep() -- Line: 319
    local v1
    _, v1 = self.g:ToObjectSpace(self.p):ToAxisAngle()
    local v2 = math.abs(v1) < 0.00017453292519943296
    local v3 = self.v.Magnitude < 0.0017453292519943296
    return v2 and v3
end

function u37:step(a2) -- Line: 325 -- upvalues: exp (val), sqrt (val), cos (val), sin (val) -- types: a2: number
    local v1
    local d = self.d
    local v2 = self.f * 2 * 3.141592653589793
    local g = self.g
    local p = self.p
    local v = self.v
    local v3, v4 = (p * g:Inverse()):ToAxisAngle()
    local v5 = v3 * v4
    local v6 = exp(-d * v2 * a2)
    if d == 1 then
        v1 = (v5 * (1 + v2 * a2) + v * a2) * v6
        local Magnitude = v1.Magnitude
        v3 = (if not (Magnitude > 1e-06) then CFrame.identity else CFrame.fromAxisAngle(v1.Unit, Magnitude)) * g
        v4 = (v * (1 - a2 * v2) - v5 * (a2 * v2 * v2)) * v6
    else
        local v7, v8, v9, v10
        if not (d < 1) then
            v7 = sqrt(d * d - 1)
            v1 = -v2 * (d - v7)
            v8 = -v2 * (d + v7)
            v9 = (v - v5 * v1) / (2 * v2 * v7)
            local v11 = (v5 - v9) * exp(v1 * a2)
            v10 = v9 * exp(v8 * a2)
            local v12 = v11 + v10
            local Magnitude_3 = v12.Magnitude
            v3 = (if not (Magnitude_3 > 1e-06) then CFrame.identity else CFrame.fromAxisAngle(v12.Unit, Magnitude_3)) * g
            v4 = v11 * v1 + v10 * v8
        else
            v7 = sqrt(1 - d * d)
            v1 = cos(a2 * v2 * v7)
            v8 = sin(a2 * v2 * v7)
            v9 = v8 / (v2 * v7)
            local v13 = v8 / v7
            v10 = (v5 * (v1 + v13 * d) + v * v9) * v6
            local Magnitude_2 = v10.Magnitude
            v3 = (if not (Magnitude_2 > 1e-06) then CFrame.identity else CFrame.fromAxisAngle(v10.Unit, Magnitude_2)) * g
            v4 = (v * (v1 - v13 * d) - v5 * (v13 * v2)) * v6
        end
    end
    self.p = v3
    self.v = v4
    return v3
end

local u49 = {springType = u28.new}

function u49.toIntermediate(a1) -- Line: 379
    return {a1.X, a1.Y, a1.Z}
end

function u49.fromIntermediate(a1) -- Line: 383 -- types: a1: table
    return (Vector3.new(a1[1], a1[2], a1[3]))
end

local u53 = {}
u53.__index = u53

function u53.new(a1, a2, a3, a4, a5) -- Line: 393
    -- upvalues: u28 (val), u49 (val), u37 (val), u53 (val)
    return (setmetatable({
        rawGoal = a4,
        _position = u28.new(a1, a2, a3.Position, a4.Position, u49),
        _rotation = u37.new(a1, a2, a3.Rotation, a4.Rotation),
    }, u53))
end

function u53:impulseVelocity(a2) -- Line: 418 -- types: self: table, a2: userdata
    self._position:impulseVelocity(a2.Position)
    self._rotation:impulseVelocity(a2.Rotation)
end

function u53:setGoal(a2) -- Line: 423 -- types: self: table, a2: userdata
    self.rawGoal = a2
    self._position:setGoal(a2.Position)
    self._rotation:setGoal(a2.Rotation)
end

function u53:setVelocity(a2) -- Line: 429 -- types: self: table, a2: userdata
    self._position:setVelocity(a2.Position)
    self._rotation:setVelocity(a2.Rotation)
end

function u53:setDampingRatio(a2) -- Line: 434 -- types: self: table, a2: number
    self._position:setDampingRatio(a2)
    self._rotation:setDampingRatio(a2)
end

function u53:setFrequency(a2) -- Line: 439 -- types: self: table, a2: number
    self._position:setFrequency(a2)
    self._rotation:setFrequency(a2)
end

function u53:canSleep() -- Line: 444
    return self._position:canSleep() and self._rotation:canSleep()
end

function u53:step(a2) -- Line: 448
    local v1 = self._position:step(a2)
    return self._rotation:step(a2) + v1
end

local function inverseGammaCorrectD65(a1) -- Line: 459
    return a1 < 0.0404482362771076 and a1 / 12.92 or 0.87941546140213 * (a1 + 0.055) ^ 2.4
end

local function gammaCorrectD65(a1) -- Line: 463
    return a1 < 0.0031306684425 and 12.92 * a1 or 1.055 * a1 ^ 0.4166666666666667 - 0.055
end

local function rgbToLuv(a1) -- Line: 467 -- types: a1: userdata
    local v1, v2
    local R = a1.R
    local G = a1.G
    local B = a1.B
    local v3 = R
    local v4 = v3 < 0.0404482362771076 and v3 / 12.92 or 0.87941546140213 * (v3 + 0.055) ^ 2.4
    v3 = G
    local v5 = v3 < 0.0404482362771076 and v3 / 12.92 or 0.87941546140213 * (v3 + 0.055) ^ 2.4
    v3 = B
    local v6 = v3 < 0.0404482362771076 and v3 / 12.92 or 0.87941546140213 * (v3 + 0.055) ^ 2.4
    v3 = 0.9257063972951867 * v4 - 0.8333736323779866 * v5 - 0.09209820666085898 * v6
    local v7 = 0.2125862307855956 * v4 + 0.7151703037034108 * v5 + 0.0722004986433362 * v6
    local v8 = 3.6590806972265884 * v4 + 11.442689580057424 * v5 + 4.114991502426484 * v6
    local v9 = v7 > 0.008856451679035631 and 116 * v7 ^ 0.3333333333333333 - 16 or 903.296296296296 * v7
    if not (v8 > 1e-14) then
        v1 = -0.19783 * v9
        v2 = -0.46832 * v9
    else
        v1 = v9 * v3 / v8
        v2 = v9 * (9 * v7 / v8 - 0.46832)
    end
    return {v9, v1, v2}
end

local function luvToRgb(a1) -- Line: 496 -- upvalues: min (val) -- types: a1: table
    local v1 = a1[1]
    if v1 < 0.0197955 then
        return Color3.new(0, 0, 0)
    end
    local v2 = a1[2] / v1 + 0.19783
    local v3 = a1[3] / v1 + 0.46832
    local v4 = (v1 + 16) / 116
    v4 = v4 > 0.20689655172413793 and v4 * v4 * v4 or v4 * 0.12841854934601665 - 0.01771290335807126
    local v5 = v4 * v2 / v3
    local v6 = v4 * ((3 - v2 * 0.75) / v3 - 5)
    local v7 = v5 * 7.2914074 - v4 * 1.537208 - v6 * 0.4986286
    local v8 = v5 * -2.180094 + v4 * 1.8757561 + v6 * 0.0415175
    local v9 = v5 * 0.1253477 - v4 * 0.2040211 + v6 * 1.0569959
    if not (v7 < 0) or not (v7 < v8) then
        if not (v8 < 0) then
            if v9 < 0 then
                v7 = v7 - v9
                v8 = v8 - v9
                v9 = 0
            end
        elseif v8 < v9 then
            v7 = v7 - v8
            v9 = v9 - v8
            v8 = 0
        elseif v9 < 0 then
            v7 = v7 - v9
            v8 = v8 - v9
            v9 = 0
        end
    elseif v7 < v9 then
        v8 = v8 - v7
        v9 = v9 - v7
        v7 = 0
    elseif not (v8 < 0) then
        if v9 < 0 then
            v7 = v7 - v9
            v8 = v8 - v9
            v9 = 0
        end
    elseif v8 < v9 then
        v7 = v7 - v8
        v9 = v9 - v8
        v8 = 0
    elseif v9 < 0 then
        v7 = v7 - v9
        v8 = v8 - v9
        v9 = 0
    end
    return Color3.new(
        min(v7 < 0.0031306684425 and 12.92 * v7 or 1.055 * v7 ^ 0.4166666666666667 - 0.055, 1),
        min(v8 < 0.0031306684425 and 12.92 * v8 or 1.055 * v8 ^ 0.4166666666666667 - 0.055, 1),
        (min(v9 < 0.0031306684425 and 12.92 * v9 or 1.055 * v9 ^ 0.4166666666666667 - 0.055, 1))
    )
end

local u68 = {}
u68.boolean = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 542
        return {if not a1 then 0 else 1}
    end,
    fromIntermediate = function(a1) -- Line: 546
        return 0.5 <= a1[1]
    end,
}
u68.number = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 554
        return {a1}
    end,
    fromIntermediate = function(a1) -- Line: 558
        return a1[1]
    end,
}
u68.NumberRange = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 566
        return {a1.Min, a1.Max}
    end,
    fromIntermediate = function(a1) -- Line: 570
        return NumberRange.new(a1[1], a1[2])
    end,
}
u68.UDim = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 578
        return {a1.Scale, a1.Offset}
    end,
    fromIntermediate = function(a1) -- Line: 582 -- upvalues: round (val) -- types: a1: table
        return UDim.new(a1[1], (round(a1[2])))
    end,
}
u68.UDim2 = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 590
        local X = a1.X
        local Y = a1.Y
        return {X.Scale, X.Offset, Y.Scale, Y.Offset}
    end,
    fromIntermediate = function(a1) -- Line: 596 -- upvalues: round (val) -- types: a1: table
        return UDim2.new(a1[1], round(a1[2]), a1[3], (round(a1[4])))
    end,
}
u68.Vector2 = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 604
        return {a1.X, a1.Y}
    end,
    fromIntermediate = function(a1) -- Line: 608 -- types: a1: table
        return Vector2.new(a1[1], a1[2])
    end,
}
u68.Vector3 = u49
u68.Color3 = {springType = u28.new, toIntermediate = rgbToLuv, fromIntermediate = luvToRgb}
u68.ColorSequence = {
    springType = u28.new,
    toIntermediate = function(a1) -- Line: 625 -- upvalues: rgbToLuv (ref)
        local Keypoints = a1.Keypoints
        local v1 = rgbToLuv(Keypoints[1].Value)
        local v2 = rgbToLuv(Keypoints[#Keypoints].Value)
        return {v1[1], v1[2], v1[3], v2[1], v2[2], v2[3]}
    end,
    fromIntermediate = function(a1) -- Line: 641 -- upvalues: luvToRgb (ref) -- types: a1: table
        return ColorSequence.new(luvToRgb({a1[1], a1[2], a1[3]}), luvToRgb({a1[4], a1[5], a1[6]}))
    end,
}
u68.CFrame = {springType = u53.new, toIntermediate = error, fromIntermediate = error}
local u103 = {}
u103.Pivot = {
    class = "PVInstance",
    get = function(a1) -- Line: 667 -- types: a1: userdata
        return a1:GetPivot()
    end,
    set = function(a1, a2) -- Line: 670 -- types: a1: userdata, a2: userdata
        a1:PivotTo(a2)
    end,
}
u103.Scale = {
    class = "Model",
    get = function(a1) -- Line: 676 -- types: a1: userdata
        return a1:GetScale()
    end,
    set = function(a1, a2) -- Line: 679 -- types: a1: userdata, a2: number
        a1:ScaleTo(a2)
    end,
}

local function getProperty(a1, a2) -- Line: 685 -- upvalues: u103 (val) -- types: a1: userdata, a2: string
    local v1 = u103[a2]
    if v1 and a1:IsA(v1.class) then
        return v1.get(a1)
    end
    return a1[a2]
end

local function setProperty(a1, a2, a3) -- Line: 694 -- upvalues: u103 (val) -- types: a1: userdata, a2: string
    local v1 = u103[a2]
    if v1 and a1:IsA(v1.class) then
        v1.set(a1, a3)
        return
    end
    a1[a2] = a3
end

local u112 = {}
local u113 = {}
Scheduler.add("SprHeartbeat", RunService.Heartbeat, function(a1) -- Line: 707 -- upvalues: u112 (val), u103 (val), GameState (val), u113 (val)
    local class, class_2, rawGoal, v1, v2, v3, v4, v5, v6
    local v7 = nil
    local v8 = nil
    local v9 = a1
    for i, j in u112, v7, v8 do
        v4 = j
        v5 = nil
        v6 = nil
        for k, n in v4, v5, v6 do
            if not n:canSleep() then
                v3 = n.timeScaled and v9 * GameState.TimeScale or v9
                v1 = n:step(v3)
                v2 = u103[k]
                if not v2 then
                    i[k] = v1
                else
                    class_2 = v2.class
                    if not i:IsA(class_2) then
                        i[k] = v1
                    else
                        v2.set(i, v1)
                    end
                end
            else
                j[k] = nil
                rawGoal = n.rawGoal
                v2 = u103[k]
                if not v2 then
                    i[k] = rawGoal
                else
                    class = v2.class
                    if not i:IsA(class) then
                        i[k] = rawGoal
                    else
                        v2.set(i, rawGoal)
                    end
                end
            end
        end
        if not next(j) then
            u112[i] = nil
            v4 = u113[i]
            if v4 then
                u113[i] = nil
                for m, i5 in v4 do
                    task.spawn(i5)
                end
            end
        end
    end
end)

local function assertType(a1, a2, a3, a4) -- Line: 740 -- types: a1: number, a2: string, a3: string
    if not a3:find((typeof(a4))) then
        error(("bad argument #%* to %* (%* expected, got %*)"):format(a1, a2, a3, (typeof(a4))), 3)
    end
end

return (table.freeze({
    target = function(a1, a2, a3, a4, a5) -- Line: 752
        -- upvalues: u112 (val), u103 (val), u68 (val)
        local v1, v2, v3
        local timeScale = a5 and a5.timeScale
        if a2 ~= a2 or a2 < 0 then
            error(("expected damping ratio >= 0; got %.2f"):format(a2), 2)
        end
        if a3 ~= a3 or a3 < 0 then
            error(("expected undamped frequency >= 0; got %.2f"):format(a3), 2)
        end
        local v4 = u112[a1]
        if not v4 then
            u112[a1] = {}
        end
        local v5 = nil
        local v6 = nil
        local v7, v8, v9 = a1, a3, a2
        for i, j in a4, v5, v6 do
            v2 = u103[i]
            v1 = if not v2 then v7[i] else if not v7:IsA(v2.class) then v7[i] else v2.get(v7)
            if v8 ~= (1 / 0) then
                v2 = v4[i]
                if not v2 then
                    v3 = u68[typeof(j)]
                    if not v3 then
                        error("unsupported type: " .. typeof(j), 2)
                    end
                    v2 = v3.springType(v9, v8, v1, j, v3)
                    v4[i] = v2
                end
                v2.timeScaled = timeScale
                v2:setGoal(j)
                v2:setDampingRatio(v9)
                v2:setFrequency(v8)
            else
                v2 = u103[i]
                if not v2 or not v7:IsA(v2.class) then
                    v7[i] = j
                else
                    v2.set(v7, j)
                end
                v4[i] = nil
            end
        end
        if not next(v4) then
            u112[v7] = nil
        end
    end,
    bump = function(a1, a2, a3, a4, a5) -- Line: 826
        -- upvalues: u112 (val), u103 (val), u68 (val)
        local v1, v2, v3
        local timeScaled = a5 and a5.timeScaled
        local impulse = a5 and a5.impulse
        if a2 ~= a2 or a2 < 0 then
            error(("expected damping ratio >= 0; got %.2f"):format(a2), 2)
        end
        if a3 ~= a3 or a3 < 0 then
            error(("expected undamped frequency >= 0; got %.2f"):format(a3), 2)
        end
        local v4 = u112[a1]
        if not v4 then
            u112[a1] = {}
        end
        local v5 = nil
        local v6 = nil
        local v7, v8, v9 = a1, a3, a2
        for i, j in a4, v5, v6 do
            v2 = u103[i]
            v1 = if not v2 then v7[i] else if not v7:IsA(v2.class) then v7[i] else v2.get(v7)
            if v8 ~= (1 / 0) then
                v2 = v4[i]
                if not v2 then
                    v3 = u68[typeof(j)]
                    if not v3 then
                        error("unsupported type: " .. typeof(j), 2)
                    end
                    v2 = v3.springType(v9, v8, v1, j, v3)
                    v4[i] = v2
                end
                if timeScaled ~= nil then
                    v2.timeScaled = timeScaled
                end
                if not impulse then
                    v2:setVelocity(j)
                else
                    v2:impulseVelocity(j)
                end
                v2:setDampingRatio(v9)
                v2:setFrequency(v8)
            else
                v2 = u103[i]
                if not v2 or not v7:IsA(v2.class) then
                    v7[i] = j
                else
                    v2.set(v7, j)
                end
                v4[i] = nil
            end
        end
        if not next(v4) then
            u112[v7] = nil
        end
    end,
    stop = function(a1, a2) -- Line: 909 -- upvalues: u112 (val) -- types: a1: userdata, a2: string?
        if not a2 then
            u112[a1] = nil
            return
        end
        local v1 = u112[a1]
        if not v1 then
            return
        end
        v1[a2] = nil
    end,
    completed = function(a1, a2) -- Line: 925 -- upvalues: u113 (val) -- types: a1: userdata, a2: function
        local v1 = u113[a1]
        if v1 then
            table.insert(v1, a2)
            return
        end
        u113[a1] = {a2}
    end,
}))