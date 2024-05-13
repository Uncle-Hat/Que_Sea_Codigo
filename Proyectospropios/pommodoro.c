
#include <stdio.h>
#include <time.h>
#include <unistd.h>

void start_timer(int duration) {
    int seconds = duration;  // Set the time in seconds for your timer

    clock_t start_time = clock();  // Get the start time

    while (1) {
        clock_t end_time = clock();  // Get the current time

        // Calculate the elapsed time in seconds
        int elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;

        // If the elapsed time is greater than or equal to the set time, break the loop
        if (elapsed_time >= seconds) {
            break;
        }
    }
}

int main() {
    int i;
    printf("Enter the number of pomodoros you want to do: ");
    scanf("%d", &i);    
    while (i != 0) {
        printf("Start working for 25 minutes.\n");
        start_timer(25 * 60);  // 25 minutes
        printf("Time's up! Take a 5-minute break.\n");
        start_timer(5 * 60);  // 5 minutes
        printf("Break's over! Back to work.\n");
        i--;
    }

    return 0;
}