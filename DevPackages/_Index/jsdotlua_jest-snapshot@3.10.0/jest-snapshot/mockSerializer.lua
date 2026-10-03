-- Script path: ReplicatedStorage.DevPackages._Index.jsdotlua_jest-snapshot@3.10.0.jest-snapshot.mockSerializer
-- Decompile time: 0.70 ms

require(script.Parent.Parent:WaitForChild("pretty-format"))
return {
    serialize = function(a1, a2, a3, a4, a5, a6) -- Line: 16 -- types: a3: string, a4: number
        local v1 = a1.getMockName()
        local v2 = if v1 ~= "jest.fn()" then " " .. v1 else ""
        local v3 = ""
        if #a1.mock.calls ~= 0 then
            local v4 = a3 .. a2.indent
            v3 = " {" .. a2.spacingOuter .. v4 .. "\"calls\": " .. a6(a1.mock.calls, a2, v4, a4, a5)
            v3 = if not a2.min then v3 .. "," else v3 .. ", "
            v3 = v3 .. a2.spacingOuter .. v4 .. "\"results\": " .. a6(a1.mock.results, a2, v4, a4, a5)
            if not a2.min then
                v3 = v3 .. ","
            end
            v3 = v3 .. a2.spacingOuter .. a3 .. "}"
        end
        return "[MockFunction" .. v2 .. "]" .. v3
    end,
    test = function(a1) -- Line: 64
        local _isMockFunction = a1
        if _isMockFunction then
            _isMockFunction = false
            if typeof(a1) == "table" then
                _isMockFunction = a1._isMockFunction
            end
        end
        return _isMockFunction
    end,
}