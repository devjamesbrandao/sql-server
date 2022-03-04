**********************************Quantos registros existem na tabela do banco?********************************
execute sp_spaceused NomeDaTabela

***************************************************************************************************************

**********************************DELETAR TODOS OS DADOS DO BANCO DE DADOS**************************************	
1 - Desabilitar todas as constraints do banco de dados:
EXEC sys.sp_msforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL'

2 - Truncate em todas as tabelas do banco de dados:
EXEC sys.sp_msforeachtable 'DELETE FROM ?'

3 - Ativar de volta as constraints do banco de dados
EXEC sys.sp_MSForEachTable 'ALTER TABLE ? CHECK CONSTRAINT ALL'
*****************************************************************************************************************

*********Qual o nome de todas as tabelas do meu banco de dados? muito utilizado em SQL Injection*****************
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE='BASE TABLE'

Ou

SELECT sobjects.name
FROM sysobjects sobjects
WHERE sobjects.xtype = 'U'
******************************************************************************************************************

***********************************RETORNAR UM CAMPO QUE ACABOU DE SER INSERIDO***********************************
INSERT INTO Pessoa (Id, Nome) OUTPUT INSERTED.Id VALUES (@Id, @Nome)

******************************************************************************************************************

***********************************TRUNCAR TABELA COM CHAVE ESTRANGEIRA*******************************************
DELETE FROM Tabela DBCC CHECKIDENT ('Banco.dbo.Tabela',RESEED, 0)

******************************************************************************************************************

***********************************REMOVER LINHAS DUPLICADAS******************************************************
DELETE FROM (SELECT *, row_number() OVER (partition by id order by id) as rn FROM mytable) WHERE rn > 1
WITH CTE AS (SELECT *, row_number() OVER (partition by id order by id) as rn FROM mytable); //guarda os dados temporariamente
DELETE FROM CTE WHERE rn > 1;

*******************************************************************************************************************

**********************************ATUALIZAR QUANTIDADE ESPECÍFICA DE REGISTRO**************************************
WITH CTE AS 
( 
  SELECT TOP 100 * 
  FROM TABELA T 
  ORDER BY T.id 
) 
UPDATE CTE SET T.Name = 'foo'

********************************************************************************************************************











