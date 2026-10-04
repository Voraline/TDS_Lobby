-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_shared@17.2.1.shared.formatProdErrorMessage
-- Decompile time: 0.28 ms

local HttpService = game:GetService("HttpService")
return function(a1, ...) -- Line: 17 -- upvalues: HttpService (val)
    local v1 = "https://reactjs.org/docs/error-decoder.html?invariant=" .. tostring(a1)
    for i = 1, (select("#", ...)) do
        v1 = v1 .. "&args[]=" .. HttpService:UrlEncode((select(i, ...)))
    end
    return string.format(
        "Minified React error #%d; visit %s for the full message or use the non-minified dev environment for full errors and additional helpful warnings.",
        a1,
        v1
    )
end