class Rubix{
    Cubies[] cubies;
    private float center;
    private float cubiesSize;
    private int nbCubies;
    private float rubixCenter;
    float getCenter(){
        return rubixCenter;
    }
    Rubix(int nbCubies, float cubiesSize){
        this.nbCubies = nbCubies;
        this.cubiesSize = cubiesSize;
        cubies = new Cubies[round(pow(nbCubies, nbCubies))];
        rubixCenter = nbCubies/2*cubiesSize; //- cubiesSize/2*(1-nbCubies%2);
        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {  
                    cubies[i*nbCubies*nbCubies + j*nbCubies + k] = new Cubies(i, j, k, cubiesSize, nbCubies, rubixCenter);
                }
            }
        }      
    }

    void turn(Axis axis, int index, boolean clockwise){
        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {  
                    Cubies qb = cubies[i*nbCubies*nbCubies + j*nbCubies + k]; 

                    switch (axis) {
                        case X:
                            if(qb.getXIndex() == index) {
                                qb.turnX(clockwise);
                            }                            
                            break;
                        case Y :
                            if(qb.getYIndex() == index) {
                                qb.turnY(clockwise);
                            }
                            break;
                        
                        case Z :
                            if(qb.getZIndex() == index) {
                                qb.turnZ(clockwise);
                            }
                            break; 
                        
                        default :
                            throw new IllegalArgumentException("axis should not be null");
                        
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