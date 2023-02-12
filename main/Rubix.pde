class Rubix{
    Cubies[] cubies;
    private float center;
    private float cubiesSize;
    private int nbCubies;
    private float rubixCenter;
    private Move move = new Move(this);

    float getCenter(){
        return rubixCenter;
    }
    boolean isPlaying() {
        return move.isPlaying();
    }
    Rubix(int nbCubies, float cubiesSize){
        this.nbCubies = nbCubies;
        this.cubiesSize = cubiesSize;
        cubies = new Cubies[round(pow(nbCubies, nbCubies))];
        rubixCenter = (nbCubies)/2*cubiesSize; //- cubiesSize/2*(1-nbCubies%2);
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
    void play(Axis axis, int index,  boolean clockwise){
        move.play(axis, index, clockwise, 50);
    }
    void show() {
        move.update();
        for (int i = 0; i < nbCubies; ++i) {
            for (int j = 0; j < nbCubies; ++j) {
                for (int k = 0; k < nbCubies; ++k) {
                    push();
                    Cubies qb = cubies[i*nbCubies*nbCubies + j*nbCubies + k];
                    if(move != null && move.isPlaying()){
                        switch (move.getAxis()){
                            case X:
                                if (qb.getXIndex() == move.getIndex())
                                {
                                    rotateX(move.getAngle());
                                }
                                break;
                            case Y:
                                if (qb.getYIndex() == move.getIndex())
                                {
                                    rotateY(move.getAngle());
                                }
                                break;
                            case Z:
                                if (qb.getZIndex() == move.getIndex())
                                {
                                    rotateZ(move.getAngle());
                                }
                                break;
                            default:
                                throw new RuntimeException("Axis of a move can't be null");
                        }
                    }
                    qb.show();
                    pop();
                }
            }
        }  
    }
}