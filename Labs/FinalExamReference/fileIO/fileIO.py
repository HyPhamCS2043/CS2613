# ── PYTHON ──────────────────────────────────────────────────────────

# ── Basic Read ───────────────────────────────────────────────────────

# Read whole file as string
with open('input.txt', 'r') as f:
    content = f.read()
    print(content)

# Read as array of lines
with open('input.txt', 'r') as f:
    lines = f.readlines()                   # keeps \n at end of each line
    for line in lines:
        print(line.strip())                 # strip() removes \n

# Read line by line (memory efficient for large files)
with open('input.txt', 'r') as f:
    for line in f:
        print(line.strip())

# ── Basic Write ──────────────────────────────────────────────────────

# Write to file (overwrites)
with open('output.txt', 'w') as f:
    f.write('Hello World\n')

# Append to file
with open('output.txt', 'a') as f:
    f.write('Another line\n')

# ── Read, Process, Write ─────────────────────────────────────────────
with open('students.txt', 'r') as f:
    lines = f.readlines()

output = []
for line in lines:
    line = line.strip()
    if not line: continue                   # skip empty lines
    name, score = line.split(',')
    grade = 'PASS' if int(score) >= 50 else 'FAIL'
    output.append(f"{name.strip()} | {grade}")

with open('results.txt', 'w') as f:
    f.write('\n'.join(output))