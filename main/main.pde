import peasy.*;
PeasyCam cam;
int nbCubies = 3;
float cubiesSize = 50;
void setup(){
    size(600, 600, P3D);
    cam = new PeasyCam(this, 0, 0, nbCubies/2*cubiesSize, 600);
    shapeMode(CORNER);
}

void draw(){
    background(0);
    //rect(0, 0, 50, 50);
    (new Rubix(nbCubies, cubiesSize)).show();
}
