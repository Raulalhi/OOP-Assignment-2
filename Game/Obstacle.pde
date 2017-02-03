class Obstacle
{
  
  Body body;
  
  float cx, cy;
  color col = 255;
  
  Obstacle(float x, float y, int type)
  {
    float size = random(50, 90);
    makeBody(new Vec2(x, y), size, type);
    body.setUserData(this);
  }
  
  void makeBody(Vec2 center, float size, float type)
  {
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    
    PolygonShape sd = new PolygonShape();
    
    if (type == 1)
    {
      Vec2[] vertices = new Vec2[3];
      vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-size, +size));
      vertices[1] = box2d.vectorPixelsToWorld(new Vec2(+size, +size));
      vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, -size));
      sd.set(vertices, vertices.length);
    }
    else
    {
      Vec2[] vertices = new Vec2[3];
      vertices[0] = box2d.vectorPixelsToWorld(new Vec2(size, -size));
      vertices[1] = box2d.vectorPixelsToWorld(new Vec2(-size, -size));
      vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, +size));
      sd.set(vertices, vertices.length);
    }
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    fd.density = 1;
    fd.friction = 0;
    fd.restitution = 0;
    
    body.createFixture(fd);
    body.setGravityScale(0);
    
    body.setLinearVelocity(new Vec2(-40,0));
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    

    pushMatrix();
    translate(pos.x, pos.y);
    noStroke();
    fill(0);

    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++)
    {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  
  void killBody()
  {
    box2d.destroyBody(body);
  }
  
  boolean done()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.x + 100 < 0)
    {
      killBody();
      return true;
    }
    return false;
  }
  
  void faster()
  {
     body.setLinearVelocity(new Vec2(-60,0));
  }
    
}