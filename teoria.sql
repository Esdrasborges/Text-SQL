SELECT = Seleciona uma coluna ou mais de uma tabela

SELECT colula1, coluna2
FROM tabela

SELECT * = retorna todos as colunas do bd
FROM tabela

SELECT DISTINCT = Usado quando queremos omitir um dado duplicado, retornado apenas dados ulnicos
SELECT DISTINTIC coluna1, coluna2
FROM tabela

WHERE Seleciona e filtra qualquer opão da tabela
operadores 

*   : IGUAL
>   : MAIOR QUE
<   : MENOR QUE
>=  : MAIOR QUE OU IGUAL
<=  : MENOR QUE OU IGUAL
<>  : DIFERENTE DE 
AND : OPERADOR LOGICO
OR  : OPERADOR LOGICO OU

SELECT colula1, coluna2
FROM tabela
WHERE condicao

exemplos
SELECT *
FROM person.person
WHERE LastName = 'miller' and FirstName = 'Anna'

SELECT * 
FROM production.Product
WHERE color = 'Blue' or color = 'Black'

DESAFIO 
Usuario chamado Peter Krebs esta devendo um pagamento, consiga o email dele para que possamos enviar uma cobrança

SELECT * 
FROM Person.person
WHERE FirstName = 'peter' and LastName = 'Krebs'

COUNT = Permite contar o numeros de linhas numa determinada tabela

SELECT COUNT ("NOME_COLUNA")
FROM NOME_TABELA

SELECT COUNT (titlo)
FROM person.person

DESAFIO 
Quantos produtos temos cadastrado e, nosssa tabela de produtos

SELECT COUNT(*)
FROM production.product

SELECT TOP = limita a quantidade de dados que é retornado de ums SELECT
SELECT TOP 10 *
FROM tabela

ORDER BY = Vale para listar uma ordem em particular ascendente ou descendente ou em base de valor numerico ou valor de texto 
SELECT "nome_coluna"
FROM "nome_tabela"
[WHERE "condicao"]
ORDER BY "nome_coluna"[ASC,DESC];
 
OUTRA FORMA
SELECT coluna1, coluna2
FROM tabela
ORDER BY coluna1 asc/desc

É possível ordenar por mais do que uma coluna. Nesse caso, a cláusula ORDER BY acima torna-se
ORDER BY "nome_coluna1" [ASC, DESC], "nome_coluna2" [ASC, DESC]

JUNÇÃO DA TABELA TOP + ORDER BY
SELECT TOP 10 ProductId
FROM Production.Product
ORDER BY ListPrice desc

* BETWEEN = É usado para encontrar valor entre um valor minimo e valor maximo

valor BETWEEN minimo AND maximo

SELECT * 
FROM Production.Product
WHERE ListPrice NOT between 1000 and 1500

SELECT * 
FROM HumanResources.Employee
WHERE HireDate between '2009/01/01' and '2010/01/01'

* IN = Usado junto com o WHERE, para verificar se um  valor correspondem com qualquer valor passado na lista de valores
SELECT "nome_coluna"
FROM "nome_tabela"
WHERE "nome_coluna" IN ('valor1', 'valor2', ...);

SELECT * 
FROM Person.Person
WHERE BusinessEntityID IN (2,7,13)

* LIKE = Usado para encontra o nome de alguem sabendo apenas parte dele
SELECT * 
FROM person.person
WHERE FirstName like 'ovi%'

FUNÇÕES DE AGREGAÇÃO, AGREGAM OU COMBINAM DADOS DE UMA TABELA EM 1 RESULTADO SÓ 
MIM MAX SUM AVG

* GROUP BY = Divide o resuçtado da pesquisa em grupos.
Para cada grupo você pode aplicar uma função de agregação, por exemplo: 
Calcular a soma dos itens
Contar o numero de itens naquele grupo

SELECT colula1, funcaoagregacao(coluna2)
FROM nome_tabela
GROUP BY colula1;

SELECT SpecialofferID, SUM(UnitPrice) AS "SOMA"
FROM Sales.SalesOrderDetail
GROUP BY SpecialOfferID

SELECT FirstName, COUNT(FirstName) AS "CONTAGEM"
FROM Person.Person
GROUP BY FirstName

* HAVING = É basicamente muito usado em junção com o GROUP BY  para filtrar resultados de um  agrupamento 
Igual um WHERE para dados agrupados

SELECT colula1, funcaoagregacao(coluna2)
FROM nome_tabela
GROUP BY colula1
HAVING condicao;

Obs. A diferença entre o WHERE e o HAVING É que o GROUP BY é aplicado depois que os dados já foram agrupados, enquanto o WHERE é aplicado antes dos dados serem agrupados

SELECT FirstName, COUNT(FirstName) AS "QUANTIDADE"
FROM Person.Person
GROUP BY FirstName
HAVING COUNT(FirstName) > 10

SELECT StateProvinceID, COUNT(StateProvinceID) as "QUANTIDADE"
FROM Person.Address
GROUP BY StateProvinceID
HAVING COUNT(StateProvinceID) > 1000

* AS = Serve para da nome as colunas, select e outros

SELECT FirstName as "NOME", LastName AS "SOBRENOME"
FROM person.person

INNER JOIN = Junção de informação de duas tabelas
SELECT C.ClienteID, C.nome, E.Rua,E.Cidade
FROM Cliente C
INEER JOIN Endereço E on E.EnderecoID = C.EnderecoID

SELECT pr.ListPrice, pr.Name, pc.Name
FROM Production.Product PR
INNER JOIN Production.ProductSubcategory PC on Pc.ProductSubcategoryID = pr.ProductSubcategoryID
*COM FILTRO

TIPOS DE JOIN