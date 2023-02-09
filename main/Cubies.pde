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
        translate(pos.x, pos.y, pos.z);
        box(size, size, size);
        popMatrix();
    }
}