import java.util.Random;
import java.util.*;

public Random randy;

World world;

public double turtleDensity = 0.999;

public double worldArea;
public int numTurtles;
public int numType1Turtles;
public int numType2Turtles;

public double cellWidth;
public double cellHeight;

public void setup()
{
  frameRate( 1000 );
  //size( 400, 400, P2D );
  fullScreen( P2D );
  
  randy = new Random();

  world = new World();
  
  //  set up specs for world
  worldArea = Grid.GRID_HEIGHT * Grid.GRID_WIDTH;
  numTurtles = (int) (worldArea * turtleDensity);
  numType1Turtles = numTurtles / 2;
  numType2Turtles = numTurtles - numType1Turtles;
  
  cellWidth = ((double) width) / ((double) Grid.GRID_WIDTH);
  cellHeight = ((double) height) / ((double) Grid.GRID_HEIGHT);
  
  //  make some type 1 turtles
  int type1Type = 1;
  color type1Color = color( 255, 0, 0 );
  ArrayList<Turtle> type1Turtles = new ArrayList<Turtle>();
  for( int i = 0; i < numType1Turtles; i++ )
  {
    Turtle newTurtle = new Turtle( type1Type, type1Color );
    type1Turtles.add( newTurtle );
  }
  world.addTurtlesToRandomEmptyCells( type1Turtles );
  
  
  //  make some type 2 turtles
  int type2Type = 2;
  color type2Color = color( 255, 255, 0 );
  ArrayList<Turtle> type2Turtles = new ArrayList<Turtle>();
  for( int i = 0; i < numType1Turtles; i++ )
  {
    Turtle newTurtle = new Turtle( type2Type, type2Color );
    type2Turtles.add( newTurtle );
  }
  world.addTurtlesToRandomEmptyCells( type2Turtles );
  
}

public void draw()
{
  background( 0, 0, 0 );
  
  world.render();

  world.runAllTurtles( world );
}

public double maxDouble( double a, double b )
{
  if( a > b )
  {
    return a;
  }
  return b;
}

public double minDouble( double a, double b )
{
  if( a < b )
  {
    return a;
  }
  return b;
}