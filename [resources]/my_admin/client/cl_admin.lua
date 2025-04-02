-- Abrir menu admin
RegisterCommand('adminmenu', function()
    if not IsAdminAllowed(source, 'menu') then return end
    
    SetNuiFocus(true, true)
    SendNUIMessage({ action = 'openMenu' })
end)

-- Enviar ação para o servidor
RegisterNUICallback('adminAction', function(data, cb)
    TriggerServerEvent('admin:action', data.action, data.target)
    cb({ success = true })
end)