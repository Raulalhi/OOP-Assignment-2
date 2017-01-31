class Player{
  
  Body body;
  float x,y;
  float w, h;
  float groundlevel = height - 50;
  color col = (255);
  
  
  Player()
  {
    x = 100;
    y = groundlevel - 50;
    w = 50;
    h = 50;
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd; 
    body.createFixture(sd,1);
    
    //body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = body.getAngle();
    //body.setLinearVelocity(new Vec2(10,0));

    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    fill(col);
    stroke(0);
    rectMode(CENTER);
    rect(0, 0,w,h);
    popMatrix();
  }
  
  void jump()
  {
    body.setLinearVelocity(new Vec2(0, 15));
    body.setAngularVelocity(5);
  }
  
  void change()
  {
    col = (0);
  }
  
}