-- Script path: ReplicatedStorage.Assets.DevPortal.EggPortalLocal.Translations
-- Decompile time: 1.68 ms

local v1
local LocalPlayer = (game:GetService("Players")).LocalPlayer

local function getLanguageCode(a1) -- Line: 4
    local v1 = string.find(a1, "-")
    if v1 then
        return (string.sub(a1, 1, v1 - 1))
    end
    return a1
end

local v2 = {}
local upper = string.upper
local LocaleId = LocalPlayer.LocaleId
local v3 = string.find(LocaleId, "-")
local u78 = upper(if not v3 then LocaleId else string.sub(LocaleId, 1, v3 - 1))
local RawTranslations = require(script:WaitForChild("RawTranslations"))
local u80 = {}
for k, v in pairs(RawTranslations) do
    if v.Key then
        u80[v.Key] = v
    end
end
for k2, i in pairs(RawTranslations) do
    for k3, j in pairs(i) do
        if string.find(j, "{b}") then
            v1 = j:gsub("{b}", "<font transparency=\"0\">")
            i[k3] = (v1:gsub("{/b}", "</font>"))
        end
    end

    function replaceFontTags(a1) end
end

local function getTranslation(a1) -- Line: 39 -- upvalues: u80 (val), u78 (val)
    local v1 = u80[a1]
    if not v1 then
        return ""
    end
    return v1[u78] or v1.EN or ""
end

function v2.translateUI(a1) -- Line: 57 -- upvalues: u80 (val), u78 (val)
    local Attribute, v1, v2
    for k, v in pairs(a1:GetDescendants()) do
        Attribute = v:GetAttribute("HatchTranslationKey")
        if Attribute then
            v2 = u80[Attribute]
            v1 = v2 and (v2[u78] or v2.EN) or ""
            v.Text = v1
        end
    end
end

return v2