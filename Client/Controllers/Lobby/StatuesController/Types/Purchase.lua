-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.Purchase
-- Decompile time: 3.85 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local Client = ReplicatedStorage:WaitForChild("Client")
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
require(Client.Interfaces.LegacyInterface.Controllers.ViewController)
local u31 = {}
u31.__index = u31
local u33 = {
    [8] = "HatAccessory",
    [41] = "HairAccessory",
    [42] = "FaceAccessory",
    [43] = "NeckAccessory",
    [44] = "ShoulderAccessory",
    [45] = "FrontAccessory",
    [46] = "BackAccessory",
    [47] = "WaistAccessory",
}

local function createBlankDescription(a1) -- Line: 32 -- types: a1: userdata
    local LowerTorso = a1:WaitForChild("LowerTorso")
    local HumanoidDescription = Instance.new("HumanoidDescription")
    for i, v in ipairs({"HeadColor", "LeftArmColor", "LeftLegColor", "RightArmColor", "RightLegColor", "TorsoColor"}) do
        HumanoidDescription[v] = LowerTorso.Color
    end
    return HumanoidDescription
end

local function promptPurchase(a1, a2, a3) -- Line: 50
    -- upvalues: Promise (val), MarketplaceService (val), LocalPlayer (val)
    local Humanoid = a3:FindFirstChild("Humanoid")
    if not Humanoid then
        return
    end
    local AppliedDescription = Humanoid:GetAppliedDescription()
    local v1 = AppliedDescription[a2]:split(",")
    table.insert(v1, a1)
    AppliedDescription[a2] = (table.concat(v1, ","))
    local v2, v3 = Promise.new(function(a1_2) -- Line: 88 -- upvalues: MarketplaceService (upval), LocalPlayer (upval), a1 (val)
        local u1 = nil
        local v1 = MarketplaceService.PromptPurchaseFinished:Connect(function(a1_3, a2, a3) -- Line: 91 -- upvalues: LocalPlayer (upval), a1 (upval), u1 (ref), a1_2 (val)
            if a1_3 == LocalPlayer and a1 == a2 then
                u1:Disconnect()
                a1_2(a3)
            end
        end)
        MarketplaceService:PromptPurchase(LocalPlayer, a1)
    end):await()
    if v2 and v3 then
        return 2
    end
    return 3
end

local function getAccessoryInfo(a1) -- Line: 109
    -- upvalues: Promise (val), MarketplaceService (val)
    local v1, v2
    for i = 1, 3 do
        v1, v2 = Promise.new(function(a1_2) -- Line: 111 -- upvalues: MarketplaceService (upval), a1 (val)
            a1_2((MarketplaceService:GetProductInfo(a1, Enum.InfoType.Asset)))
        end):await()
        if v1 and v2 then
            return v2
        end
        task.wait(1)
    end
end

local u45 = false

local function debounce(a1) -- Line: 125 -- upvalues: u45 (ref)
    return function(...) -- Line: 126 -- upvalues: u45 (upval), a1 (val)
        if u45 then
            return
        end
        u45 = true
        local success, result = pcall(a1, ...)
        u45 = false
        return assert(success, result)
    end
end

function u31.new(a1) -- Line: 138 -- upvalues: createBlankDescription (val), u31 (val) -- types: a1: userdata
    local Character = a1:FindFirstChild("Character")
    if not Character then
        return nil
    end
    local v1 = {
        _accessory = 0,
        _model = a1,
        _character = Character,
        _description = createBlankDescription(Character),
    }
    local v2 = setmetatable(v1, u31)
    local Humanoid = v2._character:FindFirstChildOfClass("Humanoid")
    if Humanoid then
        Humanoid:Destroy()
    end
    local ProximityPrompt = Instance.new("ProximityPrompt")
    ProximityPrompt.Parent = v2._character
    local Humanoid_2 = Instance.new("Humanoid")
    Humanoid_2.Parent = v2._character
    ProximityPrompt.Enabled = false
    Humanoid_2.DisplayDistanceType = "None"
    Humanoid_2.HealthDisplayDistance = "None"
    v2._prompt = ProximityPrompt
    v2._humanoid = Humanoid_2
    v2._animator = Instance.new("Animator")
    v2._animator.Parent = Humanoid_2
    v2._animation = nil
    v2:init()
    return v2
end

function u31:Destroy() -- Line: 177
    if self._animation then
        self._animation:Destroy()
        self._animation = nil
    end
    self._animator:Destroy()
    setmetatable(self, nil)
end

function u31:init() -- Line: 187 -- upvalues: LocalPlayer (val), promptPurchase (val), u45 (ref)
    local v1 = self._model:GetAttribute("Accessory") or 0
    if not (v1 < 1) then
        self:UpdateAppearance(v1)
    end
    ;(self._model:GetAttributeChangedSignal("Accessory")):Connect(function() -- Line: 188 -- upvalues: self (val)
        local v1 = self._model:GetAttribute("Accessory") or 0
        if v1 < 1 then
            return
        end
        self:UpdateAppearance(v1)
    end)
    local Triggered = self._prompt.Triggered

    local function u26(a1) -- Line: 200
        -- upvalues: LocalPlayer (upval), self (val), promptPurchase (upval)
        if a1 ~= LocalPlayer or self._accessory < 1 or not self._accessoryType or not a1.Character then
            return
        end
        promptPurchase(self._accessory, self._accessoryType, a1.Character)
    end

    Triggered:Connect(function(...) -- Line: 126 -- upvalues: u45 (upval), u26 (val)
        if u45 then
            return
        end
        u45 = true
        local success, result = pcall(u26, ...)
        u45 = false
        return assert(success, result)
    end)
end

function u31:UpdateAppearance(a2) -- Line: 221
    -- upvalues: getAccessoryInfo (val), u33 (val)
    self._accessory = a2
    if self._thread then
        task.cancel(self._thread)
    end
    self._thread = task.spawn(function() -- Line: 228 -- upvalues: getAccessoryInfo (upval), a2 (val), self (val), u33 (upval)
        local v1 = getAccessoryInfo(a2)
        if self._accessory ~= a2 then
            return
        end
        local v2 = u33[v1.AssetTypeId or 0]
        if not v2 then
            warn((("Asset %* does not fit accessory types"):format(a2)))
            return
        end
        self._accessoryType = v2
        local _description = self._description
        _description[v2] = a2
        self._character.Humanoid:ApplyDescription(_description)
        local PriceInRobux = v1.PriceInRobux
        local _prompt = self._prompt
        _prompt.Enabled = true
        _prompt.ObjectText = string.format("Buy %s", v1.Name)
        if not PriceInRobux or not (PriceInRobux > 0) then
            _prompt.ActionText = "Off-sale"
        else
            _prompt.ActionText = string.format("%d R$", PriceInRobux)
        end
        self._thread = nil
    end)
end

return u31