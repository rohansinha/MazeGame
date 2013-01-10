void makeMaze()
{
  background(0);
  for (int i = 0; i < (f*f*f); i++)
  {
    p = 0;
    if (c > 0) if (maze[c-1][d] == 0) path[p++] = 1;
    if (d > 0) if (maze[c][d-1] == 0) path[p++] = 2;
    if (c < e) if (maze[c+1][d] == 0) path[p++] = 4;
    if (d < e) if (maze[c][d+1] == 0) path[p++] = 8;

    if (p > 0) 
    {
      p = path[floor(random(p))];
      //println(p);
      maze[c][d] += p;
      switch(p) 
      {
        case 1:
          maze[--c][d] = 4;
          fill(255);
          rect(c*s+1, d*s+1, h, w);
          break;
        case 2:
          maze[c][--d] = 8;
          fill(255);
          rect(c*s+1, d*s+1, w, h);
          break;
        case 4:
          fill(255);
          rect(c*s+1, d*s+1, h, w);
          maze[++c][d] = 1;
          break;
        case 8:
          fill(255);
          rect(c*s+1, d*s+1, w, h);
          maze[c][++d] = 2;
          break;
      }
    } else {
      p = 0;
      while (p == 0) 
      {
        c = floor(random(f));
        d = floor(random(f));
        p = maze[c][d];
      }
    }
  }
  save("maze.png");
  play = true;
  intro = false;
}
