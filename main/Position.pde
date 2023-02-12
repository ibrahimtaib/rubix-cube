class Position {
    private PVector cubieIndex;
    private PVector coords;
    private float cubieSize;
    private int nbCubies;
    Position(int x, int y, int z, float size, int nbQBs, float offset){
        cubieSize = size;
        nbCubies = nbQBs;
        cubieIndex = new PVector(x, y, z);
        coords = new PVector(size*x - offset, size*y-offset, -size*z + offset);
    }
    void turnZ(boolean clockwise){
        int x, y;
        //Only update indexes
        if(clockwise){
            x = nbCubies - 1 - round(cubieIndex.y);
            y = round(cubieIndex.x);
        }else {
            x = round(cubieIndex.y);
            y = nbCubies - 1 - round(cubieIndex.x);
        }
        cubieIndex = new PVector(x, y , round(cubieIndex.z));
    }
    
    void turnY(boolean clockwise){
        int x, z;
        //Only update indexes
        if(clockwise){
            x = nbCubies - 1 - round(cubieIndex.z);
            z = round(cubieIndex.x);
        }else {
            x = round(cubieIndex.z);
            z = nbCubies - 1 - round(cubieIndex.x);
        }

        cubieIndex = new PVector(x, round(cubieIndex.y) , z);
    }

    void turnX(boolean clockwise){
        int y, z;
        //Only update indexes
        if(clockwise){
            z = nbCubies - 1 - round(cubieIndex.y);
            y = round(cubieIndex.z);
        }else {
            z = round(cubieIndex.y);
            y = nbCubies - 1 - round(cubieIndex.z);
        }

        cubieIndex = new PVector(round(cubieIndex.x), y , z);
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