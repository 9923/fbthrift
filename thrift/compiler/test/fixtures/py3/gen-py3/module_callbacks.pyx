
cdef public void call_cy_SimpleService_get_five(
    object self,
    shared_ptr[cFollyPromise[int32_t]] cPromise
) with gil:
    promise = Promise_i32.create(cPromise)

    func = functools.partial(
        asyncio.ensure_future,
        SimpleService_get_five_coro(
            self,
            promise),
        loop=self.loop)
    self.loop.call_soon_threadsafe(func)

async def SimpleService_get_five_coro(
    object self,
    Promise_i32 promise
):
    try:
      result = await self.get_five()
    except Exception as ex:
        print(
            "Unexpected error in service handler get_five:",
            file=sys.stderr)
        traceback.print_exc()
        deref(promise.cPromise).setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        deref(promise.cPromise).setValue(<int32_t> result)

cdef public void call_cy_SimpleService_add_five(
    object self,
    shared_ptr[cFollyPromise[int32_t]] cPromise,
    int32_t num
) with gil:
    promise = Promise_i32.create(cPromise)
    arg_num = num

    func = functools.partial(
        asyncio.ensure_future,
        SimpleService_add_five_coro(
            self,
            promise,
            arg_num),
        loop=self.loop)
    self.loop.call_soon_threadsafe(func)

async def SimpleService_add_five_coro(
    object self,
    Promise_i32 promise,
    num
):
    try:
      result = await self.add_five(
          num)
    except Exception as ex:
        print(
            "Unexpected error in service handler add_five:",
            file=sys.stderr)
        traceback.print_exc()
        deref(promise.cPromise).setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        deref(promise.cPromise).setValue(<int32_t> result)

cdef public void call_cy_SimpleService_do_nothing(
    object self,
    shared_ptr[cFollyPromise[cFollyUnit]] cPromise
) with gil:
    promise = Promise_void.create(cPromise)

    func = functools.partial(
        asyncio.ensure_future,
        SimpleService_do_nothing_coro(
            self,
            promise),
        loop=self.loop)
    self.loop.call_soon_threadsafe(func)

async def SimpleService_do_nothing_coro(
    object self,
    Promise_void promise
):
    try:
      result = await self.do_nothing()
    except Exception as ex:
        print(
            "Unexpected error in service handler do_nothing:",
            file=sys.stderr)
        traceback.print_exc()
        deref(promise.cPromise).setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        deref(promise.cPromise).setValue(c_unit)

cdef public void call_cy_SimpleService_concat(
    object self,
    shared_ptr[cFollyPromise[unique_ptr[string]]] cPromise,
    unique_ptr[string] first,
    unique_ptr[string] second
) with gil:
    promise = Promise_string.create(cPromise)
    arg_first = (deref(first.get())).decode()
    arg_second = (deref(second.get())).decode()

    func = functools.partial(
        asyncio.ensure_future,
        SimpleService_concat_coro(
            self,
            promise,
            arg_first,
            arg_second),
        loop=self.loop)
    self.loop.call_soon_threadsafe(func)

async def SimpleService_concat_coro(
    object self,
    Promise_string promise,
    first,
    second
):
    try:
      result = await self.concat(
          first,
          second)
    except Exception as ex:
        print(
            "Unexpected error in service handler concat:",
            file=sys.stderr)
        traceback.print_exc()
        deref(promise.cPromise).setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        deref(promise.cPromise).setValue(make_unique[string](<string> result.encode('UTF-8')))

cdef public void call_cy_SimpleService_get_value(
    object self,
    shared_ptr[cFollyPromise[int32_t]] cPromise,
    unique_ptr[cSimpleStruct] simple_struct
) with gil:
    promise = Promise_i32.create(cPromise)
    arg_simple_struct = SimpleStruct.create(move(simple_struct))

    func = functools.partial(
        asyncio.ensure_future,
        SimpleService_get_value_coro(
            self,
            promise,
            arg_simple_struct),
        loop=self.loop)
    self.loop.call_soon_threadsafe(func)

async def SimpleService_get_value_coro(
    object self,
    Promise_i32 promise,
    simple_struct
):
    try:
      result = await self.get_value(
          simple_struct)
    except Exception as ex:
        print(
            "Unexpected error in service handler get_value:",
            file=sys.stderr)
        traceback.print_exc()
        deref(promise.cPromise).setException(cTApplicationException(
            repr(ex).encode('UTF-8')
        ))
    else:
        deref(promise.cPromise).setValue(<int32_t> result)
