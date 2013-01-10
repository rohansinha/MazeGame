int change1(int a)
{
  if (a < width) return a;
  else return(a % width);
}

void keyTyped()
{
  if (key == CODED && scr == 0)
  {
    if (keyCode == ENTER || keyCode == RETURN)
    {
      scr = 1;
    }
  }
  
  if(scr == 0 && (key == 'R' || key == 'r'))
  {
    makeMaze();
  }
}
void mouseDragged()
{
  fill(150);
  ellipse(moveX, moveY, playSize, playSize);
  moveX = mouseX;
  moveY = mouseY;
  checkStat();
}
void checkStat()
{
  int a = mouseX;
  int b = mouseY;
  for (int i = 0; i < width; i++)
  {
    for (int j = 0; j < height; j++)
    {
      if (a <= 1 || a >= width-1 || b <= 1 || b >= height-1)
      {
        //noLoop();
        println("You Win!!!");
        done = true;
        won = true;
      }
      if (a == blacklist[i][j] && b == i)
      {
        if (a <= 2 || a >= width-2 || b <= 2 || b >= height-2)
        {
          //noLoop();
          println("You Win!!!");
          done = true;
          won = true;
        } 
        else {
          //noLoop();
          println("You Lose");
          done = true;
          won = false;
        }
      }
    }
  }
}

void stop()
{
  // always close Minim audio classes when you are done with them
  gameAudio.close();
  input.close();
  minim.stop();
  super.stop();
}
