-- Script path: ReplicatedStorage.Content.Maps.Banlands.Animator.Events.SpeedBoost
-- Decompile time: 0.51 ms

local BlockArea = require(script.Parent.Parent.BlockArea)
return {
    init = function(a1) -- Line: 4 -- upvalues: BlockArea (val)
        for i, j in a1.Environment.Blocks:GetChildren() do
            local u21 = tonumber((j.Name:match("%d+")))
            if not j:GetAttribute("Active") then
                BlockArea.deactivate(a1, u21)
            end
            ;(j:GetAttributeChangedSignal("Active")):Connect(function() -- Line: 12 -- upvalues: j (val), BlockArea (upval), a1 (val), u21 (val)
                if j:GetAttribute("Active") then
                    BlockArea.activate(a1, u21)
                    return
                end
                BlockArea.deactivate(a1, u21)
            end)
        end
    end,
    run = function(a1) end,
    cleanup = function(a1) end,
}