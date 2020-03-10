syntax clear
let b:current_syntax = "rust"

syntax region rsTypeParams matchgroup=rsDelimiter start='<' end='>' keepend contains=TOP

"
" Conditionals
"

syntax keyword rsElse else
syntax keyword rsIf if
syntax keyword rsMatch match

highlight default link rsElse rsConditional
highlight default link rsIf rsConditional
highlight default link rsMatch rsConditional

"
" Repeat
"

syntax keyword rsFor for
syntax keyword rsLoop loop
syntax keyword rsWhile while

highlight default link rsFor rsRepeat
highlight default link rsLoop rsRepeat
highlight default link rsWhile rsRepeat

"
" Includes
"

syntax keyword rsUse use
highlight default link rsUse rsInclude

"
" Other keywords
"

syntax keyword rsAs as
syntax keyword rsAsync async
syntax keyword rsAwait await
syntax keyword rsBreak break
syntax keyword rsConst const nextgroup=rsIdentDef,rsUnusedIdentDef skipwhite skipempty
syntax keyword rsContinue continue
syntax keyword rsCrate crate
syntax keyword rsDyn dyn
syntax keyword rsEnum enum nextgroup=rsTypeDef,rsUnusedTypeDef skipwhite skipempty
syntax keyword rsExtern extern
syntax keyword rsFn fn nextgroup=rsFuncDef,rsUnusedFuncDef skipwhite skipempty
syntax keyword rsImpl impl nextgroup=rsTypeDefParams
syntax keyword rsIn in
syntax keyword rsLet let nextgroup=rsIdentDef,rsUnusedIdentDef,rsMut,rsRef,rsPattern skipwhite skipempty
syntax keyword rsMod mod
syntax keyword rsMove move
syntax keyword rsMut mut nextgroup=rsIdentDef,rsUnusedIdentDef,rsLibraryType,rsSelfType,rsSelfValue,rsUserType skipwhite skipempty
syntax keyword rsPub pub
syntax keyword rsRef ref nextgroup=rsIdentDef,rsUnusedIdentDef,rsMut skipwhite skipempty
syntax keyword rsReturn return
syntax keyword rsSelfType Self
syntax keyword rsSelfValue self
syntax keyword rsStatic static nextgroup=rsIdentDef,rsUnusedIdentDef,rsRef skipwhite skipempty
syntax keyword rsStruct struct nextgroup=rsTypeDef,rsUnusedTypeDef skipwhite skipempty
syntax keyword rsSuper super
syntax keyword rsTrait trait nextgroup=rsTypeDef,rsUnusedTypeDef skipwhite skipempty
syntax keyword rsTypeAlias type nextgroup=rsTypeDef,rsUnusedTypeDef skipwhite skipempty
syntax keyword rsUnderscore _
syntax keyword rsUnion union nextgroup=rsTypeDef,rsUnusedTypeDef skipwhite skipempty
syntax keyword rsUnsafe unsafe
syntax keyword rsWhere where

highlight default link rsAs rsKeyword
highlight default link rsAsync rsKeyword
highlight default link rsAwait rsKeyword
highlight default link rsBreak rsKeyword
highlight default link rsConst rsKeyword
highlight default link rsContinue rsKeyword
highlight default link rsCrate rsKeyword
highlight default link rsDyn rsKeyword
highlight default link rsEnum rsKeyword
highlight default link rsExtern rsKeyword
highlight default link rsFn rsKeyword
highlight default link rsImpl rsKeyword
highlight default link rsIn rsKeyword
highlight default link rsLet rsKeyword
highlight default link rsMod rsKeyword
highlight default link rsMove rsKeyword
highlight default link rsMut rsKeyword
highlight default link rsPub rsKeyword
highlight default link rsRef rsKeyword
highlight default link rsReturn rsKeyword
highlight default link rsSelfType rsKeyword
highlight default link rsSelfValue rsKeyword
highlight default link rsStatic rsKeyword
highlight default link rsStruct rsKeyword
highlight default link rsSuper rsKeyword
highlight default link rsTrait rsKeyword
highlight default link rsTypeAlias rsKeyword
highlight default link rsUnderscore rsKeyword
highlight default link rsUnion rsKeyword
highlight default link rsUnsafe rsKeyword
highlight default link rsWhere rsKeyword

"
" Booleans
"

syntax keyword rsTrue true
syntax keyword rsFalse false

highlight default link rsTrue rsBoolean
highlight default link rsFalse rsBoolean

"
" Strings
"

syntax region rsString
            \ matchgroup=rsQuote
            \ start='b\?"'
            \ skip='\\"'
            \ end='"'
            \ contains=@Spell

"
" Field access
"

syntax match rsFieldAccess '\v(\.)@<=[a-z][a-z0-9_]*>(\()@!'

"
" Characters
"

syntax match rsCharacter "'.'"

"
" Helpers for matching foreign and crate-local items
"

" Foreign items are always preceded by zero or more type names separated by ‘::’
" (think nested enum variants) and at least one module path. This module path is
" preceded by a word separator to prevent matching partially on type names (i.e.
" skipping the instal capital letter).
function! MatchForeign(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v(<[a-z][a-z0-9_]*::([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

" Crate-local items are also preceded by zero or more types names separated by
" ‘::’, which is then preceded by zero or more module names separated by ‘::’,
" which is finally preceded by ‘crate::’.
function! MatchCrateLocal(regex, groupName, extraParams)
    execute 'syntax match ' . a:groupName . ' "\v((crate::)([a-z][a-z0-9_]*::)*([A-Z][A-Za-z0-9]*::)*)@<=' . a:regex . '"' . a:extraParams
endfunction

"
" Types
"

syntax match rsUserType '\v<[A-Z][A-Za-z0-9]*' nextgroup=rsTypeParams
call MatchForeign('[A-Z][A-Za-z0-9]*', 'rsForeignType', ' nextgroup=rsTypeParams')
call MatchCrateLocal('[A-Z][A-Za-z0-9]*', 'rsCrateType', ' nextgroup=rsTypeParams')

" Standard library types

let s:standardLibraryTypes = ["AccessError", "AcqRel", "Acquire", "Add", "AddAssign", "AddrInUse", "AddrNotAvailable", "AddrParseError", "AdminLocal", "Alignment", "Alloc", "AllocErr", "AllocError", "AlreadyExists", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Borrowed", "Both", "Bound", "Box", "BrokenPipe", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "CapacityOverflow", "Captured", "Cell", "Center", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Complete", "Component", "Components", "Concat", "Condvar", "ConnectionAborted", "ConnectionRefused", "ConnectionReset", "Context", "Copied", "Copy", "Cow", "CurDir", "Current", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "DeviceNS", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Disabled", "Disconnected", "Discriminant", "Disk", "DispatchFromDyn", "Display", "Div", "DivAssign", "Done", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "End", "Entry", "Enumerate", "Eq", "Equal", "Err", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "Excluded", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Full", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Greater", "HANDLE", "Hash", "HashMap", "HashSet", "Hasher", "Included", "Incoming", "Index", "IndexMut", "Infallible", "Infinite", "Initializer", "Inspect", "Instant", "IntErrorKind", "InterfaceLocal", "Interrupted", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "InvalidData", "InvalidDigit", "InvalidInput", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "Left", "LengthAtMost32", "Less", "LineWriter", "Lines", "LinesAny", "LinkLocal", "LinkedList", "LocalKey", "Location", "LockResult", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "Match", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Nan", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "None", "NoneError", "Normal", "Not", "NotConnected", "NotFound", "NotPresent", "NotUnicode", "NulError", "Occupied", "OccupiedEntry", "Octal", "Ok", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OrganizationLocal", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Other", "Output", "Overflow", "Owned", "PanicInfo", "ParentDir", "ParseBoolError", "ParseCharError", "ParseError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Pending", "PermissionDenied", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poisoned", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawFd", "RawHandle", "RawOccupiedEntryMut", "RawPthread", "RawSocket", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Ready", "RealmLocal", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Reject", "Relaxed", "Release", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "Right", "RootDir", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "SOCKET", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "SeqCst", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "SiteLocal", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Some", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Start", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Subnormal", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "TimedOut", "Timeout", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryLockResult", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UNC", "UdpSocket", "Unbounded", "Underflow", "UnexpectedEof", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "Unsupported", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "V4", "V6", "VaList", "VaListImpl", "Vacant", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "Verbatim", "VerbatimDisk", "VerbatimUNC", "WaitTimeoutResult", "Waker", "Weak", "Windows", "WouldBlock", "Wrapping", "Write", "WriteZero", "Yielded", "Zero", "Zip", "blkcnt_t", "blksize_t", "bool", "c_char", "c_double", "c_float", "c_int", "c_long", "c_longlong", "c_schar", "c_short", "c_uchar", "c_uint", "c_ulong", "c_ulonglong", "c_ushort", "char", "dev_t", "f32", "f64", "gid_t", "i128", "i16", "i32", "i64", "i8", "ino_t", "isize", "mode_t", "nlink_t", "off_t", "pid_t", "pthread_t", "str", "time_t", "u128", "u16", "u32", "u64", "u8", "uid_t", "usize"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rsLibraryType ' . s:standardLibraryType . ' nextgroup=rsTypeParams'
endfor

"
" Constants
"

syntax match rsUserConst '\v<[A-Z][A-Z0-9_]+>'
call MatchForeign('[A-Z][A-Z0-9_]+>', 'rsForeignConst', '')
call MatchCrateLocal('[A-Z][A-Z0-9_]+>', 'rsCrateConst', '')

" Standard library constants

let s:standardLibraryConsts = ["ARCH", "ATOMIC_BOOL_INIT", "ATOMIC_I16_INIT", "ATOMIC_I32_INIT", "ATOMIC_I64_INIT", "ATOMIC_I8_INIT", "ATOMIC_ISIZE_INIT", "ATOMIC_U16_INIT", "ATOMIC_U32_INIT", "ATOMIC_U64_INIT", "ATOMIC_U8_INIT", "ATOMIC_USIZE_INIT", "DIGITS", "DLL_EXTENSION", "DLL_PREFIX", "DLL_SUFFIX", "EPSILON", "EXE_EXTENSION", "EXE_SUFFIX", "FAMILY", "FRAC_1_PI", "FRAC_1_SQRT_2", "FRAC_2_PI", "FRAC_2_SQRT_PI", "FRAC_PI_2", "FRAC_PI_3", "FRAC_PI_4", "FRAC_PI_6", "FRAC_PI_8", "INFINITY", "LN_10", "LN_2", "LOG10_2", "LOG10_E", "LOG2_10", "LOG2_E", "MAIN_SEPARATOR", "MANTISSA_DIGITS", "MAX", "MAX_10_EXP", "MAX_EXP", "MIN", "MIN_10_EXP", "MIN_EXP", "MIN_POSITIVE", "NAN", "NEG_INFINITY", "ONCE_INIT", "OS", "PI", "RADIX", "REPLACEMENT_CHARACTER", "SQRT_2", "TAU", "UNICODE_VERSION", "UNIX_EPOCH"]

for s:standardLibraryConst in s:standardLibraryConsts
    execute 'syntax keyword rsLibraryConst ' . s:standardLibraryConst
endfor

"
" Macros
"

syntax match rsUserMacro '\v<[a-z][a-z0-9_]*!'
call MatchForeign('[a-z][a-z0-9_]*!', 'rsForeignMacro', '')
call MatchCrateLocal('[a-z][a-z0-9_]*!', 'rsCrateMacro', '')

" Standard library macros

let s:standardLibraryMacros = ["asm", "assert", "assert_eq", "assert_ne", "cfg", "column", "compile_error", "concat", "concat_idents", "dbg", "debug_assert", "debug_assert_eq", "debug_assert_ne", "env", "eprint", "eprintln", "file", "format", "format_args", "format_args_nl", "global_asm", "include", "include_bytes", "include_str", "is_aarch64_feature_detected", "is_arm_feature_detected", "is_mips64_feature_detected", "is_mips_feature_detected", "is_powerpc64_feature_detected", "is_powerpc_feature_detected", "is_x86_feature_detected", "line", "log_syntax", "matches", "module_path", "option_env", "panic", "print", "println", "stringify", "thread_local", "todo", "trace_macros", "try", "unimplemented", "unreachable", "vec", "write", "writeln"]

for s:standardLibraryMacro in s:standardLibraryMacros
    execute 'syntax match rsLibraryMacro "\v<' . s:standardLibraryMacro . '!"'
endfor

"
" Functions
"

syntax match rsUserFunc '\v[a-z][a-z0-9_]*(\()@='

call MatchForeign('[a-z][a-z0-9_]*(\()@=', 'rsForeignFunc', '')
call MatchCrateLocal('[a-z][a-z0-9_]*(\()@=', 'rsCrateFunc', '')

syntax match rsUserMethod '\v(\.)@<=[a-z][a-z0-9_]*(\(|::)@='
highlight default link rsUserMethod rsUserFunc

" Standard library functions

let s:standardLibraryFuncs = ["abort", "add_with_overflow", "align_of", "align_of_val", "alloc", "alloc_zeroed", "args", "args_os", "arith_offset", "assume", "atomic_and", "atomic_and_acq", "atomic_and_acqrel", "atomic_and_rel", "atomic_and_relaxed", "atomic_cxchg", "atomic_cxchg_acq", "atomic_cxchg_acq_failrelaxed", "atomic_cxchg_acqrel", "atomic_cxchg_acqrel_failrelaxed", "atomic_cxchg_failacq", "atomic_cxchg_failrelaxed", "atomic_cxchg_rel", "atomic_cxchg_relaxed", "atomic_cxchgweak", "atomic_cxchgweak_acq", "atomic_cxchgweak_acq_failrelaxed", "atomic_cxchgweak_acqrel", "atomic_cxchgweak_acqrel_failrelaxed", "atomic_cxchgweak_failacq", "atomic_cxchgweak_failrelaxed", "atomic_cxchgweak_rel", "atomic_cxchgweak_relaxed", "atomic_fence", "atomic_fence_acq", "atomic_fence_acqrel", "atomic_fence_rel", "atomic_load", "atomic_load_acq", "atomic_load_relaxed", "atomic_load_unordered", "atomic_max", "atomic_max_acq", "atomic_max_acqrel", "atomic_max_rel", "atomic_max_relaxed", "atomic_min", "atomic_min_acq", "atomic_min_acqrel", "atomic_min_rel", "atomic_min_relaxed", "atomic_nand", "atomic_nand_acq", "atomic_nand_acqrel", "atomic_nand_rel", "atomic_nand_relaxed", "atomic_or", "atomic_or_acq", "atomic_or_acqrel", "atomic_or_rel", "atomic_or_relaxed", "atomic_singlethreadfence", "atomic_singlethreadfence_acq", "atomic_singlethreadfence_acqrel", "atomic_singlethreadfence_rel", "atomic_store", "atomic_store_rel", "atomic_store_relaxed", "atomic_store_unordered", "atomic_umax", "atomic_umax_acq", "atomic_umax_acqrel", "atomic_umax_rel", "atomic_umax_relaxed", "atomic_umin", "atomic_umin_acq", "atomic_umin_acqrel", "atomic_umin_rel", "atomic_umin_relaxed", "atomic_xadd", "atomic_xadd_acq", "atomic_xadd_acqrel", "atomic_xadd_rel", "atomic_xadd_relaxed", "atomic_xchg", "atomic_xchg_acq", "atomic_xchg_acqrel", "atomic_xchg_rel", "atomic_xchg_relaxed", "atomic_xor", "atomic_xor_acq", "atomic_xor_acqrel", "atomic_xor_rel", "atomic_xor_relaxed", "atomic_xsub", "atomic_xsub_acq", "atomic_xsub_acqrel", "atomic_xsub_rel", "atomic_xsub_relaxed", "bitreverse", "black_box", "breakpoint", "bswap", "caller_location", "canonicalize", "catch_unwind", "ceilf32", "ceilf64", "channel", "compiler_fence", "copy", "copy_nonoverlapping", "copysignf32", "copysignf64", "cosf32", "cosf64", "create_dir", "create_dir_all", "ctlz", "ctlz_nonzero", "ctpop", "cttz", "cttz_nonzero", "current", "current_dir", "current_exe", "dealloc", "decode_utf16", "discriminant", "discriminant_value", "drop", "drop_in_place", "empty", "eq", "escape_default", "exact_div", "exit", "exp2f32", "exp2f64", "expf32", "expf64", "fabsf32", "fabsf64", "fadd_fast", "fdiv_fast", "fence", "float_to_int_approx_unchecked", "floorf32", "floorf64", "fmaf32", "fmaf64", "fmul_fast", "forget", "forget_unsized", "format", "frem_fast", "from_boxed_utf8_unchecked", "from_digit", "from_fn", "from_mut", "from_raw_parts", "from_raw_parts_mut", "from_ref", "from_u32", "from_u32_unchecked", "from_utf8", "from_utf8_mut", "from_utf8_unchecked", "from_utf8_unchecked_mut", "fsub_fast", "handle_alloc_error", "hard_link", "hash", "home_dir", "id", "identity", "init", "is_separator", "join_paths", "likely", "log10f32", "log10f64", "log2f32", "log2f64", "logf32", "logf64", "max", "max_by", "max_by_key", "maxnumf32", "maxnumf64", "metadata", "min", "min_align_of", "min_align_of_val", "min_by", "min_by_key", "minnumf32", "minnumf64", "miri_start_panic", "move_val_init", "mul_with_overflow", "nearbyintf32", "nearbyintf64", "needs_drop", "nontemporal_store", "null", "null_mut", "offset", "once", "once_with", "panic_if_uninhabited", "panicking", "parent_id", "park", "park_timeout", "park_timeout_ms", "powf32", "powf64", "powif32", "powif64", "pref_align_of", "prefetch_read_data", "prefetch_read_instruction", "prefetch_write_data", "prefetch_write_instruction", "ptr_offset_from", "read", "read_dir", "read_link", "read_to_string", "read_unaligned", "read_volatile", "realloc", "remove_dir", "remove_dir_all", "remove_file", "remove_var", "rename", "repeat", "repeat_with", "replace", "resume_unwind", "rintf32", "rintf64", "rotate_left", "rotate_right", "roundf32", "roundf64", "rustc_peek", "saturating_add", "saturating_sub", "set_alloc_error_hook", "set_current_dir", "set_hook", "set_permissions", "set_var", "sinf32", "sinf64", "sink", "size_of", "size_of_val", "sleep", "sleep_ms", "slice_from_raw_parts", "slice_from_raw_parts_mut", "soft_link", "spawn", "spin_loop", "spin_loop_hint", "split_paths", "sqrtf32", "sqrtf64", "stderr", "stdin", "stdout", "sub_with_overflow", "successors", "swap", "swap_nonoverlapping", "symlink", "symlink_dir", "symlink_file", "symlink_metadata", "sync_channel", "take", "take_alloc_error_hook", "take_hook", "temp_dir", "transmute", "transmute_copy", "truncf32", "truncf64", "try", "type_id", "type_name", "type_name_of_val", "unaligned_volatile_load", "unaligned_volatile_store", "unchecked_add", "unchecked_div", "unchecked_mul", "unchecked_rem", "unchecked_shl", "unchecked_shr", "unchecked_sub", "uninit", "uninitialized", "unlikely", "unreachable", "unreachable_unchecked", "var", "var_os", "vars", "vars_os", "volatile_copy_memory", "volatile_copy_nonoverlapping_memory", "volatile_load", "volatile_set_memory", "volatile_store", "wrapping_add", "wrapping_mul", "wrapping_sub", "write", "write_bytes", "write_unaligned", "write_volatile", "yield_now", "zeroed"]

for s:standardLibraryFunc in s:standardLibraryFuncs
    execute 'syntax match rsLibraryFunc "\v'. s:standardLibraryFunc . '(\()@="'
endfor

"
" Lifetimes
"

syntax match rsUserLifetime "'[a-z][a-z0-9_]*"

syntax match rsInferredLifetime "'_"
syntax match rsStaticLifetime "'static"

highlight default link rsInferredLifetime rsSpecialLifetime
highlight default link rsStaticLifetime rsSpecialLifetime

"
" Type definitions
"

syntax match rsTypeDef '\v[A-Z][A-Za-z0-9]*'
            \ contained
            \ nextgroup=rsTypeDefParams

syntax match rsUnusedTypeDef '\v_[A-Za-z0-9]+'
            \ contained
            \ nextgroup=rsTypeDefParams

highlight default link rsUnusedTypeDef rsTypeDef

" Type parameters
syntax region rsTypeDefParams
            \ matchgroup=rsDelimiter
            \ start='<'
            \ end='>'
            \ keepend
            \ contains=TOP

syntax match rsTypeParamDef '\v(:\s*)@<![A-Z][A-Za-z0-9]*'
            \ contained
            \ containedin=rsTypeDefParams

highlight default link rsTypeParamDef rsTypeDef

"
" Function definitions
"

syntax match rsFuncDef '\v<[a-z][a-z0-9_]*'
            \ contained
            \ nextgroup=rsTypeDefParams

syntax match rsUnusedFuncDef '\v<_[a-z0-9_]+'
            \ contained
            \ nextgroup=rsTypeDefParams

highlight default link rsUnusedFuncDef rsFuncDef

"
" Identifier definitions
"

syntax match rsIdentDef '\v<[a-z][a-z0-9_]*>' contained display
syntax match rsIdentDef '\v<[A-Z][A-Z0-9_]*>' contained display

syntax match rsUnusedIdentDef '\v<_[a-z0-9_]+>' contained display
syntax match rsUnusedIdentDef '\v<_[A-Z0-9_]+>' contained display

highlight default link rsUnusedIdentDef rsIdentDef

syntax region rsPattern
            \ matchgroup=rsDelimiter
            \ start='('
            \ end=')'
            \ contained
            \ contains=rsMut,rsRef,rsDelimiter,rsOperator,rsLibraryType,rsUserType,rsIdentDef,rsUnusedIdentDef,rsUnderscore

"
" Lifetime definitions
"

syntax match rsLifetimeDef "'[a-z][a-z0-9_]*"
            \ contained
            \ containedin=rsTypeDefParams

"
" Numbers
"

syntax match rsNumber '\v<[0-9_]+>'
syntax match rsFloat '\v<[0-9_]+\.[0-9_]+>'

"
" Attributes
"

syntax region rsAttribute
            \ matchgroup=rsDelimiter
            \ start='#\['
            \ skip='\v\(.*\)'
            \ end='\]'

syntax region rsAttributeParenWrapped
            \ start='('
            \ end=')'
            \ containedin=rsAttribute
            \ contains=TOP
            \ keepend

"
" Macro identifiers
"

" Macros frequently interpolate identifiers with names like #foobar.
syntax match rsUserIdent '\v#[a-z][a-z0-9]*'

" macro_rules! uses $foobar for parameters
syntax match rsUserIdent '\v\$[a-z][a-z0-9]*'

"
" Delimiters
"

syntax match rsDelimiter '[(){}\[\]|\.,:;]\+'

"
" Operators
"

syntax match rsOperator '[!%&/\*+<=>?\^-]\+'

" We highlight mutable references separately as an operator because otherwise
" they would be recognised as the ‘mut’ keyword, thus whatever comes after the
" ‘mut’ is highlighted as an identifier definition.
syntax match rsOperator '&mut'

"
" Comments
"

syntax region rsComment start='//' end='$' contains=@Spell

syntax region rsBlockComment start='/\*' end='\*/' contains=@Spell

syntax region rsDocComment start='///' end='$' contains=@Spell
syntax region rsDocComment start='//!' end='$' contains=@Spell

syntax match rsCommentNote '\v[A-Z]+(:)@='
            \ contained
            \ containedin=rsComment,rsDocComment

highlight default link rsBlockComment rsComment

"
" Default linkages
"

highlight default link rsAttribute rsKeyword
highlight default link rsBoolean Boolean
highlight default link rsCharacter Character
highlight default link rsComment Comment
highlight default link rsCommentNote Todo
highlight default link rsConditional Conditional
highlight default link rsCrateConst rsUserConst
highlight default link rsCrateFunc rsUserFunc
highlight default link rsCrateMacro rsUserMacro
highlight default link rsCrateType rsUserType
highlight default link rsDelimiter Delimiter
highlight default link rsDocComment SpecialComment
highlight default link rsFieldAccess Identifier
highlight default link rsFloat Float
highlight default link rsForeignConst Constant
highlight default link rsForeignFunc Function
highlight default link rsForeignMacro Macro
highlight default link rsForeignType Type
highlight default link rsFuncDef Function
highlight default link rsIdentDef Identifier
highlight default link rsInclude Include
highlight default link rsKeyword Keyword
highlight default link rsLibraryConst Constant
highlight default link rsLibraryFunc Function
highlight default link rsLibraryMacro Macro
highlight default link rsLibraryType Type
highlight default link rsLifetimeDef Special
highlight default link rsNumber Number
highlight default link rsOperator Operator
highlight default link rsQuote StringDelimiter
highlight default link rsRepeat Repeat
highlight default link rsSpecialLifetime Special
highlight default link rsString String
highlight default link rsTypeDef Typedef
highlight default link rsUserConst Constant
highlight default link rsUserFunc Function
highlight default link rsUserIdent Identifier
highlight default link rsUserLifetime Special
highlight default link rsUserMacro Macro
highlight default link rsUserType Type

" Account for the vast majority of colourschemes not highlighting string
" delimiters explicitly.
highlight default link StringDelimiter String
