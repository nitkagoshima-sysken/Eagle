import sys
from subprocess import Popen, PIPE
from optparse import OptionParser

def one_input_and_one_output(command, input_string, suffix="\n"):
    p = Popen(command, stdin=PIPE, stdout=PIPE)
    p.stdin.write(input_string + suffix)
    status_code = p.wait()
    return (status_code, p.stdout.read())

def some_input_and_each_output(command, input_string):
    p = Popen(command, stdin=PIPE, stdout=PIPE)
    result = ""
    for istr in input_string.rstrip("\n").split("\n"):
        (out, err) = p.communicate(istr + "\n")
        result += out
    status_code = p.wait()
    return (status_code, result)

if __name__ == "__main__":
    parser = OptionParser()
    parser.add_option("-i", "--input", dest="input", type="string")
    parser.add_option("-t", "--type", dest="type", type="string", default="one_input_and_one_output")
    (options, args) = parser.parse_args()
    (status_code, out) = 0, ""
    if options.type == "one_input_and_one_output":
        (status_code, out) = one_input_and_one_output(args, options.input)
    if options.type == "some_input_and_one_output":
        (status_code, out) = one_input_and_one_output(args, options.input, "")
    if options.type == "some_input_and_each_output":
        (status_code, out) = some_input_and_each_output(args, options.input)
    print(out)
    sys.exit(status_code)
