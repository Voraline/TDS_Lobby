-- Script path: ReplicatedStorage.Shared.Modules.TowerAbilityIcons
-- Decompile time: 0.47 ms

return {
    getIcon = function(a1, a2, a3) -- Line: 8 -- types: a2: string?, a3: table?
        local Icon = a3 and a3.Icon or nil
        local Name = a3 and a3.Name
        if a1 and Name then
            local Properties = a1.Properties
            local SkinData = Properties and Properties.SkinData
            local v1 = SkinData and SkinData[a2 or "Default"]
            local AbilityIcons = v1 and v1.AbilityIcons
            if not AbilityIcons then
                return Icon
            end
            local v2 = AbilityIcons[Name]
            if v2 ~= nil then
                return v2
            end
            return Icon
        end
        return Icon
    end,
}