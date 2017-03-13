# p4c-bm2-ss

## 生成镜像

    docker build --force-rm=true -f Dockerfile -t lylandris/p4c-bm2-ss .

## 使用镜像

    $ alias p4c-bm2-ss='docker run --rm -it -v `pwd`:/source lylandris/p4c-bm2-ss'

    $ p4c-bm2-ss
    /p4c/build/p4c-bm2-ss: Compile a P4 program
    --help                  Print this help message
    --version               Print compiler version
    -I path                 Specify include path (passed to preprocessor)
    -D arg=value            Define macro (passed to preprocessor)
    -U arg                  Undefine macro (passed to preprocessor)
    -E                      Preprocess only, do not compile (prints program on stdout)
    --p4v {14|16}           Specify language version to compile
    --target target         Compile for the specified target
    --pp file               Pretty-print the program in the specified file.
    --toJSON file           Dump IR to JSON in the specified file.
    --testJson              Dump and undump the IR
    --p4runtime-file file   Write a P4Runtime control plane API description to the specified file.
    --p4runtime-as-json     Write out the P4Runtime API description as human-readable JSON.
    -o outfile              Write output to outfile
    --Werror                Treat all warnings as errors
    -T loglevel             [Compiler debugging] Adjust logging level per file (see below)
    -v                      [Compiler debugging] Increase verbosity level (can be repeated)
    --top4 pass1[,pass2]    [Compiler debugging] Dump the P4 representation after
                            passes whose name contains one of `passX' substrings.
                            When '-v' is used this will include the compiler IR.
    --dump folder           [Compiler debugging] Folder where P4 programs are dumped
    loglevel format is:
      sourceFile:level,...,sourceFile:level
    where 'sourceFile' is a compiler source file and
    'level' is the verbosity level for LOG messages in that file


在 P4 源代码目录，使用 `p4c-bm2-ss` 编译代码，例如：

    $ cd p4lang/switch/p4src

    $ p4c-bm2-ss --p4v 14 --pp mid.p4 -o demo.json switch.p4
    l3.p4(158): warning: -1: negative value with unsigned type
        add_to_field(ipv4.ttl, -1);
                                ^
    l3.p4(166): warning: -1: negative value with unsigned type
        add_to_field(ipv4.ttl, -1);
                                ^
    l3.p4(174): warning: -1: negative value with unsigned type
        add_to_field(ipv6.hopLimit, -1);
                                     ^
    l3.p4(182): warning: -1: negative value with unsigned type
        add_to_field(ipv6.hopLimit, -1);
                                     ^
    l3.p4(190): warning: -1: negative value with unsigned type
        add_to_field(mpls[0].ttl, -1);
                                   ^
    nat.p4(160): warning: -20: negative value with unsigned type
        add(nat_metadata.l4_len, ipv4.totalLen, -20);
                                                 ^^
    tunnel.p4(1011): warning: -14: negative value with unsigned type
        add(egress_metadata.payload_length, standard_metadata.packet_length, -14);
                                                                              ^^
    fabric.p4(211): warning: Could not infer type for fabric_mgid, using bit<8>
    action set_fabric_multicast(fabric_mgid) {
                                ^^^^^^^^^^^
    acl.p4(563): warning: Could not infer type for session_id, using bit<8>
    action negative_mirror(session_id) {
                           ^^^^^^^^^^
    warning: The order of headers in deparser is not uniquely determined by parser!
    includes/parser.p4(487): warning: SelectCase: unreachable
            default: parse_all_int_meta_value_heders;
            ^^^^^^^
    acl.p4(563): warning: Removing unused action parameter session_id for compatibility reasons
    action negative_mirror(session_id) {
                           ^^^^^^^^^^
    fabric.p4(211): warning: Removing unused action parameter fabric_mgid for compatibility reasons
    action set_fabric_multicast(fabric_mgid) {
                                ^^^^^^^^^^^
    port.p4(244): warning: Target does not support default_action for process_port_vlan_mapping.port_vlan_mapping (due to action profiles)
    table port_vlan_mapping {
    ^
    nexthop.p4(228): warning: Target does not support default_action for process_nexthop.ecmp_group (due to action profiles)
    table ecmp_group {
    ^
    port.p4(341): warning: Target does not support default_action for process_lag.lag_group (due to action profiles)
    table lag_group {
    ^
    fabric.p4(250): warning: Target does not support default_action for process_fabric_lag.fabric_lag (due to action profiles)
    table fabric_lag {
    ^

