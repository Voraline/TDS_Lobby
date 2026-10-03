-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.UI.DialogTextRevealUtil
-- Decompile time: 0.60 ms

local v1 = {}
local u1 = nil

function v1.setPlayBlip(a1) -- Line: 16 -- upvalues: u1 (ref) -- types: a1: function?
    u1 = a1
end

function v1.splitGraphemes(a1) -- Line: 20 -- types: a1: string
    local v1 = {}
    for i, j in utf8.graphemes(a1) do
        table.insert(v1, (a1:sub(i, j)))
    end
    return v1
end

function v1.substringByGraphemes(a1, a2) -- Line: 28 -- types: a1: string, a2: number
    if a2 <= 0 then
        return ""
    end
    local v1 = utf8.offset(a1, a2 + 1)
    if v1 then
        return (string.sub(a1, 1, v1 - 1))
    end
    return a1
end

function v1.playDialogBlip(a1, a2, a3) -- Line: 41 -- upvalues: u1 (ref) -- types: a1: userdata, a2: string, a3: string?
    if u1 == nil or a2:match("^%s+$") then
        return
    end
    u1(a2, a3)
end

return (table.freeze(v1))