package main

import (
    "bytes"
    "fmt"
    "io"
    "io/ioutil"
    "log"
    "os"
    "strings"

    "github.com/golang/protobuf/proto"
    descriptor "github.com/golang/protobuf/protoc-gen-go/descriptor"
    plugin "github.com/golang/protobuf/protoc-gen-go/plugin"
)

func generateIndent(width int) string {
    return strings.Repeat("\t", width)
}

func parseReq(r io.Reader) (*plugin.CodeGeneratorRequest, error) {
    buf, err := ioutil.ReadAll(r)
    if err != nil {
        return nil, err
    }

    var req plugin.CodeGeneratorRequest
    if err = proto.Unmarshal(buf, &req); err != nil {
        return nil, err
    }
    return &req, nil
}

func processReq(req *plugin.CodeGeneratorRequest) *plugin.CodeGeneratorResponse {
    files := make(map[string]*descriptor.FileDescriptorProto)
    for _, f := range req.ProtoFile {
        files[f.GetName()] = f
    }

    var resp plugin.CodeGeneratorResponse
    for _, fname := range req.FileToGenerate {
        f := files[fname]
        splitted := strings.Split(fname, ".proto")
        out := splitted[0] + "_pb_builder.rb"
        content := generateBuilders(f)
        resp.File = append(resp.File, &plugin.CodeGeneratorResponse_File{
            Name:    proto.String(out),
            Content: proto.String(content),
        })
    }
    return &resp
}

func generateBuilders(f *descriptor.FileDescriptorProto) string {
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
        line := fmt.Sprintln(generateIndent(lv), "module", p)
        io.WriteString(&buf, line)
    }
    for lv, c := range *msgClasses {
        line := fmt.Sprintln(generateIndent(pkgCount + lv), "class", c)
        io.WriteString(&buf, line)
    }
    for _, l := range lines {
        line := fmt.Sprintln(generateIndent(currentLv + l.lv), l.str)
        io.WriteString(&buf, line)
    }
    for lv := range append(*packages, *msgClasses...) {
        line := fmt.Sprintln(generateIndent(currentLv - lv - 1), "end")
        io.WriteString(&buf, line)
    }

    return buf.String() + "\n"
}

func emitResp(resp *plugin.CodeGeneratorResponse) error {
    buf, err := proto.Marshal(resp)
    if err != nil {
        return err
    }
    _, err = os.Stdout.Write(buf)
    return err
}

func main() {
    req, err := parseReq(os.Stdin)
    if err != nil {
        log.Fatalln(err)
    }

    resp := processReq(req)
    emitResp(resp)

    return
}
