-- Script path: ReplicatedStorage.Client.Controllers.Shared.ParallaxController
-- Decompile time: 15.08 ms

local Lighting = game:GetService("Lighting")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Scenes = ((ReplicatedStorage:WaitForChild("Assets")):WaitForChild("Effects")):WaitForChild("Scenes")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local SettingsController = require(ReplicatedStorage.Client.Controllers.Shared.SettingsController)
local TagObserver = require(ReplicatedStorage.Shared.Modules.TagObserver)
local u63 = CFrame.fromEulerAnglesXYZ(0, 3.141592653589793, 0)
local u68 = SettingsController.User:Get("SavedQualityLevel")
SettingsController.User.Updated:Connect(function(a1, a2) -- Line: 23 -- upvalues: u68 (ref)
    if a1 == "SavedQualityLevel" then
        u68 = a2
    end
end)
local u75 = {_objects = {}, _render = false}
u75._parent = Create("ScreenGui", {
    Name = "WorldParallax",
    ResetOnSpawn = false,
    Parent = Players.LocalPlayer:WaitForChild("PlayerGui"),
})

local function isLowQuality() -- Line: 39 -- upvalues: u68 (ref), UserInputService (val)
    if not u68 then
        return true
    end
    if u68 ~= Enum.QualityLevel.Automatic.Value then
        return u68 <= Enum.SavedQualitySetting.QualityLevel5.Value
    end
    if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
        return true
    end
    return false
end

local function getSurfaceInfo(a1) -- Line: 55 -- types: a1: userdata
    local Adornee = a1.Adornee
    local CFrame_2 = Adornee.CFrame
    local Size = Adornee.Size
    local v1 = -Vector3.FromNormalId(a1.Face)
    local v2 = math.abs(v1.y) == 1 and Vector3.new(v1.y, 0, 0) or Vector3.new(0, 1, 0)
    local v3 = CFrame.fromAxisAngle(v2, 1.5707963267948966) * v1
    local Unit = v1:Cross(v3).Unit
    return CFrame_2 * CFrame.fromMatrix(-v1 * Size / 2, v3, Unit, v1), (Vector2.new((Size * v3).Magnitude, (Size * Unit).Magnitude))
end

local function renderSurface(a1, a2) -- Line: 70
    -- upvalues: getSurfaceInfo (val), u63 (val)
    local CurrentCamera = workspace.CurrentCamera
    local CFrame_2 = CurrentCamera.CFrame
    local v1, v2 = getSurfaceInfo(a1)
    if 0 < v1:PointToObjectSpace(CFrame_2.Position).Z then
        return
    end
    local v3 = v1.YVector:Cross(CFrame_2.ZVector)
    local v4 = CFrame.fromMatrix(CFrame_2.Position, 0 < (v3:Dot(v3)) and v3.Unit or CFrame_2.XVector, v1.YVector)
    local v5 = v1 * Vector3.new(0, v2.y / 2, 0)
    local v6 = v1 * Vector3.new(0, -v2.y / 2, 0)
    local v7 = v4:PointToObjectSpace(v5)
    local v8 = v4:PointToObjectSpace(v6)
    local Unit_2 = (v7 * Vector3.new(0, 1, 1)).Unit
    local Unit_3 = (v8 * Vector3.new(0, 1, 1)).Unit
    local v9 = (math.sign(Unit_2.y)) * math.acos(-Unit_2.z)
    local v10 = (math.sign(Unit_3.y)) * math.acos(-Unit_3.z)
    local v11 = math.tan((math.rad(CurrentCamera.FieldOfView / 2))) * 2
    local v12 = v1:VectorToObjectSpace(v1.Position - CFrame_2.Position)
    local Unit_4 = (v12 * Vector3.new(1, 0, 1)).Unit
    local v13 = v12 * Vector3.new(0, 1, 1)
    local v14 = -Unit_4.z
    local v15 = math.sqrt(1 - v14 * v14) / v14
    local v16 = 1
    if a1.SizingMode == Enum.SurfaceGuiSizingMode.FixedSize then
        v16 = v2.x / v2.y
    end
    local v17 = math.sign(v12.x * v12.z) * v15
    local v18 = v13.y / v13.z * v16
    local v19 = math.abs(((v1:VectorToObjectSpace(CFrame_2.LookVector)) * Vector3.new(1, 0, 1)).Unit:Dot(Unit_4) / v14 * (((math.tan(v9)) - math.tan(v10)) / v11) * v16)
    local v20 = (v1 - v1.Position) * u63 * CFrame.new(0, 0, 0, 1, 0, 0, 0, v16, 0, v17, v18, v19)
    local v21 = 0
    local v22 = {v20:GetComponents()}
    local v23 = #v22
    for i = 1, v23 do
        v21 = math.max(v21, (math.abs(v22[i])))
    end
    v23 = #v22
    for j = 1, v23 do
        v22[j] = v22[j] / v21
    end
    v23 = (CFrame.new(unpack(v22))) + CFrame_2.Position
    a2.FieldOfView = CurrentCamera.FieldOfView
    a2.CFrame = v23
end

function u75.Create(a1) -- Line: 138
    -- upvalues: Scenes (val), Create (val), Lighting (val), u75 (val), Maid (val), u68 (ref), UserInputService (val)
    -- upvalues: renderSurface (val)
    assert(a1:IsA("SurfaceGui"), (("%*\" has the parallax tag but is not a \"SurfaceGui\" instance!"):format((a1:GetFullName()))))
    local Adornee = a1.Adornee or a1.Parent
    local CFrame_2 = Adornee.CFrame
    local v1 = a1:GetAttribute("Scene") or "Default"
    local v2 = Scenes:WaitForChild(v1, 1)
    assert(v2, (("Scene \"%*\" does not exist!"):format(v1)))
    local v3 = v2:Clone()
    if v3:GetAttribute("SceneOffset") then
        v3:PivotTo((CFrame.new(CFrame_2.Position)) * (v3:GetAttribute("SceneOffset")))
    end
    local u64 = Create("Camera", {FieldOfView = workspace.CurrentCamera.FieldOfView, CFrame = CFrame.new()})
    local u74 = Create("Frame", {
        BackgroundTransparency = 0,
        Visible = false,
        Size = UDim2.fromScale(1, 1),
        BackgroundColor3 = Color3.new(),
    })
    local v4 = {
        Size = UDim2.fromScale(1, 1),
        BackgroundTransparency = 1,
        CurrentCamera = u64,
        LightDirection = Lighting:GetSunDirection(),
    }
    local Attribute_2 = a1:GetAttribute("OutdoorAmbient") or Lighting.OutdoorAmbient
    v4.Ambient = Attribute_2
    v4[1] = u64
    v4[2] = v3
    v4.Parent = a1
    local u102 = Create("ViewportFrame", v4)
    u64.Parent = u102
    a1.LightInfluence = 0
    a1.Brightness = Lighting.Brightness / 2
    a1.Adornee = Adornee
    a1.Parent = u75._parent
    local u113 = Maid.new()
    u113:Mark(v3)
    u113:Mark(u102)
    local u137 = if u68 then if u68 ~= Enum.QualityLevel.Automatic.Value then u68 <= Enum.SavedQualitySetting.QualityLevel5.Value else if not UserInputService.TouchEnabled then false else not UserInputService.KeyboardEnabled else true
    u74.Visible = u137
    u102.Visible = not u137
    return {
        Step = function() -- Line: 199
            -- upvalues: u68 (upval), UserInputService (upval), u137 (ref), u74 (val), u102 (val), renderSurface (upval)
            -- upvalues: a1 (val), u64 (val)
            local v1 = if u68 then if u68 ~= Enum.QualityLevel.Automatic.Value then u68 <= Enum.SavedQualitySetting.QualityLevel5.Value else if not UserInputService.TouchEnabled then false else not UserInputService.KeyboardEnabled else true
            if v1 ~= u137 then
                u137 = v1
                u74.Visible = u137
                u102.Visible = not u137
            end
            if v1 then
                return
            end
            renderSurface(a1, u64)
        end,
        Destroy = function() -- Line: 214 -- upvalues: u113 (val)
            u113:Sweep()
        end,
    }
end

function u75.render(a1) -- Line: 220 -- upvalues: u75 (val) -- types: a1: number
    if u75.update() then
        return
    end
    for i, j in u75._objects do
        j:Step(a1)
    end
end

function u75.update() -- Line: 231 -- upvalues: u75 (val), RunService (val)
    local v1 = next(u75._objects)
    if not u75._render then
        if v1 then
            u75._render = true
            RunService:BindToRenderStep("UPDATE_PARALLAX", Enum.RenderPriority.Camera.Value - 1, u75.render)
        end
        return
    end
    if v1 then
        return
    end
    RunService:UnbindFromRenderStep("UPDATE_PARALLAX")
    u75._render = false
    return true
end

function u75.init() -- Line: 253 -- upvalues: TagObserver (val), u75 (val)
    TagObserver("PARALLAX", function(a1) -- Line: 254 -- upvalues: u75 (upval) -- types: a1: userdata
        local u4 = u75.Create(a1)
        u75._objects[a1] = u4
        u75.update()
        return function() -- Line: 260 -- upvalues: u75 (upval), a1 (val), u4 (val)
            u75._objects[a1] = nil
            u4:Destroy()
        end
    end)
end

task.spawn(u75.init)
return u75