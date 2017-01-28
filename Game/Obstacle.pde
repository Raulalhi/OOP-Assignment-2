class Obstacle
{
  
  Body body;
  float x1, y1;
  float x2, y2;
  float x3, y3;
  
  float cx, cy,
  
  float groundlevel = height / 50;
  
  Obstacle()
  {
    x1 = 700;
    y1 = groundlevel;
    
    x2 = 750;
    y2 = groundlevel - 50;
    
    x3 = 800;
    y3 = groundlevel;
    
    cx = (x1 + x2 + x3) / 3;
    cy = (y1 + y2 + y3) / 3;
    
    makeBody(new Vec2(cx, cy));
    
  }
  
  void makeBody(Vec2 center)
  {
    PolygonShape sd = new PolygonShape();
    
    Vec2[] vertices = new Vec2[3];
    vertices[0] = box2d.vectorPixelsToWorld(new Vec2(x1, y1));
    vertices[1] = box2d.vectorPixelsToWorld(new Vec2(x2, y2));
    vertices[2] = box2d.vectorPixelsToWorld(new Vec2(x3, y3));
    
     sd.set(vertices, vertices.length);
     
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    body.createFixture(sd, 1.0);
  }
  
}