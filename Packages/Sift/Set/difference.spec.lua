-- Script path: ReplicatedStorage.Packages.Sift.Set.difference.spec
-- Decompile time: 0.71 ms

return function() -- Line: 1
    local difference = require(script.Parent.difference)
    it("should return the difference between two sets", function() -- Line: 4 -- upvalues: difference (val)
        local v1 = difference({hello = true, world = true}, {panda = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(true)
        expect(v1.panda).to.equal(nil)
        expect(v1.cat).to.equal(nil)
    end)
    it("should accept vararg nil values", function() -- Line: 18 -- upvalues: difference (val)
        local v1 = difference({hello = true, world = true}, nil, {panda = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.panda).to.equal(nil)
    end)
    it("should accept multiple sets", function() -- Line: 29 -- upvalues: difference (val)
        local v1 = difference({hello = true, world = true}, {panda = true, cat = true}, {hello = true, panda = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.world).to.equal(true)
        expect(v1.panda).to.equal(nil)
        expect(v1.cat).to.equal(nil)
    end)
end