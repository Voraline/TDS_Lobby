-- Script path: ReplicatedStorage.Client.Modules.Moonlite.Specials
-- Decompile time: 25.14 ms

local Terrain, v1
local Parent = script.Parent
local RunService = game:GetService("RunService")
require(Parent.Types)
local u10 = {}
local u11 = {
    Camera = {AttachToPart = true, LookAtPart = true},
    Humanoid = {
        AddAccessory = true,
        ChangeState = true,
        EquipTool = true,
        MoveTo = true,
        Move = true,
        PlayEmote = true,
        RemoveAccessories = true,
        TakeDamage = true,
        UnequipTools = true,
    },
    ParticleEmitter = {Emit = true, Clear = true},
    Sound = {
        PlayOnce = true,
        SetTime = true,
        Play = true,
        Resume = true,
        Pause = true,
        Stop = true,
    },
    VideoFrame = {Playing = true},
}

local function getValue(a1, a2, a3) -- Line: 74 -- types: a1: userdata, a2: string
    return a1:GetAttribute((("__moonlite_%*"):format(a2))) or a3
end

local function setValue(a1, a2, a3, a4) -- Line: 78 -- types: a1: userdata, a2: string
    a1:SetAttribute(("__moonlite_%*"):format(a2), if a3 ~= a4 then a3 else nil)
end

local function BoundProp(a1) -- Line: 82
    return function(a1_2, a2) -- Line: 83 -- upvalues: a1 (val) -- types: a1_2: userdata
        assert(a1.Get)
        return {
            Get = function() -- Line: 87 -- upvalues: a1 (upval), a1_2 (val), a2 (val)
                return a1.Get(a1_2, a2)
            end,
            Set = function(a1_3) -- Line: 91 -- upvalues: a1 (upval), a1_2 (val), a2 (val)
                a1.Set(a1_3, a1_2, a2)
            end,
        }
    end
end

local function LazyAction(a1) -- Line: 98 -- types: a1: function
    return function(a1_2) -- Line: 99 -- upvalues: a1 (val) -- types: a1_2: userdata
        return {
            Default = false,
            Set = function(a1_3) -- Line: 103 -- upvalues: a1 (upval), a1_2 (val) -- types: a1_3: boolean
                if a1_3 then
                    a1(a1_2)
                end
            end,
        }
    end
end

local function setCameraActive(a1, a2, a3) -- Line: 118
    -- upvalues: RunService (val)
    if a3 and not a1._cameraRenderBound then
        RunService:BindToRenderStep("MoonliteRenderCamera", 1000, function() -- Line: 120 -- upvalues: a1 (val), a2 (val)
            local _cameraAttachToPart = a1._cameraAttachToPart
            local _cameraLookAtPart = a1._cameraLookAtPart
            if _cameraAttachToPart then
                local CFrame_2 = _cameraAttachToPart.CFrame
                if _cameraLookAtPart then
                    CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
                end
                a2.CFrame = CFrame_2
            end
        end)
        a1._cameraRenderBound = true
        local _cameraAttachToPart = a1._cameraAttachToPart
        local _cameraLookAtPart = a1._cameraLookAtPart
        if _cameraAttachToPart then
            local CFrame_2 = _cameraAttachToPart.CFrame
            if _cameraLookAtPart then
                CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
            end
            a2.CFrame = CFrame_2
        end
        if a1.KeepCameraType then
            return
        end
        a2.CameraType = Enum.CameraType.Scriptable
        return
    end
    if not a3 and a1._cameraRenderBound then
        RunService:UnbindFromRenderStep("MoonliteRenderCamera")
        if not a1.KeepCameraType then
            a2.CameraType = Enum.CameraType.Custom
        end
        a1._cameraRenderBound = false
    end
end

local v2 = {}
local u23 = {}

function u23.Get(a1, a2) -- Line: 155 -- types: a1: userdata
    return a2._cameraAttachToPart
end

function u23.Set(a1, a2, a3) -- Line: 159 -- upvalues: RunService (val) -- types: a1: userdata?, a2: userdata
    if not a1 then
        a3._cameraAttachToPart = nil
        if a3._cameraRenderBound then
            RunService:UnbindFromRenderStep("MoonliteRenderCamera")
            if not a3.KeepCameraType then
                a2.CameraType = Enum.CameraType.Custom
            end
            a3._cameraRenderBound = false
        end
        return
    end
    a3._activeCamera = a2
    a3._cameraAttachToPart = a1
    if not a3._cameraRenderBound then
        RunService:BindToRenderStep("MoonliteRenderCamera", 1000, function() -- Line: 120 -- upvalues: a3 (val), a2 (val)
            local _cameraAttachToPart = a3._cameraAttachToPart
            local _cameraLookAtPart = a3._cameraLookAtPart
            if _cameraAttachToPart then
                local CFrame_2 = _cameraAttachToPart.CFrame
                if _cameraLookAtPart then
                    CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
                end
                a2.CFrame = CFrame_2
            end
        end)
        a3._cameraRenderBound = true
        local _cameraAttachToPart = a3._cameraAttachToPart
        local _cameraLookAtPart = a3._cameraLookAtPart
        if _cameraAttachToPart then
            local CFrame_2 = _cameraAttachToPart.CFrame
            if _cameraLookAtPart then
                CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
            end
            a2.CFrame = CFrame_2
        end
        if not a3.KeepCameraType then
            a2.CameraType = Enum.CameraType.Scriptable
            return
        end
    end
end

function v2.AttachToPart(a1, a2) -- Line: 83 -- upvalues: u23 (val) -- types: a1: userdata
    assert(u23.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u23 (upval), a1 (val), a2 (val)
            return u23.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u23 (upval), a1 (val), a2 (val)
            u23.Set(a1_2, a1, a2)
        end,
    }
end

local u27 = {}

function u27.Get(a1, a2) -- Line: 172 -- types: a1: userdata
    return a2._cameraLookAtPart
end

function u27.Set(a1, a2, a3) -- Line: 176 -- upvalues: RunService (val) -- types: a1: userdata?, a2: userdata
    if not a1 then
        a3._cameraLookAtPart = nil
        if not a3._cameraAttachToPart and a3._cameraRenderBound then
            RunService:UnbindFromRenderStep("MoonliteRenderCamera")
            if not a3.KeepCameraType then
                a2.CameraType = Enum.CameraType.Custom
            end
            a3._cameraRenderBound = false
        end
        return
    end
    a3._activeCamera = a2
    a3._cameraLookAtPart = a1
    if not a3._cameraRenderBound then
        RunService:BindToRenderStep("MoonliteRenderCamera", 1000, function() -- Line: 120 -- upvalues: a3 (val), a2 (val)
            local _cameraAttachToPart = a3._cameraAttachToPart
            local _cameraLookAtPart = a3._cameraLookAtPart
            if _cameraAttachToPart then
                local CFrame_2 = _cameraAttachToPart.CFrame
                if _cameraLookAtPart then
                    CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
                end
                a2.CFrame = CFrame_2
            end
        end)
        a3._cameraRenderBound = true
        local _cameraAttachToPart = a3._cameraAttachToPart
        local _cameraLookAtPart = a3._cameraLookAtPart
        if _cameraAttachToPart then
            local CFrame_2 = _cameraAttachToPart.CFrame
            if _cameraLookAtPart then
                CFrame_2 = CFrame.new(CFrame_2.Position, _cameraLookAtPart.Position)
            end
            a2.CFrame = CFrame_2
        end
        if not a3.KeepCameraType then
            a2.CameraType = Enum.CameraType.Scriptable
        end
    end
    if not a3._updateCamera then
        return
    end
    a3._updateCamera()
end

function v2.LookAtPart(a1, a2) -- Line: 83 -- upvalues: u27 (val) -- types: a1: userdata
    assert(u27.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u27 (upval), a1 (val), a2 (val)
            return u27.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u27 (upval), a1 (val), a2 (val)
            u27.Set(a1_2, a1, a2)
        end,
    }
end

u10.Camera = v2
v2 = {}
local u32 = {}

function u32.Get(a1) -- Line: 202 -- types: a1: userdata
    return a1:GetPivot()
end

function u32.Set(a1, a2) -- Line: 206 -- types: a1: userdata, a2: userdata
    a2:PivotTo(a1)
end

function v2.CFrame(a1, a2) -- Line: 83 -- upvalues: u32 (val) -- types: a1: userdata
    assert(u32.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u32 (upval), a1 (val), a2 (val)
            return u32.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u32 (upval), a1 (val), a2 (val)
            u32.Set(a1_2, a1, a2)
        end,
    }
end

u10.Model = v2
v2 = {}
local u37 = {}

function u37.Get(a1, a2) -- Line: 218 -- types: a1: userdata
    return a1.Playing
end

function u37.Set(a1, a2, a3) -- Line: 222 -- types: a1: boolean, a2: userdata
    if not a1 then
        a2:Pause()
        return
    end
    if not a2:GetAttribute("__video_loaded") then
        local Video = a2.Video
        a2.Video = ""
        a2.Video = Video
        a2:SetAttribute("__video_loaded", true)
    end
    a2:Play()
end

function v2.Playing(a1, a2) -- Line: 83 -- upvalues: u37 (val) -- types: a1: userdata
    assert(u37.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u37 (upval), a1 (val), a2 (val)
            return u37.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u37 (upval), a1 (val), a2 (val)
            u37.Set(a1_2, a1, a2)
        end,
    }
end

u10.VideoFrame = v2
u10.Terrain = {}
for i, j in Enum.Material:GetEnumItems() do
    if pcall(function() -- Line: 246 -- upvalues: j (val)
        local MaterialColor, Terrain, v0, v1, v2
        v0 = workspace
        Terrain = v0.Terrain
        v2 = j
        Terrain:GetMaterialColor(v2)
        return
    end) then
        Terrain = u10.Terrain
        v1 = ("MC_%*"):format(j.Name)
        local u131 = {}

        function u131.Get(a1) -- Line: 252 -- upvalues: j (val) -- types: a1: userdata
            return a1:GetMaterialColor(j)
        end

        function u131.Set(a1, a2) -- Line: 256 -- upvalues: j (val) -- types: a1: CFrame, a2: userdata
            a2:SetMaterialColor(j, a1)
        end

        Terrain[v1] = function(a1, a2) -- Line: 83 -- upvalues: u131 (val) -- types: a1: userdata
            assert(u131.Get)
            return {
                Get = function() -- Line: 87 -- upvalues: u131 (upval), a1 (val), a2 (val)
                    return u131.Get(a1, a2)
                end,
                Set = function(a1_2) -- Line: 91 -- upvalues: u131 (upval), a1 (val), a2 (val)
                    u131.Set(a1_2, a1, a2)
                end,
            }
        end
    end
end
local u59 = Color3.new(1, 1, 1)
local v3 = {}
local u61 = {}

function u61.Get(a1) -- Line: 271 -- types: a1: userdata
    return a1:GetPivot()
end

function u61.Set(a1, a2) -- Line: 275 -- types: a1: userdata, a2: userdata
    a2:PivotTo(a1)
end

function v3.CFrame(a1, a2) -- Line: 83 -- upvalues: u61 (val) -- types: a1: userdata
    assert(u61.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u61 (upval), a1 (val), a2 (val)
            return u61.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u61 (upval), a1 (val), a2 (val)
            u61.Set(a1_2, a1, a2)
        end,
    }
end

local u65 = {}

function u65.Get(a1) -- Line: 281 -- upvalues: u59 (val) -- types: a1: userdata
    return a1:GetAttribute("__moonlite_Color") or u59
end

function u65.Set(a1, a2) -- Line: 285 -- upvalues: u59 (val) -- types: a1: CFrame, a2: userdata
    local Color, v1, v2
    local v3, v4 = a1, a2
    for i, j in a2:GetDescendants() do
        if j:IsA("BasePart") then
            Color = j.Color
            v2 = j:GetAttribute("__moonlite_Color") or Color
            if v2 ~= v3 then
                v1 = if v3 ~= v2 then v3 else nil
                j:SetAttribute("__moonlite_Color", v1)
                j.Color = v3
            end
        end
    end
    v4:SetAttribute("__moonlite_Color", if v3 ~= u59 then v3 else nil)
end

function v3.Color(a1, a2) -- Line: 83 -- upvalues: u65 (val) -- types: a1: userdata
    assert(u65.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u65 (upval), a1 (val), a2 (val)
            return u65.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u65 (upval), a1 (val), a2 (val)
            u65.Set(a1_2, a1, a2)
        end,
    }
end

local u69 = {}

function u69.Get(a1) -- Line: 302 -- types: a1: userdata
    return a1:GetScale()
end

function u69.Set(a1, a2) -- Line: 306 -- types: a1: number, a2: userdata
    a2:ScaleTo(a1)
end

function v3.Scale(a1, a2) -- Line: 83 -- upvalues: u69 (val) -- types: a1: userdata
    assert(u69.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u69 (upval), a1 (val), a2 (val)
            return u69.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u69 (upval), a1 (val), a2 (val)
            u69.Set(a1_2, a1, a2)
        end,
    }
end

local u73 = {}

function u73.Get(a1) -- Line: 312 -- types: a1: userdata
    return a1:GetAttribute("__moonlite_Reflectance") or 0
end

function u73.Set(a1, a2) -- Line: 316 -- types: a1: number, a2: userdata
    if (a2:GetAttribute("__moonlite_Reflectance") or 0) ~= a1 then
        local Reflectance, v1
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                Reflectance = j.Reflectance
                v1 = j:GetAttribute("__moonlite_BaseReflectance") or Reflectance
                j.Reflectance = v1 + (1 - v1) * a1
            end
        end
        a2:SetAttribute("__moonlite_Reflectance", if a1 ~= 0 then a1 else nil)
    end
end

function v3.Reflectance(a1, a2) -- Line: 83 -- upvalues: u73 (val) -- types: a1: userdata
    assert(u73.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u73 (upval), a1 (val), a2 (val)
            return u73.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u73 (upval), a1 (val), a2 (val)
            u73.Set(a1_2, a1, a2)
        end,
    }
end

local u77 = {}

function u77.Get(a1) -- Line: 334 -- types: a1: userdata
    return a1:GetAttribute("__moonlite_Transparency") or 0
end

function u77.Set(a1, a2) -- Line: 338 -- types: a1: number, a2: userdata
    if (a2:GetAttribute("__moonlite_Transparency") or 0) ~= a1 then
        for i, j in a2:GetDescendants() do
            if j:IsA("BasePart") then
                j.LocalTransparencyModifier = a1
            end
        end
        a2:SetAttribute("__moonlite_Transparency", if a1 ~= 0 then a1 else nil)
    end
end

function v3.Transparency(a1, a2) -- Line: 83 -- upvalues: u77 (val) -- types: a1: userdata
    assert(u77.Get)
    return {
        Get = function() -- Line: 87 -- upvalues: u77 (upval), a1 (val), a2 (val)
            return u77.Get(a1, a2)
        end,
        Set = function(a1_2) -- Line: 91 -- upvalues: u77 (upval), a1 (val), a2 (val)
            u77.Set(a1_2, a1, a2)
        end,
    }
end

u10.Model = v3
v3 = {
    AddAccessory = function(a1) -- Line: 360 -- types: a1: userdata
        return {
            Set = function(a1_2) -- Line: 366 -- upvalues: a1 (val) -- types: a1_2: userdata?
                if a1_2 then
                    pcall(a1.AddAccessory, a1, a1_2)
                end
            end,
        }
    end,
    ChangeState = function(a1) -- Line: 374 -- types: a1: userdata
        return {
            Default = Enum.HumanoidStateType.None,
            Set = function(a1_2) -- Line: 378 -- upvalues: a1 (val)
                a1:ChangeState(a1_2)
            end,
        }
    end,
    EquipTool = function(a1) -- Line: 384 -- types: a1: userdata
        return {
            Set = function(a1_2) -- Line: 390 -- upvalues: a1 (val) -- types: a1_2: userdata?
                if a1_2 then
                    pcall(a1.EquipTool, a1, a1_2)
                end
            end,
        }
    end,
}

local function u86(a1) -- Line: 398 -- types: a1: userdata
    a1.Jump = true
end

function v3.Jump(a1) -- Line: 99 -- upvalues: u86 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u86 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u86(a1)
            end
        end,
    }
end

function v3:MoveTo() -- Line: 402 -- types: self: userdata
    local Attribute = self:GetAttribute("MoveToDefault")
    if typeof(Attribute) ~= "Vector3" then
        local RootPart = self.RootPart
        self:SetAttribute("MoveToDefault", if not RootPart then Vector3.new(0, 0, 0) else RootPart.Position)
    end
    return {
        Default = Attribute,
        Set = function(a1) -- Line: 420 -- upvalues: self (val) -- types: a1: vector
            self:MoveTo(a1)
        end,
    }
end

function v3:Move() -- Line: 426 -- types: self: userdata
    local Attribute = self:GetAttribute("MoveDefault")
    if typeof(Attribute) ~= "Vector3" then
        local RootPart = self.RootPart
        self:SetAttribute("MoveDefault", if not RootPart then Vector3.new(0, 0, 0) else RootPart.CFrame.LookVector)
    end
    return {
        Default = Attribute,
        Set = function(a1) -- Line: 444 -- upvalues: self (val) -- types: a1: vector
            self:Move(a1)
        end,
    }
end

function v3.PlayEmote(a1) -- Line: 450 -- types: a1: userdata
    return {
        Default = "",
        Set = function(a1_2) -- Line: 454 -- upvalues: a1 (val) -- types: a1_2: string
            a1:PlayEmote(a1_2)
        end,
    }
end

local function u91(a1) -- Line: 460 -- types: a1: userdata
    a1:RemoveAccessories()
end

function v3.RemoveAccessories(a1) -- Line: 99 -- upvalues: u91 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u91 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u91(a1)
            end
        end,
    }
end

function v3.Sit(a1) -- Line: 464 -- types: a1: userdata
    return {
        Set = function(a1_2) -- Line: 466 -- upvalues: a1 (val) -- types: a1_2: boolean
            a1.Sit = a1_2
        end,
    }
end

function v3.TakeDamage(a1) -- Line: 472 -- types: a1: userdata
    return {
        Set = function(a1_2) -- Line: 474 -- upvalues: a1 (val) -- types: a1_2: number
            a1:TakeDamage(a1_2)
        end,
    }
end

local function u95(a1) -- Line: 480 -- types: a1: userdata
    a1:UnequipTools()
end

function v3.UnequipTools(a1) -- Line: 99 -- upvalues: u95 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u95 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u95(a1)
            end
        end,
    }
end

u10.Humanoid = v3
v3 = {}

local function u98(a1) -- Line: 490 -- types: a1: userdata
    a1:Clear()
end

function v3.Clear(a1) -- Line: 99 -- upvalues: u98 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u98 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u98(a1)
            end
        end,
    }
end

function v3:Emit() -- Line: 494 -- types: self: userdata
    local Attribute = self:GetAttribute("EmitCount")
    local v1 = Attribute
    if type(v1) ~= "number" then
        Attribute = 1
    end
    return {
        Default = 0,
        Set = function(a1) -- Line: 504 -- upvalues: Attribute (ref), self (val)
            local v1 = if type(a1) ~= "number" then if a1 ~= true then 0 else Attribute else a1
            if v1 > 0 then
                self:Emit(v1)
            end
        end,
    }
end

u10.ParticleEmitter = v3
v3 = {}

local function u102(a1) -- Line: 523 -- types: a1: userdata
    local v1 = a1:Clone()
    v1.Parent = a1.Parent
    v1.PlayOnRemove = true
    v1:Destroy()
end

function v3.PlayOnce(a1) -- Line: 99 -- upvalues: u102 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u102 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u102(a1)
            end
        end,
    }
end

function v3.SetTime(a1) -- Line: 530 -- types: a1: userdata
    return {
        Default = 0,
        Set = function(a1_2) -- Line: 534 -- upvalues: a1 (val) -- types: a1_2: number
            a1.TimePosition = a1_2
        end,
    }
end

local function u105(a1) -- Line: 540 -- types: a1: userdata
    a1:Play()
end

function v3.Play(a1) -- Line: 99 -- upvalues: u105 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u105 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u105(a1)
            end
        end,
    }
end

local function u107(a1) -- Line: 544 -- types: a1: userdata
    a1:Resume()
end

function v3.Resume(a1) -- Line: 99 -- upvalues: u107 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u107 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u107(a1)
            end
        end,
    }
end

local function u109(a1) -- Line: 548 -- types: a1: userdata
    a1:Pause()
end

function v3.Pause(a1) -- Line: 99 -- upvalues: u109 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u109 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u109(a1)
            end
        end,
    }
end

local function u111(a1) -- Line: 552 -- types: a1: userdata
    a1:Stop()
end

function v3.Stop(a1) -- Line: 99 -- upvalues: u111 (val) -- types: a1: userdata
    return {
        Default = false,
        Set = function(a1_2) -- Line: 103 -- upvalues: u111 (upval), a1 (val) -- types: a1_2: boolean
            if a1_2 then
                u111(a1)
            end
        end,
    }
end

u10.Sound = v3
local u113 = {}
local u114 = {}
local u115 = {}
local u116 = {}

function u116.__index(a1, a2) -- Line: 576 -- upvalues: u114 (val), u10 (val) -- types: a2: string
    local v1
    local _target = a1._target
    local ClassName = _target.ClassName
    local v2 = u114[ClassName]
    if v2 == nil then
        v2 = {}
        v1 = nil
        local v3 = nil
        for i, j in u10, v1, v3 do
            if _target:IsA(i) then
                for k, n in j do
                    v2[k] = n
                end
            end
        end
        u114[ClassName] = v2
    end
    local v4 = v2[a2]
    v1 = nil
    if v4 then
        v1 = v4(_target, a1._work)
        rawset(a1, a2, v1)
    end
    return v1
end

return {
    Get = function(a1, a2, a3) -- Line: 614 -- upvalues: u115 (val), u116 (val) -- types: a2: userdata, a3: string
        local u9 = u115[a2]
        if not u9 then
            local v1 = {_target = a2, _work = a1}
            u9 = setmetatable(v1, u116)
            a2.Destroying:Connect(function() -- Line: 624 -- upvalues: u115 (upval), a2 (val), u9 (ref)
                if u115[a2] == u9 then
                    u115[a2] = nil
                end
            end)
            u115[a2] = (assert(u9))
        end
        return u9[a3]
    end,
    Static = function(a1, a2) -- Line: 638 -- upvalues: u113 (val), u11 (val) -- types: a1: userdata, a2: string
        local ClassName = a1.ClassName
        if not u113[ClassName] then
            local v1 = {}
            for k, v in pairs(u11) do
                if a1:IsA(k) then
                    for i, j in v do
                        v1[i] = j
                    end
                end
            end
            u113[ClassName] = v1
        end
        return u113[ClassName][a2] == true
    end,
    Index = u10,
}