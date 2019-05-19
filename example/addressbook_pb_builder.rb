name: "example/addressbook.proto"
package: "tutorial"
dependency: "google/protobuf/timestamp.proto"
message_type: <
  name: "Person"
  field: <
    name: "name"
    number: 1
    label: LABEL_OPTIONAL
    type: TYPE_STRING
    json_name: "name"
  >
  field: <
    name: "id"
    number: 2
    label: LABEL_OPTIONAL
    type: TYPE_INT32
    json_name: "id"
  >
  field: <
    name: "email"
    number: 3
    label: LABEL_OPTIONAL
    type: TYPE_STRING
    json_name: "email"
  >
  field: <
    name: "phones"
    number: 4
    label: LABEL_REPEATED
    type: TYPE_MESSAGE
    type_name: ".tutorial.Person.PhoneNumber"
    json_name: "phones"
  >
  field: <
    name: "last_updated"
    number: 5
    label: LABEL_OPTIONAL
    type: TYPE_MESSAGE
    type_name: ".google.protobuf.Timestamp"
    json_name: "lastUpdated"
  >
  nested_type: <
    name: "PhoneNumber"
    field: <
      name: "number"
      number: 1
      label: LABEL_OPTIONAL
      type: TYPE_STRING
      json_name: "number"
    >
    field: <
      name: "type"
      number: 2
      label: LABEL_OPTIONAL
      type: TYPE_ENUM
      type_name: ".tutorial.Person.PhoneType"
      json_name: "type"
    >
  >
  enum_type: <
    name: "PhoneType"
    value: <
      name: "MOBILE"
      number: 0
    >
    value: <
      name: "HOME"
      number: 1
    >
    value: <
      name: "WORK"
      number: 2
    >
  >
>
message_type: <
  name: "AddressBook"
  field: <
    name: "people"
    number: 1
    label: LABEL_REPEATED
    type: TYPE_MESSAGE
    type_name: ".tutorial.Person"
    json_name: "people"
  >
>
options: <
  java_package: "com.example.tutorial"
  java_outer_classname: "AddressBookProtos"
  csharp_namespace: "Google.Protobuf.Examples.AddressBook"
>
source_code_info: <
  location: <
    span: 9
    span: 0
    span: 49
    span: 1
  >
  location: <
    path: 12
    span: 9
    span: 0
    span: 18
    leading_comments: " [START declaration]\n"
    leading_detached_comments: " See README.txt for information and build instructions.\n\n Note: START and END tags are used in comments to define sections used in\n tutorials.  They are not part of the syntax for Protocol Buffers.\n\n To get an in-depth walkthrough of this file and the related examples, see:\n https://developers.google.com/protocol-buffers/docs/tutorials\n"
  >
  location: <
    path: 2
    span: 10
    span: 8
    span: 16
  >
  location: <
    path: 3
    path: 0
    span: 12
    span: 7
    span: 40
    trailing_comments: " [END declaration]\n"
  >
  location: <
    path: 8
    span: 16
    span: 0
    span: 45
  >
  location: <
    path: 8
    path: 1
    span: 16
    span: 0
    span: 45
    leading_comments: " [START java_declaration]\n"
  >
  location: <
    path: 8
    span: 17
    span: 0
    span: 50
  >
  location: <
    path: 8
    path: 8
    span: 17
    span: 0
    span: 50
    trailing_comments: " [END java_declaration]\n"
  >
  location: <
    path: 8
    span: 21
    span: 0
    span: 65
  >
  location: <
    path: 8
    path: 37
    span: 21
    span: 0
    span: 65
    leading_comments: " [START csharp_declaration]\n"
    trailing_comments: " [END csharp_declaration]\n"
  >
  location: <
    path: 4
    path: 0
    span: 25
    span: 0
    span: 44
    span: 1
    leading_comments: " [START messages]\n"
  >
  location: <
    path: 4
    path: 0
    path: 1
    span: 25
    span: 8
    span: 14
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 0
    span: 26
    span: 2
    span: 18
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 0
    path: 4
    span: 26
    span: 2
    span: 25
    span: 16
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 0
    path: 5
    span: 26
    span: 2
    span: 8
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 0
    path: 1
    span: 26
    span: 9
    span: 13
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 0
    path: 3
    span: 26
    span: 16
    span: 17
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 1
    span: 27
    span: 2
    span: 15
    trailing_comments: " Unique ID number for this person.\n"
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 1
    path: 4
    span: 27
    span: 2
    span: 26
    span: 18
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 1
    path: 5
    span: 27
    span: 2
    span: 7
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 1
    path: 1
    span: 27
    span: 8
    span: 10
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 1
    path: 3
    span: 27
    span: 13
    span: 14
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 2
    span: 28
    span: 2
    span: 19
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 2
    path: 4
    span: 28
    span: 2
    span: 27
    span: 15
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 2
    path: 5
    span: 28
    span: 2
    span: 8
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 2
    path: 1
    span: 28
    span: 9
    span: 14
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 2
    path: 3
    span: 28
    span: 17
    span: 18
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    span: 30
    span: 2
    span: 34
    span: 3
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 1
    span: 30
    span: 7
    span: 16
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 0
    span: 31
    span: 4
    span: 15
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 0
    path: 1
    span: 31
    span: 4
    span: 10
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 0
    path: 2
    span: 31
    span: 13
    span: 14
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 1
    span: 32
    span: 4
    span: 13
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 1
    path: 1
    span: 32
    span: 4
    span: 8
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 1
    path: 2
    span: 32
    span: 11
    span: 12
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 2
    span: 33
    span: 4
    span: 13
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 2
    path: 1
    span: 33
    span: 4
    span: 8
  >
  location: <
    path: 4
    path: 0
    path: 4
    path: 0
    path: 2
    path: 2
    path: 2
    span: 33
    span: 11
    span: 12
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    span: 36
    span: 2
    span: 39
    span: 3
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 1
    span: 36
    span: 10
    span: 21
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 0
    span: 37
    span: 4
    span: 22
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 0
    path: 4
    span: 37
    span: 4
    span: 36
    span: 23
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 0
    path: 5
    span: 37
    span: 4
    span: 10
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 0
    path: 1
    span: 37
    span: 11
    span: 17
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 0
    path: 3
    span: 37
    span: 20
    span: 21
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 1
    span: 38
    span: 4
    span: 23
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 1
    path: 4
    span: 38
    span: 4
    span: 37
    span: 22
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 1
    path: 6
    span: 38
    span: 4
    span: 13
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 1
    path: 1
    span: 38
    span: 14
    span: 18
  >
  location: <
    path: 4
    path: 0
    path: 3
    path: 0
    path: 2
    path: 1
    path: 3
    span: 38
    span: 21
    span: 22
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 3
    span: 41
    span: 2
    span: 34
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 3
    path: 4
    span: 41
    span: 2
    span: 10
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 3
    path: 6
    span: 41
    span: 11
    span: 22
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 3
    path: 1
    span: 41
    span: 23
    span: 29
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 3
    path: 3
    span: 41
    span: 32
    span: 33
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 4
    span: 43
    span: 2
    span: 45
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 4
    path: 4
    span: 43
    span: 2
    span: 41
    span: 34
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 4
    path: 6
    span: 43
    span: 2
    span: 27
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 4
    path: 1
    span: 43
    span: 28
    span: 40
  >
  location: <
    path: 4
    path: 0
    path: 2
    path: 4
    path: 3
    span: 43
    span: 43
    span: 44
  >
  location: <
    path: 4
    path: 1
    span: 47
    span: 0
    span: 49
    span: 1
    leading_comments: " Our address book file is just one of these.\n"
  >
  location: <
    path: 4
    path: 1
    path: 1
    span: 47
    span: 8
    span: 19
  >
  location: <
    path: 4
    path: 1
    path: 2
    path: 0
    span: 48
    span: 2
    span: 29
  >
  location: <
    path: 4
    path: 1
    path: 2
    path: 0
    path: 4
    span: 48
    span: 2
    span: 10
  >
  location: <
    path: 4
    path: 1
    path: 2
    path: 0
    path: 6
    span: 48
    span: 11
    span: 17
  >
  location: <
    path: 4
    path: 1
    path: 2
    path: 0
    path: 1
    span: 48
    span: 18
    span: 24
  >
  location: <
    path: 4
    path: 1
    path: 2
    path: 0
    path: 3
    span: 48
    span: 27
    span: 28
  >
>
syntax: "proto3"
