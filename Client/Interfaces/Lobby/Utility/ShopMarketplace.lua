-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Utility.ShopMarketplace
-- Decompile time: 20.07 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ShopCostUtils = require(ReplicatedStorage.Shared.Modules.ShopCostUtils)
local u10 = {}

local function getProps(a1) -- Line: 9
    if type(a1) == "table" and type(a1.props) == "table" then
        return a1.props
    end
    return {}
end

local function addProduct(a1, a2, a3) -- Line: 15 -- types: a2: string
    if a3 ~= nil then
        a1[(("%*:%*"):format(a2, a3))] = {kind = a2, id = a3}
    end
end

local function visitGamepassChildren(a1, a2) -- Line: 24 -- upvalues: u10 (val) -- types: a2: function
    local children, components, v1, v2, v3, v4, v5, v6
    local v7 = nil
    local v8 = nil
    for i, j in a1 or {}, v7, v8 do
        components = j.components or {}
        v5 = nil
        v6 = nil
        for k, n in components, v5, v6 do
            if u10.isGamepassSection(n) then
                children = n.children or {}
                v2 = nil
                v3 = nil
                for m, i5 in children, v2, v3 do
                    v4 = u10.resolveGamepassId(if type(i5) ~= "table" then {} else if type(i5.props) ~= "table" then {} else i5.props, nil)
                    if v4 then
                        v1(i5, v4)
                    end
                end
            end
        end
    end
end

function u10.resolveSubscriptionId(a1) -- Line: 41
    if type(a1) ~= "table" then
        return nil
    end
    if type(a1.subscriptionId) == "string" then
        return a1.subscriptionId
    end
    if type(a1.gamepassId) == "string" then
        return a1.gamepassId
    end
    return nil
end

function u10.resolveGamepassId(a1, a2) -- Line: 53
    if type(a1) == "table" then
        if type(a1.gamepassId) == "number" then
            return a1.gamepassId
        end
        if type(a1.productId) == "number"
            and type(a1.subText) == "string"
            and a1.subText:lower():find("gamepass") ~= nil then
            return a1.productId
        end
    end
    if type(a2) == "table" and type(a2.gamepassId) == "number" then
        return a2.gamepassId
    end
    return nil
end

function u10.resolveProductGamepassId(a1, a2) -- Line: 73
    if type(a1) == "table" and type(a1.gamepassId) == "number" then
        return a1.gamepassId
    end
    if type(a2) == "table" and type(a2.gamepassId) == "number" then
        return a2.gamepassId
    end
    if type(a1) == "table"
        and type(a1.productId) == "number"
        and type(a1.subText) == "string"
        and a1.subText:lower():find("gamepass") ~= nil then
        return a1.productId
    end
    return nil
end

function u10.getProductKey(a1, a2, a3) -- Line: 94 -- upvalues: u10 (val), ShopCostUtils (val)
    local v1 = u10.resolveSubscriptionId(a1)
    if v1 then
        return (("subscription:%*"):format(v1))
    end
    local v2 = u10.resolveProductGamepassId(a1, a2)
    if v2 then
        return (("gamepass:%*"):format(v2))
    end
    if type(a1) == "table" and type(a1.productId) == "number" then
        return (("product:%*"):format(a1.productId))
    end
    local v3 = ShopCostUtils.normalizeCost(a3)
    if v3 and type(v3.id) == "number" then
        return (("product:%*"):format(v3.id))
    end
    local v4 = ShopCostUtils.getRobuxProductId(a3)
    if v4 then
        return (("product:%*"):format(v4))
    end
    return nil
end

function u10.isGamepassSection(a1) -- Line: 118
    local props_2 = if type(a1) ~= "table" then {} else if type(a1.props) ~= "table" then {} else a1.props
    local v1 = false
    if type(a1) == "table" then
        v1 = false
        if a1.type == "Section" then
            v1 = props_2.dataName == "Gamepasses"
        end
    end
    return v1
end

function u10.isGamepassForSale(a1, a2, a3) -- Line: 125 -- upvalues: u10 (val)
    local v1 = u10.resolveGamepassId(a1, a2)
    if not v1 then
        return true
    end
    local v2 = a3 and a3[("gamepass:%*"):format(v1)]
    return not v2 or v2.forSale ~= false
end

function u10.collectGamepassCandidates(a1, a2) -- Line: 135 -- upvalues: visitGamepassChildren (val)
    local u2 = {}
    visitGamepassChildren(a1, function(a1, a2_2) -- Line: 138 -- upvalues: a2 (val), u2 (val)
        local v1 = a2 and a2[("gamepass:%*"):format(a2_2)]
        if v1 and v1.forSale == false then
            return
        end
        table.insert(u2, {
            key = ("gamepass:%*"):format(a2_2),
            productId = a2_2,
            infoType = Enum.InfoType.GamePass,
            component = a1,
        })
    end)
    return u2
end

function u10.getOffsaleGamepassSignature(a1, a2) -- Line: 155 -- upvalues: visitGamepassChildren (val)
    local u2 = {}
    visitGamepassChildren(a1, function(a1, a2_2) -- Line: 158 -- upvalues: a2 (val), u2 (val)
        local v1 = a2 and a2[("gamepass:%*"):format(a2_2)]
        if v1 and v1.forSale == false then
            table.insert(u2, (tostring(a2_2)))
        end
    end)
    return table.concat(u2, "|")
end

function u10.orderGamepassCandidatesByOwnership(a1, a2, a3) -- Line: 168
    local component, ownershipItem, tower, v1, v2
    local v3 = {}
    local v4 = {}
    local v5 = nil
    local v6 = nil
    local v7, v8 = a2, a3
    for i, j in a1 or {}, v5, v6 do
        v1 = if type(j) ~= "table" then nil else if not v7 then nil else v7[j.key]
        component = if type(j) ~= "table" then nil else j.component
        ownershipItem = (if type(component) ~= "table" then {} else if type(component.props) ~= "table" then {} else component.props).ownershipItem
        tower = if type(ownershipItem) ~= "table" then nil else if ownershipItem.type ~= "tower" then nil else ownershipItem.tower or ownershipItem.name
        v2 = false
        if type(tower) == "string" then
            v2 = false
            if type(v8) == "table" then
                v2 = v8[tower] ~= nil
            end
        end
        if not v1 then
            if not v2 then
                table.insert(v3, j)
            else
                table.insert(v4, j)
            end
        elseif v1.owned == true then
            table.insert(v4, j)
        elseif not v2 then
            table.insert(v3, j)
        else
            table.insert(v4, j)
        end
    end
    for k, n in v4 do
        table.insert(v3, n)
    end
    return v3
end

function u10.applyGamepassRecommendations(a1, a2) -- Line: 206 -- upvalues: u10 (val)
    local children, components, resolveGamepassId, v1, v2, v3, v4, v5, v6, v7, v8, v9, v10
    local v11 = 1
    local v12 = {}
    local v13 = nil
    local v14 = nil
    for i, j in a1 or {}, v13, v14 do
        v10 = table.clone(j)
        v2 = {}
        components = j.components or {}
        v3 = nil
        v4 = nil
        for k, n in components, v3, v4 do
            if u10.isGamepassSection(n) then
                v5 = table.clone(n)
                v6 = {}
                children = n.children or {}
                v7 = nil
                v8 = nil
                for m, i5 in children, v7, v8 do
                    resolveGamepassId = u10.resolveGamepassId
                    if not resolveGamepassId(if type(i5) ~= "table" then {} else if type(i5.props) ~= "table" then {} else i5.props, nil) then
                        table.insert(v6, i5)
                    else
                        v9 = v1[v11]
                        v11 = v11 + 1
                        if v9 then
                            table.insert(v6, v9.component)
                        end
                    end
                end
                v5.children = v6
                v2[k] = v5
            else
                v2[k] = n
            end
        end
        v10.components = v2
        v12[i] = v10
    end
    return v12
end

function u10.collectProducts(a1, a2) -- Line: 247 -- upvalues: ShopCostUtils (val), u10 (val)
    local gamepassId, visit
    local u103 = {}

    local function addCost(a1) -- Line: 250 -- upvalues: ShopCostUtils (upval), u103 (val)
        local v1 = ShopCostUtils.normalizeCost(a1)
        if not v1 then
            return
        end
        local id = v1.id
        if id ~= nil then
            u103[(("product:%*"):format(id))] = {kind = "product", id = id}
        end
        local v2 = ShopCostUtils.getRobuxProductId(v1)
        if v2 and v1.id == nil and v2 ~= nil then
            u103[(("product:%*"):format(v2))] = {kind = "product", id = v2}
        end
    end

    function visit(a1) -- Line: 264 -- upvalues: u10 (upval), u103 (val), addCost (val), visit (val)
        local props_2 = if type(a1) ~= "table" then {} else if type(a1.props) ~= "table" then {} else a1.props
        local v1 = u10.resolveGamepassId(props_2, nil)
        if type(props_2.gamepassId) == "string" then
            local gamepassId_2 = props_2.gamepassId
            if gamepassId_2 ~= nil then
                u103[(("subscription:%*"):format(gamepassId_2))] = {kind = "subscription", id = gamepassId_2}
            end
        end
        local subscriptionId = props_2.subscriptionId
        if subscriptionId ~= nil then
            u103[(("subscription:%*"):format(subscriptionId))] = {kind = "subscription", id = subscriptionId}
        end
        if v1 ~= nil then
            u103[(("gamepass:%*"):format(v1))] = {kind = "gamepass", id = v1}
        end
        if not v1 then
            local productId = props_2.productId
            if productId ~= nil then
                u103[(("product:%*"):format(productId))] = {kind = "product", id = productId}
            end
        end
        addCost(props_2.cost)
        for i, j in props_2.costs or {} do
            addCost(j)
        end
        for k, n in a1.children or {} do
            visit(n)
        end
    end

    local v1 = nil
    local v2 = nil
    for i, j in a1 or {}, v1, v2 do
        for k, n in j.components or {} do
            visit(n)
        end
    end
    v1 = nil
    v2 = nil
    for m, i5 in a2 or {}, v1, v2 do
        gamepassId = i5.gamepassId
        if gamepassId ~= nil then
            u103[(("gamepass:%*"):format(gamepassId))] = {kind = "gamepass", id = gamepassId}
        end
        addCost(i5.cost)
        for i6, i7 in i5.costs or {} do
            addCost(i7)
        end
    end
    return u103
end

return u10