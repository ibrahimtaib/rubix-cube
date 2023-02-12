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
    int nbCubies;

    Cubies(int x, int y, int z, float size, int nbCubies, float offset)
    {
        this.mat = new PMatrix3D();
        this.pos = new Position(x, y, z, size, nbCubies, offset);
        this.nbCubies = nbCubies;
        PVector coords = pos.getCoords();
        mat.translate(coords.x, coords.y, coords.z);
        this.size = size;
    }

    void turnZ(boolean clockwise){
        PVector coords = pos.getCoords();
        PMatrix3D transMatrix = new PMatrix3D();
        mat.reset();

        //We rotate relative to the center of the cube
        mat.rotateZ(HALF_PI * (clockwise?1:-1));
        //transMatrix.translate(coords.x, coords.y, coords.z);

        //Update index
        pos.turnZ(clockwise);
        //Update coords
        //Fetch new coords
        coords = pos.getCoords();

        mat.translate(coords.x, coords.y, coords.z);
        pos.update(mat.m03, mat.m13, coords.z);

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
        color inside = 60;
        applyMatrix(mat);

        /* 
        ** We create a new shape
        ** The new shape will be drawn in shapeMode corner
        ** We first translate, and put vertex in a relative position
        */
        beginShape(QUADS);

        float r = size/2;

        //Front 
        fill(colors[Faces.FRONT]);
        if(getZIndex() != 0) {fill(inside);}
        vertex(-r, -r,  r);
        vertex(r, -r,   r);
        vertex(r, r,    r);
        vertex(-r, r,   r);
        // vertex(0, 0, 0);
        // vertex(size, 0, 0);
        // vertex(size, size, 0);
        // vertex(0, size, 0);

        fill(colors[Faces.RIGHT]);
        if(getXIndex() < nbCubies - 1) {fill(inside);}
        //Right
        vertex(r, -r,   r);
        vertex(r, -r, -r);
        vertex(r, r, -r);
        vertex(r, r, r);

        // vertex(size, 0, 0);
        // vertex(size, 0, -size);
        // vertex(size, size, -size);
        // vertex(size, size, 0);

        fill(colors[Faces.LEFT]);
        if(getXIndex() > 0) {fill(inside);}
        //Left
        vertex(-r, -r, r);
        vertex(-r, -r, -r);
        vertex(-r, r, -r);
        vertex(-r, r, r);

        // vertex(0, 0, 0);
        // vertex(0, 0, -size);
        // vertex(0, size, -size);
        // vertex(0, size, 0);

        fill(colors[Faces.BACK]);
        if(getZIndex() < nbCubies - 1) {fill(inside);}   
        //Back 
        vertex(-r, -r, -r);
        vertex(r, -r, -r);
        vertex(r, r, -r);
        vertex(-r, r, -r);      

        // vertex(0, 0, -size);
        // vertex(size, 0, -size);
        // vertex(size, size, -size);
        // vertex(0, size, -size);
        fill(colors[Faces.UP]);
        if(getYIndex() != 0) {fill(inside);}
        //Up
        vertex(-r, -r, r);
        vertex(-r, -r, -r);
        vertex(r, -r, -r);
        vertex(r, -r, r);

        // vertex(0, 0, 0);
        // vertex(0, 0, -size);
        // vertex(size, 0, -size);
        // vertex(size, 0, 0);

        fill(colors[Faces.BOTTOM]);
        if(getYIndex() < nbCubies - 1) {fill(inside);}
        //Bottom
        vertex(r, r, r);
        vertex(r, r, -r);
        vertex(-r, r, -r);
        vertex(-r, r, r);

        // vertex(0, size, 0);
        // vertex(0, size, -size);
        // vertex(size, size, -size);
        // vertex(size, size, 0);

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