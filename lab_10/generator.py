if __name__ == '__main__':
    x = 0x5a
    m = 0x4000
    y = 0
    size = 8
    s = ''
    while(m != 0):
        b = y | (m % 2**size)
        ms = f'{m:08b}'
        ms = ms[-size:]
        s += f'        b = y | {size}\'b{ms};\n'
        y = y >> 1
        s += f'        y = y >> 1;\n'
        s += f'        if (x >= b)\n'
        s += f'        begin\n'
        s += f'            x = x - b;\n'
        s += f'            y = y | {size}\'b{ms};\n'
        s += f'        end\n'
        if x >= b:
            x = x - b
            y = y | (m % 2**size)
        m = m >> 2
        print(f'{y:X}\t{m:X}\t{b:X}')
    print()
    print(s)
