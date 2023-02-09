class Rubix{
    Cubies[][][] cubies;
    private float center;
    private float cubiesSize;
    private int nbCubies;
    
    Rubix(int nbCubies, float cubiesSize){
        this.nbCubies = nbCubies;
        this.cubiesSize = cubiesSize;
        cubies = new Cubies[nbCubies][nbCubies][nbCubies];

        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {
                    float offset = -cubiesSize;

                    float x = offset + i*cubiesSize;
                    float y = offset + j*cubiesSize;
                    float z = k*cubiesSize;
                    
                    cubies[i][j][k] = new Cubies(x, y , z, cubiesSize);
                }
            }
        }      
    }

    void show() {
                for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {
                    cubies[i][j][k].show();
                }
            }
        }  
    }
}