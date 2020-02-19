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
syntax keyword rsConst const nextgroup=rsIdentDef skipwhite skipempty
syntax keyword rsContinue continue
syntax keyword rsCrate crate
syntax keyword rsDyn dyn
syntax keyword rsEnum enum nextgroup=rsTypeDef skipwhite skipempty
syntax keyword rsExtern extern
syntax keyword rsFn fn nextgroup=rsFuncDef skipwhite skipempty
syntax keyword rsImpl impl
syntax keyword rsIn in
syntax keyword rsLet let nextgroup=rsIdentDef,rsMut,rsRef,rsPattern skipwhite skipempty
syntax keyword rsMod mod
syntax keyword rsMove move
syntax keyword rsMut mut nextgroup=rsIdentDef,rsLibraryType,rsSelfType,rsSelfValue,rsUserType skipwhite skipempty
syntax keyword rsPub pub
syntax keyword rsRef ref nextgroup=rsIdentDef,rsMut skipwhite skipempty
syntax keyword rsReturn return
syntax keyword rsSelfType Self
syntax keyword rsSelfValue self
syntax keyword rsStatic static nextgroup=rsIdentDef,rsRef skipwhite skipempty
syntax keyword rsStruct struct nextgroup=rsTypeDef skipwhite skipempty
syntax keyword rsSuper super
syntax keyword rsTrait trait nextgroup=rsTypeDef skipwhite skipempty
syntax keyword rsTypeAlias type nextgroup=rsTypeDef skipwhite skipempty
syntax keyword rsUnderscore _
syntax keyword rsUnion union nextgroup=rsTypeDef skipwhite skipempty
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
" Strings
"

syntax region rsString start='b\?"' skip='\\"' end='"'

"
" Lifetimes
"

syntax match rsLifetime "'_" " Inferred
syntax match rsLifetime "'static" " Static
syntax match rsLifetime "'[a-z][a-z0-9_]*"

"
" Characters
"

syntax match rsCharacter "'.'"

"
" User-defined types
"

syntax match rsUserType '\v<[A-Z][A-Za-z0-9]*' nextgroup=rsTypeParams

"
" Standard library types
"

let s:standardLibraryTypes = ["AccessError", "AcqRel", "Acquire", "Add", "AddAssign", "AddrInUse", "AddrNotAvailable", "AddrParseError", "AdminLocal", "Alignment", "Alloc", "AllocErr", "AllocError", "AlreadyExists", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Borrowed", "Both", "Bound", "Box", "BrokenPipe", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "CapacityOverflow", "Captured", "Cell", "Center", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Complete", "Component", "Components", "Concat", "Condvar", "ConnectionAborted", "ConnectionRefused", "ConnectionReset", "Context", "Copied", "Copy", "Cow", "CurDir", "Current", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "DeviceNS", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Disabled", "Disconnected", "Discriminant", "Disk", "DispatchFromDyn", "Display", "Div", "DivAssign", "Done", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "End", "Entry", "Enumerate", "Eq", "Equal", "Err", "Error", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "Excluded", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Full", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Greater", "HANDLE", "Hash", "HashMap", "HashSet", "Hasher", "Included", "Incoming", "Index", "IndexMut", "Infallible", "Infinite", "Initializer", "Inspect", "Instant", "IntErrorKind", "InterfaceLocal", "Interrupted", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "InvalidData", "InvalidDigit", "InvalidInput", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "Left", "LengthAtMost32", "Less", "LineWriter", "Lines", "LinesAny", "LinkLocal", "LinkedList", "LocalKey", "Location", "LockResult", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "Match", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Nan", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "None", "NoneError", "Normal", "Not", "NotConnected", "NotFound", "NotPresent", "NotUnicode", "NulError", "Occupied", "OccupiedEntry", "Octal", "Ok", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OrganizationLocal", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Other", "Output", "Overflow", "Owned", "PanicInfo", "ParentDir", "ParseBoolError", "ParseCharError", "ParseError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Pending", "PermissionDenied", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poisoned", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawFd", "RawHandle", "RawOccupiedEntryMut", "RawPthread", "RawSocket", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Ready", "RealmLocal", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Reject", "Relaxed", "Release", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "Right", "RootDir", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "SOCKET", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "SeqCst", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "SiteLocal", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Some", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Start", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Subnormal", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "TimedOut", "Timeout", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryLockResult", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UNC", "UdpSocket", "Unbounded", "Underflow", "UnexpectedEof", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "Unsupported", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "V4", "V6", "VaList", "VaListImpl", "Vacant", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "Verbatim", "VerbatimDisk", "VerbatimUNC", "WaitTimeoutResult", "Waker", "Weak", "Windows", "WouldBlock", "Wrapping", "Write", "WriteZero", "Yielded", "Zero", "Zip", "blkcnt_t", "blksize_t", "bool", "c_char", "c_double", "c_float", "c_int", "c_long", "c_longlong", "c_schar", "c_short", "c_uchar", "c_uint", "c_ulong", "c_ulonglong", "c_ushort", "char", "dev_t", "f32", "f64", "gid_t", "i128", "i16", "i32", "i64", "i8", "ino_t", "isize", "mode_t", "nlink_t", "off_t", "pid_t", "pthread_t", "str", "time_t", "u128", "u16", "u32", "u64", "u8", "uid_t", "usize"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rsLibraryType ' . s:standardLibraryType . ' nextgroup=rsTypeParams'
endfor

"
" User-defined constants
"

syntax match rsUserConst '\v<[A-Z][A-Z0-9_]+>'

"
" Standard library constants
"

let s:standardLibraryConsts = ["ARCH", "ATOMIC_BOOL_INIT", "ATOMIC_I16_INIT", "ATOMIC_I32_INIT", "ATOMIC_I64_INIT", "ATOMIC_I8_INIT", "ATOMIC_ISIZE_INIT", "ATOMIC_U16_INIT", "ATOMIC_U32_INIT", "ATOMIC_U64_INIT", "ATOMIC_U8_INIT", "ATOMIC_USIZE_INIT", "DIGITS", "DLL_EXTENSION", "DLL_PREFIX", "DLL_SUFFIX", "EPSILON", "EXE_EXTENSION", "EXE_SUFFIX", "FAMILY", "FRAC_1_PI", "FRAC_1_SQRT_2", "FRAC_2_PI", "FRAC_2_SQRT_PI", "FRAC_PI_2", "FRAC_PI_3", "FRAC_PI_4", "FRAC_PI_6", "FRAC_PI_8", "INFINITY", "LN_10", "LN_2", "LOG10_2", "LOG10_E", "LOG2_10", "LOG2_E", "MAIN_SEPARATOR", "MANTISSA_DIGITS", "MAX", "MAX_10_EXP", "MAX_EXP", "MIN", "MIN_10_EXP", "MIN_EXP", "MIN_POSITIVE", "NAN", "NEG_INFINITY", "ONCE_INIT", "OS", "PI", "RADIX", "REPLACEMENT_CHARACTER", "SQRT_2", "TAU", "UNICODE_VERSION", "UNIX_EPOCH"]

for s:standardLibraryConst in s:standardLibraryConsts
    execute 'syntax keyword rsLibraryConst ' . s:standardLibraryConst
endfor

"
" User-defined macros
"

syntax match rsUserMacro '\v<[a-z][a-z0-9_]*!'

"
" Standard library macros
"

let s:standardLibraryMacros = ["asm", "assert", "assert_eq", "assert_ne", "cfg", "column", "compile_error", "concat", "concat_idents", "dbg", "debug_assert", "debug_assert_eq", "debug_assert_ne", "env", "eprint", "eprintln", "file", "format", "format_args", "format_args_nl", "global_asm", "include", "include_bytes", "include_str", "is_aarch64_feature_detected", "is_arm_feature_detected", "is_mips64_feature_detected", "is_mips_feature_detected", "is_powerpc64_feature_detected", "is_powerpc_feature_detected", "is_x86_feature_detected", "line", "log_syntax", "matches", "module_path", "option_env", "panic", "print", "println", "stringify", "thread_local", "todo", "trace_macros", "try", "unimplemented", "unreachable", "vec", "write", "writeln"]

for s:standardLibraryMacro in s:standardLibraryMacros
    execute 'syntax match rsLibraryMacro "\v<' . s:standardLibraryMacro . '!"'
endfor

"
" Functions
"

syntax match rsFunction '\v[a-z][a-z0-9_]*(\()@='

"
" Type definitions
"

syntax match rsTypeDef '\v[A-Z][A-Za-z0-9]*'
            \ contained
            \ nextgroup=rsTypeDefParams

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

"
" Identifier definitions
"

syntax match rsIdentDef '\v<[a-z][a-z0-9_]*>' contained display
syntax match rsIdentDef '\v<[A-Z][A-Z0-9_]*>' contained display

syntax region rsPattern
            \ matchgroup=rsDelimiter
            \ start='('
            \ end=')'
            \ contained
            \ contains=rsMut,rsDelimiter,rsOperator,rsLibraryType,rsUserType,rsIdentDef

"
" Field access
"

syntax match rsFieldAccess '\v(\.)@<=[a-z][a-z0-9_]*>(\()@!'

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

syntax region rsComment start='//' end='$'
syntax region rsDocComment start='///' end='$'
syntax region rsDocComment start='//!' end='$'

syntax match rsCommentNote '\v[A-Z]+(:)@='
            \ contained
            \ containedin=rsComment,rsDocComment

"
" Default linkages
"

highlight default link rsAttribute rsKeyword
highlight default link rsCharacter Character
highlight default link rsComment Comment
highlight default link rsCommentNote Todo
highlight default link rsConditional Conditional
highlight default link rsDelimiter Delimiter
highlight default link rsDocComment SpecialComment
highlight default link rsFieldAccess Identifier
highlight default link rsFloat Float
highlight default link rsFuncDef Function
highlight default link rsFunction Function
highlight default link rsIdentDef Identifier
highlight default link rsInclude Include
highlight default link rsKeyword Keyword
highlight default link rsLibraryConst Constant
highlight default link rsLibraryMacro Macro
highlight default link rsLibraryType Type
highlight default link rsLifetime Special
highlight default link rsNumber Number
highlight default link rsOperator Operator
highlight default link rsRepeat Repeat
highlight default link rsString String
highlight default link rsTypeDef Typedef
highlight default link rsUserConst Constant
highlight default link rsUserMacro Macro
highlight default link rsUserType Type
