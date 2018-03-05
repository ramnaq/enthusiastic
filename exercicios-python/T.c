#include <stdio.h>

main()
{
  int n, i, t, ligadoAte, acumulado;
  
  ligadoAte = 0;
  acumulado = 0;
  
  scanf("%d", &n);
  
  for(i = 0; i < n; i ++) {
    scanf("%d", &t);
    if (t >= ligadoAte)
      acumulado += 10; 
    else
      acumulado += t + 10 - ligadoAte;
    ligadoAte = t + 10;
  }
  printf("%d\n", acumulado);
}

