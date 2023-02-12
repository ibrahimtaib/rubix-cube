class Position {
    private PVector cubieIndex;
    private PVector coords;
    private float cubieSize;
    Position(int x, int y, int z, float size){
        float offset = -size;

        cubieSize = size;
        cubieIndex = new PVector(x, y, z);
        coords = new PVector(offset + size*x, offset + size*y, size*z);
    }

    PVector getCoords() {
        return coords.copy();
    }

    void update(int x, int y, int z) {
        float offset = -cubieSize;

        cubieIndex = new PVector(x, y, z);
        coords = new PVector(offset + cubieSize*x, offset + cubieSize*y, cubieSize*z);
    }
}