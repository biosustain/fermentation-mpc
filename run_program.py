import subprocess
import os
import signal
from subprocess import PIPE

# Run this file to run the program

# The popen class can execute child programs in new processes
pro1 = subprocess.Popen(["python", "/Users/s144510/Documents/fermentationtool/watcher.py"])
#pro2 = subprocess.Popen(["python", "/Users/s144510/Documents/fermentationtool/fermentationtool.py"])

try:

    # Communicate interacts with the processes, in this way when we push ctrl C,
    # it will kill all of the processes. It sends this data to the children processes.
    pro1.communicate()
    #pro2.communicate()


except KeyboardInterrupt:
    print('You have closed the program')
    os.killpg(os.getpgid(pro1.pid), signal.SIGTERM)
    #os.killpg(os.getpgid(pro2.pid), signal.SIGTERM)
