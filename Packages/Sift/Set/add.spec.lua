-- Script path: ReplicatedStorage.Packages.Sift.Set.add.spec
-- Decompile time: 0.45 ms

return function() -- Line: 1
    local add = require(script.Parent.add)
    it("should add values to a set", function() -- Line: 4 -- upvalues: add (val)
        local v1 = add({hello = true}, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(true)
    end)
    it("should not modify the original set", function() -- Line: 15 -- upvalues: add (val)
        local v1 = {hello = true}
        add(v1, "world")
        expect(v1).to.be.a("table")
        expect(v1.hello).to.equal(true)
        expect(v1.world).to.equal(nil)
    end)
end