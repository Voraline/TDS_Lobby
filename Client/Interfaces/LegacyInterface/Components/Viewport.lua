-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Viewport
-- Decompile time: 2.45 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Mixin = require(ReplicatedStorage.Shared.UI.Mixin)
local u20 = {}
local u21 = {}
u21.__index = u21

function u21.new(a1, a2) -- Line: 13
    -- upvalues: Mixin (val), u21 (val), Lighting (val)
    local v1 = {_viewport = a1}
    v1._viewportPreview = {}
    v1._cameraOffset = CFrame.new()
    v1._viewportCamera = Instance.new("Camera", a1)
    v1._viewportRoot = not a2 and Instance.new("WorldModel", a1) or a1
    v1._offset = CFrame.new()
    v1._mixins = Mixin()
    local u25 = setmetatable(v1, u21)
    a1.CurrentCamera = u25._viewportCamera
    a1.LightDirection = Lighting:GetSunDirection()
    u25._mixins:Include("viewport_update", function(a1, a2, a3) -- Line: 30 -- upvalues: u25 (val)
        local _viewportPreview = u25._viewportPreview or {}
        local v1 = _viewportPreview.Offset or Vector3.new(0, 0, 0)
        local Rotation = _viewportPreview.Rotation or CFrame.Angles(0, 0, 0)
        a1.FieldOfView = _viewportPreview.Zoom or 70
        a1.CFrame = Rotation.Rotation * CFrame.new(0, 0, u25:GetFitDistance()) * CFrame.new(v1)
    end)
    return u25
end

function u21:Destroy() -- Line: 45
    self:Stop()
    if self._viewportRoot and self._viewportRoot ~= self._viewport then
        self._viewportRoot:Destroy()
        self._viewport = nil
    end
    if self._viewportCamera then
        self._viewportCamera:Destroy()
        self._viewportCamera = nil
    end
    if self._mixins then
        self._mixins:Destroy()
        self._mixins = nil
    end
    setmetatable(self, nil)
end

function u21.Run(a1) -- Line: 66 -- upvalues: u20 (val)
    u20[a1] = function(a1_2) -- Line: 69 -- upvalues: a1 (val) -- types: a1_2: number
        a1._mixins:Use("viewport_update", a1._viewportCamera, a1._model, a1_2)
    end
end

function u21.Stop(a1) -- Line: 74 -- upvalues: u20 (val)
    u20[a1] = nil
end

function u21:Include(a2, a3) -- Line: 78
    self._mixins:Include(a2, a3)
end

function u21.GetCamera(a1) -- Line: 82
    return a1._viewportCamera
end

function u21.SetPreviewData(a1, a2) -- Line: 86 -- types: a1: table, a2: table
    a1._viewportPreview = a2
end

function u21.GetPreviewData(a1) -- Line: 90
    return a1._viewportPreview
end

function u21.GetOffset(a1) -- Line: 94
    return a1._offset
end

function u21.SetOffset(a1, a2) -- Line: 98 -- types: a1: table, a2: userdata?
    a1._offset = a2 or CFrame.new()
end

function u21.SetModel(a1, a2, a3) -- Line: 102 -- types: a1: table, a2: userdata, a3: userdata?
    if a3 then
        a1._offset = a3
    end
    if a2 and a1._model ~= a2 then
        a2.Parent = a1._viewportRoot
        a2:PivotTo(a1._offset)
    end
    a1._model = a2
    a1._mixins:Use("update_model", a2)
end

function u21:GetFitDistance() -- Line: 116
    if not self._model then
        return 0
    end
    local _viewportCamera = self._viewportCamera
    local v1 = self._model:GetExtentsSize()
    local AbsoluteSize = self._viewport.AbsoluteSize
    local v2 = math.min(1, AbsoluteSize.X / AbsoluteSize.Y)
    local v3 = math.atan((math.tan((math.rad(_viewportCamera.FieldOfView / 2)))) * v2)
    return v1.Magnitude / 2 / math.sin(v3)
end

RunService:BindToRenderStep("UPDATE_VIEWPORTS", Enum.RenderPriority.Camera.Value - 1, function(a1) -- Line: 135 -- upvalues: u20 (val) -- types: a1: number
    for k, v in pairs(u20) do
        pcall(v, a1)
    end
end)
return u21