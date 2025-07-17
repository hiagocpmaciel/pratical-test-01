Premissas e Considerações
-------------------------

1.  **Período de Análise**: Os "últimos 6 meses" são calculados usando ADD\_MONTHS(SYSDATE, -6)
    
2.  **Moeda**: Os valores são exibidos com o símbolo $ mas armazenados como NUMBER
    
3.  **Agregação de Produtos**: Se um cliente comprou o mesmo produto várias vezes, as quantidades são somadas
    
4.  **Integridade dos Dados**: Restrições de chave estrangeira garantem a consistência dos dados
    
5.  **Performance**: Índices nas colunas order\_date e chaves estrangeiras melhorariam a performance em produção
    
6.  **Limitação de Saída**: DBMS\_OUTPUT tem limitações de buffer; para grandes volumes de dados, considere usar um método de saída diferente
    

Como Executar
-------------

1.  Execute schema\_creation.sql para criar as tabelas
    
2.  Execute test\_data.sql para inserir dados de exemplo
    
3.  Execute execute\_report.sql para executar ambas as versões do relatório
