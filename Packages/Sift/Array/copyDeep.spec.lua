-- Script path: ReplicatedStorage.Packages.Sift.Array.copyDeep.spec
-- Decompile time: 0.95 ms

return function() -- Line: 1
    local copyDeep = require(script.Parent.copyDeep)
    it("should return a copy of the given array", function() -- Line: 4 -- upvalues: copyDeep (val)
        local v1 = {1, 2, 3}
        local v2 = copyDeep(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(2)
        expect(v2[3]).to.equal(3)
    end)
    it("should copy nested arrays", function() -- Line: 17 -- upvalues: copyDeep (val)
        local v1 = {1, 2, {3, 4}}
        local v2 = copyDeep(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2[1]).to.equal(1)
        expect(v2[2]).to.equal(2)
        expect(v2[3]).never.to.equal(v1[3])
    end)
    it("should copy metatables", function() -- Line: 30 -- upvalues: copyDeep (val)
        local v1 = {
            __index = function() end,
        }
        local v2 = {{1, 2, 3}, {4, 5, 6}, (setmetatable({}, v1))}
        local u17 = copyDeep(v2)
        expect(u17).to.be.a("table")
        expect(u17).never.to.equal(v2)
        expect(function() -- Line: 39 -- upvalues: u17 (val)
            return (getmetatable(u17[3]))
        end).to.be.a("function")
    end)
end