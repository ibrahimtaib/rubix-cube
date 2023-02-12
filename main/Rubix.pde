class Rubix{
    Cubies[] cubies;
    private float center;
    private float cubiesSize;
    private int nbCubies;
    
    Rubix(int nbCubies, float cubiesSize){
        this.nbCubies = nbCubies;
        this.cubiesSize = cubiesSize;
        cubies = new Cubies[round(pow(nbCubies, nbCubies))];

        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {  
                    cubies[i*nbCubies*nbCubies + j*nbCubies + k] = new Cubies(i, j, k, cubiesSize, nbCubies);
                }
            }
        }      
    }

    void turnZ(int index, boolean clockwise){

        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {  
                    Cubies qb = cubies[i*nbCubies*nbCubies + j*nbCubies + k]; 
                    if(qb.getZIndex() == index) {
                        qb.turnZ(clockwise);
                    }
                }
            }
        }      
    }
    void show() {
        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {
                    cubies[i*nbCubies*nbCubies + j*nbCubies + k].show();
                }
            }
        }  
    }
}