# Module to check for the startingpoints of different patterns within a sequence.
import re

def length_of_pattern (pattern):
    length = 0
    bool_flag = True
    for i in pattern:
        if i == "[":
            bool_flag = False
        if i == "]":
            bool_flag = True
        if bool_flag == True:
            length += 1
    return (length)


def match_pos(seq, pattern, circular):
    matches = []
    offset = int()
    pattern_length = length_of_pattern(pattern)

    # Check if circular, and add the beginning of the sequence to the end of it
    if circular == "yes":
        seq = seq + seq[0:pattern_length - 1]

    # Use regex to search for the pattern in the sequence.
    # If it is present, note the position in the sequence.
    # Offset is necessary to keep track of how much sequence was cut off already.
    # The position in the returned list is already adjusted to the actual position, does not start at 0
    while re.search(pattern, seq):
        matches.append(re.search(pattern, seq).start() + 1 + offset)
        offset += re.search(pattern, seq).start() + 1
        seq = seq[re.search(pattern, seq).start() + 1:]

    return matches