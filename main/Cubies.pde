class Cubies{
    color[] colors = {
        color(255),
        color(255, 0, 0),
        color(255, 165, 0),
        color(255, 255, 0),
        color(0, 0, 255),
        color(0, 255, 0), 
    };
    PMatrix3D mat;
    Position pos;
    float size;

    Cubies(int x, int y, int z, float size)
    {
        this.mat = new PMatrix3D();
        this.pos = new Position(x, y, z, size);
        PVector coords = pos.getCoords();
        mat.translate(coords.x, coords.y, coords.z);
        this.size = size;
    }

    void show(int i){
        pushMatrix();

        applyMatrix(mat);
       
        /* 
        ** We create a new shape
        ** The new shape will be drawn in shapeMode center
        ** We first translate, and put vertex in a relative position
        */
        float r = size/2;
        beginShape(QUADS);

        //Front 
        fill(colors[Faces.FRONT]);
        vertex(-r, -r, 0);
        vertex(r, -r, 0);
        vertex(r, r, 0);
        vertex(-r, r, 0);

        fill(colors[Faces.RIGHT]);
        //Right
        vertex(r, -r, 0);
        vertex(r, -r, -2*r);
        vertex(r, r, -2*r);
        vertex(r, r, 0);

        fill(colors[Faces.LEFT]);
        //Left
        vertex(-r, -r, 0);
        vertex(-r, -r, -2*r);
        vertex(-r, r, -2*r);
        vertex(-r, r, 0);

        fill(colors[Faces.BACK]);
        //Back 
        vertex(-r, -r, -2*r);
        vertex(r, -r, -2*r);
        vertex(r, r, -2*r);
        vertex(-r, r, -2*r);      

        fill(colors[Faces.UP]);
        //Up
        vertex(-r, -r, 0);
        vertex(-r, -r, -2*r);
        vertex(r, -r, -2*r);
        vertex(r, -r, 0);

        fill(colors[Faces.BOTTOM]);
        //Bottom
        vertex(r, r, 0);
        vertex(r, r, -2*r);
        vertex(-r, r, -2*r);
        vertex(-r, r, 0);

        endShape(QUADS);

        popMatrix();
    }
}