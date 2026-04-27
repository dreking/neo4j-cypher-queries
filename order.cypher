
// MATCHING NODES AND ORDER BY
MATCH (n:Movie)
RETURN n.title, n.released
ORDER BY n.released DESC // ASC is the default

// MATCHING NODES AND ORDER BY MULTIPLE PROPERTIES
MATCH (n:Movie)
RETURN n.title, n.released, n.rating
ORDER BY n.released DESC, n.rating DESC
// ORDER BY n.released, n.rating DESC
