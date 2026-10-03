-- Script path: ReplicatedStorage.Packages.Sift.Array.freeze.spec
-- Decompile time: 1.11 ms

return function() -- Line: 1
    local freeze = require(script.Parent.freeze)
    it("should return a read-only copy of the given array", function() -- Line: 4 -- upvalues: freeze (val)
        local v1 = {1, 2, 3}
        local u6 = freeze(v1)
        expect(u6).to.be.a("table")
        expect(u6).never.to.equal(v1)
        expect(#u6).to.equal(3)
        expect(u6[1]).to.equal(1)
        expect(u6[2]).to.equal(2)
        expect(u6[3]).to.equal(3)
        expect(function() -- Line: 17 -- upvalues: u6 (val)
            u6[1] = 4
        end).to.throw()
    end)
    it("should not freeze nested arrays", function() -- Line: 22 -- upvalues: freeze (val)
        local v1 = {1, 2, {3, 4}}
        local u8 = freeze(v1)
        expect(u8).to.be.a("table")
        expect(u8).never.to.equal(v1)
        expect(#u8).to.equal(3)
        expect(u8[1]).to.equal(1)
        expect(u8[2]).to.equal(2)
        expect(u8[3]).to.be.a("table")
        expect(u8[3]).to.equal(v1[3])
        expect(#u8[3]).to.equal(2)
        expect(u8[3][1]).to.equal(3)
        expect(u8[3][2]).to.equal(4)
        expect(function() -- Line: 40 -- upvalues: u8 (val)
            u8[1] = 4
        end).to.throw()
        expect(function() -- Line: 44 -- upvalues: u8 (val)
            u8[3][1] = 5
        end).never.to.throw()
    end)
end