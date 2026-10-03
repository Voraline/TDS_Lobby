-- Script path: ReplicatedStorage.Shared.Modules.JSONFormatter
-- Decompile time: 8.68 ms

local concat = table.concat
local sub = string.sub
local rep = string.rep
return function(a1, a2, a3, a4) -- Line: 5
    -- upvalues: sub (val), concat (val), rep (val)
    local v1, v2, v3, v4
    local v5 = a2 or "\n"
    local v6 = a3 or "\t"
    local v7 = a4 or " "
    local v8 = 1
    local v9 = 0
    local v10 = 0
    local v11 = #a1
    local v12 = {}
    local v13 = nil
    local v14 = nil
    local v15 = sub(v7, -1) == "\n"
    for i = 1, v11 do
        v1 = sub(a1, i, i)
        if v14 then
            if v14 then
                if v14 then
                    if v14 or v1 ~= ":" then
                        if v1 == "\"" and v13 ~= "\\" then end
                        if v9 ~= v10 then
                            v12[v8] = (rep(v6, v9))
                            v8 = v8 + 1
                        end
                        v12[v8] = v1
                    else
                        v12[v8] = (concat({v1, v7}))
                        if v15 then
                            v8 = v8 + 1
                            v12[v8] = (rep(v6, v9))
                        end
                    end
                elseif v1 == "," then
                    v12[v8] = (concat({v1, v5}))
                elseif v14 or v1 ~= ":" then
                    if v1 == "\"" and v13 ~= "\\" then end
                    if v9 ~= v10 then
                        v12[v8] = (rep(v6, v9))
                        v8 = v8 + 1
                    end
                    v12[v8] = v1
                else
                    v12[v8] = (concat({v1, v7}))
                    if v15 then
                        v8 = v8 + 1
                        v12[v8] = (rep(v6, v9))
                    end
                end
            elseif v1 == "}" or v1 == "]" then
                v9 = v9 - 1
                if v13 == "{" then
                    v8 = v8 - 1
                    v12[v8] = (concat({rep(v6, v9), v13, v1}))
                elseif v13 ~= "[" then
                    v2 = concat
                    v3 = {}
                    v4 = rep(v6, v9)
                    v3[1] = v5
                    v3[2] = v4
                    v3[3] = v1
                    v12[v8] = (v2(v3))
                else
                    v8 = v8 - 1
                    v12[v8] = (concat({rep(v6, v9), v13, v1}))
                end
            elseif v14 then
                if v14 or v1 ~= ":" then
                    if v1 == "\"" and v13 ~= "\\" then end
                    if v9 ~= v10 then
                        v12[v8] = (rep(v6, v9))
                        v8 = v8 + 1
                    end
                    v12[v8] = v1
                else
                    v12[v8] = (concat({v1, v7}))
                    if v15 then
                        v8 = v8 + 1
                        v12[v8] = (rep(v6, v9))
                    end
                end
            elseif v1 == "," then
                v12[v8] = (concat({v1, v5}))
            elseif v14 or v1 ~= ":" then
                if v1 == "\"" and v13 ~= "\\" then end
                if v9 ~= v10 then
                    v12[v8] = (rep(v6, v9))
                    v8 = v8 + 1
                end
                v12[v8] = v1
            else
                v12[v8] = (concat({v1, v7}))
                if v15 then
                    v8 = v8 + 1
                    v12[v8] = (rep(v6, v9))
                end
            end
        elseif v1 == "{" or v1 == "[" then
            v2 = not (v13 ~= ":") and concat({v1, v5}) or concat({rep(v6, v9), v1, v5})
            v12[v8] = v2
            v9 = v9 + 1
        elseif v14 then
            if v14 then
                if v14 or v1 ~= ":" then
                    if v1 == "\"" and v13 ~= "\\" then end
                    if v9 ~= v10 then
                        v12[v8] = (rep(v6, v9))
                        v8 = v8 + 1
                    end
                    v12[v8] = v1
                else
                    v12[v8] = (concat({v1, v7}))
                    if v15 then
                        v8 = v8 + 1
                        v12[v8] = (rep(v6, v9))
                    end
                end
            elseif v1 == "," then
                v12[v8] = (concat({v1, v5}))
            elseif v14 or v1 ~= ":" then
                if v1 == "\"" and v13 ~= "\\" then end
                if v9 ~= v10 then
                    v12[v8] = (rep(v6, v9))
                    v8 = v8 + 1
                end
                v12[v8] = v1
            else
                v12[v8] = (concat({v1, v7}))
                if v15 then
                    v8 = v8 + 1
                    v12[v8] = (rep(v6, v9))
                end
            end
        elseif v1 == "}" or v1 == "]" then
            v9 = v9 - 1
            if v13 == "{" then
                v8 = v8 - 1
                v12[v8] = (concat({rep(v6, v9), v13, v1}))
            elseif v13 ~= "[" then
                v2 = concat
                v3 = {}
                v4 = rep(v6, v9)
                v3[1] = v5
                v3[2] = v4
                v3[3] = v1
                v12[v8] = (v2(v3))
            else
                v8 = v8 - 1
                v12[v8] = (concat({rep(v6, v9), v13, v1}))
            end
        elseif v14 then
            if v14 or v1 ~= ":" then
                if v1 == "\"" and v13 ~= "\\" then end
                if v9 ~= v10 then
                    v12[v8] = (rep(v6, v9))
                    v8 = v8 + 1
                end
                v12[v8] = v1
            else
                v12[v8] = (concat({v1, v7}))
                if v15 then
                    v8 = v8 + 1
                    v12[v8] = (rep(v6, v9))
                end
            end
        elseif v1 == "," then
            v12[v8] = (concat({v1, v5}))
        elseif v14 or v1 ~= ":" then
            if v1 == "\"" and v13 ~= "\\" then end
            if v9 ~= v10 then
                v12[v8] = (rep(v6, v9))
                v8 = v8 + 1
            end
            v12[v8] = v1
        else
            v12[v8] = (concat({v1, v7}))
            if v15 then
                v8 = v8 + 1
                v12[v8] = (rep(v6, v9))
            end
        end
        v8 = v8 + 1
    end
    return concat(v12)
end