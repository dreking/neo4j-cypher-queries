// DEGREES() - Returns the angle in degrees for a given angle in radians.
RETURN DEGREES(PI()) AS degrees_value; // Returns 180

// PI() - Returns the mathematical constant π (pi).
RETURN PI() AS pi_value; // Returns 3.141592653589793

// RADIANS() - Returns the angle in radians for a given angle in degrees.
RETURN RADIANS(120) AS radians_value; // Returns 2.0943951023931953

// SIN() - Returns the sine of a given angle in radians.
RETURN SIN(PI() / 2) AS sine_value; // Returns 1

// COS() - Returns the cosine of a given angle in radians.
RETURN COS(PI()) AS cosine_value; // Returns -1

// TAN() - Returns the tangent of a given angle in radians.
RETURN TAN(PI() / 4) AS tangent_value; // Returns 1

// ASIN() - Returns the arcsine of a given value, in radians.
RETURN ASIN(1) AS arcsine_value; // Returns 1.570796326

// ACOS() - Returns the arccosine of a given value, in radians.
RETURN ACOS(0) AS arccosine_value; // Returns 1.570

// ATAN() - Returns the arctangent of a given value, in radians.
RETURN ATAN(1) AS arctangent_value; // Returns 0.785398163

// ATAN2() - Returns the arctangent of the quotient of its arguments, in radians.
RETURN ATAN2(1, 1) AS arctangent2_value; // Returns 0.785398163

// HAVERSIN() - Returns the haversine of a given angle in radians.
RETURN HAVERSIN(PI() / 2) AS haversine_value; // Returns 0.5
