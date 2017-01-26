class Ground {
  
  Body body;
  float w, h;
  
  Ground(float x, float y)
  {
    w = width;
    h = height;
    
    BodyDef bd = new BodyDef();      
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape ps = new PolygonShape();
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    
    ps.setAsBox(box2dW, box2dH);
    
    
    body.createFixture(ps,1);
  }
  
  void display()
  {
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
}