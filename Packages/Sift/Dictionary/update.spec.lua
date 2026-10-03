-- Script path: ReplicatedStorage.Packages.Sift.Dictionary.update.spec
-- Decompile time: 0.90 ms

return function() -- Line: 1
    local update = require(script.Parent.update)
    it("should return a new dictionary with the given key updated", function() -- Line: 4 -- upvalues: update (val)
        local v1 = update({cats = 2}, "cats", function(a1) -- Line: 7
            return a1 + 1
        end)
        expect(v1).to.be.a("table")
        expect(v1.cats).to.equal(3)
    end)
    it("should not modify the original dictionary", function() -- Line: 16 -- upvalues: update (val)
        local v1 = {cats = 2}
        update(v1, "cats", function(a1) -- Line: 19
            return a1 + 1
        end)
        update(v1, "dogs", nil, function() -- Line: 23
            return 1
        end)
        expect(v1).to.be.a("table")
        expect(v1.cats).to.equal(2)
        expect(v1.dogs).to.equal(nil)
    end)
    it("should create the key if it does not exist", function() -- Line: 33 -- upvalues: update (val)
        local v1 = update({cats = 2}, "dogs", function(a1) -- Line: 36
            return a1 + 1
        end, function() -- Line: 38
            return 1
        end)
        expect(v1).to.be.a("table")
        expect(v1.cats).to.equal(2)
        expect(v1.dogs).to.equal(1)
    end)
    it("should not create a key if it doesn't exist and no callback is specified", function() -- Line: 48 -- upvalues: update (val)
        local v1 = update({cats = 2}, "dogs", function() -- Line: 51
            return 1
        end)
        expect(v1.dogs).to.equal(nil)
    end)
end