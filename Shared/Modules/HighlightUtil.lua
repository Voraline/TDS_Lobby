-- Script path: ReplicatedStorage.Shared.Modules.HighlightUtil
-- Decompile time: 1.66 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Create = require(ReplicatedStorage.Shared.Modules.Standalone.Create)
local u11 = {}

local function registerGroup(a1) -- Line: 54 -- upvalues: u11 (val), Create (val)
    assert(u11[a1.name] == nil, (("HighlightGroup with name \"%*\" already exists."):format(a1.name)))
    local v1 = Create("Model", {Name = ("Highlight:%*"):format(a1.name)})
    local v2 = Create("Highlight", {
        Name = "Highlight",
        FillColor = a1.fillColor,
        FillTransparency = a1.fillTransparency or 1,
        OutlineColor = a1.strokeColor,
        OutlineTransparency = a1.strokeTransparency or 1,
        DepthMode = a1.depthMode,
    })
    v2.Adornee = v1
    v2.Parent = v1
    u11[a1.name] = {highlight = v2, model = v1}
end

return {
    registerGroup = registerGroup,
    registerGroups = function(a1) -- Line: 80 -- upvalues: registerGroup (val) -- types: a1: table
        for i, j in a1 do
            registerGroup(j)
        end
    end,
    createHighlight = function(a1) -- Line: 37 -- upvalues: Create (val) -- types: a1: table
        return Create("Highlight", {
            Name = "Highlight",
            FillColor = a1.fillColor,
            FillTransparency = a1.fillTransparency or 1,
            OutlineColor = a1.strokeColor,
            OutlineTransparency = a1.strokeTransparency or 1,
            DepthMode = a1.depthMode,
        })
    end,
    getGroup = function(a1) -- Line: 93 -- upvalues: u11 (val) -- types: a1: string
        local v1 = u11[a1]
        local v2 = {}
        if v1 then
            for i, j in v1.model:GetChildren() do
                if not j:IsA("Highlight") then
                    table.insert(v2, j)
                end
            end
        end
        return v2
    end,
    getGroupModel = function(a1) -- Line: 115 -- upvalues: u11 (val) -- types: a1: string
        local v1 = u11[a1]
        if v1 then
            return v1.model
        end
        return nil
    end,
    highlighted = function(a1) -- Line: 131 -- upvalues: u11 (val) -- types: a1: userdata
        for k, v in pairs(u11) do
            if a1.Parent == v.model then
                return true
            end
        end
        return false
    end,
    highlight = function(a1, a2) -- Line: 149 -- upvalues: u11 (val) -- types: a1: string, a2: userdata
        assert(u11[a1], (("HighlightGroup with name \"%*\" does not exist."):format(a1)))
        local u12 = u11[a1]
        local Parent = a2.Parent
        if u12.objects[a2] then
            error((("Object \"%*\" is already highlighted in group \"%*\"."):format(a2:GetFullName(), a1)))
        end
        u12.objects[a2] = true
        u12.parents[a2] = Parent
        a2.Parent = u12.model
        if not u12.model:IsDescendantOf(workspace) then
            u12.model.Parent = workspace
        end
        return function() -- Line: 167 -- upvalues: a2 (val), u12 (val), Parent (val)
            if a2.Parent ~= u12.model then
                return
            end
            a2.Parent = Parent
            if #u12.model:GetChildren() < 2 then
                u12.model.Parent = nil
            end
        end
    end,
}