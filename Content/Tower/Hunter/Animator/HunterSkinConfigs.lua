-- Script path: ReplicatedStorage.Content.Tower.Hunter.Animator.HunterSkinConfigs
-- Decompile time: 0.38 ms

return {
    ["Scuba Ops"] = {
        onFire = function(a1) -- Line: 4
            a1.Model.Weapon.Gun.Harpoon_Ammo.Transparency = 1
        end,
        onInit = function(a1) -- Line: 9
            local Harpoon_Ammo = a1.Model.Weapon.Gun.Harpoon_Ammo
            Harpoon_Ammo.Transparency = 0
            a1.Maid:Mark(((a1.fireAnim.Controller:GetMarkerReachedSignal("Reload")):Connect(function() -- Line: 15 -- upvalues: Harpoon_Ammo (val)
                Harpoon_Ammo.Transparency = 0
            end)))
        end,
    },
}