#include <float.h>

int main(){
  printf("Float epsilon:\n");
  printf("%.20E\n",FLT_EPSILON);
  printf("Double epsilon:\n");
  printf("%.20E\n",DBL_EPSILON);

  printf("Float max:\n");
  printf("%.20E\n",FLT_MAX);
  printf("Double max:\n");
  printf("%.20E\n",DBL_MAX);
}
