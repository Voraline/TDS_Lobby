-- Script path: ReplicatedStorage.Shared.Modules.TowerRefundPolicy
-- Decompile time: 0.19 ms

local TutorialMatch = require(script.Parent.TutorialMatch)
return {
    shouldFullyRefund = function(a1, a2, a3, a4) -- Line: 7
        -- upvalues: TutorialMatch (val)
        return a1 or TutorialMatch(a2, a3, a4)
    end,
}