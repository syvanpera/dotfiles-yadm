#!/usr/bin/env python2
# -*- coding: utf-8; -*-
import dbus

try:
    bus = dbus.SessionBus()
    remote_object = bus.get_object('org.guake3.RemoteControl', '/org/guake3/RemoteControl')
    remote_object.show_hide()
except dbus.DBusException:
    pass
