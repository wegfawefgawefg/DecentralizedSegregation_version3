public class Cell
{ 
  Pair position = new Pair( 0, 0 );
  
  ArrayList<Turtle> turtles;
  ArrayList<Item> items;
  
  public Cell( int x, int y )
  {
    this.position.x = x;
    this.position.y = y;
    turtles = new ArrayList<Turtle>();
    items = new ArrayList<Item>();
  }
  
  public boolean hasTurtles()
  {
    if( turtles.size() > 0 )
    {
      return true;
    }
    return false;
  }
  
  //  diffuse item
}