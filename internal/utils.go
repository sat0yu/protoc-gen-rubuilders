package internal

import (
    "fmt"
    "strings"
)

func Indent(width int) string {
    return strings.Repeat("\t", width)
}

func FileHeader(s string) string {
    return fmt.Sprintf(
        "# Generated by the protocol buffer compiler.  DO NOT EDIT!\n" +
        "# source: %s\n" +
        "\n", s)
}

