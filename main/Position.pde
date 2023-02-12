class Position {
    PVector cubieIndex;
    PVector gridPosition;

    Position(int x, int y, int z, float size){
        cubieIndex = new PVector(x, y, z);
        float offset = -size;
        gridPosition = new PVector(offset + size*x, offset + size*y, size*z);
    }
}