-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.ShopFocus.PreviewClasses.NametagPreview3D
-- Decompile time: 2.63 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Shared = ReplicatedStorage.Shared
local Modules = Shared.Modules
local Packages = ReplicatedStorage.Packages
local UI = Shared.UI
require(Modules.Animation)
local Maid = require(Modules.Maid)
local PreviewBase = require(script.Parent.PreviewBase)
local Promise = require(Packages.Promise)
local Sift = require(Packages.Sift)
local RichText = require(UI.Components.RichText)

local function computeStudSize(a1) -- Line: 32 -- types: a1: userdata
    local X = a1.X
    local Y = a1.Y
    if X == 0 and Y == 0 then
        return (Vector3.new(10, 0.699999988079071, 0.4000000059604645))
    end
    return (Vector3.new(X / 100, Y / 100, 0.4))
end

local u39 = setmetatable({}, PreviewBase)
u39.__index = u39

function u39.new(a1) -- Line: 45
    -- upvalues: Sift (val), PreviewBase (val), Maid (val), u39 (val)
    return (setmetatable(Sift.Dictionary.join(PreviewBase.new(a1), {maid = Maid.new(), Spawn = u39.Spawn}), u39))
end

function u39.Spawn(a1, a2, a3) -- Line: 54
    -- upvalues: Promise (val), PreviewBase (val), RunService (val)
    return Promise.new(function(a1_2, a2_2) -- Line: 59 -- upvalues: a1 (val), PreviewBase (upval), a2 (val), a3 (val), RunService (upval)
        local v1 = (a1:InitializeHumanoidModel():timeout(3)):catch(warn)
        if not v1 then
            a2_2("Failed to initialize humanoid model for NametagPreview3D")
            return
        end
        PreviewBase.TurnTowardsCamera(a1)
        local u28 = a1:CreateNametag(a2, (string.lower(a3)))
        u28.Part.Parent = workspace
        u28.Display.Parent = u28.Part
        u28.RichText.Parent = u28.Display
        local u40 = RunService.RenderStepped:Connect(function(a1) -- Line: 75 -- upvalues: u28 (val)
            u28.RichText:Step(a1)
        end)
        a1.maid:Mark(function() -- Line: 79 -- upvalues: u40 (val), u28 (val)
            u40:Disconnect()
            u28.RichText:Destroy()
            u28.Part:Destroy()
            u28.Display:Destroy()
        end)
        a1_2(v1)
    end)
end

function u39.GetNametagWorldPosition(a1) -- Line: 90
    local Head = a1.model:FindFirstChild("Head")
    if not Head then
        return nil
    end
    return Head.Position + Vector3.new(0, 1.5, 0)
end

function u39:CreateNametag(a2, a3) -- Line: 100 -- upvalues: RichText (val) -- types: a2: string, a3: string
    local Part = Instance.new("Part")
    Part.Anchored = true
    Part.Transparency = 1
    Part.CanCollide = false
    Part.CanTouch = false
    Part.CanQuery = false
    Part.Size = Vector3.new(10, 0.699999988079071, 0.4000000059604645)
    local Head = self.model:FindFirstChild("Head")
    local CurrentCamera = workspace.CurrentCamera
    if not Head then
        warn("Head not found in model, cannot position nametag")
    else
        Part.CFrame = (CFrame.new(Head.Position + Vector3.new(0, 1.5, 0))) * CurrentCamera.CFrame.Rotation
    end
    local SurfaceGui = Instance.new("SurfaceGui")
    SurfaceGui.CanvasSize = Vector2.new(300, 60)
    SurfaceGui.PixelsPerStud = 100
    SurfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
    SurfaceGui.Face = Enum.NormalId.Back
    SurfaceGui.Parent = Part
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Vector2.new(0.5, 0.5)
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.fromScale(0.5, 0.5)
    Frame.Size = UDim2.fromOffset(1200, 60)
    Frame.Parent = SurfaceGui
    return {
        Part = Part,
        Display = SurfaceGui,
        RichText = RichText({
            textScale = 1,
            textSettings = {Font = "GothamBold"},
            text = string.format("<%s>%s</%s>", a3, a2, a3),
            onSize = function(a1, a2) -- Line: 138 -- upvalues: Part (val)
                local v1 = Vector2.new(a1, a2)
                local X = v1.X
                local Y = v1.Y
                Part.Size = if X ~= 0 or Y ~= 0 then Vector3.new(X / 100, Y / 100, 0.4) else Vector3.new(10, 0.699999988079071, 0.4000000059604645)
            end,
            adornee = Part,
            Parent = Frame,
        }),
    }
end

function u39:Destroy() -- Line: 162 -- upvalues: PreviewBase (val)
    PreviewBase.Destroy(self)
    self.maid:Sweep()
end

return u39