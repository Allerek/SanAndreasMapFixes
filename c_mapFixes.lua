--TypeFile name, Object id, LOD ID, Is enabled?, position, useAlpha
losSantos = {
    {"road_lawn11", 5750, 5902, true, {1350.1563, -1250.8359, 14.1328}, false},
}

addEventHandler("onClientResourceStart", resourceRoot, function()
    for i,v in pairs(losSantos) do
        if(v[5]) then --Is enabled?
            local fileName = "LosSantos/"..v[1]
            if(fileExists(fileName..".col")) then
                local col = engineLoadCOL(fileName..".col")
                engineReplaceCOL(col, v[2])
            end
            if(fileExists(fileName..".txd")) then
                local txd = engineLoadTXD(fileName..".txd")
                engineImportTXD(txd, v[2])
            end
            if(fileExists(fileName..".dff")) then
                local dff = engineLoadDFF(fileName..".dff")
                engineReplaceModel(dff, v[2])
            end
            local x,y,z = v[5][1],v[5][2],v[5][3]
            removeWorldModel(v[2], 10, x, y, z)--Remove object
            removeWorldModel(v[3], 10, x, y, z)--Remove LOD
            local obj = createObject(v[2], x, y, z)--Recreate object
            local LOD = createObject(v[2], x, y, z)--Recreate LOD
            setLowLODElement(obj, LOD)
        end
    end
end)

--1647.3906, 933.1797, 8.2578