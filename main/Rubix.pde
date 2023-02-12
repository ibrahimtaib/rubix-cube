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

    void turn(Axis axis, int index, boolean clockwise){
        int n = 0;
        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {  
                    Cubies qb = cubies[i*nbCubies*nbCubies + j*nbCubies + k]; 

                    switch (axis) {
                        case X:
                            println("not yet implemented");
                            break;
                        case Y :
                            if(qb.getYIndex() == index) {
                                qb.turnY(clockwise);
                                n++;
                            }
                            break;
                        
                        case Z :
                            if(qb.getZIndex() == index) {
                                qb.turnZ(clockwise);
                                n++;
                            }
                            break; 
                        
                        default :
                            throw new IllegalArgumentException("axis should not be null");
                        
                    }
                    println(axis.toString() + n);

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