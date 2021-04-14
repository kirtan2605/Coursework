#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define STEP 0.1

int main(int argc,char *argv[])  //taking filepath arguement
{	
    double mean = atof(argv[1]);
    double std_dev = atof(argv[2]);
    double y=0.0;
    for(double x=-500; x<500 ; x=x+STEP)
    {   
        y=(1/std_dev*(sqrt(2*M_PI)))*(exp((-0.5)*(pow(((x-mean)/std_dev),2))));
        printf("%le\t%le\n",x,y);
    }
    y=0.0;
	return 0;

}
