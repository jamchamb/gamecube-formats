meta:
  id: dol
  file-extension: dol
  endian: be
  title: Dolphin object
seq:
  - id: header
    type: header
instances:
  sections:
    type: section(_index)
    repeat: expr
    repeat-expr: header.dol_n_sections
types:
  section:
    params:
      - id: idx
        type: u4
    instances:
      offset:
        type: u4
        pos: header.section_offsets[idx]
      address:
        type: u4
        pos: header.section_addresses[idx]
      size:
        type: u4
        pos: header.section_offsets[idx]
  header:
    instances:
      dol_n_sections:
        value: 18
      dol_n_data_sections:
        value: 11
      dol_n_text_sections:
        value: 7
    seq:
      - id: section_offsets
        type: u4
        repeat: expr
        repeat-expr: dol_n_sections
      - id: section_addresses
        type: u4
        repeat: expr
        repeat-expr: dol_n_sections
      - id: section_sizes
        type: u4
        repeat: expr
        repeat-expr: dol_n_sections
      - id: bss_address
        type: u4
      - id: bss_size
        type: u4
      - id: entry_address
        type: u4
