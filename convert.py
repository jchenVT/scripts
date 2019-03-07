def main():
    #f=open("fishfunc", "r")
    fnew = open("fishconverted", "w")

    with open('.bashrc') as f:
        for cnt, line in enumerate(f):
            if line.find("alias") != -1:
                equals = line.find("=")
                name = line[6:equals]
                fnew.write("function " + name + "\n\t")
                thefunc = line[equals +2:-2]
                fnew.write(thefunc + "\nend\n\n")
            elif line[0] == '#':
                fnew.write(line)

    fnew.close()
    f.close()
            
    
main()
