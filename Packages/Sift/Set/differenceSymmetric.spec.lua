-- Script path: ReplicatedStorage.Packages.Sift.Set.differenceSymmetric.spec
-- Decompile time: 0.75 ms

return function() -- Line: 1
    local differenceSymmetric = require(script.Parent.differenceSymmetric)
    it("should return the symmetric difference between two sets", function() -- Line: 4 -- upvalues: differenceSymmetric (val)
        local v1 = differenceSymmetric({hello = true, world = true}, {panda = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(true)
        expect(v1.panda).to.equal(true)
        expect(v1.cat).to.equal(true)
    end)
    it("should accept vararg nil values", function() -- Line: 18 -- upvalues: differenceSymmetric (val)
        local v1 = differenceSymmetric({hello = true, world = true}, nil, {panda = true, cat = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.panda).to.equal(true)
    end)
    it("should accept multiple sets", function() -- Line: 29 -- upvalues: differenceSymmetric (val)
        local v1 = differenceSymmetric({hello = true, world = true}, {panda = true, cat = true}, {hello = true, panda = true})
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(nil)
        expect(v1.world).to.equal(true)
        expect(v1.panda).to.equal(nil)
        expect(v1.cat).to.equal(true)
    end)
end