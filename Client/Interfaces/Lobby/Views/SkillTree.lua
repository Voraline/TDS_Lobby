-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Views.SkillTree
-- Decompile time: 5.46 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Controllers = ReplicatedStorage.Client.Interfaces.LegacyInterface.Controllers
require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.CameraPan)
local Charm = require(ReplicatedStorage.Packages.Charm)
require(ReplicatedStorage.Shared.Modules.Enum)
local EvolvedTowerUnlocksUtil = require(ReplicatedStorage.Shared.Modules.EvolvedTowerUnlocksUtil)
require(ReplicatedStorage.Client.Interfaces.Icons)
local Network = require(ReplicatedStorage.Shared.UI.Network)
local NewNetwork = require(ReplicatedStorage.Shared.Modules.NewNetwork)
local React = require(ReplicatedStorage.Shared.UI.React)
local SkillTree = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.SkillTree)
require(ReplicatedStorage.Shared.Data.Skills)
require(ReplicatedStorage.Client.Interfaces.Components.Tooltip)
local ViewController = require(Controllers.ViewController)
local WorldCursor = require(ReplicatedStorage.Client.Controllers.Lobby.SkillTreeController.WorldCursor)
local useAtom = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtom)
local useAtomBinding = require(ReplicatedStorage.Client.Interfaces.Hooks.useAtomBinding)
local useCache = require(ReplicatedStorage.Client.Interfaces.Hooks.useCache)
local useReactBindings = require(ReplicatedStorage.Client.Interfaces.Hooks.useReactBindings)
local createElement = React.createElement
local useCallback = React.useCallback
local useBinding = React.useBinding
local useEffect = React.useEffect
local useState = React.useState
local useMemo = React.useMemo
local untracked = Charm.untracked
local SkillTreeWindow = require(ReplicatedStorage.Client.Interfaces.Lobby.Components.SkillTreeWindow)
local SkillsUtil = require(ReplicatedStorage.Shared.Modules.SkillsUtil)
local TowerExpUtil = require(ReplicatedStorage.Shared.Modules.TowerExpUtil)
local Shop = Network.Channel("Shop")

local function isViewEnabled() -- Line: 39 -- upvalues: ViewController (val)
    local v1 = ViewController:getCurrentView()
    local v2 = true
    if v1 ~= "" then
        v2 = true
        if v1 ~= "Skills" then
            v2 = v1 == "TowerResearch"
        end
    end
    return v2
end

return function() -- Line: 44
    -- upvalues: useAtomBinding (val), WorldCursor (val), useAtom (val), SkillTree (val), useCache (val)
    -- upvalues: SkillsUtil (val), useMemo (val), EvolvedTowerUnlocksUtil (val), TowerExpUtil (val), useBinding (val)
    -- upvalues: useState (val), ViewController (val), useEffect (val), useReactBindings (val), untracked (val)
    -- upvalues: NewNetwork (val), Shop (val), createElement (val), SkillTreeWindow (val)
    local u66
    local v1 = useAtomBinding(WorldCursor.Atoms.SkillEnum)
    local v2 = useAtomBinding(WorldCursor.Atoms.Object)
    local u14 = useAtom(SkillTree.Atoms.Mode)
    local u19 = useAtom(SkillTree.Atoms.ResearchTower)
    local v3 = useCache("MigratedSkills.Refunds", 0)
    local v4 = useCache("Values.SkillCredits", 0)
    local u31 = useCache("MigratedSkills.Data", {})
    local u35 = useCache("TowerExp", {})
    local v5 = SkillsUtil.getRefundUpfrontCost(v3)
    local v6 = {u19}
    local v7 = useMemo(function() -- Line: 56 -- upvalues: u19 (val), EvolvedTowerUnlocksUtil (upval)
        return u19 and EvolvedTowerUnlocksUtil.getTowerDisplayName(u19) or nil
    end, v6)
    local v8 = {u19}
    local u49 = useMemo(function() -- Line: 59 -- upvalues: u19 (val), TowerExpUtil (upval)
        return u19 and TowerExpUtil.getBuyAllLevelsProductId(u19) or nil
    end, v8)
    local v9 = {u14, u19, u35, u49}
    v6 = useMemo(function() -- Line: 62 -- upvalues: u14 (val), u19 (val), u49 (val), TowerExpUtil (upval), u35 (val)
        if u14 == "Research" and u19 then
            if type(u49) == "number" and not (u49 <= 0) then
                local v1 = TowerExpUtil.getMaxLevel(u19)
                if not v1 then
                    return false
                end
                return TowerExpUtil.getLevel({TowerExp = u35}, u19) < v1
            end
            return false
        end
        return false
    end, v9)
    local v10 = {u31}
    v8 = useMemo(function() -- Line: 79 -- upvalues: SkillsUtil (upval), u31 (val)
        return SkillsUtil.getRefund(u31)
    end, v10)
    v9, u66 = useBinding(false)
    local v11, u70 = useState(function() -- Line: 83 -- upvalues: ViewController (upval)
        local v1 = ViewController:getCurrentView()
        local v2 = true
        if v1 ~= "" then
            v2 = true
            if v1 ~= "Skills" then
                v2 = v1 == "TowerResearch"
            end
        end
        return v2
    end)
    useEffect(function() -- Line: 87 -- upvalues: ViewController (upval), u70 (val)
        return (ViewController:onViewChange(function(a1) -- Line: 88 -- upvalues: u70 (upval), ViewController (upval)
            local v1 = u70
            local v2 = ViewController:getCurrentView()
            local v3 = true
            if v2 ~= "" then
                v3 = true
                if v2 ~= "Skills" then
                    v3 = v2 == "TowerResearch"
                end
            end
            v1(v3)
        end))
    end, {})
    local v12 = {v9}
    useReactBindings(function(a1) -- Line: 95 -- upvalues: WorldCursor (upval)
        if a1 then
            WorldCursor:Disable()
            return
        end
        WorldCursor:Enable()
    end, v12)
    v12 = {v9}
    useReactBindings(function(a1) -- Line: 103 -- upvalues: SkillTree (upval)
        if a1 then
            SkillTree:DeselectTile()
        end
    end, v12)
    return createElement(SkillTreeWindow, {
        Visible = v11,
        SkillData = if u14 ~= "Research" then u31 else {},
        Mode = u14,
        ResearchTower = u19,
        ResearchTowerDisplayName = v7,
        ShowResetButton = u14 ~= "Research",
        ResetWindowVisible = v9,
        exitClicked = function() -- Line: 109 -- upvalues: ViewController (upval)
            ViewController:setView("Hotbar")
        end,
        setResetWindowClosed = function() -- Line: 117 -- upvalues: u66 (val)
            u66(false)
        end,
        resetClicked = function() -- Line: 113 -- upvalues: u66 (val)
            u66(true)
        end,
        onPurchaseSkill = function() -- Line: 121 -- upvalues: untracked (upval), SkillTree (upval), NewNetwork (upval), ViewController (upval)
            local v1 = untracked(SkillTree.Atoms.SelectedTile)
            if not v1 then
                return
            end
            local HexTileFromMesh = SkillTree:GetHexTileFromMesh(v1)
            if not HexTileFromMesh then
                return
            end
            local v2, v3 = (NewNetwork.Channel("Skills")):invokeServer("Purchase", HexTileFromMesh.SkillEnum)
            if not v2 then
                ViewController:notifyError(v3)
                return
            end
            local v4 = untracked(SkillTree.Atoms.CurrentTree)
            SkillTree.Trees[v4]:RippleFromTile_Distance(HexTileFromMesh, false)
            HexTileFromMesh:PlayUnlockAnimation()
        end,
        onRefundSkills = function() -- Line: 146
            -- upvalues: NewNetwork (upval), u66 (val), untracked (upval), SkillTree (upval), ViewController (upval)
            local v1, v2 = NewNetwork.Channel("Skills"):invokeServer("Refund")
            u66(false)
            if not v1 then
                ViewController:notifyError(v2)
                return
            end
            local v3 = untracked(SkillTree.Atoms.CurrentTree)
            local v4 = SkillTree.Trees[v3]
            v4:RippleFromTile_Distance(v4:GetTileAt(0, 0), true)
        end,
        onBuyAllTowerLevels = function() -- Line: 162 -- upvalues: u19 (val), Shop (upval), ViewController (upval)
            if not u19 then
                return
            end
            local v1, v2 = Shop:InvokeServer("PromptBuyAllTowerLevels", u19)
            if not v1 then
                ViewController:notifyError(v2)
            end
        end,
        ShowBuyAllTowerLevelsButton = v6,
        BuyAllTowerLevelsProductId = u49,
        SkillEnum = v1,
        HoverObject = v2,
        SelectedTile = SkillTree.Atoms.SelectedTile,
        userSkillPoints = v4,
        refundSkillPoints = v8,
        refundCost = v5,
    })
end