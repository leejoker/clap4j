package clap4cj

enum Kind {
    LONG
    | SHORT
    | POSITIONAL
}

enum Values {
    NONE
    | ONE
    | MANY
}

struct Longest {
    let kind: Kind
    let name: String

    public init(kind: Kind, name: String) {
        this.kind = kind
        this.name = name
    }
}

struct Names {
    var short: ?Rune = None
    var long: ?String = None

    public init() {}

    public init(short: ?Rune, long: ?String) {
        this.short = short
        this.long = long
    }

    public func longest(): Longest {
        if (long.isSome()) {
            return Longest(Kind.LONG, long.getOrThrow())
        }
        if (short.isSome()) {
            return Longest(Kind.LONG, String(short.getOrThrow()))
        }
        return Longest(Kind.POSITIONAL, "")
    }
}

struct Param<T> {
    let id: T
    let names: Names
    let taskValue: ?Values

    public init(id: T) {
        this.id = id
        this.names = Names()
        this.taskValue = None
    }
}

func param<T>(id: T): Param<T> {
    Param<T>(id)
}
