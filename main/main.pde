import peasy.*;
PeasyCam cam;
int nbCubies = 3;
float cubiesSize = 50;
Rubix rub = new Rubix(nbCubies, cubiesSize);
boolean clockwise = true;

void setup(){
    float rubixCenter = rub.getCenter();
    size(600, 600, P3D);
    cam = new PeasyCam(this,  6*rubixCenter);

    float rubixSize = cubiesSize*3;
    cam.setMinimumDistance(sqrt(rubixSize*rubixSize + rubixSize*rubixSize*2));

    //We forbid panning, and instead we rotate
    cam.setCenterDragHandler(cam.getRotateDragHandler());

    //rub.turnZ(2, true);
}
void keyPressed() {

    if (key == 'F'){
        rub.add(rub.Front(clockwise, rub.getSpeed()));
    }
    if( key == 'B'){
        rub.add(rub.Back(clockwise, rub.getSpeed()));
    }

    if (key == 'U'){
        rub.add(rub.Up(clockwise, rub.getSpeed()));
    }
    if (key == 'D'){
        rub.add(rub.Down(clockwise, rub.getSpeed()));
    }
    if (key == 'L'){
        rub.add(rub.Left(clockwise, rub.getSpeed()));
    }
    if (key == 'R'){
        rub.add(rub.Right(clockwise, rub.getSpeed()));
    }
    //Reset cube
    if (key == 'N'){
        rub = new Rubix(nbCubies, cubiesSize);
        clockwise = false;
    }
    //Shuffle cube
    if (key == ENTER){
        rub.shuffle();
    }
    //Cancel all moves waiting to be played
    if (key == BACKSPACE){
        rub.cancelMoves();
    }
    if (key == 'C')
    {
        clockwise = !clockwise;
    }
}

void draw(){
    background(165);
    rub.show();
}
