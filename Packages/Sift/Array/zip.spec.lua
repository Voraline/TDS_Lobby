-- Script path: ReplicatedStorage.Packages.Sift.Array.zip.spec
-- Decompile time: 1.16 ms

return function() -- Line: 1
    local zip = require(script.Parent.zip)
    it("should zip together two arrays", function() -- Line: 4 -- upvalues: zip (val)
        local v1 = zip({1, 2, 3}, {"a", "b", "c"})
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.be.a("table")
        expect(v1[1][1]).to.equal(1)
        expect(v1[1][2]).to.equal("a")
        expect(v1[2]).to.be.a("table")
        expect(v1[2][1]).to.equal(2)
        expect(v1[2][2]).to.equal("b")
        expect(v1[3]).to.be.a("table")
        expect(v1[3][1]).to.equal(3)
        expect(v1[3][2]).to.equal("c")
    end)
    it("should not modify the original arrays", function() -- Line: 26 -- upvalues: zip (val)
        local v1 = {1, 2, 3}
        local v2 = {"a", "b", "c"}
        zip(v1, v2)
        expect(v1).to.be.a("table")
        expect(#v1).to.equal(3)
        expect(v1[1]).to.equal(1)
        expect(v1[2]).to.equal(2)
        expect(v1[3]).to.equal(3)
        expect(v2).to.be.a("table")
        expect(#v2).to.equal(3)
        expect(v2[1]).to.equal("a")
        expect(v2[2]).to.equal("b")
        expect(v2[3]).to.equal("c")
    end)
end