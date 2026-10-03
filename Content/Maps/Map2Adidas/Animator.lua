-- Script path: ReplicatedStorage.Content.Maps.Map2Adidas.Animator
-- Decompile time: 1.73 ms

local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local PolicyService = game:GetService("PolicyService")
local u15 = {95916091377213, 131275641499297, 97910733748920}
local LocalPlayer = Players.LocalPlayer

local function loadAd(a1) -- Line: 14 -- types: a1: userdata
    for i, j in (a1:QueryDescendants("Decal")) do
        j:Destroy()
    end
    Instance.new("AdGui").Parent = a1
end

local function configureAds() -- Line: 24 -- upvalues: PolicyService (val), LocalPlayer (val), CollectionService (val)
    local success, result = pcall(PolicyService.GetPolicyInfoForPlayerAsync, PolicyService, LocalPlayer)
    if success and result and result.AreAdsAllowed then
        local v1 = CollectionService:GetTagged("BillboardAd")
        local v2 = nil
        local v3 = nil
        for i, j in v1, v2, v3 do
            if j:IsA("BasePart") then
                for k, n in (j:QueryDescendants("Decal")) do
                    n:Destroy()
                end
                Instance.new("AdGui").Parent = j
            end
        end
    end
end

local function setupNPC(a1, a2) -- Line: 39 -- types: a1: userdata, a2: userdata
    local AnimationController = a1:FindFirstChild("AnimationController")
    if not AnimationController then
        return
    end
    local v1 = AnimationController:LoadAnimation(a2)
    v1.Looped = true
    v1:Play()
end

return function(a1, a2) -- Line: 50 -- upvalues: u15 (val), configureAds (val)
    local Animation, v1
    local Folder = Instance.new("Folder")
    Folder.Name = "Animations"
    Folder.Parent = a1
    local v2 = {}
    for i, j in u15 do
        v1 = Content.fromAssetId(j)
        if v1 then
            Animation = Instance.new("Animation")
            Animation.Name = "Cheer" .. tostring(i)
            Animation.AnimationId = v1.Uri
            Animation.Parent = Folder
            table.insert(v2, Animation)
        end
    end
    local Environment = a1:FindFirstChild("Environment")
    if Environment then
        local NPCs = Environment:FindFirstChild("NPCs")
        if NPCs then
            local AnimationController, v3, v4
            for k, n in NPCs:GetChildren() do
                if n:IsA("Model") then
                    v3 = v2[n:GetAttribute("Pose") or 1]
                    if v3 then
                        AnimationController = n:FindFirstChild("AnimationController")
                        if AnimationController then
                            v4 = AnimationController:LoadAnimation(v3)
                            v4.Looped = true
                            v4:Play()
                        end
                    end
                end
            end
        end
    end
    configureAds()
end