#!/usr/bin/env python

import json
import sys
import os

def main():
    data = {}
    for name in sys.argv:
        if 'combine' in name:
            continue
        vers, _ = os.path.splitext(os.path.basename(name))
        data[vers] = json.loads(open(name).read())
    print(json.dumps(data, indent=1))


if __name__ == "__main__":
    main()
