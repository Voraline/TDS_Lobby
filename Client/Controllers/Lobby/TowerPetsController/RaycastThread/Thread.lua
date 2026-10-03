-- Script path: ReplicatedStorage.Client.Controllers.Lobby.TowerPetsController.RaycastThread.Thread
-- Decompile time: 0.53 ms

local SharedTableRegistry = game:GetService("SharedTableRegistry")
script.Parent:BindToMessageParallel("Raycast", function(a1, a2, a3) -- Line: 7 -- upvalues: SharedTableRegistry (val) -- types: a1: string, a2: string, a3: userdata
    local SharedTable_2 = SharedTableRegistry:GetSharedTable(a1)
    if not SharedTable_2[a2] then
        return
    end
    local startPosition = SharedTable_2[a2].startPosition
    local direction = SharedTable_2[a2].direction
    local u19 = workspace:Raycast(startPosition, direction, a3)
    SharedTable.update(SharedTable_2, a2, function(a1) -- Line: 19 -- upvalues: u19 (val)
        a1.hitPosition = u19 and u19.Position or nil
        return a1
    end)
end)