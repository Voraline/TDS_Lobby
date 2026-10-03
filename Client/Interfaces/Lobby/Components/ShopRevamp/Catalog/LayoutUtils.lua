-- Script path: ReplicatedStorage.Client.Interfaces.Lobby.Components.ShopRevamp.Catalog.LayoutUtils
-- Decompile time: 4.02 ms

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Enum = require(ReplicatedStorage.Shared.Modules.Enum)
local Troops = require(ReplicatedStorage.Shared.Modules.Asset.Handlers.Troops)
local Constants = require(script.Parent.Constants)
require(script.Parent.Types)
local u27 = {}

function u27.formatSectionId(a1) -- Line: 13 -- types: a1: string
    return a1:lower():gsub("%s+", "_")
end

function u27.getSubsectionKey(a1, a2) -- Line: 17 -- upvalues: u27 (val) -- types: a1: string, a2: string
    return (("%*:%*"):format(a1, (u27.formatSectionId(a2))))
end

function u27.getTowerCategory(a1) -- Line: 21 -- upvalues: Troops (val)
    if a1 and a1.type == "tower" then
        if a1.category then
            return a1.category
        end
        local tower = a1.tower or a1.name
        if not tower then
            return nil
        end
        local v1 = Troops(tower)
        return v1 and v1.Properties and v1.Properties.Category or nil
    end
    return nil
end

function u27.getTowerCategoryName(a1) -- Line: 39 -- upvalues: Enum (val) -- types: a1: number
    return Enum.TowerCategory.ToString(a1) or tostring(a1)
end

function u27.getTimeUntilRefresh(a1) -- Line: 43 -- upvalues: Constants (val) -- types: a1: number?
    if not a1 then
        return nil
    end
    local v1 = a1 * 60
    local ServerTimeNow = workspace:GetServerTimeNow()
    local v2 = ServerTimeNow - ServerTimeNow % Constants.SECONDS_PER_DAY
    return (math.max(0, v2 + ((math.floor((ServerTimeNow - v2) / v1)) + 1) * v1 - ServerTimeNow))
end

function u27.collectEntries(a1, a2, a3, a4) -- Line: 57
    -- upvalues: u27 (val)
    local append
    local u4 = {}
    local u6 = a4
    if not u6 then
        u6 = {}
    end

    function append(a1, a2, a3) -- Line: 66
        -- upvalues: u27 (upval), append (val), u6 (val), u4 (val)
        local props, v1, v2, v3
        local v4 = nil
        local v5 = nil
        for i, j in a1, v4, v5 do
            v3 = ("%*_%*"):format(a2, i)
            if j.type ~= "Section" or not j.children then
                u6[v2] = (u6[v2] or 0) + 1
                table.insert(u4, {dataKey = ("%*_%*"):format(v2, u6[v2]), id = v3, component = j})
            else
                props = j.props or {}
                v1 = if props.dataName then u27.formatSectionId(props.dataName or props.title) else if not props.title then v2 else u27.formatSectionId(props.dataName or props.title)
                append(j.children, v3, v1)
            end
        end
    end

    append(a1, a2, a3 or u27.formatSectionId(a2))
    return u4
end

function u27.resolveItemsPerRow(a1, a2) -- Line: 97 -- types: a2: number
    if type(a1) ~= "table" then
        return a2
    end
    local itemsPerRow = a1.itemsPerRow or a1.items or a1.cols
    if type(itemsPerRow) == "number" then
        return (math.max(1, (math.floor(itemsPerRow))))
    end
    return a2
end

function u27.resolveShopProductSize(a1, a2) -- Line: 106 -- upvalues: Enum (val), Constants (val)
    local productSize_2
    if not a1 then
        if a2 then
            productSize_2 = a2.productSize or a2.shopProductSize
            if productSize_2 ~= nil then
                return productSize_2
            end
        end
        return Constants.DEFAULT_SHOP_PRODUCT_SIZE
    end
    local props = a1.props or {}
    local productSize = props.productSize or props.shopProductSize or props.size
    if productSize ~= nil then
        return productSize
    end
    local type = a1.type
    if type ~= Enum.ShopProductSize.Card
        and type ~= Enum.ShopProductSize.Square
        and type ~= Enum.ShopProductSize.Featured_Duo
        and type ~= Enum.ShopProductSize.Featured_Thirds
        and type ~= Enum.ShopProductSize.Currency_Horizontal
        and type ~= Enum.ShopProductSize.Currency_Vertical then
        if a2 then
            productSize_2 = a2.productSize or a2.shopProductSize
            if productSize_2 ~= nil then
                return productSize_2
            end
        end
        return Constants.DEFAULT_SHOP_PRODUCT_SIZE
    end
    return type
end

function u27.resolveCollapsedRowLimit(a1) -- Line: 141
    if a1 and type(a1.collapsedRowLimit) == "number" then
        return (math.max(0, (math.floor(a1.collapsedRowLimit))))
    end
    return nil
end

function u27.resolveLayoutRowSize(a1) -- Line: 149
    if not a1 then
        return nil
    end
    if typeof(a1.rowSize) == "UDim2" then
        return a1.rowSize
    end
    if type(a1.rowHeight) == "number" then
        return (UDim2.fromScale(1, a1.rowHeight))
    end
    return nil
end

function u27.resolveRowSize(a1) -- Line: 161 -- upvalues: Constants (val)
    return Constants.ROW_SIZE_BY_PRODUCT_SIZE[a1] or Constants.ROW_SIZE_BY_PRODUCT_SIZE[Constants.DEFAULT_SHOP_PRODUCT_SIZE]
end

function u27.isRowGroup(a1) -- Line: 166
    return a1.children ~= nil
end

function u27.getEffectiveWindowSize(a1) -- Line: 170 -- upvalues: Constants (val) -- types: a1: userdata?
    if a1 and 0 < a1.X and 0 < a1.Y then
        return a1
    end
    return Constants.DEFAULT_WINDOW_SIZE
end

function u27.resolvePixelHeight(a1, a2) -- Line: 178 -- types: a1: Vector2, a2: userdata
    return (math.max(1, (math.floor(a1.Y.Scale * a2.Y + a1.Y.Offset))))
end

function u27.resolveResponsiveItemsPerRow(a1, a2, a3) -- Line: 182
    -- upvalues: Constants (val)
    return (math.clamp(math.max(
        1,
        (math.floor((math.max(1, a3.X * Constants.CONTENT_WIDTH_SCALE)) / (Constants.MIN_PRODUCT_WIDTH_BY_PRODUCT_SIZE[a2] or Constants.MIN_PRODUCT_WIDTH_BY_PRODUCT_SIZE[Constants.DEFAULT_SHOP_PRODUCT_SIZE])))
    ), 1, (math.max(1, a1))))
end

function u27.resolveResponsiveRowSize(a1, a2, a3) -- Line: 195
    -- upvalues: Constants (val)
    local v1 = math.clamp(a2 / math.max(1, a3), 1, Constants.MAX_RESPONSIVE_ROW_HEIGHT_MULTIPLIER)
    return UDim2.new(a1.X.Scale, a1.X.Offset, a1.Y.Scale * v1, a1.Y.Offset * v1)
end

return u27