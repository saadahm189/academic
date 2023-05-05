#include <stdio.h>

int main()
{
    int n = 4;
    int m = 3;
    int i, j, flag, indx, z, s;
    indx = 0;
    int ans[4];
    int complete[4];
    for (j = 0; j < 4; j++)
    {
        complete[j] = 0;
    }
    int allocation[4][3] = {
        {0, 1, 0},
        {2, 0, 0},
        {3, 0, 2},
        {2, 1, 1},
    };
    int max[4][3] = {
        {7, 5, 3},
        {3, 2, 2},
        {9, 0, 2},
        {2, 2, 2},
    };
    int need[4][3];
    int avilable[3] = {3, 3, 4};

    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 3; j++)
        {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }
    // Print matrix
    for (i = 0; i < 4; i++)
    {
        for (j = 0; j < 3; j++)
        {
            printf("%d ", need[i][j]);
        }
        printf("\n");
    }
    // Main calculation:
    for (s = 0; s < 4; s++)
    {
        for (i = 0; i < 4; i++)
        {
            if (complete[i] == 0)
            {
                flag = 0;
                //printf("for1!");
                for (j = 0; j < 3; j++)
                {
                    //printf("for2!");
                    if (need[i][j] > avilable[j])
                    {
                       // printf("if!");
                        flag = 1;
                        break;
                    }
                }
                if (flag == 0)
                {
                    ans[indx] = i;
                    indx++;
                    for (z = 0; z < 3; z++)
                    {
                        avilable[z] = avilable[z] + allocation[i][z];
                    }
                    complete[i] = 1;
                }
            }
        }
    }
    int saad = 1;
    for (i = 0; i < 4; i++)
    {
        if (complete[i] == 0)
        {
            saad = 0;
            printf("dead");
            break;
        }
    }
    if (saad == 1)
    {
        for (i = 0; i < 4; i++)
        {
            printf("P%d-", ans[i]);
        }
    }

    return 0;
}