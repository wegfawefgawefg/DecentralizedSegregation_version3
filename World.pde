public class World
{
  Grid grid;
  ArrayList<Turtle> turtles;
  
  public World()
  {
    grid = new Grid();
    turtles = new ArrayList<Turtle>();
  }
  
  //  run all turtles
  public void runAllTurtles( World world )
  {
    for( int i = 0; i < turtles.size(); i++ )
    {
      turtles.get(i).tic( world );
    }
  }
  
  //  add some turtles
  public void addTurtle( Turtle turtle )
  {
    turtles.add( turtle );
  }
  
  //  add a turtle to a random location
  public void addTurtleToRandomLocation( Turtle turtle )
  {
    Cell newCell = grid.getRandomEmptyCellWithinRangeOf( 0, 0, Grid.GRID_WIDTH, Grid.GRID_HEIGHT );
    turtle.move( newCell.position.x, newCell.position.y, grid );
    turtles.add( turtle );
  }
  
  //  add list of turtles to empty locations
  public void addTurtlesToRandomEmptyCells( ArrayList<Turtle> turtlesToAdd )
  {
    ArrayList<Cell> turtlelessCells = grid.getAllTurtlelessCells();
    
    if( turtlelessCells == null )
    {
      return;
    }
    
    Collections.shuffle( turtlelessCells );
    
    
    for( Turtle turtleToAdd : turtlesToAdd )
    {
      // make sure there are spaces
      if( turtlelessCells.size() == 0 )
      {
        return;
      }
      
      //  pick a random turtleless cell
      Cell newCell = turtlelessCells.get( turtlelessCells.size() - 1 );
      
      //  move that turtle there
      turtleToAdd.move( newCell.position.x, newCell.position.y, grid );
      
      //  remove that turtlelessCell from the list
      turtlelessCells.remove( turtlelessCells.size() - 1 );
      
      //  add that turtle to the big world list of turtles
      turtles.add( turtleToAdd );
    }
  }
  
  public void render()
  {
    for( int y = 0; y < Grid.GRID_HEIGHT; y++ )
    {
      ArrayList<Cell> row = grid.grid.get(y);
      for( int x = 0; x < Grid.GRID_WIDTH; x++ )
      {
        Cell cell = row.get(x);
        for( Turtle turtle : cell.turtles )
        {
          if( turtle.satisfied == true )
          {
            turtle.render();          
          }

        }
      }
    }
  }
  
  //  run all cells in grid
}