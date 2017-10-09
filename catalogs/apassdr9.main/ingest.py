import os
from glob import glob

filenames = glob("z*.sum")


for filename in filenames:
    with open(filename, "r") as fp:
        contents = fp.readlines()

    lengths = (10, 11, 7, 11, 7, 5, 5, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7, 7)
        
    fixed_lines = []
    N = len(contents)
    for i, line in enumerate(contents[1:]):
        print(filename, i, N)
        total = 0
        fixed_line = []
        for length in lengths:
            fixed_line.append(line[total:total + length].strip())
            total += length

        fixed_lines.append(",".join(fixed_line))

    with open("{}.processed".format(filename), "w") as fp:
        fp.write("\n".join(fixed_lines))
   

    os.unlink(filename)
    os.system("psql -U postgres -d wsdb -a -c \"COPY apassdr9_main (name, ra, raerr, dec, decerr, nobs, mobs, vjmag, bmvjmag, bjmag, gmag, rmag, imag, evjmag, ebmvjmag, ebjmag, egmag, ermag, eimag) FROM '{}.processed' ( DELIMITER(',') )\"".format(os.path.abspath(filename)))
    os.unlink("{}.processed".format(filename))