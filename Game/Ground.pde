class Ground {
  
  float x, y, w, h;
  
  Ground(float x_, float y_,float w_,float h_)
  {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelstoWorld(x, y, w, h));
  }
}
    