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

    Cubies(int x, int y, int z, float size, int nbCubies, float offset)
    {
        this.mat = new PMatrix3D();
        this.pos = new Position(x, y, z, size, nbCubies, offset);
        PVector coords = pos.getCoords();
        mat.translate(coords.x, coords.y, coords.z);
        this.size = size;
    }

    void turnZ(boolean clockwise){
        PVector coords = pos.getCoords();
        PMatrix3D transMatrix = new PMatrix3D();
  
        //We rotate relative to the center of the cube
        transMatrix.rotateZ(HALF_PI * (clockwise?1:-1));
        transMatrix.translate(coords.x, coords.y, coords.z);

        //Update index
        pos.turnZ(clockwise);
        //Update coords
        pos.update(transMatrix.m03, transMatrix.m13, coords.z);
        //Fetch new coords
        coords = pos.getCoords();

        mat.reset();
        mat.translate(coords.x, coords.y, coords.z);

        color[] newColors = colors.clone();

        //We update colors
        if(clockwise){
            newColors[Faces.RIGHT] = colors[Faces.UP];
            newColors[Faces.BOTTOM] = colors[Faces.RIGHT];
            newColors[Faces.UP] = colors[Faces.LEFT];
            newColors[Faces.LEFT] = colors[Faces.BOTTOM];
        } else {
            newColors[Faces.UP] = colors[Faces.RIGHT];
            newColors[Faces.RIGHT] = colors[Faces.BOTTOM];
            newColors[Faces.LEFT] = colors[Faces.UP];
            newColors[Faces.BOTTOM] = colors[Faces.LEFT];
        }


        colors = newColors;

    }

    void turnY(boolean clockwise){
        PVector coords = pos.getCoords();
        PMatrix3D transMatrix = new PMatrix3D();
        transMatrix.rotateY(HALF_PI * (clockwise?1:-1));
        transMatrix.translate(coords.x, coords.y, coords.z);

        //Update index
        pos.turnY(clockwise);
        //Update coords
        pos.update(transMatrix.m03, coords.y, transMatrix.m23);
        
        //Fetch new coords
        coords = pos.getCoords();

        mat.reset();
        mat.translate(coords.x, coords.y, coords.z);

        color[] newColors = colors.clone();

        //We update colors
        if(clockwise){
            newColors[Faces.FRONT] = colors[Faces.LEFT];
            newColors[Faces.RIGHT] = colors[Faces.FRONT];
            newColors[Faces.BACK] = colors[Faces.RIGHT];
            newColors[Faces.LEFT] = colors[Faces.BACK];

        } else {
            newColors[Faces.LEFT] = colors[Faces.FRONT];
            newColors[Faces.FRONT] = colors[Faces.RIGHT];
            newColors[Faces.RIGHT] = colors[Faces.BACK];
            newColors[Faces.BACK] = colors[Faces.LEFT];
        }


        colors = newColors;

    }
    
    void turnX(boolean clockwise){
        PVector coords = pos.getCoords();
        PMatrix3D transMatrix = new PMatrix3D();
        transMatrix.rotateX(HALF_PI * (clockwise?1:-1));
        transMatrix.translate(coords.x, coords.y, coords.z);

        //Update index
        pos.turnX(clockwise);
        //Update coords
        pos.update(coords.x, transMatrix.m13, transMatrix.m23);
        
        //Fetch new coords
        coords = pos.getCoords();

        mat.reset();
        mat.translate(coords.x, coords.y, coords.z);

        color[] newColors = colors.clone();

        //We update colors
        if(clockwise){
            newColors[Faces.UP] = colors[Faces.FRONT];
            newColors[Faces.FRONT] = colors[Faces.BOTTOM];
            newColors[Faces.BOTTOM] = colors[Faces.BACK];
            newColors[Faces.BACK] = colors[Faces.UP];

        } else {
            newColors[Faces.FRONT] = colors[Faces.UP];
            newColors[Faces.BOTTOM] = colors[Faces.FRONT];
            newColors[Faces.BACK] = colors[Faces.BOTTOM];
            newColors[Faces.UP] = colors[Faces.BACK];
        }
        colors = newColors;
    }
    void show(){
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
    int getZIndex(){
        return pos.getZIndex();
    }
    int getYIndex(){
        return pos.getYIndex();
    }
    int getXIndex(){
        return pos.getXIndex();
    }

}