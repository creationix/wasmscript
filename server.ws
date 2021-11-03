-- Use opaque struct pointers for C ABI
type Loop = *void
type Handle = *void

import "uv" (
  "tcp" (
    "init" -- Initialize the handle. No socket is created as of yet.
    func tcp-init (Loop Handle) -> i32
    "nodelay" -- Enable TCP_NODELAY, which disables Nagle’s algorithm.
    func tcp-nodelay (Handle i32) -> i32
    "keepalive" -- Enable / disable TCP keep-alive.
    func tcp-keepalive (Handle i32 u32) -> i32
    "simultaneous-accepts" -- Enable / disable simultaneous asynchronous
    --  accept requests that are queued by the operating system when
    -- listening for new TCP connections.
    

  )
)

type Socket = i32

interface connect-event = {
    socket: Socket
    path: [u8]
    headers: [[u8]]
}

export "onConnect"
func on-connect (socket:: *ipv4-address): i32

end