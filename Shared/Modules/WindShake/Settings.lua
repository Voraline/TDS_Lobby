-- Script path: ReplicatedStorage.Shared.Modules.WindShake.Settings
-- Decompile time: 1.29 ms

return {
    new = function(a1) -- Line: 10 -- types: a1: userdata
        local u1 = {}
        local Attribute = a1:GetAttribute("WindPower")
        local Attribute_2 = a1:GetAttribute("WindSpeed")
        local Attribute_3 = a1:GetAttribute("WindDirection")
        local v1 = Attribute
        u1.WindPower = if typeof(v1) ~= "number" then nil else Attribute
        v1 = Attribute_2
        u1.WindSpeed = if typeof(v1) ~= "number" then nil else Attribute_2
        v1 = Attribute_3
        u1.WindDirection = if typeof(v1) ~= "Vector3" then nil else if not (0 < Attribute_3.Magnitude) then Vector3.new(0, 0, 0) else Attribute_3.Unit
        u1.PivotOffset = if not a1:IsA("BasePart") then nil else a1.PivotOffset
        u1.PivotOffsetInverse = if typeof(u1.PivotOffset) ~= "CFrame" then nil else u1.PivotOffset:Inverse()
        local u76 = (a1:GetAttributeChangedSignal("WindPower")):Connect(function() -- Line: 34 -- upvalues: Attribute (ref), a1 (val), u1 (val)
            Attribute = a1:GetAttribute("WindPower")
            u1.WindPower = if typeof(Attribute) ~= "number" then nil else Attribute
        end)
        local u88 = (a1:GetAttributeChangedSignal("WindSpeed")):Connect(function() -- Line: 41 -- upvalues: Attribute_2 (ref), a1 (val), u1 (val)
            Attribute_2 = a1:GetAttribute("WindSpeed")
            u1.WindSpeed = if typeof(Attribute_2) ~= "number" then nil else Attribute_2
        end)
        local u99 = (a1:GetAttributeChangedSignal("WindDirection")):Connect(function() -- Line: 48 -- upvalues: Attribute_3 (ref), a1 (val), u1 (val)
            Attribute_3 = a1:GetAttribute("WindDirection")
            u1.WindDirection = if typeof(Attribute_3) ~= "Vector3" then nil else if not (0 < Attribute_3.Magnitude) then Vector3.new(0, 0, 0) else Attribute_3.Unit
        end)
        local u113 = nil
        if a1:IsA("BasePart") then
            u113 = (a1:GetPropertyChangedSignal("PivotOffset")):Connect(function() -- Line: 57 -- upvalues: u1 (val), a1 (val)
                u1.PivotOffset = a1.PivotOffset
                u1.PivotOffsetInverse = u1.PivotOffset:Inverse()
            end)
        end

        function u1.Destroy(a1) -- Line: 65 -- upvalues: u76 (val), u88 (val), u99 (val), u113 (ref), u1 (val)
            u76:Disconnect()
            u88:Disconnect()
            u99:Disconnect()
            if u113 then
                u113:Disconnect()
            end
            table.clear(u1)
        end

        return u1
    end,
}