-- Script path: ReplicatedStorage.Shared.UI.ItemPresentations.Towers.DJ Booth
-- Decompile time: 0.50 ms

local u0 = {"Neko"}
return {
    Init = function(a1, a2, a3) -- Line: 4 -- upvalues: u0 (val)
        if a3 then
            a2.Offset = Vector3.new(-0.25, 0, 0)
        elseif table.find(u0, a1.Name) then
            a2.Offset = Vector3.new(0, 0, 0)
        else
            local HeightOffset = a1:FindFirstChild("HeightOffset", true)
            if HeightOffset then
                HeightOffset.WorldCFrame = HeightOffset.WorldCFrame * CFrame.new(0.25, 0, 0)
            end
            a2.Offset = Vector3.new(-0.25, 0, -0.25)
        end
        if 4 < (a1:GetAttribute("Level") or 0) then
            if not a3 then
                a2.Offset = a2.Offset + Vector3.new(0, -1.2000000476837158, -3)
            else
                a2.Offset = a2.Offset + Vector3.new(0.25, -2.5, -15)
            end
        end
        a2.ShadowRadius = 1.2
    end,
}