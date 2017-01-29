class Player{
  
  Body body;
  float w, h;
  float groundlevel = height - 50;
  
  
  Player()
  {
    w = 50;
    h = 50;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(100,groundlevel - 25));
    body = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    fd.density = 0.5;
    fd.friction = 0.3;
    fd.restitution = 0.3;
    
    body.createFixture(fd);
    
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    //body.setAngularVelocity(random(-5, 5));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    //body.setLinearVelocity(new Vec2(10,0));

    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }
  
  void jump()
  {
    body.setLinearVelocity(new Vec2(0, 15));
  }
  
}