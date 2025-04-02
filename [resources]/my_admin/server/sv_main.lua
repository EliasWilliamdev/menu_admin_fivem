local admins = {}

-- Carregar admins do DB ao iniciar
MySQL.ready(function()
    local results = MySQL.query.await('SELECT * FROM admins')
    for _, admin in ipairs(results) do
        admins[admin.identifier] = {
            perms = json.decode(admin.perms),
            rank = admin.rank
        }
    end
end)

-- Verificar permissões
function IsAdminAllowed(src, permission)
    local identifiers = GetPlayerIdentifiers(src)
    local steamHex = identifiers[1]
    
    return admins[steamHex] and admins[steamHex].perms[permission]
end