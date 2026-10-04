-- Script path: ReplicatedStorage.Content.NewEnemies.PngBot.Animator
-- Decompile time: 0.40 ms

local v1 = {}
v1.__index = v1

function v1.Initialize(a1) -- Line: 8
    a1.Name = "Png Bot"
    local v1 = {
        "11914981726",
        "5009915795",
        "7979312702",
        "14221072660",
        "13575694232",
        "13704910295",
        "16028163473",
        "16911190427",
        "16911190087",
        "16973483692",
        "16911356389",
        "16973983836",
    }
    local Head = a1.Model:WaitForChild("Head")
    local face1 = Head:WaitForChild("face1")
    local face2 = Head:WaitForChild("face2")
    local v2 = (Random.new()):NextInteger(1, #v1)
    face1.Texture = "rbxassetid://" .. v1[v2]
    face2.Texture = "rbxassetid://" .. v1[v2]
end

return v1