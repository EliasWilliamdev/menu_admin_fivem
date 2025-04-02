function LogAdminAction(source, action, target)
    local identifiers = GetPlayerIdentifiers(source)
    MySQL.insert([[
        INSERT INTO admin_logs 
            (admin_id, action, target)
        VALUES (?, ?, ?)
    ]], { identifiers[1], action, target })
end

-- Exemplo de uso após kick
RegisterNetEvent('admin:kick')
AddEventHandler('admin:kick', function(target)
    LogAdminAction(source, 'kick', GetPlayerIdentifiers(target)[1])
end)