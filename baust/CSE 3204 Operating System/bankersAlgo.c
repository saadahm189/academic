#include <stdio.h>  

int main()  
{  
    int n, m, i, j, k;  
    n = 4;                         // Number of processes  
    m = 3;                         // Number of resources  
    int alloc[4][3] = {{0, 1, 0},
                       {2, 0, 0},  
                       {3, 0, 2},  
                       {2, 1, 1},}; 
  
    int max[4][3] = {{7, 5, 3}, 
                     {3, 2, 2},  
                     {9, 0, 2}, 
                     {2, 2, 2},}; 
  
    int avail[3] = {3, 3, 4};  
    int need[4][3];  
    int f[4], ans[3], ind = 0;  
    int y = 0;  
  
    for (k = 0; k < n; k++)  
    {  
        f[k] = 0;  
    }  
    for (i = 0; i < n; i++)  
    {  
        for (j = 0; j < m; j++)  
            need[i][j] = max[i][j] - alloc[i][j];  
    }  
    for (k = 0; k < 4; k++)  
    {  
        for (i = 0; i < 4; i++)  
        {  
            if (f[i] == 0)  
            {  
                int flag = 0;
                printf("for1!");  
                for (j = 0; j < m; j++)  
                {  
                    printf("for2!");
                    if (need[i][j] > avail[j])  
                    {  
                        printf("if!");
                        flag = 1;  
                        break;  
                    }  
                }  
                if (flag == 0)  
                {  
                    ans[ind] = i;
                    ind++; 
                    for (y = 0; y < m; y++)  
                        avail[y] += alloc[i][y];  
                    f[i] = 1;  
                }  
            }  
        }  
    }  
    int saad = 1;  
    for (int i = 0; i < n; i++)  
    {  
        if (f[i] == 0)  
        {  
            saad = 0;  
            printf("The following system is not safe");  
            break;  
        }  
    }  
    if (saad == 1)  
    {  
        printf("Following is the SAFE Sequence\n");  
        for (i = 0; i < n ; i++)  
            printf(" P%d ->", ans[i]);  
        //printf(" P%d", ans[n - 1]);  
    }  
    return (0);  
}  