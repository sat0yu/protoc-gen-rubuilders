package main

import (
    "io"
    "io/ioutil"
    "log"
    "os"
    "strings"

    "github.com/golang/protobuf/proto"
    descriptor "github.com/golang/protobuf/protoc-gen-go/descriptor"
    plugin "github.com/golang/protobuf/protoc-gen-go/plugin"

    . "github.com/sat0yu/protoc-gen-rubuilders/internal"
)

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
        content := FileHeader(fname) + GenerateBuilders(f)
        resp.File = append(resp.File, &plugin.CodeGeneratorResponse_File{
            Name:    proto.String(out),
            Content: proto.String(content),
        })
    }
    return &resp
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
