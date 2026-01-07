# Test Script 1
# Testing basic math function

import math

# Calculate the total number of seconds from input minutes
def seconds(minutes):
    totalSec = minutes * 60
    return totalSec

# Calculate the total number of minutes from input hours
def minutes(hours):
    totalMin = hours * 60
    return totalMin

time = '0 hours 4 minutes 10 seconds'

# Calcalte the total number of seconds from inputted time
# Input: time in format [hours] hours [minutes] minutes [seconds] seconds
def timeInSeconds(time):
    t = time.split(' ')
    h = int(t[0])
    m = int(t[2])
    s = int(t[4])
    totalSeconds = seconds(minutes(h) + m) + s
    print('Time in seconds: ' + str(totalSeconds) + ' seconds')

timeInSeconds(time)

