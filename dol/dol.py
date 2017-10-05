# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import array
import struct
import zlib
from enum import Enum
from pkg_resources import parse_version

from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Dol(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self.header = self._root.Header(self._io, self, self._root)

    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self.section_offsets = [None] * (self.dol_n_sections)
            for i in range(self.dol_n_sections):
                self.section_offsets[i] = self._io.read_u4be()

            self.section_addresses = [None] * (self.dol_n_sections)
            for i in range(self.dol_n_sections):
                self.section_addresses[i] = self._io.read_u4be()

            self.section_sizes = [None] * (self.dol_n_sections)
            for i in range(self.dol_n_sections):
                self.section_sizes[i] = self._io.read_u4be()

            self.bss_address = self._io.read_u4be()
            self.bss_size = self._io.read_u4be()
            self.entry_address = self._io.read_u4be()

        @property
        def dol_n_sections(self):
            if hasattr(self, '_m_dol_n_sections'):
                return self._m_dol_n_sections if hasattr(self, '_m_dol_n_sections') else None

            self._m_dol_n_sections = 18
            return self._m_dol_n_sections if hasattr(self, '_m_dol_n_sections') else None

        @property
        def dol_n_data_sections(self):
            if hasattr(self, '_m_dol_n_data_sections'):
                return self._m_dol_n_data_sections if hasattr(self, '_m_dol_n_data_sections') else None

            self._m_dol_n_data_sections = 11
            return self._m_dol_n_data_sections if hasattr(self, '_m_dol_n_data_sections') else None

        @property
        def dol_n_text_sections(self):
            if hasattr(self, '_m_dol_n_text_sections'):
                return self._m_dol_n_text_sections if hasattr(self, '_m_dol_n_text_sections') else None

            self._m_dol_n_text_sections = 7
            return self._m_dol_n_text_sections if hasattr(self, '_m_dol_n_text_sections') else None



