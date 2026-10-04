-- Script path: ReplicatedStorage.Packages.Sift.Set.merge.spec
-- Decompile time: 0.55 ms

return function() -- Line: 1
    local merge = require(script.Parent.merge)
    it("should merge two sets", function() -- Line: 4 -- upvalues: merge (val)
        local v1 = merge({hello = true, world = true}, {panda = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(true)
        expect(v1.panda).to.equal(true)
        expect(v1.cat).to.equal(true)
    end)
    it("should accept nil values", function() -- Line: 18 -- upvalues: merge (val)
        local v1 = {hello = true, world = true}
        local v2 = {panda = true, cat = true}
        local v3 = merge(v1, nil, v2)
        local v4 = merge(nil, v1, v2)
        expect(v3).to.be.a("table")
        expect(v3.hello).to.equal(true)
        expect(v3.panda).to.equal(true)
        expect(v4).to.be.a("table")
        expect(v4.cat).to.equal(true)
        expect(v4.world).to.equal(true)
    end)
end