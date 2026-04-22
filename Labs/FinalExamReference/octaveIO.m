% main.m - File I/O and Terminal I/O example in Octave

% ── Terminal INPUT ───────────────────────────────────────────────────
name  = input('Enter your name: ', 's');        % 's' = read as string
age   = input('Enter your age:  ');             % no 's' = read as number
fprintf('Hello %s, you are %d years old!\n\n', name, age);


% ── Read from FILE ───────────────────────────────────────────────────
in_file = fopen('students.txt', 'r');           % open for reading

if in_file == -1
    error('Could not open students.txt');
end

fprintf('--- Reading from file ---\n');

students = {};                                  % empty cell array
scores   = [];                                  % empty number array

line = fgetl(in_file);                          % read first line
while ischar(line)                              % ischar = false at EOF
    parts = strsplit(line, ',');                % split by comma
    s_name  = strtrim(parts{1});                % trim whitespace
    s_score = str2num(parts{2});

    students{end+1} = s_name;                  % append to cell array
    scores(end+1)   = s_score;                 % append to array

    fprintf('Read: %-10s -> %d\n', s_name, s_score);
    line = fgetl(in_file);                      % read next line
end

fclose(in_file);


% ── Process DATA ─────────────────────────────────────────────────────
avg_score = mean(scores);
top_index = find(scores == max(scores));

fprintf('\nAverage score: %.2f\n',   avg_score);
fprintf('Top student:   %s (%d)\n', students{top_index}, scores(top_index));


% ── Write to FILE ────────────────────────────────────────────────────
out_file = fopen('results.txt', 'w');           % open for writing

if out_file == -1
    error('Could not open results.txt');
end

fprintf(out_file, '--- Results ---\n');
fprintf(out_file, 'Processed by: %s (age %d)\n\n', name, age);

for i = 1:length(students)
    if scores(i) >= avg_score
        status = 'PASS';
    else
        status = 'FAIL';
    end
    fprintf(out_file, '%-10s | Score: %3d | %s\n', students{i}, scores(i), status);
end

fprintf(out_file, '\nAverage: %.2f\n',   avg_score);
fprintf(out_file, 'Top:     %s (%d)\n', students{top_index}, scores(top_index));

fclose(out_file);
fprintf('\nResults written to results.txt\n');