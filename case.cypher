// CASE - Simple form
/**
	CASE expression
		WHEN value1 THEN result1
		WHEN value2 THEN result2
		...
		ELSE default_result
	END
*/

// CASE - Simple form with RETURN
MATCH (p:Person)
RETURN p.name,
CASE p.age
	WHEN null THEN 'Empty'
	WHEN 20 THEN 'Minor'
	ELSE p.age
END AS age_group

// CASE - Generic form
MATCH (p:Person)
RETURN
CASE
	WHEN p.age < 18 THEN 1
	WHEN p.age >= 18 AND p.age < 65 THEN 2
	WHEN p.age = 18 THEN 3
	ELSE 4
END AS age_group
ORDER BY p.age ASC

// CASE - SET
MATCH (p:Movie)
WITH p,
CASE p.released
	WHEN 1999 THEN 1
	WHEN 2001 THEN 2
	WHEN 2008 THEN 3
	ELSE 4
END AS release_group
SET p.release_group = release_group
RETURN p.title, p.released, p.release_group
