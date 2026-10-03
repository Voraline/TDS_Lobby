-- Script path: ReplicatedStorage.Client.Controllers.Lobby.ElevatorController
-- Decompile time: 6.68 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local VRService = game:GetService("VRService")
local Charm = require(ReplicatedStorage.Packages.Charm)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local Render = require(ReplicatedStorage.Shared.Modules.Render)
local Sound = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Sound)
local ViewController = require(ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers.ViewController)
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
local spr = require(ReplicatedStorage.Shared.Modules.spr)
local u75 = CFrame.Angles(math.rad(12), 0, 0)
local Elevators = NewNetwork.Channel("Elevators")
local LocalPlayer = Players.LocalPlayer
local u80 = nil
local CharacterAdded = LocalPlayer.CharacterAdded
CharacterAdded:Connect(function(a1) -- Line: 29 -- upvalues: u80 (ref)
    u80 = a1
end)
u80 = LocalPlayer.Character or CharacterAdded:Wait()
local u93 = {}

local function _createElevator(a1) -- Line: 39 -- upvalues: Maid (val), spr (val), u80 (ref), Sound (val)
    local u1 = {model = a1}
    local Touch = a1:WaitForChild("Touch")
    local Walls = a1:FindFirstChild("Walls")
    local Screen = a1:FindFirstChild("Screen")
    local ExitPart = a1:FindFirstChild("ExitPart", true)
    local CanCollide = Touch.CanCollide
    local CanTouch = Touch.CanTouch
    u1.Connections = Maid.new()
    u1.Touched = Touch.Touched
    u1.Screen = Screen
    u1.Platform = a1:WaitForChild("Platform")
    u1.Center = u1.Platform:GetPivot().Position + Vector3.new(0, 1, 0)
    local Pivot = u1.Platform:GetPivot()
    local u41 = Pivot - Vector3.new(0, 16, 0)
    local Exit = Screen and Screen:FindFirstChild("Exit")
    local View = a1:FindFirstChild("View", true)
    u1.ExitPart = if not ExitPart then nil else if not ExitPart:IsA("BasePart") then nil else ExitPart
    u1.ExitCFrame = Exit and Exit.WorldCFrame
    u1.ViewPosition = View and View.WorldPosition

    function u1.CanEnter(a1) -- Line: 109 -- upvalues: u1 (val), Pivot (val)
        return ((u1.Platform:GetPivot()).Position:FuzzyEq(Pivot.Position, 0.1))
    end

    function u1.Lower(a1) -- Line: 114 -- upvalues: spr (upval), u1 (val), u41 (val)
        spr.target(u1.Platform, 0.9, 0.4, {Pivot = u41})
    end

    function u1.Raise(a1) -- Line: 122 -- upvalues: spr (upval), u1 (val), Pivot (val)
        spr.target(u1.Platform, 0.9, 0.3, {Pivot = Pivot})
    end

    function u1.ToggleCollision(a1, a2) -- Line: 128
        -- upvalues: Touch (val), CanCollide (val), CanTouch (val), Walls (val)
        if a2 ~= "enable" then
            Touch.CanCollide = false
            Touch.CanTouch = false
        else
            Touch.CanCollide = CanCollide
            Touch.CanTouch = CanTouch
        end
        if Walls then
            local v1
            for k, v in pairs(Walls:GetChildren()) do
                if v:IsA("BasePart") then
                    v1 = a2 ~= "enable"
                    v.CanCollide = v1
                end
            end
        end
    end

    function u1.Enter(a1) -- Line: 146 -- upvalues: u1 (val), u80 (upval), Pivot (val), Sound (upval)
        u1.EntryCFrame = u80:GetPivot()
        u80:SetPrimaryPartCFrame((CFrame.new(Pivot.Position)) + Vector3.new(0, 5, 0))
        Sound("ElevatorEnter"):Play(true)
        u1:ToggleCollision("disable")
    end

    function u1.Leave(a1) -- Line: 158 -- upvalues: u1 (val), Touch (val), u80 (upval), Sound (upval)
        local EntryCFrame = u1.EntryCFrame
        local CFrame = if not u1.ExitPart then u1.ExitCFrame else u1.ExitPart.CFrame
        if not CFrame and EntryCFrame then
            local v1 = EntryCFrame.Position - Touch.Position
            v1 = Vector3.new(v1.X, 0, v1.Z)
            CFrame = if not (0 < v1.Magnitude) then EntryCFrame else EntryCFrame + v1.Unit * 4
        end
        if CFrame then
            u80:SetPrimaryPartCFrame(CFrame)
        end
        u1.EntryCFrame = nil
        Sound("ElevatorExit"):Play(true)
        u1:ToggleCollision("enable")
    end

    u1:ToggleCollision("enable")
    ;(a1:GetAttributeChangedSignal("Active")):Connect(function() -- Line: 186 -- upvalues: a1 (val), u1 (val)
        if a1:GetAttribute("Active") then
            u1:Lower()
            return
        end
        u1:Raise()
    end)
    return u1
end

local u98 = nil
local u99 = nil
local u100 = nil

local function leaveElevator(a1) -- Line: 204
    -- upvalues: u100 (ref), ClientAtoms (val), u99 (ref), Render (val), spr (val)
    if not u100 then
        return
    end
    ClientAtoms.elevatorAtom(nil)
    if a1 then
        u100:Leave()
    end
    u100:ToggleCollision("enable")
    if u99 then
        Render:Remove(u99)
        local currentCamera = workspace.currentCamera
        currentCamera.CameraType = Enum.CameraType.Custom
        currentCamera.CameraSubject = game.Players.LocalPlayer.Character
        spr.stop(currentCamera)
    end
    u100 = nil
end

local function enterElevator(a1) -- Line: 230
    -- upvalues: u100 (ref), ClientAtoms (val), u98 (ref), u99 (ref), Render (val), u80 (ref), VRService (val)
    -- upvalues: u75 (val), spr (val)
    u100 = a1
    ClientAtoms.elevatorAtom(a1.model)
    if u98 then
        u98:Disconnect()
        u98 = nil
    end
    if u99 then
        Render:Remove(u99)
    end
    local HumanoidRootPart = u80:WaitForChild("HumanoidRootPart")
    local currentCamera = workspace.currentCamera
    if a1.ViewPosition and not VRService.VREnabled then
        currentCamera.CameraType = Enum.CameraType.Custom
        local u30 = {}
        u30.value = (CFrame.new(a1.ViewPosition, a1.Center:Lerp(HumanoidRootPart.Position, 0.25))) * u75
        u99 = Render:Add(nil, nil, function() -- Line: 257
            -- upvalues: a1 (val), HumanoidRootPart (val), u75 (upval), spr (upval), u30 (val), currentCamera (val)
            local v1 = (CFrame.new(a1.ViewPosition, a1.Center:Lerp(HumanoidRootPart.Position, 0.25))) * u75
            spr.target(u30, 1, 2, {value = v1})
            currentCamera.CFrame = (CFrame.new(a1.ViewPosition)) * u30.value.Rotation
        end)
    end
    a1:Enter()
end

Elevators:onEvent("SetElevator", function(a1) -- Line: 274
    -- upvalues: u100 (ref), leaveElevator (val), ClientAtoms (val), u93 (val), enterElevator (val)
    if u100 then
        leaveElevator(true)
    end
    ClientAtoms.elevatorAtom(a1)
    local v1 = if not a1 then nil else u93[a1]
    if v1 then
        enterElevator(v1)
    end
end)
Elevators:onEvent("Error", function() -- Line: 287 -- upvalues: leaveElevator (val)
    leaveElevator(true)
end)
local u118 = nil
task.spawn(function() -- Line: 293
    -- upvalues: _createElevator (val), u118 (ref), u80 (ref), u100 (ref), Elevators (val), ViewController (val)
    -- upvalues: u93 (val), CollectionService (val)
    local function createElevator(a1) -- Line: 294
        -- upvalues: _createElevator (upval), u118 (upval), u80 (upval), u100 (upval), Elevators (upval)
        -- upvalues: ViewController (upval), u93 (upval)
        local u3 = _createElevator(a1)
        u3.Touched:Connect(function(a1) -- Line: 297
            -- upvalues: u118 (upval), u80 (upval), u100 (upval), u3 (val), Elevators (upval), ViewController (upval)
            local v1 = tick()
            if u118 and v1 - u118 < 0.2 then
                return
            end
            if a1.Name == "HumanoidRootPart" and u80 and a1.Parent == u80 and not u100 and u3:CanEnter() then
                u118 = v1
                local v2, v3 = Elevators:invokeServer("Enter", u3.model)
                if not v2 and v3 then
                    ViewController:notifyError(v3)
                end
                return
            end
        end)
        u93[a1] = u3
    end

    for i, j in CollectionService:GetTagged("Elevator") do
        task.spawn(createElevator, j)
    end
    ;(CollectionService:GetInstanceAddedSignal("Elevator")):Connect(createElevator)
end)
Elevators:onEvent("Teleport", function() -- Line: 331 -- upvalues: Players (val)
    Players.LocalPlayer:SetAttribute("Teleporting", true)
end)
local v1 = {
    leave = function() -- Line: 337 -- upvalues: Elevators (val)
        Elevators:invokeServer("Leave")
    end,
}
LocalPlayer.CharacterRemoving:Connect(v1.leave)

function v1.create(a1) -- Line: 343 -- upvalues: Elevators (val) -- types: a1: number
    Elevators:invokeServer("SetSize", a1)
end

function v1.configureStoryMission(a1, a2, a3) -- Line: 347
    -- upvalues: Elevators (val), ViewController (val)
    local v1, v2 = Elevators:invokeServer("ConfigureStoryMission", a1, a2, a3)
    if not v1 and v2 then
        ViewController:notifyError(v2)
    end
    return v1 == true
end

local u143 = Charm.atom(false)

local function getReady() -- Line: 362 -- upvalues: u143 (val)
    return u143()
end

local function setReadySignal(a1) -- Line: 366 -- upvalues: u143 (val) -- types: a1: boolean
    u143(a1)
end

local function getErrorMessage(a1) -- Line: 370
    if type(a1) == "table" and type(a1.message) == "string" then
        return a1.message
    end
    return (tostring(a1))
end

local function setReady(a1) -- Line: 378
    -- upvalues: Elevators (val), u143 (val), ViewController (val)
    local v1 = Elevators:invokeServer("SetReady", a1)
    if type(v1) == "boolean" then
        u143(v1)
        return
    end
    if v1 ~= nil then
        ViewController:notifyError(if type(v1) ~= "table" then tostring(v1) else if type(v1.message) ~= "string" then tostring(v1) else v1.message)
    end
end

function v1.selectReady() -- Line: 387 -- upvalues: getReady (val)
    return getReady()
end

function v1.getSizes() -- Line: 391 -- upvalues: Elevators (val)
    return Elevators:invokeServer("GetSizes")
end

Charm.subscribe(ClientAtoms.elevatorAtom, function() -- Line: 395 -- upvalues: u143 (val)
    u143(false)
end)

function v1.toggleReady() -- Line: 399 -- upvalues: u143 (val), Elevators (val), ViewController (val)
    local v1 = Elevators:invokeServer("SetReady", not u143())
    if type(v1) == "boolean" then
        u143(v1)
        return
    end
    if v1 ~= nil then
        ViewController:notifyError(if type(v1) ~= "table" then tostring(v1) else if type(v1.message) ~= "string" then tostring(v1) else v1.message)
    end
end

return v1