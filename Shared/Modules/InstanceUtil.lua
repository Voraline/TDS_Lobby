-- Script path: ReplicatedStorage.Shared.Modules.InstanceUtil
-- Decompile time: 4.27 ms

local function getPath(a1, a2) -- Line: 40 -- types: a1: userdata, a2: userdata
    if not a2:IsDescendantOf(a1) then
        error((("Instance %* is not a descendant of %*"):format(a2:GetFullName(), (a1:GetFullName()))))
    end
    local Parent = a2
    local v1 = {a2.Name}
    while Parent.Parent do
        if Parent.Parent == a1 then
            break
        end
        Parent = Parent.Parent
        table.insert(v1, 1, Parent.Name)
    end
    return table.concat(v1, "/")
end

return {
    clearDescendantsByType = function(a1, a2) -- Line: 1 -- types: a1: userdata, a2: table
        for i, j in a1:GetDescendants() do
            for k, n in a2 do
                if j:IsA(n) then
                    j:Destroy()
                    break
                end
            end
        end
    end,
    create = function(a1, a2) -- Line: 12 -- types: a1: string, a2: table?
        local v1 = Instance.new(a1)
        if a2 then
            for i, j in a2 do
                v1[i] = j
            end
        end
        return v1
    end,
    move = function(a1, a2, a3, a4, a5) -- Line: 61
        -- upvalues: getPath (val)
        local v1, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13
        local v14 = getPath(a2, a1)
        local v15 = a3
        for i, j in string.split(v14, "/") do
            v15 = v15:FindFirstChild(j)
            if not v15 then
                v11 = nil
                v15 = a3
                if v11 then
                    v11:Destroy()
                end
                v12 = string.split(v14, "/")
                table.remove(v12, #v12)
                v3 = nil
                v4 = nil
                v10, v1, v9, v2 = a5, a1, a4, a2
                for k, n in v12, v3, v4 do
                    v5 = v15
                    v15 = v15:FindFirstChild(n)
                    if not v15 then
                        if not v9 then
                            error((("Could not find path segment \"%*\" in asset \"%*\""):format(n, v14)))
                        else
                            v6 = table.concat(v12, "/", 1, k)
                            v8 = v2
                            for m, i5 in string.split(v6, "/") do
                                v8 = v8:FindFirstChild(i5)
                                if not v8 then
                                    assert(nil, (("Could not find original Instance for path segment \"%*\""):format(v6)))
                                    if not v7:IsA("Folder") then
                                        (v7:Clone()):ClearAllChildren()
                                    else
                                        v8 = Instance.new("Folder")
                                        v8.Name = v7.Name
                                    end
                                    v8.Parent = v5
                                    v15 = v8
                                    break
                                end
                            end
                            assert(v8, (("Could not find original Instance for path segment \"%*\""):format(v6)))
                            if not v7:IsA("Folder") then
                                (v7:Clone()):ClearAllChildren()
                            else
                                v8 = Instance.new("Folder")
                                v8.Name = v7.Name
                            end
                            v8.Parent = v5
                            v15 = v8
                        end
                    end
                end
                v13 = if v10 == false then v1 else v1:Clone()
                v13.Parent = v15
                return v13
            end
        end
        v11 = v15
        v15 = a3
        if v11 then
            v11:Destroy()
        end
        v12 = string.split(v14, "/")
        table.remove(v12, #v12)
        v3 = nil
        v4 = nil
        v10, v1, v9, v2 = a5, a1, a4, a2
        for i6, i7 in v12, v3, v4 do
            v5 = v15
            v15 = v15:FindFirstChild(i7)
            if not v15 then
                if not v9 then
                    error((("Could not find path segment \"%*\" in asset \"%*\""):format(i7, v14)))
                else
                    v6 = table.concat(v12, "/", 1, i6)
                    v8 = v2
                    for i8, i9 in string.split(v6, "/") do
                        v8 = v8:FindFirstChild(i9)
                        if not v8 then
                            assert(nil, (("Could not find original Instance for path segment \"%*\""):format(v6)))
                            if not v7:IsA("Folder") then
                                (v7:Clone()):ClearAllChildren()
                            else
                                v8 = Instance.new("Folder")
                                v8.Name = v7.Name
                            end
                            v8.Parent = v5
                            v15 = v8
                            break
                        end
                    end
                    assert(v8, (("Could not find original Instance for path segment \"%*\""):format(v6)))
                    if not v7:IsA("Folder") then
                        (v7:Clone()):ClearAllChildren()
                    else
                        v8 = Instance.new("Folder")
                        v8.Name = v7.Name
                    end
                    v8.Parent = v5
                    v15 = v8
                end
            end
        end
        v13 = if v10 == false then v1 else v1:Clone()
        v13.Parent = v15
        return v13
    end,
    resolvePath = function(a1, a2, a3) -- Line: 22 -- types: a1: userdata, a2: string, a3: boolean?
        local v1 = a1
        for i, j in string.split(a2, "/") do
            v1 = if not a3 then v1:FindFirstChild(j) else v1:WaitForChild(j)
            if not v1 then
                return nil
            end
        end
        return v1
    end,
    getPathName = function(a1) -- Line: 56 -- types: a1: string
        local v1 = string.split(a1, "/")
        return v1[#v1]
    end,
    getPath = getPath,
}