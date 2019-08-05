#!/usr/bin/python3

"""This script makes mock implementation for ZScript interfaces classes.
In this project, a class is considered an interface if it is marked as
'abstract'.

At least Python 3.5.2 is required.
"""

import re
from pathlib import Path


def tokenize(file_name):
    """This function reads a file and converts it to a list of tokens."""

    contents = open(str(file_name), 'r').read()

    # remove single-line comments
    contents = re.sub('//.*', '', contents)

    # remove multi-line comments
    contents = contents.replace('\n', '')

    contents = re.sub(r'\/\*.*?\*\/', '', contents)

    # remove strings
    contents = re.sub('\".*?\"', '', contents)

    # tokenize
    contents = re.split(r'([ {};()])', contents)

    # remove empty elements
    contents = [x for x in contents if x not in ('', ' ')]

    return contents


def is_interface(token_list):
    """This function checks if a class represented by a token list is an interface."""

    return 'abstract' in token_list


def get_class_name(token_list):
    """This function returns a class name for a class represented by a token list."""

    return token_list[1]


def make_mock_name(name):
    """This function generates a mock class name by the class name."""

    return name + "Mock"


def get_function_starts(token_list):
    """This function searches for virtual functions in a class represented by a token list."""

    functions = []
    for i, token in enumerate(token_list):
        if token == 'virtual':
            functions.append(i)
    return functions


def generate_mock_class(tokens):
    """This class generates a mock class for the class represented by a token list.
    Mock class contains:
    - an implementation for interface methods;
    - expect_... function for setting expected function call result;
    - bool isSatisfied_...() function to check if the expected number of calls is done.
    """

    # generate a header
    class_name = get_class_name(tokens)
    mock_name = make_mock_name(class_name)
    out = 'class {} : {}\n{{\n\n'.format(mock_name, class_name)

    out += '  {} init() {{ return self; }}\n\n'.format(mock_name)

    functions = get_function_starts(tokens)

    # generate methods
    for i in functions:
        return_type = tokens[i + 1]
        func_name = tokens[i + 2]
        is_void = return_type == 'void'

        # implementation for the interface
        mock_attribute = '_mock_' + func_name
        mock_attribute_expected = mock_attribute + '_expected'
        mock_attribute_called = mock_attribute + '_called'

        out += '  override\n  {} {}('.format(return_type, func_name)
        args_index = i + 4
        pairs = []
        while tokens[args_index] != ')':
            pairs.append(tokens[args_index] + ' ' + tokens[args_index + 1])
            args_index += 2

        out += '{})\n'.format(' '.join(pairs))

        out += '  {{\n    ++{};\n'.format(mock_attribute_called)
        if not is_void:
            out += '    return {};\n'.format(mock_attribute)
        out += '  }\n\n'

        # setter for mock attribute
        setter_name = 'expect_' + func_name
        out += '  void ' + setter_name + '('
        if not is_void:
            out += return_type + ' value, '
        out += 'int expected = 1)\n  {\n'
        if not is_void:
            out += '    ' + mock_attribute + ' = value;\n'

        out += '    {} = expected;\n    {} = 0;\n  }}\n\n'.\
            format(mock_attribute_expected, mock_attribute_called)

        # isSatisfied
        out += '  bool isSatisfied_{}() const\n  {{\n    return {} == {};\n  }}\n\n'.\
            format(func_name, mock_attribute_expected, mock_attribute_called)

        # mock attributes
        if not is_void:
            out += '  private ' + return_type + ' ' + mock_attribute + ';\n'
        out += '  private int ' + mock_attribute_expected + ';\n'
        out += '  private int ' + mock_attribute_called + ';\n\n'

    # generate a footer
    out += '} // class ' + mock_name + '\n\n'

    return out


if __name__ == "__main__":

    HEADER_FILE = open('docs/source-template.zst', 'r')
    MOCK_CONTENTS = HEADER_FILE.read() + '\n'

    MOCK_CONTENTS += "// This file is generated by ./scripts/make_mocks.py.\n"
    MOCK_CONTENTS += "// Do not edit it by hand, your changes will be overwritten!\n\n"

    SOURCES = list(Path("./zscript/typist").rglob("*.zs"))

    #SOURCES = [
    #    'zscript/typist/view/tt_View.zs',
    #]

    for source in SOURCES:
        source_tokens = tokenize(source)
        if is_interface(source_tokens):
            MOCK_CONTENTS += generate_mock_class(source_tokens)

    OUT_FILE = open('zscript/typist/tests/tt_mocks.zs', 'w')
    OUT_FILE.write(MOCK_CONTENTS)
    #print(MOCK_CONTENTS)
