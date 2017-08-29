public class Grid
{
  public static final int GRID_WIDTH = 100;
  public static final int GRID_HEIGHT = 100;
  
  ArrayList<ArrayList<Cell>> grid;
  
  public Grid()
  {
    grid = new ArrayList<ArrayList<Cell>>();
    
    for( int y = 0; y < GRID_HEIGHT; y++ )
    {
      ArrayList<Cell> newRow = new ArrayList<Cell>();      
      for( int x = 0; x < GRID_WIDTH; x++ )
      {
        Cell newCell = new Cell( x, y );
        newRow.add( newCell );
      }
      grid.add( newRow );
    }
  }
  
  //  swap cell grid frames
  
  //  check for turtle at location
  public boolean isTurtleAtCellLocation( int x, int y )
  {
     return grid.get(y).get(x).hasTurtles();
  }
  
  //  get random location certain distance away from other location
  //  //  this location must be within the grids dimensions
  public Cell getRandomCellWithinRangeOf( int x, int y, double xRange, double yRange )
  {
    ArrayList<Cell> cellsWithinRange = new ArrayList<Cell>();
    
    //  determine the search space
    int upperLeftX = (int) maxDouble( 0, x - xRange );
    int upperLeftY = (int) maxDouble( 0, y - yRange );
    int lowerRightX = (int) minDouble( GRID_WIDTH - 1, x + xRange );
    int lowerRightY = (int) minDouble( GRID_HEIGHT - 1, y + yRange );
    
    //  add all cells within range to a list
    for( int iy = upperLeftY;iy <= lowerRightY; iy++ )
    { 
      for( int ix = upperLeftX; ix <= lowerRightX; ix++ )
      {
        cellsWithinRange.add( grid.get(y).get(x) );
      }
    }
    
    Cell randomCellWithinRange = null;
    //  randomly pick a cell from that list
    if( cellsWithinRange.size() != 0 )
    {
      int randomCellWithinRangeIndex = randy.nextInt( cellsWithinRange.size() );
      randomCellWithinRange = cellsWithinRange.get( randomCellWithinRangeIndex );
    }
    
    return randomCellWithinRange;
  }
  
  //  get random location certain distance away from other location that is empty
  //  //  this location must be within the grids dimensions
  public Cell getRandomEmptyCellWithinRangeOf( int x, int y, double xRange, double yRange )
  {
     ArrayList<Cell> cellsWithinRange = new ArrayList<Cell>();
    
    //  determine the search space
    int upperLeftX = (int) maxDouble( 0, x - xRange );
    int upperLeftY = (int) maxDouble( 0, y - yRange );
    int lowerRightX = (int) minDouble( GRID_WIDTH - 1, x + xRange );
    int lowerRightY = (int) minDouble( GRID_HEIGHT - 1, y + yRange );
    
    //  add all cells within range to a list
    for( int iy = upperLeftY; iy <= lowerRightY; iy++ )
    { 
      for( int ix = upperLeftX; ix <= lowerRightX; ix++ )
      {
        if( grid.get(iy).get(ix).hasTurtles() == false )
        {
          cellsWithinRange.add( grid.get(iy).get(ix) );
        }
      }
    }
    
    Cell randomCellWithinRange = null;
    //  randomly pick a cell from that list
    if( cellsWithinRange.size() != 0 )
    {
      int randomCellWithinRangeIndex = randy.nextInt( cellsWithinRange.size() );
      randomCellWithinRange = cellsWithinRange.get( randomCellWithinRangeIndex );
    }
    
    return randomCellWithinRange;
  }
  
  public ArrayList<Cell> getAllTurtlelessCells()
  {
     ArrayList<Cell> turtlelessCells = new ArrayList<Cell>();
    
    //  add all empty cells to a list
    for( ArrayList<Cell> row : grid )
    { 
      {
        for( Cell cellCandidate : row )
        {
          if( cellCandidate.hasTurtles() == false )
          {
            turtlelessCells.add( cellCandidate );
          }
        }
      }
    }
    
    return turtlelessCells;
  }
  
  
  public int countTurtlesOfTypeInRange( int x, int y, double xRange, double yRange, int searchType )
  {
    ArrayList<Cell> cellsWithinRange = new ArrayList<Cell>();
    
    //  determine the search space
    int upperLeftX = (int) maxDouble( 0, x - xRange );
    int upperLeftY = (int) maxDouble( 0, y - yRange );
    int lowerRightX = (int) minDouble( GRID_WIDTH - 1, x + xRange );
    int lowerRightY = (int) minDouble( GRID_HEIGHT - 1, y + yRange );
    
    //  add all cells within range to a list
    for( int iy = upperLeftY; iy <= lowerRightY; iy++ )
    { 
      for( int ix = upperLeftX; ix <= lowerRightX; ix++ )
      {
        cellsWithinRange.add( grid.get(iy).get(ix) );
      }
    }
    
    int numTurtlesOfSearchType = 0;
    for( Cell cell : cellsWithinRange )
    {
      for( Turtle turtle : cell.turtles )
      {
        if( turtle.type == searchType )
        {
          numTurtlesOfSearchType++;
        }
      }
    }
    
    //  dont count yourself
    if( numTurtlesOfSearchType > 0 )
    {
      numTurtlesOfSearchType -= 1;
    }
    
    return numTurtlesOfSearchType;
  }
  
}