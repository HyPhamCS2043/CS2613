% ── OCTAVE ──────────────────────────────────────────────────────────

% ── Basic Read ───────────────────────────────────────────────────────

% Read whole file as string
fid = fopen('input.txt', 'r');
if fid == -1, error('Cannot open file'); end
content = fileread('input.txt');            % easiest whole-file read
disp(content);
fclose(fid);

% Read line by line
fid = fopen('input.txt', 'r');
if fid == -1, error('Cannot open file'); end
line = fgetl(fid);                          % read first line
while ischar(line)                          % ischar = false at EOF
    disp(line);
    line = fgetl(fid);                      % read next line
end
fclose(fid);

% ── Basic Write ──────────────────────────────────────────────────────

% Write to file (overwrites)
fid = fopen('output.txt', 'w');
if fid == -1, error('Cannot open file'); end
fprintf(fid, 'Hello World\n');
fclose(fid);

% Append to file
fid = fopen('output.txt', 'a');
fprintf(fid, 'Another line\n');
fclose(fid);

% ── Read, Process, Write ─────────────────────────────────────────────
in_fid  = fopen('students.txt', 'r');
out_fid = fopen('results.txt',  'w');
if in_fid == -1,  error('Cannot open input');  end
if out_fid == -1, error('Cannot open output'); end

line = fgetl(in_fid);
while ischar(line)
    if ~isempty(strtrim(line))              % skip empty lines
        parts = strsplit(line, ',');
        name  = strtrim(parts{1});
        score = str2num(strtrim(parts{2}));
        if score >= 50
            grade = 'PASS';
        else
            grade = 'FAIL';
        end
        fprintf(out_fid, '%s | %s\n', name, grade);
    end
    line = fgetl(in_fid);
end

fclose(in_fid);
fclose(out_fid);