#!/bin/bash
parse()
{
    echo "parse: \$1" > /dev/stderr
    awk -v script="\$0" '
    /^\ *(\\\\input|\\\\include)\{/ {
        if (system("bash " script " " gensub(/^.*\{([^}]+)\}.*$/,"\\\\1","g"))) {
            print "error: " \$0 > "/dev/stderr"
        }

        next
    }
    {
        print \$0;
    }' "\$1"
}

if [[ \$# -ne 1 ]]; then
    echo "usage: \$0 input.tex" > /dev/stderr
    echo "got    \$0 \$@;" > /dev/stderr
    exit 1
else
    if [[ ! -f "\$1" ]]; then
        if [[ ! -f "\$1.tex" ]]; then
            echo "error: \$1 not a file" > /dev/stderr
            exit 2
        else
            parse "\$1.tex"
        fi
    else
        parse "\$1"
    fi
fi

exit 0
# cat << EOF > tmp.bash
# EOF
# bash tmp.bash these_payen_2019.tex > mono.tex
