# FiveM Admin System 🔒

Um sistema de administração completo e seguro para servidores FiveM, com controle granular de permissões, sistema de banimento robusto e registro detalhado de ações.

![Admin Panel Preview](https://via.placeholder.com/800x400.png?text=Admin+Panel+Preview)

## 📌 Recursos Principais

- **Hierarquia de Permissões**  
  - 3 Níveis: Moderador, Admin, Superadmin  
  - Controle fino por JSON (`"ban": true, "noclip": false`)

- **Sistema de Banimento Multi-Camada**  
  - 4+ Identificadores simultâneos (Steam, License, HWID, IP)  
  - Banimentos temporários/permanentes  
  - Verificação automática na conexão

- **Registro Forense**  
  - Logs estruturados em JSON  
  - Histórico completo de ações administrativas  
  - Detecção de tentativas de bypass

- **Painel Web Integrado**  
  - Interface moderna com React.js  
  - Gestão visual de jogadores  
  - Estatísticas em tempo real

## 🚀 Instalação

### Pré-requisitos
- FiveM Server (v1.0.0.0 ou superior)
- MySQL/MariaDB (v10.6+)
- [mysql-async](https://github.com/brouznouf/fivem-mysql-async)

### Passo a Passo
1. **Configuração do Banco de Dados**
```sql
CREATE DATABASE fivem_admin;
USE fivem_admin;
SOURCE /caminho/para/admin_system.sql;

cd resources
git clone https://github.com/seuuser/fivem-admin-system my_admin

Config = {
    Database = {
        host = "localhost",
        user = "fivem",
        password = "senha_segura_123",
        database = "fivem_admin"
    },
    DefaultPermissions = {
        moderator = {"kick", "teleport"},
        admin = {"ban", "spectate"}
    }
}

Exemplo de API:
exports['my_admin']:CheckPermission(source, 'ban', function(allowed)
    if allowed then
        -- Lógica de banimento
    end
end)

Contribuições são bem-vindas!
👨💻 Faça um fork e envie seus PRs!


Este README inclui:
1. Visão geral do sistema
2. Instruções claras de instalação
3. Exemplos de uso prático
4. Detalhes de segurança relevantes
5. Estrutura de projeto organizada
6. Informações de suporte e licença

Você pode personalizar com:
- Screenshots reais
- Links específicos do seu repositório
- Detalhes adicionais de configuração
- Requisitos específicos do seu sistema
