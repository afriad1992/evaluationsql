--- 1
  SELECT CompanyName AS 'societé',ContactName AS 'contact',ContactTitle AS 'Fonction',
  Phone AS 'Téléphone' FROM customers  WHERE Country='France';
 ---2
  SELECT ProductName AS 'Produit',UnitPrice AS 'Prix' FROM products P INNER JOIN suppliers S
  ON P.SupplierID=S.SupplierID WHERE CompanyName='Exotic Liquids';
  --3
  SELECT S.CompanyName AS 'Fournisseur',COUNT(DISTINCT ProductName)AS 'Nbre produits' FROM products P 
  INNER JOIN suppliers S ON P.SupplierID=S.SupplierID WHERE S.Country='France' GROUP BY S.CompanyName 
  ORDER BY COUNT(DISTINCT ProductName) DESC;
  
  --- 4
  
   SELECT C.CompanyName AS 'Client' ,COUNT(O.CustomerID)AS 'Nbre commandes' FROM orders O 
	INNER JOIN customers C ON O.CustomerID=C.CustomerID and Country='france'GROUP BY O.CustomerID 
	HAVING COUNT(O.CustomerID)>10;
	
   --- 5 
   
   SELECT companyName AS 'Client',SUM(UnitPrice*Quantity) AS 'CA',country AS 'Pays' FROM orderdetails D
	INNER JOIN orders O ON D.OrderID=O.OrderID INNER JOIN customers C ON  O.CustomerID=C.CustomerID 
	GROUP BY O.CustomerID HAVING SUM(UnitPrice*Quantity)>30000 ;
	
   ---6 
 
   SELECT COUNTRY AS 'Pays' FROM  orderdetails D INNER JOIN orders O ON D.OrderID=O.OrderID 
   JOIN customers C ON  O.CustomerID=C.CustomerID WHERE ProductID IN(SELECT ProductID FROM products P
	INNER JOIN suppliers S ON P.SupplierID=S.SupplierID WHERE CompanyName='Exotic Liquids') 
	GROUP BY country ;

--- 7 

   SELECT SUM(UnitPrice*Quantity) AS 'Montant Ventes 97' FROM orderdetails D INNER JOIN orders O 
   ON D.OrderID=O.OrderID WHERE YEAR(OrderDate)=1997 ;
   
---8 

   SELECT MONTH(OrderDate) AS 'Mois 97',SUM(UnitPrice*Quantity) 'Montant Ventes 97'FROM orderdetails D INNER JOIN orders O ON D.OrderID=O.OrderID WHERE
   YEAR(OrderDate)=1997 GROUP BY MONTH(OrderDate);
   
---9

   SELECT MAX(OrderDate) AS 'Date de derniére commande' FROM  orders O 
	INNER JOIN customers C ON O.CustomerID=C.CustomerID WHERE CompanyName='Du monde entier';
	
---10

   SELECT ROUND(AVG(HOUR(TIMEDIFF(OrderDate,shippedDate))/24))AS 'Delais moyen de livraison en jour' 
	FROM orders ;