// Importing CSV files

// LOAD CSV with a file path
LOAD CSV WITH HEADERS
FROM 'file:///student.csv' AS row
RETURN row

// LOAD CSV with a URL
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/shippers.csv' AS line
RETURN line

// LOAD CSV with a URL and line number
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/shippers.csv' AS line
RETURN line, lineNumber()

// LOAD - Locate directory and file name
LOAD CSV FROM 'file:///student.csv' AS row
RETURN DISTINCT file()

// LOAD - View selected columns
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/shippers.csv' AS row
RETURN row.name, row.age

LOAD CSV FROM 'file:///student.csv' AS row
RETURN row[0] AS name, row[1] AS age

LOAD CSV FROM 'file:///student.csv' AS row
RETURN COLLECT(row[0]) AS allRows

// LOAD CSV - Create nodes with specific properties
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/shippers.csv' AS shipper
CREATE (s:Shipper {shipperID: shipper.shipperID, companyName: shipper.companyName, phone: shipper.phone})
RETURN s

LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/suppliers.csv' AS supplier
CREATE (s:Supplier)
SET s=supplier
RETURN s

LOAD CSV FROM 'file:///student.csv' AS row
CREATE (s:Student {name: row[0], age: toInteger(row[1])})
RETURN s

// LOAD CSV - Change data types
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/categories.csv' AS category
CREATE (c:Category)
SET c=category, c.categoryID = toInteger(category.categoryID)
RETURN c

// LOAD CSV - Using MERGE to avoid duplicates
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/shippers.csv' AS shipper
MERGE (s:Shipper {shipperID: shipper.shipperID})
ON CREATE SET s.companyName = shipper.companyName, s.phone = shipper.phone
RETURN s

// LOAD CSV - Create nodes and relationships -> Suppliers and Products
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/suppliers.csv' AS supplier
MERGE (s:Supplier {supplierID: supplier.supplierID, companyName: supplier.companyName})

WITH supplier
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/neo4j-graph-examples/northwind/refs/heads/main/import/products.csv' AS product
MERGE (p:Product {productID: product.productID, supplierID: product.supplierID})
ON CREATE SET p.productName = product.productName, p.unitPrice = toFloat(product.unitPrice), p.unitsInStock = toInteger(product.unitsInStock)

WITH supplier, product
MATCH (s:Supplier {supplierID: supplier.supplierID}), (p:Product {productID: product.productID})
WHERE s.supplierID = p.supplierID
MERGE (s)-[:SUPPLIES]->(p)
RETURN *
