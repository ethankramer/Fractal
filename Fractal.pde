import java.util.*;
import java.lang.Math;

Random rng = new Random();
Point current;

/*    *****  Change variable "numPoints" to get different patterns  *****            */
int numPoints = 3;
// numPoints = 5 is my favorite :)

Point[] points = new Point[numPoints];

void setup() {
  size(900, 900);
  frameRate(100);
  
  for(int i=0; i<numPoints; i++){
    double theta = (2*Math.PI/numPoints)*i;
    points[i] = new Point(0,0,true,Integer.toString(i));
    double yCoord = Math.sin(theta)*(height/2)*0.9d+(height/2);
    double xCoord = Math.cos(theta)*(width/2)*0.9d+(width/2);
    points[i].changeX(xCoord);
    points[i].changeY(yCoord);
  }

  current = new Point(width/2, height/2, false, "");
  
  
}


void draw() {
  for(int i=0; i<numPoints; i++){
     points[i].drawPoint(); 
  }
  //a.drawPoint();
  //b.drawPoint();
  //c.drawPoint();
  
  for (int i=0; i<100; i++) {
    int rand = rng.nextInt(numPoints);
    current.drawPoint();
    current.movePoint(points[rand]);
  }
  
}

public class Point {
  private double x;
  private double y;
  private boolean given;
  private String label;

  //Constructor
  public Point(double xCoord, double yCoord, boolean give, String tag) {
    x = xCoord;
    y = yCoord;
    given = give;
    if (given) {
      label = tag;
    } else {
      label = "N/A";
    }
  }

  //Default Constructor
  public Point() {
    x = 0;
    y = 0;
    given = false;
    label = "N/A";
  }

  //Getter methods
  public double getX() {
    return this.x;
  }
  public double getY() {
    return this.y;
  }
  public boolean isGiven() {
    return given;
  }
  public String getLabel() {
    return this.label;
  }

  //Setter methods
  public void changeX(double xCoord) {
    this.x = xCoord;
  }
  public void changeY(double yCoord) {
    this.y = yCoord;
  }
  public void changeLabel(String tag) {
    this.label = tag;
  }

  public void movePoint(Point g) {
    //Move current point halfway to point G
    double gX = g.getX();
    double gY = g.getY();

    double difX = (gX-this.x)/2;
    double difY = (gY-this.y)/2;

    this.x += difX;
    this.y += difY;
  }

  public void drawPoint() {
    if (this.given) {
      fill(255, 0, 0);
      circle((float)this.x, (float)this.y, 10);
    } else {
      fill(0);
      circle((float)this.x, (float)this.y, 0.1);
    }
  }
}
