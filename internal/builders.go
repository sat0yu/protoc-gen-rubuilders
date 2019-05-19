package internal

import (
    "bytes"
    "fmt"
    "io"
    "strings"

    descriptor "github.com/golang/protobuf/protoc-gen-go/descriptor"
)

func GenerateBuilders(f *descriptor.FileDescriptorProto) string {
    var buf bytes.Buffer

    for _, m := range f.MessageType {
        pkgs := strings.Split(strings.Title(f.GetPackage()), ".")
        io.WriteString(&buf, processMessage(m, &pkgs, &[]string{}))
    }

    return buf.String()
}

func processMessage(m *descriptor.DescriptorProto, packages, msgClasses *[]string) string {
    classes := append(*msgClasses, strings.Title(m.GetName()))

    var buf bytes.Buffer
    io.WriteString(&buf, generateBuilder(m, packages, &classes))

    // step into the nested messages
    for _, n := range m.NestedType {
        io.WriteString(&buf, processMessage(n, packages, &classes))
    }

    return buf.String()
}

func generateBuilder(m *descriptor.DescriptorProto, packages, msgClasses *[]string) string {
    var fNames bytes.Buffer
    for _, f := range m.Field {
        io.WriteString(&fNames, f.GetName() + " ")
    }
    lines := []struct{lv int; str string}{
        {lv:0, str: "def self.build(**kwargs)"},
        {lv:1, str: fmt.Sprintf("attributes = kwargs.select{|k, _| %%i(%s).include? k}", fNames.String())},
        {lv:1, str: "self.new(attributes)"},
        {lv:0, str: "end"},
    }

    var buf bytes.Buffer
    pkgCount := len(*packages)
    currentLv := pkgCount + len(*msgClasses)
    for lv, p := range *packages {
        line := fmt.Sprintln(Indent(lv), "module", p)
        io.WriteString(&buf, line)
    }
    for lv, c := range *msgClasses {
        line := fmt.Sprintln(Indent(pkgCount + lv), "class", c)
        io.WriteString(&buf, line)
    }
    for _, l := range lines {
        line := fmt.Sprintln(Indent(currentLv + l.lv), l.str)
        io.WriteString(&buf, line)
    }
    for lv := range append(*packages, *msgClasses...) {
        line := fmt.Sprintln(Indent(currentLv - lv - 1), "end")
        io.WriteString(&buf, line)
    }

    return buf.String() + "\n"
}

