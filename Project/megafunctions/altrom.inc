FUNCTION altrom(address[AD_WIDTH-1..0], clocki, clocko)
	WITH (WIDTH, AD_WIDTH, NUMWORDS, FILE, REGISTERINPUTMODE, MAXIMUM_DEPTH)
	RETURNS (q[WIDTH-1..0]);