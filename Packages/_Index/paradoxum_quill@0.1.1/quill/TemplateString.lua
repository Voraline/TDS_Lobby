-- Script path: ReplicatedStorage.Packages._Index.paradoxum_quill@0.1.1.quill.TemplateString
-- Decompile time: 0.31 ms

return {
    format = function(a1, a2) -- Line: 9 -- types: a1: string, a2: table?
        if a1 == "" then
            return a1
        end
        return (a1:gsub("{([%a_][%w_]*)}", function(a1) -- Line: 15 -- upvalues: a2 (val)
            local v1 = a2 and a2[a1]
            if v1 == nil then
                return "{" .. a1 .. "}"
            end
            return (tostring(v1))
        end))
    end,
}