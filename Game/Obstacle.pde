class Obstacle
{
  
  Body body;
  
  float cx, cy;
  
  float groundlevel = height - 50;
  
  Obstacle()
  {
    float size = random(50, 100);
    makeBody(new Vec2(950, groundlevel -150), size);
    
  }
  
  void makeBody(Vec2 center, float size)
  {
    PolygonShape sd = new PolygonShape();
    
   
    Vec2[] vertices = new Vec2[3];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-size, +size));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(+size, +size));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, -size));
    sd.set(vertices, vertices.length);
     
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    body.createFixture(sd,1);
    body.setGravityScale(0);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();
    
    body.setLinearVelocity(new Vec2(-30,0));

    pushMatrix();
    translate(pos.x, pos.y);
    fill(0);
    stroke(0);
    beginShape();
    for (int i = 0; i < ps.getVertexCount(); i++)
    {
      Vec2 v = box2d.vectorWorldToPixels(ps.getVertex(i));
      vertex(v.x, v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }
  void killBody() {
    box2d.destroyBody(body);
  }
  
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.x + 100 < 0) {
      killBody();
      return true;
    }
    return false;
  }
}