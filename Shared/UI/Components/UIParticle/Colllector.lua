-- Script path: ReplicatedStorage.Shared.UI.Components.UIParticle.Colllector
-- Decompile time: 1.80 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local u16 = require(ReplicatedStorage.Shared.Modules.Signal).new()
;(workspace:GetPropertyChangedSignal("CurrentCamera")):Connect(function() -- Line: 8 -- upvalues: u16 (val)
    if workspace.CurrentCamera then
        u16:Fire(workspace.CurrentCamera)
    end
end)

local function recomputeCollector(a1, a2) -- Line: 14 -- types: a1: userdata, a2: userdata
    local CurrentCamera = workspace.CurrentCamera
    if CurrentCamera and a2.Parent then
        local ViewportSize = CurrentCamera.ViewportSize
        local v1 = -a1.AbsolutePosition
        local v2 = UDim2.fromOffset(v1.X, v1.Y)
        local v3 = UDim2.fromOffset(ViewportSize.X, ViewportSize.Y)
        if a2.Position ~= v2 then
            a2.Position = v2
        end
        if a2.Size ~= v3 then
            a2.Size = v3
        end
        return
    end
end

return function(a1) -- Line: 34 -- upvalues: Maid (val), recomputeCollector (val), u16 (val) -- types: a1: userdata
    local Parent = a1.Parent
    if not Parent:IsA("LayerCollector") then
        assert(not Parent.AutomaticSize ~= Enum.AutomaticSize.None, "hook must have AutomaticSize set to None")
    end
    local u17 = Maid.new()
    local Frame = Instance.new("Frame")
    Frame.AnchorPoint = Vector2.new(0, 0)
    Frame.BackgroundTransparency = 1
    Frame.ZIndex = Parent.ZIndex
    local u29 = false

    local function queueRecompute() -- Line: 50
        -- upvalues: u29 (ref), recomputeCollector (upval), Parent (val), Frame (val)
        if u29 then
            return
        end
        u29 = true
        task.defer(function() -- Line: 56 -- upvalues: u29 (upval), recomputeCollector (upval), Parent (upval), Frame (upval)
            u29 = false
            recomputeCollector(Parent, Frame)
        end)
    end

    u17:Mark((u16:Connect(function() -- Line: 62 -- upvalues: u29 (ref), recomputeCollector (upval), Parent (val), Frame (val)
        if u29 then
            return
        end
        u29 = true
        task.defer(function() -- Line: 56 -- upvalues: u29 (upval), recomputeCollector (upval), Parent (upval), Frame (upval)
            u29 = false
            recomputeCollector(Parent, Frame)
        end)
    end)))
    u17:Mark(((Parent:GetPropertyChangedSignal("AbsoluteSize")):Connect(function() -- Line: 66 -- upvalues: u29 (ref), recomputeCollector (upval), Parent (val), Frame (val)
        if u29 then
            return
        end
        u29 = true
        task.defer(function() -- Line: 56 -- upvalues: u29 (upval), recomputeCollector (upval), Parent (upval), Frame (upval)
            u29 = false
            recomputeCollector(Parent, Frame)
        end)
    end)))
    u17:Mark(((Parent:GetPropertyChangedSignal("AbsolutePosition")):Connect(function() -- Line: 70 -- upvalues: u29 (ref), recomputeCollector (upval), Parent (val), Frame (val)
        if u29 then
            return
        end
        u29 = true
        task.defer(function() -- Line: 56 -- upvalues: u29 (upval), recomputeCollector (upval), Parent (upval), Frame (upval)
            u29 = false
            recomputeCollector(Parent, Frame)
        end)
    end)))
    u17:Mark((Parent.AncestryChanged:Connect(function(a1, a2) -- Line: 74 -- upvalues: u17 (val), Frame (val)
        if not a2 then
            u17:Sweep()
            Frame:Destroy()
        end
    end)))
    recomputeCollector(Parent, Frame)
    Frame.Parent = Parent
    return Frame
end