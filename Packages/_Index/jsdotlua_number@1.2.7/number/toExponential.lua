-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_number@1.2.7.number.toExponential
-- Decompile time: 0.43 ms

return function(a1, a2) -- Line: 2 -- types: a2: number?
    local v1 = a1
    if typeof(a1) == "string" then
        v1 = tonumber(a1) or (0 / 0)
    end
    if typeof(v1) ~= "number" then
        return "nan"
    end
    if a2 ~= nil then
        if typeof(a2) ~= "number" then
            error("TypeError: fractionDigits must be a number between 0 and 100")
        end
        if a2 < 0 or a2 > 100 then
            error("RangeError: fractionDigits must be between 0 and 100")
        end
    end
    return ((((string.format(if a2 ~= nil then "%." .. (tostring(a2)) .. "e" else "%e", v1)):gsub("%+0", "+")):gsub("%-0", "-")):gsub("0*e", "e"))
end