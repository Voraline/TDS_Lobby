-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-core@3.10.0.jest-core.jsHelpers.stripAnsi
-- Decompile time: 0.17 ms

return function(a1) -- Line: 16 -- types: a1: string
    return (string.gsub(a1, "[\027›][][()#;?%d]*[A-PRZcf-ntqry=><~]", ""))
end