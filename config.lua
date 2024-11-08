Config = {}

Config.SavePlayerMinimap = true -- ⚠️ Don't change this if you don't know what you're doing

Config.Menu = {
    Active = true,
    Type = 'ox_lib', -- ox_lib: OX Context or RageUI: Classic GTA Online Menu
    UseKeybind = true,
    Key = 'EQUALS', -- 🔑 Key: "=" ! Set this only if Config.Menu.UseKeybind is true! (https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/)
    Command = '-matsyMinimapsSwitcher'
}

Config.Minimaps = {
    {
        id = 'default', -- ⚠️ Don't touch !
        label = 'Classic (Default)',
        previewImage = true
    },
    {
        id = 'atlas',
        label = 'Atlas (Colored)',
        previewImage = true
    },
    {
        id = '3dnight',
        label = 'Nuit (3d)',
        previewImage = true
    }
}

Config.Locale = {
    ['menu_header_label'] = 'Minimap Switcher',
    ['keybind_description'] = 'Minimap Switcher Menu'
}