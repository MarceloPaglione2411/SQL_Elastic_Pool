# SQL_Elastic_Pool

A arquitetura inclui:

Azure SQL Server: O coração da solução, gerenciando autenticação, segurança e conectividade.

Elastic Pool: Para otimizar custos e recursos, garantindo que múltiplos bancos de dados compartilhem capacidade de forma eficiente.

Dois Bancos de Dados SQL: Configurados para atender a diferentes cargas de trabalho, com escalabilidade e alta disponibilidade.

Por que isso é importante? 🤔

Infraestrutura como Código (IaC): Com o Terraform, toda a infraestrutura é versionada, replicável e fácil de manter.

Escalabilidade: O Elastic Pool permite ajustar recursos conforme a demanda, sem desperdício.

Segurança e Confiabilidade: O Azure SQL oferece backups automáticos, alta disponibilidade e criptografia de dados.


