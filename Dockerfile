FROM rust:1.75.0-alpine3.19 as builder

RUN apk --update --no-cache add pkgconfig openssl libressl-dev musl-dev

WORKDIR /usr/src/myapp

COPY . .

RUN cargo update && cargo build --release

FROM alpine
WORKDIR /usr/src/myapp

# Copy the binary from the builder stage
COPY --from=builder /usr/src/myapp/target/release/nscript_standalone /usr/src/myapp/nscript
RUN chmod u+x ./nscript
COPY . .
# Set up entry point or CMD for running the binary
ENTRYPOINT ["/usr/src/myapp/nscript"]
#well bellow is up to you!
