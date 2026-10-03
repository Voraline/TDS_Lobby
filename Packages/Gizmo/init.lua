-- Script path: ReplicatedStorage.Packages.Gizmo
-- Decompile time: 4.95 ms

local deepCopy
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Terrain = workspace:WaitForChild("Terrain")
local Terrain_2 = workspace:FindFirstChild("Terrain")
assert(Terrain, "No terrain object found under workspace")
assert(Terrain_2, "No target parent found.")
local AOTGizmoAdornment = Terrain_2:FindFirstChild("AOTGizmoAdornment")
local GizmoAdornment = Terrain_2:FindFirstChild("GizmoAdornment")
if not AOTGizmoAdornment then
    AOTGizmoAdornment = Instance.new("WireframeHandleAdornment")
    AOTGizmoAdornment.Adornee = Terrain
    AOTGizmoAdornment.ZIndex = 1
    AOTGizmoAdornment.AlwaysOnTop = true
    AOTGizmoAdornment.Name = "AOTGizmoAdornment"
    AOTGizmoAdornment.Parent = Terrain_2
end
if not GizmoAdornment then
    GizmoAdornment = Instance.new("WireframeHandleAdornment")
    GizmoAdornment.Adornee = Terrain
    GizmoAdornment.ZIndex = 1
    GizmoAdornment.AlwaysOnTop = false
    GizmoAdornment.Name = "GizmoAdornment"
    GizmoAdornment.Parent = Terrain_2
end
local Gizmos = script:WaitForChild("Gizmos")
local u58 = {}
local u59 = {}
local u60 = {}
local u61 = {}
local u62 = {AlwaysOnTop = true, Transparency = 0}
u62.Color3 = Color3.fromRGB(13, 105, 172)
local u68 = {}
local u69 = false

local function Lerp(a1, a2, a3) -- Line: 80
    return a1 + (a2 - a1) * a3
end

function deepCopy(a1) -- Line: 84 -- upvalues: deepCopy (val)
    local v1 = {}
    for k, v in pairs(a1) do
        if type(v) == "table" then
            v = deepCopy(v)
        end
        v1[k] = v
    end
    return v1
end

local u78 = {
    Enabled = true,
    ActiveRays = 0,
    ActiveInstances = 0,
    Styles = {Color = "Color3", Transparency = "Transparency", AlwaysOnTop = "AlwaysOnTop"},
    AOTWireframeHandle = AOTGizmoAdornment,
    WireframeHandle = GizmoAdornment,
}

function u78.GetPoolSize() -- Line: 477 -- upvalues: u68 (val)
    local v1 = 0
    for i, j in u68 do
        v1 = v1 + #j
    end
    return v1
end

function u78.PushProperty(a1, a2) -- Line: 492 -- upvalues: u62 (val), AOTGizmoAdornment (ref), GizmoAdornment (ref)
    u62[a1] = a2
    if a1 == "AlwaysOnTop" then
        return
    end
    pcall(function() -- Line: 499 -- upvalues: AOTGizmoAdornment (upval), a1 (val), a2 (val), GizmoAdornment (upval)
        AOTGizmoAdornment[a1] = a2
        GizmoAdornment[a1] = a2
    end)
end

function u78.PopProperty(a1) -- Line: 510 -- upvalues: u62 (val), AOTGizmoAdornment (ref)
    if u62[a1] then
        return u62[a1]
    end
    return AOTGizmoAdornment[a1]
end

function u78.SetStyle(a1, a2, a3) -- Line: 524 -- upvalues: u78 (val)
    if a1 ~= nil and typeof(a1) == "Color3" then
        u78.PushProperty("Color3", a1)
    end
    if a2 ~= nil and typeof(a2) == "number" then
        u78.PushProperty("Transparency", a2)
    end
    if a3 ~= nil and typeof(a3) == "boolean" then
        u78.PushProperty("AlwaysOnTop", a3)
    end
end

function u78.DoCleaning() -- Line: 540
    -- upvalues: AOTGizmoAdornment (ref), GizmoAdornment (ref), u58 (ref), u68 (val), u78 (val)
    local ClassName
    AOTGizmoAdornment:Clear()
    GizmoAdornment:Clear()
    local v1 = nil
    local v2 = nil
    for i, j in u58, v1, v2 do
        ClassName = j.ClassName
        if not u68[ClassName] then
            u68[ClassName] = {}
        end
        j:Remove()
        table.insert(u68[ClassName], j)
    end
    u58 = {}
    u78.ActiveRays = 0
    u78.ActiveInstances = 0
end

function u78.ScheduleCleaning() -- Line: 556 -- upvalues: u69 (ref), u78 (val)
    if u69 then
        return
    end
    u69 = true
    task.delay(0, function() -- Line: 563 -- upvalues: u78 (upval), u69 (upval)
        u78.DoCleaning()
        u69 = false
    end)
end

function u78.AddDebrisInSeconds(a1, a2) -- Line: 575 -- upvalues: u60 (val) -- types: a1: number
    table.insert(u60, {"Seconds", a1, os.clock(), a2})
end

function u78.AddDebrisInFrames(a1, a2) -- Line: 584 -- upvalues: u60 (val) -- types: a1: number
    table.insert(u60, {"Frames", a1, 0, a2})
end

function u78.TweenProperties(a1, a2, a3) -- Line: 595
    -- upvalues: deepCopy (val), u61 (val)
    local u6 = {
        Time = 0,
        p_Properties = a1,
        Properties = deepCopy(a1),
        Goal = a2,
        TweenInfo = a3,
    }
    u61[u6] = true
    return function() -- Line: 609 -- upvalues: u61 (upval), u6 (val)
        u61[u6] = nil
    end
end

function u78.Init() -- Line: 616
    -- upvalues: RunService (val), u78 (val), Terrain_2 (val), AOTGizmoAdornment (ref), Terrain (val)
    -- upvalues: GizmoAdornment (ref), u61 (val), TweenService (val), u60 (val), u59 (val)
    RunService.RenderStepped:Connect(function(a1) -- Line: 617
        -- upvalues: u78 (upval), Terrain_2 (upval), AOTGizmoAdornment (upval), Terrain (upval), GizmoAdornment (upval)
        -- upvalues: u61 (upval), TweenService (upval), u60 (upval), u59 (upval)
        local LerpProperty, Value, v1, v2, v3, v4, v5, v6, v7, v8, v9
        if u78.Enabled then
            if not Terrain_2:FindFirstChild("AOTGizmoAdornment") then
                AOTGizmoAdornment = Instance.new("WireframeHandleAdornment")
                AOTGizmoAdornment.Adornee = Terrain
                AOTGizmoAdornment.ZIndex = 1
                AOTGizmoAdornment.AlwaysOnTop = true
                AOTGizmoAdornment.Name = "AOTGizmoAdornment"
                AOTGizmoAdornment.Parent = Terrain_2
                u78.AOTWireframeHandle = AOTGizmoAdornment
            end
            if not Terrain_2:FindFirstChild("GizmoAdornment") then
                GizmoAdornment = Instance.new("WireframeHandleAdornment")
                GizmoAdornment.Adornee = Terrain
                GizmoAdornment.ZIndex = 1
                GizmoAdornment.AlwaysOnTop = false
                GizmoAdornment.Name = "GizmoAdornment"
                GizmoAdornment.Parent = Terrain_2
                u78.WireframeHandle = GizmoAdornment
            end
        end
        local v10 = nil
        local v11 = nil
        for i in u61, v10, v11 do
            i.Time = i.Time + a1
            v6 = i.Time / i.TweenInfo.Time
            if v6 > 1 then
                v6 = 1
            end

            function LerpProperty(a1, a2, a3) -- Line: 651
                if type(a1) == "number" then
                    return a1 + (a2 - a1) * a3
                end
                return a1:Lerp(a2, a3)
            end

            v9 = nil
            v1 = nil
            for j, k in i.Properties, v9, v1 do
                if i.Goal[j] then
                    Value = TweenService:GetValue(v6, i.TweenInfo.EasingStyle, i.TweenInfo.EasingDirection)
                    v3 = i.Goal[j]
                    v2 = if type(k) ~= "number" then k:Lerp(v3, Value) else k + (v3 - k) * Value
                    i.p_Properties[j] = v2
                end
            end
            if v6 == 1 then
                u61[i] = nil
            end
        end
        for n = #u60, 1, -1 do
            v4 = u60[n]
            v5 = v4[1]
            v6 = v4[2]
            v7 = v4[3]
            v8 = v4[4]
            if v5 ~= "Seconds" then
                if not (v6 < v7) then
                    v4[2] = v4[2] + 1
                    v8()
                else
                    table.remove(u60, n)
                end
            elseif not (v6 < os.clock() - v7) then
                v8()
            else
                table.remove(u60, n)
            end
        end
        for m = #u59, 1, -1 do
            v4 = u59[m]
            v5 = v4[2]
            if v5.Enabled then
                if v5.Destroy then
                    table.remove(u59, m)
                end
                v4[1]:Update(v5)
            end
        end
    end)
end

function u78.SetEnabled(a1) -- Line: 723 -- upvalues: u78 (val)
    u78.Enabled = a1
    if a1 == false then
        u78.DoCleaning()
    end
end

function u78.RemoveAdornments() -- Line: 734 -- upvalues: Terrain_2 (val)
    if Terrain_2:FindFirstChild("AOTGizmoAdornment") then
        Terrain_2:FindFirstChild("AOTGizmoAdornment"):Destroy()
    end
    if Terrain_2:FindFirstChild("GizmoAdornment") then
        Terrain_2:FindFirstChild("GizmoAdornment"):Destroy()
    end
end

for i, j in Gizmos:GetChildren() do
    u78[j.Name] = (require(j).Init(u78, u62, function(a1) -- Line: 66 -- upvalues: u68 (val)
        if not u68[a1] then
            return Instance.new(a1)
        end
        local v1 = table.remove(u68[a1])
        if not v1 then
            return Instance.new(a1)
        end
        return v1
    end, function(a1) -- Line: 55 -- upvalues: u68 (val)
        local ClassName = a1.ClassName
        if not u68[ClassName] then
            u68[ClassName] = {}
        end
        a1:Remove()
        table.insert(u68[ClassName], a1)
    end, function(a1, a2) -- Line: 46 -- upvalues: u59 (val)
        table.insert(u59, {a1, a2})
    end, function(a1) -- Line: 50 -- upvalues: Terrain_2 (val), u58 (ref)
        a1.Parent = Terrain_2
        table.insert(u58, a1)
    end))
end
return u78