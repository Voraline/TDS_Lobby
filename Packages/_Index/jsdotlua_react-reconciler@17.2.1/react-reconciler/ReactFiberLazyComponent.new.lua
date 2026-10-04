-- Script path: ReplicatedStorage.Packages._Index.jsdotlua_react-reconciler@17.2.1.react-reconciler.ReactFiberLazyComponent.new
-- Decompile time: 0.33 ms

return {
    resolveDefaultProps = function(a1, a2) -- Line: 14 -- types: a2: table
        if a1 and typeof(a1) == "table" and a1.defaultProps then
            local v1 = table.clone(a2)
            local defaultProps = a1.defaultProps
            for i, j in defaultProps do
                if v1[i] == nil then
                    v1[i] = defaultProps[i]
                end
            end
            return v1
        end
        return a2
    end,
}