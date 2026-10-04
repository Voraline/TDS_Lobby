-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.copyDeep.spec
-- Decompile time: 1.15 ms

return function() -- Line: 1
    local copyDeep = require(script.Parent.copyDeep)
    it("should return a copy of the given dictionary", function() -- Line: 4 -- upvalues: copyDeep (val)
        local v1 = {hello = "world"}
        local v2 = copyDeep(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.equal("world")
    end)
    it("should copy nested dictionaries", function() -- Line: 17 -- upvalues: copyDeep (val)
        local v1 = {hello = {world = "goodbye"}}
        local v2 = copyDeep(v1)
        expect(v2).to.be.a("table")
        expect(v2).never.to.equal(v1)
        expect(v2.hello).to.be.a("table")
        expect(v2.hello).never.to.equal(v1.hello)
        expect(v2.hello.world).to.equal("goodbye")
    end)
    it("should copy metatables", function() -- Line: 35 -- upvalues: copyDeep (val)
        local v1 = {
            __index = function() end,
        }
        local v2 = {hello = {}, world = {}, meta = setmetatable({}, v1)}
        local u10 = copyDeep(v2)
        expect(u10).to.be.a("table")
        expect(u10).never.to.equal(v2)
        expect(function() -- Line: 48 -- upvalues: u10 (val)
            return (getmetatable(u10[3]))
        end).to.be.a("function")
    end)
end