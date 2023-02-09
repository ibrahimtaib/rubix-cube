class Cubies{
    PVector pos;
    float size;
    Cubies(float x, float y, float z, float size)
    {
        this.pos = new PVector(x, y, z);
        this.size = size;
    }

    void show(){
        pushMatrix();

        float x=pos.x, y=pos.y, z=pos.z;
        translate(x, y, z);
        
        /* 
        ** We create a new shape
        ** The new shape will be drawn in shapeMode center
        ** We first translate, and put vertex in a relative position
        */
        float r = size/2;
        beginShape(QUADS);

        //Front 
        vertex(-r, -r, 0);
        vertex(r, -r, 0);
        vertex(r, r, 0);
        vertex(-r, r, 0);

        //Right
        vertex(r, -r, 0);
        vertex(r, -r, -2*r);
        vertex(r, r, -2*r);
        vertex(r, r, 0);

        //Left
        vertex(-r, -r, 0);
        vertex(-r, -r, -2*r);
        vertex(-r, r, -2*r);
        vertex(-r, r, 0);

        //Back 
        vertex(-r, -r, -2*r);
        vertex(r, -r, -2*r);
        vertex(r, r, -2*r);
        vertex(-r, r, -2*r);      

        //Up
        vertex(-r, -r, 0);
        vertex(-r, -r, -2*r);
        vertex(r, -r, -2*r);
        vertex(r, -r, 0);

        //Bottom
        vertex(r, r, 0);
        vertex(r, r, -2*r);
        vertex(-r, r, -2*r);
        vertex(-r, r, 0);

        endShape(QUADS);
        popMatrix();
    }
}