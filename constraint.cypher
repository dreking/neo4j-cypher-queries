// UNIQUE node property constraint
CREATE CONSTRAINT unique_email
ON (p:Person) ASSERT p.email IS UNIQUE

// UNIQUE relationship property constraint
CREATE CONSTRAINT unique_relationship_id
ON ()-[r:KNOWS]-() ASSERT r.id IS UNIQUE

CREATE CONSTRAINT constraint_relationship
ON ()-[r:ORDERED]-() ASSERT EXISTS(r.discount)
// Means that every relationship of type ORDERED must have a discount property, but it does not enforce uniqueness.

// NODE KEY CONSTRAINT
CREATE CONSTRAINT node_key_constraint
ON (p:Product) ASSERT (p.sku, p.name) IS NODE KEY

// LIST ALL CONSTRAINTS
SHOW CONSTRAINTS

// DELETE A CONSTRAINT
DROP CONSTRAINT unique_email
