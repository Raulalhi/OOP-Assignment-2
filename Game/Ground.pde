class Boundary {

  float x;
  float y;
  float w;
  float h;
  
  Body b;

  Boundary(float x_,float y_, float w_, float h_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    b = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    b.createFixture(sd,1);
    b.setUserData(this);
  }
  void killBody()
  {
    box2d.destroyBody(b);
  }

  void display() {
    noStroke();
    fill(#00868B);
    rectMode(CENTER);
    rect(x,y,w,h);
  }

}