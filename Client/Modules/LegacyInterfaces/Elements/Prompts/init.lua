-- Script path: ReplicatedStorage.Client.Modules.LegacyInterfaces.Elements.Prompts
-- Decompile time: 0.91 ms

local u0 = {}

function u0.init() -- Line: 3 -- upvalues: u0 (val)
    if workspace.Type.Value == "Game" then
        return
    end
    local Primary = (require(game.ReplicatedStorage.Client.Modules.PlayerGui)).Primary
    u0.Rejoin = (require(script:WaitForChild("Containers"))).new((Primary:WaitForChild("Prompt"):WaitForChild("Containers")):WaitForChild("Rejoin"))
end

task.spawn(u0.init)
return u0