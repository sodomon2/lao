LUA			= 5.1
CFLAGS		= -Wall -Wextra `pkg-config --cflags --libs ao lua$(LUA)`
CPPFLAGS	= -I/usr/include/lua$(LUA)

PREFIX		= /usr
LIBDIR		= $(PREFIX)/lib/lua/$(LUA)

.PHONY: all clean

all: ao.so

install: ao.so
	install -m 755 ao.so $(DESTDIR)$(LIBDIR)/ao.so

uninstall:
	rm -f $(DESTDIR)$(LIBDIR)/ao.so

clean:
	rm -rf ao.so

ao.so: src/lao.c
	$(CC) -shared -fPIC -o $@ $(CPPFLAGS) $^ $(CFLAGS)
