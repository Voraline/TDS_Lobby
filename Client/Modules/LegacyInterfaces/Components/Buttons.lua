-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Buttons
-- Decompile time: 3.68 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local math = require(ReplicatedStorage.Shared.Modules.Utils.math)
require(ReplicatedStorage.Shared.Modules.Utils.table)
game:GetService("TweenService")
local Hover = require(ReplicatedStorage.Client.Modules.LegacyInterfaces.Components.Hover)
require(ReplicatedStorage.Shared.Modules.Render)
local Maid = require(ReplicatedStorage.Shared.Modules.Maid)
local Signal = require(ReplicatedStorage.Shared.Modules.Signal)
local u44 = {}
local u45 = nil
local u46 = nil
local v1 = {
    __call = function(a1, a2) -- Line: 19
        return a1.new(a2)
    end,
}
local u51 = setmetatable({}, v1)
u51.__index = u51

local function propertyExists(a1, a2) -- Line: 27
    return pcall(function() -- Line: 28 -- upvalues: a1 (val), a2 (val)
        return a1[a2]
    end)
end

function u51.init(a1, ...) -- Line: 33 -- upvalues: u45 (ref), u46 (ref)
    local v1, v2 = ...
    u45 = v1
    u46 = v2
end

function u51.new(a1) -- Line: 39 -- upvalues: Maid (val), Hover (val), Signal (val), u51 (val), u44 (val)
    local v1 = Maid.new()
    local v2, v3 = Hover.new(a1)
    local v4 = {
        instance = a1,
        maid = v1,
        signals = {
            clicked = Signal.new(),
            mouse_up = Signal.new(),
            mouse_down = Signal.new(),
            mouse_enter = Signal.new(),
            mouse_exit = Signal.new(),
        },
    }
    local u28 = setmetatable(v4, u51)

    function u28:Exit() -- Line: 58 -- upvalues: u44 (upval)
        if u44[self.instance] ~= nil then
            u44[self.instance] = nil
        end
        self.maid:Sweep()
    end

    function u28:IsHovering() -- Line: 66
        return self.Hovering
    end

    function u28:IsMouseDown() -- Line: 70
        return self.MouseDown
    end

    a1.MouseButton1Down:Connect(function(...) -- Line: 75 -- upvalues: u28 (val)
        u28.signals.mouse_down:Fire(...)
    end)
    a1.MouseButton1Up:Connect(function(...) -- Line: 79 -- upvalues: u28 (val)
        u28.signals.mouse_up:Fire(...)
    end)
    a1.MouseButton1Click:Connect(function(...) -- Line: 83 -- upvalues: u28 (val)
        u28.signals.clicked:Fire(...)
    end)
    v2:Connect(function(...) -- Line: 87 -- upvalues: u28 (val)
        u28.signals.mouse_enter:Fire(...)
    end)
    v3:Connect(function(...) -- Line: 91 -- upvalues: u28 (val)
        u28.signals.mouse_exit:Fire(...)
    end)
    a1.AncestryChanged:Connect(function() -- Line: 96 -- upvalues: u28 (val)
        u28:Exit()
    end)
    return u28
end

function u51.Default(a1, a2) -- Line: 104 -- upvalues: u44 (val), math (val)
    return function(a1_2) -- Line: 107 -- upvalues: a1 (val), a2 (val), u44 (upval), math (upval)
        local v1
        local u1 = 1
        local u2 = 1
        local u4 = a1_2.MultiplierSpeed or 8
        local u6 = a1_2.SizeMultiplyHover or 1.15
        local u7 = {}
        local v2 = next
        local Descendants, Descendants_2 = a1.instance:GetDescendants()
        for k, v in v2, Descendants, Descendants_2 do
            v1 = pcall
            local u113 = "Size"
            if v1(function() -- Line: 28 -- upvalues: v (val), u113 (val)
                    return v[u113]
                end)
                and v.Size then
                u7[v.Name] = v.Size
            end
        end
        u7[a1.instance.Name] = a1.instance.Size
        if a2 then
            a1.maid:Mark((a1.signals.clicked:Connect(a2)))
        end
        a1.maid:Mark((a1.signals.mouse_enter:Connect(function() -- Line: 126 -- upvalues: a1 (upval), u2 (ref), u6 (val)
            if not a1:IsMouseDown() then
                u2 = u6
            end
            a1.Hovering = true
        end)))
        a1.maid:Mark((a1.signals.mouse_exit:Connect(function() -- Line: 134 -- upvalues: u2 (ref), a1 (upval)
            u2 = 1
            a1.Hovering = false
        end)))
        a1.maid:Mark((a1.signals.mouse_down:Connect(function() -- Line: 139 -- upvalues: u2 (ref), u6 (val), a1_2 (val), a1 (upval)
            u2 = u6 + (a1_2.SizeAddDown or 0.05)
            a1.MouseDown = true
        end)))
        a1.maid:Mark((a1.signals.mouse_up:Connect(function() -- Line: 144 -- upvalues: a1 (upval), u2 (ref), u6 (val)
            u2 = if not a1:IsHovering() then 1 else u6
            a1.MouseDown = false
        end)))

        u44[a1.instance] = function(a1_2) -- Line: 166 -- upvalues: math (upval), u4 (val), u1 (ref), u2 (ref), u7 (val), a1 (upval)
            local new_2, v1, v2, v3, v4
            local v5 = math.min(a1_2 * u4, 1)
            u1 = math.lerp(u1, u2, v5)
            local v6 = u7[a1.instance.Name]
            a1.instance.Size = UDim2.new(v6.X.Scale * u1, v6.X.Offset * u1, v6.Y.Scale * u1, v6.Y.Offset * u1)
            for k, v in pairs(a1.instance:GetDescendants()) do
                if u7[v.Name] then
                    v4 = u7[v.Name]
                    new_2 = UDim2.new
                    v1 = v4.X.Scale * u1
                    v2 = v4.X.Offset * u1
                    v3 = v4.Y.Scale * u1
                    v.Size = new_2(v1, v2, v3, v4.Y.Offset * u1)
                end
            end
        end

        return a1
    end
end

function u51.Update(a1) -- Line: 200 -- upvalues: u44 (val)
    for k, v in pairs(u44) do
        v(a1)
    end
end

return u51