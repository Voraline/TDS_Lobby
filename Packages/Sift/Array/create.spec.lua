-- Script path: ReplicatedStorage.Packages.Sift.Array.create.spec
-- Decompile time: 0.34 ms

return function() -- Line: 1
    local create = require(script.Parent.create)
    it("should return an array of the given length, filled with the given value", function() -- Line: 4 -- upvalues: create (val)
        local v1 = create(3, "Hello")
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal("Hello")
        expect(v1[2]).to.equal("Hello")
        expect(v1[3]).to.equal("Hello")
    end)
end