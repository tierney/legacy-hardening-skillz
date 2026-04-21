#!/usr/bin/env python3
import sys
import argparse

def format_as_c_array(name, data):
    output = f"const uint8_t {name}[] = {{\n    "
    for i, byte in enumerate(data):
        output += f"0x{byte:02x}"
        if i < len(data) - 1:
            output += ", "
        if (i + 1) % 12 == 0:
            output += "\n    "
    output += "\n};\n"
    return output

def main():
    parser = argparse.ArgumentParser(description="Generate C-compatible hex arrays for golden vector tests.")
    parser.add_argument("name", help="Name of the array variable")
    parser.add_argument("file", help="Path to the binary file (or '-' for stdin)")
    
    args = parser.parse_args()
    
    if args.file == '-':
        data = sys.stdin.buffer.read()
    else:
        with open(args.file, 'rb') as f:
            data = f.read()
            
    print(format_as_c_array(args.name, data))

if __name__ == "__main__":
    main()
