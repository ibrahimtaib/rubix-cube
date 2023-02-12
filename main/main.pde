import peasy.*;
PeasyCam cam;
int nbCubies = 4;
float cubiesSize = 50;
Rubix rub = new Rubix(nbCubies, cubiesSize);

void setup(){
    float rubixCenter = nbCubies/2*cubiesSize - cubiesSize/2*(1-nbCubies%2);
    size(600, 600, P3D);
    cam = new PeasyCam(this, rubixCenter, rubixCenter, rubixCenter, 600);

    float rubixSize = cubiesSize*3;
    cam.setMinimumDistance(sqrt(rubixSize*rubixSize + rubixSize*rubixSize*2));

    //We forbid panning, and instead we rotate
    cam.setCenterDragHandler(cam.getRotateDragHandler());
}

void draw(){
    background(0);
    rub.show();
}
