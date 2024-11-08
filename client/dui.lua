GetPlayerMinimap = function()
    return GetResourceKvpString('matsyMinimapsSwitcher') or 'default'
end

SetTimeout(5000, function()
    SetPlayerMinimap(GetPlayerMinimap())
end)

local minimapTexture = {
    "minimap_0_0",
    "minimap_0_1",
    "minimap_1_0",
    "minimap_1_1",
    "minimap_2_0",
    "minimap_2_1",
    "minimap_lod_128",
    "minimap_sea_0_0",
    "minimap_sea_0_1",
    "minimap_sea_1_0",
    "minimap_sea_1_1",
    "minimap_sea_2_0",
    "minimap_sea_2_1"
}

SetPlayerMinimap = function(id)
    if type(id) ~= "string" then
        return error('The "id" value is not defined in the "SetPlayerMinimap" function.')
    end
    SetResourceKvp('matsyMinimapsSwitcher', id)

    local radarEnabled = IsRadarEnabled()
    if radarEnabled then
        DisplayRadar(false)
    end

    for _, texture in pairs(minimapTexture) do
        SetStreamedTextureDictAsNoLongerNeeded(texture)
        RemoveReplaceTexture(texture, texture)
        if id ~= 'default' then
            local idTxd = (id and id .. '_' or '') .. texture
            RequestStreamedTextureDict(idTxd, false)
            repeat Wait(0) until HasStreamedTextureDictLoaded(idTxd)
            AddReplaceTexture(texture, texture, idTxd, texture)
            SetStreamedTextureDictAsNoLongerNeeded(idTxd)
            RequestStreamedTextureDict(texture, false)
        end
    end

    Wait(100)
    initRadar()

    if radarEnabled then
        DisplayRadar(true)
    end
end