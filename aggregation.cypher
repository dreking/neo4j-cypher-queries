// AVG() - Returns the average value of a numeric expression.
MATCH (n)
WHERE n.age IS NOT NULL
RETURN AVG(n.age) AS averageAge

// MAX() - Returns the maximum value of a numeric expression.
MATCH (n)
WHERE n.age IS NOT NULL
RETURN MAX(n.age) AS maximumAge

// MIN() - Returns the minimum value of a numeric expression.
MATCH (n)
WHERE n.age IS NOT NULL
RETURN MIN(n.age) AS minimumAge

// SUM() - Returns the sum of a numeric expression.
MATCH (n)
WHERE n.age IS NOT NULL
RETURN SUM(n.age) AS totalAge

// STDEV() - Returns the sample standard deviation of a numeric expression.
MATCH (n)
WHERE n.age IS NOT NULL
RETURN STDEV(n.age) AS standardDeviationAge
