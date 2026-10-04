-- Script path: ReplicatedStorage.Packages.Sift.Array.difference.spec
-- Decompile time: 0.66 ms

return function() -- Line: 1
    local difference = require(script.Parent.difference)
    it("should return the difference between two arrays", function() -- Line: 4 -- upvalues: difference (val)
        local v1 = difference({"hello", "world"}, {"cat", "dog", "hello"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(1)
        expect(table.find(v1, "world")).to.be.ok()
    end)
    it("should accept vararg nil values", function() -- Line: 16 -- upvalues: difference (val)
        local v1 = difference({"hello", "world"}, nil, {"cat", "dog", "hello"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(1)
        expect(table.find(v1, "world")).to.be.ok()
    end)
    it("should accept multiple arrays", function() -- Line: 28 -- upvalues: difference (val)
        local v1 = difference({"hello", "world"}, {"cat", "dog", "hello"}, {"hello", "panda"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(1)
        expect(table.find(v1, "world")).to.be.ok()
    end)
end