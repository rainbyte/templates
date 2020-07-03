#!/usr/bin/awk -i inplace -f

# Search each {{{PLACEHOLDER}}} inside the file and ask for replacement
{
    if(match($0, /\{{3,3}.+\}{3,3}/)) {
        orig = substr($0, RSTART, RLENGTH)
        print orig > "/dev/fd/2";
        getline replacement < "-";
        $0=substr($0, 1, RSTART-1) replacement substr($0, RSTART+RLENGTH);
    }
    print;
}
