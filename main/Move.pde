class Move{
    private float angle = 0;
    private float alpha = 0;
    private Axis axis;
    private int index;
    private Rubix cube;
    private boolean clockwise;
    private boolean animating = false;

    Move(Rubix cube)
    {
        this.cube = cube;
    }
    Axis getAxis() {return axis;}
    float getAngle() {return angle;}
    int getIndex() {return index;}
    void play(Axis axis, int index,  boolean clockwise, int speed){
        if(axis == null){
            throw new IllegalArgumentException("Axis cannot be null");
        }
        animating = true;

        alpha = ((float)HALF_PI)/speed;
        angle = 0;
        this.axis = axis;
        this.index = index;
        this.clockwise = clockwise;
    }

    boolean isPlaying(){
        return animating;
    }
    void update(){
        if(!animating) {return;}
        angle += (alpha * (clockwise?1:-1));
        if(angle > HALF_PI || angle < -HALF_PI){
            animating = false;
            cube.turn(axis, index, clockwise);
        }
    }
}