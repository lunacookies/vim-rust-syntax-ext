if exists("b:current_syntax")
    finish
endif

let b:current_syntax = "rust"

"
" Conditionals
"

syntax keyword rustElse else
syntax keyword rustIf if
syntax keyword rustMatch match

highlight link rustElse rustConditional
highlight link rustIf rustConditional
highlight link rustMatch rustConditional

"
" Repeat
"

syntax keyword rustFor for
syntax keyword rustLoop loop
syntax keyword rustWhile while

highlight link rustFor rustRepeat
highlight link rustLoop rustRepeat
highlight link rustWhile rustRepeat

"
" Includes
"

syntax keyword rustUse use
highlight link rustUse rustInclude

"
" Other keywords
"

syntax keyword rustAs as
syntax keyword rustAsync async
syntax keyword rustAwait await
syntax keyword rustBreak break
syntax keyword rustConst const
syntax keyword rustContinue continue
syntax keyword rustCrate crate
syntax keyword rustDyn dyn
syntax keyword rustEnum enum
syntax keyword rustExtern extern
syntax keyword rustFn fn
syntax keyword rustImpl impl
syntax keyword rustIn in
syntax keyword rustLet let
syntax keyword rustMod mod
syntax keyword rustMove move
syntax keyword rustMut mut
syntax keyword rustPub pub
syntax keyword rustRef ref
syntax keyword rustReturn return
syntax keyword rustSelfType Self
syntax keyword rustSelfValue self
syntax keyword rustStatic static
syntax keyword rustStruct struct
syntax keyword rustSuper super
syntax keyword rustTrait trait
syntax keyword rustTypeAlias type
syntax keyword rustUnsafe unsafe
syntax keyword rustWhere where

highlight link rustAs rustKeyword
highlight link rustAsync rustKeyword
highlight link rustAwait rustKeyword
highlight link rustBreak rustKeyword
highlight link rustConst rustKeyword
highlight link rustContinue rustKeyword
highlight link rustCrate rustKeyword
highlight link rustDyn rustKeyword
highlight link rustEnum rustKeyword
highlight link rustExtern rustKeyword
highlight link rustFn rustKeyword
highlight link rustImpl rustKeyword
highlight link rustIn rustKeyword
highlight link rustLet rustKeyword
highlight link rustMod rustKeyword
highlight link rustMove rustKeyword
highlight link rustMut rustKeyword
highlight link rustPub rustKeyword
highlight link rustRef rustKeyword
highlight link rustReturn rustKeyword
highlight link rustSelfType rustKeyword
highlight link rustSelfValue rustKeyword
highlight link rustStatic rustKeyword
highlight link rustStruct rustKeyword
highlight link rustSuper rustKeyword
highlight link rustTrait rustKeyword
highlight link rustTypeAlias rustKeyword
highlight link rustUnsafe rustKeyword
highlight link rustWhere rustKeyword

"
" Strings
"

syntax region rustString start='"' end='"'

"
" User-defined types
"

syntax match rustUserType '\v<[A-Z][A-Za-z0-9]*'

"
" Standard library types
"

let s:standardLibraryTypes = ["bool", "char", "f32", "f64", "i128", "i16", "i32", "i64", "i8", "isize", "str", "u128", "u16", "u32", "u64", "u8", "usize", "AccessError", "Add", "AddAssign", "AddrParseError", "Alignment", "Alloc", "AllocErr", "Ancestors", "Any", "Arc", "Args", "ArgsOs", "Arguments", "AsMut", "AsRawFd", "AsRawHandle", "AsRawSocket", "AsRef", "AsciiExt", "AssertUnwindSafe", "AtomicBool", "AtomicI16", "AtomicI32", "AtomicI64", "AtomicI8", "AtomicIsize", "AtomicPtr", "AtomicU16", "AtomicU32", "AtomicU64", "AtomicU8", "AtomicUsize", "BTreeMap", "BTreeSet", "Backtrace", "BacktraceStatus", "Barrier", "BarrierWaitResult", "Binary", "BinaryHeap", "BitAnd", "BitAndAssign", "BitOr", "BitOrAssign", "BitXor", "BitXorAssign", "Borrow", "BorrowError", "BorrowMut", "BorrowMutError", "Bound", "Box", "BufRead", "BufReader", "BufWriter", "BuildHasher", "BuildHasherDefault", "Builder", "Bytes", "CStr", "CString", "CannotReallocInPlace", "Cell", "Chain", "CharIndices", "CharPredicateSearcher", "CharSearcher", "CharSliceSearcher", "CharTryFromError", "Chars", "Child", "ChildStderr", "ChildStdin", "ChildStdout", "Chunks", "ChunksExact", "ChunksExactMut", "ChunksMut", "Clone", "Cloned", "CoerceUnsized", "Command", "CommandExt", "Component", "Components", "Concat", "Condvar", "Context", "Copied", "Copy", "Cow", "Cursor", "Cycle", "Debug", "DebugList", "DebugMap", "DebugSet", "DebugStruct", "DebugTuple", "DecodeUtf16", "DecodeUtf16Error", "Default", "DefaultHasher", "Deref", "DerefMut", "Difference", "DirBuilder", "DirBuilderExt", "DirEntry", "DirEntryExt", "Discriminant", "DispatchFromDyn", "Display", "Div", "DivAssign", "DoubleEndedIterator", "DoubleEndedSearcher", "Drain", "DrainFilter", "DrainSorted", "Drop", "Duration", "Empty", "EncodeUtf16", "EncodeWide", "Entry", "Enumerate", "Eq", "Error", "ErrorKind", "EscapeDebug", "EscapeDefault", "EscapeUnicode", "ExactSizeIterator", "Excess", "ExitCode", "ExitStatus", "ExitStatusExt", "Extend", "File", "FileExt", "FileType", "FileTypeExt", "Filter", "FilterMap", "FixedSizeArray", "FlatMap", "Flatten", "FloatToInt", "Fn", "FnMut", "FnOnce", "Formatter", "FpCategory", "From", "FromBytesWithNulError", "FromFn", "FromIterator", "FromRawFd", "FromRawHandle", "FromRawSocket", "FromStr", "FromUtf16Error", "FromUtf8Error", "Fuse", "FusedIterator", "Future", "Generator", "GeneratorState", "Global", "GlobalAlloc", "Hash", "HashMap", "HashSet", "Hasher", "Incoming", "Index", "IndexMut", "Infallible", "Initializer", "Inspect", "Instant", "IntErrorKind", "Intersection", "Into", "IntoInnerError", "IntoIter", "IntoIterSorted", "IntoIterator", "IntoRawFd", "IntoRawHandle", "IntoRawSocket", "IntoStringError", "IoSlice", "IoSliceMut", "IpAddr", "Ipv4Addr", "Ipv6Addr", "Ipv6MulticastScope", "Iter", "IterMut", "Iterator", "Join", "JoinHandle", "JoinHandleExt", "JoinPathsError", "Keys", "Layout", "LayoutErr", "LengthAtMost32", "LineWriter", "Lines", "LinesAny", "LinkedList", "LocalKey", "Location", "LowerExp", "LowerHex", "ManuallyDrop", "Map", "MatchIndices", "Matches", "MaybeUninit", "Metadata", "MetadataExt", "Mul", "MulAssign", "Mutex", "MutexGuard", "Neg", "NonNull", "NonZeroI128", "NonZeroI16", "NonZeroI32", "NonZeroI64", "NonZeroI8", "NonZeroIsize", "NonZeroU128", "NonZeroU16", "NonZeroU32", "NonZeroU64", "NonZeroU8", "NonZeroUsize", "NoneError", "Not", "NulError", "OccupiedEntry", "Octal", "Once", "OnceState", "OnceWith", "OpenOptions", "OpenOptionsExt", "Option", "Ord", "Ordering", "OsStr", "OsStrExt", "OsString", "OsStringExt", "Output", "PanicInfo", "ParseBoolError", "ParseCharError", "ParseFloatError", "ParseIntError", "PartialEq", "PartialOrd", "Path", "PathBuf", "Pattern", "PeekMut", "Peekable", "Permissions", "PermissionsExt", "PhantomData", "PhantomPinned", "Pin", "Pointer", "PoisonError", "Poll", "Prefix", "PrefixComponent", "Product", "RChunks", "RChunksExact", "RChunksExactMut", "RChunksMut", "RMatchIndices", "RMatches", "RSplit", "RSplitMut", "RSplitN", "RSplitNMut", "RSplitTerminator", "RandomState", "Range", "RangeBounds", "RangeFrom", "RangeFull", "RangeInclusive", "RangeMut", "RangeTo", "RangeToInclusive", "RawEntryBuilder", "RawEntryBuilderMut", "RawEntryMut", "RawOccupiedEntryMut", "RawVacantEntryMut", "RawWaker", "RawWakerVTable", "Rc", "Read", "ReadDir", "Receiver", "RecvError", "RecvTimeoutError", "Ref", "RefCell", "RefMut", "RefUnwindSafe", "Rem", "RemAssign", "Repeat", "RepeatWith", "Result", "Rev", "Reverse", "ReverseSearcher", "RwLock", "RwLockReadGuard", "RwLockWriteGuard", "Scan", "SearchStep", "Searcher", "Seek", "SeekFrom", "Send", "SendError", "Sender", "Shl", "ShlAssign", "Shr", "ShrAssign", "Shutdown", "Sink", "SipHasher", "Sized", "Skip", "SkipWhile", "SliceIndex", "SocketAddr", "SocketAddrV4", "SocketAddrV6", "Splice", "Split", "SplitAsciiWhitespace", "SplitMut", "SplitN", "SplitNMut", "SplitPaths", "SplitTerminator", "SplitWhitespace", "Stderr", "StderrLock", "Stdin", "StdinLock", "Stdio", "Stdout", "StdoutLock", "Step", "StepBy", "StrSearcher", "String", "StripPrefixError", "StructuralEq", "StructuralPartialEq", "Sub", "SubAssign", "Successors", "Sum", "SymmetricDifference", "Sync", "SyncSender", "System", "SystemTime", "SystemTimeError", "Take", "TakeWhile", "TcpListener", "TcpStream", "Termination", "Thread", "ThreadId", "ToLowercase", "ToOwned", "ToSocketAddrs", "ToString", "ToUppercase", "TraitObject", "TrustedLen", "Try", "TryFrom", "TryFromIntError", "TryFromSliceError", "TryInto", "TryIter", "TryLockError", "TryRecvError", "TryReserveError", "TrySendError", "TypeId", "UdpSocket", "UnicodeVersion", "Union", "UnixDatagram", "UnixListener", "UnixStream", "Unpin", "UnsafeCell", "Unsize", "UnwindSafe", "UpperExp", "UpperHex", "Utf8Error", "VaList", "VaListImpl", "VacantEntry", "Values", "ValuesMut", "VarError", "Vars", "VarsOs", "Vec", "VecDeque", "WaitTimeoutResult", "Waker", "Weak", "Windows", "Wrapping", "Write", "Zip"]

for s:standardLibraryType in s:standardLibraryTypes
    execute 'syntax keyword rustLibraryType ' . s:standardLibraryType
endfor

"
" Default linkages
"

highlight link rustConditional Conditional
highlight link rustInclude Include
highlight link rustKeyword Keyword
highlight link rustLibraryType Type
highlight link rustRepeat Repeat
highlight link rustString String
highlight link rustUserType Type
