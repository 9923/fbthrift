#
# Autogenerated by Thrift
#
# DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
#  @generated
#

from libcpp.memory cimport shared_ptr, make_shared, unique_ptr, make_unique
from libcpp.string cimport string
from libcpp cimport bool as cbool
from libcpp.iterator cimport inserter as cinserter
from cpython cimport bool as pbool
from libc.stdint cimport int8_t, int16_t, int32_t, int64_t
from cython.operator cimport dereference as deref, preincrement as inc
from thrift.lib.py3.thrift_server cimport TException
cimport std_libcpp

from collections.abc import Sequence, Set, Mapping, Iterable
from enum import Enum




cdef class Included:
    def __init__(
        Included self,
        MyIntField
    ):
        self.c_Included = make_shared[cIncluded]()
        deref(self.c_Included).MyIntField = MyIntField
        
    @staticmethod
    cdef create(shared_ptr[cIncluded] c_Included):
        inst = <Included>Included.__new__(Included)
        inst.c_Included = c_Included
        return inst

    @property
    def MyIntField(self):
        return self.c_Included.get().MyIntField


    def __richcmp__(self, other, op):
        cdef int cop = op
        if cop not in (2, 3):
            raise TypeError("unorderable types: {}, {}".format(self, other))
        if not (
                isinstance(self, Included) and
                isinstance(other, Included)):
            if cop == 2:  # different types are never equal
                return False
            else:         # different types are always notequal
                return True

        cdef cIncluded cself = deref((<Included>self).c_Included)
        cdef cIncluded cother = deref((<Included>other).c_Included)
        cdef cbool cmp = cself == cother
        if cop == 2:
            return cmp
        return not cmp

    def __hash__(Included self):
        return hash((
          self.MyIntField,
        ))




