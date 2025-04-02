-- server.lua
local rateLimits = {}

RegisterNetEvent('admin:action', function(action, target)
    local src = source
    
    -- Rate Limiting (max 10 ações/minuto)
    rateLimits[src] = (rateLimits[src] or 0) + 1
    if rateLimits[src] > 10 then
        DropPlayer(src, 'Muitas requisições')
        return
    end
    
    -- Verificar se o alvo existe
    if not GetPlayerName(target) then
        LogCheatAttempt(src, 'Tentativa de ação em jogador inválido')
        return
    end
    
    -- Processar ação
    -- ...
end)