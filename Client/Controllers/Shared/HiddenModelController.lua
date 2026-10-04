-- Script path: ReplicatedStorage.Client.Controllers.Shared.HiddenModelController
-- Decompile time: 1.07 ms

local CollectionService = game:GetService("CollectionService")
local v1 = {}

local function onHiddenModelAdded(a1) -- Line: 4 -- types: a1: userdata
    task.delay(0.2, function() -- Line: 5 -- upvalues: a1 (val)
        if a1.Parent == nil then
            return
        end
        a1.Parent = workspace
    end)
end

function v1.init() -- Line: 14 -- upvalues: CollectionService (val), onHiddenModelAdded (val)
    (CollectionService:GetInstanceAddedSignal("HiddenModel")):Connect(onHiddenModelAdded)
    for i, j in CollectionService:GetTagged("HiddenModel") do
        task.delay(0.2, function() -- Line: 5 -- upvalues: j (val)
            if j.Parent == nil then
                return
            end
            j.Parent = workspace
        end)
    end
end

task.spawn(v1.init)
return v1