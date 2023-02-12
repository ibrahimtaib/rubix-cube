class Position {
    private PVector cubieIndex;
    private PVector coords;
    private float cubieSize;
    private int nbCubies;
    Position(int x, int y, int z, float size, int nbQBs){
        cubieSize = size;
        nbCubies = nbQBs;
        cubieIndex = new PVector(x, y, z);
        coords = new PVector(size*x, size*y, size*z);
    }
    void turnZ(){
        //Only update indexes
        int x = nbCubies - 1 - round(cubieIndex.y);
        int y = round(cubieIndex.x);
        cubieIndex = new PVector(x, y , round(cubieIndex.z));
    }
    PVector getCoords() {
        return coords.copy();
    }

    int getZIndex(){
        return round(cubieIndex.z);
    }
    int getYIndex(){
        return round(cubieIndex.y);
    }
    int getXIndex(){
        return round(cubieIndex.x);
    }
    void update(float x, float y, float z) {
        coords = new PVector(x, y, z);
    }
}