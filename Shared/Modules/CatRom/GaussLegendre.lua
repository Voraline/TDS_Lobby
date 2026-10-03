-- Script path: ReplicatedStorage.Shared.Modules.CatRom.GaussLegendre
-- Decompile time: 2.66 ms

return {
    Five = function(a1, a2, a3) -- Line: 9
        if a2 == a3 then
            return 0
        end
        local v1 = math.min(a2, a3)
        local v2 = math.max(a2, a3)
        local v3 = (v2 - v1) / 2
        local v4 = (v2 + v1) / 2
        local v5 = v3 * 0.5384693101056831
        local v6 = v3 * 0.906179845938664
        return v3 * (0.5688888888888889 * a1(v4) + 0.47862867049936647 * ((a1(v4 - v5)) + a1(v4 + v5)) + 0.23692688505618908 * ((a1(v4 - v6)) + a1(v4 + v6)))
    end,
    Ten = function(a1, a2, a3) -- Line: 31
        if a2 == a3 then
            return 0
        end
        local v1 = math.min(a2, a3)
        local v2 = math.max(a2, a3)
        local v3 = (v2 - v1) / 2
        local v4 = (v2 + v1) / 2
        local v5 = v3 * 0.14887433898163122
        local v6 = v3 * 0.4333953941292472
        local v7 = v3 * 0.6794095682990244
        local v8 = v3 * 0.8650633666889845
        local v9 = v3 * 0.9739065285171717
        return v3 * (0.29552422471475287 * ((a1(v4 - v5)) + a1(v4 + v5)) + 0.26926671930999635 * ((a1(v4 - v6)) + a1(v4 + v6)) + 0.21908636251598204 * ((a1(v4 - v7)) + a1(v4 + v7)) + 0.1494513491505806 * ((a1(v4 - v8)) + a1(v4 + v8)) + 0.06667134430868814 * ((a1(v4 - v9)) + a1(v4 + v9)))
    end,
    Twenty = function(a1, a2, a3) -- Line: 58
        if a2 == a3 then
            return 0
        end
        local v1 = math.min(a2, a3)
        local v2 = math.max(a2, a3)
        local v3 = (v2 - v1) / 2
        local v4 = (v2 + v1) / 2
        local v5 = v3 * 0.07652652113349734
        local v6 = v3 * 0.22778585114164507
        local v7 = v3 * 0.37370608871541955
        local v8 = v3 * 0.5108670019508271
        local v9 = v3 * 0.636053680726515
        local v10 = v3 * 0.74633190646015
        local v11 = v3 * 0.839116971822218
        local v12 = v3 * 0.912234428251326
        local v13 = v3 * 0.963971927277913
        local v14 = v3 * 0.9931285991850949
        return v3 * (0.15275338713072584 * ((a1(v4 - v5)) + a1(v4 + v5)) + 0.14917298647260374 * ((a1(v4 - v6)) + a1(v4 + v6)) + 0.14209610931838204 * ((a1(v4 - v7)) + a1(v4 + v7)) + 0.13168863844917664 * ((a1(v4 - v8)) + a1(v4 + v8)) + 0.11819453196151841 * ((a1(v4 - v9)) + a1(v4 + v9)) + 0.10193011981724044 * ((a1(v4 - v10)) + a1(v4 + v10)) + 0.08327674157670475 * ((a1(v4 - v11)) + a1(v4 + v11)) + 0.06267204833410907 * ((a1(v4 - v12)) + a1(v4 + v12)) + 0.0406014298003869 * ((a1(v4 - v13)) + a1(v4 + v13)) + 0.017614007139152118 * ((a1(v4 - v14)) + a1(v4 + v14)))
    end,
}