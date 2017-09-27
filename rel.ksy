meta:
  id: rel
  file-extension: rel
  endian: be
  title: Relocatable object
seq:
  - id: header
    type: header
instances:
  section_info_table:
    type: section_info
    pos: header.section_info_offset
    repeat: expr
    repeat-expr: header.num_sections
  imp_table:
    type: imp
    pos: header.imp_table_offset
    repeat: expr
    repeat-expr: header.imp_table_size / 8
types:
  header:
    seq:
      - id: id
        type: u4
      - id: padding
        type: u8
      - id: num_sections
        type: u4
      - id: section_info_offset
        type: u4
      - id: name_offset
        type: u4
      - id: name_size
        type: u4
      - id: version
        type: u4
      - id: bss_size
        type: u4
      - id: relocation_table_offset
        type: u4
      - id: imp_table_offset
        type: u4
      - id: imp_table_size
        type: u4
      - id: section_info_prolog_index_relative
        type: u1
        if: section_info_prolog_index_relative != 0
      - id: section_info_epilog_index_relative
        type: u1
        if: section_info_epilog_index_relative != 0
      - id: section_info_unresolved_index_relative
        type: u1
        if: section_info_unresolved_index_relative != 0
      - id: padding2
        type: u1
      - id: prolog_offset
        type: u4
      - id: epilog_offset
        type: u4
      - id: unresolved_offset
        type: u4
      - id: align
        type: u4
        if: version >= 2
      - id: bss_align
        type: u4
        if: version >= 2
      - id: fix_size
        type: u4
        if: version >= 3
  section_info:
    seq:
      - id: packed_1
        type: u4
      - id: length
        type: u4
    instances:
      offset:
        value: packed_1 & 0xFFFFFFFE
      executable_flag:
        value: packed_1 & 1 == 1
      section:
        if: offset > 0
        size: length
        pos: offset
  imp:
    seq:
      - id: module_id
        type: u4
      - id: offset
        type: u4
    instances:
      rel_data:
        type: relocation_data
        size: 8
        pos: offset
  relocation_data:
    seq:
      - id: offset_from_prev
        type: u2
      - id: relocation_type
        type: u1
        enum: relocation_types
      - id: relocate_against_section
        type: u1
      - id: symbol_offset
        type: u4
    enums:
      relocation_types:
        0:   r_ppc_none
        1:   r_ppc_addr32
        2:   r_ppc_addr24
        3:   r_ppc_addr16
        4:   r_ppc_addr16_lo
        5:   r_ppc_addr16_hi
        6:   r_ppc_addr16_ha
        7:   r_ppc_addr14
        8:   r_ppc_addr14_dup
        9:   r_ppc_addr14_dup2
        10:  r_ppc_rel24
        11:  r_ppc_rel14
        12:  r_ppc_rel14_dup
        13:  r_ppc_rel14_dup2
        201: r_rvl_none
        202: r_rvl_sect
        203: r_rvl_stop
