import json
import sys


if __name__ == '__main__':
  output_file = "index.h"
  print("RUNNED!")
  with open(output_file, 'w') as fp:
    fp.write('int gVariable = 5;')
  sys.stdout.write(' '.join(sys.argv))
