-- Script path: ReplicatedStorage.Client.Interfaces.Hooks.useBosses
-- Decompile time: 1.16 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CharmUtil = require(ReplicatedStorage.Shared.Modules.CharmUtil)
local ClientAtoms = require(ReplicatedStorage.Shared.Modules.ClientAtoms)
local React = require(ReplicatedStorage.Shared.UI.React)
local useAtom = require(script.Parent.useAtom)
local useCurrentTeam = require(ReplicatedStorage.Client.Interfaces.Hooks.useCurrentTeam)
local useEffect = React.useEffect
local useState = React.useState
local useRef = React.useRef
return function() -- Line: 12
    -- upvalues: useCurrentTeam (val), useAtom (val), ClientAtoms (val), useState (val), useRef (val), useEffect (val)
    -- upvalues: CharmUtil (val)
    local u1 = useCurrentTeam()
    local v1 = useAtom(ClientAtoms.bosses)
    local v2, u9 = useState({})
    local u12 = useRef(v2)
    u12.current = v2
    local v3 = {u1, v1}
    useEffect(function() -- Line: 20 -- upvalues: CharmUtil (upval), ClientAtoms (upval), u12 (val), u1 (val), u9 (val)
        return CharmUtil.watch(ClientAtoms.enemyReplicators, function(a1) -- Line: 21 -- upvalues: u12 (upval), u1 (upval), CharmUtil (upval), u9 (upval)
            local current = u12.current
            for i, j in a1 do
                if j.Modifiers:Get("Boss") and j.Team ~= u1 then
                    current = CharmUtil.set(current, i, j)
                end
            end
            for k, n in u12.current do
                if not a1[k] then
                    current = CharmUtil.deleteKey(current, k)
                end
            end
            if current ~= u12.current then
                u9(current)
                u12.current = current
            end
        end)
    end, v3)
    return v2
end