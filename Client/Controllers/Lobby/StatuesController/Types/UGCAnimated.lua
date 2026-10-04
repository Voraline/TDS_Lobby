-- Script path: ReplicatedStorage.Client.Controllers.Lobby.StatuesController.Types.UGCAnimated
-- Decompile time: 6.76 ms

local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer
local Promise = require(ReplicatedStorage.Shared.Modules.Promise)
local u26 = {}
u26.__index = u26
local u27 = {}

local function getProductInfo(a1) -- Line: 14 -- upvalues: Promise (val), MarketplaceService (val) -- types: a1: number
    local v1, v2
    for i = 1, 3 do
        v1, v2 = Promise.new(function(a1_2) -- Line: 16 -- upvalues: MarketplaceService (upval), a1 (val)
            a1_2((MarketplaceService:GetProductInfo(a1, Enum.InfoType.Asset)))
        end):await()
        if v1 and v2 then
            return v2
        end
        task.wait(1)
    end
end

local u29 = false

local function debounce(a1) -- Line: 30 -- upvalues: u29 (ref)
    return function(...) -- Line: 31 -- upvalues: u29 (upval), a1 (val)
        if u29 then
            return
        end
        u29 = true
        local success, result = pcall(a1, ...)
        u29 = false
        return assert(success, result)
    end
end

function u26.new(a1) -- Line: 43 -- upvalues: u26 (val), u27 (val) -- types: a1: userdata
    local Item = a1:FindFirstChild("Item")
    local v1 = {
        Model = a1,
        Item = Item,
        _originalCFrame = Item:GetPivot(),
        _timePassed = (math.random(-3, 6)) * math.random(),
    }
    local u18 = setmetatable(v1, u26)
    u27[u18] = a1
    local Attribute = a1:GetAttribute("ProductId")
    if Attribute and Attribute > 0 then
        u18:_setupPrompt(Attribute)
    end
    ;(a1:GetAttributeChangedSignal("ProductId")):Connect(function() -- Line: 59 -- upvalues: a1 (val), u18 (val)
        local Attribute = a1:GetAttribute("ProductId")
        if Attribute and Attribute > 0 then
            u18:_setupPrompt(Attribute)
            return
        end
        if u18._prompt then
            u18._prompt.Enabled = false
        end
    end)
end

function u26:_setupPrompt(a2) -- Line: 69
    -- upvalues: LocalPlayer (val), MarketplaceService (val), u29 (ref), getProductInfo (val)
    local Item = self.Item or self.Model
    if not self._prompt then
        local ProximityPrompt = Instance.new("ProximityPrompt")
        ProximityPrompt.Parent = Item
        ProximityPrompt.Enabled = false
        self._prompt = ProximityPrompt
        local Triggered = ProximityPrompt.Triggered

        local function u12(a1) -- Line: 77
            -- upvalues: LocalPlayer (upval), self (val), MarketplaceService (upval)
            if a1 ~= LocalPlayer then
                return
            end
            local Attribute = self.Model:GetAttribute("ProductId")
            if Attribute and not (Attribute < 1) then
                MarketplaceService:PromptPurchase(LocalPlayer, Attribute)
                return
            end
        end

        Triggered:Connect(function(...) -- Line: 31 -- upvalues: u29 (upval), u12 (val)
            if u29 then
                return
            end
            u29 = true
            local success, result = pcall(u12, ...)
            u29 = false
            return assert(success, result)
        end)
    end
    task.spawn(function() -- Line: 91 -- upvalues: getProductInfo (upval), a2 (val), self (val)
        local v1 = getProductInfo(a2)
        if not v1 then
            return
        end
        local _prompt = self._prompt
        _prompt.Enabled = true
        _prompt.ObjectText = string.format("Buy %s", v1.Name)
        local PriceInRobux = v1.PriceInRobux
        if PriceInRobux and PriceInRobux > 0 then
            _prompt.ActionText = string.format("%d R$", PriceInRobux)
            return
        end
        _prompt.ActionText = "Off-sale"
    end)
end

function u26:Destroy() -- Line: 110 -- upvalues: u27 (val)
    u27[self] = nil
    if self._prompt then
        self._prompt:Destroy()
        self._prompt = nil
    end
end

RunService.RenderStepped:Connect(function(a1) -- Line: 119 -- upvalues: u27 (val)
    local Item
    for i in u27 do
        Item = i.Item
        i._timePassed = i._timePassed + a1
        Item:PivotTo(i._originalCFrame * CFrame.new(0, math.sin(i._timePassed) * 0.2, 0) * (CFrame.Angles(0, i._timePassed * 0.5 % 6.283185307179586, 0)))
    end
end)
return u26