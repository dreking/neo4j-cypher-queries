// ABS() - Returns the absolute value of a number.
RETURN ABS(-5) AS absolute_value; // Returns 5

MATCH (n:Person)
WHERE n.name IN ['John', 'Jane']
RETURN ABS(n.age) AS absolute_age; // Returns the absolute value of the age of John and Jane

// CEIL() - Returns the smallest integer greater than or equal to a number.
RETURN CEIL(4.2) AS ceiling_value; // Returns 5

// FLOOR() - Returns the largest integer less than or equal to a number.
RETURN FLOOR(4.8) AS floor_value; // Returns 4

// ROUND() - Rounds a number to the nearest integer.
RETURN ROUND(4.5) AS rounded_value; // Returns 5

// RAND() - Returns a random floating-point number between 0 (inclusive) and 1 (exclusive).
RETURN RAND() AS random_value; // Returns a random number between 0 and 1
RETURN RAND() * 10 AS random_value_scaled; // Returns a random number between 0 and 10
RETURN TOINTEGER(RAND() * 10) AS random_integer; // Returns a random integer between 0 and 9

// SIGN() - Returns the sign of a number: -1 for negative numbers, 0 for zero, and 1 for positive numbers.
RETURN SIGN(-10) AS sign_negative; // Returns -1
RETURN SIGN(0) AS sign_zero; // Returns 0
RETURN SIGN(10) AS sign_positive; // Returns 1
