-- Script path: ReplicatedStorage.Client.Controllers.Shared.NavigationController
-- Decompile time: 2.97 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PointerArrow = require(ReplicatedStorage.Client.Modules.PointerArrow)
local TypedPromise = require(ReplicatedStorage.Shared.Modules.TypedPromise)
return {
    showDestination = function(a1) -- Line: 15
        -- upvalues: TypedPromise (val), ReplicatedStorage (val), PointerArrow (val)
        a1.ringOffset = a1.ringOffset or Vector3.new(0, 0, 0)
        a1.arrowOffset = a1.arrowOffset or Vector3.new(0, 0, 0)
        if not workspace:FindFirstChild("Trash") then
            local v1 = Instance.new("Folder")
            v1.Name = "Trash"
            v1.Parent = workspace
        end
        return TypedPromise.new(function(a1_2, a2, a3) -- Line: 26 -- upvalues: ReplicatedStorage (upval), a1 (val), PointerArrow (upval)
            local u3 = nil
            local u4 = nil
            local HighlightArea = require(ReplicatedStorage.Client.Modules.Replicators.HighlightArea)
            a3(function() -- Line: 33 -- upvalues: u3 (ref), u4 (ref), HighlightArea (val)
                if u3 then
                    u3:Destroy()
                    u3 = nil
                end
                if u4 then
                    u4:Disconnect()
                    u4 = nil
                end
                HighlightArea.clearAll()
            end)
            HighlightArea.CreateAt(a1.destination + a1.ringOffset, 5, Color3.new(), a1.arrowOffset)
            u3 = PointerArrow.new(a1.destination, a1.distance)
            local v1 = u3.Reached:Connect(function() -- Line: 55 -- upvalues: u4 (ref), u3 (ref), HighlightArea (val), a1_2 (val)
                u4:Disconnect()
                u4 = nil
                u3:Destroy()
                HighlightArea.clearAll()
                a1_2()
            end)
        end)
    end,
}