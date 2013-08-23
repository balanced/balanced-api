import sys
import json

def main():
    try:
        contents = json.load(open(sys.argv[1]))
    except ValueError, e:
        sys.stderr.write(e.message)
        sys.exit(1)
    result = json.dumps(contents, indent=4)
    print(result)
    if contents != result:
        with open(sys.argv[1], 'w') as w:
            w.write(result)

if __name__ == '__main__':
    main()
