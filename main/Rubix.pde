import java.util.Collections;
import java.util.*;
class Rubix{
    Cubies[] cubies;
    private float center;
    private float cubiesSize;
    private int nbCubies;
    private float rubixCenter;
    private Move move = null;
    private final int speed = 25;
    private Queue<Move> moves = new LinkedList<Move>();

    float getCenter(){
        return rubixCenter;
    }
    boolean isPlaying() {
        return move.isPlaying();
    }

    int getSpeed() {return speed;}
    Rubix(int nbCubies, float cubiesSize){
        this.nbCubies = nbCubies;
        this.cubiesSize = cubiesSize;
        cubies = new Cubies[round(pow(nbCubies, nbCubies))];
        rubixCenter = (nbCubies)/2*cubiesSize - cubiesSize/2*(1-nbCubies%2);
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
    void shuffle(){
        Axis[] axis = {Axis.X, Axis.Y, Axis.Z};
        boolean[] bools = {true, false};
        for(int i = 0; i<100; i++)
        {
            //We don't spin the middle layers to keep centerpieces oriented correctly
            play(axis[round(random(2))], bools[round(random(1))]?0:2, bools[round(random(1))], 5);
        }
    }
    void cancelMoves() {
        moves = new LinkedList<Move>();
    }

    Move Up(boolean clockwise, int speed) {
        Move up = new Move(this); 
        up.play(Axis.Y, 0, !clockwise, speed);
        return up;
    }
    Move Down(boolean clockwise, int speed) {
        Move down = new Move(this); 
        down.play(Axis.Y, 2, clockwise, speed);
        return down;
    }

    Move Right(boolean clockwise, int speed) {
        Move up = new Move(this); 
        up.play(Axis.X, 2, clockwise, speed);
        return up;
    }
    
    Move Left(boolean clockwise, int speed) {
        Move up = new Move(this); 
        up.play(Axis.X, 0, !clockwise, speed);
        return up;
    }
    
    Move Front(boolean clockwise, int speed) {
        Move up = new Move(this); 
        up.play(Axis.Z, 0, clockwise, speed);
        return up;
    }
    
    Move Back(boolean clockwise, int speed) {
        Move up = new Move(this); 
        up.play(Axis.Z, 2, !clockwise, speed);
        return up;
    }
    void play(Axis axis, int index,  boolean clockwise){
        play(axis, index, clockwise, speed);
    }
    void add(Move move) {
        if(move == null) {return;}
        moves.add(move);
    }
    private void play(Axis axis, int index,  boolean clockwise, int speed){
        //Get right clockwise turn
        //for UP, LEFT, BACK
        
        Move m = new Move(this);
        m.play(axis, index, clockwise, speed);

        if(move != null && move.isPlaying())
        {
            moves.add(m);
        } else{
            move = m;
        }
    }
    void updateMoves(){
        if (move != null && move.isPlaying()){
            move.update();
            return;
        }
        if (moves.isEmpty()) {
            return;
        }

        move = moves.poll();
    }
    void show() {
        updateMoves();
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