/*
  sound Based light driver for SoonCon 2011 badge.
*/
#include "CharliplexingBadge.h"

#define DRAW_MODE 0
#define COMMAND_MODE 1
#define TEXT_MODE 2

#define CHAR_SPACE 0
#define CHAR_A 1
#define CHAR_B 2
#define CHAR_C 3
#define CHAR_D 4
#define CHAR_E 5
#define CHAR_F 6
#define CHAR_G 7
#define CHAR_H 8
#define CHAR_I 9
#define CHAR_J 10
#define CHAR_K 11
#define CHAR_L 12
#define CHAR_M 13
#define CHAR_N 14
#define CHAR_O 15
#define CHAR_P 16
#define CHAR_Q 17
#define CHAR_R 18
#define CHAR_S 19
#define CHAR_T 20
#define CHAR_U 21
#define CHAR_V 22
#define CHAR_W 23
#define CHAR_X 24
#define CHAR_Y 25
#define CHAR_Z 26
#define CHAR_EXCLAIM 27
#define CHAR_QUESTION 28
#define CHAR_PERIOD 29
#define CHAR_COMMA 30
#define CHAR_HASH 31
#define CHAR_AT 32

#define CHAR_FIN 63 

uint8_t letter_a[] = {
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  1,1,
  4,1,
  0,2,
  4,2,
  1,3,
  4,3,
  2,4,
  3,4,
  4,4,
  5,4,
  6,4,
  7,4
};
uint8_t letter_b[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  0,1,
  0,2,
  0,3,
  3,1,
  3,2,
  3,3,
  7,1,
  7,2,
  7,3,
  1,4,
  2,4,
  4,4,
  5,4,
  6,4
};
uint8_t letter_c[] = {
  0,1,
  0,2,
  0,3,
  1,4,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,1,
  7,2,
  7,3,
  6,4
};
uint8_t letter_d[] = {
  0,0,
  0,1,
  0,2,
  1,0,
  1,3,
  2,0,
  2,4,
  3,0,
  3,4,
  4,0,
  4,4,
  5,0,
  5,4,
  6,0,
  6,3,
  7,0,
  7,1,
  7,2,
  7,3
};
uint8_t letter_e[] = {
 0,0,
 1,0,
 2,0,
 3,0,
 4,0,
 5,0,
 6,0,
 7,0,
 0,1,
 0,2,
 0,3,
 0,4,
 3,1,
 3,2,
 3,3,
 7,1,
 7,2,
 7,3,
 7,4
};
uint8_t letter_f[] = {
 0,0,
 1,0,
 2,0,
 3,0,
 4,0,
 5,0,
 6,0,
 7,0,
 0,1,
 0,2,
 0,3,
 0,4,
 3,1,
 3,2,
 3,3
};
uint8_t letter_g[] = {
 0,2,
 0,3,
 2,0,
 3,0,
 4,0,
 5,0,
 6,0,
 1,1,
 1,4,
 4,3,
 4,4,
 5,4,
 6,4,
 7,1,
 7,2,
 7,3
};
uint8_t letter_h[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  0,4,
  1,4,
  2,4,
  3,4,
  4,4,
  5,4,
  6,4,
  7,4,
  3,1,
  3,2,
  3,3
};
uint8_t letter_i[] = {
 0,0,
 0,1,
 0,2,
 0,3,
 0,4,
 1,2,
 2,2,
 3,2,
 4,2,
 5,2,
 6,2,
 7,0,
 7,1,
 7,2,
 7,3,
 7,4
};
uint8_t letter_j[] = {
 0,0,
 0,1,
 0,2,
 0,3,
 0,4,
 1,3,
 2,3,
 3,3,
 4,3,
 5,0,
 5,3,
 6,0,
 6,3,
 7,1,
 7,2
};
uint8_t letter_k[] = {
 0,0,
 1,0,
 2,0,
 3,0,
 4,0,
 5,0,
 6,0,
 7,0,
 3,1,
 4,1,
 2,2,
 5,2,
 6,3,
 1,3,
 0,4,
 7,4
};
uint8_t letter_l[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  7,1,
  7,2,
  7,3,
  7,4
};
uint8_t letter_m[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  1,1,
  2,2,
  1,3,
  0,4,
  1,4,
  2,4,
  3,4,
  4,4,
  5,4,
  6,4,
  7,4
};
uint8_t letter_n[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  1,1,
  2,1,
  3,2,
  4,2,
  5,3,
  6,3,
  0,4,
  1,4,
  2,4,
  3,4,
  4,4,
  5,4,
  6,4,
  7,4
};
uint8_t letter_o[] = {
  0,1,
  0,2,
  0,3,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  1,4,
  2,4,
  3,4,
  4,4,
  5,4,
  6,4,
  7,1,
  7,2,
  7,3
};
uint8_t letter_p[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  0,1,
  0,2,
  0,3,
  1,4,
  2,4,
  3,4,
  4,1,
  4,2,
  4,3
};
uint8_t letter_q[] = {
  0,1,
  0,2,
  0,3,
  1,0,
  1,4,
  2,0,
  2,4,
  3,0,
  3,4,
  4,0,
  4,4,
  5,0,
  5,2,
  5,4,
  6,0,
  6,3,
  7,1,
  7,2,
  7,4
};
uint8_t letter_r[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,0,
  0,1,
  0,2,
  0,3,
  1,4,
  2,4,
  3,2,
  3,3,
  4,1,
  5,2,
  6,3,
  7,4
  
};
uint8_t letter_s[] = {
  0,1,
  0,2,
  0,3,
  1,0,
  1,4,
  2,0,
  3,1,
  3,2,
  4,3,
  5,4,
  6,4,
  7,0,
  7,1,
  7,2,
  7,3
};
uint8_t letter_t[] = {
  0,0,
  0,1,
  0,2,
  0,3,
  0,4,
  1,2,
  2,2,
  3,2,
  4,2,
  5,2,
  6,2,
  7,2
};
uint8_t letter_u[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,0,
  6,0,
  7,1,
  7,2,
  7,3,
  6,4,
  5,4,
  4,4,
  3,4,
  2,4,
  1,4,
  0,4
};
uint8_t letter_v[] = {
  0,0,
  1,0,
  2,0,
  3,0,
  4,0,
  5,1,
  6,1,
  7,2,
  6,3,
  5,3,
  4,4,
  3,4,
  2,4,
  1,4,
  0,4
};
uint8_t letter_w[] = {
 0,0,
 1,0,
 2,0,
 3,0,
 4,0,
 5,0,
 6,1,
 7,1,
 4,2,
 5,2,
 6,3,
 7,3,
 0,4,
 1,4,
 2,4,
 3,4,
 4,4,
 5,4
};
uint8_t letter_x[] = {
 0,0,
 1,1,
 2,1,
 0,4,
 1,3,
 2,3,
 3,2,
 4,1,
 4,3,
 5,1,
 5,3,
 5,1,
 6,4,
 6,0,
 7,4,
 7,0
};
uint8_t letter_y[] = {
 0,0,
 1,0,
 2,0,
 0,4,
 1,4,
 2,4,
 3,1,
 3,3,
 4,2,
 5,2,
 6,2,
 7,2
};
uint8_t letter_z[] = {
 0,0,
 0,1,
 0,2,
 0,3,
 0,4,
 1,4,
 2,3,
 3,2,
 4,2,
 5,1,
 6,0,
 7,0,
 7,1,
 7,2,
 7,3,
 7,4
};
uint8_t letter_exclaim[] = {
  0,1,
  0,2,
  0,3,
  1,0,
  1,4,
  2,1,
  2,3,
  3,1,
  3,3,
  4,2,
  5,2,
  7,2
};
uint8_t letter_question[] = {
 0,1,
 0,2,
 0,3,
 1,0,
 1,4,
 2,4,
 3,2,
 3,3,
 4,2,
 5,2,
 7,2
};
uint8_t letter_period[] = {
  7,2
};
uint8_t letter_comma[] = {
  7,2,
  5,2,
  5,3,
  6,3
};
uint8_t letter_hash[] = {
 0,1,
 1,1,
 2,1,
 3,1,
 4,1,
 5,1,
 6,1,
 7,1,
 0,3,
 1,3,
 2,3,
 3,3,
 4,3,
 5,3,
 6,3,
 7,3,
 1,0,
 4,0,
 2,2,
 5,2,
 3,4,
 6,4
};
uint8_t letter_at[] = {
 0,1,
 0,2,
 0,3,
 1,0,
 1,4,
 2,0,
 2,3,
 2,4,
 3,0,
 3,2,
 3,4,
 4,0,
 4,2,
 4,4,
 5,0,
 5,3,
 5,4,
 6,0,
 7,1,
 7,2,
 7,3
};



#define ONCOUNT_THRESHOLD 130
#define COMMANDCOUNT_THRESHOLD 3
#define RESET_THRESHOLD 8
#define RIGHTTRIGGER_THRESHOLD 110

int oldLeftState = 0;
int oldRightState = 0;
int leftOn = -1;
int curLight[] = {0,0};
int onCount = 0;
int commandCount = 0;
int rightOnFor = 0;
int mode = DRAW_MODE;
char textOutput[140];
int textOutputSize = 0;

void setup()                    // run once, when the sketch starts
{
  LedSign::Init();
}

int charString = 0;
int charPos = 0;
void outputScrollingText() {
  int scrollLength = 14;
  if(textOutputSize*6 > 14) scrollLength = textOutputSize*6;
  for(int j=-14;j<scrollLength;j++) { 
    wipeScreen();
    for(int i=0;i<textOutputSize;i++) {
      displayLetter(textOutput[i], i*6-j);
    }
    delay(80);
  }
  textOutputSize = 0;
  wipeScreen();
}
void displayLetter(char letter, int offset) {
  switch(letter) {
    case 'A': {
      for(uint8_t i = 0; i < 18; i++)
      {
        LEDSet(letter_a[i*2+1]+offset,letter_a[i*2],1);    
      }
      break;
    }
    case 'B': {
      for(uint8_t i = 0; i < 22; i++)
      {
        LEDSet(letter_b[i*2+1]+offset,letter_b[i*2],1);    
      }
      break;
    }
    case 'C': {
      for(uint8_t i = 0; i < 14; i++)
      {
        LEDSet(letter_c[i*2+1]+offset,letter_c[i*2],1);    
      }
      break;
    }
    case 'D': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_d[i*2+1]+offset,letter_d[i*2],1);    
      }
      break;
    }
    case 'E': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_e[i*2+1]+offset,letter_e[i*2],1);    
      }
      break;
    }
    case 'F': {
      for(uint8_t i = 0; i < 15; i++)
      {
        LEDSet(letter_f[i*2+1]+offset,letter_f[i*2],1);    
      }
      break;
    }
    case 'G': {
      for(uint8_t i = 0; i < 16; i++)
      {
        LEDSet(letter_g[i*2+1]+offset,letter_g[i*2],1);    
      }
      break;
    }
    case 'H': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_h[i*2+1]+offset,letter_h[i*2],1);    
      }
      break;
    }
    case 'I': {
      for(uint8_t i = 0; i < 16; i++)
      {
        LEDSet(letter_i[i*2+1]+offset,letter_i[i*2],1);    
      }
      break;
    }
    case 'J': {
      for(uint8_t i = 0; i < 15; i++)
      {
        LEDSet(letter_j[i*2+1]+offset,letter_j[i*2],1);    
      }
      break;
    }
    case 'K': {
      for(uint8_t i = 0; i < 16; i++)
      {
        LEDSet(letter_k[i*2+1]+offset,letter_k[i*2],1);    
      }
      break;
    }
    case 'L': {
      for(uint8_t i = 0; i < 12; i++)
      {
        LEDSet(letter_l[i*2+1]+offset,letter_l[i*2],1);    
      }
      break;
    }
    case 'M': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_m[i*2+1]+offset,letter_m[i*2],1);    
      }
      break;
    }
    case 'N': {
      for(uint8_t i = 0; i < 22; i++)
      {
        LEDSet(letter_n[i*2+1]+offset,letter_n[i*2],1);    
      }
      break;
    }
    case 'O': {
      for(uint8_t i = 0; i < 18; i++)
      {
        LEDSet(letter_o[i*2+1]+offset,letter_o[i*2],1);    
      }
      break;
    }
    case 'P': {
      for(uint8_t i = 0; i < 17; i++)
      {
        LEDSet(letter_p[i*2+1]+offset,letter_p[i*2],1);    
      }
      break;
    }
    case 'Q': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_q[i*2+1]+offset,letter_q[i*2],1);    
      }
      break;
    }
    case 'R': {
      for(uint8_t i = 0; i < 19; i++)
      {
        LEDSet(letter_r[i*2+1]+offset,letter_r[i*2],1);    
      }
      break;
    }
    case 'S': {
      for(uint8_t i = 0; i < 15; i++)
      {
        LEDSet(letter_s[i*2+1]+offset,letter_s[i*2],1);    
      }
      break;
    }
    case 'T': {
      for(uint8_t i = 0; i < 12; i++)
      {
        LEDSet(letter_t[i*2+1]+offset,letter_t[i*2],1);    
      }
      break;
    }
    case 'U': {
      for(uint8_t i = 0; i < 17; i++)
      {
        LEDSet(letter_u[i*2+1]+offset,letter_u[i*2],1);    
      }
      break;
    }
    case 'V': {
      for(uint8_t i = 0; i < 15; i++)
      {
        LEDSet(letter_v[i*2+1]+offset,letter_v[i*2],1);    
      }
      break;
    }
    case 'W': {
      for(uint8_t i = 0; i < 18; i++)
      {
        LEDSet(letter_w[i*2+1]+offset,letter_w[i*2],1);    
      }
      break;
    }
    case 'X': {
      for(uint8_t i = 0; i < 16; i++)
      {
        LEDSet(letter_x[i*2+1]+offset,letter_x[i*2],1);    
      }
      break;
    }
  
    case 'Y': {
      for(uint8_t i = 0; i < 12; i++)
      {
        LEDSet(letter_y[i*2+1]+offset,letter_y[i*2],1);    
      }
      break;
    }
  
    case 'Z': {
      for(uint8_t i = 0; i < 16; i++)
      {
        LEDSet(letter_z[i*2+1]+offset,letter_z[i*2],1);    
      }
      break;
    }
    case '!': {
      for(uint8_t i = 0; i < 12; i++)
      {
        LEDSet(letter_exclaim[i*2+1]+offset,letter_exclaim[i*2],1);    
      }
      break;
    }
  
    case '?': {
      for(uint8_t i = 0; i < 11; i++)
      {
        LEDSet(letter_question[i*2+1]+offset,letter_question[i*2],1);    
      }
      break;
    }
  
    case '.': {
      for(uint8_t i = 0; i < 1; i++)
      {
        LEDSet(letter_period[i*2+1]+offset,letter_period[i*2],1);    
      }
      break;
    }
  
    case ',': {
      for(uint8_t i = 0; i < 4; i++)
      {
        LEDSet(letter_comma[i*2+1]+offset,letter_comma[i*2],1);    
      }
      break;
    }
    case '@': {
      for(uint8_t i = 0; i < 22; i++)
      {
        LEDSet(letter_at[i*2+1]+offset,letter_at[i*2],1);    
      }
      break;
    }
    case '#': {
      for(uint8_t i = 0; i < 22; i++)
      {
        LEDSet(letter_hash[i*2+1]+offset,letter_hash[i*2],1);    
      }
      break;
    }
  }
};

void wipeScreen() {
  for(uint8_t y = 0; y < 8; y++)
    for(uint8_t x = 0; x < 15; x++)
    {
      LEDSet(x,y,0);    
    }
};

void LEDSet(int x, int y, int colour) {
  if(x>-1 && y>-1 && x < 15 && y < 8) {
    LedSign::Set(x,y,colour);
  }
}


int threshold = 5;
int zeroThreshold = 40;
int numOfZeros[] = {0,0};
bool readState(int pin) {
    int sensorValue = analogRead(pin);
    if(pin == A4) pin = 0;
    if(pin == A5) pin = 1;
    if(sensorValue > threshold) {
      numOfZeros[pin]=0;
      return 1;
    } else {
      numOfZeros[pin]++;
      if(numOfZeros[pin] > zeroThreshold) {
        return 0;
      }
    }
    return 1;
}

void resetSystem() {
  oldLeftState = 0;
  oldRightState = 0;
  leftOn = -1;
  curLight[0] = 0; curLight[1] = 0;
  onCount = 0;
  commandCount = 0;
  rightOnFor = 0;
  mode = DRAW_MODE;
  wipeScreen();
}

int cmdString = 0;
int cmdPos = 0;
void loop()                     // run over and over again
{
  int leftPin = A4;
  int rightPin = A5;
  int leftState = readState(leftPin);
  int rightState = readState(rightPin);
  if(oldRightState == 1 && rightState == 0 && rightOnFor > RIGHTTRIGGER_THRESHOLD) {
    switch(mode) {
      case COMMAND_MODE: {
        cmdString = cmdString << 1;
        cmdString += leftOn;
        cmdPos += 1;
        if(cmdPos >= 4) {
          switch(cmdString) {
            case 8: {
              mode = TEXT_MODE;
              charPos = 0;
              charString = 0;
              textOutputSize = 0;
              wipeScreen();
              break;
            }
            default: {
              mode = DRAW_MODE;
              break;
            }
          }
          cmdPos = 0;
          cmdString = 0;
          curLight[0] = -1;
          curLight[1] = 0;
          break;
        }
      }
      case TEXT_MODE: {
        charString = charString << 1;
        charString += leftOn;
        charPos += 1;
        if(charPos >= 6) {
          switch(charString) {
            case CHAR_SPACE: {
              textOutput[textOutputSize] = ' ';
              textOutputSize += 1;
              break;
            }
            case CHAR_A: {
              textOutput[textOutputSize] = 'A';
              textOutputSize += 1;
              break;
            }
            case CHAR_B: {
              textOutput[textOutputSize] = 'B';
              textOutputSize += 1;
              break;
            }
            case CHAR_C: {
              textOutput[textOutputSize] = 'C';
              textOutputSize += 1;
              break;
            }
            case CHAR_D: {
              textOutput[textOutputSize] = 'D';
              textOutputSize += 1;
              break;
            }
            case CHAR_E: {
              textOutput[textOutputSize] = 'E';
              textOutputSize += 1;
              break;
            }
            case CHAR_F: {
              textOutput[textOutputSize] = 'F';
              textOutputSize += 1;
              break;
            }
            case CHAR_G: {
              textOutput[textOutputSize] = 'G';
              textOutputSize += 1;
              break;
            }
            case CHAR_H: {
              textOutput[textOutputSize] = 'H';
              textOutputSize += 1;
              break;
            }
            case CHAR_I: {
              textOutput[textOutputSize] = 'I';
              textOutputSize += 1;
              break;
            }
            case CHAR_J: {
              textOutput[textOutputSize] = 'J';
              textOutputSize += 1;
              break;
            }
            case CHAR_K: {
              textOutput[textOutputSize] = 'K';
              textOutputSize += 1;
              break;
            }
            case CHAR_L: {
              textOutput[textOutputSize] = 'L';
              textOutputSize += 1;
              break;
            }
            case CHAR_M: {
              textOutput[textOutputSize] = 'M';
              textOutputSize += 1;
              break;
            }
            case CHAR_N: {
              textOutput[textOutputSize] = 'N';
              textOutputSize += 1;
              break;
            }
            case CHAR_O: {
              textOutput[textOutputSize] = 'O';
              textOutputSize += 1;
              break;
            }
            case CHAR_P: {
              textOutput[textOutputSize] = 'P';
              textOutputSize += 1;
              break;
            }
            case CHAR_Q: {
              textOutput[textOutputSize] = 'Q';
              textOutputSize += 1;
              break;
            }
            case CHAR_R: {
              textOutput[textOutputSize] = 'R';
              textOutputSize += 1;
              break;
            }
            case CHAR_S: {
              textOutput[textOutputSize] = 'S';
              textOutputSize += 1;
              break;
            }
            case CHAR_T: {
              textOutput[textOutputSize] = 'T';
              textOutputSize += 1;
              break;
            }
            case CHAR_U: {
              textOutput[textOutputSize] = 'U';
              textOutputSize += 1;
              break;
            }
            case CHAR_V: {
              textOutput[textOutputSize] = 'V';
              textOutputSize += 1;
              break;
            }
            case CHAR_W: {
              textOutput[textOutputSize] = 'W';
              textOutputSize += 1;
              break;
            }
            case CHAR_X: {
              textOutput[textOutputSize] = 'X';
              textOutputSize += 1;
              break;
            }
            case CHAR_Y: {
              textOutput[textOutputSize] = 'Y';
              textOutputSize += 1;
              break;
            }
            case CHAR_Z: {
              textOutput[textOutputSize] = 'Z';
              textOutputSize += 1;
              break;
            }
            case CHAR_EXCLAIM: {
              textOutput[textOutputSize] = '!';
              textOutputSize += 1;
              break;
            }
            case CHAR_QUESTION: {
              textOutput[textOutputSize] = '?';
              textOutputSize += 1;
              break;
            }
            case CHAR_PERIOD: {
              textOutput[textOutputSize] = '.';
              textOutputSize += 1;
              break;
            }
            case CHAR_COMMA: {
              textOutput[textOutputSize] = ',';
              textOutputSize += 1;
              break;
            }
            case CHAR_HASH: {
              textOutput[textOutputSize] = '#';
              textOutputSize += 1;
              break;
            }
            case CHAR_AT: {
              textOutput[textOutputSize] = '@';
              textOutputSize += 1;
              break;
            }
            case CHAR_FIN: {
             outputScrollingText();
             charString = 0;
             charPos = 0;
             mode = DRAW_MODE;
             break;
            }
          }
          charString = 0;
          charPos = 0;
        }
      }
    }
    curLight[0] += 1;
    if(curLight[0] >= 8) {
      curLight[0] = 0;
      curLight[1] += 1;
      if(curLight[1] >= 15) {
        curLight[1] = 0;       
      }
    }  
    onCount = 0;
    commandCount = 0;
    rightOnFor = 0;
    leftOn = -1;
    }
    if(rightState == 1) {
      rightOnFor += 1;
    } else {
      rightOnFor = 0;
    }
    if(oldRightState == 0 && rightState == 1) {
      leftOn = 0;
      onCount = 0;
    }
    oldRightState = rightState;
    if(oldRightState == 1 && leftState == 1) {
      onCount += 1;
      if(onCount > ONCOUNT_THRESHOLD) {
        leftOn = 1;
      }
    }
    if(oldRightState == 0 && oldLeftState == 0 && leftState == 1 && rightState == 0) {
      commandCount += 1;
      if(commandCount > COMMANDCOUNT_THRESHOLD) {
        mode = COMMAND_MODE;
        leftOn = -1;
        curLight[0] = 0;
        curLight[1] = 0;
        onCount = 0;
        rightOnFor = 0;
      }
      if(commandCount > RESET_THRESHOLD) {
        commandCount = 0;
        resetSystem();
      }
    }
    oldLeftState = leftState;
    
    if(leftOn != -1) {
      LEDSet(curLight[1],curLight[0],leftOn);
    }
}
