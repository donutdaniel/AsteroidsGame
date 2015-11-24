SpaceShip poop;
Star[] poops = new Star[200];
Asteroids[] pooped = new Asteroids[20];

PImage bg;
boolean up, down, left, right;
public void setup() 
{
  size(1200, 900);
  poop = new SpaceShip();
  for(int i=0 ; i<poops.length ;i++){
    poops[i] = new Star();
  }
  for(int i=0 ; i<pooped.length ; i++){
    pooped[i] = new Asteroids();
  }

  bg = loadImage("Stars1.jpg");
}
public void draw() 
{
  imageMode(CENTER);
  image(bg,600,450,1920,1000);
  //background(0);
  for(int i=0;i<poops.length;i++){
    poops[i].show();
  }

  for(int i=0 ; i<pooped.length ; i++){
    pooped[i].move();
    pooped[i].show();
  }
  if(up==true) poop.accelerate(.3);
  if(down==true) poop.accelerate(-.3);
  if(left==true) poop.rotate(-10);
  if(right==true) poop.rotate(10);
  poop.move();
  poop.show();
}
public void keyPressed() {
  if (key=='a') left=true;
  if (key=='d') right=true;
  if (key=='s') down=true;
  if (key=='w') up=true;
  if (key=='h') {
    poop.setX((int)(Math.random()*1201));
    poop.setY((int)(Math.random()*951));
    poop.setDirectionX(0);
    poop.setDirectionY(0);
    poop.setPointDirection((int)(Math.random()*361));
  }
}
  public void keyReleased() {
    if(key=='w') up=false;
    if(key=='a') left=false;
    if(key=='s') down=false;
    if(key=='d') right=false;
  }

class Star {
  private float x,y;
     public Star(){
        x=(float)Math.random()*1201;
        y=(float)Math.random()*951;
    }

      public void show(){
        ellipse(x,y,1,1);
      }
}

class Asteroids extends Floater
{
  int rotate1;
    public Asteroids(){
      corners=6;
      // int[] xA = {(int)(Math.random()*16)-30,(int)(Math.random()*16)+15,(int)(Math.random()*11)+20,(int)(Math.random()*16)+15,(int)(Math.random()*16)-30,(int)(Math.random()*11)-40};
      // int[] yA = {(int)(Math.random()*16)-30,(int)(Math.random()*16)-30,0,(int)(Math.random()*16)+15,(int)(Math.random()*16)+15,0};
      int[] xA = new int[6];
      int[] yA = new int[6];
      int constant = (int)(Math.random()*3);
      if(constant==2){
        xA[0]=(int)(Math.random()*16)-40;
        xA[1]=(int)(Math.random()*16)+25;
        xA[2]=(int)(Math.random()*11)+30;
        xA[3]=(int)(Math.random()*16)+25;
        xA[4]=(int)(Math.random()*16)-40;
        xA[5]=(int)(Math.random()*11)-50;
        yA[0]=(int)(Math.random()*16)-40;
        yA[1]=(int)(Math.random()*16)-40;
        yA[2]=0;
        yA[3]=(int)(Math.random()*16)+25;
        yA[4]=(int)(Math.random()*16)+25;
        yA[5]=0;
      } else if(constant==1){
        xA[0]=(int)(Math.random()*16)-30;
        xA[1]=(int)(Math.random()*16)+15;
        xA[2]=(int)(Math.random()*11)+20;
        xA[3]=(int)(Math.random()*16)+15;
        xA[4]=(int)(Math.random()*16)-30;
        xA[5]=(int)(Math.random()*11)-40;
        yA[0]=(int)(Math.random()*16)-30;
        yA[1]=(int)(Math.random()*16)-30;
        yA[2]=0;
        yA[3]=(int)(Math.random()*16)+15;
        yA[4]=(int)(Math.random()*16)+15;
        yA[5]=0;
      } else {
        xA[0]=(int)(Math.random()*16)-20;
        xA[1]=(int)(Math.random()*16)+5;
        xA[2]=(int)(Math.random()*11)+10;
        xA[3]=(int)(Math.random()*16)+5;
        xA[4]=(int)(Math.random()*16)-20;
        xA[5]=(int)(Math.random()*11)-30;
        yA[0]=(int)(Math.random()*16)-20;
        yA[1]=(int)(Math.random()*16)-20;
        yA[2]=0;
        yA[3]=(int)(Math.random()*16)+5;
        yA[4]=(int)(Math.random()*16)+5;
        yA[5]=0;
      }
      xCorners = xA;
      yCorners = yA;
      myColor = 135;
      myCenterX = (double)Math.random()*1201;
      myCenterY = (double)Math.random()*951;
      myDirectionX = (double)(Math.random()*5)-2;
      myDirectionY = (double)(Math.random()*5)-2;
      myPointDirection= (double)(Math.random()*361);
      rotate1=(int)(Math.random()*11);
    }
    public void setX (int x){
      myCenterX=x;
    }
    public int getX(){
      return (int)(myCenterX);
    }
    public void setY (int y){
      myCenterY=y;
    }
    public int getY(){
      return (int)(myCenterY);
    }
    public void setDirectionX(double x){
      myDirectionX=x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY=y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection=degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }
    public void move(){
      rotate(rotate1);
      super.move();  
    }
    public void show ()  //Draws the floater at the current position  
    {             
    fill(myColor);   
    stroke(0);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
}

class SpaceShip extends Floater
{  
    public SpaceShip() {
      corners = 4;
      int[] xS = {-8,16,-8,-2};
      int[] yS = {-8,0,8,0};
      xCorners = xS;
      yCorners = yS;
      myColor = 225;
      myCenterX = 500;
      myCenterY = 500;
      myDirectionX = 0;
    }
    public void setX (int x){
      myCenterX=x;
    }
    public int getX(){
      return (int)(myCenterX);
    }
    public void setY (int y){
      myCenterY=y;
    }
    public int getY(){
      return (int)(myCenterY);
    }
    public void setDirectionX(double x){
      myDirectionX=x;
    }
    public double getDirectionX(){
      return myDirectionX;
    }
    public void setDirectionY(double y){
      myDirectionY=y;
    }
    public double getDirectionY(){
      return myDirectionY;
    }
    public void setPointDirection(int degrees){
      myPointDirection=degrees;
    }
    public double getPointDirection(){
      return myPointDirection;
    }

      public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myDirectionX=myDirectionX/friction;
    myDirectionY=myDirectionY/friction;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
}


abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{  
  protected float friction=1.008;
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)  
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move () //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    myDirectionX=myDirectionX;
    myDirectionY=myDirectionY;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 

