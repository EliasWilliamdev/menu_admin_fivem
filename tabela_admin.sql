-- Tabela de Administradores
CREATE TABLE IF NOT EXISTS staff (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) UNIQUE NOT NULL COMMENT 'Steam Hex ou License',
    permissions JSON NOT NULL COMMENT '{"ban": true, "kick": true, "teleport": false}',
    access_level ENUM('moderator', 'admin', 'superadmin') NOT NULL DEFAULT 'moderator',
    last_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de Banimentos
CREATE TABLE IF NOT EXISTS bans (
    ban_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    target_steam VARCHAR(50) NOT NULL,
    target_license VARCHAR(75) NOT NULL,
    target_discord VARCHAR(30),
    target_ip VARCHAR(15),
    hardware_identifier VARCHAR(100) NOT NULL,
    reason TEXT NOT NULL,
    banned_by_steam VARCHAR(50) NOT NULL,
    ban_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiration_date TIMESTAMP NULL,
    is_permanent BOOLEAN NOT NULL DEFAULT FALSE,
    ban_hash CHAR(64) NOT NULL COMMENT 'SHA2(identifiers + timestamp)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de Logs de Ações
CREATE TABLE IF NOT EXISTS action_logs (
    log_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    staff_steam VARCHAR(50) NOT NULL,
    action_type VARCHAR(30) NOT NULL COMMENT 'kick, ban, warn',
    target_steam VARCHAR(50) NOT NULL,
    details JSON NOT NULL COMMENT '{"reason": "Hacking", "weapon": "WEAPON_PISTOL"}',
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Tabela de Segurança (Anti-Evasion)
CREATE TABLE IF NOT EXISTS security_tokens (
    token_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    steam_identifier VARCHAR(50) NOT NULL,
    session_token CHAR(64) NOT NULL COMMENT 'SHA256 Hash',
    expiration TIMESTAMP NOT NULL,
    is_revoked BOOLEAN NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Índices para Performance
CREATE INDEX idx_bans_steam ON bans(target_steam);
CREATE INDEX idx_bans_hardware ON bans(hardware_identifier);
CREATE INDEX idx_logs_timestamp ON action_logs(timestamp);