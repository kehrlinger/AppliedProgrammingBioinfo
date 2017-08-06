def restriction(seq, pattern, circular, matches):
    frag_size = []
    matches.sort(reverse=True)

    for i in range(len(matches) - 1):
        size = matches[i] - matches[i + 1]
        frag_size.append(size)

    if circular == 'no':
        frag_size.insert(0, matches[-1])
        frag_size.append(len(seq) - matches[0])
    elif circular == 'yes':
        frag_size.append((len(seq) + matches[-1]) - matches[0])

    return frag_size