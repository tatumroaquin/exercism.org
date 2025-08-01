BEGIN {
    file_given = 0
    for (i = 1; i < ARGC; i++) {
        if (ARGV[i] !~ /^-/) {
            file_given = 1
            break
        }
    }

    name = ""
    input_seen = 0
}

NF > 0 {
    name = $0
    input_seen = 1
    exit
}

END {
    if (!file_given && !input_seen || name == "")
        print "One for you, one for me."
    else
        print "One for " name ", one for me."
}