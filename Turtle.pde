public class Turtle
{
  public final double MOVE_RANGE_X = 15;
  public final double MOVE_RANGE_Y = 15;
  
  public final double SENSE_RANGE_X = 1;
  public final double SENSE_RANGE_Y = 1;
  
  public final double NEIGHBORHOOD_RANGE_X = 1;
  public final double NEIGHBORHOOD_RANGE_Y = 1;
  
  public static final double NEIGHBORHOOD_SIZE = 8.0;
  
  public static final double overallSaturationPreference = 6.0 / 8.0;
  
  public static final double type1_type1SaturationPreference = overallSaturationPreference;
  public static final double type2_type2SaturationPreference = 1.0 / 8.0;
  
  Pair position = new Pair( 0, 0 );
  color turtleColor = color( 0, 0, 0 );
  
  int type = 0;
  
  boolean satisfied = false;
  
  public Turtle( Pair position, int type, color turtleColor )
  {
    this.position = position;
    this.type = type;
    this.turtleColor = turtleColor;
  }
  
  public Turtle( int type, color turtleColor )
  {
    this.type = type;
    this.turtleColor = turtleColor;
  }
  
  public void setColor( color newColor )
  {
    this.turtleColor = newColor;
  }
  
  public void tic( World world )
  {
    //  multiplex through case based on turtle type
    if( type == 1 )
    {
      //  see how many type 1s are in the neighborhood
      double numType1TurtlesInNeighborhood = world.grid.countTurtlesOfTypeInRange( position.x, position.y, NEIGHBORHOOD_RANGE_X, NEIGHBORHOOD_RANGE_Y, 1 );
      double type1Presence = numType1TurtlesInNeighborhood / Turtle.NEIGHBORHOOD_SIZE;
      
      if( type1Presence >= type1_type1SaturationPreference )
      {
        satisfied = true;
      }
      else
      {
        satisfied = false;
      }
    }
    else if( type == 2 )
    {
      //  see how many type 1s are in the neighborhood
      double numType2TurtlesInNeighborhood = world.grid.countTurtlesOfTypeInRange( position.x, position.y, NEIGHBORHOOD_RANGE_X, NEIGHBORHOOD_RANGE_Y, 1 );
      double type2Presence = numType2TurtlesInNeighborhood / Turtle.NEIGHBORHOOD_SIZE;
      
      if( type2Presence <= type2_type2SaturationPreference )
      {
        satisfied = true;
      }
      else
      {
        satisfied = false;
      }
    }
    
    //  if not satisfied
    //  //  move to a new location if you can
    if( satisfied == false )
    {
      Cell newCell = world.grid.getRandomEmptyCellWithinRangeOf( position.x, position.y, MOVE_RANGE_X, MOVE_RANGE_Y );
      if( newCell != null )
      {
        move( newCell.position.x, newCell.position.y, world.grid );
      }
    }
  }
  
  //  move function
  //  //  make this more complicated later just keep it simple for now
  public void move( int newX, int newY, Grid grid )
  {
    //  add turtle to new cell at new grid position
    Cell newCell = grid.grid.get( newY ).get( newX );
    newCell.turtles.add( this );
    
    //  remove turtle from old cell at old grid position
    Cell oldCell = grid.grid.get( position.y ).get( position.x );
    oldCell.turtles.remove( this );
     
    //  update turtles position in its own position variables
    this.position.x = newX;
    this.position.y = newY;
  }
  
  public void moveIfEmpty( int newX, int newY, Grid grid )
  {
    if( grid.isTurtleAtCellLocation( newX, newY ) != true )
    {
      this.move( newX, newY, grid );
    }
  }
  
  public void moveToRandomEmptyLocation( Grid grid )
  {
    Cell newLocation = grid.getRandomEmptyCellWithinRangeOf( position.x, position.x, (int) MOVE_RANGE_X, (int) MOVE_RANGE_Y );
    this.move( newLocation.position.x, newLocation.position.y, grid );
  }
  
  public void render()
  {
    fill( turtleColor );
    noStroke();
    pushMatrix();
    float drawPositionX = (float) (((double) position.x) * cellWidth);
    float drawPositionY = (float) (((double) position.y) * cellHeight);
    
    translate( drawPositionX, drawPositionY );
    rect( 0.0, 0.0, (float) cellWidth, (float) cellHeight );
    popMatrix();
  }
  
  //  deposit item
  
  //  test ground for item

}