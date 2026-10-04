-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewCamera
-- Decompile time: 21.98 ms

local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local Packages = ReplicatedStorage.Packages
local Modules = ReplicatedStorage.Shared.Modules
local FractalitySpring = require(Packages.FractalitySpring)
local Maid = require(Modules.Maid)
local Promise = require(Packages.Promise)
local u39 = Enum.RenderPriority.Camera.Value + 2
local u44 = TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out)
local u45 = {}
u45.__index = u45

local function applyStickDeadzone(a1) -- Line: 91 -- types: a1: userdata
    local Magnitude = a1.Magnitude
    if Magnitude <= 0.15 then
        return Vector2.zero
    end
    return a1.Unit * (math.clamp((Magnitude - 0.15) / 0.85, 0, 1))
end

local function applyTriggerDeadzone(a1) -- Line: 102 -- types: a1: number
    return (math.clamp((a1 - 0.1) / 0.9, 0, 1))
end

local function getGamepadInput() -- Line: 106 -- upvalues: UserInputService (val)
    local Magnitude, v1, zero
    if not UserInputService.GamepadEnabled then
        return (Vector3.new(0, 0, 0))
    end
    local v2 = Vector3.new(0, 0, 0)
    for i, j in UserInputService:GetGamepadState(Enum.UserInputType.Gamepad1) do
        if j.KeyCode == Enum.KeyCode.Thumbstick2 then
            v1 = Vector2.new(j.Position.X, j.Position.Y)
            Magnitude = v1.Magnitude
            zero = if not (Magnitude <= 0.15) then v1.Unit * (math.clamp((Magnitude - 0.15) / 0.85, 0, 1)) else Vector2.zero
            v2 = Vector3.new(zero.X, zero.Y, v2.Z)
        elseif j.KeyCode == Enum.KeyCode.ButtonR2 then
            v2 = v2 - Vector3.new(0, 0, (math.clamp((j.Position.Z - 0.1) / 0.9, 0, 1)))
        elseif j.KeyCode == Enum.KeyCode.ButtonL2 then
            v2 = v2 + Vector3.new(0, 0, (math.clamp((j.Position.Z - 0.1) / 0.9, 0, 1)))
        end
    end
    return v2
end

local function getCameraAnchor() -- Line: 126
    local Lobby = workspace:FindFirstChild("Lobby")
    local CameraFolder = Lobby and Lobby:FindFirstChild("CameraFolder")
    local ShopFocusCamera = CameraFolder and CameraFolder:FindFirstChild("ShopFocusCamera")
    if ShopFocusCamera and ShopFocusCamera:IsA("BasePart") then
        return ShopFocusCamera
    end
    return nil
end

local function getModelBounds(a1) -- Line: 134 -- types: a1: userdata
    local PrimaryPart = a1.PrimaryPart
    if not PrimaryPart then
        return nil, nil, nil
    end
    local BoundingBox, BoundingBox_2 = a1:GetBoundingBox()
    return PrimaryPart.Position, BoundingBox, BoundingBox_2
end

local function calculateInitialDistance(a1, a2, a3, a4) -- Line: 144
    -- upvalues: 
    local ViewportSize = a1.ViewportSize
    local v1 = math.min(
        0.3490658503988659,
        (math.atan(0.36397023426620234 * (if not (0 < ViewportSize.X) then 1 else if not (0 < ViewportSize.Y) then 1 else ViewportSize.X / ViewportSize.Y)))
    )
    local Magnitude = (a3.Position - a2).Magnitude
    return (math.clamp(a4.Magnitude / 2 + Magnitude, 2, 6)) / math.sin(v1) * 1.1
end

local function getYaw(a1) -- Line: 167 -- types: a1: vector
    return (math.atan2(a1.X, a1.Z))
end

local function getOrbitAngles(a1, a2) -- Line: 171 -- types: a1: number, a2: number
    return (CFrame.Angles(0, a1, 0)) * CFrame.Angles(-a2, 0, 0)
end

local function getOrbitCFrame(a1, a2, a3) -- Line: 175 -- types: a1: vector, a2: Vector2, a3: number
    return CFrame.new(a1) * a2 * CFrame.new(0, 0, a3)
end

function u45.new() -- Line: 179 -- upvalues: Maid (val), FractalitySpring (val), u45 (val)
    local v1 = (CFrame.Angles(0, 0, 0)) * CFrame.Angles(-0.17453292519943295, 0, 0)
    return (setmetatable({
        enabled = false,
        destroyed = false,
        goalYaw = 0,
        goalPitch = 0.17453292519943295,
        cameraInput = Vector3.new(0, 0, 0),
        maxZoomDistance = 20,
        createdDepthOfField = false,
        maid = Maid.new(),
        anglesSpring = FractalitySpring.new(1, 10, v1, v1),
        distanceSpring = FractalitySpring.new(1, 4, 6, 6),
    }, u45))
end

function u45:_tweenFieldOfView(a2) -- Line: 217
    -- upvalues: TweenService (val), u44 (val)
    local camera = self.camera
    if not camera then
        return
    end
    local fieldOfViewTween = self.fieldOfViewTween
    if fieldOfViewTween then
        fieldOfViewTween:Cancel()
    end
    local v1 = TweenService:Create(camera, u44, {FieldOfView = a2})
    self.fieldOfViewTween = v1
    v1:Play()
end

function u45:_setAnglesGoal(a2, a3) -- Line: 233 -- types: self: table, a2: number, a3: number
    self.goalYaw = a2
    self.goalPitch = math.clamp(a3, -0.3490658503988659, 1.5707963267948966)
    local anglesSpring = self.anglesSpring
    local goalYaw = self.goalYaw
    local goalPitch = self.goalPitch
    anglesSpring:setGoal((CFrame.Angles(0, goalYaw, 0)) * (CFrame.Angles(-goalPitch, 0, 0)))
end

function u45:_setDistanceGoal(a2) -- Line: 239 -- types: self: table, a2: number
    self.distanceSpring:setGoal((math.clamp(a2, 6, self.maxZoomDistance)))
end

function u45:_orbit(a2) -- Line: 243 -- types: self: table, a2: userdata
    self.cameraInput = self.cameraInput + Vector3.new(-a2.X * 0.006108652381980153, a2.Y * 0.006108652381980153, 0)
end

function u45:_zoom(a2) -- Line: 251 -- types: self: table, a2: number
    self.cameraInput = self.cameraInput + Vector3.new(0, 0, a2)
end

function u45.GetZoomInScalar(a1) -- Line: 255 -- types: a1: table
    local v1 = a1.maxZoomDistance - 6
    if v1 <= 0 then
        return 1
    end
    return 1 - math.clamp((a1.distanceSpring:getPosition() - 6) / v1, 0, 1)
end

function u45:_enableDepthOfField() -- Line: 265 -- upvalues: Lighting (val) -- types: self: table
    local DepthOfFieldEffect = Lighting:FindFirstChildOfClass("DepthOfFieldEffect")
    local v1 = false
    if not DepthOfFieldEffect then
        DepthOfFieldEffect = Instance.new("DepthOfFieldEffect")
        DepthOfFieldEffect.Name = "ShopFocusDepthOfField"
        DepthOfFieldEffect.Parent = Lighting
        v1 = true
    end
    self.depthOfField = DepthOfFieldEffect
    self.createdDepthOfField = v1
    self.previousDepthOfField = {
        Enabled = DepthOfFieldEffect.Enabled,
        FarIntensity = DepthOfFieldEffect.FarIntensity,
        FocusDistance = DepthOfFieldEffect.FocusDistance,
        InFocusRadius = DepthOfFieldEffect.InFocusRadius,
        NearIntensity = DepthOfFieldEffect.NearIntensity,
    }
    DepthOfFieldEffect.Enabled = true
    DepthOfFieldEffect.FarIntensity = 1
    DepthOfFieldEffect.FocusDistance = self.distanceSpring:getPosition()
    DepthOfFieldEffect.InFocusRadius = 0
    DepthOfFieldEffect.NearIntensity = 0
end

function u45:_disableDepthOfField() -- Line: 292 -- types: self: table
    local depthOfField = self.depthOfField
    if not depthOfField then
        return
    end
    if not self.createdDepthOfField then
        local previousDepthOfField = self.previousDepthOfField
        if previousDepthOfField then
            depthOfField.Enabled = previousDepthOfField.Enabled
            depthOfField.FarIntensity = previousDepthOfField.FarIntensity
            depthOfField.FocusDistance = previousDepthOfField.FocusDistance
            depthOfField.InFocusRadius = previousDepthOfField.InFocusRadius
            depthOfField.NearIntensity = previousDepthOfField.NearIntensity
        end
    else
        depthOfField:Destroy()
    end
    self.depthOfField = nil
    self.createdDepthOfField = false
    self.previousDepthOfField = nil
end

function u45:_update(a2) -- Line: 316 -- upvalues: getGamepadInput (val) -- types: self: table, a2: number
    local cameraInput = self.cameraInput
    self.cameraInput = Vector3.new(0, 0, 0)
    local camera = self.camera
    local model = self.model
    local focus = self.focus
    if self.enabled and camera and model and focus then
        local v1 = getGamepadInput()
        local v2 = cameraInput + Vector3.new(-v1.X * 2.0943951023931953 * a2, -v1.Y * 2.0943951023931953 * a2, v1.Z * 12 * a2)
        if v2.X ~= 0 or v2.Y ~= 0 then
            self:_setAnglesGoal(self.goalYaw + v2.X, self.goalPitch + v2.Y)
        end
        if v2.Z ~= 0 then
            self:_setDistanceGoal((self.distanceSpring:getGoal()) + v2.Z)
        end
        local v3 = self.anglesSpring:step(a2)
        local v4 = self.distanceSpring:step(a2)
        camera.CFrame = CFrame.new(focus) * v3 * CFrame.new(0, 0, v4)
        if self.depthOfField then
            self.depthOfField.FocusDistance = v4
        end
        return
    end
end

function u45:_bindInput() -- Line: 350
    -- upvalues: UserInputService (val), RunService (val), u39 (val)
    local u1 = false
    local u2 = nil
    local u3 = nil
    local u4 = 1
    local u5 = false
    self.cameraInput = Vector3.new(0, 0, 0)
    self.maid:Mark((UserInputService.InputBegan:Connect(function(a1, a2) -- Line: 358 -- upvalues: u1 (ref), u2 (ref)
        if a2 then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseButton2 then
            u1 = true
            u2 = Vector2.new(a1.Position.X, a1.Position.Y)
        end
    end)))
    self.maid:Mark((UserInputService.InputEnded:Connect(function(a1) -- Line: 369 -- upvalues: u1 (ref), u2 (ref)
        if a1.UserInputType == Enum.UserInputType.MouseButton2 then
            u1 = false
            u2 = nil
        end
    end)))
    self.maid:Mark((UserInputService.InputChanged:Connect(function(a1, a2) -- Line: 376 -- upvalues: self (val), u1 (ref), u2 (ref)
        if a2 then
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseWheel then
            self:_zoom(-a1.Position.Z * 1.5)
            return
        end
        if a1.UserInputType == Enum.UserInputType.MouseMovement and u1 then
            local v1 = Vector2.new(a1.Position.X, a1.Position.Y)
            if u2 then
                self:_orbit(v1 - u2)
            end
            u2 = v1
        end
    end)))
    self.maid:Mark((UserInputService.TouchPan:Connect(function(a1, a2, a3, a4, a5) -- Line: 393 -- upvalues: u3 (ref), u5 (ref), self (val)
        if a4 ~= Enum.UserInputState.End and a4 ~= Enum.UserInputState.Cancel then
            if not a5 and not u5 then
                local v1 = a1[1]
                if a4 == Enum.UserInputState.Begin then
                    u3 = v1
                    return
                end
                if a4 == Enum.UserInputState.Change and v1 then
                    if u3 then
                        self:_orbit(v1 - u3)
                    end
                    u3 = v1
                end
                return
            end
            return
        end
        u3 = nil
    end)))
    self.maid:Mark((UserInputService.TouchPinch:Connect(function(a1, a2, a3, a4, a5) -- Line: 415 -- upvalues: u5 (ref), u4 (ref), u3 (ref), self (val)
        if a4 ~= Enum.UserInputState.End and a4 ~= Enum.UserInputState.Cancel then
            if a5 then
                return
            end
            if a4 == Enum.UserInputState.Begin then
                u5 = true
                u4 = a2
                u3 = nil
                return
            end
            if a4 == Enum.UserInputState.Change then
                if u4 > 0 and a2 > 0 then
                    local v1 = (self.distanceSpring:getGoal()) + self.cameraInput.Z
                    self:_zoom(v1 * (u4 / a2) - v1)
                end
                u4 = a2
            end
            return
        end
        u5 = false
        u4 = 1
    end)))
    local camera = self.camera
    if camera then
        self.maid:Mark(((camera:GetPropertyChangedSignal("ViewportSize")):Connect(function() -- Line: 441 -- upvalues: self (val)
            local model = self.model
            if model then
                self:SetSubject(model, true)
            end
        end)))
    end
    RunService:BindToRenderStep("ShopPreviewCamera", u39, function(a1) -- Line: 449 -- upvalues: self (val)
        self:_update(a1)
    end)
    self.maid:Mark(function() -- Line: 452 -- upvalues: RunService (upval), self (val)
        RunService:UnbindFromRenderStep("ShopPreviewCamera")
        self.cameraInput = Vector3.new(0, 0, 0)
    end)
end

function u45.Enable(a1) -- Line: 458 -- upvalues: Promise (val) -- types: a1: table
    return Promise.new(function(a1_2, a2) -- Line: 459 -- upvalues: a1 (val)
        local v1
        if a1.destroyed then
            a2("Cannot enable a destroyed PreviewCamera")
            return
        end
        local CurrentCamera = workspace.CurrentCamera
        if not CurrentCamera then
            a2("CurrentCamera not found for ShopFocus")
            return
        end
        local Lobby = workspace:FindFirstChild("Lobby")
        local CameraFolder = Lobby and Lobby:FindFirstChild("CameraFolder")
        local ShopFocusCamera = CameraFolder and CameraFolder:FindFirstChild("ShopFocusCamera")
        if not (if not ShopFocusCamera then nil else if not ShopFocusCamera:IsA("BasePart") then nil else ShopFocusCamera) then
            a2("ShopFocusCamera not found in workspace.Lobby.CameraFolder")
            return
        end
        if not a1.enabled then
            if a1.restoringFieldOfView then
                local fieldOfViewTween = a1.fieldOfViewTween
                if fieldOfViewTween then
                    fieldOfViewTween:Cancel()
                end
                CurrentCamera.FieldOfView = a1.restoringFieldOfView
                a1.restoringFieldOfView = nil
            end
            a1.camera = CurrentCamera
            a1.previousCameraType = CurrentCamera.CameraType
            a1.previousCameraSubject = CurrentCamera.CameraSubject
            a1.previousFieldOfView = CurrentCamera.FieldOfView
            a1.enabled = true
            a1:_enableDepthOfField()
            a1:_bindInput()
        end
        a1.model = nil
        a1.focus = nil
        CurrentCamera.CameraType = Enum.CameraType.Scriptable
        CurrentCamera.CFrame = v1.CFrame
        a1:_tweenFieldOfView(40)
        a1_2()
    end)
end

function u45:SetSubject(a2, a3) -- Line: 505
    -- upvalues: calculateInitialDistance (val)
    local Position, v1, v2
    if self.destroyed then
        return
    end
    local camera = self.camera
    if not camera then
        return
    end
    local PrimaryPart = a2.PrimaryPart
    if PrimaryPart then
        local BoundingBox, BoundingBox_2 = a2:GetBoundingBox()
        Position = PrimaryPart.Position
        v1 = BoundingBox
        v2 = BoundingBox_2
    else
        Position = nil
        v1 = nil
        v2 = nil
    end
    if Position and v1 and v2 then
        local v3
        local v4 = calculateInitialDistance(camera, Position, v1, v2)
        self.model = a2
        self.focus = Position
        if a3 then
            v3 = self.distanceSpring:getGoal()
            self.maxZoomDistance = math.max(20, v4 * 1.5, v3)
            if v3 < v4 then
                self:_setDistanceGoal(v4)
            end
            return
        end
        v3 = camera.CFrame.Position - Position
        local Magnitude = v3.Magnitude
        if Magnitude < 0.001 then
            v3 = Vector3.new(0, 0, 6)
            Magnitude = 6
        end
        local v5 = math.atan2(v3.X, v3.Z)
        local v6 = (CFrame.Angles(0, v5, 0)) * CFrame.Angles(-0.17453292519943295, 0, 0)
        self.goalYaw = v5
        self.goalPitch = 0.17453292519943295
        local v7 = math.max(Magnitude, v4)
        self.maxZoomDistance = math.max(20, v4 * 1.5, v7)
        local v8 = math.max(v7, 6)
        self.anglesSpring:setPosition(v6)
        self.anglesSpring:setGoal(v6)
        self.distanceSpring:setPosition(v8)
        self.distanceSpring:setGoal(v8)
        self:_update(0)
        return
    end
end

function u45.ClearSubject(a1) -- Line: 556 -- types: a1: table
    a1.model = nil
    a1.focus = nil
end

function u45.Disable(a1) -- Line: 561 -- upvalues: Promise (val) -- types: a1: table
    return Promise.new(function(a1_2) -- Line: 562 -- upvalues: a1 (val)
        if not a1.enabled then
            a1_2()
            return
        end
        a1.enabled = false
        a1.model = nil
        a1.focus = nil
        a1.maid:Sweep()
        a1:_disableDepthOfField()
        local camera = a1.camera
        if camera then
            if a1.previousCameraSubject then
                camera.CameraSubject = a1.previousCameraSubject
            end
            local previousCameraType = a1.previousCameraType or Enum.CameraType.Custom
            camera.CameraType = previousCameraType
            a1.restoringFieldOfView = a1.previousFieldOfView or 70
            a1:_tweenFieldOfView(a1.restoringFieldOfView)
        end
        a1.previousCameraType = nil
        a1.previousCameraSubject = nil
        a1.previousFieldOfView = nil
        a1_2()
    end)
end

function u45:Destroy() -- Line: 591 -- types: self: table
    if self.destroyed then
        return
    end
    local camera = self.camera
    self:Disable()
    local restoringFieldOfView = self.restoringFieldOfView
    local fieldOfViewTween = self.fieldOfViewTween
    if fieldOfViewTween then
        fieldOfViewTween:Cancel()
        self.fieldOfViewTween = nil
    end
    if camera and restoringFieldOfView then
        camera.FieldOfView = restoringFieldOfView
    end
    self.maid:Sweep()
    self.camera = nil
    self.restoringFieldOfView = nil
    self.destroyed = true
end

return u45