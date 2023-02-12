import peasy.*;
PeasyCam cam;
int nbCubies = 4;
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

void mousePressed(){
    if(mouseButton == LEFT)
    {
        clockwise = false;
   }
}
void mouseReleased() {
    if(mouseButton == LEFT)
    {
        clockwise = true;
    }
}
void keyPressed() {
    if (key == 'a'){
        rub.play(Axis.Z, 0, clockwise);
    }
    if( key == 'z'){
        rub.play(Axis.Y, 0, clockwise);
    }

    if (key == 'e'){
        rub.play(Axis.X, 0, clockwise);
    }

    if (key == 'R'){
        rub = new Rubix(nbCubies, cubiesSize);
    }
    if (key == ENTER){
        rub.shuffle();
    }
    if (key == BACKSPACE){
        rub.cancelMoves();
    }
}

void draw(){
    background(165);
    rub.show();
}
