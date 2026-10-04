-- Script path: ReplicatedStorage.Packages._Index.pepeeltoro41_ui-labs@2.4.2.ui-labs.StoryCreators
-- Decompile time: 0.81 ms

local v1 = {}
require(script.Parent.Types)

local function CombineTableInfo(a1, a2) -- Line: 11
    for k, v in pairs(a2) do
        a1[k] = v
    end
    return a1
end

function v1.CreateRoactStory(a1, a2) -- Line: 18
    local v1 = {use = "roact", story = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

function v1.CreateReactStory(a1, a2) -- Line: 30
    local v1 = {use = "react", story = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

function v1.CreateFusionStory(a1, a2) -- Line: 42
    local v1 = {use = "fusion", story = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

function v1.CreateIrisStory(a1, a2) -- Line: 54
    local v1 = {use = "iris", story = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

function v1.CreateVideStory(a1, a2) -- Line: 63
    local v1 = {use = "Vide", story = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

function v1.CreateGenericStory(a1, a2) -- Line: 72
    local v1 = {render = a2}
    for k, v in pairs(a1) do
        v1[k] = v
    end
    return v1
end

return v1