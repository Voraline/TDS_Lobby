-- Script path: ReplicatedStorage.Client.Interfaces.LegacyInterface.Components.Transition.Fade.Property
-- Decompile time: 0.98 ms

local u0 = {
    ImageLabel = {"BackgroundTransparency", "ImageTransparency"},
    TextLabel = {"BackgroundTransparency", "TextTransparency"},
    TextButton = {"BackgroundTransparency", "TextTransparency"},
    ImageButton = {"BackgroundTransparency", "ImageTransparency"},
    Frame = {"BackgroundTransparency"},
    TextBox = {"BackgroundTransparency", "TextTransparency"},
    ScrollingFrame = {"BackgroundTransparency"},
    ViewportFrame = {"BackgroundTransparency", "ImageTransparency"},
    UIStroke = {"Transparency"},
}

local function getBaseValue(a1, a2) -- Line: 45
    local v1 = "Base" .. a2
    local Attribute = a1:GetAttribute(v1)
    if Attribute == nil then
        Attribute = a1[a2]
        if Attribute ~= 1 then
            a1:SetAttribute(v1, Attribute)
        end
    end
    return Attribute
end

return function(a1, a2, a3) -- Line: 60 -- upvalues: u0 (val)
    local v1, v2, v3, v4, v5
    local v6 = u0[a1.ClassName]
    if not v6 then
        return
    end
    local v7 = a1
    for i, v in ipairs(v6) do
        v2 = "Base" .. v
        v5 = v7:GetAttribute(v2)
        if v5 == nil then
            v5 = v7[v]
            if v5 ~= 1 then
                v7:SetAttribute(v2, v5)
            end
        end
        if v5 ~= 1 then
            v2 = if not v1 then v5 else 1
            v3 = v1 and v5 or 1
            if v2 ~= v3 then
                v4(v, v2, v3)
            end
        end
    end
end