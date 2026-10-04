-- Script path: ReplicatedStorage.Shared.Modules.GuiLib.Classes.Dragger
-- Decompile time: 1.37 ms

local Parent_2 = script.Parent.Parent
local LazyLoader = require(Parent_2:WaitForChild("LazyLoader"))
game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local u19 = {[Enum.UserInputType.MouseButton1] = true, [Enum.UserInputType.Touch] = true}
local u24 = {[Enum.UserInputType.MouseMovement] = true, [Enum.UserInputType.Touch] = true}
local u29 = {}
u29.__index = u29
u29.__type = "Dragger"

function u29.__tostring(a1) -- Line: 30 -- upvalues: u29 (val)
    return u29.__type
end

function u29.new(a1) -- Line: 36 -- upvalues: u29 (val), LazyLoader (val)
    local v1 = setmetatable({}, u29)
    v1._Maid = LazyLoader.Utilities.Maid.new()
    v1._DragBind = Instance.new("BindableEvent")
    v1._StartBind = Instance.new("BindableEvent")
    v1._StopBind = Instance.new("BindableEvent")
    v1.Element = a1
    v1.IsDragging = false
    v1.DragChanged = v1._DragBind.Event
    v1.DragStart = v1._StartBind.Event
    v1.DragStop = v1._StopBind.Event
    init(v1)
    return v1
end

function init(a1) -- Line: 57 -- upvalues: u19 (val), UserInputService (val), u24 (val)
    local Element = a1.Element
    local _Maid = a1._Maid
    local _DragBind = a1._DragBind
    local u5 = Vector3.new()
    _Maid:Mark(a1._DragBind)
    _Maid:Mark(a1._StartBind)
    _Maid:Mark(a1._StopBind)
    _Maid:Mark((Element.InputBegan:Connect(function(a1_2) -- Line: 67 -- upvalues: u19 (upval), u5 (ref), a1 (val)
        if u19[a1_2.UserInputType] then
            u5 = a1_2.Position
            a1.IsDragging = true
            a1._StartBind:Fire()
        end
    end)))
    _Maid:Mark((UserInputService.InputEnded:Connect(function(a1_2) -- Line: 75 -- upvalues: u19 (upval), a1 (val)
        if u19[a1_2.UserInputType] then
            a1.IsDragging = false
            a1._StopBind:Fire()
        end
    end)))
    _Maid:Mark((UserInputService.InputChanged:Connect(function(a1_2, a2) -- Line: 82 -- upvalues: a1 (val), u24 (upval), u5 (ref), _DragBind (val), Element (val)
        if a1.IsDragging and u24[a1_2.UserInputType] then
            local v1 = a1_2.Position - u5
            u5 = a1_2.Position
            _DragBind:Fire(Element, a1_2, v1)
        end
    end)))
end

function u29.Destroy(a1) -- Line: 95
    a1._Maid:Sweep()
    a1.DragChanged = nil
    a1.DragStart = nil
    a1.DragStop = nil
    a1.Element = nil
end

return u29