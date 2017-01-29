class Obstacle
{
  
  Body body;
  
  float cx, cy;
  
  float groundlevel = height - 50;
  
  Obstacle(float x, float y)
  {
    
    makeBody(new Vec2(x, groundlevel -50));
    
    
  }
  
  void makeBody(Vec2 center)
  {
    PolygonShape sd = new PolygonShape();
    
    float size = random(50, 150);
    Vec2[] vertices = new Vec2[3];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(-size, +size));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(+size, +size));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(0, -size));
    sd.set(vertices, vertices.length);
     
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(sd,1);
  }
  
  void display()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    Fixture f = body.getFixtureList();
    PolygonShape ps = (PolygonShape) f.getShape();


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
  
  void update()
  {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pos.x --;
    
  }
  
}