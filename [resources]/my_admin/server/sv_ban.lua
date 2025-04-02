-- Verificar ban ao conectar
AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    deferrals.defer()
    local src = source
    local identifiers = GetPlayerIdentifiers(src)
    
    local result = MySQL.single.await([[
        SELECT reason, unban_date 
        FROM bans 
        WHERE 
            (identifier = ? OR hardware = ?)
            AND is_active = TRUE
    ]], { identifiers[1], GetTokenByType(src, 'license2') })
    
    if result then
        deferrals.done(("🚨 BANIDO\nMotivo: %s\nExpira: %s"):format(
            result.reason, 
            result.unban_date or 'PERMANENTE'
        ))
    else
        deferrals.done()
    end
end)

-- Comando /ban
RegisterCommand('ban', function(source, args)
    if not IsAdminAllowed(source, 'ban') then return end
    
    local target = tonumber(args[1])
    local duration = tonumber(args[2]) -- Dias
    local reason = table.concat(args, ' ', 3)
    
    local targetIdentifiers = GetPlayerIdentifiers(target)
    
    MySQL.insert([[
        INSERT INTO bans 
            (identifier, hardware, reason, banned_by, unban_date)
        VALUES (?, ?, ?, ?, ?)
    ]], {
        targetIdentifiers[1],
        GetTokenByType(target, 'license2'),
        reason,
        GetPlayerName(source),
        duration > 0 and os.date('%Y-%m-%d %H:%M:%S', os.time() + (duration * 86400)) or nil
    })
    
    DropPlayer(target, 'Banido: '..reason)
end)