// mario.c
// Print Mario's pyramid

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    // Prompt user for pyramid's height
    int height;
    do
    {
        height = get_int("Height: ");
    }
    while (height < 0 || height > 23);

    // Calculate pyramid's width
    int width = height + 1;

    // Iterate over pyramid's rows
    for (int i = 0; i < height; i++)
    {
        // Iterate over pyramid's columns
        for (int j = 0; j < width; j++)
        {
            // Print space
            if (j < width - 2 - i)
            {
                printf(" ");
            }

            // Print hash
            else
            {
                printf("#");
            }
        }

        // Print newline
        printf("\n");
    }
}
