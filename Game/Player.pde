class Player{
  
  Body player;
  float x,y;
  float w, h;
  float groundlevel = height - 50;
  color col = (255);
  
  
  Player()
  {
    x = 100;
    y = groundlevel - 200;
    w = 50;
    h = 50;
    

    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    player = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW, box2dH);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0.01;
    fd.restitution = 0.3;
    
    player.createFixture(fd);
    player.setUserData(this);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(player);
    float a = player.getAngle();
    //body.setLinearVelocity(new Vec2(10,0));
    
    rectMode(CENTER);
    noFill();
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(-a);
    stroke(255);
    
    rect(0,0,w,h);
    
    rect(0,0,w/1.5,h/1.5);
    
    rect(0,0,w/3,h/3);
    popMatrix();
  }
  void killBody()
  {
    box2d.destroyBody(player);
  }
  
  void jump()
  {
    player.setLinearVelocity(new Vec2(0, 20));
    player.setAngularVelocity(5);
  }
  
  void down()
  {
    player.setLinearVelocity(new Vec2(0, -20));
    player.setAngularVelocity(5);
  }
  
    
  
}