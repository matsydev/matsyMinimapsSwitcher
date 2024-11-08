initRadar = function()
    SetRadarZoom(1100)
end

SetTimeout(1000, function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0)  -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0)  -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 24.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
    SetMapZoomDataLevel(5, 55.0, 0.0, 0.1, 2.0, 1.0)  -- ZOOM_LEVEL_GOLF_COURSE
    SetMapZoomDataLevel(6, 450.0, 0.0, 0.1, 1.0, 1.0) -- ZOOM_LEVEL_INTERIOR
    SetMapZoomDataLevel(7, 4.5, 0.0, 0.0, 0.0, 0.0)   -- ZOOM_LEVEL_GALLERY
    SetMapZoomDataLevel(8, 11.0, 0.0, 0.0, 2.0, 3.0)  -- ZOOM_LEVEL_GALLERY_MAXIMIZE
    initRadar()
end)

AddEventHandler('esx:pauseMenuActive', initRadar)
lib.onCache('ped', initRadar)
lib.onCache('vehicle', initRadar)

Citizen.CreateThread(function()
    if not Config.Menu.Active then return end
    local openMenu = nil
    if Config.Menu.Type == 'ox_lib' then
        openMenu = function()
            local buttons = {}
            for _, data in pairs(Config.Minimaps) do
                buttons[#buttons + 1] = {
                    title = data.label,
                    image = data.previewImage and "nui://matsyMinimapsSwitcher/preview/" .. data.id .. "_preview.png" or nil,
                    blocked = GetPlayerMinimap() == data.id,
                    onSelect = function()
                        SetPlayerMinimap(data.id)
                    end
                }
            end
            lib.registerContext({
                id = 'matsyMinimapsSwitcher',
                title = Config.Locale['menu_header_label'],
                options = buttons
            })
            lib.showContext('matsyMinimapsSwitcher')
        end
    end

    RegisterCommand(Config.Menu.Command, openMenu)
    RegisterKeyMapping(Config.Menu.Command, Config.Locale['keybind_description'], 'keyboard', Config.Menu.Key)
end)