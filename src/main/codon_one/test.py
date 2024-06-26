#!/usr/bin/env -S python 


def match_one(s1: str, s2: str):
    parts = s2.split('*')
    last_pos = 0
    for part in parts:
        if not part:
            continue
        pos = s1.find(part, last_pos)
        if pos == -1 or (last_pos == 0 and parts[0] and s2[0] != '*' and pos != 0):
            return 0
        last_pos = pos + len(part)
    if s2[-1] == '*' or last_pos == len(s1) or not parts[-1]:
        return 1
    else:
        return 0

# Example usage
s = "hello world"
pattern = "he*o*ld"
print(match_one(s, pattern))  # Output: 1

s = "hello world"
pattern = "he*o*ll"
print(match_one(s, pattern))  # Output: 0
