import glob
from collections import Counter

FILES, = glob_wildcards("input/{file,[^.]+}")

rule all:
    input: expand("output/{file}", file = FILES)

rule char_counter:
    input: "input/{file}"
    output: "output/{file}"
    run:
        with open(f'{input}', 'r') as f_in, open(f'{output}', 'w') as f_out:
            t = f_in.read().replace('\n', '').lower()
            counter = Counter(t)
            for i, k in sorted(counter.items()):
                f_out.write(f'{i}: {k}\n')
